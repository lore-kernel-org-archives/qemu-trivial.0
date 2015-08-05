Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMm97-0005oj-Qw
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 20:01:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1ZMm94-0005ka-Sj
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 20:01:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1ZMm93-0007TM-Sy
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 20:01:22 -0400
Received: from ozlabs.org ([103.22.144.67]:45257)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1ZMm8z-0007Ru-AO; Tue, 04 Aug 2015 20:01:17 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id ED4A41402C0; Wed,  5 Aug 2015 10:01:13 +1000 (AEST)
Date: Wed, 5 Aug 2015 10:01:02 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20150805000102.GB7739@voom.redhat.com>
References: <1438609948-3744-1-git-send-email-lvivier@redhat.com>
	<1438676851-10684-1-git-send-email-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DBIVS5p969aUjpLe"
Content-Disposition: inline
In-Reply-To: <1438676851-10684-1-git-send-email-lvivier@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH][TRIVIAL] i6300esb: fix timer overflow
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
X-List-Received-Date: Wed, 05 Aug 2015 00:01:23 -0000


--DBIVS5p969aUjpLe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 04, 2015 at 10:27:31AM +0200, Laurent Vivier wrote:
> We use muldiv64() to compute the time to wait:
>=20
>     timeout =3D muldiv64(get_ticks_per_sec(), timeout, 33000000);
>=20
> but get_ticks_per_sec() is 10^9 (30 bit value) and timeout
> is a 35 bit value.
>=20
> Whereas muldiv64 is:
>=20
>     uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
>=20
> So we loose 3 bits of timeout.
>=20
> Swapping get_ticks_per_sec() and timeout fixes it.
>=20
> We can also replace it by a multiplication by 30 ns,
> but this changes PCI clock frequency from 33MHz to 33.333333MHz
> and we need to do this on all the QEMU PCI devices (later...)
>=20
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Hah.  32-bit second argument.  Totally missed that when I put the
muldiv64() in there.  So I didn't eliminate the overflow, just pushed
it out some bits.

Thanks for finding this.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DBIVS5p969aUjpLe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVwVI+AAoJEGw4ysog2bOSQxEQAMm7RpR5KbgvzLi6VOhGV6x9
jhwezlpvV0n4+UrzeBwDg4kk56qivQTZTtAM4YnOk+mID8JrhNIq5r1FYM6sLEn4
28rdhnBdxA+UrYyBq0Ld9MkjEOqokzs/dmG+dXkaIAcDIqVgTCiUia+AeVtHABP0
tH5g009eQzqll+75UDF00gg/rKq//HoIFY4PYrUC9cbJRRsqbNV7XLb0vLff/3Gq
4pFWaYWdxj3nDzYido1jLtIgtxhwwT/RsYETeOPP66yj621q/FUe0gf5EeB67LJi
95kzxsbQvj83/IU9RcdxKG1i3MiwYXqcXSTc8aJHMm4JgAJOD44xpGUaVpYeUwnf
jKaQPNC9X0Sng1Gw0fM6fSHFaLxz4iq14i9cMhrtOXtu32gOdczggbpw3K1TpCzo
terePp8wZVFMOdw/peSBwnEpum35MSR+xaFEM880erxkLMiNGxCcpmHux4lNzyvB
frJw0PKn3uJK+f9RhkGlXhewsXaHwsCzaTIbyhIOuQliKE728gtt4CoMjkH4y8Xs
Ay2xPhgrDo8lTTlDny1w3CdW1xOnqtTgMVuLWUPQyY00mdqn4ezH9OlxxSCfqSuv
2pzMXtwCpRnqyRiIUSdtnTgq6iuhBZNmApBAbKS6n9wGOsM9+AJb2PCmsUOp075y
aPiuTYulll5gkK2pT3XJ
=+C5+
-----END PGP SIGNATURE-----

--DBIVS5p969aUjpLe--

