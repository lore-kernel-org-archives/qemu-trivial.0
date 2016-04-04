Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1anBIy-0004Gr-Ib
	for mharc-qemu-trivial@gnu.org; Mon, 04 Apr 2016 16:41:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1anBIv-0004FI-OZ
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 16:40:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1anBIs-0005ST-Jw
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 16:40:57 -0400
Received: from mail.weilnetz.de ([37.221.199.173]:45981)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1anBIs-0005SL-Dy
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 16:40:54 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id E405F11810A5;
	Mon,  4 Apr 2016 22:40:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Ss2twhTVSaqs; Mon,  4 Apr 2016 22:40:51 +0200 (CEST)
Received: from edv32.bib.uni-mannheim.de (p54AC9770.dip0.t-ipconnect.de
	[84.172.151.112])
	by mail.weilnetz.de (Postfix) with ESMTPSA id D9C321181097;
	Mon,  4 Apr 2016 22:40:50 +0200 (CEST)
To: Sergey Fedorov <serge.fdrv@gmail.com>,
	QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <1459792209-25270-1-git-send-email-sw@weilnetz.de>
	<5702AD10.8040807@gmail.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <5702D146.6020404@weilnetz.de>
Date: Mon, 4 Apr 2016 22:40:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.7.0
MIME-Version: 1.0
In-Reply-To: <5702AD10.8040807@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="0pRr98fs6WRheAAhP0DLUEridaSwCqtJa"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH] tci: Fix build regression
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Apr 2016 20:40:58 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0pRr98fs6WRheAAhP0DLUEridaSwCqtJa
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Am 04.04.2016 um 20:06 schrieb Sergey Fedorov:
> On 04/04/16 20:50, Stefan Weil wrote:
>> -/* Defining NDEBUG disables assertions (which makes the code faster).=
 */
>> -#if !defined(CONFIG_DEBUG_TCG) && !defined(NDEBUG)
>> -# define NDEBUG
>> +/* Enable TCI assertions only when debugging TCG (and without NDEBUG =
defined).
>> + * Without assertions, the interpreter runs much faster. */
>> +#if defined(CONFIG_DEBUG_TCG)
>> +# define tci_assert(cond) assert(cond)
>> +#else
>> +# define tci_assert(cond) (void)0
>=20
> Maybe wrap the "(void)0" into parentheses?
>=20
> Kind regards,
> Sergey
>=20
>>  #endif
>=20

Maybe. It's not needed for the current code.
Are there situations where parentheses for this would make a difference?

Stefan


--0pRr98fs6WRheAAhP0DLUEridaSwCqtJa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXAtFSAAoJEOCMIdVndFCt+s4P/1kWw4YkkpVaHODawaOjKdgy
u2q0KxPXKud5v27NqCx4deYo4qnaIsuLXUccee2NCc54BgEBZ7NKKCs5YX2/kFSL
Hn+WmVapf5HYsno+2xMyDX7rGEJnZpQD5PfbfPt1wsiRTqrsmzwcLZ2dweYMVFn+
OAAl9AOm4ItNzdLqJcvV7e4oB07+O9luHhq0fVJAty4eisaGW1ii/ZdeNSNyRjgK
mlpOlh+2MRMns8C2hJo3W8v6BWiF1/0BgIPJHW1U6ke7xey+++TP6oskFFhZFbyC
Hlukg2+TiWLi408D2jCjXh6JE48xKrkQGnwD2A6jYa1dZpAicK3Q1Iq8lmK/C8lG
TLH/ea+C7QgggS/Yr5m3U+bw2gUeF4rq3JJcc37tBQ7b50U1frJG2Hk6TZX+6weI
koVdaqRgu8ZbBdcwRvq0hfzmQxPNLiqJCgK/yk035GNpPQ7HkNgfIg/tj9O0/9uT
pAB9dFAy3oUJOP3fyPgSZnQwZ7DTa0GF2uXXBsWeB6AEWgzk/FWJT5TpGgB9fDzi
iSUkJkwhUJP53iUMPbN3ie+tabLo1xnbS0HRRFR7Y9Fsk+lw0py6TyWyR0zr9BW9
KoM4zmuOUsxSLA9HJEnJ7vq5u0naKk4jDsDV2yMsHpdC2QSm59U9ujfZPuBot27f
r97DRpv/LG5oN/uQCb/W
=/JlC
-----END PGP SIGNATURE-----

--0pRr98fs6WRheAAhP0DLUEridaSwCqtJa--

