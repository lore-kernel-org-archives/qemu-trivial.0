Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXUO5-0000UB-CA
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 11:26:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dXUO2-0000Ru-Ew
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 11:26:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dXUO1-0003F0-D1
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 11:26:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33836)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dXUNt-000359-0i; Tue, 18 Jul 2017 11:26:01 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 022A68047F;
	Tue, 18 Jul 2017 15:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 022A68047F
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 022A68047F
Received: from [10.10.120.160] (ovpn-120-160.rdu2.redhat.com [10.10.120.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD3836FA9D;
	Tue, 18 Jul 2017 15:25:51 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	Fam Zheng <famz@redhat.com>, Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Jeff Cody <jcody@redhat.com>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-6-f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <a0274cb0-072d-534a-607a-924ecda631f5@redhat.com>
Date: Tue, 18 Jul 2017 10:25:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170718061005.29518-6-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="AQwUI17HplluBpDIm7D6cB8qlphsK8guu"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 18 Jul 2017 15:26:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 05/29] block: use QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 15:26:11 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AQwUI17HplluBpDIm7D6cB8qlphsK8guu
Content-Type: multipart/mixed; boundary="aMRGfpB3GSjkQvPe6DdmoG945IL4pS8qE";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <famz@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Jeff Cody <jcody@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Message-ID: <a0274cb0-072d-534a-607a-924ecda631f5@redhat.com>
Subject: Re: [PATCH 05/29] block: use QEMU_IS_ALIGNED macro
References: <20170718061005.29518-1-f4bug@amsat.org>
 <20170718061005.29518-6-f4bug@amsat.org>
In-Reply-To: <20170718061005.29518-6-f4bug@amsat.org>

--aMRGfpB3GSjkQvPe6DdmoG945IL4pS8qE
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/18/2017 01:09 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Applied using the Coccinelle semantic patch scripts/coccinelle/use_osde=
p.cocci
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  block/io.c          | 4 ++--
>  block/qcow2-cache.c | 2 +-
>  block/vhdx-log.c    | 2 +-
>  block/vvfat.c       | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)

The first three look okay,

> --- a/block/vvfat.c
> +++ b/block/vvfat.c
> @@ -454,7 +454,7 @@ static direntry_t *create_long_filename(BDRVVVFATSt=
ate *s, const char *filename)
>          entry=3Darray_get(&(s->directory),s->directory.next-1-(i/26));=

>          if (i >=3D 2 * length + 2) {
>              entry->name[offset] =3D 0xff;
> -        } else if (i % 2 =3D=3D 0) {
> +        } else if (QEMU_IS_ALIGNED(i, 2)) {
>              entry->name[offset] =3D longname[i / 2] & 0xff;
>          } else {
>              entry->name[offset] =3D longname[i / 2] >> 8;

but this one looks a bit odd.  Code-wise, it's identical, but
semantically, this doesn't feel like an alignment check, so much as an
even-or-odd check.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--aMRGfpB3GSjkQvPe6DdmoG945IL4pS8qE--

--AQwUI17HplluBpDIm7D6cB8qlphsK8guu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlluKH8ACgkQp6FrSiUn
Q2p1gggAsGdkoMZMENu35D8Gap/CfqSTH4DKstyfRDuYxvl69sxI4sMkkd/VljKe
2SGizJTyNlPo9KMzwsAjDtoUiQp+z3gyjtlR5HQVAUjRr8NhRkZGAQ06r7I8uP08
WcoPZSAfTh2oz0Q7SFgUwwM76bR56U6Va43xGW2AG6hSgYl35KQZgiX8B4Z4Bo66
EmmuKS6FigkpoyV924k5DSZnoNhrIJEit/w4xLhj6oqx5WUWLE8ibZEGORrh8cnY
Nyq4Vju8dQ0HR520eJLbgR42CUdoMdmRTf1rwfPcv6c0X5xTSYv9IxFMyhd0vtWO
xd+TPZwGZpDTcWxTiTi3DRUjb5YD1Q==
=ulSt
-----END PGP SIGNATURE-----

--AQwUI17HplluBpDIm7D6cB8qlphsK8guu--

