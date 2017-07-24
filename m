Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZiFZ-0000BE-4E
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:38:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dZiFW-00007P-5r
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:38:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dZiFV-0002DN-8B
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:38:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56480)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dZiFO-00029T-Su; Mon, 24 Jul 2017 14:38:27 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B8F82C04B328;
	Mon, 24 Jul 2017 18:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B8F82C04B328
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com B8F82C04B328
Received: from [10.10.121.48] (ovpn-121-48.rdu2.redhat.com [10.10.121.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E8DF7600C0;
	Mon, 24 Jul 2017 18:38:22 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-3-f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <12087bf6-7ff4-58f4-5a4a-1bdf1661abfb@redhat.com>
Date: Mon, 24 Jul 2017 13:38:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170724182751.18261-3-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="20ghUWTjR34fFJVGgmlRFDATrevKUsx4s"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 24 Jul 2017 18:38:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for 2.10 02/35] loader: check
 get_image_size() return value
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
X-List-Received-Date: Mon, 24 Jul 2017 18:38:35 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--20ghUWTjR34fFJVGgmlRFDATrevKUsx4s
Content-Type: multipart/mixed; boundary="EwX27mKBSmwH93fEABBr3OKp4T7rpnj8a";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@xilinx.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <12087bf6-7ff4-58f4-5a4a-1bdf1661abfb@redhat.com>
Subject: Re: [PATCH for 2.10 02/35] loader: check get_image_size() return
 value
References: <20170724182751.18261-1-f4bug@amsat.org>
 <20170724182751.18261-3-f4bug@amsat.org>
In-Reply-To: <20170724182751.18261-3-f4bug@amsat.org>

--EwX27mKBSmwH93fEABBr3OKp4T7rpnj8a
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/24/2017 01:27 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> since a negative value means it errored.
>=20
> hw/core/loader.c:149:9: warning: Loss of sign in implicit conversion
>     if (size > max_sz) {
>         ^~~~
> hw/core/loader.c:171:9: warning: Loss of sign in implicit conversion
>     if (size > memory_region_size(mr)) {
>         ^~~~
>=20
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/core/loader.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--EwX27mKBSmwH93fEABBr3OKp4T7rpnj8a--

--20ghUWTjR34fFJVGgmlRFDATrevKUsx4s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAll2Pp4ACgkQp6FrSiUn
Q2pLsAf/RfE3pEOrMAx7aMYB+uR/dEwNGBIS8vPfuGZC3ltrTE77h0kFB69RoLKQ
kLIsMX8ilIcal1IsbjPVqx1BmJn3l2jyoO1RUm4RYEhp94aQDwcTqtu4OKXT1vB0
Tvkacj5BEaRobw6C/9uTzdQpJHRvna0TfKoFB+sIkXQ1LnQDptnkC/3ijinkxcvQ
kN+51gDxX/9mORMoFBF+Zs2sKzIedULvgoz6wy7Zau4JsQQmf7LzCKJlvnPjS6o+
D8AcFMvBkZNMEWJheWF3dtnBc69OX2/Oj36vX3zRs2sUgZWYF+qyqud61zmJNHIp
ymCyt46g/TSZS06F6dtj5k3PAzrX/g==
=oBmg
-----END PGP SIGNATURE-----

--20ghUWTjR34fFJVGgmlRFDATrevKUsx4s--

