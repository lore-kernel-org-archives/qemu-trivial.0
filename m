Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d89Ui-00087t-Rw
	for mharc-qemu-trivial@gnu.org; Tue, 09 May 2017 14:04:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d89Ug-00086U-IJ
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 14:04:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d89Uf-0000lT-L1
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 14:04:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34884)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1d89Ua-0000h2-5s; Tue, 09 May 2017 14:04:12 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D471E804EB;
	Tue,  9 May 2017 18:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D471E804EB
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com D471E804EB
Received: from [10.10.123.147] (ovpn-123-147.rdu2.redhat.com [10.10.123.147])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 666B4783C5;
	Tue,  9 May 2017 18:04:04 +0000 (UTC)
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	"sochin.jiang fix wrong parameter comments in channel-file.h"
	<sochin@aliyun.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
	<046303d38caf2e9919588f87850ac884a48dd567.1494140528.git.mjt@msgid.tls.msk.ru>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <77d50415-65eb-a11f-c946-bf14e8f56a0c@redhat.com>
Date: Tue, 9 May 2017 13:04:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <046303d38caf2e9919588f87850ac884a48dd567.1494140528.git.mjt@msgid.tls.msk.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="PPpqMbcRReN7m2IpaSVOOAc6xbt40umv6"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 09 May 2017 18:04:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 11/23] channel-file: fix
 wrong parameter comments
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
X-List-Received-Date: Tue, 09 May 2017 18:04:19 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PPpqMbcRReN7m2IpaSVOOAc6xbt40umv6
Content-Type: multipart/mixed; boundary="11pb507LR9tt9kwwOD5io9mwcH5GV5ALx";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 "sochin.jiang fix wrong parameter comments in channel-file.h"
 <sochin@aliyun.com>, Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <77d50415-65eb-a11f-c946-bf14e8f56a0c@redhat.com>
Subject: Re: [Qemu-devel] [PULL 11/23] channel-file: fix wrong parameter
 comments
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
 <046303d38caf2e9919588f87850ac884a48dd567.1494140528.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <046303d38caf2e9919588f87850ac884a48dd567.1494140528.git.mjt@msgid.tls.msk.ru>

--11pb507LR9tt9kwwOD5io9mwcH5GV5ALx
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05/07/2017 02:02 AM, Michael Tokarev wrote:
> From: "sochin.jiang fix wrong parameter comments in channel-file.h" <so=
chin@aliyun.com>

Do we really want this HUGE email name, or can we get it touched up
before stefanha promotes his staging branch to master?

>=20
> Signed-off-by: sochin.jiang <sochin@aliyun.com>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  include/io/channel-file.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20


--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--11pb507LR9tt9kwwOD5io9mwcH5GV5ALx--

--PPpqMbcRReN7m2IpaSVOOAc6xbt40umv6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZEgSTAAoJEKeha0olJ0NqewUH/2P6LPeGN2akOgaYrIKHPfNw
fCDditqgjDRv/lvr8WRofhjcacXGSa1p2V8fCLT8PdIgIxmtBB+ka9zaiV9habUO
5K5iT2S9ttfdwCwPtzc9rri6H2lJD5iSzsY50tlTjvIT3zshb2pTDBv0S/GB4Jyy
Ocz6unsa6yN4t77XafKqEwawbB6i2r5o1P7Li7UYjMihiyvkepO+RNKtuaS8wZHg
lIBS0ZF/hzVOgyD0yOtvDSxFysHH8fQMKS9J/tBPcq+eFsK9VlKuKVVSeizAt7H5
Fcs9DnppsCTyU9+3hop2mIXw6mkXmTYFVLxx0wGu6h6vxT8vuhFbu+kV2AwPhVw=
=2qmk
-----END PGP SIGNATURE-----

--PPpqMbcRReN7m2IpaSVOOAc6xbt40umv6--

