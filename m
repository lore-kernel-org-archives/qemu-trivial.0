Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZHDYM-0004MM-Ng
	for mharc-qemu-trivial@gnu.org; Mon, 20 Jul 2015 12:04:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZHDYG-0004E8-IW
	for qemu-trivial@nongnu.org; Mon, 20 Jul 2015 12:04:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZHDYC-0007FX-BI
	for qemu-trivial@nongnu.org; Mon, 20 Jul 2015 12:04:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56327)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ZHDY5-0007C2-Ps; Mon, 20 Jul 2015 12:04:13 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 08CEC9239B;
	Mon, 20 Jul 2015 16:04:13 +0000 (UTC)
Received: from [10.3.113.112] (ovpn-113-112.phx2.redhat.com [10.3.113.112])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6KG4C0Q011059; Mon, 20 Jul 2015 12:04:12 -0400
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1437338062-26577-1-git-send-email-peter.maydell@linaro.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <55AD1BF7.4020305@redhat.com>
Date: Mon, 20 Jul 2015 10:04:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1437338062-26577-1-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="OgCmAS3wIlvLfLPuVbmIiJT4TRccG9qNR"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-common.h: Document
 cutils.c string functions
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
X-List-Received-Date: Mon, 20 Jul 2015 16:04:27 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OgCmAS3wIlvLfLPuVbmIiJT4TRccG9qNR
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 07/19/2015 02:34 PM, Peter Maydell wrote:
> Add documentation comments for various utility string functions
> which we have implemented in util/cutils.c:
>  pstrcpy()
>  strpadcpy()
>  pstrcat()
>  strstart()
>  stristart()
>  qemu_strnlen()
>  qemu_strsep()
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> We recommend pstrcpy() &c in HACKING but that's not very helpful
> if we don't actually document their behaviour...

Don't know if we care about US vs. UK spelling in doc comments, so I'll
ignore it, and give:

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
>  include/qemu-common.h | 114 ++++++++++++++++++++++++++++++++++++++++++=
+++++++-
>  1 file changed, 113 insertions(+), 1 deletion(-)
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--OgCmAS3wIlvLfLPuVbmIiJT4TRccG9qNR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVrRv3AAoJEKeha0olJ0Nq9xIIAJTT9iU75uLuRZcx/cHP9QgJ
BMhDKFk/9WNufBjtmf1GRuT4lKQ2xHXZzCzO+dH0W59eF0vndR+9d/Flw6cLn1XJ
+YTKsx/q3D27qEX5IizqPbmXdbw66R120lGHTXxRrlHQon70x2Tvl7M5d7M7dumO
sn3pnLrHKpyYH8FL7XtV5eoJsJzPhTFfiWXb58aI5NHTlHLmBfLWVANKDFCFfLbp
bjoXLfFE6i9ijo3Jua1sLnDTAsfh70P9Rc//Cgc5dvEznfWfYMzwQ0Ihf+VYmGFT
IaS565DLZAeSpPFHywUyxYk7UBielQXPzKS/sXTdTZZD+mu5Ss0OBpA59YHdMIQ=
=jAs3
-----END PGP SIGNATURE-----

--OgCmAS3wIlvLfLPuVbmIiJT4TRccG9qNR--

