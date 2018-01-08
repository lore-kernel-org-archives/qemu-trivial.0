Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eYZyC-0006LV-TK
	for mharc-qemu-trivial@gnu.org; Mon, 08 Jan 2018 11:08:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51200)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1eYZyB-0006Jq-0h
	for qemu-trivial@nongnu.org; Mon, 08 Jan 2018 11:08:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <n54@gmx.com>) id 1eYZy5-0008H9-VJ
	for qemu-trivial@nongnu.org; Mon, 08 Jan 2018 11:08:14 -0500
Received: from mout.gmx.net ([212.227.17.21]:55972)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1eYZy5-0008GE-IE; Mon, 08 Jan 2018 11:08:09 -0500
Received: from [192.168.1.3] ([89.78.252.225]) by mail.gmx.com (mrgmx102
	[212.227.17.174]) with ESMTPSA (Nemesis) id 0LbxQO-1fHZLt37Ey-00jLfd;
	Mon, 08 Jan 2018 17:08:05 +0100
To: Andreas Gustafsson <gson@gson.org>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Kamil Rytarowski <kamil@netbsd.org>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <23118.26328.811644.330716@guava.gson.org>
	<CAFEAcA_iPT14HSkMG4T43H3vykqBu=rFJpBe4idoVh9LFUEJaA@mail.gmail.com>
	<23123.38373.555937.75671@guava.gson.org>
From: Kamil Rytarowski <n54@gmx.com>
Message-ID: <ab633982-25e7-5620-9d9c-7287c6b8b67e@gmx.com>
Date: Mon, 8 Jan 2018 17:10:32 +0100
User-Agent: Mozilla/5.0 (X11; NetBSD amd64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <23123.38373.555937.75671@guava.gson.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="JbKfp9bIJSlSheR8ST4ftrNWV6Gro3UL2"
X-Provags-ID: V03:K0:nwR+BprlHfRQfMEEixPlWS081lM5Twtkmfm2xg3JU+e0E3KCa6G
	fI1yTYApi03ZB50pxfkYlTWowAciBpBARSf9XSnwUefMMGaS3uZK2tJMX0N0vK055gJvmrM
	vR42La/qp0t3K0EyIEGA8NPfK2+ClVAOsSI6lApJQ0dxKZjp2KRBOKbHZkqrsXRsdcs389x
	wRvFtnHr9iKgrdh30eX9w==
X-UI-Out-Filterresults: notjunk:1;V01:K0:yV0bP1UBVaw=:DiWNhbbV8qK6mm2+LCrJvS
	ISI4biQlNKn8KyrWnlW0mAQgpStEc9rbfmLgzfivqrlQ+WR/1l1lC0+vGZatIDdFM7MUSmGqd
	jWeaEHneS1rRqS61g/2UOsjp3hZEszoUbSAtLZ5N/YGoiqkZV8/ITsb+Zh5H+ebt672C+hyMu
	/DkxvPS/vxI40yQHuuU7pIw8gDE9lnV4u1XfZnx+2KTL4yw8DhMACKlHC7XVMXBwgXNBt4djR
	+tlW5v23X3DUfyIFWsgPIdFolm6eLgqmDw4zclyRUkFKflxl9QdQRL/sgrLpfFes5Q/inPQqm
	TBEUSFYkpKqU1j3LuCJk0A6Z6hxBKUzMjHnFjm/XjJt+W0T6Ec1T9lKKkn3pYPl9J2SuVZN27
	8LJumRix0fUXYDznsTrIteRd1d+gOBPDCfEGO/4DhY43KXwgK0HuP2rFMadeQWAU5dvEIvWvm
	kZmTui6MRaEZaeStRlA5nD8hz4UDX0Cc3t0by7n+jgsXUISMjpvryyXAvhVe7DfjWx9iMTHW6
	M90g2AH3gLe8lt00fysQCAuv9Xz5MFGRvzroqQwYiJhy08xxNOARvnZwOZd2x/IhsiSmZYOol
	CSXd9nvlhy7JbBvDEPUpSzyw/hfdQSuOQ/q9MBS1qimc1qC/cdbbSQ2kdtwtPyahjzf5XHdYY
	XG3tkXsZkx9+wBm0RVKZjRFql7QtdfbrbHoc63mhUz6YYOa87+RjTbWh7X3xJ0DC6tDRSsYMW
	k1WUXHoeFNmyI4JoQ9IGDe2EJ74MsZzPZUJCEWxTpQ5OOoYzcwYAm1k5fkmR0ncu/ovrI/Tea
	cuaNP48suDQCnlS7B2Zh9x7YqhUug==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.17.21
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] oslib-posix: check for
 posix_memalign in configure script
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
X-List-Received-Date: Mon, 08 Jan 2018 16:08:16 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JbKfp9bIJSlSheR8ST4ftrNWV6Gro3UL2
Content-Type: multipart/mixed; boundary="W36OFWwlcacOjksgLSjGvDBthj2lSIlJN";
 protected-headers="v1"
From: Kamil Rytarowski <n54@gmx.com>
To: Andreas Gustafsson <gson@gson.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Kamil Rytarowski <kamil@netbsd.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Message-ID: <ab633982-25e7-5620-9d9c-7287c6b8b67e@gmx.com>
Subject: Re: [Qemu-devel] [PATCH] oslib-posix: check for posix_memalign in
 configure script
References: <23118.26328.811644.330716@guava.gson.org>
 <CAFEAcA_iPT14HSkMG4T43H3vykqBu=rFJpBe4idoVh9LFUEJaA@mail.gmail.com>
 <23123.38373.555937.75671@guava.gson.org>
In-Reply-To: <23123.38373.555937.75671@guava.gson.org>

--W36OFWwlcacOjksgLSjGvDBthj2lSIlJN
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 08.01.2018 17:01, Andreas Gustafsson wrote:
> Peter Maydell wrote:
>> Can we put this through the -trivial tree? (cc'd)
>=20
> I'm not sufficiently familiar with the intenal workflows of the qemu
> project to give a meaningful answer to that question.
>=20

I don't maintain a NetBSD merge queue and NetBSD patches go through
other developers (e.g. qemu-trivial).

I would comaintain a BSD merge queue, but so far there are no active
volunteers from other BSDs.


--W36OFWwlcacOjksgLSjGvDBthj2lSIlJN--

--JbKfp9bIJSlSheR8ST4ftrNWV6Gro3UL2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJABAEBCAAqFiEELaxVpweEzw+lMDwuS7MI6bAudmwFAlpTl/kMHG41NEBnbXgu
Y29tAAoJEEuzCOmwLnZsrisQAIQPjOt2JHsyzbBUZyCs3CdXeeAPU0OvMU7sQbXv
esAqIQKVSsJZlADgTW4wKckA86SXN/7YGADWhaO53GjK5uZuKyislZncOJD/GQQm
Jvz517XoFwEjCQf3FVpbkl84tGgUXljj8cyZmFo3TDGInSq4YqpFkzW4Fru/OPEQ
D6YyFV2qzxAVjVuMLLsE6Di0Hss6vpXevOeG2S//VJ7+RiX3BSO1k19a8HkE2+Rl
Sm1lwUmJQ3IW5XL3gmOtvjVTGcw37M1UWOLCr64F5rgGKpU2Hgcy0ZJw/yzIKhlG
4eUWO/6Icp+gKuG7TLUESef9hbBiwGpBfq2KXLjLRilp2VEdqMYDA2zQWfcbb426
+m1tj4apKWWQOkAF8QV18QNcI3adMgdzHy2q1vF4L81Zz4Zb39OpIt7MsMpffyZt
ttB4D2rix1ooc0hXW4A2IItY17KFdB9ER8hJInL23RBR8ywK13EXRuucLMVV7tyV
iPFWASOtEkpsjmhvjRvW7R6lICXdWE22FNezY6VXJSDMAofgKMl8Qt+MxW8RT+Lk
VaIhvBe2x/gExNwmjpbDgXNCuxlvDN56NxB4c9juRoSeWl7LSyB3lP59QTQMIiRj
7oyii59TBzcqo1RNa+2z9PUwjyQIAxJdNYYoxFxCog4Rju9Cqd5F6ILDKI3Dq/cL
l5JM
=/2kk
-----END PGP SIGNATURE-----

--JbKfp9bIJSlSheR8ST4ftrNWV6Gro3UL2--

