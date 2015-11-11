Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZwJsu-0004PY-UL
	for mharc-qemu-trivial@gnu.org; Tue, 10 Nov 2015 20:07:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1ZwJsr-0004Je-US
	for qemu-trivial@nongnu.org; Tue, 10 Nov 2015 20:07:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1ZwJsr-00061B-0w
	for qemu-trivial@nongnu.org; Tue, 10 Nov 2015 20:07:33 -0500
Received: from ozlabs.org ([103.22.144.67]:49930)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1ZwJsj-0005xC-Lp; Tue, 10 Nov 2015 20:07:25 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 0F00B1402B4; Wed, 11 Nov 2015 12:07:24 +1100 (AEDT)
Date: Wed, 11 Nov 2015 12:03:15 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20151111010315.GB5852@voom.redhat.com>
References: <1444844599-33161-1-git-send-email-julio@farjump.io>
	<563C5F17.7090409@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Content-Disposition: inline
In-Reply-To: <563C5F17.7090409@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.23 (2015-06-09)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, christophe@farjump.io,
	Julio Guerra <julio@farjump.io>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-ppc] [PATCH v2] taget-ppc: Fix read access
 to IBAT registers higher than IBAT3
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Nov 2015 01:07:35 -0000


--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2015 at 11:04:39AM +0300, Michael Tokarev wrote:
> 14.10.2015 20:43, Julio Guerra wrote:
> > Fix the index used to read the IBAT's vector which results in IBAT0..3 =
instead
> > of IBAT4..N.
> >=20
> > The bug appeared by saving/restoring contexts including IBATs values.
>=20
> Applied to -trivial.  It'd be *much* better if such changes were
> accepted by the maintainers who at least knows what's the talk
> about... :(

Thanks and sorry about this.  Alex Graf who usually handles most ppc
stuff is off on paternity leave.  I've been filling in for him, but I
missed this one because I'm a bit swamped with my day job.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWQpPTAAoJEGw4ysog2bOSH74P/0E0BgLnfXzlb2yefX34Us84
oztiXTj1rlGPykkP3U8+mtnh4CzvSc6uuUqBZoBpJXJUXRmIhDq63uQSP598CVQM
7ebiO0g9ZLj9dgKXidloXdF6r3MrCAyVPOM/u0knqh/UJrnia6N9heJsaFs7aY74
MXMeLRhu4cVa79p8uchHd90TxfGIvj61Cua6xMSkUf2aZht57SW6taT7ENNX91w6
kQ+YylP8qkeVZ42lsuyxUqgl7HHDY6HjYEAChHu/MG+X1CGP6TxQArXJS0Qvrvew
CSBd7pwpTn+O0nmkD5Kju8gSfLp0XClzSIPaTIUKoQKGHJfuR1rjUzeZtf8seS/8
x6Z0Ac1ihWBLReP5SomKfFEeJQKy9rd+dY0NFbAS3o50epRADP6wNKv2dSYclCaL
qjiOlLsUhXeMfUMQ2dIJMFoRf5Zq8A46M+lTI4oKdGtLvVw1Amr5IMc4DRzm09h7
+k/UfWPhKNDRoJQWVpJnGoGIkJAvK4d7Wvjxh5Qizb3xj7LRNE7fE3S7u5cFngPR
vqV7IqgbKRlqvGu/m88E+pDjaIq6y6/901jK8+3M7NKgu4rO993UvfYYwH+gFQfV
cr5PgUKXYBb5BfIHLBhV6ibHWUJC0D98grfkyxsPwIRxr+X0aABWW4RjPG2QioFD
fJ5HKhnG2MABOGVArPVx
=oVr5
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--

