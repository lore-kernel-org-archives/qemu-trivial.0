Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHSgf-00071E-Kx
	for mharc-qemu-trivial@gnu.org; Wed, 13 Aug 2014 03:09:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40011)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1XHSgY-0006zI-Nj
	for qemu-trivial@nongnu.org; Wed, 13 Aug 2014 03:09:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1XHSgS-0000Nm-Ha
	for qemu-trivial@nongnu.org; Wed, 13 Aug 2014 03:09:26 -0400
Received: from mout.web.de ([212.227.15.3]:60841)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1XHSgS-0000Nd-7l; Wed, 13 Aug 2014 03:09:20 -0400
Received: from mchn199C.mchp.siemens.de ([95.157.58.223]) by smtp.web.de
	(mrweb003) with ESMTPSA (Nemesis) id 0MDg8k-1XBRsB2fRW-00H5Qp;
	Wed, 13 Aug 2014 09:09:17 +0200
Message-ID: <53EB0F18.6060907@web.de>
Date: Wed, 13 Aug 2014 09:09:12 +0200
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial <qemu-trivial@nongnu.org>
References: <53E62ABF.2000104@web.de> <53EB0250.4080007@msgid.tls.msk.ru>
In-Reply-To: <53EB0250.4080007@msgid.tls.msk.ru>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="F63W9N4E9Q7jl6Mx2KJAbTLotDILXMfNE"
X-Provags-ID: V03:K0:pWknfzdtHDCHeRKxtXEdrUNS+joxv6tAnKXDqyhRorpHtNg+bxw
	jNBLUCM8ZePlrXsG1oFsHvASOC19g3cJyY3r4iEkgLRhhcc3S32KfwUe6aTLQyV5jt65UEk
	cNMU4m1pdT7qTZdwRs2wXUWnugCLOCTYSGOdAs23J5ZsCGUJEogjrpgcEN8Jcuwi6jHskWU
	NJCBp/HmUsFTjctmAPFfw==
X-UI-Out-Filterresults: notjunk:1;
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 212.227.15.3
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] apic: Fix reported DFR content
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
X-List-Received-Date: Wed, 13 Aug 2014 07:09:32 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--F63W9N4E9Q7jl6Mx2KJAbTLotDILXMfNE
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 2014-08-13 08:14, Michael Tokarev wrote:
> 09.08.2014 18:05, Jan Kiszka wrote:
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> IA-32 SDM, Figure 10-14: Bits 27:0 are reserved as 1.
>>
>> Fixes Jailhouse hypervisor start with in-kernel irqchips off.
>=20
> Applied to -trivial, thank you!
>=20
> Are the other similar cases in there okay?
> Say, 0x0d or 0x02 which also uses shifts like this one?

Nope, didn't find any.

Jan



--F63W9N4E9Q7jl6Mx2KJAbTLotDILXMfNE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlPrDxsACgkQitSsb3rl5xRxvQCfTIO9B1oOwi0Up0D4K7c5avEF
juwAn2Df/TDvXi0IRbPNJ02941qZ2hRN
=sKhF
-----END PGP SIGNATURE-----

--F63W9N4E9Q7jl6Mx2KJAbTLotDILXMfNE--

