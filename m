Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bAdDO-0004MH-J3
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jun 2016 09:08:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1bAdDI-0004HR-55
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 09:08:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1bAdDG-0008Iu-4n
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 09:08:03 -0400
Received: from mail.weilnetz.de ([37.221.199.173]:57353)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1bAdDA-0008HC-Gl; Wed, 08 Jun 2016 09:07:56 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id DFC0D11810AA;
	Wed,  8 Jun 2016 15:07:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id jl8p__gPyz1x; Wed,  8 Jun 2016 15:07:52 +0200 (CEST)
Received: from edv32.bib.uni-mannheim.de (unknown [130.226.230.9])
	by mail.weilnetz.de (Postfix) with ESMTPSA id AAC881181097;
	Wed,  8 Jun 2016 15:07:52 +0200 (CEST)
To: "Maciej W. Rozycki" <macro@imgtec.com>
References: <1463404220-5945-1-git-send-email-sw@weilnetz.de>
	<alpine.DEB.2.00.1606081305490.10382@tp.orcam.me.uk>
Cc: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <5758189B.5080306@weilnetz.de>
Date: Wed, 8 Jun 2016 15:07:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1606081305490.10382@tp.orcam.me.uk>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="JFqJaxDng00RgKPmM98Qtu9B7LXdk2XdR"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Use $(..)
 instead of deprecated `..`
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
X-List-Received-Date: Wed, 08 Jun 2016 13:08:10 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JFqJaxDng00RgKPmM98Qtu9B7LXdk2XdR
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Am 08.06.2016 um 14:16 schrieb Maciej W. Rozycki:
> On Mon, 16 May 2016, Stefan Weil wrote:
>=20
>> This fixes these warnings from shellcheck:
>>
>>     ^-- SC2006: Use $(..) instead of deprecated `..`
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>
>> More warnings from shellcheck for configure and other files
>> will be handled by later patches.
>=20
>  Unlike `..` the $(..) Bourne shell construct is not fully portable, so=
me=20
> implementations do not recognise it.  Consequently this change potentia=
lly=20
> breaks building QEMU on some systems, possibly in a non-obvious way, as=
=20
> there's no explicit check for the presence this feature and a graceful =

> failure path included with this patch or the other one AFAICT.  We may =
or=20
> may not care about those systems, but still this is a functional=20
> regression and therefore I think there has to be a good reason for=20
> introducing it.


As the $() construct was already used in QEMU code before this commit
(we had a mixture of both styles), I don't expect anything to break
which was not broken before.

Stefan




--JFqJaxDng00RgKPmM98Qtu9B7LXdk2XdR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXWBioAAoJEOCMIdVndFCtgtYP/2Sg28omwnqHICgq7mslIOqW
fczvn0XbzRW5l2ydeUyXQKG+FecybDun9ykHppNpIUVeSTgh7ZEEiy+LKPuG3oB5
ylkC0TApPzaOCN/KRKlRc3wGC7utVc/3FCwYf3FBbofE9gqFKZFLt/4wsGEPxYuV
n1q2ygONWQB8VVGwt/W8wC21K13mDNKLuBzgRiGi3sTvmcsSfoF5jn83JMpZqTFD
w+P2yblcvzJHU3PayB0odXQ73gGQDXsEJwSclzGuTQxXrJs+MV/fS8tUCPm9Zulp
KYrVoERaNfL/gyJyjsQy1bh80GYNjETqaHN8ZsPXhW8T2lF4BbFpDE69nR8sMTKX
C57YCd5OD06jJG1b94FSwkeRSLhnOohdTU7gjGSWbz773Cxnaf14XsOS7HR4FsKH
UcosuuvLR693gxVDR79uabcSDkKV8ntAWlF09SdCFSQ9H62+PheJNa/LD94N7Q6X
E3e1/iPen2Qo3vsWOk3elKMJJKQR64g0PH3w4A3kfVz5TXgnefIkHM0h7INAc8qn
EchbjKJ2wwFflXDqCLPe6F4pD6u7OgfBbestV55Z82P1mn7YpMm+swlgj2UThoBT
2ibWbbqmHQlCAbHSa03JuzDFE33BXStBzIJz++AZvbdq993aA9hbXRbtdU3aR3Sf
dk4QOsu9za3jwq4xp6kF
=N2tW
-----END PGP SIGNATURE-----

--JFqJaxDng00RgKPmM98Qtu9B7LXdk2XdR--

