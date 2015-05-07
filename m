Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YqPJi-0003eP-MX
	for mharc-qemu-trivial@gnu.org; Thu, 07 May 2015 13:10:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54892)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YqPJg-0003b8-7j
	for qemu-trivial@nongnu.org; Thu, 07 May 2015 13:10:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YqPJf-0004hj-Dk
	for qemu-trivial@nongnu.org; Thu, 07 May 2015 13:10:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58626)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YqPJZ-0004go-Vp; Thu, 07 May 2015 13:10:26 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id ACD33B5C06;
	Thu,  7 May 2015 17:10:25 +0000 (UTC)
Received: from [10.3.113.103] (ovpn-113-103.phx2.redhat.com [10.3.113.103])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t47HAP6A029191; Thu, 7 May 2015 13:10:25 -0400
Message-ID: <554B9C80.4030705@redhat.com>
Date: Thu, 07 May 2015 11:10:24 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <1431010706-13990-1-git-send-email-berto@igalia.com>
In-Reply-To: <1431010706-13990-1-git-send-email-berto@igalia.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="MJm4pOA09Tl5bo8sEWkutm3sBlrMxCLO2"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] docs: update BLOCK_IMAGE_CORRUPTED
	documentation
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
X-List-Received-Date: Thu, 07 May 2015 17:10:33 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MJm4pOA09Tl5bo8sEWkutm3sBlrMxCLO2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/07/2015 08:58 AM, Alberto Garcia wrote:
> Label the "size" and "offset" fields in BLOCK_IMAGE_CORRUPTED as
> optional, and clarify that the latter refers to the host's offset into
> the image.
>=20
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>  docs/qmp/qmp-events.txt | 5 +++--
>  qapi/block-core.json    | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--MJm4pOA09Tl5bo8sEWkutm3sBlrMxCLO2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVS5yAAAoJEKeha0olJ0NqnzIH/RA8svwodggAx8tz6kilcwSj
z/h931WBz1nOajbasyGCq4ddK9XznUM2XNYjRucfBKWt+8l8c+i0ROsiNlrNTcqI
yj/gXolgoloumhkps5WH+CxrrAswYsoklUi4MvUl/ZZI7RBw49x2qgRCc/TsQOlN
ZQRq82Fqt83budjXKx9fOeqf3jPUjVRW099fkb8ksa2xUUd6xTB3Yu8nAILZMznz
YDqus0uZznClTBVzjOPloTDYS2EPabVUTav0kwgys60EmP1ZQa/qcu2fdSxLEeL1
IgTl22cu9Y/fQW+L6fxHZ1vz3jpVllf/FX2hKm/K78oO1btAfHjwlo9Kpo5r/5A=
=mlAp
-----END PGP SIGNATURE-----

--MJm4pOA09Tl5bo8sEWkutm3sBlrMxCLO2--

