Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7sVp-0000iM-5A
	for mharc-qemu-trivial@gnu.org; Mon, 08 May 2017 19:56:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d7sVm-0000ga-Qx
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:56:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d7sVl-0000ne-SC
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:56:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:11835)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1d7sVg-0000mL-44; Mon, 08 May 2017 19:56:12 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D69B181F03;
	Mon,  8 May 2017 23:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D69B181F03
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com D69B181F03
Received: from [10.10.122.86] (ovpn-122-86.rdu2.redhat.com [10.10.122.86])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 30E9918A20;
	Mon,  8 May 2017 23:56:10 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
References: <20170508233918.9043-1-f4bug@amsat.org>
	<20170508233918.9043-4-f4bug@amsat.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <2ad7eaf6-3691-f9f1-4d09-204444adbd19@redhat.com>
Date: Mon, 8 May 2017 18:56:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170508233918.9043-4-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="luLuHpJJNqhrSjDVCHef8wXx0erkQ5qJE"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 08 May 2017 23:56:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 03/11] hw/misc: add missing
 includes
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
X-List-Received-Date: Mon, 08 May 2017 23:56:19 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--luLuHpJJNqhrSjDVCHef8wXx0erkQ5qJE
Content-Type: multipart/mixed; boundary="d6BBGA3s4orIAxU0997NLvqXN5DLn7wpx";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Message-ID: <2ad7eaf6-3691-f9f1-4d09-204444adbd19@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 03/11] hw/misc: add missing includes
References: <20170508233918.9043-1-f4bug@amsat.org>
 <20170508233918.9043-4-f4bug@amsat.org>
In-Reply-To: <20170508233918.9043-4-f4bug@amsat.org>

--d6BBGA3s4orIAxU0997NLvqXN5DLn7wpx
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05/08/2017 06:39 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/misc/unimp.h | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/include/hw/misc/unimp.h b/include/hw/misc/unimp.h
> index 3462d85836..353ee19abf 100644
> --- a/include/hw/misc/unimp.h
> +++ b/include/hw/misc/unimp.h
> @@ -8,6 +8,9 @@
>  #ifndef HW_MISC_UNIMP_H
>  #define HW_MISC_UNIMP_H
> =20
> +#include "qemu/osdep.h"

NACK. .h files should not include osdep.h, because the .c file that is
using the .h file should have already done so.  This is mentioned in
HACKING.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--d6BBGA3s4orIAxU0997NLvqXN5DLn7wpx--

--luLuHpJJNqhrSjDVCHef8wXx0erkQ5qJE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZEQWZAAoJEKeha0olJ0NqUS0H/jp4fE4izBwNT0OV4RM6PQlT
S+CrgBGmvB48HVe5RU0sKCzhITCHrXVcKHK8Pg3x+L1oo5MPm/aB8qgZMhu0nojV
+fITWXb5m88Fv70CFZikkwgTxz7za7Sf/4gBQ7hoxU5ruY296hIB9glBJ3QG+mnQ
K2erUVQhnxy47twI4ajPV8wE0cW8+OM9L1SEb55FLb32L1UDvI30Q5o5Wa7ZQfwC
mGgSaX4LoHNJvSh7lOKjY0DY5LWeB2KsEUlqT/QAfIwgb0WS5WsVtd8Zl6+3j9cX
1zFrCc85YeQavvxy1csBwDPqwxB5jDlT2pgGaH9qpGW3yiXLQ4m4ncUIvrXpE9M=
=JM/0
-----END PGP SIGNATURE-----

--luLuHpJJNqhrSjDVCHef8wXx0erkQ5qJE--

