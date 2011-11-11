Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ROnb8-0007gh-EW
	for mharc-qemu-trivial@gnu.org; Fri, 11 Nov 2011 04:40:34 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1ROnay-00078U-HY
	for qemu-trivial@nongnu.org; Fri, 11 Nov 2011 04:40:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1ROnaw-00022s-9i
	for qemu-trivial@nongnu.org; Fri, 11 Nov 2011 04:40:24 -0500
Received: from oxygen.pond.sub.org ([78.46.104.156]:46901)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1ROnas-00020D-Ds; Fri, 11 Nov 2011 04:40:18 -0500
Received: from blackfin.pond.sub.org (p5B32B59E.dip.t-dialin.net
	[91.50.181.158])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 6E943A3DE9;
	Fri, 11 Nov 2011 10:40:10 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id AED1860069; Fri, 11 Nov 2011 10:40:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 11 Nov 2011 10:40:05 +0100
Message-Id: <1321004409-3274-2-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1321004409-3274-1-git-send-email-armbru@redhat.com>
References: <1321004409-3274-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 1/5] qemu-char: Plug memory leak on
	qemu_chr_open_pty() error path
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
X-List-Received-Date: Fri, 11 Nov 2011 09:40:26 -0000

Spotted by Coverity.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qemu-char.c |   19 ++++++++++---------
 1 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index 9fd94d1..b562bf8 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -985,7 +985,7 @@ static int qemu_chr_open_pty(QemuOpts *opts, CharDriverState **_chr)
     CharDriverState *chr;
     PtyCharDriver *s;
     struct termios tty;
-    int slave_fd, len;
+    int master_fd, slave_fd, len;
 #if defined(__OpenBSD__) || defined(__DragonFly__)
     char pty_name[PATH_MAX];
 #define q_ptsname(x) pty_name
@@ -994,10 +994,7 @@ static int qemu_chr_open_pty(QemuOpts *opts, CharDriverState **_chr)
 #define q_ptsname(x) ptsname(x)
 #endif
 
-    chr = g_malloc0(sizeof(CharDriverState));
-    s = g_malloc0(sizeof(PtyCharDriver));
-
-    if (openpty(&s->fd, &slave_fd, pty_name, NULL, NULL) < 0) {
+    if (openpty(&master_fd, &slave_fd, pty_name, NULL, NULL) < 0) {
         return -errno;
     }
 
@@ -1007,17 +1004,21 @@ static int qemu_chr_open_pty(QemuOpts *opts, CharDriverState **_chr)
     tcsetattr(slave_fd, TCSAFLUSH, &tty);
     close(slave_fd);
 
-    len = strlen(q_ptsname(s->fd)) + 5;
+    chr = g_malloc0(sizeof(CharDriverState));
+
+    len = strlen(q_ptsname(master_fd)) + 5;
     chr->filename = g_malloc(len);
-    snprintf(chr->filename, len, "pty:%s", q_ptsname(s->fd));
-    qemu_opt_set(opts, "path", q_ptsname(s->fd));
-    fprintf(stderr, "char device redirected to %s\n", q_ptsname(s->fd));
+    snprintf(chr->filename, len, "pty:%s", q_ptsname(master_fd));
+    qemu_opt_set(opts, "path", q_ptsname(master_fd));
+    fprintf(stderr, "char device redirected to %s\n", q_ptsname(master_fd));
 
+    s = g_malloc0(sizeof(PtyCharDriver));
     chr->opaque = s;
     chr->chr_write = pty_chr_write;
     chr->chr_update_read_handler = pty_chr_update_read_handler;
     chr->chr_close = pty_chr_close;
 
+    s->fd = master_fd;
     s->timer = qemu_new_timer_ms(rt_clock, pty_chr_timer, chr);
 
     *_chr = chr;
-- 
1.7.6.4


