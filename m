Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wopmo-00058p-TI
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 03:57:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wopmi-0004wo-Ix
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:57:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wopme-0001bK-3A
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:57:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41053)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WopmQ-0001WC-Pr; Mon, 26 May 2014 03:57:11 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B0A1D42FB0;
	Mon, 26 May 2014 11:57:09 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 29B13651;
	Mon, 26 May 2014 11:20:14 +0400 (MSK)
Received: (nullmailer pid 22991 invoked by uid 1000);
	Mon, 26 May 2014 07:20:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 11:19:51 +0400
Message-Id: <1401088811-22923-4-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Hani Benhabiles <hani@linux.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Hani Benhabiles <kroosec@gmail.com>
Subject: [Qemu-trivial] [PULL 03/23] nbd: Close socket on negotiation
	failure.
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
X-List-Received-Date: Mon, 26 May 2014 07:57:33 -0000

From: Hani Benhabiles <kroosec@gmail.com>

Otherwise, the nbd client may hang waiting for the server response.

Signed-off-by: Hani Benhabiles <hani@linux.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 blockdev-nbd.c |    4 ++--
 qemu-nbd.c     |    4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index 922cf56..b60b66d 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -27,8 +27,8 @@ static void nbd_accept(void *opaque)
     socklen_t addr_len = sizeof(addr);
 
     int fd = accept(server_fd, (struct sockaddr *)&addr, &addr_len);
-    if (fd >= 0) {
-        nbd_client_new(NULL, fd, nbd_client_put);
+    if (fd >= 0 && !nbd_client_new(NULL, fd, nbd_client_put)) {
+        close(fd);
     }
 }
 
diff --git a/qemu-nbd.c b/qemu-nbd.c
index eed79fa..f70e4b0 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -369,8 +369,10 @@ static void nbd_accept(void *opaque)
         return;
     }
 
-    if (fd >= 0 && nbd_client_new(exp, fd, nbd_client_closed)) {
+    if (nbd_client_new(exp, fd, nbd_client_closed)) {
         nb_fds++;
+    } else {
+        close(fd);
     }
 }
 
-- 
1.7.10.4


