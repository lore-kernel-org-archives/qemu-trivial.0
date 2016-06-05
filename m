Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9W7w-0001jb-5Z
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 07:21:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9W7o-0001VA-0r
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 07:21:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9W7j-0003m7-7x
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 07:21:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49013)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9W7a-0003jj-UK; Sun, 05 Jun 2016 07:21:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B71CA40922;
	Sun,  5 Jun 2016 14:21:29 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 22E4AB21;
	Sun,  5 Jun 2016 10:43:39 +0300 (MSK)
Received: (nullmailer pid 1166 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:14 +0300
Message-Id: <ec4e85c0d97e45ce5215435ec1ff5008e8b14d95.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 37/52] coccinelle: use macro DIV_ROUND_UP
 instead of (((n) + (d) - 1) /(d))
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Jun 2016 11:21:52 -0000

From: Laurent Vivier <lvivier@redhat.com>

sample from http://coccinellery.org/

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 scripts/coccinelle/round.cocci | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 scripts/coccinelle/round.cocci

diff --git a/scripts/coccinelle/round.cocci b/scripts/coccinelle/round.cocci
new file mode 100644
index 0000000..ed06773
--- /dev/null
+++ b/scripts/coccinelle/round.cocci
@@ -0,0 +1,19 @@
+// Use macro DIV_ROUND_UP instead of (((n) + (d) - 1) /(d))
+@@
+expression e1;
+expression e2;
+@@
+(
+- ((e1) + e2 - 1) / (e2)
++ DIV_ROUND_UP(e1,e2)
+|
+- ((e1) + (e2 - 1)) / (e2)
++ DIV_ROUND_UP(e1,e2)
+)
+
+@@
+expression e1;
+expression e2;
+@@
+-(DIV_ROUND_UP(e1,e2))
++DIV_ROUND_UP(e1,e2)
-- 
2.1.4


