Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gj4Hl-0003kb-N0
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jan 2019 10:36:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gj4Hj-0003iA-2Z
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2019 10:36:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gj4Hh-0006kJ-8z
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2019 10:36:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59206)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gj4Hd-0006X9-NU; Mon, 14 Jan 2019 10:36:13 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF2FB3DBE6;
	Mon, 14 Jan 2019 15:36:12 +0000 (UTC)
Received: from [10.3.117.16] (ovpn-117-16.phx2.redhat.com [10.3.117.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C8227DFFF;
	Mon, 14 Jan 2019 15:36:12 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	Cleber Rosa <crosa@redhat.com>
References: <20190111201330.14473-1-eblake@redhat.com>
	<05f29d1e-11f0-62e0-af82-02a989e1c7b7@redhat.com>
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
Message-ID: <aae54881-da9b-f49f-24e3-86378adbf71f@redhat.com>
Date: Mon, 14 Jan 2019 09:36:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <05f29d1e-11f0-62e0-af82-02a989e1c7b7@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="jpu1IhMnRFdBHAopUPclphQpENspu1O5P"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 14 Jan 2019 15:36:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu.py: Fix error message
 when qemu dies from signal
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
X-List-Received-Date: Mon, 14 Jan 2019 15:36:20 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jpu1IhMnRFdBHAopUPclphQpENspu1O5P
Content-Type: multipart/mixed; boundary="8A2JsUW8Uzfm60PEcSrVR9WRaAWo6DvQE";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Message-ID: <aae54881-da9b-f49f-24e3-86378adbf71f@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] qemu.py: Fix error message when qemu dies
 from signal
References: <20190111201330.14473-1-eblake@redhat.com>
 <05f29d1e-11f0-62e0-af82-02a989e1c7b7@redhat.com>
In-Reply-To: <05f29d1e-11f0-62e0-af82-02a989e1c7b7@redhat.com>

--8A2JsUW8Uzfm60PEcSrVR9WRaAWo6DvQE
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/14/19 5:04 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Eric,
>=20
> On 1/11/19 9:13 PM, Eric Blake wrote:
>> When qemu dies from a signal, the python code gets a negative
>> value for exitcode; but signal numbers are positive.  Copy the
>> pattern used in qemu-iotests/iotests.py for reporting a positive
>> value.
>>
>> CC: qemu-trivial@nongnu.org
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>  scripts/qemu.py | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/qemu.py b/scripts/qemu.py
>> index 6e3b0e67719..0a5e02eb56e 100644
>> --- a/scripts/qemu.py
>> +++ b/scripts/qemu.py
>> @@ -351,7 +351,7 @@ class QEMUMachine(object):
>>                  command =3D ' '.join(self._qemu_full_args)
>>              else:
>>                  command =3D ''
>> -            LOG.warn(msg, exitcode, command)
>> +            LOG.warn(msg, -exitcode, command)
>=20
> What about displaying signal name directly?

If you want to do that, it should be a separate patch, and fix
iotests.py at the same time.


--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--8A2JsUW8Uzfm60PEcSrVR9WRaAWo6DvQE--

--jpu1IhMnRFdBHAopUPclphQpENspu1O5P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlw8rGsACgkQp6FrSiUn
Q2qRaAf/U9ASWZBV4TMfY0PWTNCB3ZPFiuExQydNYI2UEJfNyBjNsYMrS7CV4oDP
U185saTPSVIzViJJOixh5NrUK/V0XTl4IiaikTwui7RaPEHgStErDggezyZmbJ8M
ZDmG/+Ys22Zifvqi+aikEW7NRcOdFnzLyIht3OSRfgLEndhr88U3ZhT/GGwuy7/I
E24jT/ImaLTXq7N2d2fQatDBJXQ86RuIIIu/amt6bizoLfWiqsUpWEVMmOpBJWQT
yaSW/fA8U1E09V7syrC1ybLhG0j82MNrpKQNDTbi9Hlkl4wehj48EY1dy2u17SYh
hNI5zy6RmRMWp7+7tprSUuBe5kROBg==
=Nh7L
-----END PGP SIGNATURE-----

--jpu1IhMnRFdBHAopUPclphQpENspu1O5P--

