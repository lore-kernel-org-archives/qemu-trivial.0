Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVkbG-0005Av-Bo
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jul 2017 16:20:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dVkbD-00058k-RO
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 16:20:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dVkbC-00042h-EQ
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 16:20:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38646)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dVkb5-0003zh-HA; Thu, 13 Jul 2017 16:20:27 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E55BA4F9C;
	Thu, 13 Jul 2017 20:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6E55BA4F9C
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 6E55BA4F9C
Received: from [10.10.121.60] (ovpn-121-60.rdu2.redhat.com [10.10.121.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9523468D2A;
	Thu, 13 Jul 2017 20:20:22 +0000 (UTC)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-10-marcandre.lureau@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
	"open list:vpc" <qemu-block@nongnu.org>, qemu-trivial@nongnu.org,
	Max Reitz <mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <afed39a8-703e-96de-d06d-f652fbbb967e@redhat.com>
Date: Thu, 13 Jul 2017 15:20:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-10-marcandre.lureau@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="eoGH53AQIS4SDgCKvRR9QC4rlmnQl5Xs1"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 13 Jul 2017 20:20:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 09/29] vpc: use
 DIV_ROUND_UP
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
X-List-Received-Date: Thu, 13 Jul 2017 20:20:37 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--eoGH53AQIS4SDgCKvRR9QC4rlmnQl5Xs1
Content-Type: multipart/mixed; boundary="aROglMIwvgsLR3c0xX6t4HdaJbTpSdhRs";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
 "open list:vpc" <qemu-block@nongnu.org>, qemu-trivial@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Message-ID: <afed39a8-703e-96de-d06d-f652fbbb967e@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2 09/29] vpc: use DIV_ROUND_UP
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
 <20170713163219.9024-10-marcandre.lureau@redhat.com>
In-Reply-To: <20170713163219.9024-10-marcandre.lureau@redhat.com>

--aROglMIwvgsLR3c0xX6t4HdaJbTpSdhRs
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/13/2017 11:31 AM, Marc-Andr=C3=A9 Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  block/vpc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/block/vpc.c b/block/vpc.c
> index 9a6f8173a5..c88dc72491 100644
> --- a/block/vpc.c
> +++ b/block/vpc.c
> @@ -760,7 +760,7 @@ static int calculate_geometry(int64_t total_sectors=
, uint16_t* cyls,
>      } else {
>          *secs_per_cyl =3D 17;
>          cyls_times_heads =3D total_sectors / *secs_per_cyl;
> -        *heads =3D (cyls_times_heads + 1023) / 1024;
> +        *heads =3D DIV_ROUND_UP(cyls_times_heads, 1024);
> =20
>          if (*heads < 4) {
>              *heads =3D 4;
> @@ -813,7 +813,7 @@ static int create_dynamic_disk(BlockBackend *blk, u=
int8_t *buf,
>      offset =3D 3 * 512;
> =20
>      memset(buf, 0xFF, 512);
> -    for (i =3D 0; i < (num_bat_entries * 4 + 511) / 512; i++) {
> +    for (i =3D 0; i < DIV_ROUND_UP(num_bat_entries * 4, 512); i++) {
>          ret =3D blk_pwrite(blk, offset, buf, 512, 0);
>          if (ret < 0) {
>              goto fail;
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--aROglMIwvgsLR3c0xX6t4HdaJbTpSdhRs--

--eoGH53AQIS4SDgCKvRR9QC4rlmnQl5Xs1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZZ9YFAAoJEKeha0olJ0NqlngH/RZ+rurzZcfjMv9slQ0Te3P5
s3rvXtXQoAE7AcvNFOB6TThfeeCbtgi4xDToR17zrX/JrYDzpU3zwXx9vyA1Qcvu
mnJGq9gYFFwHvV3WYpzTpljHgCWt6tN+3IMYi2x+VHKTYeFRGFuGfkAD3/tJkSCn
4HJS2vh4tpOALXbdhiy1X/PKb9ffbB2U4EKkj5aOWtbGCL2CegzCvhRwqf8TDECv
YdujPEy7ROKJg3Od9abVgYORIyGBUxeAdQIJnJKH763OMEcNXwGN0VX62AqfhPQ/
mHVKtzKrnxvO6sFqCh2lmf9+bAQ5b8BGz0anQqr/FpeWUyIhDh1OrqtlbZF1j1g=
=O++8
-----END PGP SIGNATURE-----

--eoGH53AQIS4SDgCKvRR9QC4rlmnQl5Xs1--

