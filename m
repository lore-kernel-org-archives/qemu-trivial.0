Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZiK9-0004EU-MH
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:43:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53058)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dZiK7-0004Cn-CK
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:43:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dZiK6-0004xy-Dd
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:43:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47678)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dZiJq-0004mZ-EY; Mon, 24 Jul 2017 14:43:02 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6426B4E34C;
	Mon, 24 Jul 2017 18:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6426B4E34C
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 6426B4E34C
Received: from [10.10.121.48] (ovpn-121-48.rdu2.redhat.com [10.10.121.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D68936953F;
	Mon, 24 Jul 2017 18:42:57 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-7-f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <35e2489f-9cd6-ae5e-39b6-297b6cf5d2ea@redhat.com>
Date: Mon, 24 Jul 2017 13:42:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170724182751.18261-7-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="g9xG711AHTVvGapTMPBLr7qWm4S3Pkg5K"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 24 Jul 2017 18:43:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for 2.10 06/35] qcow2: remove
 inconsistent check
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Jul 2017 18:43:20 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--g9xG711AHTVvGapTMPBLr7qWm4S3Pkg5K
Content-Type: multipart/mixed; boundary="POgWAstf0AB4qcvntoeMm0RpS1i4PJeUR";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Message-ID: <35e2489f-9cd6-ae5e-39b6-297b6cf5d2ea@redhat.com>
Subject: Re: [PATCH for 2.10 06/35] qcow2: remove inconsistent check
References: <20170724182751.18261-1-f4bug@amsat.org>
 <20170724182751.18261-7-f4bug@amsat.org>
In-Reply-To: <20170724182751.18261-7-f4bug@amsat.org>

--POgWAstf0AB4qcvntoeMm0RpS1i4PJeUR
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/24/2017 01:27 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> This is equivalent to assert(russian roulette) so better remove it.
>=20
> block/qcow2-bitmap.c:259:29: warning: The left operand of '=3D=3D' is a=
 garbage value
>         assert(bitmap_table =3D=3D NULL);
>                ~~~~~~~~~~~~ ^
>=20
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  block/qcow2-bitmap.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
> index 3e8735a20d..fe72df5057 100644
> --- a/block/qcow2-bitmap.c
> +++ b/block/qcow2-bitmap.c
> @@ -254,7 +254,6 @@ static int free_bitmap_clusters(BlockDriverState *b=
s, Qcow2BitmapTable *tb)
> =20
>      ret =3D bitmap_table_load(bs, tb, &bitmap_table);
>      if (ret < 0) {
> -        assert(bitmap_table =3D=3D NULL);

Rather, we should fix bitmap_table_load() to ensure that bitmap_table is
always assigned, even on error.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--POgWAstf0AB4qcvntoeMm0RpS1i4PJeUR--

--g9xG711AHTVvGapTMPBLr7qWm4S3Pkg5K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAll2P7EACgkQp6FrSiUn
Q2r1SAf/VqA4NbLXcKvUiH/rGqtgxVrCqyqpsE6dTzaNGFJ+gvUC723uXZesFju2
2YntV/Dp3HEl3ua+clHeMphK5ihiUpIW+6zlmGYmDmA8HDAJZKV2AW/EeLA8bR4Y
H4k0Qd1LQzzN9T/1X7v3+yYE8maxb49qblAGiddw6YjzKHAAnYUBy2SbAhmf3Ytc
NA1qfBjOjgRoAduvTgJBbcbAfQ9iQJsCM6vALmt0HHjYqnKOiJ5jJfNAiRxGrFOm
EbPsYnbXzasnN1mtYnSKNiMjlVHnVUpAEB/B2WifhzpIVSVKMAybqXshHdtbHBql
uwSUrhhaTYDc6IZgVKqPhIbag/4bBw==
=2dx2
-----END PGP SIGNATURE-----

--g9xG711AHTVvGapTMPBLr7qWm4S3Pkg5K--

