Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h5L7G-0005IA-Fe
	for mharc-qemu-trivial@gnu.org; Sat, 16 Mar 2019 22:01:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1h5L7E-00056y-Cr
	for qemu-trivial@nongnu.org; Sat, 16 Mar 2019 22:01:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1h5KtO-0005Zx-5t
	for qemu-trivial@nongnu.org; Sat, 16 Mar 2019 21:47:15 -0400
Received: from ozlabs.org ([203.11.71.1]:39229)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1h5KtL-0005Lw-8U; Sat, 16 Mar 2019 21:47:12 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 44MMcY6q6Fz9s4Y; Sun, 17 Mar 2019 12:46:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1552787213;
	bh=WZ0sTc4LOu8Jciwbe+N++5LL4dQ467MJQsEMNyI+Awo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MrOJSjuU2wT9gbiJfaRjgSXrdEX4A9SUpk4aAl8rt1W2eNX6C4rsZQjsWgf0n1O4M
	qvZ27oScfW0lWnaprM2vYzS3TprCdeooFeghstQA7IbpcYaBNxRyDE4fxYOjpR4hxD
	ti2CmtcqUaSb3M1mYqSrPb8tZSg1Lx3lvFQmH4i4=
Date: Sun, 17 Mar 2019 12:25:04 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>
Message-ID: <20190317012504.GA8154@umbus.fritz.box>
References: <20190316201528.9140-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline
In-Reply-To: <20190316201528.9140-1-philmd@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-trivial] [PATCH] hw/ppc/prep: Drop useless inclusion of
 "hw/input/i8042.h"
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
X-List-Received-Date: Sun, 17 Mar 2019 02:01:33 -0000


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 16, 2019 at 09:15:28PM +0100, Philippe Mathieu-Daud=E9 wrote:
> In commit 47973a2dbf we split the last generic chipset out of
> the PC board, but missed to remove the i8042 keyboard controller.
> This omission was later fixed in commit 7cb00357c1, but here we
> forgot to remove the "i8042.h" include. Do it now.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Applied to ppc-for-4.1.

> ---
>  hw/ppc/prep.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
> index 847d320465..b7f459d475 100644
> --- a/hw/ppc/prep.c
> +++ b/hw/ppc/prep.c
> @@ -40,7 +40,6 @@
>  #include "hw/ide.h"
>  #include "hw/loader.h"
>  #include "hw/timer/mc146818rtc.h"
> -#include "hw/input/i8042.h"
>  #include "hw/isa/pc87312.h"
>  #include "hw/net/ne2000-isa.h"
>  #include "sysemu/arch_init.h"

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlyNoe0ACgkQbDjKyiDZ
s5IXZw//dlWp2CUNgAyrD4q3Ig+il0RUb74j2L/YqKUCz/goaR/L9oTxaS2scVKX
yWCMNLH0Y9K7nH6mnwOPdjAWWZIy8xhGK8r2VMnhL6bMYLfUmSb4lWqHe4NKM48V
4sZ1A6yHbbE4oN8167+5oVicC0K3rKX76dmoaYYPYiMmcLJONqYH8R28O48C+ZYl
frLaQQmD22K6/BusS/7R7fFf+izVLLEd5uCl7t2tdWsN7udAP87A5vmyJYDq6Nhr
naVuYEGSa2e6TCGgOIKqPianGC5RLoJC3z8ofrHQ+rJZqUFwdkwHG6yY4y9RpbTv
33M16LiqvCZO40uzD1ns2KLQOttJxaDF+sLP3X0iI96I0l8zhtdByUzlV70vHO2T
UTUMRaAW6+02NOECQiLe661kmKOE+ClhTT21tkVnzX/hmXT/G93rAPK71uVAtX0/
mRn28j9b6HXR46JGNXCx+TyW9zKWNweelZPVpnYZeaQImpuDbl8wuoe9FSRREWY7
7Bmt35TlZfDz9oh5xFxB0/2wcFHXc+3Gb2PTqS6MuY008Fs/MuaIlS5zD33zq/f9
qOtaY/ux+hVCl4UrJJvL9FQOeKPH2qiW+xqK3WSCYbMhELT87qbqV8kmQ64Co2S+
vlNOpDxYr3AvGnw4q5NY/Hlyt2qDpcEMaPz0pJ+/mDK5BruXmz4=
=ip9i
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--

