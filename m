Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V3KIw-0006SH-JY
	for mharc-qemu-trivial@gnu.org; Sun, 28 Jul 2013 02:18:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1V3KIq-0006Q1-7M
	for qemu-trivial@nongnu.org; Sun, 28 Jul 2013 02:18:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1V3KIh-0006eJ-G4
	for qemu-trivial@nongnu.org; Sun, 28 Jul 2013 02:18:00 -0400
Received: from mout.web.de ([212.227.15.4]:59154)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1V3KIh-0006e7-6P
	for qemu-trivial@nongnu.org; Sun, 28 Jul 2013 02:17:51 -0400
Received: from mchn199C.mchp.siemens.de ([95.157.58.223]) by smtp.web.de
	(mrweb002) with ESMTPSA (Nemesis) id 0M8hdL-1U8rja37ml-00wGke for
	<qemu-trivial@nongnu.org>; Sun, 28 Jul 2013 08:17:50 +0200
Message-ID: <51F4B78D.3010203@web.de>
Date: Sun, 28 Jul 2013 08:17:49 +0200
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1374990895-25584-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1374990895-25584-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.2
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="3DwkggDSNg2weBDFKiVS2IuTLvnf6OB15"
X-Provags-ID: V03:K0:d42cB8KQI1rg1dKcFgX7JAZX/Xl60EV0GvuJl1pbdRBt1FvioL9
	VBGwepOg7MI77WODOZTk5uZ10xCmx3zOJF80zxyb0q6olX0mqmOt+XWgx4S8PXmbWmsi/6K
	GxARO+cmk9OVFOs/2CjRiXq7MtPnAjg7r3pIforqkp2KY6g//rFU/ieJxC7/n8CUfnvSVV/
	jbLYHt00sHGslJg2ogHsg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 212.227.15.4
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH] musicpal: Fix typo in name of local
	function
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
X-List-Received-Date: Sun, 28 Jul 2013 06:18:06 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3DwkggDSNg2weBDFKiVS2IuTLvnf6OB15
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2013-07-28 07:54, Stefan Weil wrote:
> The misspelling was spotted by Andreas F=C3=A4rber.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/arm/musicpal.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
> index b06d442..ddddd27 100644
> --- a/hw/arm/musicpal.c
> +++ b/hw/arm/musicpal.c
> @@ -534,7 +534,7 @@ static void lcd_invalidate(void *opaque)
>  {
>  }
> =20
> -static void musicpal_lcd_gpio_brigthness_in(void *opaque, int irq, int=
 level)
> +static void musicpal_lcd_gpio_brightness_in(void *opaque, int irq, int=
 level)
>  {
>      musicpal_lcd_state *s =3D opaque;
>      s->brightness &=3D ~(1 << irq);
> @@ -619,7 +619,7 @@ static int musicpal_lcd_init(SysBusDevice *dev)
>      s->con =3D graphic_console_init(DEVICE(dev), &musicpal_gfx_ops, s)=
;
>      qemu_console_resize(s->con, 128*3, 64*3);
> =20
> -    qdev_init_gpio_in(&dev->qdev, musicpal_lcd_gpio_brigthness_in, 3);=

> +    qdev_init_gpio_in(&dev->qdev, musicpal_lcd_gpio_brightness_in, 3);=

> =20
>      return 0;
>  }
>=20

Reviewed-by: Jan Kiszka <jan.kiszka@web.de>


--3DwkggDSNg2weBDFKiVS2IuTLvnf6OB15
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlH0t40ACgkQitSsb3rl5xSZdwCgiAF0palJfdAVK+XMiVjh1Ojl
6CsAnjmyDBSd6E9X2CYigIMED+YhlmUv
=R9d5
-----END PGP SIGNATURE-----

--3DwkggDSNg2weBDFKiVS2IuTLvnf6OB15--

