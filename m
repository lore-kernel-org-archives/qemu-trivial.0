Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfUXf-0000gZ-9P
	for mharc-qemu-trivial@gnu.org; Fri, 25 Sep 2015 11:04:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZfUXc-0000bL-Oe
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 11:04:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZfUXY-0000zm-QR
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 11:04:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33834)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ZfUXN-0000qg-IW; Fri, 25 Sep 2015 11:03:49 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 3125C461C3;
	Fri, 25 Sep 2015 15:03:49 +0000 (UTC)
Received: from [10.3.113.141] (ovpn-113-141.phx2.redhat.com [10.3.113.141])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8PF3mLg030624; Fri, 25 Sep 2015 11:03:48 -0400
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <1443189844-20341-1-git-send-email-marcandre.lureau@redhat.com>
	<1443189844-20341-3-git-send-email-marcandre.lureau@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <56056253.9070000@redhat.com>
Date: Fri, 25 Sep 2015 09:03:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1443189844-20341-3-git-send-email-marcandre.lureau@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="I5HtAEunfm1BWMdcu8liBgjdUtNa9vpgq"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 02/36] qapi: add missing @
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
X-List-Received-Date: Fri, 25 Sep 2015 15:04:05 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--I5HtAEunfm1BWMdcu8liBgjdUtNa9vpgq
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/25/2015 08:03 AM, marcandre.lureau@redhat.com wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  qapi/block.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Adding qemu-trivial; this can be taken now through trivial tree without
waiting for pending qapi patches.

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--I5HtAEunfm1BWMdcu8liBgjdUtNa9vpgq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWBWJUAAoJEKeha0olJ0NqDz8H+QHz/Mr1JlULKlfko5ECWPVj
wPeP5OEwMjJGnkKn9ny/aOfuo2BVl/IIJGVWOORTAQ26NY5EKGjcIEe2LhwHJpep
YaBTzdJPMdoUZ4lIBJiMbzJ6vNPeKabbsm3AqsSAWHgJPzhLCwap7dLtXBfIt+q+
PAN7JqBRX92X+huoRwMwaIv5t/uxukgrm7YevicOg1HAGE4hpuLEetitFYAscSN9
PN68fACm+bJm4CenugZAHMpnP/w66C97a7OapxqDhQ69/KFcILOK2Mg2bwMR6Rui
9vPwTLGCJps5VHnbH2hbVeSel5O8U8dNd1fyuXOBfUd/7TqNtaPF+lPlA0F/1MQ=
=QsFs
-----END PGP SIGNATURE-----

--I5HtAEunfm1BWMdcu8liBgjdUtNa9vpgq--

