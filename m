Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YeIEE-0006Pq-E0
	for mharc-qemu-trivial@gnu.org; Sat, 04 Apr 2015 03:10:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YeIE8-0006Fw-Oi
	for qemu-trivial@nongnu.org; Sat, 04 Apr 2015 03:10:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YeIE4-0006UC-7J
	for qemu-trivial@nongnu.org; Sat, 04 Apr 2015 03:10:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55457)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YeIDu-0006Q2-Nh; Sat, 04 Apr 2015 03:10:30 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8278F405F4;
	Sat,  4 Apr 2015 10:10:28 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 5C258924;
	Sat,  4 Apr 2015 10:10:28 +0300 (MSK)
Received: (nullmailer pid 20946 invoked by uid 1000);
	Sat, 04 Apr 2015 07:10:28 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat,  4 Apr 2015 10:10:24 +0300
Message-Id: <7b4b0b5795e934a9b7efb916af86715b68555be9.1428131273.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1428131273.git.mjt@msgid.tls.msk.ru>
References: <cover.1428131273.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 3/5] target-tricore: Fix check which was
	always false
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
X-List-Received-Date: Sat, 04 Apr 2015 07:10:49 -0000

From: Stefan Weil <sw@weilnetz.de>

With a mask value of 0x00400000, the result will never be 1.
This fixes a Coverity warning.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-tricore/op_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-tricore/op_helper.c b/target-tricore/op_helper.c
index 220ec4a..9907e07 100644
--- a/target-tricore/op_helper.c
+++ b/target-tricore/op_helper.c
@@ -2573,7 +2573,7 @@ void helper_rslcx(CPUTriCoreState *env)
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


