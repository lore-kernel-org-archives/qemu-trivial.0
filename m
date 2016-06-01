Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b8Emm-000523-Jt
	for mharc-qemu-trivial@gnu.org; Wed, 01 Jun 2016 18:38:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1b8Emk-000502-PE
	for qemu-trivial@nongnu.org; Wed, 01 Jun 2016 18:38:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1b8Emg-0007t4-EN
	for qemu-trivial@nongnu.org; Wed, 01 Jun 2016 18:38:45 -0400
Received: from ozlabs.org ([103.22.144.67]:34589)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1b8Emg-0007sK-3w
	for qemu-trivial@nongnu.org; Wed, 01 Jun 2016 18:38:42 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3rKld674lmz9t5g; Thu,  2 Jun 2016 08:38:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1464820715;
	bh=o3fUFbKLu6wNW2vQlb6gfaiNHTBfdLo/ki4ypwXGKHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Buy48UkWS3aQQgpWXz+g5r1Gdq+vJFaF7Cdm1oJosPbaBarxcZ/1Xr6hyQlNRwtlU
	FGFS6jMijwtkL0M1RlgD7dDywB96UAoeD9dj9dshL65yPYEMEvSo2WY5jndfxyAjDp
	AsvfD3HrubttWee7ywUxMsqHqpdQlMTE9qanW7HM=
Date: Wed, 1 Jun 2016 16:24:07 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Imran, Talha" <Talha_Imran@mentor.com>
Cc: "agraf@suse.de" <agraf@suse.de>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Message-ID: <20160601062407.GC15455@voom.fritz.box>
References: <1463659895-16281-1-git-send-email-talha_imran@mentor.com>
	<20160527013714.GP17226@voom.fritz.box>
	<3052678E9DA67D4CB879A6625EE420753DD7A3D1@EU-MBX-02.mgc.mentorg.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ghzN8eJ9Qlbqn3iT"
Content-Disposition: inline
In-Reply-To: <3052678E9DA67D4CB879A6625EE420753DD7A3D1@EU-MBX-02.mgc.mentorg.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-trivial] [Qemu-ppc] [PATCH] target-ppc/fpu_helper: Fix
 efscmp* instructions handling
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
X-List-Received-Date: Wed, 01 Jun 2016 22:38:48 -0000


--ghzN8eJ9Qlbqn3iT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 27, 2016 at 07:43:46AM +0000, Imran, Talha wrote:
>=20
> On 05/27/2016 06:37 AM, David Gibson wrote:
> > On Thu, May 19, 2016 at 05:11:35PM +0500, Talha Imran wrote:
> >> With specification at hand from the reference manual from Freescale
> >> http://cache.nxp.com/files/32bit/doc/ref_manual/SPEPEM.pdf , I have fo=
und a fix
> >> to efscmp* instructions handling in QEMU.
> >>
> ...
> >> Signed-off-by: Talha Imran <talha_imran@mentor.com>
> >
> > Does this patch supersede the earlier patch you posted for efcmp
> > instructions on e500v1?  Or is it in addition to that patch?
> >
> [talha]: Yes, it supersedes the earlier patches. This is a better
> solution.

Ok, I managed to read up enough on the SPE instructions to convince
myself this was correct, so I've merged it to ppc-for-2.7.

>=20
> >> ---
> >>  target-ppc/fpu_helper.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/target-ppc/fpu_helper.c b/target-ppc/fpu_helper.c
> >> index b67ebca..6fd56a8 100644
> >> --- a/target-ppc/fpu_helper.c
> >> +++ b/target-ppc/fpu_helper.c
> >> @@ -1442,7 +1442,7 @@ static inline uint32_t efststeq(CPUPPCState *env=
, uint32_t op1, uint32_t op2)
> >>  #define HELPER_SINGLE_SPE_CMP(name)                                  =
   \
> >>      uint32_t helper_e##name(CPUPPCState *env, uint32_t op1, uint32_t =
op2) \
> >>      {                                                                =
   \
> >> -        return e##name(env, op1, op2) << 2;                          =
   \
> >> +        return e##name(env, op1, op2);                               =
   \
> >>      }
> >>  /* efststlt */
> >>  HELPER_SINGLE_SPE_CMP(fststlt);
> >
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ghzN8eJ9Qlbqn3iT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXTn+HAAoJEGw4ysog2bOS5JYQALWIxJW2/lzvb0GyeMktYsmX
t58XJhDHluFVxHY1Q2QUyHh8Wo/0KXtrkBWT5n5UCfiqQTZQuQ2uhYUuKgBnTP6I
roN1dmVOyvHx+Wtp/fLm4qau7bWpUD7IgBVvFVOe52yBYMmczQThhVQ16d71HiHN
9Rhts57kmYGL8MVQ5oAOnFiRdncCqUjpOG5B6b97QPEOMUMIZFv/oyHYosVYc75F
3F9eVF5mfdxwxgwn0DaIU/G9uIAZnHbBL8od1Cn6waSQ1wAGxgygOKa8qw7wUS+u
gMO7Vc/vIGdGpNE+3VgGli321Z3g+qb5LjL/SiWrjF8vpAxVDl/lAS8gQHF6mg7h
ENKYgoF6nhGcYAj2adMiZdIOCzAGvkkuLvzkLJuwXLII3Sz+dbPHVArJey7K9q8y
Np0cuBln9a5DUjBO6QPDbjcURgOkmCAxhba7mt1cHiE0rauXaEdryH6NGFQFAMAe
sQLHfPbgHgTIw9nT1fvpdinyvCJ3Hw0v9xwTOEb2EvB0L6aXXGDivWJtsQZj05ku
47oH795cR9em+U6cUiNPYqmIIE46ZfkzY90XaDnEMP8SWWfeF21KrMUiHqxQVZa6
Fktj4Myh8mY5Swh/vIsLBtG3W6w6PQR3Ir/dN8IHoMP8FE7+PlOOkwbxxOcbGKT8
puKB+l8v+VjokXF4Ridc
=og6T
-----END PGP SIGNATURE-----

--ghzN8eJ9Qlbqn3iT--

