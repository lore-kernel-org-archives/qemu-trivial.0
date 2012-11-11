Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TXa2L-0000jk-Ou
	for mharc-qemu-trivial@gnu.org; Sun, 11 Nov 2012 11:05:29 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33151)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TXa2H-0000hf-0z
	for qemu-trivial@nongnu.org; Sun, 11 Nov 2012 11:05:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TXa2D-00009W-Uh
	for qemu-trivial@nongnu.org; Sun, 11 Nov 2012 11:05:24 -0500
Received: from hall.aurel32.net ([88.191.126.93]:59387)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TXa2D-00009R-Ok
	for qemu-trivial@nongnu.org; Sun, 11 Nov 2012 11:05:21 -0500
Received: from [2001:470:d4ed:0:ea11:32ff:fea1:831a] (helo=ohm.aurel32.net)
	by hall.aurel32.net with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.72) (envelope-from <aurelien@aurel32.net>)
	id 1TXa22-0000qF-Fs; Sun, 11 Nov 2012 17:05:10 +0100
Received: from aurel32 by ohm.aurel32.net with local (Exim 4.80)
	(envelope-from <aurelien@aurel32.net>)
	id 1TXa20-0003Iq-Tt; Sun, 11 Nov 2012 17:05:08 +0100
Date: Sun, 11 Nov 2012 17:05:08 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Eric Johnson <ericj@mips.com>
Message-ID: <20121111160508.GA11027@ohm.aurel32.net>
References: <1352518851-21812-1-git-send-email-ericj@mips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1352518851-21812-1-git-send-email-ericj@mips.com>
X-Mailer: Mutt 1.5.21 (2010-09-15)
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 88.191.126.93
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] target-mips: Fix seg fault for LUI when
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
X-List-Received-Date: Sun, 11 Nov 2012 16:05:28 -0000

On Fri, Nov 09, 2012 at 07:40:51PM -0800, Eric Johnson wrote:
> The call to gen_logic_imm for OPC_LUI passes -1 for rs.  This
> causes the MIPS_DEBUG statement to seg fault due to the deference
> of regnames[rs].  This patch fixes that.
> 
> Signed-off-by: Eric Johnson <ericj@mips.com>
> ---
>  target-mips/translate.c |   18 +++++++++++-------
>  1 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/target-mips/translate.c b/target-mips/translate.c
> index 8175da0..aba6327 100644
> --- a/target-mips/translate.c
> +++ b/target-mips/translate.c
> @@ -2013,7 +2013,6 @@ static void gen_logic_imm(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
>                            int rt, int rs, int16_t imm)
>  {
>      target_ulong uimm;
> -    const char *opn = "imm logic";
>  
>      if (rt == 0) {
>          /* If no destination, treat it as a NOP. */
> @@ -2027,29 +2026,34 @@ static void gen_logic_imm(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
>              tcg_gen_andi_tl(cpu_gpr[rt], cpu_gpr[rs], uimm);
>          else
>              tcg_gen_movi_tl(cpu_gpr[rt], 0);
> -        opn = "andi";
> +        MIPS_DEBUG("%s %s, %s, " TARGET_FMT_lx, "andi", regnames[rt],
> +            regnames[rs], uimm);
>          break;
>      case OPC_ORI:
>          if (rs != 0)
>              tcg_gen_ori_tl(cpu_gpr[rt], cpu_gpr[rs], uimm);
>          else
>              tcg_gen_movi_tl(cpu_gpr[rt], uimm);
> -        opn = "ori";
> +        MIPS_DEBUG("%s %s, %s, " TARGET_FMT_lx, "ori", regnames[rt],
> +            regnames[rs], uimm);
>          break;
>      case OPC_XORI:
>          if (likely(rs != 0))
>              tcg_gen_xori_tl(cpu_gpr[rt], cpu_gpr[rs], uimm);
>          else
>              tcg_gen_movi_tl(cpu_gpr[rt], uimm);
> -        opn = "xori";
> +        MIPS_DEBUG("%s %s, %s, " TARGET_FMT_lx, "xori", regnames[rt],
> +            regnames[rs], uimm);
>          break;
>      case OPC_LUI:
>          tcg_gen_movi_tl(cpu_gpr[rt], imm << 16);
> -        opn = "lui";
> +        MIPS_DEBUG("lui %s, " TARGET_FMT_lx, regnames[rt], uimm);
> +        break;
> +
> +    default:
> +        MIPS_DEBUG("Unknown logical immediate opcode %08x", opc);
>          break;
>      }
> -    (void)opn; /* avoid a compiler warning */
> -    MIPS_DEBUG("%s %s, %s, " TARGET_FMT_lx, opn, regnames[rt], regnames[rs], uimm);
>  }
>  
>  /* Set on less than with immediate operand */

Thanks, I applied this patch, with minor tweak: instead of using printf
%s to format the opcode name, I moved it to the string like it was
%already the case for LUI.

-- 
Aurelien Jarno                          GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net

