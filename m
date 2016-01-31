Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aPpDf-0006FP-Ef
	for mharc-qemu-trivial@gnu.org; Sun, 31 Jan 2016 05:26:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1aPpDc-0006BZ-J9
	for qemu-trivial@nongnu.org; Sun, 31 Jan 2016 05:26:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1aPpDb-00073c-BQ
	for qemu-trivial@nongnu.org; Sun, 31 Jan 2016 05:26:56 -0500
Received: from ozlabs.org ([103.22.144.67]:54651)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1aPpDW-0006yH-Kx; Sun, 31 Jan 2016 05:26:50 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 6F49F140BDE; Sun, 31 Jan 2016 21:26:46 +1100 (AEDT)
Date: Sun, 31 Jan 2016 21:27:44 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Message-ID: <20160131102744.GV23043@voom.redhat.com>
References: <1453991009-32736-1-git-send-email-alex.bennee@linaro.org>
	<1453991009-32736-3-git-send-email-alex.bennee@linaro.org>
	<20160130123502.GQ23043@voom.redhat.com>
	<878u36ywiq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1AtvaQRkIQxkm1Oe"
Content-Disposition: inline
In-Reply-To: <878u36ywiq.fsf@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Cc: kwolf@redhat.com, pbonzini@redhat.com, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v3 2/3] .travis.yml: run make check for
	all matrix targets
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
X-List-Received-Date: Sun, 31 Jan 2016 10:26:58 -0000


--1AtvaQRkIQxkm1Oe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 31, 2016 at 08:37:49AM +0000, Alex Benn=E9e wrote:
>=20
> David Gibson <david@gibson.dropbear.id.au> writes:
>=20
> > On Thu, Jan 28, 2016 at 02:23:28PM +0000, Alex Benn=E9e wrote:
> >> We only ran make check once before it used to be an unreliable target.
> >> It was only a stop gap measure and we should be able to revert it now.
> >> This also stops us needing a large all-MMU build.
> >>
> >> We disable "make check" for a couple of the extra config targets which
> >> are currently broken.
> >>
> >> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> >
> > So, in general I like the idea of running make check more widely.
> >
> > However.. I was wondering - what's the rationale for having separate
> > matrix builds for each target (or small group) rather than just doing
> > one build with all the targets?
>=20
> Each individual part of the matrix can be run in parallel with the
> others so it makes sense to keep the build component small (as each
> softmmu target rebuilds a significant chunk of the build).

It does rebuild a significant chunk, but there's a significant chunk
that isn't rebuilt as well.  When I tried this I found a recombined
build marginally decreases the elapsed time and significantly (maybe
30-40%) reduced the total time.  Given the load the travis system is
under, it seems to me that we should try to keep our total demand on
its resources down when it doens't significantly lower our coverage.

> Having said that there is a fair amount of repetition as we are
> repeating all the generic qtests each time just so we can run the extra
> ${TARGET}-qtest binaries.

That too.

> Travis does has an option for using ccache so it might be worth
> experimenting with that to see if things are improved.

That does sound like something worth looking at.

One thing that does annoy me about travis is that it will do a full
rebuild if you have two branches on exactly the same commit, or if you
revert a branch to an earlier commit which was built previously.

> > I can't see any obvious benefit to splitting the build that way, but
> > it does increase the total build time significantly - and will do so
> > rather more so with make check added.
>=20
> Elapsed and total are the ones to look at:
>=20
> https://travis-ci.org/stsquad/qemu/builds/105401126
>=20
> vs
>=20
> https://travis-ci.org/qemu/qemu/builds/105711606
>=20
> However it looks like Travis are having scaling growing pains because
> there "old style" VM approach is running a lot faster than it used
> to.

Not terribly surprising TBH.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1AtvaQRkIQxkm1Oe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWreGgAAoJEGw4ysog2bOSwoAQAJSkd/wwSAUd1JXTdXlmhiWt
3SkUxopU0Dj3q/2qjdVnh3Z2fl9DscBULbTy408VKFp6Cd7vtUH5ZXFuBUfXwbRf
AuqTRAphlnVVao6tYqmvnIKZB8PVDXS6EqV4h4Y7ybUrDOD+t6imGbwRgPAK63dm
C37hibUgbAGLujeV5WM9Hw1byt46xfqbaFPTZuXx3QqEOOUs9DGK2vzmLPbhVDOb
2waBEiAx2I+12lMiv890Tr/+u/Ss4hlZ7WmMvg6VVjZfnAgstIlgfT+2qsedMBuu
kW25gdbMeU5i2rWAfhhyyTXu2APhLmvHTiTiIl4MT4SpSlIWY1BwaAC+agfFjGBq
ahavWN/FupqOd+6qtEv2Ja5fFt6LkCiVNP1rs/r+uLPLpJY2Zi8qkoXNmyqft6Gm
5Z1X3lwW3ONsr90pTnsCXzoZHbNjJwbGrrC6/Aw8ZVBqvSJIhDVQz5WYxupXxwxf
Syq8yLAv+Wf93uhq0Q0FtIwYLMKkBv4ac88RaaubMhRfYVpcJxSLmYvcGSd3NHcv
7xCVLyeshyDH1Sa4b8uA+1nH9F7xpw49tp67krBVn4Erijbcba6E0PuKoD/jnMZn
4c6w1xWgQ/1v0PEt+DbO0muS1889YGm2bM36dKyMzeTgCzwE1ymCrfvmpNlSUXXP
ZZ7K9DB35pNSej141OBN
=mNKf
-----END PGP SIGNATURE-----

--1AtvaQRkIQxkm1Oe--

