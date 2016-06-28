Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bHv7w-00046W-PS
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jun 2016 11:40:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52439)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bHv7s-0003pi-K3
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 11:40:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bHv7o-0002E2-Dg
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 11:40:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51424)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bHv7k-0002DR-RH; Tue, 28 Jun 2016 11:40:28 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 59DB3711D2;
	Tue, 28 Jun 2016 15:40:28 +0000 (UTC)
Received: from [10.3.116.72] (ovpn-116-72.phx2.redhat.com [10.3.116.72])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5SFeRUI025770; Tue, 28 Jun 2016 11:40:27 -0400
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1467125451-16700-1-git-send-email-peter.maydell@linaro.org>
	<1467125451-16700-7-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <57729A6B.50600@redhat.com>
Date: Tue, 28 Jun 2016 09:40:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1467125451-16700-7-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="qo7Nu8Kka1PCb1CahblomxvF3TbqWe9Jj"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 28 Jun 2016 15:40:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 6/6] bswap.h: Document
 cpu_to_* and *_to_cpu conversion functions
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
X-List-Received-Date: Tue, 28 Jun 2016 15:40:39 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qo7Nu8Kka1PCb1CahblomxvF3TbqWe9Jj
Content-Type: multipart/mixed; boundary="vwGHna4OP1XMWbslVOhmSMBoWhu5GEQKn"
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: patches@linaro.org
Message-ID: <57729A6B.50600@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 6/6] bswap.h: Document cpu_to_* and *_to_cpu
 conversion functions
References: <1467125451-16700-1-git-send-email-peter.maydell@linaro.org>
 <1467125451-16700-7-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1467125451-16700-7-git-send-email-peter.maydell@linaro.org>

--vwGHna4OP1XMWbslVOhmSMBoWhu5GEQKn
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/28/2016 08:50 AM, Peter Maydell wrote:
> Add a documentation comment describing the functions for
> converting between the cpu and little or bigendian formats.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/qemu/bswap.h | 58 ++++++++++++++++++++++++++++++++++++++++++++=
++++++++
>  1 file changed, 58 insertions(+)
>=20

With your followup patch for returning void on the in-place functions,

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--vwGHna4OP1XMWbslVOhmSMBoWhu5GEQKn--

--qo7Nu8Kka1PCb1CahblomxvF3TbqWe9Jj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXcpprAAoJEKeha0olJ0NqG04H/jlO+l/YSnjsPelZwC4MQgii
i9N8FihU0BrmHccYfEEfIn/NZ+GWxWdnvbWNob/FtoecvymOO5Z21ZvRqkC+5pTx
dYveHykR6m08w/RfOoLipBZSZkRsnr1+FthoxDXsxaqw8/BB2h/gV4e12KdIj9Cg
hfCqa0774malZQaKpwyTYPns9sqi8I4F8Bixe6ZL5E17vWcTaSnGwZIxzxQJodRl
D1h1cvRIgneenFBtceVCsj1Td7ZhF3R2E4GeGGoBwom58Jc/mfH2VV4QJZSR2M1I
gEyZNgycHF5V+qtL4/ZZY/S1VbKENaS+cnuwXXomPM38SuTBhioGad1/3Vacv4s=
=65/Z
-----END PGP SIGNATURE-----

--qo7Nu8Kka1PCb1CahblomxvF3TbqWe9Jj--

