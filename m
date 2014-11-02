Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkuPn-0006Eo-EB
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 07:37:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XkuPg-00062r-O9
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:37:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XkuPb-0005Oa-QT
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:37:44 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:60358)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XkuPO-0005Me-5N; Sun, 02 Nov 2014 07:37:26 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5FDA54028A;
	Sun,  2 Nov 2014 15:37:23 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id C0484705;
	Sun,  2 Nov 2014 14:58:48 +0300 (MSK)
Received: (nullmailer pid 14982 invoked by uid 1000);
	Sun, 02 Nov 2014 11:58:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun,  2 Nov 2014 14:57:28 +0300
Message-Id: <ccea25f1c7cd3f0b12d878a5294620f5478729f8.1414929285.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 16/23] os-posix: replace goto again with a
	proper loop
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
X-List-Received-Date: Sun, 02 Nov 2014 12:37:49 -0000

Eliminiate two fullwrite implementations with goto replacing them with
a proper do..while loop.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Gonglei <arei.gonglei@huawei.com>
---
 os-posix.c |   16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/os-posix.c b/os-posix.c
index d687896..eada8d4 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -218,11 +218,9 @@ void os_daemonize(void)
 
             close(fds[1]);
 
-        again:
-            len = read(fds[0], &status, 1);
-            if (len == -1 && (errno == EINTR)) {
-                goto again;
-            }
+            do {
+                len = read(fds[0], &status, 1);
+            } while (len < 0 && errno == EINTR);
             if (len != 1) {
                 exit(1);
             }
@@ -264,11 +262,9 @@ void os_setup_post(void)
         uint8_t status = 0;
         ssize_t len;
 
-    again1:
-        len = write(daemon_pipe, &status, 1);
-        if (len == -1 && (errno == EINTR)) {
-            goto again1;
-        }
+        do {        
+            len = write(daemon_pipe, &status, 1);
+        } while (len < 0 && errno == EINTR);
         if (len != 1) {
             exit(1);
         }
-- 
1.7.10.4


