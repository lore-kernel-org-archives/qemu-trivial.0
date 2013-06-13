Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnA1M-0003gs-JQ
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jun 2013 12:05:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnA1F-0003WO-8c
	for qemu-trivial@nongnu.org; Thu, 13 Jun 2013 12:05:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnA1C-0007Wj-Hb
	for qemu-trivial@nongnu.org; Thu, 13 Jun 2013 12:05:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55724)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnA18-0007UV-5n; Thu, 13 Jun 2013 12:04:54 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id DB93241573;
	Thu, 13 Jun 2013 20:04:52 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 86F4F517; Thu, 13 Jun 2013 20:04:51 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 13 Jun 2013 20:04:49 +0400
Message-Id: <1371139489-31940-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Brad Smith <brad@comstyle.com>
Subject: [Qemu-trivial] [PATCH v3] create qemu_openpty_raw() helper function
	and move it to a separate file
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Jun 2013 16:05:05 -0000

In two places qemu uses openpty() which is very system-dependent,
and in both places the pty is switched to raw mode as well.
Make a wrapper function which does both steps, and move all the
system-dependent complexity into a separate file, together
with static/local implementations of openpty() and cfmakeraw()
from qemu-char.c.

It is in a separate file, not part of oslib-posix.c, because
openpty() often resides in -lutil which is not linked to
every program qemu builds.

This change removes #including of <pty.h>, <termios.h>
and other rather specific system headers out of qemu-common.h,
which isn't a place for such specific headers really.

This version has been verified to build correctly on Linux,
OpenBSD, FreeBSD and OpenIndiana.  On the latter it lets qemu
to be built with gtk gui which were not possible there due to
missing openpty() and cfmakeraw().

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
Changes since v1:

- added a forgotten #include <termios.h> for *BSD,
  which was recently added into qemu-common.h by
  Brad Smith, and which I intended to use in
  qemu-openpty.c too, but somehow forgot.

Changes since v2:

- verified build on solaris (openindiana) and added
  #include <termios.h> there too,

- removed trailing newline

This is trivial enough to warrant a -trivial tree.
The diffstat below is large because of the comments
in the new file.

 include/qemu-common.h |   15 +-----
 qemu-char.c           |   77 ++--------------------------
 ui/gtk.c              |   12 ++---
 util/Makefile.objs    |    2 +-
 util/qemu-openpty.c   |  135 +++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 146 insertions(+), 95 deletions(-)
 create mode 100644 util/qemu-openpty.c

diff --git a/include/qemu-common.h b/include/qemu-common.h
index cb82ef3..3b1ca8e 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -42,19 +42,6 @@
 #include <signal.h>
 #include "glib-compat.h"
 
-#if defined(__GLIBC__)
-# include <pty.h>
-#elif defined CONFIG_BSD
-# include <termios.h>
-# if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__DragonFly__)
-#  include <libutil.h>
-# else
-#  include <util.h>
-# endif
-#elif defined CONFIG_SOLARIS
-# include <stropts.h>
-#endif
-
 #ifdef _WIN32
 #include "sysemu/os-win32.h"
 #endif
@@ -232,6 +219,8 @@ ssize_t qemu_recv_full(int fd, void *buf, size_t count, int flags)
 
 #ifndef _WIN32
 int qemu_pipe(int pipefd[2]);
+/* like openpty() but also makes it raw; return master fd */
+int qemu_openpty_raw(int *aslave, char *pty_name);
 #endif
 
 #ifdef _WIN32
diff --git a/qemu-char.c b/qemu-char.c
index d04b429..3759eff 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -980,63 +980,6 @@ static CharDriverState *qemu_chr_open_stdio(ChardevStdio *opts)
     return chr;
 }
 
-#ifdef __sun__
-/* Once Solaris has openpty(), this is going to be removed. */
-static int openpty(int *amaster, int *aslave, char *name,
-                   struct termios *termp, struct winsize *winp)
-{
-        const char *slave;
-        int mfd = -1, sfd = -1;
-
-        *amaster = *aslave = -1;
-
-        mfd = open("/dev/ptmx", O_RDWR | O_NOCTTY);
-        if (mfd < 0)
-                goto err;
-
-        if (grantpt(mfd) == -1 || unlockpt(mfd) == -1)
-                goto err;
-
-        if ((slave = ptsname(mfd)) == NULL)
-                goto err;
-
-        if ((sfd = open(slave, O_RDONLY | O_NOCTTY)) == -1)
-                goto err;
-
-        if (ioctl(sfd, I_PUSH, "ptem") == -1 ||
-            (termp != NULL && tcgetattr(sfd, termp) < 0))
-                goto err;
-
-        if (amaster)
-                *amaster = mfd;
-        if (aslave)
-                *aslave = sfd;
-        if (winp)
-                ioctl(sfd, TIOCSWINSZ, winp);
-
-        return 0;
-
-err:
-        if (sfd != -1)
-                close(sfd);
-        close(mfd);
-        return -1;
-}
-
-static void cfmakeraw (struct termios *termios_p)
-{
-        termios_p->c_iflag &=
-                ~(IGNBRK|BRKINT|PARMRK|ISTRIP|INLCR|IGNCR|ICRNL|IXON);
-        termios_p->c_oflag &= ~OPOST;
-        termios_p->c_lflag &= ~(ECHO|ECHONL|ICANON|ISIG|IEXTEN);
-        termios_p->c_cflag &= ~(CSIZE|PARENB);
-        termios_p->c_cflag |= CS8;
-
-        termios_p->c_cc[VMIN] = 0;
-        termios_p->c_cc[VTIME] = 0;
-}
-#endif
-
 #if defined(__linux__) || defined(__sun__) || defined(__FreeBSD__) \
     || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) \
     || defined(__GLIBC__)
@@ -1208,34 +1151,24 @@ static CharDriverState *qemu_chr_open_pty(const char *id,
 {
     CharDriverState *chr;
     PtyCharDriver *s;
-    struct termios tty;
     int master_fd, slave_fd;
-#if defined(__OpenBSD__) || defined(__DragonFly__)
     char pty_name[PATH_MAX];
-#define q_ptsname(x) pty_name
-#else
-    char *pty_name = NULL;
-#define q_ptsname(x) ptsname(x)
-#endif
 
-    if (openpty(&master_fd, &slave_fd, pty_name, NULL, NULL) < 0) {
+    master_fd = qemu_openpty_raw(&slave_fd, pty_name);
+    if (master_fd < 0) {
         return NULL;
     }
 
-    /* Set raw attributes on the pty. */
-    tcgetattr(slave_fd, &tty);
-    cfmakeraw(&tty);
-    tcsetattr(slave_fd, TCSAFLUSH, &tty);
     close(slave_fd);
 
     chr = g_malloc0(sizeof(CharDriverState));
 
-    chr->filename = g_strdup_printf("pty:%s", q_ptsname(master_fd));
-    ret->pty = g_strdup(q_ptsname(master_fd));
+    chr->filename = g_strdup_printf("pty:%s", pty_name);
+    ret->pty = g_strdup(pty_name);
     ret->has_pty = true;
 
     fprintf(stderr, "char device redirected to %s (label %s)\n",
-            q_ptsname(master_fd), id);
+            pty_name, id);
 
     s = g_malloc0(sizeof(PtyCharDriver));
     chr->opaque = s;
diff --git a/ui/gtk.c b/ui/gtk.c
index 52c3f95..3405df6 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1156,8 +1156,7 @@ static GSList *gd_vc_init(GtkDisplayState *s, VirtualConsole *vc, int index, GSL
     GIOChannel *chan;
     GtkWidget *scrolled_window;
     GtkAdjustment *vadjustment;
-    int master_fd, slave_fd, ret;
-    struct termios tty;
+    int master_fd, slave_fd;
 
     snprintf(buffer, sizeof(buffer), "vc%d", index);
     snprintf(path, sizeof(path), "<QEMU>/View/VC%d", index);
@@ -1177,13 +1176,8 @@ static GSList *gd_vc_init(GtkDisplayState *s, VirtualConsole *vc, int index, GSL
 
     vc->terminal = vte_terminal_new();
 
-    ret = openpty(&master_fd, &slave_fd, NULL, NULL, NULL);
-    g_assert(ret != -1);
-
-    /* Set raw attributes on the pty. */
-    tcgetattr(slave_fd, &tty);
-    cfmakeraw(&tty);
-    tcsetattr(slave_fd, TCSAFLUSH, &tty);
+    master_fd = qemu_openpty_raw(&slave_fd, NULL);
+    g_assert(master_fd != -1);
 
 #if VTE_CHECK_VERSION(0, 26, 0)
     pty = vte_pty_new_foreign(master_fd, NULL);
diff --git a/util/Makefile.objs b/util/Makefile.objs
index 4a1bd4e..dc72ab0 100644
--- a/util/Makefile.objs
+++ b/util/Makefile.objs
@@ -1,6 +1,6 @@
 util-obj-y = osdep.o cutils.o unicode.o qemu-timer-common.o
 util-obj-$(CONFIG_WIN32) += oslib-win32.o qemu-thread-win32.o event_notifier-win32.o
-util-obj-$(CONFIG_POSIX) += oslib-posix.o qemu-thread-posix.o event_notifier-posix.o
+util-obj-$(CONFIG_POSIX) += oslib-posix.o qemu-thread-posix.o event_notifier-posix.o qemu-openpty.o
 util-obj-y += envlist.o path.o host-utils.o cache-utils.o module.o
 util-obj-y += bitmap.o bitops.o hbitmap.o
 util-obj-y += fifo8.o
diff --git a/util/qemu-openpty.c b/util/qemu-openpty.c
new file mode 100644
index 0000000..4febfe9
--- /dev/null
+++ b/util/qemu-openpty.c
@@ -0,0 +1,135 @@
+/*
+ * qemu-openpty.c
+ *
+ * Copyright (c) 2003-2008 Fabrice Bellard
+ * Copyright (c) 2010 Red Hat, Inc.
+ *
+ * Wrapper function qemu_openpty() implementation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+/*
+ * This is not part of oslib-posix.c because this function
+ * uses openpty() which often in -lutil, and if we add this
+ * dependency to oslib-posix.o, every app will have to be
+ * linked with -lutil.
+ */
+
+#include "config-host.h"
+#include "qemu-common.h"
+
+#if defined(__GLIBC__)
+# include <pty.h>
+#elif defined CONFIG_BSD
+# include <termios.h>
+# if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__DragonFly__)
+#  include <libutil.h>
+# else
+#  include <util.h>
+# endif
+#elif defined CONFIG_SOLARIS
+# include <termios.h>
+# include <stropts.h>
+#endif
+
+#ifdef __sun__
+/* Once Solaris has openpty(), this is going to be removed. */
+static int openpty(int *amaster, int *aslave, char *name,
+                   struct termios *termp, struct winsize *winp)
+{
+        const char *slave;
+        int mfd = -1, sfd = -1;
+
+        *amaster = *aslave = -1;
+
+        mfd = open("/dev/ptmx", O_RDWR | O_NOCTTY);
+        if (mfd < 0)
+                goto err;
+
+        if (grantpt(mfd) == -1 || unlockpt(mfd) == -1)
+                goto err;
+
+        if ((slave = ptsname(mfd)) == NULL)
+                goto err;
+
+        if ((sfd = open(slave, O_RDONLY | O_NOCTTY)) == -1)
+                goto err;
+
+        if (ioctl(sfd, I_PUSH, "ptem") == -1 ||
+            (termp != NULL && tcgetattr(sfd, termp) < 0))
+                goto err;
+
+        if (amaster)
+                *amaster = mfd;
+        if (aslave)
+                *aslave = sfd;
+        if (winp)
+                ioctl(sfd, TIOCSWINSZ, winp);
+
+        return 0;
+
+err:
+        if (sfd != -1)
+                close(sfd);
+        close(mfd);
+        return -1;
+}
+
+static void cfmakeraw (struct termios *termios_p)
+{
+        termios_p->c_iflag &=
+                ~(IGNBRK|BRKINT|PARMRK|ISTRIP|INLCR|IGNCR|ICRNL|IXON);
+        termios_p->c_oflag &= ~OPOST;
+        termios_p->c_lflag &= ~(ECHO|ECHONL|ICANON|ISIG|IEXTEN);
+        termios_p->c_cflag &= ~(CSIZE|PARENB);
+        termios_p->c_cflag |= CS8;
+
+        termios_p->c_cc[VMIN] = 0;
+        termios_p->c_cc[VTIME] = 0;
+}
+#endif
+
+int qemu_openpty_raw(int *aslave, char *pty_name)
+{
+    int amaster;
+    struct termios tty;
+#if defined(__OpenBSD__) || defined(__DragonFly__)
+    char pty_buf[PATH_MAX];
+#define q_ptsname(x) pty_buf
+#else
+    char *pty_buf = NULL;
+#define q_ptsname(x) ptsname(x)
+#endif
+
+    if (openpty(&amaster, aslave, pty_buf, NULL, NULL) < 0) {
+        return -1;
+    }
+
+    /* Set raw attributes on the pty. */
+    tcgetattr(*aslave, &tty);
+    cfmakeraw(&tty);
+    tcsetattr(*aslave, TCSAFLUSH, &tty);
+
+    if (pty_name) {
+        strcpy(pty_name, q_ptsname(amaster));
+    }
+
+    return amaster;
+}
-- 
1.7.10.4


