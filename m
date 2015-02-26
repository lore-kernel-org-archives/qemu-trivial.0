Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YR0L2-0006uZ-KN
	for mharc-qemu-trivial@gnu.org; Thu, 26 Feb 2015 10:26:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56207)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YR0L0-0006to-Aa
	for qemu-trivial@nongnu.org; Thu, 26 Feb 2015 10:26:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YR0Kv-0004DZ-RB
	for qemu-trivial@nongnu.org; Thu, 26 Feb 2015 10:26:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46518)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YR0Kv-0004DJ-IJ; Thu, 26 Feb 2015 10:26:49 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1QFQ7de022534
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 26 Feb 2015 10:26:07 -0500
Received: from [10.3.113.127] (ovpn-113-127.phx2.redhat.com [10.3.113.127])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1QFQ5Bs026182; Thu, 26 Feb 2015 10:26:05 -0500
Message-ID: <54EF3AFE.9090206@redhat.com>
Date: Thu, 26 Feb 2015 08:25:50 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <6d7cb262a6c7071f1085f445dbdc0b2721f0f06e.1424961146.git.berto@igalia.com>
In-Reply-To: <6d7cb262a6c7071f1085f445dbdc0b2721f0f06e.1424961146.git.berto@igalia.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="nJwduDLGgHL9laKEvDjioBV79iVbFLxCO"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 1/1] qmp-commands.hx: Fix
	several typos
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
X-List-Received-Date: Thu, 26 Feb 2015 15:26:55 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nJwduDLGgHL9laKEvDjioBV79iVbFLxCO
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/26/2015 07:35 AM, Alberto Garcia wrote:
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>  qmp-commands.hx | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--nJwduDLGgHL9laKEvDjioBV79iVbFLxCO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJU7zr+AAoJEKeha0olJ0Nqjm8IAJj+YLMrqU9GwernIT1EkGqv
n2butGdn5IDUbfY3yAXKf+lpYxKHi62HqDhkmyA5gFF/2STnLD4dJdIL+ZRIagx2
dCcPE2Yacxp2/Akpy2lBJrK6DoibakeTG1u3bdGKRyEJ8pvws2nw3vPS/gY96q2E
honQwK3Dg7xtUVhrNAirDw1vcCenYDG79PItdgaRrg8R83d3o4un07tz999Wa6MH
4LLznj19goiKC6FeeY1/0+fdl8HsbPet07DSyWSpAOfv151+qLyyV1RaF54pGsxq
MF+xIy92Vpd/tBnFq9znrWgDLLs2E+4kzTfDQsvI6smcrBeGDXga3MgAmYEkRyo=
=AAKW
-----END PGP SIGNATURE-----

--nJwduDLGgHL9laKEvDjioBV79iVbFLxCO--

