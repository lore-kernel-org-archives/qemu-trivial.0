Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TX2uL-0006VA-94
	for mharc-qemu-trivial@gnu.org; Fri, 09 Nov 2012 23:43:01 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ericj@linux-ericj.mips.com>) id 1TX2uI-0006P0-HO
	for qemu-trivial@nongnu.org; Fri, 09 Nov 2012 23:42:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ericj@linux-ericj.mips.com>) id 1TX2uH-0001SW-J0
	for qemu-trivial@nongnu.org; Fri, 09 Nov 2012 23:42:58 -0500
Received: from [12.201.5.10] (port=3605 helo=linux-ericj.mips.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ericj@linux-ericj.mips.com>)
	id 1TX2uE-0001Rr-Tn; Fri, 09 Nov 2012 23:42:55 -0500
Received: from linux-ericj.mips.com (localhost.localdomain [127.0.0.1])
	by linux-ericj.mips.com (8.13.8/8.13.8) with ESMTP id qAA3equP021844;
	Fri, 9 Nov 2012 19:40:52 -0800
Received: (from ericj@localhost)
	by linux-ericj.mips.com (8.13.8/8.13.8/Submit) id qAA3ep1O021843;
	Fri, 9 Nov 2012 19:40:51 -0800
From: Eric Johnson <ericj@mips.com>
To: qemu-devel@nongnu.org
Date: Fri,  9 Nov 2012 19:40:51 -0800
Message-Id: <1352518851-21812-1-git-send-email-ericj@mips.com>
X-Mailer: git-send-email 1.7.4.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 12.201.5.10
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] target-mips: Fix seg fault for LUI when
	MIPS_DEBUG_DISAS==1.
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
X-List-Received-Date: Sat, 10 Nov 2012 04:42:59 -0000

The call to gen_logic_imm for OPC_LUI passes -1 for rs.  This
causes the MIPS_DEBUG statement to seg fault due to the deference
of regnames[rs].  This patch fixes that.

Signed-off-by: Eric Johnson <ericj@mips.com>
---
 target-mips/translate.c |   18 +++++++++++-------
 1 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/target-mips/translate.c b/target-mips/translate.c
index 8175da0..aba6327 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -2013,7 +2013,6 @@ static void gen_logic_imm(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
                           int rt, int rs, int16_t imm)
 {
     target_ulong uimm;
-    const char *opn = "imm logic";
 
     if (rt == 0) {
         /* If no destination, treat it as a NOP. */
@@ -2027,29 +2026,34 @@ static void gen_logic_imm(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
             tcg_gen_andi_tl(cpu_gpr[rt], cpu_gpr[rs], uimm);
         else
             tcg_gen_movi_tl(cpu_gpr[rt], 0);
-        opn = "andi";
+        MIPS_DEBUG("%s %s, %s, " TARGET_FMT_lx, "andi", regnames[rt],
+            regnames[rs], uimm);
         break;
     case OPC_ORI:
         if (rs != 0)
             tcg_gen_ori_tl(cpu_gpr[rt], cpu_gpr[rs], uimm);
         else
             tcg_gen_movi_tl(cpu_gpr[rt], uimm);
-        opn = "ori";
+        MIPS_DEBUG("%s %s, %s, " TARGET_FMT_lx, "ori", regnames[rt],
+            regnames[rs], uimm);
         break;
     case OPC_XORI:
         if (likely(rs != 0))
             tcg_gen_xori_tl(cpu_gpr[rt], cpu_gpr[rs], uimm);
         else
             tcg_gen_movi_tl(cpu_gpr[rt], uimm);
-        opn = "xori";
+        MIPS_DEBUG("%s %s, %s, " TARGET_FMT_lx, "xori", regnames[rt],
+            regnames[rs], uimm);
         break;
     case OPC_LUI:
         tcg_gen_movi_tl(cpu_gpr[rt], imm << 16);
-        opn = "lui";
+        MIPS_DEBUG("lui %s, " TARGET_FMT_lx, regnames[rt], uimm);
+        break;
+
+    default:
+        MIPS_DEBUG("Unknown logical immediate opcode %08x", opc);
         break;
     }
-    (void)opn; /* avoid a compiler warning */
-    MIPS_DEBUG("%s %s, %s, " TARGET_FMT_lx, opn, regnames[rt], regnames[rs], uimm);
 }
 
 /* Set on less than with immediate operand */
-- 
1.7.4.4


