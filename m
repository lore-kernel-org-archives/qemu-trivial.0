Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cq8CX-0000vD-Ix
	for mharc-qemu-trivial@gnu.org; Mon, 20 Mar 2017 21:03:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cq8CS-0000sK-3O
	for qemu-trivial@nongnu.org; Mon, 20 Mar 2017 21:03:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cq8CP-0000S6-5r
	for qemu-trivial@nongnu.org; Mon, 20 Mar 2017 21:02:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53356)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cq8CF-0000Ol-3b; Mon, 20 Mar 2017 21:02:47 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 625C680492;
	Tue, 21 Mar 2017 01:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 625C680492
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 625C680492
Received: from [10.10.121.124] (ovpn-121-124.rdu2.redhat.com [10.10.121.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A41FF177DF;
	Tue, 21 Mar 2017 01:02:45 +0000 (UTC)
To: wangguang <wang.guang55@zte.com.cn>, qemu-devel@nongnu.org,
	qemu-trivial <qemu-trivial@nongnu.org>
References: <1490056074976-474433.post@n7.nabble.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <28d15bd5-1620-b39b-ed92-d8812d1549c8@redhat.com>
Date: Mon, 20 Mar 2017 20:02:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1490056074976-474433.post@n7.nabble.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="VlKKkl6D1EwWunswkKRfMChNG2dGmjjRG"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 21 Mar 2017 01:02:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4]COLO:Fix Colo doc,
 secondeary should be secondary
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
X-List-Received-Date: Tue, 21 Mar 2017 01:03:04 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VlKKkl6D1EwWunswkKRfMChNG2dGmjjRG
Content-Type: multipart/mixed; boundary="osDmuAXkBsxweWSKeqiUpTiv5ixmPRM4u";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: wangguang <wang.guang55@zte.com.cn>, qemu-devel@nongnu.org,
 qemu-trivial <qemu-trivial@nongnu.org>
Message-ID: <28d15bd5-1620-b39b-ed92-d8812d1549c8@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v4]COLO:Fix Colo doc, secondeary should be
 secondary
References: <1490056074976-474433.post@n7.nabble.com>
In-Reply-To: <1490056074976-474433.post@n7.nabble.com>

--osDmuAXkBsxweWSKeqiUpTiv5ixmPRM4u
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

[adding qemu-trivial]

On 03/20/2017 07:27 PM, wangguang wrote:
> Subject: [PATCH] Fix Colo doc secondeary should be secondary=20

This line feels redundant compared to the overall mail's subject line.
In turn, that subject could use a space after colon.

> This is an error in COLO-FT.txt.=20
> secondeary-disk0 should be secondary-disk0.=20
>=20
> Signed-off-by: Guang Wang <wang.guang55@zte.com.cn>
> ---=20
>  docs/COLO-FT.txt | 2 +-=20
>  1 file changed, 1 insertion(+), 1 deletion(-)=20

Reviewed-by: Eric Blake <eblake@redhat.com>

As it is doc-only, it is safe for hard freeze, but also not the end of
the world if it doesn't go in until 2.10.

>=20
> diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt=20
> index e289be2..bec7547 100644=20
> --- a/docs/COLO-FT.txt=20
> +++ b/docs/COLO-FT.txt=20
> @@ -139,7 +139,7 @@ Secondary:=20
>  { 'execute': 'nbd-server-start',=20
>    'arguments': {'addr': {'type': 'inet', 'data': {'host': 'xx.xx.xx.xx=
',
> 'port': '8889'} } }=20
>  }=20
> -{'execute': 'nbd-server-add', 'arguments': {'device': 'secondeary-disk=
0',
> 'writable': true } }=20
> +{'execute': 'nbd-server-add', 'arguments': {'device': 'secondary-disk0=
',
> 'writable': true } }=20
>  =20
>  Note:=20
>    a. The qmp command nbd-server-start and nbd-server-add must be run=20
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--osDmuAXkBsxweWSKeqiUpTiv5ixmPRM4u--

--VlKKkl6D1EwWunswkKRfMChNG2dGmjjRG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJY0HuyAAoJEKeha0olJ0NqWfIIAIabVwRkkr+CqBxHlxr7jpej
8cmBdLAis9SSkotuRaOHqMQVlHEraXhu0Fr/nTQypyxNXB2RQG3YFnjLh46i5+jn
KRgY+ymlfZk0nzDZzzew3GSIYRZoxp31P/v+2qqKzZv3cF7769p7LSGaHiE/PF0K
zNONat5eS9leD0z5f0vKkCCsvV5gVpWZusUtxvQ+ER9/OERimoZ8QxQGHH83+2ol
UZitu2lEyor4OKnFKEqlFPF3bzGT9EtaAuRDpZmjFzlcN2s3ZhJwAIZ2rE8eml3p
r1SZHuf5W7NKmAJZmBcP3LT0hgl2PG3J4FiE4JhqxCpE625k/+8DjQQK0Eu/ROI=
=/ru0
-----END PGP SIGNATURE-----

--VlKKkl6D1EwWunswkKRfMChNG2dGmjjRG--

