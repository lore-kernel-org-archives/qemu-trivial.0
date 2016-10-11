Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bu6cl-0008Gb-QE
	for mharc-qemu-trivial@gnu.org; Tue, 11 Oct 2016 19:38:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bu6cj-0008E2-Tr
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 19:38:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bu6cf-0005By-Rq
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 19:38:16 -0400
Received: from ozlabs.org ([103.22.144.67]:42305)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1bu6cV-000589-J9; Tue, 11 Oct 2016 19:38:04 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3stthl2DKkz9svs; Wed, 12 Oct 2016 10:37:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1476229079;
	bh=00kH9xB/NWtMmURCm2f872UNm7POOIcvrdJ9id5mOM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GbjSuI7v9/zAD25aw6wXf70HKn4fxrDvqp7BWzoFUD53CXIMi7ak0qwCbmEj2mWhE
	D4IFpjAHz9beA6v5W7rfcxSipxeQpGwVD6SL8wy5Jn6nHWXxFeJABoGjnTsCrgHdUs
	7ZPyzgQsUYyBMAI2B1kKJgb/eVDjBXFstIggB/U4=
Date: Wed, 12 Oct 2016 10:25:50 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sascha Silbe <x-qemu@se-silbe.de>, qemu-trivial@nongnu.org,
	qemu-ppc@nongnu.org, Victor Kaplansky <victork@redhat.com>
Message-ID: <20161011232550.GB17844@umbus.fritz.box>
References: <1476199177-32411-1-git-send-email-thuth@redhat.com>
	<20161012000454-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3uo+9/B/ebqu+fSQ"
Content-Disposition: inline
In-Reply-To: <20161012000454-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.7.0 (2016-08-17)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-trivial] [PATCH 0/3] Improvements for the boot-sector
 tester
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
X-List-Received-Date: Tue, 11 Oct 2016 23:38:19 -0000


--3uo+9/B/ebqu+fSQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2016 at 12:05:24AM +0300, Michael S. Tsirkin wrote:
> On Tue, Oct 11, 2016 at 05:19:34PM +0200, Thomas Huth wrote:
> > Here are two patches that try to improve the situation with the
> > slow pxe-test on ppc64 a little bit, and one patch that fixes
> > a potential race condition between tests that run in parallel
> > by using a random filename instead of an invariant one.
>=20
>=20
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>=20
> You can go ahead and merge as I'm offline tomorrow.

Done.

>=20
> > Thomas Huth (3):
> >   tests/boot-sector: Use minimum length for the Forth boot script
> >   tests/boot-sector: Use mkstemp() to create a unique file name
> >   tests/boot-sector: Increase time-out to 90 seconds
> >=20
> >  tests/bios-tables-test.c |  2 +-
> >  tests/boot-sector.c      | 25 ++++++++++++++++---------
> >  tests/boot-sector.h      |  4 ++--
> >  tests/pxe-test.c         |  2 +-
> >  4 files changed, 20 insertions(+), 13 deletions(-)
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3uo+9/B/ebqu+fSQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX/XT7AAoJEGw4ysog2bOS5VwP/2UpuWVCBqViC4VX1XU120En
qWHzD65V8ENnhR1UtY2+XW8jT8/6nJmgwIEfM/Jp8DwpTpu+ecrg/s5RJrHrMybX
1yT4x2r+u7hmZDmibwZ4qzHHxAoFnaBsXAYyd4hsEgc1u+d9hM+ZzEEMMFZuaEhZ
rgXUR0f6O5ZmTOlSzf9XSw/3i0uAP9c2/U96NMUzwmHn/kcyQBRa8fwgarB1DgFV
hP75YqMQvIMwHzycDAUj5zpSyfR6uskOkQwYvtRXf21xYQt+SJVntp1E2szNZ65/
KmiHOqLOWQfNVDF+T4mLStqRik+cCuOafg1FJ96iG5HuH2bVhTk2eR+QZ+gvhOAB
QJX3ht4raqGjH2v29YdBoAnNf7ZgLOpQiBGcZIxdZWrasH/YN/gwx1/8gSE6UO2h
XrnzJ+AdMsVEclMZqOE6dzdA3TNIe8MDJS78Mqhuxx/GdTJD1BEWLvf9ufHWIkPU
dlk2M505zfzioR6Yq7TD8VoTkN9vXPm6dvOzmY1MD5QJ1QxCv4jXWCuZi5UpPZXR
Hu4YVD2NKFA9te339/kJynw8PDxWWR4KhmKVuhyNchM1hoccghkuXpDlrPwFzLfn
o8yESLTvAF2eSmQdtNI1aTU4heJ+Pk6W9h1qdXvPzdN9yW+xJwN8F2Wrq9/JQaY9
oeSD+JxaJsOaVn0iL16X
=nmRT
-----END PGP SIGNATURE-----

--3uo+9/B/ebqu+fSQ--

