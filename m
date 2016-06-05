Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9XDZ-0007O8-BF
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 08:31:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9XDT-0007IM-MM
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 08:31:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9XDR-000203-R0
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 08:31:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56264)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9XDJ-0001wY-Um; Sun, 05 Jun 2016 08:31:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BF5D440928;
	Sun,  5 Jun 2016 15:31:30 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 84500B48;
	Sun,  5 Jun 2016 10:43:41 +0300 (MSK)
Received: (nullmailer pid 1184 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	Scott Feldman <sfeldma@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:23 +0300
Message-Id: <cacd44ef3cb85e7621a13c728d0a3ec0f4435744.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 46/52] rocker: Use DIV_ROUND_UP
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
X-List-Received-Date: Sun, 05 Jun 2016 12:31:47 -0000

From: Laurent Vivier <lvivier@redhat.com>

Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).

This patch is the result of coccinelle script
scripts/coccinelle/round.cocci

CC: Scott Feldman <sfeldma@gmail.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/rocker/rocker_of_dpa.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/net/rocker/rocker_of_dpa.c b/hw/net/rocker/rocker_of_dpa.c
index 0a134eb..9b1e0d2 100644
--- a/hw/net/rocker/rocker_of_dpa.c
+++ b/hw/net/rocker/rocker_of_dpa.c
@@ -103,9 +103,8 @@ typedef struct of_dpa_flow_key {
 
 /* Width of key which includes field 'f' in u64s, rounded up */
 #define FLOW_KEY_WIDTH(f) \
-    ((offsetof(OfDpaFlowKey, f) + \
-      sizeof(((OfDpaFlowKey *)0)->f) + \
-      sizeof(uint64_t) - 1) / sizeof(uint64_t))
+    DIV_ROUND_UP(offsetof(OfDpaFlowKey, f) + sizeof(((OfDpaFlowKey *)0)->f), \
+    sizeof(uint64_t))
 
 typedef struct of_dpa_flow_action {
     uint32_t goto_tbl;
-- 
2.1.4


