Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xktwj-00061X-5G
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 07:07:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xktwd-0005qw-Gm
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:07:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XktwZ-0004h8-5B
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:07:43 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:43488)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XktwK-0004e6-VZ; Sun, 02 Nov 2014 07:07:25 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id F1743402BF;
	Sun,  2 Nov 2014 15:07:23 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 30158713;
	Sun,  2 Nov 2014 14:58:49 +0300 (MSK)
Received: (nullmailer pid 14980 invoked by uid 1000);
	Sun, 02 Nov 2014 11:58:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun,  2 Nov 2014 14:57:27 +0300
Message-Id: <0be5e436ff2cd6b8a1ff6782e3cfd09441ff3ec7.1414929285.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 15/23] os-posix: use global daemon_pipe
	instead of cryptic fds[1]
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
X-List-Received-Date: Sun, 02 Nov 2014 12:07:44 -0000

When asked to -daemonize, we fork a child and setup a pipe between
it and parent to pass exit status.  os-posix.c used global fds[2]
array for that, but actually only the writing side of the pipe is
needed to be global, and this name is really too generic.  Use
just one interger for the writing side of the pipe, and name it
daemon_pipe to be more understandable than cryptic fds[1].

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Gonglei <arei.gonglei@huawei.com>
---
 os-posix.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/os-posix.c b/os-posix.c
index e31a099..d687896 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -47,7 +47,7 @@
 static struct passwd *user_pwd;
 static const char *chroot_dir;
 static int daemonize;
-static int fds[2];
+static int daemon_pipe;
 
 void os_setup_early_signal_handling(void)
 {
@@ -205,6 +205,7 @@ void os_daemonize(void)
 {
     if (daemonize) {
         pid_t pid;
+        int fds[2];
 
         if (pipe(fds) == -1) {
             exit(1);
@@ -236,7 +237,8 @@ void os_daemonize(void)
             }
 
         close(fds[0]);
-        qemu_set_cloexec(fds[1]);
+        daemon_pipe = fds[1];
+        qemu_set_cloexec(daemon_pipe);
 
         setsid();
 
@@ -263,7 +265,7 @@ void os_setup_post(void)
         ssize_t len;
 
     again1:
-        len = write(fds[1], &status, 1);
+        len = write(daemon_pipe, &status, 1);
         if (len == -1 && (errno == EINTR)) {
             goto again1;
         }
@@ -296,7 +298,7 @@ void os_pidfile_error(void)
 {
     if (daemonize) {
         uint8_t status = 1;
-        if (write(fds[1], &status, 1) != 1) {
+        if (write(daemon_pipe, &status, 1) != 1) {
             perror("daemonize. Writing to pipe\n");
         }
     } else
-- 
1.7.10.4


