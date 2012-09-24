Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TGCOG-0006eF-8s
	for mharc-qemu-trivial@gnu.org; Mon, 24 Sep 2012 13:24:16 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TGCOD-0006Vu-AM
	for qemu-trivial@nongnu.org; Mon, 24 Sep 2012 13:24:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TGCOC-0006Sc-8B
	for qemu-trivial@nongnu.org; Mon, 24 Sep 2012 13:24:13 -0400
Received: from hall.aurel32.net ([88.191.126.93]:50133)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>)
	id 1TGCO6-0006Pg-8g; Mon, 24 Sep 2012 13:24:06 -0400
Received: from [37.160.17.197] (helo=ohm.aurel32.net)
	by hall.aurel32.net with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.72) (envelope-from <aurelien@aurel32.net>)
	id 1TGCNr-0000Cf-U4; Mon, 24 Sep 2012 19:23:52 +0200
Received: from aurel32 by ohm.aurel32.net with local (Exim 4.80)
	(envelope-from <aurelien@aurel32.net>)
	id 1TGCNj-00043h-Hq; Mon, 24 Sep 2012 19:23:43 +0200
Date: Mon, 24 Sep 2012 19:23:43 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20120924172343.GC23241@ohm.aurel32.net>
References: <1348504115-13203-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1348504115-13203-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: Mutt 1.5.21 (2010-09-15)
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 88.191.126.93
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fpu/softfloat.c: Remove
 pointless shift of always-zero value
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
X-List-Received-Date: Mon, 24 Sep 2012 17:24:14 -0000

On Mon, Sep 24, 2012 at 05:28:35PM +0100, Peter Maydell wrote:
> In float16_to_float32, when returning an infinity, just pass zero
> as the mantissa argument to packFloat32(), rather than shifting
> a value which we know must be zero.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Spotted by the clang static analyzer. This brings this code into line with
> the other float-to-float conversion functions and was probably a harmless
> cut-n-paste error from the normal-return codepath.
> 
>  fpu/softfloat.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index b29256a..01a28ca 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -3007,7 +3007,7 @@ float32 float16_to_float32(float16 a, flag ieee STATUS_PARAM)
>          if (aSig) {
>              return commonNaNToFloat32(float16ToCommonNaN(a STATUS_VAR) STATUS_VAR);
>          }
> -        return packFloat32(aSign, 0xff, aSig << 13);
> +        return packFloat32(aSign, 0xff, 0);
>      }
>      if (aExp == 0) {
>          int8 shiftCount;
> -- 
> 1.7.9.5

Good catch!

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net

