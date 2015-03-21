Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YZKNb-0003Oc-6z
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2015 10:27:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YZKNY-0003N8-E8
	for qemu-trivial@nongnu.org; Sat, 21 Mar 2015 10:27:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YZKNV-00031U-8T
	for qemu-trivial@nongnu.org; Sat, 21 Mar 2015 10:27:56 -0400
Received: from p54ac8333.dip0.t-ipconnect.de ([84.172.131.51]:53811 helo=edv32)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>)
	id 1YZKNV-00031G-1W; Sat, 21 Mar 2015 10:27:53 -0400
Received: from stefan by edv32 with local (Exim 4.84)
	(envelope-from <stefan@bib.uni-mannheim.de>)
	id 1YZJi2-0007ku-Pq; Sat, 21 Mar 2015 14:45:02 +0100
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sat, 21 Mar 2015 14:44:58 +0100
Message-Id: <1426945498-29777-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 84.172.131.51
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	QEMU Developer <qemu-devel@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] target-tricore: Fix check which was always
	false
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
X-List-Received-Date: Sat, 21 Mar 2015 14:27:57 -0000

With a mask value of 0x00400000, the result will never be 1.
This fixes a Coverity warning.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 target-tricore/op_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-tricore/op_helper.c b/target-tricore/op_helper.c
index 0e7b4e8..b7d18b2 100644
--- a/target-tricore/op_helper.c
+++ b/target-tricore/op_helper.c
@@ -2593,7 +2593,7 @@ void helper_rslcx(CPUTriCoreState *env)
         /* CSU trap */
     }
     /* if (PCXI.UL == 1) then trap(CTYP); */
-    if ((env->PCXI & MASK_PCXI_UL) == 1) {
+    if ((env->PCXI & MASK_PCXI_UL) != 0) {
         /* CTYP trap */
     }
     /* EA = {PCXI.PCXS, 6'b0, PCXI.PCXO, 6'b0}; */
-- 
2.1.4


