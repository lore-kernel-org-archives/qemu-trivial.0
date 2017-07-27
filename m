Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daa2P-0005DI-KK
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 00:04:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1daa2N-0005BQ-85
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 00:04:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1daa2M-0006kr-4l
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 00:04:35 -0400
Received: from ozlabs.org ([103.22.144.67]:60949)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1daa2E-0006UT-1u; Thu, 27 Jul 2017 00:04:26 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3xHyz95S68z9s7F; Thu, 27 Jul 2017 14:04:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1501128261;
	bh=JCl5qoOnZkwDvKkx0eNBa2XBpwJFxLeSPO7xTr2cPsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JuXiCIvRjx4lserrA/Dq83DQNxqk6ouYfHB3isRPaW7HQdv6wcnpc9qNcH3ZPfiQc
	KKC/ePK7JNFCUR7xaxlyopSN9c1pyibIfwbx0KoEUgc8hPrLFqgXGO5gtTU2Ygavrr
	P1A/BhYuHegrPw6NsQp4/q0O/sOfdz2OhFl4y4M4=
Date: Thu, 27 Jul 2017 13:43:04 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
Message-ID: <20170727034304.GJ8978@umbus.fritz.box>
References: <20170727024224.22900-1-f4bug@amsat.org>
	<20170727024224.22900-19-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IdGNrZu1oYcejyEu"
Content-Disposition: inline
In-Reply-To: <20170727024224.22900-19-f4bug@amsat.org>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-trivial] [PATCH for 2.10 v2 19/20] spapr_vio: fix
 overflow of qdevs in spapr_dt_vdevice()
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
X-List-Received-Date: Thu, 27 Jul 2017 04:04:36 -0000


--IdGNrZu1oYcejyEu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2017 at 11:42:23PM -0300, Philippe Mathieu-Daud=E9 wrote:
> sizeof(ptr) was used instead of sizeof(struct)...
>=20
> also use g_malloc_n() which take care of possible type overflow.
>=20
> hw/ppc/spapr_vio.c:641:22: warning: The code calls sizeof() on a pointer =
type. This can produce an unexpected result
>     qdevs =3D g_malloc(sizeof(qdev) * num);
>                      ^     ~~~~~~
> hw/ppc/spapr_vio.c:648:23: warning: The code calls sizeof() on a pointer =
type. This can produce an unexpected result
>     qsort(qdevs, num, sizeof(qdev), compare_reg);
>                       ^     ~~~~~~
>=20
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Nack.

Have a closer look, what's going in the array really is pointers, not
structures.  This is a false warning from clang, we need to find a
different way to suppress it.

> ---
>  hw/ppc/spapr_vio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
> index ea3bc8bd9e..9991b44c9f 100644
> --- a/hw/ppc/spapr_vio.c
> +++ b/hw/ppc/spapr_vio.c
> @@ -638,14 +638,14 @@ void spapr_dt_vdevice(VIOsPAPRBus *bus, void *fdt)
>      }
> =20
>      /* Copy out into an array of pointers */
> -    qdevs =3D g_malloc(sizeof(qdev) * num);
> +    qdevs =3D g_malloc_n(num, sizeof(*qdev));
>      num =3D 0;
>      QTAILQ_FOREACH(kid, &bus->bus.children, sibling) {
>          qdevs[num++] =3D kid->child;
>      }
> =20
>      /* Sort the array */
> -    qsort(qdevs, num, sizeof(qdev), compare_reg);
> +    qsort(qdevs, num, sizeof(*qdev), compare_reg);
> =20
>      /* Hack alert. Give the devices to libfdt in reverse order, we happen
>       * to know that will mean they are in forward order in the tree. */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IdGNrZu1oYcejyEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAll5YUUACgkQbDjKyiDZ
s5KdqA/+Me5dX6ibxNQB//oGlcHoOmebpds2r6kFoa4RmZ62BCVknjEOIZlbfdIP
Nhch9u7dSNalGOkaI2FhrooEAxegKif7lHh5y0q7ZvEuhj9HLkuzP7Oz9MAkxTT9
mfvGBembblTO9HU1geCopg5O14JEWvSTPRnrZJtHVo5QfoLcl6WAiEBCUjffg3Y+
pk0HQ4gcHC/H+13BVtr5YxoPHQSDy9c/YMhYMzp+A5ntiXkoWNLrL764RhN7n0Eq
YluCQwAA9xTFXPx9kGgqHsx+sbZ6uAdS7lyzJme1zRNaNfWvxPJDiim7WdfWe/yK
8QiJwD9IFnvbQ5j7Cn/Sy6c1M+a/DrfHixx7X+CPKGcoFpXmMLtnmLTeuPHaiwnu
mXYXFZoNbPSpvEAUV/spzwANyOROEwK2dlEOO2dVM9CqFXtLEK6FZAckzGBfy2Kf
K+4zTUGc/cSB9Z4siBOH1+vMpToPyKW97AIHkYBBwYUHW0t1/6hdRXIp05rsuzvq
qviDnK/TIKY9TChgKKu7+rtv24dimamzLzpPcO7YozLHw2Ejf/w6H7WIDCQj0Da0
KC7BpgpLOynkyh9KrFEbTBGa4wulPE0Ly3ScEObF+vLGR+ReWKuo//A5GWhA1SlV
8FyPWFb635p2W+e0bwmz9/rlzxQGIUpTiUFGD34CwbA76SmO+Lc=
=5mGs
-----END PGP SIGNATURE-----

--IdGNrZu1oYcejyEu--

