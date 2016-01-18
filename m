Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aLGSm-0005yI-0N
	for mharc-qemu-trivial@gnu.org; Mon, 18 Jan 2016 15:31:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49843)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1aLGSk-0005xE-Gl
	for qemu-trivial@nongnu.org; Mon, 18 Jan 2016 15:31:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1aLGSj-00051V-IM
	for qemu-trivial@nongnu.org; Mon, 18 Jan 2016 15:31:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59474)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1aLGSf-0004zd-7A; Mon, 18 Jan 2016 15:31:37 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id D88B3C0BF2C5;
	Mon, 18 Jan 2016 20:31:36 +0000 (UTC)
Received: from [10.3.113.211] (ovpn-113-211.phx2.redhat.com [10.3.113.211])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0IKVa9O030250; Mon, 18 Jan 2016 15:31:36 -0500
To: Christophe Fergeau <cfergeau@redhat.com>, qemu-devel@nongnu.org
References: <1453110679-23401-1-git-send-email-cfergeau@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <569D4BA8.8080600@redhat.com>
Date: Mon, 18 Jan 2016 13:31:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1453110679-23401-1-git-send-email-cfergeau@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="kI98JaktBilSOidqDX1u3Ev0ALgh9WeQ3"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] man:
 virtfs-proxy-helper: Rework awkward sentence
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
X-List-Received-Date: Mon, 18 Jan 2016 20:31:43 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kI98JaktBilSOidqDX1u3Ev0ALgh9WeQ3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01/18/2016 02:51 AM, Christophe Fergeau wrote:
> There was a 'capbilities' typo in this man page. This commit
> reformulates the sentence the typo was in to make it easier to grasp.
> This is based on a suggestion from Eric Blake.
>=20
> Signed-off-by: Christophe Fergeau <cfergeau@redhat.com>
> ---
> Changes since v1:
> - rather than just fixing the typo, reformulate the sentence it's in as=

>   suggested by Eric.
>=20
>=20
>  fsdev/virtfs-proxy-helper.texi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--kI98JaktBilSOidqDX1u3Ev0ALgh9WeQ3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWnUuoAAoJEKeha0olJ0NqGZgH/AtO61WuiTR0ti0V0W90W2s6
iALTX4tqaKyyw1I/9QgHSFdEMQfQvimT0wbob5wquE85L26Kdr6h7OI8Xs9DHQTO
aC85/cnj7ZS5qgE8Bx/DlZKPj7Ee0BaqZJwip9TjqdGEIhEbLO2MWaB07mf4euQL
PUgmLeRUL85ThJhKEpr74H6ZHiWON7U9hL8VQwVjaqrMeUH7ZaGRdMzSQxYfUqy+
jYALXJQitYgcG/XLWAfN90HOergSHnj3CoV4B2ht8RmFy/X5JAp+IK3mZw1Rs5dW
MSKYYxlerpEiWUzAF+lXR0jCKKmfNxTHTzpFPW6b8b6EmcaA8YLQpEg3r5RP96k=
=kBa6
-----END PGP SIGNATURE-----

--kI98JaktBilSOidqDX1u3Ev0ALgh9WeQ3--

