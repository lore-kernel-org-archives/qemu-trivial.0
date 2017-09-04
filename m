Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dp12V-00073r-Hg
	for mharc-qemu-trivial@gnu.org; Mon, 04 Sep 2017 19:44:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54546)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1dp12P-00071I-0A
	for qemu-trivial@nongnu.org; Mon, 04 Sep 2017 19:44:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <n54@gmx.com>) id 1dp12K-0006IP-AT
	for qemu-trivial@nongnu.org; Mon, 04 Sep 2017 19:44:17 -0400
Received: from mout.gmx.net ([212.227.17.22]:62813)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1dp12A-00068f-6W; Mon, 04 Sep 2017 19:44:02 -0400
Received: from [192.168.1.3] ([185.58.161.191]) by mail.gmx.com (mrgmx102
	[212.227.17.174]) with ESMTPSA (Nemesis) id 0MRSeC-1dvWLu2Kbo-00SeRy;
	Tue, 05 Sep 2017 01:43:58 +0200
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Jonathan Perkin <jperkin@joyent.com>
References: <20170903164952.26760-1-n54@gmx.com>
	<CAFEAcA-wB8JezCNjyU92U83+75C5NccfBHe1G5q-D67H4CMTKA@mail.gmail.com>
From: Kamil Rytarowski <n54@gmx.com>
Message-ID: <747d805a-98ed-3d36-c4e7-5e6b21b89924@gmx.com>
Date: Tue, 5 Sep 2017 01:46:15 +0200
User-Agent: Mozilla/5.0 (X11; NetBSD amd64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-wB8JezCNjyU92U83+75C5NccfBHe1G5q-D67H4CMTKA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="t8SX5MW7MiO7GaUOwQ1f4nX2bmPd5xQ2P"
X-Provags-ID: V03:K0:2bMm0dIcw8Gk+KWtgFvHdoZhiqty4CA7Lhvi9aAonJCtyivXPGz
	snODLP75Cwwe5fnTQrZ6jgYtkPdtuJeneQc2MpJGhEoH5TQ4s0M3/gWuluMQGdkGD6OWz3i
	knJWvhj09ckv2IZ7yU0W8AM06cqQEGMO9RATetlyGC2iBHofAWEKhmuFCKPqy717aJjcfFA
	8prkzVz4Jga4ajzGRUpXw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:aghMfKWeOMM=:ogS6bUkl53aifhRCYGMB7K
	ManA4Q7g/IIjx6xx0390LUdD08Z7Kr8V+hv7oDwEAI3Xv8eD3WVV6aZkMsQ2n+8y/FxVKyW5Y
	0UDfE/fPu8k+nozHd5XOolJTgJR3VgeXnz5lIJILEFhj8e08cKMXRd7M8jRNigYCMl4Y9ej52
	9eqpSNa6rPLiswO7tsYdTSMCc7ZMh1oKHe1ILGTUyivN07qFynlngNJiL3p3N+fvXu7vAGW/E
	le6LYy7LEuf7SbDKmxd7cvO9BDdxqF8EzS/5GXJoxIPhQdNEtSoHel31E9G7B42hK1nhJmT2F
	P3hL4KQJ4+NJtICAdDqkljReQ1IYIC8iEkSVGWFzlTcHtyJtylcLAU6w6Wgu2PEM1eTGbFMON
	IcYmLgrDKfItksNc8UjFKttxSsccCkk8kqbk8wNyXrCDt55SGMRk7mv6HrckcO5RKE5nZdTs9
	tIoaiiRpC0b73sP1BapggAWepT4wtnkIdlezOx/EkjDYYwq8AFZgu0It1pWfYNiSdKYr9MhFa
	tX8bP+2TOgASXbtpJVUh7N5Y92lGAjkaSFEodd+bqdBuCA0pJFFbpgfK0vBXMUUQWmQnh8rYn
	M1Qecm1U6shckr5JGlB68BGsAkKC0FPkUC/NICPNdaZUdF4GjmLT/rxHqc1S1WjBDbrGS3uTl
	BGoq0W4Wdz8C12lnznCG9/0pzSJJ987o1NRN3lzMp28aGyZTiGMx8BUZZ5t7PcHXOzf6jFZ1p
	E5ZvYTxt37oe6QbIYEwG2Ye+ORfBEhdRe1v8YtmLPfH1+1AsbJCr5xHa+KIh4nC8MVfaDy9q8
	hOT9QZu1zl2KJGx1uHMI+Dxo5SDlw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.17.22
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests: Do not include lutil
 on SunOS
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
X-List-Received-Date: Mon, 04 Sep 2017 23:44:21 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--t8SX5MW7MiO7GaUOwQ1f4nX2bmPd5xQ2P
Content-Type: multipart/mixed; boundary="SodQUxBmN6kVG7lS2qhc2GL1FwbeV4Jkr";
 protected-headers="v1"
From: Kamil Rytarowski <n54@gmx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Jonathan Perkin <jperkin@joyent.com>
Message-ID: <747d805a-98ed-3d36-c4e7-5e6b21b89924@gmx.com>
Subject: Re: [Qemu-devel] [PATCH] tests: Do not include lutil on SunOS
References: <20170903164952.26760-1-n54@gmx.com>
 <CAFEAcA-wB8JezCNjyU92U83+75C5NccfBHe1G5q-D67H4CMTKA@mail.gmail.com>
In-Reply-To: <CAFEAcA-wB8JezCNjyU92U83+75C5NccfBHe1G5q-D67H4CMTKA@mail.gmail.com>

--SodQUxBmN6kVG7lS2qhc2GL1FwbeV4Jkr
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 04.09.2017 11:32, Peter Maydell wrote:
> On 3 September 2017 at 17:49, Kamil Rytarowski <n54@gmx.com> wrote:
>> This fixes build on SmartOS (Joyent).
>>
>> Patch cherry-picked from pkgsrc by jperkin (Joyent).
>>
>> Signed-off-by: Kamil Rytarowski <n54@gmx.com>
>> ---
>>  tests/Makefile.include | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>> index f08b7418f0..0e5e6cb9b8 100644
>> --- a/tests/Makefile.include
>> +++ b/tests/Makefile.include
>> @@ -810,8 +810,10 @@ tests/migration/initrd-stress.img: tests/migratio=
n/stress$(EXESUF)
>>         rmdir $(INITRD_WORK_DIR)
>>
>>  ifeq ($(CONFIG_POSIX),y)
>> +ifneq ($(CONFIG_SOLARIS),y)
>>  LIBS +=3D -lutil
>>  endif
>> +endif
>=20
> I don't object to this patch in principle, but I don't think
> this is the best way to fix the underlying problem.
>=20
> My assumption is that the issue is that Solaris doesn't
> have a -lutil (it's helpful to quote the linker or
> compiler error message for this kind of patch to clarify
> what the failure is that we're trying to fix).
>=20

There is no libutil on SmartOS.

I cannot provide any information about the proprietary Solaris here and
in next questions.

> It looks like we use libutil here for openpty, which
> is used in the test-char test. But the condition we're
> using in tests/Makefile.include isn't the same as the
> one we used to decide whether to add -lutil to the
> emulator binary link line, which is in configure:
>=20
> if test "$darwin" !=3D "yes" -a "$mingw32" !=3D "yes" -a "$solaris" !=3D=
 yes -a \
>         "$aix" !=3D "yes" -a "$haiku" !=3D "yes" ; then
>     libs_softmmu=3D"-lutil $libs_softmmu"
> fi
>=20
> So I think I'd prefer it if we have:
>  * a configure test for "is openpty() in libutil"
>  * use that to determine whether to add -lutil to
>    libs_softmmu and to the libs for tests, rather than
>    doing OS-specific tests
>=20

This looks cleaner. I will go for it.

> Q: does Solaris still not have an openpty() implementation?
> Currently we have a local implementation in util/qemu-openpty.c,
> but if that workaround is only needed in old Solaris we don't
> support any more we could perhaps drop it.
>=20

SmartOS does not have openpty(). I don't see it either in the mainstream
Illumos-gate repository.

According to pkgsrc, openpty() is in libutil (-lutil) on all BSDs and
Darwin.

> thanks
> -- PMM
>=20



--SodQUxBmN6kVG7lS2qhc2GL1FwbeV4Jkr--

--t8SX5MW7MiO7GaUOwQ1f4nX2bmPd5xQ2P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZreXNAAoJEEuzCOmwLnZsTxYQAJtnp6SLHbuEMVqlBgNssBS9
RDsxbeGkCVzGqmk7IdizJIOGN3X+7Y9j5r2MIFfi4hu3e4D9MU1rozcr62TjcVhj
q2tyVTOnwyeJQYg9D/Rsi3dml3wq40q3f86XqzSpw7snMRW/uyxwwEHXBgozFCg+
gaQ3OSJey8MtNU1j7r9qjPeeg+/iy2AjqdEHiuHL5vS69OsTGU9ymHZC+QjEgLht
dSDhk3DssHosa1x9ySOGUl0GwdnY9hkq4SXo/rJrMSBTBvioHAocmV0bQiAwYcA0
ArQkJwHY6IWkLheBEj96hueXw2ir48mwF4owqOGmduIpQ0EFGDokhEFdDDw9cJyo
Uj+Cccqo0qgLIu7A3msFPajxqOfjLQ3c5yJU2ZZ+Tx3QfJrwS1wAoIMlxiu6KZc7
8zxVb414r7VcUVQrQx6KBX9HHUFU2JHByEHJ5GShpQ+7j5n2njyYaSaVJtvWl444
tbK9Ctlt90NZH9A1b/O/Q8ND3glOGf/ALxWQkOszYOP9VH3z/+Zze9pBGGytsiQF
bfA3jUMt1FGgujlT7biuDqn0wUKDdvdNoK2+DxC89+colGm0tiEGvFYH/x7AMFUD
WtG0FCQGfGlXsXcJMnDo75Z7Ssexn+StA/jplsKhcAfAu/ad0Y989cX1+/qnFPDG
b/zw+iwkbF+1fHpagrDN
=agIo
-----END PGP SIGNATURE-----

--t8SX5MW7MiO7GaUOwQ1f4nX2bmPd5xQ2P--

