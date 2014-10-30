Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkEQV-0002wW-OP
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 11:47:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35728)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XkEND-0002B0-Sj
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 11:47:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XjrK6-000370-DI
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 11:07:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46055)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XjrJp-0002oP-Sj; Thu, 30 Oct 2014 11:07:22 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5BBBF46FCA;
	Thu, 30 Oct 2014 18:07:19 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 27C27705;
	Thu, 30 Oct 2014 18:07:19 +0300 (MSK)
Received: (nullmailer pid 26090 invoked by uid 1000);
	Thu, 30 Oct 2014 15:07:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-trivial@nongnu.org
Date: Thu, 30 Oct 2014 18:07:15 +0300
Message-Id: <7f7296d3c342924c26aa0ef62e9f89ad64f5fd42.1414681502.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414681502.git.mjt@msgid.tls.msk.ru>
References: <cover.1414681502.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414681502.git.mjt@msgid.tls.msk.ru>
References: <cover.1414681502.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Gonglei <arei.gonglei@huawei.com>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PATCH 2/4] os-posix: replace goto again with a
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
X-List-Received-Date: Fri, 31 Oct 2014 15:47:45 -0000

Elminiate two fullwrite implementations with goto replacing them with
a proper do..while loop.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


