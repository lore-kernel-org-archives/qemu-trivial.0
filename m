Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqqm9-0002S6-4e
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 21:47:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38235)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gqqm6-0002Pb-De
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 21:47:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gqqm5-0001F0-Gs
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 21:47:50 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:36097)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gqqlh-0000wl-46; Mon, 04 Feb 2019 21:47:27 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 43tprd26Znz9sMx; Tue,  5 Feb 2019 13:47:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1549334833;
	bh=lB9QwBzk43KxXJh86tHpbB9//F779U7VtJsDRdsd+2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=muojsT386zSZhQ5rhx8LKgxc9Zsq/I5s4UDq7HAZ1IC0T3BsTAWbITRUztJqCeHjs
	bJKlCsl9h4a5VGb/rdfQKTcb29q/xu5AR15m+ymYJ0se0AbqlWMpcgiRMVd9JtJd4t
	GZcrjBiTRG5ClzmTs5B8rqA3T8vLd96cqyDJBoqI=
Date: Tue, 5 Feb 2019 13:25:03 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
	Artyom Tarasenko <atar4qemu@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <20190205022503.GC22661@umbus.fritz.box>
References: <20190204210433.26088-1-philmd@redhat.com>
	<20190204210433.26088-4-philmd@redhat.com>
	<38f72fdf-2260-e886-7d60-0fd169545255@reactos.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Content-Disposition: inline
In-Reply-To: <38f72fdf-2260-e886-7d60-0fd169545255@reactos.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-trivial] [PATCH 3/3] hw/ppc/prep: Drop useless inclusion
 of "hw/i386/pc.h"
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
X-List-Received-Date: Tue, 05 Feb 2019 02:47:51 -0000


--s9fJI615cBHmzTOP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 04, 2019 at 10:11:07PM +0100, Herv=E9 Poussineau wrote:
> Le 04/02/2019 =E0 22:04, Philippe Mathieu-Daud=E9 a =E9crit=A0:
> > In 47973a2dbf we split the last generic chipset out of the PC
> > board, but forgot to remove the include of "hw/i386/pc.h".
> > Since it is now unused, remove it.
> >=20
> > Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
>=20
> Reviewed-by: Herv=E9 Poussineau <hpoussin@reactos.org>

Applied to ppc-for-4.0, thanks.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlxY8/8ACgkQbDjKyiDZ
s5INQg/+PO68aQxEssUaMrKsMY1Z+/zARYZPp4EgjoUBjmZAp35ZPPtf9Q8fpcsR
Squlz3s8Zw2KSrC/Hk5WnqXu1REfUWRZx42fQCf3ECO412SdL2YmrilH2mUz06pp
dleW8P9yV/Z1y6F4tKm+Ydoan5V3Uxot9ZmB/ZJjqYKCqGv0wV5evc40z4TSeWPw
Sebq2VyRtDzk63T72QjDSuvnNsqsi1to0hd1M+c2/O/WnIH35nadq4x8+1/XVXOz
tjTsJF+O6nIhGVaRjyiDmlk9FQ6psR1BPxiRwOQ5obpWwrXGj/1z2e8UAkCdltHj
TNGAo78iabmrQSnvXDmlqas7ktiDiX2xjrOzCqgfoxS1Pm3sUjZreY1C/PG7352s
tgnYk2rmvwAJXD1sQLGJNwceAE0aJG8IP2Cs0lByKbL2gBQVj4550SMquvJcZMkz
PaTA6r2FVG9CyWsnSb5M+SJntEzKHY1HTNGDteYFM/k+2VpBppNyHc646qnECXkA
jk1FbK9EpOIsk6XHC1xMKC2YT/W0qwcgbtrcZrZJOo9O5uAk2aLXIrPmKI87Ce2W
Cyd8s0+6A0na5ZnVlVBYfwNjutfG8Snv0tCOS5/i0zavEcpib8uBHsw1XBC99P2M
34Fp7l3GE87s4SmTvIvUUP5GVBEzGVM+nofbdNkwr66AtnCK5/g=
=dePH
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--

