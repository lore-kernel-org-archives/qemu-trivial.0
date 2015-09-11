Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaNL3-0006jN-AG
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 08:21:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49069)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaNKy-0006bH-Av
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 08:21:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaNKx-0000SM-AL
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 08:21:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58692)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaNKs-0000MO-Cx; Fri, 11 Sep 2015 08:21:46 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 33B63413F3;
	Fri, 11 Sep 2015 15:21:45 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id CB757A87;
	Fri, 11 Sep 2015 14:03:54 +0300 (MSK)
Received: (nullmailer pid 22791 invoked by uid 1000);
	Fri, 11 Sep 2015 11:03:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 11 Sep 2015 14:03:43 +0300
Message-Id: <76621d1faa25405ab13cfe73890f9069b2890ed4.1441969369.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
References: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 19/26] disas/microblaze: Remove unused code
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
X-List-Received-Date: Fri, 11 Sep 2015 12:21:53 -0000

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 disas/microblaze.c | 150 -----------------------------------------------------
 1 file changed, 150 deletions(-)

diff --git a/disas/microblaze.c b/disas/microblaze.c
index 92cd4b1..5d15907 100644
--- a/disas/microblaze.c
+++ b/disas/microblaze.c
@@ -603,25 +603,6 @@ char * get_field_special (long instr, struct op_code_struct * op);
 unsigned long read_insn_microblaze (bfd_vma memaddr, 
 		      struct disassemble_info *info,
 		      struct op_code_struct **opr);
-enum microblaze_instr get_insn_microblaze (long inst,
-  		     bfd_boolean *isunsignedimm,
-  		     enum microblaze_instr_type *insn_type,
-  		     short *delay_slots);
-short get_delay_slots_microblaze (long inst);
-enum microblaze_instr microblaze_decode_insn (long insn,
-		        int *rd, 
-			int *ra, 
-			int *rb, 
-			int *imm);
-unsigned long
-microblaze_get_target_address (long inst,
-			       bfd_boolean immfound,
-			       int immval,
-			       long pcval,
-			       long r1val,
-			       long r2val,
-			       bfd_boolean *targetvalid,
-			       bfd_boolean *unconditionalbranch);
 
 static char *
 get_field (long instr, long mask, unsigned short low)
@@ -967,134 +948,3 @@ print_insn_microblaze (bfd_vma memaddr, struct disassemble_info * info)
   /* Say how many bytes we consumed? */
   return 4;
 }
-
-enum microblaze_instr
-get_insn_microblaze (long inst,
-  		     bfd_boolean *isunsignedimm,
-  		     enum microblaze_instr_type *insn_type,
-  		     short *delay_slots)
-{
-  struct op_code_struct * op;
-  *isunsignedimm = FALSE;
-
-  /* Just a linear search of the table.  */
-  for (op = opcodes; op->name != 0; op ++)
-    if (op->bit_sequence == (inst & op->opcode_mask))
-      break;
-
-  if (op->name == 0)
-    return invalid_inst;
-  else {
-    *isunsignedimm = (op->inst_type == INST_TYPE_RD_R1_UNSIGNED_IMM);
-    *insn_type = op->instr_type;
-    *delay_slots = op->delay_slots;
-    return op->instr;
-  }
-}
-
-short
-get_delay_slots_microblaze (long inst)
-{
-  bfd_boolean isunsignedimm;
-  enum microblaze_instr_type insn_type;
-  enum microblaze_instr op;
-  short delay_slots;
-
-  op = get_insn_microblaze( inst, &isunsignedimm, &insn_type, &delay_slots);
-  if (op == invalid_inst)
-    return 0;
-  else 
-    return delay_slots;
-}
-
-enum microblaze_instr
-microblaze_decode_insn (long insn,
-		        int *rd, 
-			int *ra, 
-			int *rb, 
-			int *imm)
-{
-  enum microblaze_instr op;
-  bfd_boolean t1;
-  enum microblaze_instr_type t2;
-  short t3;
-
-  op = get_insn_microblaze(insn, &t1, &t2, &t3);
-  *rd = (insn & RD_MASK) >> RD_LOW;
-  *ra = (insn & RA_MASK) >> RA_LOW;
-  *rb = (insn & RB_MASK) >> RB_LOW;
-  t3 = (insn & IMM_MASK) >> IMM_LOW;
-  *imm = (int) t3;
-  return (op);
-}
-
-unsigned long
-microblaze_get_target_address (long inst,
-			       bfd_boolean immfound,
-			       int immval,
-			       long pcval,
-			       long r1val,
-			       long r2val,
-			       bfd_boolean *targetvalid,
-			       bfd_boolean *unconditionalbranch)
-{
-  struct op_code_struct * op;
-  long targetaddr = 0;
-
-  *unconditionalbranch = FALSE;
-  /* Just a linear search of the table.  */
-  for (op = opcodes; op->name != 0; op ++)
-    if (op->bit_sequence == (inst & op->opcode_mask))
-      break;
-
-  if (op->name == 0) {
-    *targetvalid = FALSE;
-  } else if (op->instr_type == branch_inst) {
-    switch (op->inst_type) {
-    case INST_TYPE_R2:
-      *unconditionalbranch = TRUE;
-      /* fallthru */
-    case INST_TYPE_RD_R2:
-    case INST_TYPE_R1_R2:
-      targetaddr = r2val;
-      *targetvalid = TRUE;
-      if (op->inst_offset_type == INST_PC_OFFSET)
-	targetaddr += pcval;
-      break;
-    case INST_TYPE_IMM:
-      *unconditionalbranch = TRUE;
-      /* fallthru */
-    case INST_TYPE_RD_IMM:
-    case INST_TYPE_R1_IMM:
-      if (immfound) {
-	targetaddr = (immval << 16) & 0xffff0000;
-	targetaddr |= (get_int_field_imm(inst) & 0x0000ffff);
-      } else {
-	targetaddr = get_int_field_imm(inst);
-	if (targetaddr & 0x8000)
-	  targetaddr |= 0xFFFF0000;
-      }
-      if (op->inst_offset_type == INST_PC_OFFSET)
-	targetaddr += pcval;
-      *targetvalid = TRUE;
-      break;
-    default:
-      *targetvalid = FALSE;
-      break;
-    }
-  } else if (op->instr_type == return_inst) {
-      if (immfound) {
-	targetaddr = (immval << 16) & 0xffff0000;
-	targetaddr |= (get_int_field_imm(inst) & 0x0000ffff);
-      } else {
-	targetaddr = get_int_field_imm(inst);
-	if (targetaddr & 0x8000)
-	  targetaddr |= 0xFFFF0000;
-      }
-      targetaddr += r1val;
-      *targetvalid = TRUE;
-  } else {
-    *targetvalid = FALSE;
-  }
-  return targetaddr;
-}
-- 
2.1.4


