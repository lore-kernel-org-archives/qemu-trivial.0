Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ejvdY-0001FM-Mm
	for mharc-qemu-trivial@gnu.org; Thu, 08 Feb 2018 18:29:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1ejvdW-0001Do-QW
	for qemu-trivial@nongnu.org; Thu, 08 Feb 2018 18:29:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1ejvdV-0001ZW-QC
	for qemu-trivial@nongnu.org; Thu, 08 Feb 2018 18:29:50 -0500
Received: from ozlabs.org ([103.22.144.67]:34143)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1ejvdS-0001Wa-Ev; Thu, 08 Feb 2018 18:29:46 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3zcvYN0nT6z9s4q; Fri,  9 Feb 2018 10:29:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1518132584;
	bh=NHmhrqS/K118+ne/g/gjlpblmfc9EJ8vwqua5Oj0imk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bbmr1jjCOVWEgVl02I9scNKMhSIzJQOurWevNFEi1QLmH3cxJPKoozWyUKafbPgU0
	86TKBRBy5awUDzYbmNt7zY6KsYQA0iWJKGZwJlyywX/zP8VD5EWY4zo/qy8JBS+5d2
	JgZIR/2BdlyFJ8OEsJr1cUsJ9t/rDeKP2Doomaxc=
Date: Fri, 9 Feb 2018 10:29:08 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20180208232908.GD11634@umbus.fritz.box>
References: <20180130131716.5899D7456D5@zero.eik.bme.hu>
	<20180130194935.GL12900@umbus>
	<alpine.BSF.2.21.1802011250090.39992@zero.eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Hf61M2y+wYpnELGG"
Content-Disposition: inline
In-Reply-To: <alpine.BSF.2.21.1802011250090.39992@zero.eik.bme.hu>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-trivial] [PATCH] sii3112: Change angle brackets to quotes
 in #include lines
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
X-List-Received-Date: Thu, 08 Feb 2018 23:29:52 -0000


--Hf61M2y+wYpnELGG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 01, 2018 at 12:51:04PM +0100, BALATON Zoltan wrote:
> On Wed, 31 Jan 2018, David Gibson wrote:
> > On Tue, Jan 30, 2018 at 02:10:10PM +0100, BALATON Zoltan wrote:
> > > This matches what other files do for qemu includes
> > >=20
> > > Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> >=20
> > Applied, thanks.
>=20
> Thanks but Markus instead included this in his cleanup patches here:
> http://lists.nongnu.org/archive/html/qemu-devel/2018-02/msg00075.html
> so you can drop this from your tree now.

Ok, done.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Hf61M2y+wYpnELGG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlp83UQACgkQbDjKyiDZ
s5IspBAAsia6f+f/NNkZBp28CoAD83341pLadU9y238RKiLf8DN3Kw1RFgltLcFn
O4+dX36mNeueEQ9Yr4R7N30rs/oEkIjA0xIff/92EeiTDWj69iwAKWNfirNGvUNA
Kk9XB2g5LiBfFHiBXPud2VPp2vSJC4aMauYgIxyE8+MSwTiIDCyC/eyrDPU4akmj
h33KAfopAg66/0T4LMOV9wy2Pvk6JW/1DKKmczA23spbaDnUfZPoHOR+tFvWz614
l6yR3hjBlrelb2RMN1FEf+QZQWVDPGWw8mkmJZhSt2yKZX38sB4vNoLlbJPj0d15
9QBOjV+Y2QiXndWj6ojh3/T8g0ol0L2b3R+u381Q/3p840UFUwy8uHQ6WVOVOc1j
Ka/FmVaGroQBnJZRwjbGhHjejlU5sQh35HZ8AvlpXgbSN3TrjQDX9B6CE5F/u57g
T4zfHcMN2jgSC3MzZWVuCyE9SmLw3mTs8q8MBiIn8FCzRVzqJQHDpfuYdX0A3/tS
5EWsxrV1+aUbm5idAriIso70TVgf3kwew6Hcadqtl08NYOKmjjEEiLjP1rho0sPL
chlvGEnOQyY+SPwAZ/vSGgzpXNVBpz+OWFoCjBHGorS3jtnnALOLUoY69SCSJuWm
Op4LE9MINz06MtrPQgnZyGCq4g4e6zfB66vJWX6N3vO2wGO0B34=
=LRdY
-----END PGP SIGNATURE-----

--Hf61M2y+wYpnELGG--

