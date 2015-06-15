Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z4VxI-0000q0-R1
	for mharc-qemu-trivial@gnu.org; Mon, 15 Jun 2015 11:05:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Z4VxG-0000lj-8a
	for qemu-trivial@nongnu.org; Mon, 15 Jun 2015 11:05:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Z4VxF-0007P3-AL
	for qemu-trivial@nongnu.org; Mon, 15 Jun 2015 11:05:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38430)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Z4Vx7-0007Ku-PI; Mon, 15 Jun 2015 11:05:33 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 5A693B6F3B;
	Mon, 15 Jun 2015 15:05:33 +0000 (UTC)
Received: from [10.3.113.115] (ovpn-113-115.phx2.redhat.com [10.3.113.115])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5FF5WJd003394; Mon, 15 Jun 2015 11:05:32 -0400
Message-ID: <557EE9BC.6080100@redhat.com>
Date: Mon, 15 Jun 2015 09:05:32 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <1434373972-22694-1-git-send-email-berto@igalia.com>
In-Reply-To: <1434373972-22694-1-git-send-email-berto@igalia.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="2TVasLwK7kBveKS3OacRR3I8OiqA1h1gU"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] throttle: Fix typo in the documentation
	of block_set_io_throttle
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
X-List-Received-Date: Mon, 15 Jun 2015 15:05:43 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2TVasLwK7kBveKS3OacRR3I8OiqA1h1gU
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/15/2015 07:12 AM, Alberto Garcia wrote:
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>  qapi/block-core.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index afa9d3d..793a01e 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -1083,7 +1083,7 @@
>  #
>  # I/O limits can be disabled by setting all of them to 0. In this case=

>  # the device will be removed from its group and the rest of its
> -# members will no be affected. The 'group' parameter is ignored.
> +# members will not be affected. The 'group' parameter is ignored.
>  #
>  # @device: The name of the device
>  #
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--2TVasLwK7kBveKS3OacRR3I8OiqA1h1gU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVfum8AAoJEKeha0olJ0NqJKMH/2ZKgTjyya2QhTU9kQvD9NNT
CWN8r7/sFkG4Hpu1q9EnoLTrG5Z76D6y7UWC6JnO46sUv78sYmxgo5vypYkkQtXC
Kf4DM1zGHG+uU3HM5qfpaQgKzbFtCAhYzgEoarK1oHvFtLEb6/THoqQvGEkIbEfT
ACXGQfvHxuHVhd693fx4zL38ZkiSPFxXqz1OZwdiNL6eNlVm54iRu+9tHkuP71IJ
gTil5hFUeCzgPoGP3JfFUJSp4LplgCIjU4KLay+a079CHtuqhbz7c7QurBIVEHdO
t92UjYNkY2dxu+aFXbt7FXHdGpY4EoXZMTWPWAFoD9KeLPb11vJhURh/syFzUvw=
=bx+z
-----END PGP SIGNATURE-----

--2TVasLwK7kBveKS3OacRR3I8OiqA1h1gU--

