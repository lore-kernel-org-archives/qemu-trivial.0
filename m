Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T45tl-00053F-Cp
	for mharc-qemu-trivial@gnu.org; Wed, 22 Aug 2012 04:02:45 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1T45td-00051z-MK
	for qemu-trivial@nongnu.org; Wed, 22 Aug 2012 04:02:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1T45tX-0000FG-Mb
	for qemu-trivial@nongnu.org; Wed, 22 Aug 2012 04:02:37 -0400
Received: from mout.web.de ([212.227.17.11]:63451)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1T45tX-0000F7-Cz; Wed, 22 Aug 2012 04:02:31 -0400
Received: from mchn199C.mchp.siemens.de ([95.157.56.37]) by smtp.web.de
	(mrweb001) with ESMTPSA (Nemesis) id 0LkhQi-1Tc3jV20yC-00acZk;
	Wed, 22 Aug 2012 10:02:29 +0200
Message-ID: <5034920F.7030101@web.de>
Date: Wed, 22 Aug 2012 10:02:23 +0200
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <Pine.GSO.4.64.1208212331340.11653@mono>
In-Reply-To: <Pine.GSO.4.64.1208212331340.11653@mono>
X-Enigmail-Version: 1.4.3
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigD6E957840309594CF6512E9D"
X-Provags-ID: V02:K0:4CWPl7xo1C83QW2C09eWpsl164ZjufjgUV2nMEAe5qj
	VpxbZmYndIKzL/Qu4Vv6pTeeystT0n6n/7fpHlIx+rImikHPE1
	V0tI1tWjofyZ26WRzdaqr+Va2iXD+cER5eGn2e+byxEfaublYN
	KmTyqSXNVcabfoWNByXoKQ2HF4cBpkZJ2EIxQC7ncC6W6zsmJR
	D6CnDRRJ1DOPkd3piFBuQ==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.17.11
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Correct computation of bytes per pixel
 from bits per pixel
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
X-List-Received-Date: Wed, 22 Aug 2012 08:02:43 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigD6E957840309594CF6512E9D
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Can you use this free space to provide a scenario where the missing
round-up caused a problem?

On 2012-08-21 23:32, BALATON Zoltan wrote:
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  console.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/console.c b/console.c
> index 4525cc7..f698b77 100644
> --- a/console.c
> +++ b/console.c
> @@ -1612,7 +1612,7 @@ PixelFormat
> qemu_different_endianness_pixelformat(int bpp)
>      memset(&pf, 0x00, sizeof(PixelFormat));
>=20
>      pf.bits_per_pixel =3D bpp;
> -    pf.bytes_per_pixel =3D bpp / 8;
> +    pf.bytes_per_pixel =3D (bpp + 7) >> 3;

Compilers are smart enough to substitute such divisions by shift
operations but for humans the explicit form is easier to read. So please
keep it.

>      pf.depth =3D bpp =3D=3D 32 ? 24 : bpp;
>=20
>      switch (bpp) {
> @@ -1661,7 +1661,7 @@ PixelFormat qemu_default_pixelformat(int bpp)
>      memset(&pf, 0x00, sizeof(PixelFormat));
>=20
>      pf.bits_per_pixel =3D bpp;
> -    pf.bytes_per_pixel =3D bpp / 8;
> +    pf.bytes_per_pixel =3D (bpp + 7) >> 3;
>      pf.depth =3D bpp =3D=3D 32 ? 24 : bpp;
>=20
>      switch (bpp) {

Jan



--------------enigD6E957840309594CF6512E9D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAlA0kg8ACgkQitSsb3rl5xQbtwCg3bCVrdy131nK6KuhPv7n3bbp
ofUAnRoXqTc3ZQestiRbBVgSRxiCmHx8
=+oBk
-----END PGP SIGNATURE-----

--------------enigD6E957840309594CF6512E9D--

