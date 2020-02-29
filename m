Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7wkd-0003z0-JG
	for mharc-qemu-trivial@gnu.org; Sat, 29 Feb 2020 02:41:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35073)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j7wkb-0003w4-0g
 for qemu-trivial@nongnu.org; Sat, 29 Feb 2020 02:41:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j7wka-0006vS-1F
 for qemu-trivial@nongnu.org; Sat, 29 Feb 2020 02:41:28 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:57861)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j7wkT-0006bD-3O; Sat, 29 Feb 2020 02:41:22 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48TyyH6tGtz9sRQ; Sat, 29 Feb 2020 18:41:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582962071;
 bh=JnDgk9cG0azdmYFP0Vh5Ie0HMWdWQImcTF5M77KEuRk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZDad9ZsVYj35lGrmhgbXuC014YjTQLDuvQX4xD75SK1E1oOpfXsPUfywXzT0IiXs8
 egNpHbDxhl5X9GWxgvI/fBxijKtEIPpeu2KqryzzvchNVciHno02vJB2MJlMZuvwBj
 tBJw5yjh0+y7fLaSlq2XqWynnHsL+QzavxNEhIf4=
Date: Sat, 29 Feb 2020 18:22:15 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH] hw/ppc/pnv: Fix typo in comment
Message-ID: <20200229072215.GA90032@umbus.fritz.box>
References: <20200228123303.14540-1-philmd@redhat.com>
 <2d21f81c-e0bd-11aa-b27e-37c39d0c6e23@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline
In-Reply-To: <2d21f81c-e0bd-11aa-b27e-37c39d0c6e23@kaod.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
X-List-Received-Date: Sat, 29 Feb 2020 07:41:30 -0000


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2020 at 01:39:02PM +0100, C=E9dric Le Goater wrote:
> On 2/28/20 1:33 PM, Philippe Mathieu-Daud=E9 wrote:
> > Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
>=20
> Reviewed-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-5.0, thanks.

>=20
> Thnaks,
>=20
> C.=20
>=20
>=20
> > ---
> >  hw/ppc/pnv_lpc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
> > index f150deca34..b5ffa48dac 100644
> > --- a/hw/ppc/pnv_lpc.c
> > +++ b/hw/ppc/pnv_lpc.c
> > @@ -829,7 +829,7 @@ ISABus *pnv_lpc_isa_create(PnvLpcController *lpc, b=
ool use_cpld, Error **errp)
> >      bool hostboot_mode =3D !!pnv->fw_load_addr;
> > =20
> >      /* let isa_bus_new() create its own bridge on SysBus otherwise
> > -     * devices speficied on the command line won't find the bus and
> > +     * devices specified on the command line won't find the bus and
> >       * will fail to create.
> >       */
> >      isa_bus =3D isa_bus_new(NULL, &lpc->isa_mem, &lpc->isa_io, &local_=
err);
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5aESQACgkQbDjKyiDZ
s5JLTg//QVePSxqMjTp4BFKrC9m2Hvuq9fqKGwiqI1DuRS6nMwjKhJ7/28F/73ac
5uzKlqh/uoSUh3FPYyAi3Qkj8jvIXZkGg0q3KRXoMQjDITkAeX9alOS25QEvP7Z+
xtvFwZZsZbEozvBHaf0SK787IZedfjs7xQp78BUCPxvH+zie5ZIo/okOWKwf7zsH
cGqviv+tpWAJaIkRc7SVaWdXRfUszHuUuhdx4NVMakzZDILIlxkw3bpKp3OuEcID
T5amBuUkOtlqTlR2LHB9ejZHuP3hOVjGGgrdVDXdOtQFnTazN3rEwuc+0fNL+MmQ
blpu628TZbvq3v6p37y1ltYy6K6tBvhWmZYC0qWo4M9BpPHd3jlG8z2sQgop0Z3a
5bSUJar5AYQp3XXB82RyqVTT8/jw08+3rfGtNfc/nw6bB6aOCZvceFZ8qT1EpD7f
MuPsDGHN0MMEqDN6SKRWeRE/0Rton/WzmrzHTW2V55OmYFwSZ+SQEidlLIhrMtfO
dqaZsOgRP1WydAZBsThOMb0bIktXSgryX3KrtijQ+0yeXZ3pvsqXwSwf96MXWkdX
SxhgE2b+mdofjC7m87iDat1Ovek/ybSBDeMm7sAhGBYCCM3zCj33ZaXDsAzX/IG6
E5mVPgLHHhm7P7WS2gdqHs+STLOHkP67vfur0HfDsnR7FS7itqE=
=yMx1
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--

