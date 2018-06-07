Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQkUL-0001hI-0T
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jun 2018 22:17:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1fQkUH-0001fb-9j
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 22:17:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1fQkUG-0001kJ-A3
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 22:17:17 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:43437)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1fQkUB-0001de-9u; Wed, 06 Jun 2018 22:17:12 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 411Th03YRTz9s1b; Thu,  7 Jun 2018 12:17:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1528337824;
	bh=y1eyr89xYq63/N1zapZuYGomKWIrWIG/0QlepHCM4Hc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nxBWX6/IEkNnANNhGJKxdHppL0pC9sunzorUpU9AO2z4Dpue5/0mZEA53MIiMxKDR
	uVaFXiiDOcGwLbJwWnjRFwK5jGQvEe39ssw9Zxw5kcIwdTsv8hrKafPzNvaVQtCAJE
	B5iWdkeEZkks8BG8DuFQti1yns125u4jrdzchOM8=
Date: Thu, 7 Jun 2018 12:11:27 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
Message-ID: <20180607021127.GA3166@umbus.fritz.box>
References: <20180606145921.30606-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline
In-Reply-To: <20180606145921.30606-1-f4bug@amsat.org>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-trivial] [PATCH 0/3] mac_newworld: add MAINTAINERS
 entries, fix qemu_log trailing '\n'
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
X-List-Received-Date: Thu, 07 Jun 2018 02:17:19 -0000


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 06, 2018 at 11:59:18AM -0300, Philippe Mathieu-Daud=E9 wrote:
> Nothing very exciting here.
> I sometimes miss to notice some trace events, running with -d unimp,trace=
=2E..
> then using 'grep ^...'. This is only due to a missing '\n' :)

Applied to ppc-for-3.0, thanks.

>=20
> Philippe Mathieu-Daud=E9 (3):
>   MAINTAINERS: Add an entry for the MacIO device headers
>   MAINTAINERS: Add entries for the MOS6522 VIA device
>   hw/misc/mos6522: Add trailing '\n' to qemu_log() calls
>=20
>  hw/misc/mos6522.c | 4 ++--
>  MAINTAINERS       | 5 ++++-
>  2 files changed, 6 insertions(+), 3 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlsYlEwACgkQbDjKyiDZ
s5Im0xAAkCV4M8LqXR5qCuichECx1vFWZskUrqZIXNeg+FVWjhhr3s9uI7WhaZnO
1SrKkx3yIKJEp4jDCpQkNtj8H36ZUv0fQz2PVUz9lvGtMsVyM/xRMDMywLNMVLcf
QcjYZP7mPfCV3srJsznrTji+MVlUp4m0B37QqaavaoHwkVOBCPML6YWG2d3TlunX
arvjKEz8xjnhKs7YQXsh+wYAhWgTvlyeoKCGmcJfjh1YGuDU+W1z25zyTUOrDz0t
2lietV6BnCjgrLtqIStShQwuddJDyrd930wHui7XU5EIt8rd5GbQuy2ShSmYnbA/
G6KOUgz6TDaCLh4d+P7SMfOuKNxY+QNhB80Rt/6girIJfuz3yVSZlrHsD3SF4mFN
YM1jivVpTFsEUwhsoCbNGPNHwsOpDXvQ9CqJ7i/Vz+QB/H2RpcHUL9Gu+s+ygLk/
hYyjFfcuDxTTIhwmWdW3YKq+BIDj/ahQfE7QN8/YUyndY3paf98/XAD82ft3tPT7
EMxkwGQ7Bb7tB2nTRY69g8dFe7Q1lIRw1roe1rY2vVukmjc6yMWrarklerkfNniI
fgOTIFG0nBYDOtL/mRdPvVotMGQ5bDy9pEMaN5uTNojI1TWm4JKVltU8ibeN9Ega
j9+4KTaJBLBdHdbjqf+o9eSeYkg+XhZkU+lHQSVAWd3iogalXUY=
=0Tt3
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--

