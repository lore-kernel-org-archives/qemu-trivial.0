Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqqKw-0006e9-O0
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 21:19:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gqqKv-0006e1-41
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 21:19:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gqqKt-00010I-00
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 21:19:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52516)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gqqFv-0006Sc-K6; Mon, 04 Feb 2019 21:14:36 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B2CBAEDDFF;
	Tue,  5 Feb 2019 02:14:23 +0000 (UTC)
Received: from [10.3.116.162] (ovpn-116-162.phx2.redhat.com [10.3.116.162])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 137EB67155;
	Tue,  5 Feb 2019 02:14:23 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
References: <20190204225542.5597-1-eblake@redhat.com>
	<9a93a2a0-f352-1fb6-eb27-49f607cd0b97@redhat.com>
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
Message-ID: <283d1622-7304-575c-5692-f4b7da983a45@redhat.com>
Date: Mon, 4 Feb 2019 20:14:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <9a93a2a0-f352-1fb6-eb27-49f607cd0b97@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="A7dL0YhAzlYqpJe2yV6RWGjaUI6ZVev31"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 05 Feb 2019 02:14:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] checkpatch: Flag
 suspicious attribution lines
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
X-List-Received-Date: Tue, 05 Feb 2019 02:19:45 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--A7dL0YhAzlYqpJe2yV6RWGjaUI6ZVev31
Content-Type: multipart/mixed; boundary="PH8w7KFTY48S9DOl1aNLfQzaqNT6Fi288";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
Message-ID: <283d1622-7304-575c-5692-f4b7da983a45@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2] checkpatch: Flag suspicious attribution
 lines
References: <20190204225542.5597-1-eblake@redhat.com>
 <9a93a2a0-f352-1fb6-eb27-49f607cd0b97@redhat.com>
In-Reply-To: <9a93a2a0-f352-1fb6-eb27-49f607cd0b97@redhat.com>

--PH8w7KFTY48S9DOl1aNLfQzaqNT6Fi288
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2/4/19 5:29 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 2/4/19 11:55 PM, Eric Blake wrote:
>> Flag commit attribution tags that are unusual (often because they
>> were a typo), but only as a warning (because sometimes a humorous
>> or otherwise useful tag is intentionally supplied).
>>
>> This picks the 6-most popular tags, each with 700 or more uses (well,
>> S-o-b was already checked for case-sensitivity and typos, leaving
>> only 5 new tags being checked), as determined by:
>> $ git log | sed -n 's/^ *\([A-Za-z-]*-by:\).*/\1/p' | \
>>   sort | uniq -c | sort -k1,1n | tail

Use of [bB][yY] finds a few more interesting spellings...

>>
>> Most of the rejected lines were obvious typos (among others, we've
>> had 4 cases of someone being burnt, based on Singed-off-by; and 2
>> cases of list-reading via an e-reader, based on eviewed-by; there
>> are also lines forgetting a space after the ':') or otherwise
>> tongue-in-check (3 Approximately-suggested-by). A few lines not
>> whitelisted here may be legitimate, but as they are orders of
>> magnitude rarer, it is therefore not worth worrying about
>> (7 Requested-by, 3 Co-authored-by, 1 Inspired-by, etc.).

Among others, 48 Reviewed-By.


>> @@ -1470,6 +1470,10 @@ sub process {
>>  				ERROR("space required after Signed-off-by:\n" .
>>  					$herecurr);
>>  			}
>> +		} elsif($line =3D~ /^\s*([A-Za-z-]*)-by:/ &&
>=20
> I guess we don't mind about angry typewriters who Ack-BY ;)

I can send a v3 that makes this line case-insensitive,

>=20
>> +			($1 !~ /(Suggest|Report|Test|Ack|Review)ed/ ||
>> +			 $line !~ /^\s*[a-z-]*-by:\s/i)) {

although making this line require lower-case '-by' gets a bit trickier.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--PH8w7KFTY48S9DOl1aNLfQzaqNT6Fi288--

--A7dL0YhAzlYqpJe2yV6RWGjaUI6ZVev31
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlxY8X4ACgkQp6FrSiUn
Q2rmOAf8DSftPF+mM2fLrosehgT8sbO6ktZZc/xRIT0eUkVQxzcvcQWDR+m1EbhH
4zLPl1vu/nYG8renqZCzoEpdyxZFqu7rZC7dbtiCG5AtKOypjYFnUyJr8ODJSLop
B2Tz7z3aghBnRb/yo76ST0xb8R0LfS1tMZcUUlv6FetGCH3LSX0noW44GmJGEPeN
dKjQ80JH/OhKwKGMVCgb8c3df+uJULSus+tHbOm6RPMz6N3SiNnm1mYnIu8XCBpw
CxlQHlyzYk/z+/flZEj0mltd6OxIHGq1olYrRPi3ufi/CynMs2Ap42b5uVCQ2Kez
jDuam9gXRuRSvO+6oB3gxX2K6B+Gfg==
=GARM
-----END PGP SIGNATURE-----

--A7dL0YhAzlYqpJe2yV6RWGjaUI6ZVev31--

