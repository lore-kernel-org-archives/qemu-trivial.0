Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZVT1S-0000BF-D7
	for mharc-qemu-trivial@gnu.org; Fri, 28 Aug 2015 19:25:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZVT1Q-00008A-DM
	for qemu-trivial@nongnu.org; Fri, 28 Aug 2015 19:25:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZVT1P-0006OT-Ad
	for qemu-trivial@nongnu.org; Fri, 28 Aug 2015 19:25:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41145)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ZVT1K-0006Mu-Bq; Fri, 28 Aug 2015 19:25:18 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id CADB5461E4;
	Fri, 28 Aug 2015 23:25:17 +0000 (UTC)
Received: from [10.3.113.115] (ovpn-113-115.phx2.redhat.com [10.3.113.115])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7SNPGq2016160; Fri, 28 Aug 2015 19:25:17 -0400
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <1440672515-19053-1-git-send-email-marcandre.lureau@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <55E0EDD8.2060108@redhat.com>
Date: Fri, 28 Aug 2015 17:25:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1440672515-19053-1-git-send-email-marcandre.lureau@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="ndkDk35O9Gw6796noHGL3c6qL8ItAlNdA"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] docs: fix a
	qga/qapi-schema.json comment
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
X-List-Received-Date: Fri, 28 Aug 2015 23:25:25 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ndkDk35O9Gw6796noHGL3c6qL8ItAlNdA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 08/27/2015 04:48 AM, marcandre.lureau@redhat.com wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> For consistency with the rest of the comment blocks.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  qga/qapi-schema.json | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--ndkDk35O9Gw6796noHGL3c6qL8ItAlNdA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJV4O3YAAoJEKeha0olJ0NqHt8H/RGD5KB/wVexX3Q+uu23wkbS
JtF76PkRWxERZFWQQNi77arf8MNKi5g3vDM49YTqgyDcjNQsO46Qxg10719o4geE
ZI5Ch7fNkAr34kcYG0da7asDGU8+rNi0jrfA28H16N0+DlBf4yq5ccekm8Cky1nj
d3Eqfc08WOeB+AEcZYhhsx2hhjLGe4MJ5qWfmozNWTxtV1AzsT81Yy9ljw4ebmSh
KehUiOeOIUe84uYULHZPY8EEADfUmwumDhtoVsaMTPUHqL8FJ43aR/Szh5d2Yssk
5iT0G3rUptPqh8ZCjVqPJZKDDmZk2QzuZ41oAko661VCtbDMAE0xPkJZ4hlEmx8=
=qQSj
-----END PGP SIGNATURE-----

--ndkDk35O9Gw6796noHGL3c6qL8ItAlNdA--

