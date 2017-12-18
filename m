Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQma5-0007L2-Pe
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 22:59:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1eQma3-0007Jd-Il
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 22:59:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1eQma2-0006LK-Ow
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 22:59:07 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:33087)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1eQma0-0006Gj-A0; Sun, 17 Dec 2017 22:59:04 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3z0S2Y63fsz9s84; Mon, 18 Dec 2017 14:59:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1513569541;
	bh=AQXBCfM04tp2x1HugJ2+nUaPHY+YbonUg9NQ8SYXIV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MreMez4ygp2lr3AYlI4WJQJCBn8qeomVW3Cc1DyK9FkrhdsSTNI4kzK4GWNf/jBZs
	P7OnyfkU5yUZeR241FrDgaLNS3bqQV/SL7cn2wCNu7oef5UxW0ThGtpuNCVBLFK8ys
	jN8yx9kTuNPKsdx3ao6AqVRTPEY+T8GWV4Eac2Ec=
Date: Mon, 18 Dec 2017 14:57:04 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20171218035704.GP7753@umbus.fritz.box>
References: <cover.1513465066.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b5sSX5qSQrSInIHt"
Content-Disposition: inline
In-Reply-To: <cover.1513465066.git.balaton@eik.bme.hu>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-trivial] [PATCH 0/2] More SM501 improvements
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
X-List-Received-Date: Mon, 18 Dec 2017 03:59:08 -0000


--b5sSX5qSQrSInIHt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 16, 2017 at 11:57:46PM +0100, BALATON Zoltan wrote:
> Two simple patches to add some more registers that were found to be
> accessed by some guests.
>=20
> BALATON Zoltan (3):
>   sm501: Add panel hardware cursor registers also to read function
>   sm501: Add some more unimplemented registers
>=20

Applied to ppc-for-2.12, with Philippe's suggested addition to the
commit message.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--b5sSX5qSQrSInIHt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlo3PI0ACgkQbDjKyiDZ
s5IkAw//YyQEn4layfxdDsAhPBD1O6jHK5zKmOPMsxg2Uwm4C2k/1eLHmtlfpuHP
uqY+1d/++WXUapF2N19TrQuCCqXccEQxZrv4mQ8xp2rGbsYHnpWJZDC4EX4W3uCZ
txcQxpBNDr9Ne/2ubQxVqD9+wvmh6B0ETNNLKve0tVg3n+CM8w5rCEDzzFPToHq0
A3ARn/+VXyzIOtLJtyDwqvM/1YJdqZzVL7QdSU/U0O7fg1qm5pAivhIuO/j2fxQU
wjpTJhNRKiRrJ016s+Ep+wa8jwANs7y4OJjs6kWdXUGHeGIx0jaUgmrz+PaCGCr6
gxiYvfIn5r/G6411hAcIq7Ie9KjwPNNjs+txkg4+xVjp7W++8yon+FEdcngxSgPt
+F8gqfZ1WA9h2Ks1iSIZSoyLCBrwv+iJnABNriqeo/Oy0rdB6pK8cmajjUVp6l0L
P4PWTzn6HF01IpHdQJkDJvsCWqZCiF5IpnhBA2bNZodLzh1wlr+MPxNEgPcXu7ss
VO7nmPBhJK/ran4iLXeZXHF3p/QVXJDmA2PoHDIR0x/h7fD4hZVsdEPpBWEHqK1w
nm84+mAndJspNPBvqFtgL8R7EkHaPzz00yt0/K1zOOQMqtAd8gjSnaUqQAKnDo2J
rIyKuvb55Yk2kqJ6T5jhG52UlJsNINiUcjPxDeCT2GTp37tjNr8=
=TEX+
-----END PGP SIGNATURE-----

--b5sSX5qSQrSInIHt--

