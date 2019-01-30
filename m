Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gorN1-0000U8-UA
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 10:01:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35035)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gorMz-0000SK-Hs
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 10:01:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gorMi-0001QN-MQ
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 10:01:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:24636)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gorMW-0001H6-5P; Wed, 30 Jan 2019 10:01:13 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5D072AAA87;
	Wed, 30 Jan 2019 15:01:03 +0000 (UTC)
Received: from [10.3.117.44] (ovpn-117-44.phx2.redhat.com [10.3.117.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98C2A600C6;
	Wed, 30 Jan 2019 15:01:02 +0000 (UTC)
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <1548769067-20792-1-git-send-email-thuth@redhat.com>
	<20190129145156.6719b8a4.cohuck@redhat.com>
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
Message-ID: <e3dfae55-8733-bd01-1f13-422f343fb258@redhat.com>
Date: Wed, 30 Jan 2019 09:01:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190129145156.6719b8a4.cohuck@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="uJpQ5UZ3pVQDnBqqqV75RfYNJwrtZo6J4"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 30 Jan 2019 15:01:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target/s390x: Fix LGPL
 version in the file header comments
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
X-List-Received-Date: Wed, 30 Jan 2019 15:01:42 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uJpQ5UZ3pVQDnBqqqV75RfYNJwrtZo6J4
Content-Type: multipart/mixed; boundary="xQDyK04nJ91iNslD6KZuQWx4Se308jfMJ";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Message-ID: <e3dfae55-8733-bd01-1f13-422f343fb258@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] target/s390x: Fix LGPL version in the file
 header comments
References: <1548769067-20792-1-git-send-email-thuth@redhat.com>
 <20190129145156.6719b8a4.cohuck@redhat.com>
In-Reply-To: <20190129145156.6719b8a4.cohuck@redhat.com>

--xQDyK04nJ91iNslD6KZuQWx4Se308jfMJ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/29/19 7:51 AM, Cornelia Huck wrote:
> On Tue, 29 Jan 2019 14:37:47 +0100
> Thomas Huth <thuth@redhat.com> wrote:
>=20
>> It's either "GNU *Library* General Public License version 2" or
>> "GNU Lesser General Public License version *2.1*", but there was
>> no "version 2.0" of the "Lesser" license. So assume that version
>> 2.1 is meant here.
>=20
> I think we can assume that.
>=20
> Given that there have been several of these cases (and that there's a
> lot of boilerplate in general): Should we adopt SPDX license
> identifiers for QEMU, as the Linux kernel did? They also discovered and=

> fixed some problems/oddities while at it.

I'm also in favor of SPDX license identifiers - their brevity and
machine-parsability favors more accurate usage and fewer copy/paste
mistake propagation.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--xQDyK04nJ91iNslD6KZuQWx4Se308jfMJ--

--uJpQ5UZ3pVQDnBqqqV75RfYNJwrtZo6J4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlxRvC0ACgkQp6FrSiUn
Q2pjyQf8CXc1r8WFH52ZnS4sAhopLr9EEQ+HPopE9PFv43DEj/Q2a3zRCHIYZrr4
7QzOt5LioTM+IA9zzzOkWsFeznJTxzqrdaRxcStk+6d9fWXZaxhacdfrQ4UNcLaP
JBJQwUWu1sc8yY093UyOOG6aJdskM/nHKx6/PX/+rQP185PClQYO8owrbyyAXDbo
5q6lMcYynTdL5Uz5Et6dG0r7UcAsZ+sChZtsi40ubhzjyHCFvjiI7c2/0e9de8WK
pt/euGLgnP48EsvRc6sauwfboJZPqdmPyL4mW2kjYO3GmbQaLofrPPKxyMeP0E90
Zri4rP9IIXb5TuLpngVtCWjUTa4Ssg==
=mzN6
-----END PGP SIGNATURE-----

--uJpQ5UZ3pVQDnBqqqV75RfYNJwrtZo6J4--

