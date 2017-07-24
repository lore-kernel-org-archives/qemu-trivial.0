Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZiO4-0007tG-2q
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:47:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53618)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dZiO0-0007r1-HA
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:47:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dZiNz-0007Kl-Gy
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:47:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58450)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dZiNr-0007Ff-NL; Mon, 24 Jul 2017 14:47:11 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7B15A2DF9F;
	Mon, 24 Jul 2017 18:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7B15A2DF9F
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 7B15A2DF9F
Received: from [10.10.121.48] (ovpn-121-48.rdu2.redhat.com [10.10.121.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 124A05D9CE;
	Mon, 24 Jul 2017 18:47:03 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-8-f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <92a75f2c-d99c-a4c8-77c4-11898b16fe1b@redhat.com>
Date: Mon, 24 Jul 2017 13:46:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170724182751.18261-8-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="N5hTuEk3O3TDLQriglvagNv5rlb0R4seu"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 24 Jul 2017 18:47:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for 2.10 07/35] qcow2: fix null pointer
 dereference
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
X-List-Received-Date: Mon, 24 Jul 2017 18:47:22 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--N5hTuEk3O3TDLQriglvagNv5rlb0R4seu
Content-Type: multipart/mixed; boundary="xADImrl2b2NvnIc4jSLNw2AfVoVmvU0fg";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Message-ID: <92a75f2c-d99c-a4c8-77c4-11898b16fe1b@redhat.com>
Subject: Re: [PATCH for 2.10 07/35] qcow2: fix null pointer dereference
References: <20170724182751.18261-1-f4bug@amsat.org>
 <20170724182751.18261-8-f4bug@amsat.org>
In-Reply-To: <20170724182751.18261-8-f4bug@amsat.org>

--xADImrl2b2NvnIc4jSLNw2AfVoVmvU0fg
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/24/2017 01:27 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> If find_bitmap_by_name() fails we have bm=3DNULL and go to the 'fail' l=
abel, then
> call bitmap_free(bm) which does g_free(bm->name) with bm=3DNULL...
>=20
> Clang's scan-build-5.0 output:
> block/qcow2-bitmap.c:492:12: warning: Access to field 'name' results in=
 a dereference of a null pointer (loaded from variable 'bm')
>     g_free(bm->name);
>            ^~~~~~~~
>=20
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  block/qcow2-bitmap.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Max already has a better patch from Vladimir pending on his block queue:
https://lists.gnu.org/archive/html/qemu-devel/2017-07/msg04398.html

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--xADImrl2b2NvnIc4jSLNw2AfVoVmvU0fg--

--N5hTuEk3O3TDLQriglvagNv5rlb0R4seu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAll2QKUACgkQp6FrSiUn
Q2pobgf/ZjnMaYf8PMIUQe20KpUs/lpBu28bPDo4LsIPg02KV3CX9CKLyyBE8+YO
rH+te+ZoodHGM6g+33lKPAXT+DGyAmwi73htv2yGfo285ywu6zF3W0x9RuVr8M4+
W2kXM+16jp52/itLc1+0qeEt39I1lAYa5eb4u5pigdsQStbVTzTv96wmJyzqFJWN
kqnHTc9M1xjYtYrJi/TgtKQFQLlqttWE/JbEKhrqFz3NvjG6d2KnSnXxuKqHo3kJ
mvEMCFpVKxG/10Qh4PX9/2NnX+2Gsa/jiu39G2MxWf6nqycWmceVPRB0+qGSN3rC
AZCJyWy+vDVVqi/fYaPfMXy6q35ghg==
=LjmP
-----END PGP SIGNATURE-----

--N5hTuEk3O3TDLQriglvagNv5rlb0R4seu--

