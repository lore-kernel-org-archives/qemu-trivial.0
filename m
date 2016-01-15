Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aK87X-0004qz-0v
	for mharc-qemu-trivial@gnu.org; Fri, 15 Jan 2016 12:25:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1aK87U-0004oB-It
	for qemu-trivial@nongnu.org; Fri, 15 Jan 2016 12:25:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1aK87T-0000H1-NS
	for qemu-trivial@nongnu.org; Fri, 15 Jan 2016 12:25:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40746)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1aK87P-0000By-FB; Fri, 15 Jan 2016 12:24:59 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 583FEA0792;
	Fri, 15 Jan 2016 17:24:58 +0000 (UTC)
Received: from [10.3.113.164] (ovpn-113-164.phx2.redhat.com [10.3.113.164])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0FHOvGv012065; Fri, 15 Jan 2016 12:24:58 -0500
To: Greg Kurz <gkurz@linux.vnet.ibm.com>, Michael Tokarev <mjt@tls.msk.ru>
References: <20160111173036.24764.59878.stgit@bahia.huguette.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <56992B69.4090605@redhat.com>
Date: Fri, 15 Jan 2016 10:24:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <20160111173036.24764.59878.stgit@bahia.huguette.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="AxjxqSfGSDKwBx6QrmUxdAhww0U55L518"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] trace: drop trailing empty
	strings
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
X-List-Received-Date: Fri, 15 Jan 2016 17:25:05 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AxjxqSfGSDKwBx6QrmUxdAhww0U55L518
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01/11/2016 10:30 AM, Greg Kurz wrote:
> Also fix a typo in the virtio_balloon_handle_output() trace while here.=

>=20
> Signed-off-by: Greg Kurz <gkurz@linux.vnet.ibm.com>
> ---
>  trace-events |   64 +++++++++++++++++++++++++++++---------------------=
--------
>  1 file changed, 32 insertions(+), 32 deletions(-)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--AxjxqSfGSDKwBx6QrmUxdAhww0U55L518
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWmStpAAoJEKeha0olJ0NqmHEH/1svnJF61SlDhnUztUU0La86
/XHy9SZb3Yp8fcJmW4Y8INsVme/pOee1bJDXbiNWb0U8IGRsVuMp94/UAaUFGi2R
bZPO2QWLg03b8dMYvFKmTjAJlAyKEQ+O1CS3WNcQrkbIeT+895pQnnzT9i4IHxoo
x7FKK+wNDVJc2iuLrKKrkJZg2zaC9JjLIZJx4drp3IPUTvTI8DNcN0a+u/W+OdEK
AnPURe77w2JCa785sghecqDL2jLP8PW8DxTODknNGu3uOHrFpvQXi++VjSE1isWY
RQ111SZzt6kfCjhmhT6730S4n6zxGG2ZGuMjXJ5e+J4aG4Exrw2pjN4rxTpVQD0=
=CTal
-----END PGP SIGNATURE-----

--AxjxqSfGSDKwBx6QrmUxdAhww0U55L518--

