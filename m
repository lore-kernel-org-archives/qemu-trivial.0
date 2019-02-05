Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqqoN-0003xS-SN
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 21:50:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gqqoL-0003tw-EJ
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 21:50:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gqqoK-00034y-Lv
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 21:50:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38446)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gqqoI-00032X-My; Mon, 04 Feb 2019 21:50:06 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5BF96C01DDE0;
	Tue,  5 Feb 2019 02:50:05 +0000 (UTC)
Received: from [10.3.116.162] (ovpn-116-162.phx2.redhat.com [10.3.116.162])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC84B6EA31;
	Tue,  5 Feb 2019 02:50:02 +0000 (UTC)
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, philmd@redhat.com
References: <20190205022502.11654-1-eblake@redhat.com>
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
Message-ID: <0888ceaa-f0e0-7ffc-03e1-b223bb65fd69@redhat.com>
Date: Mon, 4 Feb 2019 20:50:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190205022502.11654-1-eblake@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="HDgKmNrdjzeRA4hmJXq4Yf8LG8bWSrCYu"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 05 Feb 2019 02:50:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] checkpatch: Flag
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
X-List-Received-Date: Tue, 05 Feb 2019 02:50:10 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HDgKmNrdjzeRA4hmJXq4Yf8LG8bWSrCYu
Content-Type: multipart/mixed; boundary="6yU97I4vNZMBvPnwtdrJVT2mft4MBZP4J";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, philmd@redhat.com
Message-ID: <0888ceaa-f0e0-7ffc-03e1-b223bb65fd69@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v3] checkpatch: Flag suspicious attribution
 lines
References: <20190205022502.11654-1-eblake@redhat.com>
In-Reply-To: <20190205022502.11654-1-eblake@redhat.com>

--6yU97I4vNZMBvPnwtdrJVT2mft4MBZP4J
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2/4/19 8:25 PM, Eric Blake wrote:
> Flag commit attribution tags that are unusual (often because they
> were a typo), but only as a warning (because sometimes a humorous
> or otherwise useful tag is intentionally supplied).
>=20
> This picks the 6 most popular tags, each with 700 or more uses (well,
> S-o-b was already checked for case-sensitivity and typos, leaving
> only 5 new tags being checked), as determined by:
> $ git log | sed -n 's/^ *\([A-Za-z-]*-[bB][yY]:\).*/\1/p' | \
>   sort | uniq -c | sort -k1,1n | tail

[-_][bB][yY] finds an additional:

      2 Reviewed_by:

Should I try to flag those as well, in v4 (note - the current
Signed-off-by tests do not flag Signed_off_by as invalid, so the patch
does get a bit bigger if we want to catch it)

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--6yU97I4vNZMBvPnwtdrJVT2mft4MBZP4J--

--HDgKmNrdjzeRA4hmJXq4Yf8LG8bWSrCYu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlxY+dkACgkQp6FrSiUn
Q2rglAf/d2VkThRJfXBsMBr0/kQCTfKiiQixDxG58ouCJb0KKpryY9AptLWBqTYH
X1fUCfqZMEy27Wv5Bx6PAfISedRtDruracKmEeaHdcj5YWXL5HVbM0QX3gVA0qHn
R1fgKWRM53ge4zYGcovKQJafLDh8PmLGFTY0ALLuMldiqvnkB1WCKRN0Ixzb0csd
oEoU+xEPsY8nL9BTJJqQF7R7Par3+NPSRtb08KAM34NPhphkm9hRbAUkSgE7+fab
715R1SFZKNGY7voxL3Jq74rhc/Fcy7hpdOQiZydHZ8D/2qI2wP1eKGpSGa4wqq2u
SR3aGND8lQv7oOqHxFMX5XwBEiAOXg==
=5ggp
-----END PGP SIGNATURE-----

--HDgKmNrdjzeRA4hmJXq4Yf8LG8bWSrCYu--

