Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e1cHU-0001U1-SE
	for mharc-qemu-trivial@gnu.org; Mon, 09 Oct 2017 13:55:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1e1cHS-0001SZ-CO
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 13:55:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1e1cHR-0001Te-Kp
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 13:55:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34152)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1e1cHN-0001Qa-IQ; Mon, 09 Oct 2017 13:55:49 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 61D64820E1;
	Mon,  9 Oct 2017 17:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 61D64820E1
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.122.223] (ovpn-122-223.rdu2.redhat.com [10.10.122.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B830A17C67;
	Mon,  9 Oct 2017 17:55:42 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20171006235023.11952-1-f4bug@amsat.org>
	<20171006235023.11952-22-f4bug@amsat.org>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <af4cb715-2015-02c4-98d4-4ec3133dc3e8@redhat.com>
Date: Mon, 9 Oct 2017 12:55:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171006235023.11952-22-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="C878SmiSl60faa98soGEB6PSihBrgrqcH"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 09 Oct 2017 17:55:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 21/88] NBD: use g_new() family of
 functions
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
X-List-Received-Date: Mon, 09 Oct 2017 17:55:55 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--C878SmiSl60faa98soGEB6PSihBrgrqcH
Content-Type: multipart/mixed; boundary="Se75DkaW3tcGeQQ4OdXjGvAkaKhKtenqm";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 qemu trival <qemu-trivial@nongnu.org>
Message-ID: <af4cb715-2015-02c4-98d4-4ec3133dc3e8@redhat.com>
Subject: Re: [PATCH 21/88] NBD: use g_new() family of functions
References: <20171006235023.11952-1-f4bug@amsat.org>
 <20171006235023.11952-22-f4bug@amsat.org>
In-Reply-To: <20171006235023.11952-22-f4bug@amsat.org>

--Se75DkaW3tcGeQQ4OdXjGvAkaKhKtenqm
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 10/06/2017 06:49 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  nbd/server.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

I'm fine queueing this one through my NBD tree, if it doesn't go in as
part of a larger series.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--Se75DkaW3tcGeQQ4OdXjGvAkaKhKtenqm--

--C878SmiSl60faa98soGEB6PSihBrgrqcH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlnbuB0ACgkQp6FrSiUn
Q2qmOgf9EYc0sA3DSpWR09mUmZeF/X/0YK1Pk2hOuWYtq8eSgzoRz88IHJic8Uf7
p7VU9VG7wzH6oTpfK1kHQvZQABdUkbo2jyKduiuxwF2q5aD1oeq0mVsg1eGT78OI
ytVQU3CKG8t/BYbpSJ5ZqmIJX/TlRiBjX0lVni0vVRAtTQihusy0cY8F2tqiu0d4
ea/oO2wSoyWiaDtZbcpt0O+k68abN5y40ZiEIX3ycL6O4mDVr28C03Kbn226bWNU
CyL/g0lnAQYAHz6FEdAAdM1ZLJHPEReTrqQ2ECtnQ9oxcm9OIzquZmmEuIihggLy
tStdJqhMB4ymaLHU/eI5BToU3dYNTQ==
=amnp
-----END PGP SIGNATURE-----

--C878SmiSl60faa98soGEB6PSihBrgrqcH--

