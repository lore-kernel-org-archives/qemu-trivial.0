Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQkUL-0001hd-6p
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jun 2018 22:17:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1fQkUH-0001ft-LT
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 22:17:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1fQkUG-0001kX-Jo
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 22:17:17 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:46197)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1fQkUB-0001di-9r; Wed, 06 Jun 2018 22:17:12 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 411Th04W2Pz9s1B; Thu,  7 Jun 2018 12:17:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1528337824;
	bh=kyMUQXftbQPQmiKugO9AtcTYhN+oR2V9CKbzTtOOIro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JHA7erXvwuONKr8YJV25qnDcY+OMGiWrS6e5V36IWztdkfx1KM9s/Z4soZ8nL20KV
	iOCAEstAYOmiuYdrK59Iq4YPh700Y875s83xiumbDY7dQHxD0A2JlgXGHAhJWN0vVq
	bJJCo4LI/O8elCkdsGdZMh0gh8nU/GmIcld+YCd8=
Date: Thu, 7 Jun 2018 12:16:58 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
Message-ID: <20180607021658.GB3166@umbus.fritz.box>
References: <20180606152128.449-1-f4bug@amsat.org>
	<20180606152128.449-5-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QTprm0S8XgL7H0Dt"
Content-Disposition: inline
In-Reply-To: <20180606152128.449-5-f4bug@amsat.org>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-trivial] [PATCH 04/11] ppc/pnv: Add trailing '\n' to
 qemu_log() calls
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
X-List-Received-Date: Thu, 07 Jun 2018 02:17:19 -0000


--QTprm0S8XgL7H0Dt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 06, 2018 at 12:21:21PM -0300, Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

I'm not really sure what series this was part of, but I've applied it
to ppc-for-3.0 anyway.

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/pnv_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
> index cbb64ad9e7..13ad7d9e04 100644
> --- a/hw/ppc/pnv_core.c
> +++ b/hw/ppc/pnv_core.c
> @@ -97,7 +97,7 @@ static uint64_t pnv_core_xscom_read(void *opaque, hwadd=
r addr,
>          val =3D 0x24f000000000000ull;
>          break;
>      default:
> -        qemu_log_mask(LOG_UNIMP, "Warning: reading reg=3D0x%" HWADDR_PRI=
x,
> +        qemu_log_mask(LOG_UNIMP, "Warning: reading reg=3D0x%" HWADDR_PRI=
x "\n",
>                    addr);
>      }
> =20
> @@ -107,7 +107,7 @@ static uint64_t pnv_core_xscom_read(void *opaque, hwa=
ddr addr,
>  static void pnv_core_xscom_write(void *opaque, hwaddr addr, uint64_t val,
>                                   unsigned int width)
>  {
> -    qemu_log_mask(LOG_UNIMP, "Warning: writing to reg=3D0x%" HWADDR_PRIx,
> +    qemu_log_mask(LOG_UNIMP, "Warning: writing to reg=3D0x%" HWADDR_PRIx=
 "\n",
>                    addr);
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QTprm0S8XgL7H0Dt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlsYlZoACgkQbDjKyiDZ
s5Jktw//VPA1ICRkTZPd+upQLafmM3DOvW6KnODw4b9J2pByVSuP2LBboor0GGE9
n8ko0gPheyxHDYw20VbZywAhaBAJofago4wAOoFZAegbB+r+6ilbviru76xfB8gj
C+BVKMEEc5wmg6aNkeJXyk+aNfL3UBxq7bj+XZz/jGKyjB/KwQY+cGIamj4QlsRm
1ft5LAIjLiRqeQrVqV7iWl2Z9MMZsmEzCJhxklBh3BRwR6u+DGFmyzDh61eoDwXM
pBj0egGXq51kQM1GUGSjdR5BcwsI2cLuXZDHWt/MC/TsC4QViYqA2tQYThWM629+
BP15+LZOcpY9xegkKht0Ja69TJ6JFeprabB8aHxA1ReaBwid///tKgpRla90Z1B5
Xqpp3YzG+GcvQV7dfa/9AOuCplp4ljDW4wHX2e/aYdaZr/9KdPdgz5aCmpFFm8Do
WtDyvuPNpMjwu/5hW5+LHiNnFV87sopjSt32Fu7EhUF4HtnLsWmxfLOD0VP0zAG/
4Ymwc5vZuRlDmjQr5GpcjbcSBC6ehqcIyG5yjBCD4XliHiTVyTHsq8H5m/p14n7I
XTvPEu5cZCKgND/3I91VcS3YOFCZmWc0F6gemeos+FJ6HCczKkzHpXhycwAihQK2
fsYuykeWMeNzsXGNjqdOI8rrk6uMIYUTIWSqYAuKPLDnyHI1wig=
=ayVj
-----END PGP SIGNATURE-----

--QTprm0S8XgL7H0Dt--

