Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXZZd-0004l8-PI
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 13:44:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZZX-0004Yj-2T
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:44:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZZS-00061t-MW
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:44:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42604)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XXZZH-0005xu-TL; Fri, 26 Sep 2014 13:44:32 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 22BEB46F6E;
	Fri, 26 Sep 2014 21:44:20 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 4E16570F;
	Fri, 26 Sep 2014 21:36:19 +0400 (MSK)
Received: (nullmailer pid 29125 invoked by uid 1000);
	Fri, 26 Sep 2014 17:36:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 26 Sep 2014 21:36:14 +0400
Message-Id: <1411752976-29051-11-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1411752976-29051-1-git-send-email-mjt@tls.msk.ru>
References: <1411752976-29051-1-git-send-email-mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Gonglei <arei.gonglei@huawei.com>, Eric Blake <eblake@redhat.com>
Subject: [Qemu-trivial] [PULL 10/12] os-posix: change tab to space avoid
	violating coding style
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
X-List-Received-Date: Fri, 26 Sep 2014 17:44:51 -0000

From: Gonglei <arei.gonglei@huawei.com>

Cc: Eric Blake <eblake@redhat.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 os-posix.c |   79 ++++++++++++++++++++++++++++++++----------------------------
 1 file changed, 42 insertions(+), 37 deletions(-)

diff --git a/os-posix.c b/os-posix.c
index cb2a7f7..f0564ef 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -204,45 +204,49 @@ static void change_root(void)
 void os_daemonize(void)
 {
     if (daemonize) {
-	pid_t pid;
+        pid_t pid;
 
-	if (pipe(fds) == -1)
-	    exit(1);
+        if (pipe(fds) == -1) {
+            exit(1);
+        }
 
-	pid = fork();
-	if (pid > 0) {
-	    uint8_t status;
-	    ssize_t len;
+        pid = fork();
+        if (pid > 0) {
+            uint8_t status;
+            ssize_t len;
 
-	    close(fds[1]);
+            close(fds[1]);
 
-	again:
+        again:
             len = read(fds[0], &status, 1);
-            if (len == -1 && (errno == EINTR))
+            if (len == -1 && (errno == EINTR)) {
                 goto again;
-
-            if (len != 1)
+            }
+            if (len != 1) {
                 exit(1);
+            }
             else if (status == 1) {
                 fprintf(stderr, "Could not acquire pidfile: %s\n", strerror(errno));
                 exit(1);
-            } else
+            } else {
                 exit(0);
-	} else if (pid < 0)
-            exit(1);
-
-	close(fds[0]);
-	qemu_set_cloexec(fds[1]);
+            }
+            } else if (pid < 0) {
+                exit(1);
+            }
 
-	setsid();
+        close(fds[0]);
+        qemu_set_cloexec(fds[1]);
 
-	pid = fork();
-	if (pid > 0)
-	    exit(0);
-	else if (pid < 0)
-	    exit(1);
+        setsid();
 
-	umask(027);
+        pid = fork();
+        if (pid > 0) {
+            exit(0);
+        } else if (pid < 0) {
+            exit(1);
+        }
+        umask(027);
 
         signal(SIGTSTP, SIG_IGN);
         signal(SIGTTOU, SIG_IGN);
@@ -255,24 +259,25 @@ void os_setup_post(void)
     int fd = 0;
 
     if (daemonize) {
-	uint8_t status = 0;
-	ssize_t len;
+        uint8_t status = 0;
+        ssize_t len;
 
     again1:
-	len = write(fds[1], &status, 1);
-	if (len == -1 && (errno == EINTR))
-	    goto again1;
-
-	if (len != 1)
-	    exit(1);
-
+        len = write(fds[1], &status, 1);
+        if (len == -1 && (errno == EINTR)) {
+            goto again1;
+        }
+        if (len != 1) {
+            exit(1);
+        }
         if (chdir("/")) {
             perror("not able to chdir to /");
             exit(1);
         }
-	TFR(fd = qemu_open("/dev/null", O_RDWR));
-	if (fd == -1)
-	    exit(1);
+        TFR(fd = qemu_open("/dev/null", O_RDWR));
+        if (fd == -1) {
+            exit(1);
+        }
     }
 
     change_root();
-- 
1.7.10.4


