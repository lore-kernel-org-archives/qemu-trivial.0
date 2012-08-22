Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T46Kt-00063c-Ae
	for mharc-qemu-trivial@gnu.org; Wed, 22 Aug 2012 04:30:47 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T46Kk-00062U-OT
	for qemu-trivial@nongnu.org; Wed, 22 Aug 2012 04:30:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T46Kf-0000i4-Gs
	for qemu-trivial@nongnu.org; Wed, 22 Aug 2012 04:30:38 -0400
Received: from mail-iy0-f173.google.com ([209.85.210.173]:37574)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T46Kf-0000ho-Cg
	for qemu-trivial@nongnu.org; Wed, 22 Aug 2012 04:30:33 -0400
Received: by iakx26 with SMTP id x26so603644iak.4
	for <qemu-trivial@nongnu.org>; Wed, 22 Aug 2012 01:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=iAB7ShMQB2B+9ltGDP+rtARQhm5hgnfusYJ8nZQbYkM=;
	b=hOy42uQm2WcndJRR/Uudhu8hUdNYyi3QwYJZH6qN/s0wo7OKADSmnjevhlvxZnp63w
	v/opf9UyLB6+YRkRQtrRQ5NB5UEebtyNwHfTCMiAWqMRdxcdMoPS5CiNwUjzHMnkLJKt
	V+94O4ucSYBZN0TKF4GVO7pXNloeLF3ouAeetK18XJhxZfoCYdfHA1o0r3ryTjid7sws
	iIgkJT2dl0jFScnsMIgJSAtq0UG60ULxEwaFjz5H2gDfP9LJ8iz7Fn3C2nGP7fOCCKd4
	O1Bbn+iMt5HIi+16aYtkN4CgKx/nNEQfP5p/OITvlktBHxRhrS/Luh+eMfB1APqbfWlX
	379A==
MIME-Version: 1.0
Received: by 10.43.132.70 with SMTP id ht6mr16069641icc.14.1345624232617; Wed,
	22 Aug 2012 01:30:32 -0700 (PDT)
Received: by 10.50.160.161 with HTTP; Wed, 22 Aug 2012 01:30:32 -0700 (PDT)
In-Reply-To: <Pine.GSO.4.64.1208212331340.11653@mono>
References: <Pine.GSO.4.64.1208212331340.11653@mono>
Date: Wed, 22 Aug 2012 09:30:32 +0100
Message-ID: <CAFEAcA-kR+6FiBKUZTyE3L14oJMPtqsDXWKGsXZyyUAmHv2avA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkZc1W9RpjTS7EO2G2BUEqyxcCP114vyxsxibpMuphXlwGCQ74RSqnk2xK1rmhdtgXaMNSm
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Correct computation of
 bytes per pixel from bits per pixel
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
X-List-Received-Date: Wed, 22 Aug 2012 08:30:45 -0000

On 21 August 2012 22:32, BALATON Zoltan <balaton@eik.bme.hu> wrote:

If you make the Subject "console: Correct computation of bytes per pixel
from bits per pixel" it's easier to tell what bit of qemu the patch
is dealing with.

> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  console.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/console.c b/console.c
> index 4525cc7..f698b77 100644
> --- a/console.c
> +++ b/console.c
> @@ -1612,7 +1612,7 @@ PixelFormat qemu_different_endianness_pixelformat(int
> bpp)
>      memset(&pf, 0x00, sizeof(PixelFormat));
>
>      pf.bits_per_pixel = bpp;
> -    pf.bytes_per_pixel = bpp / 8;
> +    pf.bytes_per_pixel = (bpp + 7) >> 3;

You could write this as
       pf.bytes_per_pixel = DIV_ROUND_UP(bpp, 8);

-- PMM

