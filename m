Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YNTQW-0007v8-EL
	for mharc-qemu-trivial@gnu.org; Mon, 16 Feb 2015 16:42:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YNTQQ-0007kd-MX
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 16:41:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YNTQE-0007RT-7X
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 16:41:54 -0500
Received: from e06smtp11.uk.ibm.com ([195.75.94.107]:36377)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YNTQD-0007Qb-Ve
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 16:41:42 -0500
Received: from /spool/local
	by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Mon, 16 Feb 2015 21:41:40 -0000
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
	by e06smtp11.uk.ibm.com (192.168.101.141) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 16 Feb 2015 21:41:37 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com
	(d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id C64F12190046; 
	Mon, 16 Feb 2015 21:41:31 +0000 (GMT)
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t1GLfb9s49283300; Mon, 16 Feb 2015 21:41:37 GMT
Received: from d06av04.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t1GLfaTw015935; Mon, 16 Feb 2015 14:41:36 -0700
Received: from oc7435384737.ibm.com (sig-9-81-72-150.evts.uk.ibm.com
	[9.81.72.150])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t1GLfWRY015849; Mon, 16 Feb 2015 14:41:35 -0700
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Mon, 16 Feb 2015 22:41:30 +0100
Message-Id: <1424122891-9390-4-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1424122891-9390-1-git-send-email-thuth@linux.vnet.ibm.com>
References: <1424122891-9390-1-git-send-email-thuth@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15021621-0041-0000-0000-00000366A1DB
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.107
Cc: Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH 3/4] util: Remove unused functions
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
X-List-Received-Date: Mon, 16 Feb 2015 21:41:58 -0000

Delete the unused functions qemu_opt_get_number_del(),
qemu_signalfd_available(), qemu_send_full() and qemu_recv_full().

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
---
 include/qemu-common.h   |    4 ---
 include/qemu/compatfd.h |    1 -
 include/qemu/option.h   |    2 -
 util/compatfd.c         |   19 -------------
 util/osdep.c            |   66 -----------------------------------------------
 util/qemu-option.c      |    6 ----
 6 files changed, 0 insertions(+), 98 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 644b46d..0aac082 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -217,10 +217,6 @@ void *qemu_oom_check(void *ptr);
 
 ssize_t qemu_write_full(int fd, const void *buf, size_t count)
     QEMU_WARN_UNUSED_RESULT;
-ssize_t qemu_send_full(int fd, const void *buf, size_t count, int flags)
-    QEMU_WARN_UNUSED_RESULT;
-ssize_t qemu_recv_full(int fd, void *buf, size_t count, int flags)
-    QEMU_WARN_UNUSED_RESULT;
 
 #ifndef _WIN32
 int qemu_pipe(int pipefd[2]);
diff --git a/include/qemu/compatfd.h b/include/qemu/compatfd.h
index 6b04877..fc37915 100644
--- a/include/qemu/compatfd.h
+++ b/include/qemu/compatfd.h
@@ -39,6 +39,5 @@ struct qemu_signalfd_siginfo {
 };
 
 int qemu_signalfd(const sigset_t *mask);
-bool qemu_signalfd_available(void);
 
 #endif
diff --git a/include/qemu/option.h b/include/qemu/option.h
index 58c0157..9fdec02 100644
--- a/include/qemu/option.h
+++ b/include/qemu/option.h
@@ -89,8 +89,6 @@ bool qemu_opt_get_bool(QemuOpts *opts, const char *name, bool defval);
 uint64_t qemu_opt_get_number(QemuOpts *opts, const char *name, uint64_t defval);
 uint64_t qemu_opt_get_size(QemuOpts *opts, const char *name, uint64_t defval);
 bool qemu_opt_get_bool_del(QemuOpts *opts, const char *name, bool defval);
-uint64_t qemu_opt_get_number_del(QemuOpts *opts, const char *name,
-                                 uint64_t defval);
 uint64_t qemu_opt_get_size_del(QemuOpts *opts, const char *name,
                                uint64_t defval);
 int qemu_opt_unset(QemuOpts *opts, const char *name);
diff --git a/util/compatfd.c b/util/compatfd.c
index 341ada6..e857150 100644
--- a/util/compatfd.c
+++ b/util/compatfd.c
@@ -108,22 +108,3 @@ int qemu_signalfd(const sigset_t *mask)
 
     return qemu_signalfd_compat(mask);
 }
-
-bool qemu_signalfd_available(void)
-{
-#ifdef CONFIG_SIGNALFD
-    sigset_t mask;
-    int fd;
-    bool ok;
-    sigemptyset(&mask);
-    errno = 0;
-    fd = syscall(SYS_signalfd, -1, &mask, _NSIG / 8);
-    ok = (errno != ENOSYS);
-    if (fd >= 0) {
-        close(fd);
-    }
-    return ok;
-#else
-    return false;
-#endif
-}
diff --git a/util/osdep.c b/util/osdep.c
index b2bd154..f938b69 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -310,72 +310,6 @@ int qemu_accept(int s, struct sockaddr *addr, socklen_t *addrlen)
     return ret;
 }
 
-/*
- * A variant of send(2) which handles partial write.
- *
- * Return the number of bytes transferred, which is only
- * smaller than `count' if there is an error.
- *
- * This function won't work with non-blocking fd's.
- * Any of the possibilities with non-bloking fd's is bad:
- *   - return a short write (then name is wrong)
- *   - busy wait adding (errno == EAGAIN) to the loop
- */
-ssize_t qemu_send_full(int fd, const void *buf, size_t count, int flags)
-{
-    ssize_t ret = 0;
-    ssize_t total = 0;
-
-    while (count) {
-        ret = send(fd, buf, count, flags);
-        if (ret < 0) {
-            if (errno == EINTR) {
-                continue;
-            }
-            break;
-        }
-
-        count -= ret;
-        buf += ret;
-        total += ret;
-    }
-
-    return total;
-}
-
-/*
- * A variant of recv(2) which handles partial write.
- *
- * Return the number of bytes transferred, which is only
- * smaller than `count' if there is an error.
- *
- * This function won't work with non-blocking fd's.
- * Any of the possibilities with non-bloking fd's is bad:
- *   - return a short write (then name is wrong)
- *   - busy wait adding (errno == EAGAIN) to the loop
- */
-ssize_t qemu_recv_full(int fd, void *buf, size_t count, int flags)
-{
-    ssize_t ret = 0;
-    ssize_t total = 0;
-
-    while (count) {
-        ret = qemu_recv(fd, buf, count, flags);
-        if (ret <= 0) {
-            if (ret < 0 && errno == EINTR) {
-                continue;
-            }
-            break;
-        }
-
-        count -= ret;
-        buf += ret;
-        total += ret;
-    }
-
-    return total;
-}
-
 void qemu_set_version(const char *version)
 {
     qemu_version = version;
diff --git a/util/qemu-option.c b/util/qemu-option.c
index d3ab65d..0e408eb 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -433,12 +433,6 @@ uint64_t qemu_opt_get_number(QemuOpts *opts, const char *name, uint64_t defval)
     return qemu_opt_get_number_helper(opts, name, defval, false);
 }
 
-uint64_t qemu_opt_get_number_del(QemuOpts *opts, const char *name,
-                                 uint64_t defval)
-{
-    return qemu_opt_get_number_helper(opts, name, defval, true);
-}
-
 static uint64_t qemu_opt_get_size_helper(QemuOpts *opts, const char *name,
                                          uint64_t defval, bool del)
 {
-- 
1.7.1


