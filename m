Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wtbx4-0008Iw-5Y
	for mharc-qemu-trivial@gnu.org; Sun, 08 Jun 2014 08:11:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wtbwx-0008Bg-Uw
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 08:11:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wtbwt-0003FU-42
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 08:11:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54210)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wtbwj-0003E7-78; Sun, 08 Jun 2014 08:11:33 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 0871C40DD7;
	Sun,  8 Jun 2014 16:11:31 +0400 (MSK)
Message-ID: <539452F2.8070509@msgid.tls.msk.ru>
Date: Sun, 08 Jun 2014 16:11:30 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1402160924-14152-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1402160924-14152-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, patches@linaro.org,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] tcg: mark tcg_out* and tcg_patch* with
 attribute 'unused'
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
X-List-Received-Date: Sun, 08 Jun 2014 12:11:52 -0000

07.06.2014 21:08, Peter Maydell wrote:
> The tcg_out* and tcg_patch* functions are utility routines that may or
> may not be used by a particular backend; mark them with the 'unused'
> attribute to suppress spurious warnings if they aren't used.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Do we want to define a QEMU_UNUSED macro in compiler.h? We don't
> seem to have done for the existing uses of this attribute in tree.
> 
>  tcg/tcg.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 2c5732d..fe55d05 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -125,19 +125,20 @@ static TCGRegSet tcg_target_available_regs[2];
>  static TCGRegSet tcg_target_call_clobber_regs;
>  
>  #if TCG_TARGET_INSN_UNIT_SIZE == 1
> -static inline void tcg_out8(TCGContext *s, uint8_t v)

Hm. Those are already #ifdef'ed, is it not enough?  Which architectures
do not use functions which _are_ declared/defined?

But I wonder, why to bother at all?  This "static inline foo() {..}" idiom
is very common in header files, to define a function which may or may not
be used, and no compiler warns about these.

Thanks,

/mjt

