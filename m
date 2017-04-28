Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d48zp-0000q2-Sv
	for mharc-qemu-trivial@gnu.org; Fri, 28 Apr 2017 12:43:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1d48zo-0000ou-GD
	for qemu-trivial@nongnu.org; Fri, 28 Apr 2017 12:43:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1d48zn-0001D3-K1
	for qemu-trivial@nongnu.org; Fri, 28 Apr 2017 12:43:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38368)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1d48zj-0001AB-5L; Fri, 28 Apr 2017 12:43:47 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 01F5C75721;
	Fri, 28 Apr 2017 16:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 01F5C75721
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=mreitz@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 01F5C75721
Received: from [10.40.204.102] (ovpn-204-102.brq.redhat.com [10.40.204.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFAA75C467;
	Fri, 28 Apr 2017 16:43:44 +0000 (UTC)
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, eblake@redhat.com
References: <20170427205100.9505-1-jsnow@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <f14b3ea0-ab40-b3db-faf4-9b4882b12065@redhat.com>
Date: Fri, 28 Apr 2017 18:43:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <20170427205100.9505-1-jsnow@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="ckSnlhUEKE3aNG1ctJBAC1CfTNmJCxtjr"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 28 Apr 2017 16:43:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 0/2] iotests: trivial fixups
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
X-List-Received-Date: Fri, 28 Apr 2017 16:43:53 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ckSnlhUEKE3aNG1ctJBAC1CfTNmJCxtjr
Content-Type: multipart/mixed; boundary="TlKAU1oMteScVx2qxNx8xGn4LBf6dX0QL";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, eblake@redhat.com
Message-ID: <f14b3ea0-ab40-b3db-faf4-9b4882b12065@redhat.com>
Subject: Re: [PATCH 0/2] iotests: trivial fixups
References: <20170427205100.9505-1-jsnow@redhat.com>
In-Reply-To: <20170427205100.9505-1-jsnow@redhat.com>

--TlKAU1oMteScVx2qxNx8xGn4LBf6dX0QL
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 27.04.2017 22:50, John Snow wrote:
> Excised from an old patchset from 2015, just a couple of touchups.
>=20
> John Snow (2):
>   iotests: clarify help text
>   iotests: fix exclusion option
>=20
>  tests/qemu-iotests/common | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)

Thanks, applied to my block tree:

https://github.com/XanClic/qemu/commits/block

Max


--TlKAU1oMteScVx2qxNx8xGn4LBf6dX0QL--

--ckSnlhUEKE3aNG1ctJBAC1CfTNmJCxtjr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFGBAEBCAAwFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAlkDcT8SHG1yZWl0ekBy
ZWRoYXQuY29tAAoJEPQH2wBh1c9A6rwIAIOudfoVYcUIlVdbGcm/Jn3WmJ/x8nF5
YXNSxecyBmphxgpJqcjpPCThFoANQ3FX2vlReC1865sKze2pAkYZJhMeWulbSe8X
uy/H+E0ThfGaZJUeXZEfZLrnaQeXWVuynJA4VGcjqtxC35DxrSmaE4PQKKBT81y0
BzC4rAqfCDBk81uMuej3o4jZjWugwI3zEyOMZPNzkv5imk07L2XI5nmi7AZ+jybu
uiEShlRAhPkt12BQX8xmsxQjX9hvNLXeeVpunqeU7c9Kt2N6GMoVoC3+36o5a0Dz
wursMACtjAs87ZcfK6fCzFGIKDLknpK/9ZYeawv0AU+3pEKp8EJFGSg=
=Phur
-----END PGP SIGNATURE-----

--ckSnlhUEKE3aNG1ctJBAC1CfTNmJCxtjr--

