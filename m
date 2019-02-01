Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gpdDG-0006Jm-Ji
	for mharc-qemu-trivial@gnu.org; Fri, 01 Feb 2019 13:06:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gpdDE-0006Hq-3V
	for qemu-trivial@nongnu.org; Fri, 01 Feb 2019 13:06:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gpdDB-0006cW-JK
	for qemu-trivial@nongnu.org; Fri, 01 Feb 2019 13:06:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39648)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gpdCq-0006S2-9r; Fri, 01 Feb 2019 13:06:24 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7B77012B2D;
	Fri,  1 Feb 2019 18:06:17 +0000 (UTC)
Received: from [10.3.117.44] (ovpn-117-44.phx2.redhat.com [10.3.117.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10C1D5DD78;
	Fri,  1 Feb 2019 18:06:16 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190201173655.4567-1-peter.maydell@linaro.org>
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
Message-ID: <c669dce9-ea5c-3f36-8d05-647abbee738f@redhat.com>
Date: Fri, 1 Feb 2019 12:06:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190201173655.4567-1-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="l880JIMxKEer7aXS5I0l6vXpJkjcdjvr0"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 01 Feb 2019 18:06:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-common.h: Update
 copyright string for 2019
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
X-List-Received-Date: Fri, 01 Feb 2019 18:06:49 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--l880JIMxKEer7aXS5I0l6vXpJkjcdjvr0
Content-Type: multipart/mixed; boundary="fuhIMh25c2Khg8TcpE6C9NEecXyrXZD7g";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Message-ID: <c669dce9-ea5c-3f36-8d05-647abbee738f@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] qemu-common.h: Update copyright string for
 2019
References: <20190201173655.4567-1-peter.maydell@linaro.org>
In-Reply-To: <20190201173655.4567-1-peter.maydell@linaro.org>

--fuhIMh25c2Khg8TcpE6C9NEecXyrXZD7g
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2/1/19 11:36 AM, Peter Maydell wrote:
> Update the copyright string we use in version/help output,
> since we're well into the new year now.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Better than last year, where we didn't get round to doing
> the year bump until September :-)

And at least this time, done before we release :)

> ---
>  include/qemu-common.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--fuhIMh25c2Khg8TcpE6C9NEecXyrXZD7g--

--l880JIMxKEer7aXS5I0l6vXpJkjcdjvr0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlxUipgACgkQp6FrSiUn
Q2rHKwf/XU5KrdL/Zk3jHbyVyec6XcZiqSHscrBHmuwxjwu1wAyJGrLSbrv6MSFE
I7Rs6Zrw9WGpdw7Q2kbIHXcf24p0bqVtAc09IgROfIr3D9wJRC9HC0uvDWiCOUho
14wnNeriqU8uXVD7h99qUROY4IdkX5w+YvIi3o0fy3zlfKQXIln4gFGMOkWALCBr
gHYGiczdCpsF4m8tDhadPXbL+tX23z+o3HjgcvBx+6IYqGpA9RWC+u3huppy/Q2F
tfnWrYZeNXm+qFERsHra7yXfjeI0yzMh8EybCPxXBo/iPTM/QHj959wS7FCsrgtM
kofOY3YFY8MJkVP6Q5VPtdXH3cK7vg==
=Octj
-----END PGP SIGNATURE-----

--l880JIMxKEer7aXS5I0l6vXpJkjcdjvr0--

