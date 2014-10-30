Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkEOL-0007U8-V6
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 11:45:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XkENE-0005NI-Cq
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 11:45:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XjrK2-00032i-1X
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 11:07:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49303)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XjrJp-0002oO-Sg; Thu, 30 Oct 2014 11:07:22 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7ADB946FCB;
	Thu, 30 Oct 2014 18:07:19 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 60CA9702;
	Thu, 30 Oct 2014 18:07:19 +0300 (MSK)
Received: (nullmailer pid 26095 invoked by uid 1000);
	Thu, 30 Oct 2014 15:07:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-trivial@nongnu.org
Date: Thu, 30 Oct 2014 18:07:17 +0300
Message-Id: <7bdebf1bc921df74cb0edc42d2ea77cda220074c.1414681502.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414681502.git.mjt@msgid.tls.msk.ru>
References: <cover.1414681502.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414681502.git.mjt@msgid.tls.msk.ru>
References: <cover.1414681502.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Gonglei <arei.gonglei@huawei.com>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PATCH 4/4] os-posix: reorder parent notification
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
X-List-Received-Date: Fri, 31 Oct 2014 15:45:31 -0000

Put "success" parent reporting in os_setup_post() to after
all other initializers which may also fail, to the very end,
so more possible failure cases are reported properly to the
calling process.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 os-posix.c |   19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/os-posix.c b/os-posix.c
index a3b96d9..9f4a9b3 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -253,15 +253,6 @@ void os_setup_post(void)
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
@@ -276,11 +267,21 @@ void os_setup_post(void)
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


