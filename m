Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ua7Bm-0007fS-AJ
	for mharc-qemu-trivial@gnu.org; Wed, 08 May 2013 12:25:58 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1Ua7Bh-0007dA-TF
	for qemu-trivial@nongnu.org; Wed, 08 May 2013 12:25:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1Ua7Bb-0000gl-W9
	for qemu-trivial@nongnu.org; Wed, 08 May 2013 12:25:53 -0400
Received: from hall.aurel32.net ([88.191.126.93]:52770)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1Ua7Bb-0000gZ-Pk
	for qemu-trivial@nongnu.org; Wed, 08 May 2013 12:25:47 -0400
Received: from [2001:470:d4ed:0:ea11:32ff:fea1:831a] (helo=ohm.aurel32.net)
	by hall.aurel32.net with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.72) (envelope-from <aurelien@aurel32.net>)
	id 1Ua7BW-0008Mn-MY; Wed, 08 May 2013 18:25:43 +0200
Received: from aurel32 by ohm.aurel32.net with local (Exim 4.80)
	(envelope-from <aurelien@aurel32.net>)
	id 1Ua7BP-00078g-Bq; Wed, 08 May 2013 18:25:35 +0200
Date: Wed, 8 May 2013 18:25:35 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Petar Jovanovic <petar.jovanovic@rt-rk.com>
Message-ID: <20130508162535.GN4613@ohm.aurel32.net>
References: <1368022144-60111-1-git-send-email-petar.jovanovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1368022144-60111-1-git-send-email-petar.jovanovic@rt-rk.com>
X-Mailer: Mutt 1.5.21 (2010-09-15)
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 88.191.126.93
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, petar.jovanovic@imgtec.com
Subject: Re: [Qemu-trivial] [PATCH] target-mips: add missing check_dspr2 for
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
X-List-Received-Date: Wed, 08 May 2013 16:25:57 -0000

On Wed, May 08, 2013 at 04:09:04PM +0200, Petar Jovanovic wrote:
> From: Petar Jovanovic <petar.jovanovic@imgtec.com>
> 
> The emulator needs to check in hflags if DSP unit has been turned off before
> it generates code for MUL_PH, MUL_S_PH, MULQ_S_W, and MULQ_RS_W.
> 
> Signed-off-by: Petar Jovanovic <petar.jovanovic@imgtec.com>
> ---
>  target-mips/translate.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/target-mips/translate.c b/target-mips/translate.c
> index b7f8203..0a53203 100644
> --- a/target-mips/translate.c
> +++ b/target-mips/translate.c
> @@ -13400,6 +13400,7 @@ static void gen_mipsdsp_multiply(DisasContext *ctx, uint32_t op1, uint32_t op2,
>      /* OPC_MULT_G_2E, OPC_ADDUH_QB_DSP, OPC_MUL_PH_DSP have
>       * the same mask and op1. */
>      case OPC_MULT_G_2E:
> +        check_dspr2(ctx);
>          switch (op2) {
>          case  OPC_MUL_PH:
>              gen_helper_mul_ph(cpu_gpr[ret], v1_t, v2_t, cpu_env);

Thanks, applied.


-- 
Aurelien Jarno                          GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net

