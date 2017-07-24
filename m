Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZiIR-0002ls-9s
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:41:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dZiIP-0002k2-IZ
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:41:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dZiIO-0003zQ-NI
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:41:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53992)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dZiIG-0003vJ-Bm; Mon, 24 Jul 2017 14:41:24 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 49706C04D288;
	Mon, 24 Jul 2017 18:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 49706C04D288
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 49706C04D288
Received: from [10.10.121.48] (ovpn-121-48.rdu2.redhat.com [10.10.121.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B8DC461F55;
	Mon, 24 Jul 2017 18:41:17 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-6-f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <31d7d85c-6410-c5ef-634d-c43523ad68cd@redhat.com>
Date: Mon, 24 Jul 2017 13:41:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170724182751.18261-6-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="LjHdJXaFmTWkqanbhDGVk1XiK8lBxMs7s"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 24 Jul 2017 18:41:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for 2.10 05/35] nbd: fix memory leak in
 nbd_opt_go()
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
X-List-Received-Date: Mon, 24 Jul 2017 18:41:34 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LjHdJXaFmTWkqanbhDGVk1XiK8lBxMs7s
Content-Type: multipart/mixed; boundary="pn0T4L82wnnWUP4P2bws4slvla4lHlhqt";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Message-ID: <31d7d85c-6410-c5ef-634d-c43523ad68cd@redhat.com>
Subject: Re: [PATCH for 2.10 05/35] nbd: fix memory leak in nbd_opt_go()
References: <20170724182751.18261-1-f4bug@amsat.org>
 <20170724182751.18261-6-f4bug@amsat.org>
In-Reply-To: <20170724182751.18261-6-f4bug@amsat.org>

--pn0T4L82wnnWUP4P2bws4slvla4lHlhqt
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/24/2017 01:27 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> nbd/client.c:385:12: warning: Potential leak of memory pointed to by 'b=
uf'
>=20
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  nbd/client.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

I plan to take this through the NBD tree for 2.10, if no one else picks
up the entire series first.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--pn0T4L82wnnWUP4P2bws4slvla4lHlhqt--

--LjHdJXaFmTWkqanbhDGVk1XiK8lBxMs7s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAll2P00ACgkQp6FrSiUn
Q2pkWgf/aUDuTsUJH2iEl9EsTrNoo1CCxF/WEtB66UxEBZOO1eIxLGnh0YV4OidP
y6teejM9FcIwTapI5KSmXTiApHwR8Sz7kHdSfBsR90K2h3olQnO0cUSkN0jfYp5h
ugmV3VSTJCRldH6mLDO0hv7N6z0ixDb7eadXPao1kH/ol5PnazrsCIcjfhKD5khJ
8cjLvK6iiljdsLd4ivyuGgt7AIYM8Ha/dzrElRiaZkUP5UyaIgSec/HlEQN7DN1M
wmG5+BgL3++eJcHT9bqDweNEUQThteV/iI5zsJiTFFZr8eMKTlDGZp97cms6BU1t
bvM14Oyt81TlnrehAtxVs3c+O68ClA==
=TN43
-----END PGP SIGNATURE-----

--LjHdJXaFmTWkqanbhDGVk1XiK8lBxMs7s--

