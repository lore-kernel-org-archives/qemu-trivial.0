Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YR5H9-0000U0-Ri
	for mharc-qemu-trivial@gnu.org; Thu, 26 Feb 2015 15:43:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YR5H6-0000T0-KB
	for qemu-trivial@nongnu.org; Thu, 26 Feb 2015 15:43:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YR5H0-0001F4-8A
	for qemu-trivial@nongnu.org; Thu, 26 Feb 2015 15:43:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43461)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YR5Gz-0001En-UU; Thu, 26 Feb 2015 15:43:06 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1QKh3hf005959
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 26 Feb 2015 15:43:04 -0500
Received: from [10.3.113.214] (ovpn-113-214.phx2.redhat.com [10.3.113.214])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1QKh3EM004383; Thu, 26 Feb 2015 15:43:03 -0500
Message-ID: <54EF8557.6000700@redhat.com>
Date: Thu, 26 Feb 2015 13:43:03 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Cole Robinson <crobinso@redhat.com>, qemu-devel@nongnu.org
References: <c0d13cbb078dfba50ad9b00e66be60ec0c6d6776.1424977076.git.crobinso@redhat.com>
In-Reply-To: <c0d13cbb078dfba50ad9b00e66be60ec0c6d6776.1424977076.git.crobinso@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="7mXHPKAxpnDx39TLMvoEjugnxgQ1Ig3o5"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qapi-schema: Fix
	SpiceChannel docs
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
X-List-Received-Date: Thu, 26 Feb 2015 20:43:13 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7mXHPKAxpnDx39TLMvoEjugnxgQ1Ig3o5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/26/2015 11:59 AM, Cole Robinson wrote:
> The value is called channel-type, not connection-type
>=20
> Signed-off-by: Cole Robinson <crobinso@redhat.com>
> ---
>  qapi-schema.json | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks for adding the extra context to make the email self-contained :)

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--7mXHPKAxpnDx39TLMvoEjugnxgQ1Ig3o5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJU74VXAAoJEKeha0olJ0NqLQcIAJKDwrgYcO79z98ImPvOs0Xz
OInDt9YFo/bA3BOCyAuMRIGmawXy93TlzqZUy+7jwT8fqIb8hiosxyj/3mbw4Pq8
uZ7ArlspXpzP7aIF23dsLxL4iutYRpB8gwhk9O2j0xBw7dRrHV5yVZ56hAJ5dfGq
PVVJg23FQZr/gOd+J3ceTylfK4oEhMttCYyRtkH4stR0kJWmc0Dhb3UUehtMesCQ
Gm9Fqdm5eCkZLPapbS9Ba6Rgxkm1BjcWNdAwLVp5rDyursbxx4BwE9TEshQW2z2I
jdLpQl0ByEVRlFSQa/MXGiaW6u9SPwMHoVPQpyyA5iVdfm8tiEjjuCN4U7TnsDw=
=KlYA
-----END PGP SIGNATURE-----

--7mXHPKAxpnDx39TLMvoEjugnxgQ1Ig3o5--

