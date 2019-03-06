Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h1TNG-0000Fm-Fy
	for mharc-qemu-trivial@gnu.org; Wed, 06 Mar 2019 05:02:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1TND-0000FY-MU
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 05:02:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1TNA-0006as-Qb
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 05:02:03 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:35653)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h1TN7-0006XS-Nl; Wed, 06 Mar 2019 05:01:58 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
	1N9dbx-1h4S2W3fcr-015aOi; Wed, 06 Mar 2019 11:01:46 +0100
To: Stefan Hajnoczi <stefanha@gmail.com>, Riku Voipio <riku.voipio@iki.fi>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, Julia Suvorova <jusual@mail.ru>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Aarushi Mehta <mehta.aaru20@gmail.com>
References: <5310bd5d152fa36c1828a7cbd19fc893739d1609.camel@gmail.com>
	<20190306095615.GG22159@stefanha-x1.localdomain>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <6b3cfcb7-747e-1dc7-6987-1ad9d1fde2a3@vivier.eu>
Date: Wed, 6 Mar 2019 11:01:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190306095615.GG22159@stefanha-x1.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="wHed6j1HSAw0QV7eT6VQ6HgJEMHkbcQmK"
X-Provags-ID: V03:K1:LRdgoRNVzYy1uRt44H3NeCTRrYXttUZ6bgmbsgeVnuwxAsBlrfJ
	O/dif/M+h2yxQuG9W7dYpsdy/Liy4c5zGlX3jiT0g9r8HYpY2AaavreyfTD+4jYmMZapN2K
	pKVJVL2EA6Vee9xoqIV57NK6xtM8u0kH4K2qgVBcdUMsjs8ksbR5tM1wc+Tun0gaTBoUjyT
	ENmylzdtLRdIiKBsfCPPw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7CN3piqXpPQ=:rms8qaVmcfsw3z9NYa5LWI
	MJM9/iwHnD/hWEa2R5TZwyMXTwRi3qMu0W7tScbyEmHAkgQxTeUTu9GX0D7pfxXcKeuoaQix/
	azPnojJdAjJl6WOXFl4yJB5qWV5agRrWvkgJS0NcaybkFr03Jfb1ivpQGcjX77xGq7loZjuZY
	zzAnHqPzmzZM21X/AeMNfsTP6/VPXvXTcWXiKAKtHq8W+vyscKpTK9r/jL3dKzY8awLPTq2sL
	QzfcQReyXGcl/49fQpuRVlwQvIIYBd9IyXDYDmZEc6qH44SzZCtRhbS3YLIWf6mrvQ8EUlZVb
	dadElJ6q0dYBO8n0S+c+GYbrOjh+3MPyjAy4Lc/dL7rx5ALQ7MNlRu1fvyH7WIeBMD5fsNaGO
	9BCgK/TpzcslaT6vytXjCLmO66CTns0DSlR9vD6l2GHEsfwptRLFywHIUSv6/hRh5OptL4Oi1
	UT5T7UWfyU4NW/skGDuUcRexsCAPi0Ma4cYVKV56d9+7UarutUkk59Nz7lhQcVdJJJf3u456y
	uvv68Lz4PxF3hWWkRKdag+akDuFeGdN7mreuhnwT2JV6KZ8+vNdjn8GqQ00Eh8yKg82TdcSGT
	dn4Qt4qR868JEHnRhYZFvCl/3YitlZ0LTsehWgjfbxu0rNn/YEF9Bnj6vh54zk92qdugoD8mX
	G6tHV4oTzHBuCd8eafXa0ThdrzG7EAW+f/6bLTj0whyTaty0VURCpvGBcT3A1cirhAn6Zj9oF
	SJJlZVTJSvxI0s2I1UDUEbks8tuP5t54xyDZbQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: Re: [Qemu-trivial] [PATCH v4] thunk: fix of malloc to g_new
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
X-List-Received-Date: Wed, 06 Mar 2019 10:02:05 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wHed6j1HSAw0QV7eT6VQ6HgJEMHkbcQmK
Content-Type: multipart/mixed; boundary="YzpPQSZJEaety7aMrdjUgcwddwBztw0UP";
 protected-headers="v1"
From: Laurent Vivier <laurent@vivier.eu>
To: Stefan Hajnoczi <stefanha@gmail.com>, Riku Voipio <riku.voipio@iki.fi>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Julia Suvorova <jusual@mail.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Aarushi Mehta <mehta.aaru20@gmail.com>
Message-ID: <6b3cfcb7-747e-1dc7-6987-1ad9d1fde2a3@vivier.eu>
Subject: Re: [Qemu-trivial] [PATCH v4] thunk: fix of malloc to g_new
References: <5310bd5d152fa36c1828a7cbd19fc893739d1609.camel@gmail.com>
 <20190306095615.GG22159@stefanha-x1.localdomain>
In-Reply-To: <20190306095615.GG22159@stefanha-x1.localdomain>

--YzpPQSZJEaety7aMrdjUgcwddwBztw0UP
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 06/03/2019 10:56, Stefan Hajnoczi wrote:
> On Sat, Mar 02, 2019 at 01:22:29AM +0530, Aarushi Mehta wrote:
>> From 3c1cba63dc5070ab559a126e206557f27fbaea59 Mon Sep 17 00:00:00 2001=

>> From: Aarushi Mehta <mehta.aaru20@gmail.com>
>> Date: Sat, 2 Mar 2019 01:11:42 +0530
>> Subject: [PATCH v4] thunk: fix of malloc to g_new
>>
>> Note that since thunking occurs throughout the lifetime of the QEMU
>> instance, there is no matching 'free' to correct.
>>
>> Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>  thunk.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> Riku: Will you send a pull request?  Otherwise Peter might be willing t=
o
> merge this patch through his tree.
>=20

I can take this through the trivial patches branch.

Thanks,
Laurent



--YzpPQSZJEaety7aMrdjUgcwddwBztw0UP--

--wHed6j1HSAw0QV7eT6VQ6HgJEMHkbcQmK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEzS913cjjpNwuT1Fz8ww4vT8vvjwFAlx/mocACgkQ8ww4vT8v
vjyTJQ//dwFqbfExOnl4MfM9/d2he+DPRMcoGngG996z0VYYRue+6M85zLGHuKIp
mmHxSvwqceASMTvSuapXFw7NgYSEKQBAzHJYDpfma8/BBpVeFkYWgu6Rv6v6jzYP
4hIcLqLpA72HjM+8aNgx4ea2GkAv2LDVH0DmbiP1w68vZEVY4aMVGTviqw7HjXlh
xkc9Z10spaR02lK59sAA/bcy1E6lFSvg6NzdJnv+Ww/F/Ac3BUaMmUxhQGARVOXo
C5oezTWmVSl+NLm3QO2kbkfycy1B5etOBcqUsa2q8joaBLfeHdY9C/Smcvefgtle
2KjHNf0AaeJCsQ7B+YuN9wBY/bXLPLvc2AgqjJtRR5bOh1+zaW71TIu4M8HyTwlo
NWdwgXt0ctpI7GKAZe4RPmvFvf6spbGnl1AvFCs092wS8Q2B5Q8OtRW32ZqGKopi
d3cgsWstZzvHmTtfJXDM9EWh4rICEALW9ZaPk1J4l5HzOvYDLMe5hH9Ru9PFzSe/
AsUB7GmlRT3bgirn95bQES6+P2IOAAfZ1KlUkQ/3129zpISIseMhInlycy17qWFG
PHFmuZWedCg4FH1hqODSKqESGA1ba807HHyHft7h4vQ00OZaKtON0rRQ5tjN/ilF
jStcFSmnrpGi4VrSEPM22XnMXaLTOEQT69eMniyiKflzD7RmUB8=
=tX4C
-----END PGP SIGNATURE-----

--wHed6j1HSAw0QV7eT6VQ6HgJEMHkbcQmK--

