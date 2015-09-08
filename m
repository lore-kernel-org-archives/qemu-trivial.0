Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZOqQ-0001V3-B4
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2015 15:46:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33675)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZZOqI-0001L4-Vo
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 15:46:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZZOqH-0005sr-PT
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 15:46:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57434)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ZZOqA-0005qd-FG; Tue, 08 Sep 2015 15:46:02 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id BD6728DA34;
	Tue,  8 Sep 2015 19:46:01 +0000 (UTC)
Received: from [10.3.113.73] (ovpn-113-73.phx2.redhat.com [10.3.113.73])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t88Jk0c6022939; Tue, 8 Sep 2015 15:46:01 -0400
To: Veres Lajos <vlajos@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
References: <alpine.DEB.2.02.1508092307540.14941@citymarket.hu>
	<alpine.DEB.2.02.1509072243451.7825@citymarket.hu>
	<CAFEAcA8e8zXxZj09NdJ30CGEYbvsuVvdOy823DiTuaqAuwvR5g@mail.gmail.com>
	<alpine.DEB.2.02.1509081856120.7825@citymarket.hu>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <55EF3AF4.2090102@redhat.com>
Date: Tue, 8 Sep 2015 13:45:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1509081856120.7825@citymarket.hu>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="doXEpqKeuRscO5RP2G4DCobrSDja9ktnU"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] typofixes
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
X-List-Received-Date: Tue, 08 Sep 2015 19:46:15 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--doXEpqKeuRscO5RP2G4DCobrSDja9ktnU
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/08/2015 12:01 PM, Veres Lajos wrote:
> On Tue, 8 Sep 2015, Peter Maydell wrote:
>=20

In addition to the problems Peter pointed out,

> +++ b/target-cris/translate.c
> @@ -103,8 +103,8 @@ typedef struct DisasContext {
>      int cc_size_uptodate; /* -1 invalid or last written value.  */
> =20
>      int cc_x_uptodate;  /* 1 - ccs, 2 - known | X_FLAG. 0 not uptodate=
=2E  */
> -    int flags_uptodate; /* Wether or not $ccs is uptodate.  */
> -    int flagx_known; /* Wether or not flags_x has the x flag known at
> +    int flags_uptodate; /* Whether or not $ccs is uptodate.  */

s/uptodate/up-to-date/ in both comments

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--doXEpqKeuRscO5RP2G4DCobrSDja9ktnU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJV7zr0AAoJEKeha0olJ0NqchAH/2Fy7dzccLGCaIbNUllH48mB
cLjjtZshubCrriq4lEVWcrcTZODc4K4ZJG0Si/7MFwZyep61in+26uNiPzm+qma7
7vbu0ee8g8cYiZch9I04TCnhTGy7RM5XJUp6rjkK/E279E9zl3P2I5CSKQ2sx9fD
Q/fIJkEPyPmiu2RrNvJ/pzYQjGxtguN0X+6euWoEf6ZBqHoh+QWAp3yvGWTgxFQH
Vh0mPJazkJldIcZQgp/uvlhHtecy5QllLDWxyAXfLiUx3Og+R4IaeaHptk3q8XNh
jvxJ+tT5d84W2NWoPLjC77lS7iNSCIqdXg/uHBMwtbHUqoyVqd0izjXbHVBa6Dc=
=+JKd
-----END PGP SIGNATURE-----

--doXEpqKeuRscO5RP2G4DCobrSDja9ktnU--

