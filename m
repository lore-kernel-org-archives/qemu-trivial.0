Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1THEZS-00058Y-Kh
	for mharc-qemu-trivial@gnu.org; Thu, 27 Sep 2012 09:56:06 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44566)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1THEZK-0004jZ-Vr
	for qemu-trivial@nongnu.org; Thu, 27 Sep 2012 09:56:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1THEZH-00062c-3z
	for qemu-trivial@nongnu.org; Thu, 27 Sep 2012 09:55:58 -0400
Received: from 38.0.169.217.in-addr.arpa ([217.169.0.38]:56230
	helo=mnementh.archaic.org.uk) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1THEZ7-0005ow-Vr; Thu, 27 Sep 2012 09:55:46 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1THEZ5-0004ko-3j; Thu, 27 Sep 2012 14:55:43 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 27 Sep 2012 14:55:43 +0100
Message-Id: <1348754143-18251-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 217.169.0.38
Cc: qemu-trivial@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH] tcg/arm: Use tcg_out_mov_reg rather than
	inline equivalent code
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
X-List-Received-Date: Thu, 27 Sep 2012 13:56:04 -0000

Use the recently introduced tcg_out_mov_reg() function rather than
the equivalent inline code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is a minor follow-on cleanup patch after commit 9716ef3b1.

 tcg/arm/tcg-target.c |   15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/tcg/arm/tcg-target.c b/tcg/arm/tcg-target.c
index 2bad0a2..5e8dbdd 100644
--- a/tcg/arm/tcg-target.c
+++ b/tcg/arm/tcg-target.c
@@ -1197,20 +1197,11 @@ static inline void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, int opc)
     case 1:
     case 2:
     default:
-        if (data_reg != TCG_REG_R0) {
-            tcg_out_dat_reg(s, COND_AL, ARITH_MOV,
-                            data_reg, 0, TCG_REG_R0, SHIFT_IMM_LSL(0));
-        }
+        tcg_out_mov_reg(s, COND_AL, data_reg, TCG_REG_R0);
         break;
     case 3:
-        if (data_reg != TCG_REG_R0) {
-            tcg_out_dat_reg(s, COND_AL, ARITH_MOV,
-                            data_reg, 0, TCG_REG_R0, SHIFT_IMM_LSL(0));
-        }
-        if (data_reg2 != TCG_REG_R1) {
-            tcg_out_dat_reg(s, COND_AL, ARITH_MOV,
-                            data_reg2, 0, TCG_REG_R1, SHIFT_IMM_LSL(0));
-        }
+        tcg_out_mov_reg(s, COND_AL, data_reg, TCG_REG_R0);
+        tcg_out_mov_reg(s, COND_AL, data_reg2, TCG_REG_R1);
         break;
     }
 
-- 
1.7.9.5


