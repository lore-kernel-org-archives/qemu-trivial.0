Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dO7hj-0000jV-WC
	for mharc-qemu-trivial@gnu.org; Thu, 22 Jun 2017 15:23:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1dO7hh-0000j0-EE
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 15:23:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1dO7hd-0002H3-AW
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 15:23:45 -0400
Received: from 20.mo5.mail-out.ovh.net ([91.121.55.239]:41403)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1dO7hd-0002GS-3o
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 15:23:41 -0400
Received: from player695.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id A033110C3B1
	for <qemu-trivial@nongnu.org>; Thu, 22 Jun 2017 21:23:39 +0200 (CEST)
Received: from bahia.lab.toulouse-stg.fr.ibm.com
	(gar31-1-82-66-74-139.fbx.proxad.net [82.66.74.139])
	(Authenticated sender: groug@kaod.org)
	by player695.ha.ovh.net (Postfix) with ESMTPSA id 130EA460088;
	Thu, 22 Jun 2017 21:23:33 +0200 (CEST)
Date: Thu, 22 Jun 2017 21:23:32 +0200
From: Greg Kurz <groug@kaod.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth
	<thuth@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, QEMU Developers
	<qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Message-ID: <20170622212332.38f4b434@bahia.lab.toulouse-stg.fr.ibm.com>
In-Reply-To: <20170622183457.GG2100@work-vm>
References: <149814756006.27338.8723356702388175951.stgit@bahia>
	<CAFEAcA8yqb8ykP8nCnoVNQUZd851RhOLFf2TfkHZmL2je+pP=Q@mail.gmail.com>
	<20170622184255.2d44e3bd@bahia.lab.toulouse-stg.fr.ibm.com>
	<87injo6jla.fsf@secure.mitica>
	<CAFEAcA-g-=AkH3t8jOTFY_9zA6ECS57-3MS=cHPb+Q6sePzNsw@mail.gmail.com>
	<20170622172555.GE2100@work-vm>
	<20170622194649.6d251753@bahia.lab.toulouse-stg.fr.ibm.com>
	<20170622175012.GF2100@work-vm>
	<fb2c7124-2d3f-6684-e2f2-265bfb3eb6da@redhat.com>
	<CAFEAcA-A=UrkKjLmVOcFA_d4rMW1AJwGffE4r2Uy6fw++XFF6w@mail.gmail.com>
	<20170622183457.GG2100@work-vm>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/wVHiw8TlVya0+wjRGE8m3l/";
	protocol="application/pgp-signature"
X-Ovh-Tracer-Id: 1818046878771878194
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedrledvgddufeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 91.121.55.239
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Separate function types
 from opaque types in include/qemu/typedefs.h
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
X-List-Received-Date: Thu, 22 Jun 2017 19:23:46 -0000

--Sig_/wVHiw8TlVya0+wjRGE8m3l/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Jun 2017 19:34:58 +0100
"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > On 22 June 2017 at 19:08, Thomas Huth <thuth@redhat.com> wrote: =20
> > > On 22.06.2017 19:50, Dr. David Alan Gilbert wrote: =20
> > >> Could do; I'm just not finding tiny header files with one or
> > >> two entries each that useful. =20
> >=20
> > Well, it means that the bulk of code that doesn't care about the
> > types doesn't get its compilation fractionally slowed by having
> > to parse the typedef anyway. In general I think we're drifting
> > towards "have each .c file get fewer things automatically" rather
> > than otherwise (eg more finely focused files rather than stuffing
> > everything into qemu-common.h). =20
>=20
> At the cost of things getting fractionally slower by including lots
> more tiny headers.
>=20
> I generally agree in the case where there's a useful chunk,
> but when it's down to one or two definitions I don't see the point.
>=20
> > > Do we really need these function typedefs at all? IMHO it's quite ugly
> > > to hide such things in a typedef unless it is really necessary (and in
> > > this case, it does not seem to be really necessary since it is only u=
sed
> > > in a few places). So what about simply removing the typedefs in this =
case? =20
> >=20
> > I find function typedefs much more readable than having the
> > function-types inline in function arguments and the like.
> >=20
> > This is all fairly rapidly heading into bikeshed territory
> > though -- in the final analysis I don't think it matters
> > much what we do. =20
>=20
> Agreed.
>=20

Last question for my own comprehension.

I can't think of a case where we would do something like:

   some_vmsd->load_state_old =3D some_se->ops->load_state;

Does it make sense for VMStateDescription::load_state_old and SaveVMHandler=
s::load_state
to be of the same type ?

> Dave
>=20
> > thanks
> > -- PMM =20
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


--Sig_/wVHiw8TlVya0+wjRGE8m3l/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAllMGTQACgkQAvw66wEB28J/mACfdbyo+/TnEx9Vy7c2mRSTuADG
bbsAoKDXqCBIwaVPQGKs5fj1EmIcgZfo
=V7Qu
-----END PGP SIGNATURE-----

--Sig_/wVHiw8TlVya0+wjRGE8m3l/--

