Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VcDUE-0001g0-6B
	for mharc-qemu-trivial@gnu.org; Fri, 01 Nov 2013 08:05:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1VcDU6-0001Zr-Vy
	for qemu-trivial@nongnu.org; Fri, 01 Nov 2013 08:05:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1VcDU1-0003um-Rn
	for qemu-trivial@nongnu.org; Fri, 01 Nov 2013 08:05:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47489)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1VcDTo-0003sj-H3; Fri, 01 Nov 2013 08:05:33 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rA1C5VXT002272
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 1 Nov 2013 08:05:31 -0400
Received: from [10.3.113.175] (ovpn-113-175.phx2.redhat.com [10.3.113.175])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rA1C5UUr017386; Fri, 1 Nov 2013 08:05:30 -0400
Message-ID: <5273990A.7070900@redhat.com>
Date: Fri, 01 Nov 2013 06:05:30 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <1383298529-10665-1-git-send-email-famz@redhat.com>
In-Reply-To: <1383298529-10665-1-git-send-email-famz@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="lS8oftiuNTgi9tJKtaAVj5lV7MU02X7IL"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, qemu-trivial <qemu-trivial@nongnu.org>,
	stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] qapi: Fix comment for create-type to
	match code.
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
X-List-Received-Date: Fri, 01 Nov 2013 12:05:56 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lS8oftiuNTgi9tJKtaAVj5lV7MU02X7IL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/01/2013 03:35 AM, Fam Zheng wrote:
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  qapi-schema.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/qapi-schema.json b/qapi-schema.json
> index 81a375b..76c98a7 100644
> --- a/qapi-schema.json
> +++ b/qapi-schema.json
> @@ -227,7 +227,7 @@
>  ##
>  # @ImageInfoSpecificVmdk:
>  #
> -# @create_type: The create type of VMDK image
> +# @create-type: The create type of VMDK image
>  #
>  # @cid: Content id of image
>  #

Reviewed-by: Eric Blake <eblake@redhat.com>

and adding qemu-trivial in case it's faster to pull in via that channel.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--lS8oftiuNTgi9tJKtaAVj5lV7MU02X7IL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJSc5kKAAoJEKeha0olJ0NqUnUH/2HVmGGOJzpHYptJW37DIBZ4
rKW3/HZ3ms194fhC6KYRfnxkcMTiBiavuLvbyWmlxrU2WqcR+51b/nHLWnAhI2so
gPQcO843YGyYVypYJXLQuS7uF35nm+sV4Umkals5phtlK6SaRBRSRyE5+ClAHv/I
XKQFwRtmXoq8sRFOOnxd84TcJ8cChMcLNdqccSYMoWZTuDjAGJDtrh31vci8OR4s
SPN4FELbCUV33UGa6sgsOiCK2dxi2uAFr4OEjAuhFZu0UQnwvBBxmlCXFdbEvipG
LU8Yl9pywQaGi+787dYOpP83LOOxyHTpmcVp36IAwaQrmSQwvFNEgdP1Fn/RwDE=
=Vbp4
-----END PGP SIGNATURE-----

--lS8oftiuNTgi9tJKtaAVj5lV7MU02X7IL--

