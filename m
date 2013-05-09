Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UaMHk-0004L0-Ay
	for mharc-qemu-trivial@gnu.org; Thu, 09 May 2013 04:33:08 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UaMHh-0004GF-70
	for qemu-trivial@nongnu.org; Thu, 09 May 2013 04:33:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UaMHg-0004QG-06
	for qemu-trivial@nongnu.org; Thu, 09 May 2013 04:33:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51446)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UaMHd-0004P9-3t; Thu, 09 May 2013 04:33:01 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id E008F40176;
	Thu,  9 May 2013 12:32:59 +0400 (MSK)
Message-ID: <518B5F3B.9050308@msgid.tls.msk.ru>
Date: Thu, 09 May 2013 12:32:59 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Petar Jovanovic <petar.jovanovic@rt-rk.com>
References: <1368022144-60111-1-git-send-email-petar.jovanovic@rt-rk.com>
In-Reply-To: <1368022144-60111-1-git-send-email-petar.jovanovic@rt-rk.com>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
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
X-List-Received-Date: Thu, 09 May 2013 08:33:07 -0000

08.05.2013 18:09, Petar Jovanovic wrote:
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
> 

FWIW.  While the patch has been applied by Aurelien, I've a small
comment about the "trivialness" of patches, having in mind this
example.  This appears to be a "trivial" patch by the look of it,
that is, it is just one-liner adding a simple instruction.  But
nevertheless, it is NOT suitable for qemu-trivial, because it
need to be verified by the subsystem maintainer who understand
all the possible implications.  The patch changes core logic
which may have unexpected consequences in unexpected places,
it may lead to wrong code generation and bugs, and other "fun"
side effects.  In that way it is not "trivial", and really
need to be sent to subsystem maintainers (and to qemu-devel@),
not to the trivial patch queue.

From not-so-trivial stuff I can consider, for example, fixes in
command line processing which do not break backward compatibility
(if it wasn't outright bug like a misspelt option name), -- but
even there, it might be a good idea to discuss it on qemu-devel
anyway.

In other words, if you know some subsystem and to you some thing
looks really trivial, it isn't necessary the same for someone
who does not have the same knowlege about that subsystem.. ;)

Thank you!

/mjt

