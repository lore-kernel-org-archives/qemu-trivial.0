Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1drVDv-0004nz-G5
	for mharc-qemu-trivial@gnu.org; Mon, 11 Sep 2017 16:22:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51068)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1drVDt-0004nE-7M
	for qemu-trivial@nongnu.org; Mon, 11 Sep 2017 16:22:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <n54@gmx.com>) id 1drVDp-00086N-Vw
	for qemu-trivial@nongnu.org; Mon, 11 Sep 2017 16:22:25 -0400
Received: from mout.gmx.net ([212.227.15.15]:62536)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1drVDp-00083t-LG; Mon, 11 Sep 2017 16:22:21 -0400
Received: from [192.168.1.3] ([185.58.161.191]) by mail.gmx.com (mrgmx002
	[212.227.17.184]) with ESMTPSA (Nemesis) id 0M3RZI-1dZhJz1S9g-00qxOY;
	Mon, 11 Sep 2017 22:22:19 +0200
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <20170911200002.4511-1-n54@gmx.com>
	<CAFEAcA-5uT+vMfoNRDkHadGo-O3S-_LOmgj5_7dQgCS8NVzfvA@mail.gmail.com>
From: Kamil Rytarowski <n54@gmx.com>
Message-ID: <b8cc160b-349a-4bd0-efcd-04871cd47f02@gmx.com>
Date: Mon, 11 Sep 2017 22:24:41 +0200
User-Agent: Mozilla/5.0 (X11; NetBSD amd64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-5uT+vMfoNRDkHadGo-O3S-_LOmgj5_7dQgCS8NVzfvA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="3LhNWIxW0XXM9QA2ELWg2AgHQ7L4tBWie"
X-Provags-ID: V03:K0:zuJlKCUcXhX6zNge76HpnGsEAkw7UtUvXXnbE+Dm98trkVhzeZA
	57vYoPlAe5978lPI/ZQOcN27HxQC57UnU8tfrHCSAAqXja4wxa3ZEFdkNAiOS6lNVqOAgFJ
	0AEiVMvH3wmQSndBtRADdNTRTrByRoAOBPbO6FC8pfzzxWCIlY5vggMpB2BJ6IhZyRGSTYz
	k9/8WuR/eNRgW7itR9m5Q==
X-UI-Out-Filterresults: notjunk:1;V01:K0:OvcLWpdFlIo=:GFJhFTJOuR8oU+jt87oZDw
	63hImDI15IfFx3IDt34IavjdBXOVQDBc+DDr8fZD9VAOpE9zR2OPGY6JmJGybX/4RQcJKhBSD
	8jxxcAMRbP8/VkmL0QvVAVEUdpRIz5KXEAGEFZw52gR4a8GLuit/jm1uOhuK+GxY1iJlttQ2S
	PMcfBYIdiRxs1VyybUstTehVnHKuA2YWzFiyU0Kuo17dk6qZk6u9f9j0GcAN8+OYNS2Kuu+ST
	ivR6wSXQKifWDLM903ro1g7IVkwEKKY83x1QFiX+Rqto3fSvGdRvfUhP4UP879xLRpxOWCpOV
	70ehge8l0l4MTkDGGg/06WWUza3wGzzwAkvyTVDkbnbskV40Vcfp9tycFoW7YL8iK9+u3mCPs
	gJ1EzNa9DvGGgmvCeJArZWs8xEAETofLhCIotZzAKryCqmgEoSW2iE8k4fV/v5SIUztWnZmDK
	ysas9H6MmAki+ZNo0CXv7b8cBAT7om95iK5GvNVH4kEz+Y6K1147tpTbLZvUi7ypEENuLLNoA
	XWhxdsUUbsnZiGGfxDLBVX0twSrHB1JKQDTHwtWdjiqfI72Wd0bCGIhDBtwR3dv2y/Pjdi2Zd
	rRvkn0oyJJZ23x9Ml+Q+l6slHdobGkjXAuzADneEnfKaLUMwpbDXtDxP24q+IsVAAG7/Fu88J
	+t/mYdSr5HgO5Zqz8Rk4j5F8mLk6gg7vXpvtF5xhnbQriOeOJMCNCbpR3ZPBRFPRrt3wN7luU
	2O0nHyUPtkIU/HFUbTqc946gf7+VW5KcClwu2oW+dBg+XSSZhf84Z5mh4o0iRZW5xxywS1AhF
	j/nzno6C9Y9CjyJ6rAMhCmt7deruA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.15.15
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Rename round_page() to
 round_pageq()
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
X-List-Received-Date: Mon, 11 Sep 2017 20:22:26 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3LhNWIxW0XXM9QA2ELWg2AgHQ7L4tBWie
Content-Type: multipart/mixed; boundary="cr7amreHxk6sBB2WojKtkopA4FNT6hIHB";
 protected-headers="v1"
From: Kamil Rytarowski <n54@gmx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Message-ID: <b8cc160b-349a-4bd0-efcd-04871cd47f02@gmx.com>
Subject: Re: [Qemu-devel] [PATCH] Rename round_page() to round_pageq()
References: <20170911200002.4511-1-n54@gmx.com>
 <CAFEAcA-5uT+vMfoNRDkHadGo-O3S-_LOmgj5_7dQgCS8NVzfvA@mail.gmail.com>
In-Reply-To: <CAFEAcA-5uT+vMfoNRDkHadGo-O3S-_LOmgj5_7dQgCS8NVzfvA@mail.gmail.com>

--cr7amreHxk6sBB2WojKtkopA4FNT6hIHB
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11.09.2017 22:16, Peter Maydell wrote:
> On 11 September 2017 at 21:00, Kamil Rytarowski <n54@gmx.com> wrote:
>> This change fixes conflict with the DragonFly BSD headers.
>>
>> Signed-off-by: Kamil Rytarowski <n54@gmx.com>
>=20
> What's the rationale for calling it round_pageq()
> in particular?
>=20
> thanks
> -- PMM
>=20

It might be a bad taste, but q stands for qemu.. I'm going to send a
better patch soon with a switch to TARGET_PAGE_ALIGN().


--cr7amreHxk6sBB2WojKtkopA4FNT6hIHB--

--3LhNWIxW0XXM9QA2ELWg2AgHQ7L4tBWie
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZtvEPAAoJEEuzCOmwLnZsOpUP/2q+9Ithhnqe/lyFMI45JRKm
+3pv+YA4QfuWQ3N+YUjyRIoLX3ZsAVJcd/cJMj3+O3yrps7gV7NOZELR6W+AiD8M
wpk9cibnLvxdVR9nPsp2sLuWHT/LNJK2YC5envQVUaa2BhITCi7xL2Sd2CgXV3ex
ddxog6YoOhtIounrTf67QvwSv0gUAlQXTV6cmcu3UOHToo8TGlKKv1AeL8tIuAQu
JYJmixMokZzv5pu8c6Mgu2FolzZCN4060d0Tjk/fBFZOkFmfabvTmAwD9WZ3fcpu
t7xxI21zkCe9AZJBj0lDJ/j/UyC6Q0voeeP3JymDs7kJBn+16Fir1WA0v9fTRLP8
halCzYs7HOQDXn+tpVc3mk1E6na4nXTHGoRehYCmJOD7MsJoAG9yI0cPI+bs6rU7
Laf6YouRbhD59jOgNDuLElJzMK4X9y19CDyHY1XcxUYPOxNHpyUEk4kCMgNc4/0Y
4dx+BnAHa7LDTgNAs24drY+34HHw9uCiII1evea/v8u/DAkqHCOV0ng56EhaNtmR
iQIhkrjAHlojmfT8cnwBBChYIr19SmJ0BfP+U2U/HcUJiaqeXTeSbjFmWaqDMmvy
cdCB/p5WgQy+kJ6Wpo2BwkbnVmhCosfKFlGdKQMmKpgRaX1SVnj1G92GU3uBKJW8
ikN13WBNN+Z7ru4n/696
=QgZ/
-----END PGP SIGNATURE-----

--3LhNWIxW0XXM9QA2ELWg2AgHQ7L4tBWie--

