Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cwBo5-0004C2-UY
	for mharc-qemu-trivial@gnu.org; Thu, 06 Apr 2017 14:06:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cwBo3-0004AI-Sn
	for qemu-trivial@nongnu.org; Thu, 06 Apr 2017 14:06:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cwBo3-0005Xv-0A
	for qemu-trivial@nongnu.org; Thu, 06 Apr 2017 14:06:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38058)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cwBny-0005Vy-8G; Thu, 06 Apr 2017 14:06:46 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D73F8049B;
	Thu,  6 Apr 2017 18:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4D73F8049B
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 4D73F8049B
Received: from [10.10.124.8] (ovpn-124-8.rdu2.redhat.com [10.10.124.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 87E947E87C;
	Thu,  6 Apr 2017 18:06:44 +0000 (UTC)
To: Jeff Cody <jcody@redhat.com>, qemu-devel@nongnu.org
References: <433d922c5ad43020493323c5e065b4c4ef4157ab.1491500481.git.jcody@redhat.com>
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, mreitz@redhat.com
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <d3604dd2-6a9c-7ee3-0b30-d9107bf61287@redhat.com>
Date: Thu, 6 Apr 2017 13:06:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <433d922c5ad43020493323c5e065b4c4ef4157ab.1491500481.git.jcody@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="3bM3pc3iaekTtUTfvokVw3n8L5La2BLua"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 06 Apr 2017 18:06:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.9 1/1] qemu-img:
 img_create does not support image-opts, fix docs
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
X-List-Received-Date: Thu, 06 Apr 2017 18:06:53 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3bM3pc3iaekTtUTfvokVw3n8L5La2BLua
Content-Type: multipart/mixed; boundary="15XnscoXt046hqRNHnOFXGrkF5F3hiB10";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Jeff Cody <jcody@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, mreitz@redhat.com
Message-ID: <d3604dd2-6a9c-7ee3-0b30-d9107bf61287@redhat.com>
Subject: Re: [Qemu-devel] [PATCH for-2.9 1/1] qemu-img: img_create does not
 support image-opts, fix docs
References: <433d922c5ad43020493323c5e065b4c4ef4157ab.1491500481.git.jcody@redhat.com>
In-Reply-To: <433d922c5ad43020493323c5e065b4c4ef4157ab.1491500481.git.jcody@redhat.com>

--15XnscoXt046hqRNHnOFXGrkF5F3hiB10
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 04/06/2017 12:45 PM, Jeff Cody wrote:
> The documentation and help for qemu-img claims that 'qemu-img create'
> will take the '--image-opts' argument.  This is not true, so this
> patch removes those claims.
>=20
> Signed-off-by: Jeff Cody <jcody@redhat.com>
> ---
>  qemu-img-cmds.hx | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Doc fix, worth having in 2.9 if we still have time.
Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--15XnscoXt046hqRNHnOFXGrkF5F3hiB10--

--3bM3pc3iaekTtUTfvokVw3n8L5La2BLua
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJY5oOzAAoJEKeha0olJ0Nql/EIAKR/9iZ4cvkyvuWUyg6ZsrEV
Wt5iT0XUB9IWNMCuIqpstH7qy3Qd1UApuGDCV1zzrjJP75jSZC47nrPMc+XNzJ+H
RWASacWQDWOtuQo2TfO9meUcpLmWR4EzgSdnZm0ZQu30ikTRLBC3aGdrEdvbtPlA
HHyLb1rCqLa6q0LW/s44PPBU1Bs3BNU4diH6JfAW/3dsfKlW/Qb9AwVSgdV0diHP
apArk/PheBy9U9f1d0c54oG0MjL0NcEQ/VzA+y81KzrfVquBwu/HNGkvMvBSbh/O
yj4yDjCutVl+NhqhP/pT9pZr8wGkNgJNFzsdhZfCFzH+nbxD4+vFwAjVHeO860E=
=BOuk
-----END PGP SIGNATURE-----

--3bM3pc3iaekTtUTfvokVw3n8L5La2BLua--

