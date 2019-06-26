Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgHIB-00028g-3k
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jun 2019 19:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51037)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eblake@redhat.com>) id 1hgHI8-00022q-Ms
 for qemu-trivial@nongnu.org; Wed, 26 Jun 2019 19:25:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1hgHI7-000789-HL
 for qemu-trivial@nongnu.org; Wed, 26 Jun 2019 19:25:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46484)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1hgHI2-00075O-OV; Wed, 26 Jun 2019 19:25:22 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 04F68C058CBD;
 Wed, 26 Jun 2019 23:25:22 +0000 (UTC)
Received: from [10.3.116.44] (ovpn-116-44.phx2.redhat.com [10.3.116.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2B021001B0E;
 Wed, 26 Jun 2019 23:25:18 +0000 (UTC)
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Qemu-Trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 radmehrsaeed7@gmail.com, Max Reitz <mreitz@redhat.com>
References: <20190626215301.30733-1-jsnow@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=eblake@redhat.com; keydata=
 xsBNBEvHyWwBCACw7DwsQIh0kAbUXyqhfiKAKOTVu6OiMGffw2w90Ggrp4bdVKmCaEXlrVLU
 xphBM8mb+wsFkU+pq9YR621WXo9REYVIl0FxKeQo9dyQBZ/XvmUMka4NOmHtFg74nvkpJFCD
 TUNzmqfcjdKhfFV0d7P/ixKQeZr2WP1xMcjmAQY5YvQ2lUoHP43m8TtpB1LkjyYBCodd+LkV
 GmCx2Bop1LSblbvbrOm2bKpZdBPjncRNob73eTpIXEutvEaHH72LzpzksfcKM+M18cyRH+nP
 sAd98xIbVjm3Jm4k4d5oQyE2HwOur+trk2EcxTgdp17QapuWPwMfhaNq3runaX7x34zhABEB
 AAHNHkVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPsLAegQTAQgAJAIbAwULCQgHAwUV
 CgkICwUWAgMBAAIeAQIXgAUCS8fL9QIZAQAKCRCnoWtKJSdDahBHCACbl/5FGkUqJ89GAjeX
 RjpAeJtdKhujir0iS4CMSIng7fCiGZ0fNJCpL5RpViSo03Q7l37ss+No+dJI8KtAp6ID+PMz
 wTJe5Egtv/KGUKSDvOLYJ9WIIbftEObekP+GBpWP2+KbpADsc7EsNd70sYxExD3liwVJYqLc
 Rw7so1PEIFp+Ni9A1DrBR5NaJBnno2PHzHPTS9nmZVYm/4I32qkLXOcdX0XElO8VPDoVobG6
 gELf4v/vIImdmxLh/w5WctUpBhWWIfQDvSOW2VZDOihm7pzhQodr3QP/GDLfpK6wI7exeu3P
 pfPtqwa06s1pae3ad13mZGzkBdNKs1HEm8x6zsBNBEvHyWwBCADGkMFzFjmmyqAEn5D+Mt4P
 zPdO8NatsDw8Qit3Rmzu+kUygxyYbz52ZO40WUu7EgQ5kDTOeRPnTOd7awWDQcl1gGBXgrkR
 pAlQ0l0ReO57Q0eglFydLMi5bkwYhfY+TwDPMh3aOP5qBXkm4qIYSsxb8A+i00P72AqFb9Q7
 3weG/flxSPApLYQE5qWGSXjOkXJv42NGS6o6gd4RmD6Ap5e8ACo1lSMPfTpGzXlt4aRkBfvb
 NCfNsQikLZzFYDLbQgKBA33BDeV6vNJ9Cj0SgEGOkYyed4I6AbU0kIy1hHAm1r6+sAnEdIKj
 cHi3xWH/UPrZW5flM8Kqo14OTDkI9EtlABEBAAHCwF8EGAEIAAkFAkvHyWwCGwwACgkQp6Fr
 SiUnQ2q03wgAmRFGDeXzc58NX0NrDijUu0zx3Lns/qZ9VrkSWbNZBFjpWKaeL1fdVeE4TDGm
 I5mRRIsStjQzc2R9b+2VBUhlAqY1nAiBDv0Qnt+9cLiuEICeUwlyl42YdwpmY0ELcy5+u6wz
 mK/jxrYOpzXKDwLq5k4X+hmGuSNWWAN3gHiJqmJZPkhFPUIozZUCeEc76pS/IUN72NfprZmF
 Dp6/QDjDFtfS39bHSWXKVZUbqaMPqlj/z6Ugk027/3GUjHHr8WkeL1ezWepYDY7WSoXwfoAL
 2UXYsMAr/uUncSKlfjvArhsej0S4zbqim2ZY6S8aRWw94J3bSvJR+Nwbs34GPTD4Pg==
Organization: Red Hat, Inc.
Message-ID: <83019545-dd96-2618-a028-9c885e904591@redhat.com>
Date: Wed, 26 Jun 2019 18:25:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190626215301.30733-1-jsnow@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rke12gxMLVgPd7aEKDV69g22n3xOrVqgn"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Wed, 26 Jun 2019 23:25:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block/qcow: Improve error
 when opening qcow2 files as qcow
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Jun 2019 23:25:29 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rke12gxMLVgPd7aEKDV69g22n3xOrVqgn
Content-Type: multipart/mixed; boundary="YLC3OetuhHmXnso4Gsg16MJ994RF3yQHA";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Qemu-Trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 radmehrsaeed7@gmail.com, Max Reitz <mreitz@redhat.com>
Message-ID: <83019545-dd96-2618-a028-9c885e904591@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] block/qcow: Improve error when opening qcow2
 files as qcow
References: <20190626215301.30733-1-jsnow@redhat.com>
In-Reply-To: <20190626215301.30733-1-jsnow@redhat.com>

--YLC3OetuhHmXnso4Gsg16MJ994RF3yQHA
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/26/19 4:53 PM, John Snow wrote:
> Reported-by: radmehrsaeed7@gmail.com
> Fixes: https://bugs.launchpad.net/bugs/1832914
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  block/qcow.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Yes, this is useful.

Reviewed-by: Eric Blake <eblake@redhat.com>

Reminds me of when I helped convince the file(1) database maintainers
that 'qcow2 (v3)' was better than 'qcow (v3)'.
(https://bugzilla.redhat.com/show_bug.cgi?id=3D1654349, file.git 60b896d4=
)

>=20
> diff --git a/block/qcow.c b/block/qcow.c
> index 6dee5bb792..a9cb6ae0bd 100644
> --- a/block/qcow.c
> +++ b/block/qcow.c
> @@ -156,7 +156,12 @@ static int qcow_open(BlockDriverState *bs, QDict *=
options, int flags,
>          goto fail;
>      }
>      if (header.version !=3D QCOW_VERSION) {
> -        error_setg(errp, "Unsupported qcow version %" PRIu32, header.v=
ersion);
> +        error_setg(errp, "qcow (v%d) does not support qcow version %" =
PRIu32,
> +                   QCOW_VERSION, header.version);
> +        if (header.version =3D=3D 2 || header.version =3D=3D 3) {
> +            error_append_hint(errp, "Try the 'qcow2' driver instead.")=
;
> +        }
> +
>          ret =3D -ENOTSUP;
>          goto fail;
>      }
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--YLC3OetuhHmXnso4Gsg16MJ994RF3yQHA--

--rke12gxMLVgPd7aEKDV69g22n3xOrVqgn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl0T/t0ACgkQp6FrSiUn
Q2pWPQgAq0jRTp61n/HEaHqFLEOY/NTjYJ8DBYWdP4gNIGHFUVyCYvccSBEZptRJ
JXDWYtDI6ArPSH8/gSzhp1slCDl94OvYmy++Ggq8KL1yYkeh8mdpO0tt3IYqAI7A
rYYUiVsl3nrbZiw1MdKxKddQTeKfZit71UyWUE/7EcJMT+FhenX3no4FcXgyf+vs
e+j6n0Aj8fiSrCEwSG4BfUjYK1kfky8/5oTvFDNWnDbwdAHvWzkNNIPupSUcLwDs
eC3DToeWMiGy5UEvD8CpK0p6xlWphZ68uhrt5/2SZiK0k/9CG+0xcHnZyX5kGlPh
hCq3mEsJxSFcykerd61OjW9LK+hEEA==
=dHcv
-----END PGP SIGNATURE-----

--rke12gxMLVgPd7aEKDV69g22n3xOrVqgn--

