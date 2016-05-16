Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b2Gzv-0003xl-1W
	for mharc-qemu-trivial@gnu.org; Mon, 16 May 2016 07:47:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1b2Gzs-0003v9-EX
	for qemu-trivial@nongnu.org; Mon, 16 May 2016 07:47:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1b2Gzp-0001kc-5u
	for qemu-trivial@nongnu.org; Mon, 16 May 2016 07:47:40 -0400
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=47496 helo=mail.weilnetz.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1b2Gzo-0001kV-W3
	for qemu-trivial@nongnu.org; Mon, 16 May 2016 07:47:37 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id 8483311810AB;
	Mon, 16 May 2016 13:27:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id psb8XXo-lXnH; Mon, 16 May 2016 13:27:07 +0200 (CEST)
Received: from edv32.bib.uni-mannheim.de (p54AC8FB1.dip0.t-ipconnect.de
	[84.172.143.177])
	by mail.weilnetz.de (Postfix) with ESMTPSA id 7751F11810A9;
	Mon, 16 May 2016 13:27:07 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1461879221-13338-1-git-send-email-sw@weilnetz.de>
	<CAFEAcA_AGhFyNdXZkMzs2P4XzgEgPGyHhjr+vp78DBD3NnJaZA@mail.gmail.com>
Cc: QEMU Developer <qemu-devel@nongnu.org>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-stable@nongnu.org
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <5739AE8A.9080604@weilnetz.de>
Date: Mon, 16 May 2016 13:27:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_AGhFyNdXZkMzs2P4XzgEgPGyHhjr+vp78DBD3NnJaZA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="wXQ1naixMinVEkJ19TWofpEeAv7EWXT3p"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Subject: Re: [Qemu-trivial] [PATCH for 2.6] configure: Allow builds
 -Weverything
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
X-List-Received-Date: Mon, 16 May 2016 11:47:41 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wXQ1naixMinVEkJ19TWofpEeAv7EWXT3p
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 29.04.2016 um 10:51 schrieb Peter Maydell:
> On 28 April 2016 at 22:33, Stefan Weil <sw@weilnetz.de> wrote:
>> The clang compiler supports a useful compiler option -Weverything.
>>
>> As this option triggers warnings in glib header files, too, testing
>> glib with -Werror will always fail. A size mismatch is also detected
>> without -Werror, so simply remove it.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>
>> With this patch, it is possible to build QEMU using this configuration=
:
>>
>> ./configure' --cc=3Dclang-3.7 --cxx=3Dclang++-3.7 --extra-cflags=3D"-W=
everything -DHAVE_FSXATTR" --disable-werror
>>
>> (HAVE_FSXATTR avoids a fatal build error because of structure redefini=
tion)
>=20
> No objection to the patch, but not for 2.6 at this stage I think.
>=20
> (Does the configure patch re fsxattr that got a ping today
> avoid your need to define HAVE_FSXATTR by hand?)
>=20
> thanks
> -- PMM
>=20

I think this patch which was too late for 2.6.0 is a candidate for
qemu-trivial, maybe also for qemu-stable. CC both mailing lists.

Stefan


--wXQ1naixMinVEkJ19TWofpEeAv7EWXT3p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXOa6KAAoJEOCMIdVndFCt+pMP/2iist5hoOP2K8A8gQRhD7mV
i3ZjevJ6VqgXjfioTFoLtzcX/d6dTWJB4i2J+Y+FioGlZTQBZrabFD/XQvjvIWZ8
FaAvMpQGHiP35D2TlyowyqTf5ewIhUiMGFTzV6fYJ0s68C3p2bSB0kLQgWKmiChr
fB/0f5SfF1tecWm5X32oLomqHPnscVlb5/qe9lGwud9amhw0uKADFBh3WDMsjEZq
4aQYnttitIsQHJk1St1EVdmPDYr10p1xZ4XHhUEVc1JV5TVyVOfXyuei32fVFTGj
AjYbkrKI1tX836eDolVuVlDxMQsi5HyTpLeT33aHvyEJMEgZNOztMwYP1/uDDKAB
VDQBo2T2r3TC3yoDvVFNqNCGT/KEC6eEUpdyzP3z3z7pwMgx6N5isiqdgftQgCQ9
9Uz/vdcIavco0H4LWxsexNlN9TPOecl0julNfInE0JQSOItroAvKbrMm/vKPUpdz
4Rzos8BxKNXbvio+DTl3TIZqbY9737WGcdkUmlFL2PvgTiO9HSCxThdV/ChgjfsQ
bnPTUZ8pOKC2JelK8vjlhWLvCc446OdKGOFg79Bg5uxve0N3H+g0cOHrUvpKZEJE
W9fwP8cFcQHay0Hv31ecS23CtYSssHFcY2GbKaToIWk2GgcbmhPleDAkr3DSXElB
QLPGkTr6sfgqp6qDkjBa
=t3r5
-----END PGP SIGNATURE-----

--wXQ1naixMinVEkJ19TWofpEeAv7EWXT3p--

