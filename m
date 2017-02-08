Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cbShU-0007z2-EB
	for mharc-qemu-trivial@gnu.org; Wed, 08 Feb 2017 08:54:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1cbShR-0007wm-Qu
	for qemu-trivial@nongnu.org; Wed, 08 Feb 2017 08:54:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1cbShR-0002zN-0W
	for qemu-trivial@nongnu.org; Wed, 08 Feb 2017 08:54:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46584)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1cbShK-0002xO-0J; Wed, 08 Feb 2017 08:54:14 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1B5DA7E9CE;
	Wed,  8 Feb 2017 13:54:14 +0000 (UTC)
Received: from [10.40.204.240] (ovpn-204-240.brq.redhat.com [10.40.204.240])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v18DsBPE002452
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 8 Feb 2017 08:54:13 -0500
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
References: <20170208080900.4092-1-marcandre.lureau@redhat.com>
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org
From: Max Reitz <mreitz@redhat.com>
Message-ID: <58a6feee-8828-d159-daf9-b460a6c0c7c4@redhat.com>
Date: Wed, 8 Feb 2017 14:54:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170208080900.4092-1-marcandre.lureau@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="bUdXavUBbbQPOfDvjod3tAO3tBkAaD3wE"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 08 Feb 2017 13:54:14 +0000 (UTC)
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
X-List-Received-Date: Wed, 08 Feb 2017 13:54:23 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bUdXavUBbbQPOfDvjod3tAO3tBkAaD3wE
Content-Type: multipart/mixed; boundary="VnkGW0n6fJucBRwQtRQSU4F0AL4CbBqwM";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org
Message-ID: <58a6feee-8828-d159-daf9-b460a6c0c7c4@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] qcow2: remove useless NULL check
References: <20170208080900.4092-1-marcandre.lureau@redhat.com>
In-Reply-To: <20170208080900.4092-1-marcandre.lureau@redhat.com>

--VnkGW0n6fJucBRwQtRQSU4F0AL4CbBqwM
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 08.02.2017 09:09, Marc-Andr=C3=A9 Lureau wrote:
> g_strdup() already handles the case where the argument is NULL.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  block/qcow2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
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

bs->backing_file and bs->backing_format are arrays. They will never be NU=
LL.

The ternary operator tests backing_file and backing_fmt which instead
are pointers. So this is not an equivalent conversion.

Max

> =20
>      return qcow2_update_header(bs);
>  }
>=20



--VnkGW0n6fJucBRwQtRQSU4F0AL4CbBqwM--

--bUdXavUBbbQPOfDvjod3tAO3tBkAaD3wE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFGBAEBCAAwFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAlibIwISHG1yZWl0ekBy
ZWRoYXQuY29tAAoJEPQH2wBh1c9AbcUIAIlKr9DwOEPllHrl+mxot3CwLSfzS4lV
dlgqj84NIeqdaKJmqA1z1+2zj7QhZsO6ZXiH4vbfGZY4vN0u/vdeBc5M/6h4B9ut
rmJqnVLycSi1aJ1Ar0J1gxhRenkcGa1CzskhWIWTMzTVp5a4ulZctW00a2RFUdDa
bokFc36KAvYoPA6vowyRAewr6438fDBP8RNBmbQ4x1Qrjya5/5qRB53b0iRdwuiK
02o0p25JKKS0DZMWzlMpiy927tReuDffY6fOmqxTCMIKhRhekDM23pfzQVf4u0Zz
OkaI82a/Snrtmnkhxjvr1Cf1/Z/xs5FTiEiWzV1COHd+iIQ2ZkP9Q2E=
=w3B5
-----END PGP SIGNATURE-----

--bUdXavUBbbQPOfDvjod3tAO3tBkAaD3wE--

