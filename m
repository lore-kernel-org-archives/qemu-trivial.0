Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1THKDi-0000W8-MS
	for mharc-qemu-trivial@gnu.org; Thu, 27 Sep 2012 15:58:02 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1THKDc-0000BX-GI
	for qemu-trivial@nongnu.org; Thu, 27 Sep 2012 15:58:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1THKDb-0006nn-5F
	for qemu-trivial@nongnu.org; Thu, 27 Sep 2012 15:57:56 -0400
Received: from hall.aurel32.net ([88.191.126.93]:35139)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>)
	id 1THKDR-0006mD-9Q; Thu, 27 Sep 2012 15:57:45 -0400
Received: from watt.aurel32.net ([82.228.202.134] helo=ohm.aurel32.net)
	by hall.aurel32.net with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.72) (envelope-from <aurelien@aurel32.net>)
	id 1THKDQ-0004VR-4y; Thu, 27 Sep 2012 21:57:44 +0200
Received: from aurel32 by ohm.aurel32.net with local (Exim 4.80)
	(envelope-from <aurelien@aurel32.net>)
	id 1THKDP-0007UU-2s; Thu, 27 Sep 2012 21:57:43 +0200
Date: Thu, 27 Sep 2012 21:57:43 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20120927195743.GG20151@ohm.aurel32.net>
References: <1348754143-18251-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1348754143-18251-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: Mutt 1.5.21 (2010-09-15)
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 88.191.126.93
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tcg/arm: Use
 tcg_out_mov_reg rather than inline equivalent code
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
X-List-Received-Date: Thu, 27 Sep 2012 19:58:01 -0000

On Thu, Sep 27, 2012 at 02:55:43PM +0100, Peter Maydell wrote:
> Use the recently introduced tcg_out_mov_reg() function rather than
> the equivalent inline code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is a minor follow-on cleanup patch after commit 9716ef3b1.
> 
>  tcg/arm/tcg-target.c |   15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/tcg/arm/tcg-target.c b/tcg/arm/tcg-target.c
> index 2bad0a2..5e8dbdd 100644
> --- a/tcg/arm/tcg-target.c
> +++ b/tcg/arm/tcg-target.c
> @@ -1197,20 +1197,11 @@ static inline void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, int opc)
>      case 1:
>      case 2:
>      default:
> -        if (data_reg != TCG_REG_R0) {
> -            tcg_out_dat_reg(s, COND_AL, ARITH_MOV,
> -                            data_reg, 0, TCG_REG_R0, SHIFT_IMM_LSL(0));
> -        }
> +        tcg_out_mov_reg(s, COND_AL, data_reg, TCG_REG_R0);
>          break;
>      case 3:
> -        if (data_reg != TCG_REG_R0) {
> -            tcg_out_dat_reg(s, COND_AL, ARITH_MOV,
> -                            data_reg, 0, TCG_REG_R0, SHIFT_IMM_LSL(0));
> -        }
> -        if (data_reg2 != TCG_REG_R1) {
> -            tcg_out_dat_reg(s, COND_AL, ARITH_MOV,
> -                            data_reg2, 0, TCG_REG_R1, SHIFT_IMM_LSL(0));
> -        }
> +        tcg_out_mov_reg(s, COND_AL, data_reg, TCG_REG_R0);
> +        tcg_out_mov_reg(s, COND_AL, data_reg2, TCG_REG_R1);
>          break;
>      }

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>


-- 
Aurelien Jarno                          GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net

