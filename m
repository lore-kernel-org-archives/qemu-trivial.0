Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVka7-0004Gd-QL
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jul 2017 16:19:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dVka3-00048D-Os
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 16:19:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dVka2-0003Q7-Qx
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 16:19:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37166)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dVkZw-0003Mt-70; Thu, 13 Jul 2017 16:19:16 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34A4EA4F9C;
	Thu, 13 Jul 2017 20:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 34A4EA4F9C
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 34A4EA4F9C
Received: from [10.10.121.60] (ovpn-121-60.rdu2.redhat.com [10.10.121.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 64AF917AE9;
	Thu, 13 Jul 2017 20:19:12 +0000 (UTC)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-4-marcandre.lureau@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
	"open list:VHDX" <qemu-block@nongnu.org>, qemu-trivial@nongnu.org,
	Jeff Cody <jcody@redhat.com>, Max Reitz <mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <047c933f-66d7-d9c8-ccd1-bbd8e1cb4fc2@redhat.com>
Date: Thu, 13 Jul 2017 15:19:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-4-marcandre.lureau@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="OLQCjO3dkEx6DaQ3FbCHQWeDQrSmpBW98"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 13 Jul 2017 20:19:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 03/29] vhdx: use
 QEMU_ALIGN_DOWN
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
X-List-Received-Date: Thu, 13 Jul 2017 20:19:24 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OLQCjO3dkEx6DaQ3FbCHQWeDQrSmpBW98
Content-Type: multipart/mixed; boundary="khhIXDVBk0koJSWxW7SqxWQrvcE3TVjTJ";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
 "open list:VHDX" <qemu-block@nongnu.org>, qemu-trivial@nongnu.org,
 Jeff Cody <jcody@redhat.com>, Max Reitz <mreitz@redhat.com>
Message-ID: <047c933f-66d7-d9c8-ccd1-bbd8e1cb4fc2@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2 03/29] vhdx: use QEMU_ALIGN_DOWN
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
 <20170713163219.9024-4-marcandre.lureau@redhat.com>
In-Reply-To: <20170713163219.9024-4-marcandre.lureau@redhat.com>

--khhIXDVBk0koJSWxW7SqxWQrvcE3TVjTJ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/13/2017 11:31 AM, Marc-Andr=C3=A9 Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  block/vhdx-log.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/block/vhdx-log.c b/block/vhdx-log.c
> index 01278f3fc9..ad70706b99 100644
> --- a/block/vhdx-log.c
> +++ b/block/vhdx-log.c
> @@ -884,7 +884,7 @@ static int vhdx_log_write(BlockDriverState *bs, BDR=
VVHDXState *s,
>      }
> =20
>      sector_offset =3D offset % VHDX_LOG_SECTOR_SIZE;
> -    file_offset =3D (offset / VHDX_LOG_SECTOR_SIZE) * VHDX_LOG_SECTOR_=
SIZE;
> +    file_offset =3D QEMU_ALIGN_DOWN(offset, VHDX_LOG_SECTOR_SIZE);
> =20
>      aligned_length =3D length;
> =20
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--khhIXDVBk0koJSWxW7SqxWQrvcE3TVjTJ--

--OLQCjO3dkEx6DaQ3FbCHQWeDQrSmpBW98
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZZ9W+AAoJEKeha0olJ0Nq71sH/j9juEwhzgdRQBITVCLsSI6C
aKEU6c7SThAXIyUFoCQIDbDFApb+ksMR8//i52AK/x29H9Jod/rdsgrE9iHIp0kg
QorDyJjN9B6cCgZkBVf7YaBZr01cCBmdP+i9lfNWDCPjcJmrf6kMaWxmj7V+SpUZ
lzVr493t5bsn7CWs7nXPLCCFmu/dvglrqCVbBYuvHdae/ZdpBNw+gu+EgC9E9I6I
q74W8g8V7vK2Y/yWJZ1XD6LFSi0niBfFjDZQpwTEZzJBKMy2gKwzeRKofWAXwQLj
/scXfN6V1uwl+XnN2Kqdy6rjfOGjKyDUpVCHEY5Ly8hzqarwT6mVD5ttNqtoW8Y=
=iyCi
-----END PGP SIGNATURE-----

--OLQCjO3dkEx6DaQ3FbCHQWeDQrSmpBW98--

