Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eh3Y9-00064M-TF
	for mharc-qemu-trivial@gnu.org; Wed, 31 Jan 2018 20:20:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1eh3Y8-00063E-7s
	for qemu-trivial@nongnu.org; Wed, 31 Jan 2018 20:20:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1eh3Y7-0006pZ-2o
	for qemu-trivial@nongnu.org; Wed, 31 Jan 2018 20:20:24 -0500
Received: from ozlabs.org ([103.22.144.67]:47531)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1eh3Y1-0006hu-H5; Wed, 31 Jan 2018 20:20:18 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3zX2NX3qR0z9sP9; Thu,  1 Feb 2018 12:20:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1517448012;
	bh=NCoFnAhVrYFNqiR/BJam76onmyeommt1Ht3W4m8csR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cF8OQJdfRI5rvowf1IDzb15tqHa/b0wUf2egzNHahrp3X3uiBrmTkqBRP17QU39rJ
	uLnsAtMAz7834Z5ypn8NpmOWgXHgg+ghhpKXbwX7NjhLUconFHRx4QmsxZTlsBhjEH
	0ad67ya6GSuSYfw4MqV4kJ1xcVwAwyvdBpDASico=
Date: Wed, 31 Jan 2018 06:49:35 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20180130194935.GL12900@umbus>
References: <20180130131716.5899D7456D5@zero.eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q6mBvMCt6oafMx9a"
Content-Disposition: inline
In-Reply-To: <20180130131716.5899D7456D5@zero.eik.bme.hu>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-trivial] [PATCH] sii3112: Change angle brackets to quotes
 in #include lines
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
X-List-Received-Date: Thu, 01 Feb 2018 01:20:25 -0000


--q6mBvMCt6oafMx9a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2018 at 02:10:10PM +0100, BALATON Zoltan wrote:
> This matches what other files do for qemu includes
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Applied, thanks.

> ---
>  hw/ide/sii3112.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
> index 17aa930..e3896c6 100644
> --- a/hw/ide/sii3112.c
> +++ b/hw/ide/sii3112.c
> @@ -12,8 +12,8 @@
>   * http://wiki.osdev.org/User:Quok/Silicon_Image_Datasheets
>   */
> =20
> -#include <qemu/osdep.h>
> -#include <hw/ide/pci.h>
> +#include "qemu/osdep.h"
> +#include "hw/ide/pci.h"
>  #include "trace.h"
> =20
>  #define TYPE_SII3112_PCI "sii3112"

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--q6mBvMCt6oafMx9a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpwzEwACgkQbDjKyiDZ
s5I3Jw/+Lqjx2XjqZARB/sUxhIi2JLstx0+GbDv/rVc6cni7k4qYIVdFFXjs4lGJ
4dzzBjXlgC2wnL18ljEy2+QlqeEbC4WORplwTzWi/IUDiLxYm39qGTUazFSGgzFw
DRkhdeiMnKUXSxLGmbyQpVR+oSYYdQn/aVvs9G9jPBdPYJm9RFBiu4N8hqIzTjdL
jwsC8YIWJnzlCdY77YKpbqCdgiR3GgoDqaaGk+Z8jcalhdGO2qau6MQo37XQohfF
OYhaqaXAkNvFiGf5wX6IujDMUN7D72KDNjHh4w2a1cLoBiFRLb0d01iJ5p9rQOgM
lXbvSiPQ/vFVYukNr1CNQ0pTKd6Rle86h1hG6l0eYhrBu6l+LRD1mdKd9CspohDb
CZbqkhORWA4hNlESP4jeO9joJCP/qcWrMRFIN1IrJ31abaPrRon2qSur9ej0LyJZ
Cj5WSlzV++jCWOuqxlhKssvT25KY/2vN8aHmA23qJi912T3nPt9LsuTUeVESJrLm
aBewaxfTGC2Awv2tUJ2Q1b+ny27LrITr9zSpJ9pcIJbtElNO+kT7Dffvk664xKPW
Zw54Vo9eIRVWWJsX/dwwwY9WQFGS9MlmzbOaUMp5Q9uVvTt79gcCyZhd3DD0Psj+
IVvtg+fG+0401KWqTj1LE/zkFHysdj+jG0McY014+xV2b6Iuk4k=
=WhmF
-----END PGP SIGNATURE-----

--q6mBvMCt6oafMx9a--

