Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aj8I4-0000eO-30
	for mharc-qemu-trivial@gnu.org; Thu, 24 Mar 2016 12:39:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aj8I1-0000av-8e
	for qemu-trivial@nongnu.org; Thu, 24 Mar 2016 12:39:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aj8I0-0001Tw-GN
	for qemu-trivial@nongnu.org; Thu, 24 Mar 2016 12:39:17 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:41576)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1aj8Hy-0001SB-EG; Thu, 24 Mar 2016 12:39:14 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id EE7B217F69A; Thu, 24 Mar 2016 17:39:09 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Date: Thu, 24 Mar 2016 17:39:08 +0100
Message-Id: <1458837548-10413-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a03:4000:2:362::1
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] pxa2xx: Fix warnings from cgcc
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
X-List-Received-Date: Thu, 24 Mar 2016 16:39:18 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

This patch is rather old, but it still can be applied.
It avoids duplicate definitions for some array indices
(which are allowed by gcc, but cgcc complains).

 hw/arm/pxa2xx_pic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
index 8a39b1c..a8a68e8 100644
--- a/hw/arm/pxa2xx_pic.c
+++ b/hw/arm/pxa2xx_pic.c
@@ -204,7 +204,6 @@ static void pxa2xx_pic_mem_write(void *opaque, hwaddr offset,
 
 /* Interrupt Controller Coprocessor Space Register Mapping */
 static const int pxa2xx_cp_reg_map[0x10] = {
-    [0x0 ... 0xf] = -1,
     [0x0] = ICIP,
     [0x1] = ICMR,
     [0x2] = ICLR,
@@ -216,6 +215,7 @@ static const int pxa2xx_cp_reg_map[0x10] = {
     [0x8] = ICLR2,
     [0x9] = ICFP2,
     [0xa] = ICPR2,
+    [0xb ... 0xf] = -1,
 };
 
 static uint64_t pxa2xx_pic_cp_read(CPUARMState *env, const ARMCPRegInfo *ri)
-- 
2.1.4


