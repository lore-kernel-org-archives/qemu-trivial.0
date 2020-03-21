Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFdoT-0006Vp-4w
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 09:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46120)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jFdoQ-0006Rc-FX
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 09:05:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jFdoP-0001d4-Au
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 09:05:14 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:25240)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jFdoG-0000bi-JP; Sat, 21 Mar 2020 09:05:04 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D56DA7476D5;
 Sat, 21 Mar 2020 14:04:59 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B3F187475F6; Sat, 21 Mar 2020 14:04:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B1BAB746381;
 Sat, 21 Mar 2020 14:04:59 +0100 (CET)
Date: Sat, 21 Mar 2020 14:04:59 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>, 
 Andrew Jeffery <andrew@aj.id.au>, Andrzej Zaborowski <balrogg@gmail.com>, 
 Laurent Vivier <laurent@vivier.eu>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Igor Mitsyanko <i.mitsyanko@gmail.com>, 
 David Gibson <david@gibson.dropbear.id.au>, 
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>, 
 Fam Zheng <fam@euphon.net>, qemu-trivial@nongnu.org, 
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, 
 qemu-ppc@nongnu.org, =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, 
 Kevin Wolf <kwolf@redhat.com>, Joel Stanley <joel@jms.id.au>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-arm@nongnu.org
Subject: Re: [PATCH-for-5.0 05/11] hw/ide/sii3112: Remove dead assignment
In-Reply-To: <20200321114615.5360-6-philmd@redhat.com>
Message-ID: <alpine.BSF.2.22.395.2003211400040.82121@zero.eik.bme.hu>
References: <20200321114615.5360-1-philmd@redhat.com>
 <20200321114615.5360-6-philmd@redhat.com>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-68472195-1584795899=:82121"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Mar 2020 13:05:15 -0000

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-68472195-1584795899=:82121
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Sat, 21 Mar 2020, Philippe Mathieu-Daud=C3=A9 wrote:
> Fix warning reported by Clang static code analyzer:
>
>    CC      hw/ide/sii3112.o
>  hw/ide/sii3112.c:204:9: warning: Value stored to 'val' is never read
>          val =3D 0;
>          ^     ~
>
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> hw/ide/sii3112.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
> index 06605d7af2..36f1905ddb 100644
> --- a/hw/ide/sii3112.c
> +++ b/hw/ide/sii3112.c
> @@ -125,7 +125,7 @@ static uint64_t sii3112_reg_read(void *opaque, hwad=
dr addr,
>         val =3D (uint32_t)d->regs[1].sien << 16;
>         break;
>     default:
> -        val =3D 0;
> +        break;
>     }
>     trace_sii3112_read(size, addr, val);
>     return val;

Value is clearly used in trace and return so don't really get why the=20
compiler complains here. Looks like wrong warning to me. It's true howeve=
r=20
that since val is init to 0 at the beginning this assignment is not=20
strictily needed and this should work as well, so

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

Regards,
BALATON Zoltan
--3866299591-68472195-1584795899=:82121--

