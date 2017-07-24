Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZcI8-0006R0-DN
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 08:16:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dZcI6-0006Ou-42
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 08:16:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dZcI5-0007pp-3e
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 08:16:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55976)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dZcI1-0007nk-N5; Mon, 24 Jul 2017 08:16:45 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C71BC058EA2;
	Mon, 24 Jul 2017 12:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4C71BC058EA2
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 4C71BC058EA2
Received: from [10.10.121.48] (ovpn-121-48.rdu2.redhat.com [10.10.121.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6510261B8E;
	Mon, 24 Jul 2017 12:16:42 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-20-f4bug@amsat.org>
	<CAJ+F1CJL8krrmFwCgqx6qZepkNZbcvTJrkOEVcsWiHurCBcUZw@mail.gmail.com>
	<3b25ec9f-5711-de4c-eade-eecef96b6379@redhat.com>
	<a49428cc-88e9-dbd8-3d2f-207acbef68f9@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu trival <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU <qemu-devel@nongnu.org>, Richard Henderson <rth@twiddle.net>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <90438d63-2cfc-ad79-a490-7a50e40fe53a@redhat.com>
Date: Mon, 24 Jul 2017 07:16:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <a49428cc-88e9-dbd8-3d2f-207acbef68f9@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="9hvfmm8o325U8VpeThWUicNTF58AjdgqO"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 24 Jul 2017 12:16:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 19/29] disas: use
 QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Mon, 24 Jul 2017 12:16:51 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9hvfmm8o325U8VpeThWUicNTF58AjdgqO
Content-Type: multipart/mixed; boundary="fOL1gtv5ESDb5NCiUFCopIXB7e5n2fJVT";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 qemu trival <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU <qemu-devel@nongnu.org>, Richard Henderson <rth@twiddle.net>
Message-ID: <90438d63-2cfc-ad79-a490-7a50e40fe53a@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 19/29] disas: use QEMU_IS_ALIGNED macro
References: <20170718061005.29518-1-f4bug@amsat.org>
 <20170718061005.29518-20-f4bug@amsat.org>
 <CAJ+F1CJL8krrmFwCgqx6qZepkNZbcvTJrkOEVcsWiHurCBcUZw@mail.gmail.com>
 <3b25ec9f-5711-de4c-eade-eecef96b6379@redhat.com>
 <a49428cc-88e9-dbd8-3d2f-207acbef68f9@redhat.com>
In-Reply-To: <a49428cc-88e9-dbd8-3d2f-207acbef68f9@redhat.com>

--fOL1gtv5ESDb5NCiUFCopIXB7e5n2fJVT
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/23/2017 09:52 AM, Paolo Bonzini wrote:

>=20
> But I agree that QEMU_IS_ALIGNED looks weird here.  I think it should
> mostly be used when the argument is a pointer, to hide the cast.  Uses
> for non-pointer arguments should be decided on a one-by-one basis; "is
> the first argument an address" is definitely a good thing to consider.
> Another might be "is the second argument a variable", because "i % n =3D=
=3D
> 0" is less efficient than "(i & (n - 1)) =3D=3D 0".

How often is QEMU_IS_ALIGNED used on non-power-of-2?  Would it be worth
rewriting it into bit-wise ops, at the expense of declaring that any
code aligning to other values must open-code their own %?  Can we have
the compiler help us ensure that the second argument is a power-of-2?
Conversely, if the compiler is given a constant for the second argument,
and is not optimizing modulo power of two into bitwise ops (at least at
CFLAGS=3D-O2), then that's a compiler bug.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--fOL1gtv5ESDb5NCiUFCopIXB7e5n2fJVT--

--9hvfmm8o325U8VpeThWUicNTF58AjdgqO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAll15SkACgkQp6FrSiUn
Q2orHgf/Q3alf1cx9tr1nTJ/dQ0GuruPZDZxWHU6KEIKYnNCUD/aa4VWzFswQAiG
MPpSFm76cKusH5B1FlMA5cwgvP2MKVdOYAlWI8BplQAwJI8h7PDlP2STEDPOoWey
susrV8qWQ69iZlOGA3i4xvdN8xvwknrQl9+sGv5dRxA+02OPxvIST4531vzD8egD
XxmE4scret21BswRSEmNVQAcY6PVG1Fa85FKMF6BswgxsGI3QCSdNxzByPBdrWQS
qVZ+AJs7ZGFhwyaPfJDn7OFi+v3NxzGMWoUsViZLaknqW03laVf6cE0mHlcqA/q0
Ye3ax+qKpo0xj+8//WsNKrbJ/v1vIA==
=ND9r
-----END PGP SIGNATURE-----

--9hvfmm8o325U8VpeThWUicNTF58AjdgqO--

