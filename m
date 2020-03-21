Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFdiF-0004ET-JZ
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 08:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45279)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jFdiC-00045l-Jt
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 08:58:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jFdiB-0003JA-9i
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 08:58:48 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:44100)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jFdi1-0002Vg-Kg; Sat, 21 Mar 2020 08:58:38 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id F0227747871;
 Sat, 21 Mar 2020 13:58:33 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CF6537476D5; Sat, 21 Mar 2020 13:58:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CD57D7475F6;
 Sat, 21 Mar 2020 13:58:33 +0100 (CET)
Date: Sat, 21 Mar 2020 13:58:33 +0100 (CET)
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
Subject: Re: [PATCH-for-5.0 04/11] hw/input/adb-kbd: Remove dead assignment
In-Reply-To: <20200321114615.5360-5-philmd@redhat.com>
Message-ID: <alpine.BSF.2.22.395.2003211347330.82121@zero.eik.bme.hu>
References: <20200321114615.5360-1-philmd@redhat.com>
 <20200321114615.5360-5-philmd@redhat.com>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-964345878-1584795513=:82121"
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
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
X-List-Received-Date: Sat, 21 Mar 2020 12:58:49 -0000

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-964345878-1584795513=:82121
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Sat, 21 Mar 2020, Philippe Mathieu-Daud=C3=A9 wrote:
> Fix warning reported by Clang static code analyzer:
>
>    CC      hw/input/adb-kbd.o
>  hw/input/adb-kbd.c:200:5: warning: Value stored to 'olen' is never rea=
d
>      olen =3D 0;
>      ^      ~
>
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> hw/input/adb-kbd.c | 1 -
> 1 file changed, 1 deletion(-)
>
> diff --git a/hw/input/adb-kbd.c b/hw/input/adb-kbd.c
> index 0ba8207589..b0565be21b 100644
> --- a/hw/input/adb-kbd.c
> +++ b/hw/input/adb-kbd.c
> @@ -197,7 +197,6 @@ static int adb_kbd_poll(ADBDevice *d, uint8_t *obuf=
)
>     int keycode;
>     int olen;
>
> -    olen =3D 0;
>     if (s->count =3D=3D 0) {
>         return 0;
>     }

Is this variable still needed at all? Looks like it's a remnant after=20
a1f4971863 that can now only return 0 or 2 so you could just remove this=20
variable and return 2 where now it's assigned as 2 or change return olen=20
at the end to return 2 or maybe keep olen and change the return 0 above t=
o=20
return olen to silence warning but I think this could be cleaned up.

Regards,
BALATON Zoltan
--3866299591-964345878-1584795513=:82121--

