Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TVGiv-0002Gb-0B
	for mharc-qemu-trivial@gnu.org; Mon, 05 Nov 2012 02:03:53 -0500
Received: from eggs.gnu.org ([208.118.235.92]:60074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TVGis-0002Dm-B1
	for qemu-trivial@nongnu.org; Mon, 05 Nov 2012 02:03:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TVGir-0007e4-EQ
	for qemu-trivial@nongnu.org; Mon, 05 Nov 2012 02:03:50 -0500
Received: from hall.aurel32.net ([88.191.126.93]:44523)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TVGir-0007dw-87
	for qemu-trivial@nongnu.org; Mon, 05 Nov 2012 02:03:49 -0500
Received: from 37-8-191-163.coucou-networks.fr ([37.8.191.163]
	helo=ohm.aurel32.net)
	by hall.aurel32.net with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.72) (envelope-from <aurelien@aurel32.net>)
	id 1TVGip-00028N-Ju; Mon, 05 Nov 2012 08:03:47 +0100
Received: from aurel32 by ohm.aurel32.net with local (Exim 4.80)
	(envelope-from <aurelien@aurel32.net>)
	id 1TVGii-0004O0-43; Mon, 05 Nov 2012 08:03:40 +0100
Date: Mon, 5 Nov 2012 08:03:40 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20121105070340.GH31495@ohm.aurel32.net>
References: <1352060975-18646-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1352060975-18646-1-git-send-email-sw@weilnetz.de>
X-Mailer: Mutt 1.5.21 (2010-09-15)
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 88.191.126.93
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] target-mips: Fix compiler warnings
 caused by very large constants
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
X-List-Received-Date: Mon, 05 Nov 2012 07:03:51 -0000

On Sun, Nov 04, 2012 at 09:29:35PM +0100, Stefan Weil wrote:
> Those constants are larger than 32 bits and need a suffix to avoid
> warnings from some versions of gcc.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  target-mips/dsp_helper.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target-mips/dsp_helper.c b/target-mips/dsp_helper.c
> index b59133e..2ab9956 100644
> --- a/target-mips/dsp_helper.c
> +++ b/target-mips/dsp_helper.c
> @@ -3553,7 +3553,7 @@ target_ulong helper_dextr_rs_w(target_ulong ac, target_ulong shift,
>          if (temp128 == 0) {
>              temp[0] = 0x0FFFFFFFF;
>          } else {
> -            temp[0] = 0x0100000000;
> +            temp[0] = 0x0100000000ULL;
>          }
>          set_DSPControl_overflow_flag(1, 23, env);
>      }
> @@ -3653,7 +3653,7 @@ target_ulong helper_extr_s_h(target_ulong ac, target_ulong shift,
>      if (temp > (int64_t)0x7FFF) {
>          temp = 0x00007FFF;
>          set_DSPControl_overflow_flag(1, 23, env);
> -    } else if (temp < (int64_t)0xFFFFFFFFFFFF8000) {
> +    } else if (temp < (int64_t)0xFFFFFFFFFFFF8000LL) {
>          temp = 0xFFFF8000;
>          set_DSPControl_overflow_flag(1, 23, env);
>      }

Blue Swirl proposed the same patch a bit earlier then you, and I have
just applied it.


-- 
Aurelien Jarno                          GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net

