Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d6Snv-00046N-RC
	for mharc-qemu-trivial@gnu.org; Thu, 04 May 2017 22:17:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d6Snt-00040s-5r
	for qemu-trivial@nongnu.org; Thu, 04 May 2017 22:17:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d6Sns-0002AH-93
	for qemu-trivial@nongnu.org; Thu, 04 May 2017 22:17:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43218)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1d6Snn-00028U-6V; Thu, 04 May 2017 22:17:03 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 350D33D95E;
	Fri,  5 May 2017 02:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 350D33D95E
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 350D33D95E
Received: from [10.10.122.206] (ovpn-122-206.rdu2.redhat.com [10.10.122.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A71677D94A;
	Fri,  5 May 2017 02:17:01 +0000 (UTC)
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20170505020430.2305-1-famz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <00709aa5-218f-9080-9a82-e5e47c286081@redhat.com>
Date: Thu, 4 May 2017 21:17:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <20170505020430.2305-1-famz@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="DK6xTS3q8iTBPv97Wh40U1oMck7AmT4GO"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 05 May 2017 02:17:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests: Remove redundant
 assignment
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
X-List-Received-Date: Fri, 05 May 2017 02:17:10 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DK6xTS3q8iTBPv97Wh40U1oMck7AmT4GO
Content-Type: multipart/mixed; boundary="qwRaOpTAukiQHEfUTTpi7QFsvO8AsiEje";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Message-ID: <00709aa5-218f-9080-9a82-e5e47c286081@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] tests: Remove redundant assignment
References: <20170505020430.2305-1-famz@redhat.com>
In-Reply-To: <20170505020430.2305-1-famz@redhat.com>

--qwRaOpTAukiQHEfUTTpi7QFsvO8AsiEje
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05/04/2017 09:04 PM, Fam Zheng wrote:
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  tests/postcopy-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

> diff --git a/tests/postcopy-test.c b/tests/postcopy-test.c
> index de35a18..e86f876 100644
> --- a/tests/postcopy-test.c
> +++ b/tests/postcopy-test.c
> @@ -41,7 +41,7 @@ static bool ufd_version_check(void)
>      struct uffdio_api api_struct;
>      uint64_t ioctl_mask;
> =20
> -    int ufd =3D ufd =3D syscall(__NR_userfaultfd, O_CLOEXEC);
> +    int ufd =3D syscall(__NR_userfaultfd, O_CLOEXEC);
> =20
>      if (ufd =3D=3D -1) {
>          g_test_message("Skipping test: userfaultfd not available");
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--qwRaOpTAukiQHEfUTTpi7QFsvO8AsiEje--

--DK6xTS3q8iTBPv97Wh40U1oMck7AmT4GO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZC+CcAAoJEKeha0olJ0NqHekH/AlgcUBCaLxitjbMufqav4Eb
yWlBhgPeVEodZGnlBXoY9WWNhj5VUBNYBbeG+baMe7KUaCul9ig0S6yME9n8WGoS
GIZLqzFVmyBjUe4eHeY5caboYieLgBRBZtVD/VHkYTT4d5n1ps23qomFkFCjZfU1
alr1mPQ6mclZ4s3mzYMyiAHshp/3xbjLskCdmCHQZA7sX5ZpkFQn69nGl7UocEQv
nIGlzWTUjkV9XYuU6rYOgz5UKiFmlDwkZG/T7HCxOb+pzxWN7uXszP3UT0i35Zph
BylOGTB4bZscfrUAX3sttC7GS+re1EB3Pza/TP7cCcUF2dn0TyI3unQx1zWypYM=
=kefV
-----END PGP SIGNATURE-----

--DK6xTS3q8iTBPv97Wh40U1oMck7AmT4GO--

