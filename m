Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dO5CG-00079X-R6
	for mharc-qemu-trivial@gnu.org; Thu, 22 Jun 2017 12:43:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1dO5CE-00079J-BI
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 12:43:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1dO5CB-0001V5-79
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 12:43:06 -0400
Received: from 2.mo5.mail-out.ovh.net ([178.33.109.111]:43836)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1dO5CB-0001TW-0v
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 12:43:03 -0400
Received: from player695.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 76A6E10C57C
	for <qemu-trivial@nongnu.org>; Thu, 22 Jun 2017 18:43:01 +0200 (CEST)
Received: from bahia.lab.toulouse-stg.fr.ibm.com
	(gar31-1-82-66-74-139.fbx.proxad.net [82.66.74.139])
	(Authenticated sender: groug@kaod.org)
	by player695.ha.ovh.net (Postfix) with ESMTPSA id E5248460071;
	Thu, 22 Jun 2017 18:42:56 +0200 (CEST)
Date: Thu, 22 Jun 2017 18:42:55 +0200
From: Greg Kurz <groug@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, QEMU Trivial
	<qemu-trivial@nongnu.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	Juan Quintela <quintela@redhat.com>
Message-ID: <20170622184255.2d44e3bd@bahia.lab.toulouse-stg.fr.ibm.com>
In-Reply-To: <CAFEAcA8yqb8ykP8nCnoVNQUZd851RhOLFf2TfkHZmL2je+pP=Q@mail.gmail.com>
References: <149814756006.27338.8723356702388175951.stgit@bahia>
	<CAFEAcA8yqb8ykP8nCnoVNQUZd851RhOLFf2TfkHZmL2je+pP=Q@mail.gmail.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/l6UDZ_XfHgpvO.GVsI_IG1d";
	protocol="application/pgp-signature"
X-Ovh-Tracer-Id: 17551935124070111505
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedrledvgddutdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.109.111
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
X-List-Received-Date: Thu, 22 Jun 2017 16:43:07 -0000

--Sig_/l6UDZ_XfHgpvO.GVsI_IG1d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Jun 2017 17:14:08 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On 22 June 2017 at 17:06, Greg Kurz <groug@kaod.org> wrote:
> > Function types cannot reside in the same sorted list as opaque types si=
nce
> > they may depend on a type which would be defined later.
> >
> > Of course, the same problem could arise if a function type depends on
> > another function type with greater alphabetical order. Hopefully we
> > don't have that at this time. =20
>=20
> The other approach would be to put function types somewhere
> else and leave typedefs.h for the simple 'opaque types
> for structures' that it was started as.
>=20
> For instance we have include/qemu/fprintf-fn.h as a precedent.
>=20

Indeed, and I'm not quite sure why Juan decided to put these types into
typedefs.h instead of a dedicated header file in include/migration... is
it only because it was the quickest fix ?

> thanks
> -- PMM


--Sig_/l6UDZ_XfHgpvO.GVsI_IG1d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAllL848ACgkQAvw66wEB28KHpACdEKMhm+2wFlTmol5zFp5iEwqk
N+wAoJqM1m9VLLOrPoTak37EP+gCTy/E
=X6OY
-----END PGP SIGNATURE-----

--Sig_/l6UDZ_XfHgpvO.GVsI_IG1d--

