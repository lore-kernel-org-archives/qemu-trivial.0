Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZW8Pc-0001di-Bo
	for mharc-qemu-trivial@gnu.org; Sun, 30 Aug 2015 15:37:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ZW8PZ-0001bf-Kf
	for qemu-trivial@nongnu.org; Sun, 30 Aug 2015 15:37:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ZW8PS-000115-31
	for qemu-trivial@nongnu.org; Sun, 30 Aug 2015 15:37:02 -0400
Received: from mail-la0-x236.google.com ([2a00:1450:4010:c03::236]:34142)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1ZW8PR-00010n-L0; Sun, 30 Aug 2015 15:36:58 -0400
Received: by laba3 with SMTP id a3so59291184lab.1;
	Sun, 30 Aug 2015 12:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YPrwZigRj7KmacmXky6QEPZTuJeHv9KDJY4icWiUrkY=;
	b=i8LgllSExF7BCVYxRqTeNUzPeSIRNla8DGR2/errASOFghk4Qac0pKfNwN4LXRNFPM
	VJlcDFF57S2qbUtXVMHJjvF8f0hNvGcC6xeovFCS9q5ZkZUCPYNSQigRq8430m7gPQPR
	yeXIs6qKOMmE1FHRRsWHtlY1ov6ILWvPbKZ7zHivuB6pSoN4xuodmheQmm53X0Py48Zx
	8C+HUpzs5x0qnRNlxfeStVCozIb65XPhdR0s5BGfRH25UsHuRtqruIM02prGN9QDLF34
	gjK5MEJDGJ3l9NiQwFBFPgEzZcbN0y5TgFQ4fj70xkyoRnk5HQMuUz6lq6+v3+PLCVKv
	/4xQ==
X-Received: by 10.112.234.165 with SMTP id uf5mr8592288lbc.91.1440963416455;
	Sun, 30 Aug 2015 12:36:56 -0700 (PDT)
Received: from localhost (h248n4-ld-c-a31.ias.bredband.telia.com.
	[81.234.130.248])
	by smtp.gmail.com with ESMTPSA id o6sm3296870lah.20.2015.08.30.12.36.55
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 30 Aug 2015 12:36:55 -0700 (PDT)
Date: Sun, 30 Aug 2015 12:36:53 -0700
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20150830193653.GA5289@toto>
References: <1440834273-6023-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1440834273-6023-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::236
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] disas/microblaze: Remove unused code
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
X-List-Received-Date: Sun, 30 Aug 2015 19:37:07 -0000

On Sat, Aug 29, 2015 at 09:44:33AM +0200, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  disas/microblaze.c | 150 -----------------------------------------------------
>  1 file changed, 150 deletions(-)
> 
> diff --git a/disas/microblaze.c b/disas/microblaze.c
> index c14ab89..3588235 100644
> --- a/disas/microblaze.c
> +++ b/disas/microblaze.c
> @@ -604,25 +604,6 @@ char * get_field_special (long instr, struct op_code_struct * op);
>  unsigned long read_insn_microblaze (bfd_vma memaddr, 
>  		      struct disassemble_info *info,
>  		      struct op_code_struct **opr);
> -enum microblaze_instr get_insn_microblaze (long inst,
> -  		     bfd_boolean *isunsignedimm,
> -  		     enum microblaze_instr_type *insn_type,
> -  		     short *delay_slots);
> -short get_delay_slots_microblaze (long inst);
> -enum microblaze_instr microblaze_decode_insn (long insn,
> -		        int *rd, 
> -			int *ra, 
> -			int *rb, 
> -			int *imm);
> -unsigned long
> -microblaze_get_target_address (long inst,
> -			       bfd_boolean immfound,
> -			       int immval,
> -			       long pcval,
> -			       long r1val,
> -			       long r2val,
> -			       bfd_boolean *targetvalid,
> -			       bfd_boolean *unconditionalbranch);
>  
>  static char *
>  get_field (long instr, long mask, unsigned short low)
> @@ -968,134 +949,3 @@ print_insn_microblaze (bfd_vma memaddr, struct disassemble_info * info)
>    /* Say how many bytes we consumed? */
>    return 4;
>  }
> -
> -enum microblaze_instr
> -get_insn_microblaze (long inst,
> -  		     bfd_boolean *isunsignedimm,
> -  		     enum microblaze_instr_type *insn_type,
> -  		     short *delay_slots)
> -{
> -  struct op_code_struct * op;
> -  *isunsignedimm = FALSE;
> -
> -  /* Just a linear search of the table.  */
> -  for (op = opcodes; op->name != 0; op ++)
> -    if (op->bit_sequence == (inst & op->opcode_mask))
> -      break;
> -
> -  if (op->name == 0)
> -    return invalid_inst;
> -  else {
> -    *isunsignedimm = (op->inst_type == INST_TYPE_RD_R1_UNSIGNED_IMM);
> -    *insn_type = op->instr_type;
> -    *delay_slots = op->delay_slots;
> -    return op->instr;
> -  }
> -}
> -
> -short
> -get_delay_slots_microblaze (long inst)
> -{
> -  bfd_boolean isunsignedimm;
> -  enum microblaze_instr_type insn_type;
> -  enum microblaze_instr op;
> -  short delay_slots;
> -
> -  op = get_insn_microblaze( inst, &isunsignedimm, &insn_type, &delay_slots);
> -  if (op == invalid_inst)
> -    return 0;
> -  else 
> -    return delay_slots;
> -}
> -
> -enum microblaze_instr
> -microblaze_decode_insn (long insn,
> -		        int *rd, 
> -			int *ra, 
> -			int *rb, 
> -			int *imm)
> -{
> -  enum microblaze_instr op;
> -  bfd_boolean t1;
> -  enum microblaze_instr_type t2;
> -  short t3;
> -
> -  op = get_insn_microblaze(insn, &t1, &t2, &t3);
> -  *rd = (insn & RD_MASK) >> RD_LOW;
> -  *ra = (insn & RA_MASK) >> RA_LOW;
> -  *rb = (insn & RB_MASK) >> RB_LOW;
> -  t3 = (insn & IMM_MASK) >> IMM_LOW;
> -  *imm = (int) t3;
> -  return (op);
> -}
> -
> -unsigned long
> -microblaze_get_target_address (long inst,
> -			       bfd_boolean immfound,
> -			       int immval,
> -			       long pcval,
> -			       long r1val,
> -			       long r2val,
> -			       bfd_boolean *targetvalid,
> -			       bfd_boolean *unconditionalbranch)
> -{
> -  struct op_code_struct * op;
> -  long targetaddr = 0;
> -
> -  *unconditionalbranch = FALSE;
> -  /* Just a linear search of the table.  */
> -  for (op = opcodes; op->name != 0; op ++)
> -    if (op->bit_sequence == (inst & op->opcode_mask))
> -      break;
> -
> -  if (op->name == 0) {
> -    *targetvalid = FALSE;
> -  } else if (op->instr_type == branch_inst) {
> -    switch (op->inst_type) {
> -    case INST_TYPE_R2:
> -      *unconditionalbranch = TRUE;
> -      /* fallthru */
> -    case INST_TYPE_RD_R2:
> -    case INST_TYPE_R1_R2:
> -      targetaddr = r2val;
> -      *targetvalid = TRUE;
> -      if (op->inst_offset_type == INST_PC_OFFSET)
> -	targetaddr += pcval;
> -      break;
> -    case INST_TYPE_IMM:
> -      *unconditionalbranch = TRUE;
> -      /* fallthru */
> -    case INST_TYPE_RD_IMM:
> -    case INST_TYPE_R1_IMM:
> -      if (immfound) {
> -	targetaddr = (immval << 16) & 0xffff0000;
> -	targetaddr |= (get_int_field_imm(inst) & 0x0000ffff);
> -      } else {
> -	targetaddr = get_int_field_imm(inst);
> -	if (targetaddr & 0x8000)
> -	  targetaddr |= 0xFFFF0000;
> -      }
> -      if (op->inst_offset_type == INST_PC_OFFSET)
> -	targetaddr += pcval;
> -      *targetvalid = TRUE;
> -      break;
> -    default:
> -      *targetvalid = FALSE;
> -      break;
> -    }
> -  } else if (op->instr_type == return_inst) {
> -      if (immfound) {
> -	targetaddr = (immval << 16) & 0xffff0000;
> -	targetaddr |= (get_int_field_imm(inst) & 0x0000ffff);
> -      } else {
> -	targetaddr = get_int_field_imm(inst);
> -	if (targetaddr & 0x8000)
> -	  targetaddr |= 0xFFFF0000;
> -      }
> -      targetaddr += r1val;
> -      *targetvalid = TRUE;
> -  } else {
> -    *targetvalid = FALSE;
> -  }
> -  return targetaddr;
> -}
> -- 
> 2.1.4
> 

