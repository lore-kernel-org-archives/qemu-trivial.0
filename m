Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WaqBV-0001zo-QL
	for mharc-qemu-trivial@gnu.org; Thu, 17 Apr 2014 13:33:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WaqBN-0001qt-8p
	for qemu-trivial@nongnu.org; Thu, 17 Apr 2014 13:33:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WaqBI-0006DG-Be
	for qemu-trivial@nongnu.org; Thu, 17 Apr 2014 13:33:05 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:50904)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1WaqB7-0006Bu-UZ; Thu, 17 Apr 2014 13:32:50 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id DE5DA17F6DF; Thu, 17 Apr 2014 19:32:47 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Thu, 17 Apr 2014 19:32:42 +0200
Message-Id: <1397755962-19435-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] xilinx: Fix typo in comment (Marvel ->
	Marvell)
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
X-List-Received-Date: Thu, 17 Apr 2014 17:33:10 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/net/xilinx_axienet.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index 839d97c..6dc665f 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -98,7 +98,7 @@ static unsigned int tdk_read(struct PHY *phy, unsigned int req)
             r |= 1;
             break;
         case 17:
-            /* Marvel PHY on many xilinx boards.  */
+            /* Marvell PHY on many xilinx boards.  */
             r = 0x8000; /* 1000Mb  */
             break;
         case 18:
-- 
1.7.10.4


