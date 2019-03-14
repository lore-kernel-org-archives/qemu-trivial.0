Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4PSn-00032A-Pm
	for mharc-qemu-trivial@gnu.org; Thu, 14 Mar 2019 08:27:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1h4PSl-00030J-OZ
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 08:27:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1h4PSk-0001yM-OD
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 08:27:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51448)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1h4PSi-0001xh-Tg; Thu, 14 Mar 2019 08:27:53 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 30FF34024D;
	Thu, 14 Mar 2019 12:27:52 +0000 (UTC)
Received: from [10.3.118.35] (ovpn-118-35.phx2.redhat.com [10.3.118.35])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A189D6B8F4;
	Thu, 14 Mar 2019 12:27:51 +0000 (UTC)
To: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>
References: <20190314104622.101715-1-sgarzare@redhat.com>
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
Message-ID: <30b41a92-66da-2fe4-b550-1c1db2ab5189@redhat.com>
Date: Thu, 14 Mar 2019 07:27:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190314104622.101715-1-sgarzare@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="aMro0jdKVe6VjhhRaP1pljJ9YxjpJjnJe"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 14 Mar 2019 12:27:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-4.0 0/2] Update
 .gitignore and tests/.gitignore for in-tree builds
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
X-List-Received-Date: Thu, 14 Mar 2019 12:27:56 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--aMro0jdKVe6VjhhRaP1pljJ9YxjpJjnJe
Content-Type: multipart/mixed; boundary="2jXjC7vrn3RwU2sZjnAumRcfrdXUZ2vBZ";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Message-ID: <30b41a92-66da-2fe4-b550-1c1db2ab5189@redhat.com>
Subject: Re: [Qemu-devel] [PATCH for-4.0 0/2] Update .gitignore and
 tests/.gitignore for in-tree builds
References: <20190314104622.101715-1-sgarzare@redhat.com>
In-Reply-To: <20190314104622.101715-1-sgarzare@redhat.com>

--2jXjC7vrn3RwU2sZjnAumRcfrdXUZ2vBZ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 3/14/19 5:46 AM, Stefano Garzarella wrote:
> This series could be useless when we will no longer support in-tree bui=
lds,
> but for 4.0 I think it's useful to ignore these files.

series:
Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> Stefano Garzarella (2):
>   .gitignore: ignore docs/built created for in-tree builds
>   tests/.gitignore: ignore test-qapi-emit-events.[ch] for in-tree build=
s
>=20
>  .gitignore       | 1 +
>  tests/.gitignore | 1 +
>  2 files changed, 2 insertions(+)
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--2jXjC7vrn3RwU2sZjnAumRcfrdXUZ2vBZ--

--aMro0jdKVe6VjhhRaP1pljJ9YxjpJjnJe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlyKSMYACgkQp6FrSiUn
Q2p1iQgAgG8UhHLd1ALJkJwyX9jCqDRdHfKZieD0VrirsEW/6ynXLEH3PfI3+33R
7Qv1UHAIxdoxo6QdQElxx75n2VWvgH+njEqFB1MGAZd7tgyDh52xWiMTfYvtgMhK
avdojC/YXdxP3I21qmbAMpeaufU4thDooWrY46RCV0M5t2g/PfPIxF5mLjsGGgEv
zmLGnbUmgg8sHMNnj/utoTQQ+8Nouy+uoPEBGtkMVXEw13E9Qd4jz+Yr4pn3fZ3D
t3SG9L4LIIwETZrXkMOSf6twKo8XOKOLiSP2QBGFFsYF1LdLDo2V34HTRdwjST4v
PNklk/AQIDkM6wJz1wQIV5GejkGK0A==
=agWz
-----END PGP SIGNATURE-----

--aMro0jdKVe6VjhhRaP1pljJ9YxjpJjnJe--

