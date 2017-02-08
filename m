Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cbSgX-0007DM-Ro
	for mharc-qemu-trivial@gnu.org; Wed, 08 Feb 2017 08:53:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cbSgV-0007B5-IZ
	for qemu-trivial@nongnu.org; Wed, 08 Feb 2017 08:53:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cbSgU-0002UY-Ep
	for qemu-trivial@nongnu.org; Wed, 08 Feb 2017 08:53:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58340)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cbSgP-0002Pc-Fc; Wed, 08 Feb 2017 08:53:17 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 88C2DC04B31E;
	Wed,  8 Feb 2017 13:53:17 +0000 (UTC)
Received: from [10.10.123.32] (ovpn-123-32.rdu2.redhat.com [10.10.123.32] (may
	be forged))
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v18DrGxO016460; Wed, 8 Feb 2017 08:53:16 -0500
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
References: <20170208080900.4092-1-marcandre.lureau@redhat.com>
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <3dccbc96-1ba2-5cd5-041c-4ed071fddfcb@redhat.com>
Date: Wed, 8 Feb 2017 07:53:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170208080900.4092-1-marcandre.lureau@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="m2k6SrU6K9TT8IDNnBVsDTeWTRruX23jr"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 08 Feb 2017 13:53:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qcow2: remove useless NULL
 check
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
X-List-Received-Date: Wed, 08 Feb 2017 13:53:25 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--m2k6SrU6K9TT8IDNnBVsDTeWTRruX23jr
Content-Type: multipart/mixed; boundary="KnCG19mu39GmfPL5o52bcd340BFwgGTcp";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org
Message-ID: <3dccbc96-1ba2-5cd5-041c-4ed071fddfcb@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] qcow2: remove useless NULL check
References: <20170208080900.4092-1-marcandre.lureau@redhat.com>
In-Reply-To: <20170208080900.4092-1-marcandre.lureau@redhat.com>

--KnCG19mu39GmfPL5o52bcd340BFwgGTcp
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/08/2017 02:09 AM, Marc-Andr=C3=A9 Lureau wrote:
> g_strdup() already handles the case where the argument is NULL.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  block/qcow2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/block/qcow2.c b/block/qcow2.c
> index 96fb8a8f16..9114218030 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -2016,8 +2016,8 @@ static int qcow2_change_backing_file(BlockDriverS=
tate *bs,
>      g_free(s->image_backing_file);
>      g_free(s->image_backing_format);
> =20
> -    s->image_backing_file =3D backing_file ? g_strdup(bs->backing_file=
) : NULL;
> -    s->image_backing_format =3D backing_fmt ? g_strdup(bs->backing_for=
mat) : NULL;
> +    s->image_backing_file =3D g_strdup(bs->backing_file);
> +    s->image_backing_format =3D g_strdup(bs->backing_format);
> =20
>      return qcow2_update_header(bs);
>  }
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--KnCG19mu39GmfPL5o52bcd340BFwgGTcp--

--m2k6SrU6K9TT8IDNnBVsDTeWTRruX23jr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYmyLKAAoJEKeha0olJ0Nqt9YH/3G+n/+rDGknCLDDOHHwGtaV
TXsfLNqITpUpyhsKAcdwNaqiTNBDaE9fkJ+D/EnGVn8a+qP6foLqOAtJflH6C51L
O06I337v36e2hba9AO/lJVy3cK9aM76cK/+c2of+OEcjXArpu2DwIDRkyQwytai2
IM2Klz4s9bf3FxYeMAUNJmxz2btD4zageARb7kaf6J4qSutZzOMXeCEKKMx1F6YJ
yG+hqLoUS6XVpCEp/QwrSHtjMdwIMlcN/D0gGpzyMaO3vW2bGG5syHJfsO6F1T73
yM1yXXg/ssY9L4MJ+m7MWW+FUYt5OVRVoR6jo2RmP9UgtOiLuiatUmKAwq2Nj90=
=6gTy
-----END PGP SIGNATURE-----

--m2k6SrU6K9TT8IDNnBVsDTeWTRruX23jr--

