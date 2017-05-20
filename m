Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dCDbM-0003iw-2x
	for mharc-qemu-trivial@gnu.org; Sat, 20 May 2017 19:16:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51028)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1dCDbJ-0003il-MY
	for qemu-trivial@nongnu.org; Sat, 20 May 2017 19:15:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <n54@gmx.com>) id 1dCDbG-0002sN-HN
	for qemu-trivial@nongnu.org; Sat, 20 May 2017 19:15:57 -0400
Received: from mout.gmx.net ([212.227.17.21]:55499)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1dCDbG-0002rq-5z; Sat, 20 May 2017 19:15:54 -0400
Received: from [192.168.1.4] ([185.58.161.191]) by mail.gmx.com (mrgmx101
	[212.227.17.174]) with ESMTPSA (Nemesis) id 0MP0LT-1dIYSW1JWJ-006MF1;
	Sun, 21 May 2017 01:15:51 +0200
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20170426105027.10666-1-n54@gmx.com> <87shkf8txg.fsf@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
	QEMU Trivial <qemu-trivial@nongnu.org>
From: Kamil Rytarowski <n54@gmx.com>
Message-ID: <8a96c178-9425-1de0-7254-81304ca4f468@gmx.com>
Date: Sun, 21 May 2017 01:17:57 +0200
User-Agent: Mozilla/5.0 (X11; NetBSD amd64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <87shkf8txg.fsf@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="xEXCv3gpNPgfJqBX5L7mpb9ggL1DHBVFW"
X-Provags-ID: V03:K0:md8b3R72U3luUND1PFYEa8IYE+Y4UvObIo4ov2Jn/n+VfAZtA5i
	EfQ/voHfugsOumJpof8KAP6u+SfyFALG/kO2rQG1mxo18z4lrVlgtkg0be2PRxUaU220rTM
	X3i8NRaTlKWK/cQlmBhSlnND3XY08eFHGXzN1Yg3i9Ji2JW/ELGhkqoX5imHIa4qICPkl9G
	/MhlPFSzBq9QfRatlOopA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:DZwqrqjEKIM=:VdW1EVnGR6rlm6hQzJFuYr
	c8Zsr3yzB2WYd/GYao7OsJDA+6Omd/Eq//+/Q+228UnxMZnQ2DaG+JpajIWCSDe54L5Ep89SP
	cMQ8GBILp50i5ovMoqBtEKuaDjidX1LeB6uSu+63Go0f1HNqoEQr2ZZZPgPZJM8z0ACyRXUF6
	mOei/7wC57iATletOzaq4c840vnvQRX8y4dyEftu6MpxVodIBJgdytvtqy3ufF06+EOiaPBBW
	8XHEOv4VpXUfweKh6v3onCXw+AajUal+j0OwCUYo0rHlqijo5sViP1vae0q7Dz3luhZwxNbez
	wcPVP6RgKdxGkG7j1Vm2fKKXzlNXsn5NcsXlhdAPTxJV12eD2sp0YFLqPwkSUz+cupw0gV4on
	SmcyXWqBfIXY8jQTyRg06YPptN0I2eEUGJS5seoh17VN5+VaBeZckX7twKdqBYpMpwjPW4HU/
	OOQtKmqJ2iREVrOsBqVqgSlyb2HTf3nhrnYZE5fGPpW+5Wk72ALU5yXLaUpkc3dOXpmbsAHR5
	YF0jdrjpgS+w/4u7U9lW9+S1bQW/1C2ABk+VYR0qWGAezPuCOp489z2bu0WGZguBJPrq4Kp5E
	feVgHwJilBwOQJPk0NQohHzhoepz9b6zmlFgYGMQLUS5a1iFhYHe9mGJBvGJ/hhbA+GYnJAAE
	YuiggYlj/Ns7Q6dc9LNP6bVM+2WvPrNsDz9sReyEDLR7nd8+GQoD4SxT1re4FQYhiA/ao1VHS
	bJpHc+WJYT37uSq3n7c4l2c+n7tmiM85lKblTpxg2iG635xXCqYN7zX1gdw=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.17.21
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Detect native
 NetBSD curses(3)
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
X-List-Received-Date: Sat, 20 May 2017 23:15:58 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xEXCv3gpNPgfJqBX5L7mpb9ggL1DHBVFW
Content-Type: multipart/mixed; boundary="3MXe9xigcuIfInbaB3bLhUPKr49OfIp2A";
 protected-headers="v1"
From: Kamil Rytarowski <n54@gmx.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
Message-ID: <8a96c178-9425-1de0-7254-81304ca4f468@gmx.com>
Subject: Re: [Qemu-devel] [PATCH] configure: Detect native NetBSD curses(3)
References: <20170426105027.10666-1-n54@gmx.com> <87shkf8txg.fsf@linaro.org>
In-Reply-To: <87shkf8txg.fsf@linaro.org>

--3MXe9xigcuIfInbaB3bLhUPKr49OfIp2A
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ping? Could someone please put it on the pull-request?

Adding qemu-trivial@.

On 08.05.2017 13:33, Alex Benn=C3=A9e wrote:
>=20
> Kamil Rytarowski <n54@gmx.com> writes:
>=20
>> NetBSD ships with traditional BSD curses with compatibility with ncurs=
es.
>> qemu works nicely with the basesystem version of curses(3) from NetBSD=
=2E
>>
>> The only mismatch between curses(3) and ncurses is the lack of
>> curses_version() in the NetBSD version. This function is used solely i=
n
>> the configure script, therefore eliminate it from the curses(3) detect=
ion.
>>
>> With this change applied, configure detects correctly curses frontend.=

>>
>> Signed-off-by: Kamil Rytarowski <n54@gmx.com>
>=20
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>=20
>> ---
>>  configure | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/configure b/configure
>> index c35acf1192..17dc7224f7 100755
>> --- a/configure
>> +++ b/configure
>> @@ -3034,14 +3034,13 @@ if test "$curses" !=3D "no" ; then
>>  #include <curses.h>
>>  #include <wchar.h>
>>  int main(void) {
>> -  const char *s =3D curses_version();
>>    wchar_t wch =3D L'w';
>>    setlocale(LC_ALL, "");
>>    resize_term(0, 0);
>>    addwstr(L"wide chars\n");
>>    addnwstr(&wch, 1);
>>    add_wch(WACS_DEGREE);
>> -  return s !=3D 0;
>> +  return 0;
>>  }
>>  EOF
>>    IFS=3D:
>=20
>=20
> --
> Alex Benn=C3=A9e
>=20



--3MXe9xigcuIfInbaB3bLhUPKr49OfIp2A--

--xEXCv3gpNPgfJqBX5L7mpb9ggL1DHBVFW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZIM6rAAoJEEuzCOmwLnZsAaIP/0pum31jgM+cE8F7v7AdWTMF
pfHWCnt3Lpgr+lS7ihefO6B0rRfYwJKBfvCXB3PenL7lev+uA+EndFtz9TxsiWjq
/IQTkLSRhqMqOBmFxHR5K20AKP6OuQ5uY3RxcN9qo8eWV2us9MM9Ft3IVZqXz2+N
OHFS6XK42Sf2cK4X64EvaxErCgY2G/S9ju4eGhfxvUoT7ZPMY4jrgZ0Wss4ekz7k
02kHcj6+au3Xol6R7HpyaR/wONpUVbsPpl9Xf3oeqXcy0lnJ689oazF5HKn3GLRy
KjslNwwDHfhSXEu3D7bwUcIIo+td9HHfLnRcZT0CfWX8Ng9WxNp/b0LBJTubSDFC
ePpGrfm/Y3Q0SPk5QihFJzFlgsyeOOK9vS6MtsU+qHEdX4SYw0LpS+/87IyvffXI
arv5ZSQniJ/B7UslZ5Op2VubNNZ3Mn8GS9bIiRhiMOfyRgyWtKQuY1ddvrmAVCJ7
JuYLpUFYJgkUjsIxJLBvEV8zkcbf2be6UO+FyIWeqwLb4qJO03sHB2tttj4BKUkl
g+U9ZLavcAVLzzKQnGf9HwxgAq7RX/c9nPtX9PBcv9Yfp88imNbkvVle+0M9tsyP
mqBkpLltaPqCn6xG7eqNReXaNfs7WiwOj8S1BiRZd1Xi1mnxCHMmWfHuJDEzPyWs
qV+L48Q0Weu1TI+JPMCG
=dvqE
-----END PGP SIGNATURE-----

--xEXCv3gpNPgfJqBX5L7mpb9ggL1DHBVFW--

