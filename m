Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xku6M-0005Ft-88
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 07:17:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54477)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xku6E-00051K-P3
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:17:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xku6A-0007L5-6B
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:17:38 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:43873)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xku60-0007E2-JU; Sun, 02 Nov 2014 07:17:24 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5A216402C5;
	Sun,  2 Nov 2014 15:17:23 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 47C34714;
	Sun,  2 Nov 2014 14:58:49 +0300 (MSK)
Received: (nullmailer pid 14986 invoked by uid 1000);
	Sun, 02 Nov 2014 11:58:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun,  2 Nov 2014 14:57:30 +0300
Message-Id: <25cec2b896a977565ca04e5c649aab8c6e48bda8.1414929285.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 18/23] os-posix: reorder parent notification
	for -daemonize
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
X-List-Received-Date: Sun, 02 Nov 2014 12:17:43 -0000

Put "success" parent reporting in os_setup_post() to after
all other initializers which may also fail, to the very end,
so more possible failure cases are reported properly to the
calling process.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Gonglei <arei.gonglei@huawei.com>
---
 os-posix.c |   19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/os-posix.c b/os-posix.c
index 52e9897..ba091f1 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -255,15 +255,6 @@ void os_setup_post(void)
     int fd = 0;
 
     if (daemonize) {
-        uint8_t status = 0;
-        ssize_t len;
-
-        do {        
-            len = write(daemon_pipe, &status, 1);
-        } while (len < 0 && errno == EINTR);
-        if (len != 1) {
-            exit(1);
-        }
         if (chdir("/")) {
             perror("not able to chdir to /");
             exit(1);
@@ -278,11 +269,21 @@ void os_setup_post(void)
     change_process_uid();
 
     if (daemonize) {
+        uint8_t status = 0;
+        ssize_t len;
+
         dup2(fd, 0);
         dup2(fd, 1);
         dup2(fd, 2);
 
         close(fd);
+
+        do {        
+            len = write(daemon_pipe, &status, 1);
+        } while (len < 0 && errno == EINTR);
+        if (len != 1) {
+            exit(1);
+        }
     }
 }
 
-- 
1.7.10.4


