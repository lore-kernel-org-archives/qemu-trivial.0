Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a6rPS-0000Ug-Pw
	for mharc-qemu-trivial@gnu.org; Wed, 09 Dec 2015 21:56:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35204)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1a6rPR-0000Tl-2r
	for qemu-trivial@nongnu.org; Wed, 09 Dec 2015 21:56:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1a6rPQ-0005gi-8R
	for qemu-trivial@nongnu.org; Wed, 09 Dec 2015 21:56:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43917)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1a6rPM-0005g5-24; Wed, 09 Dec 2015 21:56:40 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 627778E3E7;
	Thu, 10 Dec 2015 02:56:39 +0000 (UTC)
Received: from [10.3.113.183] (ovpn-113-183.phx2.redhat.com [10.3.113.183])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBA2uc8X016676; Wed, 9 Dec 2015 21:56:39 -0500
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <1449708466-13366-1-git-send-email-marcandre.lureau@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <5668E9E6.4020603@redhat.com>
Date: Wed, 9 Dec 2015 19:56:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1449708466-13366-1-git-send-email-marcandre.lureau@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="htVU8xr8RjINuusonv4fd6Je5CJaXUVu9"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] configure: remove
 unused or undefined variables
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
X-List-Received-Date: Thu, 10 Dec 2015 02:56:46 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--htVU8xr8RjINuusonv4fd6Je5CJaXUVu9
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/09/2015 05:47 PM, marcandre.lureau@redhat.com wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> Found thanks to shellcheck!

When sending two or more patches in a series, it's best to also include
a 0/2 cover letter.  It doesn't matter how trivial the patches are;
series are handled better by the tooling when they have a cover.

>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  configure | 6 ------
>  1 file changed, 6 deletions(-)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--htVU8xr8RjINuusonv4fd6Je5CJaXUVu9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWaOnmAAoJEKeha0olJ0NqtooH/0DathrPZ+al1pTLjrrV8mvB
9AOw8PoJFdH1kInS5uuOd9TwA9F+qoMteiShrVnQA/3vzck4bEjoIdiRiR2DNt6I
tPmspbfjnkR1DHMiAvMBgkpWcLy0veFZhEBLI7Y2c9KRcltGOH0jwvbf3WEb3dHH
fYjGqgCJ6bV1sYgEeQg6jmag9bZ9gVqUCdyRhpgfpcPx51wFP//EibFd8ZIXlSK+
EjtX/LJOqDym4FcAS0s+rfscXiZ6RglVRtwaHSHAyW2GpNbNu/I/UYLCmxv0J3ip
6MAnSjOCUt10dhCxBmrY0zK1OgO8WgSX3Spv7BZixzUl32DTRaOCxWcTo0JUUBI=
=Glyr
-----END PGP SIGNATURE-----

--htVU8xr8RjINuusonv4fd6Je5CJaXUVu9--

