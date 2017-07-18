Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXUHr-0003K1-LO
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 11:19:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dXUHn-0003IU-7N
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 11:19:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dXUHm-0005oi-81
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 11:19:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59677)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dXUHf-0005hx-5F; Tue, 18 Jul 2017 11:19:35 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1F90962E80;
	Tue, 18 Jul 2017 15:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1F90962E80
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 1F90962E80
Received: from [10.10.120.160] (ovpn-120-160.rdu2.redhat.com [10.10.120.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 06EAE5D9C3;
	Tue, 18 Jul 2017 15:19:32 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-4-f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <72dfc5e2-8335-ec66-7e86-19ed72366a85@redhat.com>
Date: Tue, 18 Jul 2017 10:19:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170718061005.29518-4-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="OeqV2MLNvmp3EbGlO0nC36A7QeU5U2f0g"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 18 Jul 2017 15:19:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 03/29] qemu-img: use QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 15:19:44 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OeqV2MLNvmp3EbGlO0nC36A7QeU5U2f0g
Content-Type: multipart/mixed; boundary="VAE2oLEBKXQSKoa679QMUMdPGwW7srgtx";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Message-ID: <72dfc5e2-8335-ec66-7e86-19ed72366a85@redhat.com>
Subject: Re: [PATCH 03/29] qemu-img: use QEMU_IS_ALIGNED macro
References: <20170718061005.29518-1-f4bug@amsat.org>
 <20170718061005.29518-4-f4bug@amsat.org>
In-Reply-To: <20170718061005.29518-4-f4bug@amsat.org>

--VAE2oLEBKXQSKoa679QMUMdPGwW7srgtx
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/18/2017 01:09 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Applied using the Coccinelle semantic patch scripts/coccinelle/use_osde=
p.cocci
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  qemu-img.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/qemu-img.c b/qemu-img.c
> index 182e697f81..6f5f956302 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -3804,7 +3804,7 @@ static void bench_cb(void *opaque, int ret)
>          b->in_flight--;
> =20
>          /* Time for flush? Drain queue if requested, then flush */
> -        if (b->flush_interval && remaining % b->flush_interval =3D=3D =
0) {
> +        if (b->flush_interval && QEMU_IS_ALIGNED(remaining, b->flush_i=
nterval)) {
>              if (!b->in_flight || !b->drain_on_flush) {
>                  BlockCompletionFunc *cb;
> =20
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--VAE2oLEBKXQSKoa679QMUMdPGwW7srgtx--

--OeqV2MLNvmp3EbGlO0nC36A7QeU5U2f0g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlluJwQACgkQp6FrSiUn
Q2pUmwgAlKSFZ7RVihHoGpqEhpjzlD+2MRUU52NE/WiW3PFuUp80C/0xq+oKr/CM
qMo3z/JLBHXnQVQlZGm/mPOhAhJvPyfPVQrQs7uIvybSGRRwQ1I4nd9hVjR4Q7qX
W6rGmOUB4pKKCO/kGQgCyXGbwS/aYoXk7AyGxljCtJy6DuBMXjyZYCl79jh1I1VA
RmHMxBkdMxbJGeqFZ0LeEibZTEQ4OD9WOb2DkCtM5voOWDu0oXSAAvJlWMSyYdi5
eITRs0j3VeMErkM1MIouSTPs6WUfGmKc1SwDzFU8FXNm4EJCxg4lVVClhhbvViSj
pYN9C3FHeoip5fKHrnjxSBEsh48XMQ==
=bEd/
-----END PGP SIGNATURE-----

--OeqV2MLNvmp3EbGlO0nC36A7QeU5U2f0g--

