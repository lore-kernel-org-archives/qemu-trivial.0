Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkEO7-00077q-Rv
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 11:45:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XkENF-0005Qi-5R
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 11:45:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XjrJy-00031W-QJ
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 11:07:35 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52545)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XjrJp-0002oN-Sd; Thu, 30 Oct 2014 11:07:22 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2785D46FC9;
	Thu, 30 Oct 2014 18:07:19 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 08417703;
	Thu, 30 Oct 2014 18:07:19 +0300 (MSK)
Received: (nullmailer pid 26088 invoked by uid 1000);
	Thu, 30 Oct 2014 15:07:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-trivial@nongnu.org
Date: Thu, 30 Oct 2014 18:07:14 +0300
Message-Id: <6b6f5fbff3574bffafe4204d2153258fc4440120.1414681502.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414681502.git.mjt@msgid.tls.msk.ru>
References: <cover.1414681502.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414681502.git.mjt@msgid.tls.msk.ru>
References: <cover.1414681502.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Gonglei <arei.gonglei@huawei.com>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PATCH 1/4] os-posix: use global daemon_pipe instead
	of cryptic fds[1]
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
X-List-Received-Date: Fri, 31 Oct 2014 15:45:18 -0000

When asked to -daemonize, we fork a child and setup a pipe between
it and parent to pass exit status.  os-posix.c used global fds[2]
array for that, but actually only the writing side of the pipe is
needed to be global, and this name is really too generic.  Use
just one interger for the writing side of the pipe, and name it
daemon_pipe to be more understandable than cryptic fds[1].

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


