Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fW3wy-00029d-Hb
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jun 2018 14:04:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59891)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fW3ww-00027c-8B
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 14:04:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fW3wv-0007MB-C2
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 14:04:50 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:34777)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1fW3wv-0007LX-1E; Thu, 21 Jun 2018 14:04:49 -0400
Received: by mail-lf0-x244.google.com with SMTP id e13-v6so5654871lfc.1;
	Thu, 21 Jun 2018 11:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=xvl6zLRces/SMktD691P47IbrnWKJFqGCaFx1dBAR4c=;
	b=pe9x0hThWOolEfrhzCHe3qpfHViTpk9ovR09lG4ZfkpkAjUmQsrMIm8P/4lyF1S1Ls
	ufgDbijYoqG37B/o9HmzD50lDgYW6mxPzFWtAXRv5bMGh5fsDFlY4z6HTXyHXG4Cy5ea
	i2nG6KIVR7H8awQsZ3y4mEXDCk4Xer2aKtG/510JvHbSx34ZitPoJSw4IvOar0ECBEhJ
	B8sTb1XKOoK/rOPHliHId4p1/dbofmHz+7/WLzKf/TNAKDMhZJOkXSNjdkkQY/uFyG6L
	BeVOHW+x5OXNzsiaIVDK/20CR4Rmzg9fcoJ02UKEwt/CqwPo9vXu9M0WiTK3rm9gOFvv
	0qSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=xvl6zLRces/SMktD691P47IbrnWKJFqGCaFx1dBAR4c=;
	b=Ptva5tTkcwD1eROjswelbYUXALGgjbXEOHuBR+fiGDDtYN5Ig1xnkUhkMOWI52ANUt
	gWNMYd2fayzFonvd1FH5yMzD+zkH5hA6s/Iq7aW+kjM+BZ9kC/Q/A7MBDvn2o8XZLBfd
	DEVhgHYQTQ3SuhIkiVPvx9pqO8IFzqLXPoYUpX0MB5f8KU5X4YjihJBWA5pyKbafR1Gz
	wKZbBsXO20eMLvtf55YquOrpPbFWUJ5PRShwoUYTY2l3hUZSqr8QzZnTGTYBW8EX4EDX
	2inlP53SnEO7o5ZFbWlGznbEFhjjoC86mqiM9/qtTER2pN4TyRcvyquxvk9bWY4RuY0G
	xT5w==
X-Gm-Message-State: APt69E0XlF3HJSpszJx4+D6Z+lDDEgM/EvG7hr0hdkILIvD12gXkdho9
	JrSBgxFPdoCdPspR0qi9eAn1kJjm4vbuSZnbXwU=
X-Google-Smtp-Source: ADUXVKLcsWI8JMYjI3W/7MJrH+3dUsUpja8ZS0DGEbFuy9oOfdCpcuvgpM6gz5TpzKIWHZliv+F2c8+DDsu8wsKktfM=
X-Received: by 2002:a19:f24e:: with SMTP id
	d14-v6mr17311457lfk.18.1529604286250; 
	Thu, 21 Jun 2018 11:04:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:4242:0:0:0:0:0 with HTTP; Thu, 21 Jun 2018 11:04:15
	-0700 (PDT)
In-Reply-To: <20180621180224.8312-6-f4bug@amsat.org>
References: <20180621180224.8312-1-f4bug@amsat.org>
	<20180621180224.8312-6-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Jun 2018 11:04:15 -0700
Message-ID: <CAKmqyKMgfiaLhQgKmSqewNzC6k1B5MfhNXThBScNoUcmyuuuBg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Alistair Francis <alistair@alistair23.me>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 05/11] hw/ssi/omap_spi: Use
 qemu_log_mask(GUEST_ERROR) instead of fprintf
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
X-List-Received-Date: Thu, 21 Jun 2018 18:04:51 -0000

On Thu, Jun 21, 2018 at 11:02 AM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/ssi/omap_spi.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/hw/ssi/omap_spi.c b/hw/ssi/omap_spi.c
> index 34163e5646..f278a55160 100644
> --- a/hw/ssi/omap_spi.c
> +++ b/hw/ssi/omap_spi.c
> @@ -20,6 +20,7 @@
>   * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
>   */
>  #include "qemu/osdep.h"
> +#include "qemu/log.h"
>  #include "hw/hw.h"
>  #include "hw/arm/omap.h"
>
> @@ -294,11 +295,15 @@ static void omap_mcspi_write(void *opaque, hwaddr a=
ddr,
>      case 0x2c: /* MCSPI_CHCONF */
>          if ((value ^ s->ch[ch].config) & (3 << 14))    /* DMAR | DMAW */
>              omap_mcspi_dmarequest_update(s->ch + ch);
> -        if (((value >> 12) & 3) =3D=3D 3)                  /* TRM */
> -            fprintf(stderr, "%s: invalid TRM value (3)\n", __func__);
> -        if (((value >> 7) & 0x1f) < 3)                 /* WL */
> -            fprintf(stderr, "%s: invalid WL value (%" PRIx64 ")\n",
> -                            __func__, (value >> 7) & 0x1f);
> +        if (((value >> 12) & 3) =3D=3D 3) { /* TRM */
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid TRM value (3)\n"=
,
> +                          __func__);
> +        }
> +        if (((value >> 7) & 0x1f) < 3) { /* WL */
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: invalid WL value (%" PRIx64 ")\n",
> +                          __func__, (value >> 7) & 0x1f);
> +        }
>          s->ch[ch].config =3D value & 0x7fffff;
>          break;
>
> --
> 2.18.0.rc2
>
>

