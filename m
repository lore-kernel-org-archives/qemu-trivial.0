Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QTAXR-00058x-1m
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2011 06:26:33 -0400
Received: from eggs.gnu.org ([140.186.70.92]:36671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QTAXM-00057o-ES
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2011 06:26:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QTAXK-0001cz-FL
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2011 06:26:28 -0400
Received: from fmmailgate03.web.de ([217.72.192.234]:34128)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1QTAXF-0001cW-AW; Sun, 05 Jun 2011 06:26:21 -0400
Received: from smtp06.web.de  ( [172.20.5.172])
	by fmmailgate03.web.de (Postfix) with ESMTP id F2B8619128771;
	Sun,  5 Jun 2011 12:26:19 +0200 (CEST)
Received: from [84.148.55.185] (helo=[10.0.1.1])
	by smtp06.web.de with asmtp (TLSv1:AES128-SHA:128) (WEB.DE 4.110 #2)
	id 1QTAXD-0000XC-00; Sun, 05 Jun 2011 12:26:19 +0200
Message-Id: <78A4F565-9ABF-4B0E-885A-573D42DF1211@web.de>
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
To: Laurent Vivier <Laurent@vivier.eu>,
 qemu-trivial@nongnu.org
In-Reply-To: <1301081796-25364-1-git-send-email-laurent@vivier.eu>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed; delsp=yes
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Apple Message framework v936)
Date: Sun, 5 Jun 2011 12:26:18 +0200
References: <1301081796-25364-1-git-send-email-laurent@vivier.eu>
X-Mailer: Apple Mail (2.936)
Sender: andreas.faerber@web.de
X-Sender: Andreas.Faerber@web.de
X-Provags-ID: V01U2FsdGVkX1+6nW5VIPUXfZ4DIW0tgtlAD6+m2pvJQkPsmW4D
	H38DDs8Z+RsEstErDrOkPBUm/NvOZWJTCJDH5sUW+id8vJeRHz
	Q35bhiI8/XbFW6sP3Z+w==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.234
Cc: QEMU-devel Developers <qemu-devel@nongnu.org>,
	Paul Brook <paul@codesourcery.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] m68k: Replace gen_im32() by
	tcg_const_i32()
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
X-List-Received-Date: Sun, 05 Jun 2011 10:26:31 -0000

I would add as description: "This resolves a FIXME."

Is "by" grammatically correct here? I would've thought to replace sth. =20=

"with" sth., by s.o.

Am 25.03.2011 um 20:36 schrieb Laurent Vivier:

> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

This patch accurately inlines and removes gen_im32().

Reviewed-by: Andreas F=E4rber <andreas.faerber@web.de>

Stefan, this patch was sent the third time already, nobody else =20
commented. It applies cleanly and compiles. Can we consider it a =20
trivial patch and be done with it?

http://patchwork.ozlabs.org/patch/88417/

Andreas

> ---
> target-m68k/translate.c |   43 +++++++++++++++++++=20
> +-----------------------
> 1 files changed, 20 insertions(+), 23 deletions(-)
>
> diff --git a/target-m68k/translate.c b/target-m68k/translate.c
> index 6f72a2b..be56aaa 100644
> --- a/target-m68k/translate.c
> +++ b/target-m68k/translate.c
> @@ -171,9 +171,6 @@ typedef void (*disas_proc)(DisasContext *, =20
> uint16_t);
>   static void disas_##name (DisasContext *s, uint16_t insn)
> #endif
>
> -/* FIXME: Remove this.  */
> -#define gen_im32(val) tcg_const_i32(val)
> -
> /* Generate a load from the specified address.  Narrow values are
>    sign extended to full register width.  */
> static inline TCGv gen_load(DisasContext * s, int opsize, TCGv addr, =20=

> int sign)
> @@ -339,7 +336,7 @@ static TCGv gen_lea_indexed(DisasContext *s, int =20=

> opsize, TCGv base)
>         if ((ext & 0x80) =3D=3D 0) {
>             /* base not suppressed */
>             if (IS_NULL_QREG(base)) {
> -                base =3D gen_im32(offset + bd);
> +                base =3D tcg_const_i32(offset + bd);
>                 bd =3D 0;
>             }
>             if (!IS_NULL_QREG(add)) {
> @@ -355,7 +352,7 @@ static TCGv gen_lea_indexed(DisasContext *s, int =20=

> opsize, TCGv base)
>                 add =3D tmp;
>             }
>         } else {
> -            add =3D gen_im32(bd);
> +            add =3D tcg_const_i32(bd);
>         }
>         if ((ext & 3) !=3D 0) {
>             /* memory indirect */
> @@ -536,15 +533,15 @@ static TCGv gen_lea(DisasContext *s, uint16_t =20=

> insn, int opsize)
>         case 0: /* Absolute short.  */
>             offset =3D ldsw_code(s->pc);
>             s->pc +=3D 2;
> -            return gen_im32(offset);
> +            return tcg_const_i32(offset);
>         case 1: /* Absolute long.  */
>             offset =3D read_im32(s);
> -            return gen_im32(offset);
> +            return tcg_const_i32(offset);
>         case 2: /* pc displacement  */
>             offset =3D s->pc;
>             offset +=3D ldsw_code(s->pc);
>             s->pc +=3D 2;
> -            return gen_im32(offset);
> +            return tcg_const_i32(offset);
>         case 3: /* pc index+displacement.  */
>             return gen_lea_indexed(s, opsize, NULL_QREG);
>         case 4: /* Immediate.  */
> @@ -1209,16 +1206,16 @@ DISAS_INSN(arith_im)
>         break;
>     case 2: /* subi */
>         tcg_gen_mov_i32(dest, src1);
> -        gen_helper_xflag_lt(QREG_CC_X, dest, gen_im32(im));
> +        gen_helper_xflag_lt(QREG_CC_X, dest, tcg_const_i32(im));
>         tcg_gen_subi_i32(dest, dest, im);
> -        gen_update_cc_add(dest, gen_im32(im));
> +        gen_update_cc_add(dest, tcg_const_i32(im));
>         s->cc_op =3D CC_OP_SUB;
>         break;
>     case 3: /* addi */
>         tcg_gen_mov_i32(dest, src1);
>         tcg_gen_addi_i32(dest, dest, im);
> -        gen_update_cc_add(dest, gen_im32(im));
> -        gen_helper_xflag_lt(QREG_CC_X, dest, gen_im32(im));
> +        gen_update_cc_add(dest, tcg_const_i32(im));
> +        gen_helper_xflag_lt(QREG_CC_X, dest, tcg_const_i32(im));
>         s->cc_op =3D CC_OP_ADD;
>         break;
>     case 5: /* eori */
> @@ -1228,7 +1225,7 @@ DISAS_INSN(arith_im)
>     case 6: /* cmpi */
>         tcg_gen_mov_i32(dest, src1);
>         tcg_gen_subi_i32(dest, dest, im);
> -        gen_update_cc_add(dest, gen_im32(im));
> +        gen_update_cc_add(dest, tcg_const_i32(im));
>         s->cc_op =3D CC_OP_SUB;
>         break;
>     default:
> @@ -1324,8 +1321,8 @@ DISAS_INSN(clr)
>     default:
>         abort();
>     }
> -    DEST_EA(insn, opsize, gen_im32(0), NULL);
> -    gen_logic_cc(s, gen_im32(0));
> +    DEST_EA(insn, opsize, tcg_const_i32(0), NULL);
> +    gen_logic_cc(s, tcg_const_i32(0));
> }
>
> static TCGv gen_get_ccr(DisasContext *s)
> @@ -1589,7 +1586,7 @@ DISAS_INSN(jump)
>     }
>     if ((insn & 0x40) =3D=3D 0) {
>         /* jsr */
> -        gen_push(s, gen_im32(s->pc));
> +        gen_push(s, tcg_const_i32(s->pc));
>     }
>     gen_jmp(s, tmp);
> }
> @@ -1617,7 +1614,7 @@ DISAS_INSN(addsubq)
>             tcg_gen_addi_i32(dest, dest, val);
>         }
>     } else {
> -        src2 =3D gen_im32(val);
> +        src2 =3D tcg_const_i32(val);
>         if (insn & 0x0100) {
>             gen_helper_xflag_lt(QREG_CC_X, dest, src2);
>             tcg_gen_subi_i32(dest, dest, val);
> @@ -1666,7 +1663,7 @@ DISAS_INSN(branch)
>     }
>     if (op =3D=3D 1) {
>         /* bsr */
> -        gen_push(s, gen_im32(s->pc));
> +        gen_push(s, tcg_const_i32(s->pc));
>     }
>     gen_flush_cc_op(s);
>     if (op > 1) {
> @@ -1757,7 +1754,7 @@ DISAS_INSN(mov3q)
>     val =3D (insn >> 9) & 7;
>     if (val =3D=3D 0)
>         val =3D -1;
> -    src =3D gen_im32(val);
> +    src =3D tcg_const_i32(val);
>     gen_logic_cc(s, src);
>     DEST_EA(insn, OS_LONG, src, NULL);
> }
> @@ -1883,7 +1880,7 @@ DISAS_INSN(shift_im)
>     tmp =3D (insn >> 9) & 7;
>     if (tmp =3D=3D 0)
>         tmp =3D 8;
> -    shift =3D gen_im32(tmp);
> +    shift =3D tcg_const_i32(tmp);
>     /* No need to flush flags becuse we know we will set C flag.  */
>     if (insn & 0x100) {
>         gen_helper_shl_cc(reg, cpu_env, reg, shift);
> @@ -2191,7 +2188,7 @@ DISAS_INSN(fpu)
>         switch ((ext >> 10) & 7) {
>         case 4: /* FPCR */
>             /* Not implemented.  Always return zero.  */
> -            tmp32 =3D gen_im32(0);
> +            tmp32 =3D tcg_const_i32(0);
>             break;
>         case 1: /* FPIAR */
>         case 2: /* FPSR */
> @@ -2592,7 +2589,7 @@ DISAS_INSN(mac)
>         /* Skip the accumulate if the value is already saturated.  */
>         l1 =3D gen_new_label();
>         tmp =3D tcg_temp_new();
> -        gen_op_and32(tmp, QREG_MACSR, gen_im32(MACSR_PAV0 << acc));
> +        gen_op_and32(tmp, QREG_MACSR, tcg_const_i32(MACSR_PAV0 << =20
> acc));
>         gen_op_jmp_nz32(tmp, l1);
>     }
> #endif
> @@ -2626,7 +2623,7 @@ DISAS_INSN(mac)
>             /* Skip the accumulate if the value is already =20
> saturated.  */
>             l1 =3D gen_new_label();
>             tmp =3D tcg_temp_new();
> -            gen_op_and32(tmp, QREG_MACSR, gen_im32(MACSR_PAV0 << =20
> acc));
> +            gen_op_and32(tmp, QREG_MACSR, tcg_const_i32(MACSR_PAV0 =20=

> << acc));
>             gen_op_jmp_nz32(tmp, l1);
>         }
> #endif
> --=20
> 1.7.1
>
>


