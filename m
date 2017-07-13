Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVkb1-0004xw-BJ
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jul 2017 16:20:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dVkaz-0004wi-01
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 16:20:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dVkay-0003xK-41
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 16:20:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58136)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dVkar-0003rc-Bx; Thu, 13 Jul 2017 16:20:13 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3E09F80F8E;
	Thu, 13 Jul 2017 20:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3E09F80F8E
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 3E09F80F8E
Received: from [10.10.121.60] (ovpn-121-60.rdu2.redhat.com [10.10.121.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E55A56061F;
	Thu, 13 Jul 2017 20:20:02 +0000 (UTC)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-9-marcandre.lureau@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
	"open list:qcow2" <qemu-block@nongnu.org>, qemu-trivial@nongnu.org,
	Max Reitz <mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <36921d14-da67-1b0e-3ae6-a609963794f0@redhat.com>
Date: Thu, 13 Jul 2017 15:20:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-9-marcandre.lureau@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="c273TNgFDBcAV72uTJRM9oQTsvvTTXnPO"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 13 Jul 2017 20:20:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 08/29] qcow2: use
 DIV_ROUND_UP
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
X-List-Received-Date: Thu, 13 Jul 2017 20:20:22 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--c273TNgFDBcAV72uTJRM9oQTsvvTTXnPO
Content-Type: multipart/mixed; boundary="Q1aRFhVOniWgRKPXF4fB5TCBLvcDKDq5G";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
 "open list:qcow2" <qemu-block@nongnu.org>, qemu-trivial@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Message-ID: <36921d14-da67-1b0e-3ae6-a609963794f0@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2 08/29] qcow2: use DIV_ROUND_UP
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
 <20170713163219.9024-9-marcandre.lureau@redhat.com>
In-Reply-To: <20170713163219.9024-9-marcandre.lureau@redhat.com>

--Q1aRFhVOniWgRKPXF4fB5TCBLvcDKDq5G
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/13/2017 11:31 AM, Marc-Andr=C3=A9 Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  block/qcow2-cluster.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
> index f06c08f64c..30db942dde 100644
> --- a/block/qcow2-cluster.c
> +++ b/block/qcow2-cluster.c
> @@ -61,7 +61,7 @@ int qcow2_grow_l1_table(BlockDriverState *bs, uint64_=
t min_size,
>              new_l1_size =3D 1;
>          }
>          while (min_size > new_l1_size) {
> -            new_l1_size =3D (new_l1_size * 3 + 1) / 2;
> +            new_l1_size =3D DIV_ROUND_UP(new_l1_size * 3, 2);
>          }
>      }
> =20
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--Q1aRFhVOniWgRKPXF4fB5TCBLvcDKDq5G--

--c273TNgFDBcAV72uTJRM9oQTsvvTTXnPO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZZ9XxAAoJEKeha0olJ0NqFPAH/3ZpXKgCervqXnn0faW8oBxA
LkI9UCi2JZOm0taGMVKPyi9ow+a3a3SZoYmY2B2Zjvv1K5qCcnVT76B351nQW15x
ZQMeTzG5FopI0C7lIMo6BqemGjjIfBvATi2JZRERnkoNl3uEuKxr4+upQhFri9NM
0jvlMQmMtzv1WuLcYSaiIqB/hMdSS4a9V9MkMp54kpa0e/aF9PGbG0h4fo5VP4Y/
FsOlMcc1Yu/13TOLMqSllwHVUtXuQgv7JPVV1R4gAJIUWnhUUHTEvqk0bBGEkujv
jDmjDSXNV3zr7ctWSVnS9je774/WLbsxSMdthXupyjx6BJBLrb3TzCea3pdvmg4=
=6OIl
-----END PGP SIGNATURE-----

--c273TNgFDBcAV72uTJRM9oQTsvvTTXnPO--

