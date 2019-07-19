Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hoUts-0003JZ-3L
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jul 2019 11:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33134)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eblake@redhat.com>) id 1hoUto-00035e-Ls
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 11:34:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1hoUtn-0000To-4n
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 11:34:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60590)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1hoUt0-0007Ul-9w; Fri, 19 Jul 2019 11:33:31 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 24000DF26;
 Fri, 19 Jul 2019 15:31:47 +0000 (UTC)
Received: from [10.3.116.46] (ovpn-116-46.phx2.redhat.com [10.3.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B15F810190C8;
 Fri, 19 Jul 2019 15:31:40 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-block@nongnu.org, Corey Minyard <minyard@acm.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Michael Tokarev <mjt@tls.msk.ru>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20190719131425.10835-1-philmd@redhat.com>
 <20190719131425.10835-2-philmd@redhat.com>
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
Message-ID: <4f37ed84-c903-ed4d-8ed1-8085cdd96273@redhat.com>
Date: Fri, 19 Jul 2019 10:31:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190719131425.10835-2-philmd@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="VXE49yeQo3o9BATBKez5RMoMFDEDguaoi"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Fri, 19 Jul 2019 15:31:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH-for-4.1? 1/7] json: Move
 switch 'fall through' comment to correct place
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
X-List-Received-Date: Fri, 19 Jul 2019 15:34:22 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VXE49yeQo3o9BATBKez5RMoMFDEDguaoi
Content-Type: multipart/mixed; boundary="xnOqt4pSHiZMBW3DS9AF3Z6QqJVkO0P1K";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-block@nongnu.org, Corey Minyard <minyard@acm.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Michael Tokarev <mjt@tls.msk.ru>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Message-ID: <4f37ed84-c903-ed4d-8ed1-8085cdd96273@redhat.com>
Subject: Re: [Qemu-devel] [PATCH-for-4.1? 1/7] json: Move switch 'fall
 through' comment to correct place
References: <20190719131425.10835-1-philmd@redhat.com>
 <20190719131425.10835-2-philmd@redhat.com>
In-Reply-To: <20190719131425.10835-2-philmd@redhat.com>

--xnOqt4pSHiZMBW3DS9AF3Z6QqJVkO0P1K
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/19/19 8:14 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Reported by GCC9 when building with CFLAG -Wimplicit-fallthrough=3D2:
>=20
>   qobject/json-parser.c: In function =E2=80=98parse_literal=E2=80=99:
>   qobject/json-parser.c:492:24: error: this statement may fall through =
[-Werror=3Dimplicit-fallthrough=3D]
>     492 |     case JSON_INTEGER: {
>         |                        ^
>   qobject/json-parser.c:524:5: note: here
>     524 |     case JSON_FLOAT:
>         |     ^~~~
>=20
> Correctly place the 'fall through' comment.
>=20
> Reported-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  qobject/json-parser.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--xnOqt4pSHiZMBW3DS9AF3Z6QqJVkO0P1K--

--VXE49yeQo3o9BATBKez5RMoMFDEDguaoi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl0x4lsACgkQp6FrSiUn
Q2pQSAf9H7Fc9TMPVRFykyFJq4yDUOM/pd8MFLCScU65UXH81DlxpZ6MzlNn5kCo
Sdhbfv4ervPzNIbXiGkXlrm0RYvuRkZrtH4H67mrKtp/sL5wUVYSxet6ufPjpYiy
GpzAe9z/EyOt3hEu8eMTF/Ev3qKukWRCCLhLMnw/fERogmnoC/md/xP2dAadSe0H
7G5Eb2QfBgQUQWgZgCmZ68nFYMFypBi7XyrY0FXg+ZCv2jctbHEBFD8X4fTq9Qte
Pkg7Fj6YDXKJE7FAPLSCAG4O1LfIyVj9Tns34fSNI7jZZCkYsb2PLtN3Wely3iMp
xVg5abcMNz9xNt0VsT34EJVR7wpL5Q==
=D/ge
-----END PGP SIGNATURE-----

--VXE49yeQo3o9BATBKez5RMoMFDEDguaoi--

