Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZkTy-0004MK-Ib
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 17:01:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58110)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZkTv-0004Jj-PX
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 17:01:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZkTv-0001yk-5b
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 17:01:35 -0400
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:35060)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dZkTu-0001xa-VQ
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 17:01:35 -0400
Received: by mail-wm0-x230.google.com with SMTP id c184so35862329wmd.0
	for <qemu-trivial@nongnu.org>; Mon, 24 Jul 2017 14:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=O+VE5dteh2/fp3a3iUpehO/fFTfopI6pswzEpD+TdKE=;
	b=B6qaXET2csYcIt9BcAJyfns41P1LqKtCDF2IPPZ2TLAbl0x71nsJwmD69BwRscIwxp
	X4CvPmpAGy9UJGUqh9DIPFJ4gNk5CHb5AeuMXEzD4vKa3ACIU2JYuD+9/W0AeyB6rU02
	I1JsgE9Onli6YsIvAN/P/BYErCxEyFJu+QtH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=O+VE5dteh2/fp3a3iUpehO/fFTfopI6pswzEpD+TdKE=;
	b=BVrOQtfrUFD+uHcNE2+fXsftkp7S1bbLQVLyh+1OSGA8qIpfhfiF6BfnN2QQgOlqY6
	WeKDJ43MNXxVA5j4vaVb7v5i3wJVw5KShR40RakZ2O2IG4eDv5IIl7APfjQ0mOBvUJSO
	GpEx8To4OobSN21BbWq5awF0xv3WTgNFnljOS1uw9p8OHRBn8WQdIE5kvUjKFqmnH+lr
	llSA0x7cegNCm+zvUUMBpVmjjicdjkIN04EjuUDos5MriYyzi3HYjGuW90G1dhggQs3H
	3ASaLMyoeocsowhZCvORW3aLMuM/Pk3wZ2CPTM7G4Pz2OMsXuhfcUSfwvGIKYq7pE4zq
	WX5w==
X-Gm-Message-State: AIVw112GzG9wl+X9Zh6qMs7CM3iaFFUwoFREXLYykyRHCfOzPA518JgB
	uDUD39Y3s/hLTsau/aVmm09XPu2S6YVE
X-Received: by 10.28.193.138 with SMTP id r132mr6032571wmf.155.1500930092147; 
	Mon, 24 Jul 2017 14:01:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Mon, 24 Jul 2017 14:01:11 -0700 (PDT)
In-Reply-To: <20170724182751.18261-33-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-33-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jul 2017 22:01:11 +0100
Message-ID: <CAFEAcA9d5SE-+=YxJ_dwjvkpxs2R0QJszESExGoG2y+Bnyk2aA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Eric Blake <eblake@redhat.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::230
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 2.10 32/35]
 timer/pxa2xx: silent warning about out-of-bound memory access
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Jul 2017 21:01:36 -0000

On 24 July 2017 at 19:27, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> Unlikely to happen.
>
> hw/timer/pxa2xx_timer.c:145:19: warning: Out of bound memory access (acce=
ssed memory precedes memory block)
>         counter =3D counters[n];
>                   ^~~~~~~~~~~
>
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/timer/pxa2xx_timer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
> index 68ba5a70b3..d47f463636 100644
> --- a/hw/timer/pxa2xx_timer.c
> +++ b/hw/timer/pxa2xx_timer.c
> @@ -139,7 +139,7 @@ static void pxa2xx_timer_update4(void *opaque, uint64=
_t now_qemu, int n)
>      if (s->tm4[n].control & (1 << 7))
>          counter =3D n;
>      else
> -        counter =3D counters[n];
> +        counter =3D counters[n & 7];
>
>      if (!s->tm4[counter].freq) {
>          timer_del(s->tm4[n].tm.qtimer);
> --

This looks rather odd, because we use a mask to guard
the counters[] array index, but we do an access into
another 8-element array with n both immediately
above and immediately below that.

It's not actually possible to call this function
with n not between 0 and 7 -- if the static
analyser can't figure that out does adding an
assert at the top of the function help it out?

thanks
-- PMM

