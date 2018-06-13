Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fT36h-0004tx-4q
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jun 2018 06:34:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1fT36d-0004s8-Tj
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 06:34:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1fT36b-00068h-HI
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 06:34:22 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:50763)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1fT36V-000630-DQ; Wed, 13 Jun 2018 06:34:16 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 415NQp1dl9z9s0W; Wed, 13 Jun 2018 20:34:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1528886050;
	bh=iWN5pv7tDwYVOZuieXHD1hJijK4Ok6SwXjUT0A1y0Ws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DqicTgMtYzd9BFBHGHykKZC/FrrD1f6yKTNzUXnYx0TEiqlAZlMizowXiPb8HhVMk
	6xTk/lizAnKiIxlAl3o8ko+EhM8qlXhCuLDAUnh+E/KWNbjYjK0ynUoO/x74Mm+i8C
	IueKBXAXx3vFeZa8PR8HuUP84uwZSMZsMavmCAAw=
Date: Wed, 13 Jun 2018 20:34:02 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Jonathan Marler <johnnymarler@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alexander Graf <agraf@suse.de>, QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Message-ID: <20180613103402.GM30690@umbus.fritz.box>
References: <CACKT+Ap2MHCrSCT-0_=KG9UrGAtO7F3EGue6-63-XJxry9=C=w@mail.gmail.com>
	<CAFEAcA-nnU2E6CKPiGqoAq1sSYtvf4Hxp3MtYiCvigr4i8-+Ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OE2a2PUdqti0gBVO"
Content-Disposition: inline
In-Reply-To: <CAFEAcA-nnU2E6CKPiGqoAq1sSYtvf4Hxp3MtYiCvigr4i8-+Ow@mail.gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] handle all
 fdt_get_phandle_errors
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
X-List-Received-Date: Wed, 13 Jun 2018 10:34:25 -0000


--OE2a2PUdqti0gBVO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 14, 2018 at 04:56:54PM +0100, Peter Maydell wrote:
> On 4 May 2018 at 19:37, Jonathan Marler <johnnymarler@gmail.com> wrote:
> > Signed-off-by: Jonathan Marler <johnnymarler@gmail.com>
>=20
> Hi; thanks for this patch.
>=20
> > ---
> >  device_tree.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/device_tree.c b/device_tree.c
> > index 52c3358..2b75905 100644
> > --- a/device_tree.c
> > +++ b/device_tree.c
> > @@ -379,8 +379,12 @@ uint32_t qemu_fdt_get_phandle(void *fdt, const char
> > *path)
> >
> >      r =3D fdt_get_phandle(fdt, findnode_nofail(fdt, path));
> >      if (r =3D=3D 0) {
> > -        error_report("%s: Couldn't get phandle for %s: %s", __func__,
> > -                     path, fdt_strerror(r));
> > +        error_report("%s: Node %s does not have a 'phandle'", __func__,
> > +                     path);
> > +        exit(1);
> > +    }
> > +    if (r =3D=3D -1) {
> > +        error_report("%s: Couldn't get phandle for %s", __func__, path=
);
> >          exit(1);
> >      }
>=20
> Could you explain in what situation this is needed? The documentation
> for fdt_get_phandle() says
>  * returns:
>  *      the phandle of the node at nodeoffset, on success (!=3D 0, !=3D -=
1)
>  *      0, if the node has no phandle, or another error occurs
>=20
> which I interpret to mean that it is not possible for it to return -1.

I *think* that was the intention; it's a long time since I wrote it,
so I'm not sure.  However, looking at the implementation, that's not
strictly the case.

We certainly return 0 for any error we explicitly detect.  However, if
the node has a "phandle" property that's correctly formed but contains
-1, then we'll return -1.  Of course, a correct dt blob won't have
such a property, but then we do detect a bunch of other conditions
that a correct dt shouldn't have.

On balance, I'm thinking I should probably change libfdt to check for
a -1 phandle property and return 0 for that case, like all other error
cases.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--OE2a2PUdqti0gBVO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlsg8xcACgkQbDjKyiDZ
s5Kb+A//TxGHEM7Z4gJ5lOaA9h4OnOvfHOHkzCoeUK/kN+h2jI4QdQomDaJSMDfd
Bu5G+Ojd1F3i9gKYE0is9HCXk0l/QlLE71H26VLfzUoEbAIBj2rrnPy4oU7eIIcs
ENp1T7DWojjij32bpD7tnpE/HDPzp/Ab8c3bZjZcoePRSzBv9AqQbNwt2SNn4DHr
i4Ml9iXTNaPkw+AUa31rIgFplNHli6y5TGA/p4nEtmDtv8kgJDl9h7s92PaBjmib
olyQaCeVkLZj4wTqBrMxpaNb7vmdYprUwiGU1HLPNuYMsSEhmJh9ug+jGJM0m/HT
PxpH3ehf4ikkOM7TVSHVmNskBkjQ9SP1JXRyzmaZUkY3MvAk+iMpgHka82M3MH76
5WgIZONVxPaRI5vS0eANhqB8xj3bxp5lY6BWzwNQ8u6DhpK3mx4gLuXbz8Ah9Z4j
DWJYEKO2w6uBruq8D7X3CvpP8lqDLywv/fvHW8itice+q+z2GJgQ2UW2fuf0Fwjx
4y2LxzFnnAuMMo4q5mY4NB+y+7uNJSTG5rxooBXzEt4SAFf3qynSJ9lNA/uRxCtJ
fV49krPMePs1s/6O52hvQ1lDeX8fYJS4AT9d6fUxDur9GJJWylLcDHiw+fI75ptP
zAII+IyTaFPIRB0DULUYdB+64JTEjOIgj/POhci9dlEOUTxk29A=
=kl1o
-----END PGP SIGNATURE-----

--OE2a2PUdqti0gBVO--

