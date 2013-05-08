Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ua56v-0001eV-F4
	for mharc-qemu-trivial@gnu.org; Wed, 08 May 2013 10:12:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <petar.jovanovic@rt-rk.com>) id 1Ua56m-0001YH-0N
	for qemu-trivial@nongnu.org; Wed, 08 May 2013 10:12:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <petar.jovanovic@rt-rk.com>) id 1Ua56g-00081f-9x
	for qemu-trivial@nongnu.org; Wed, 08 May 2013 10:12:39 -0400
Received: from mail.rt-rk.ftn.uns.ac.rs ([147.91.177.140]:34158
	helo=mail.rt-rk.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <petar.jovanovic@rt-rk.com>) id 1Ua56g-0007zW-1B
	for qemu-trivial@nongnu.org; Wed, 08 May 2013 10:12:34 -0400
Received: from mail.rt-rk.com (mail.localdomain [127.0.0.1])
	by mail.rt-rk.com (Postfix) with SMTP id CD33B25BD4E
	for <qemu-trivial@nongnu.org>; Wed,  8 May 2013 16:12:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
From: Petar Jovanovic <petar.jovanovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed,  8 May 2013 16:09:04 +0200
Message-Id: <1368022144-60111-1-git-send-email-petar.jovanovic@rt-rk.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 147.91.177.140
Cc: qemu-trivial@nongnu.org, petar.jovanovic@imgtec.com
Subject: [Qemu-trivial] [PATCH] target-mips: add missing check_dspr2 for
	multiply instructions
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
X-List-Received-Date: Wed, 08 May 2013 14:12:48 -0000

From: Petar Jovanovic <petar.jovanovic@imgtec.com>

The emulator needs to check in hflags if DSP unit has been turned off before
it generates code for MUL_PH, MUL_S_PH, MULQ_S_W, and MULQ_RS_W.

Signed-off-by: Petar Jovanovic <petar.jovanovic@imgtec.com>
---
 target-mips/translate.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/target-mips/translate.c b/target-mips/translate.c
index b7f8203..0a53203 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -13400,6 +13400,7 @@ static void gen_mipsdsp_multiply(DisasContext *ctx, uint32_t op1, uint32_t op2,
     /* OPC_MULT_G_2E, OPC_ADDUH_QB_DSP, OPC_MUL_PH_DSP have
      * the same mask and op1. */
     case OPC_MULT_G_2E:
+        check_dspr2(ctx);
         switch (op2) {
         case  OPC_MUL_PH:
             gen_helper_mul_ph(cpu_gpr[ret], v1_t, v2_t, cpu_env);
-- 
1.7.9.5


