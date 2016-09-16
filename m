Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bkvUd-0002Du-Mv
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 11:55:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bkvUb-0002CZ-6d
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 11:55:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bkvUa-0000WU-Eu
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 11:55:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44984)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bkvUS-0000QR-Rv; Fri, 16 Sep 2016 11:55:48 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDABC3455B5;
	Fri, 16 Sep 2016 15:55:47 +0000 (UTC)
Received: from [10.3.116.184] (ovpn-116-184.phx2.redhat.com [10.3.116.184])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GFtlOo019453; Fri, 16 Sep 2016 11:55:47 -0400
To: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
	<1474034177-17663-25-git-send-email-lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <35822966-36ee-5106-320d-f5106db8aabd@redhat.com>
Date: Fri, 16 Sep 2016 10:55:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1474034177-17663-25-git-send-email-lvivier@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="I615whXeOg6Mi1rU3STM86PoN2waHsK3J"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 16 Sep 2016 15:55:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 24/26] error,
 trace: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
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
X-List-Received-Date: Fri, 16 Sep 2016 15:55:58 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--I615whXeOg6Mi1rU3STM86PoN2waHsK3J
Content-Type: multipart/mixed; boundary="toO2cIs8TOJuh2pH5ecvQKiq56Hd7oR9D"
From: Eric Blake <eblake@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Message-ID: <35822966-36ee-5106-320d-f5106db8aabd@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 24/26] error, trace: use exit(EXIT_SUCCESS)
 and exit(EXIT_FAILURE)
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
 <1474034177-17663-25-git-send-email-lvivier@redhat.com>
In-Reply-To: <1474034177-17663-25-git-send-email-lvivier@redhat.com>

--toO2cIs8TOJuh2pH5ecvQKiq56Hd7oR9D
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/16/2016 08:56 AM, Laurent Vivier wrote:
> This patch is the result of coccinelle script
> scripts/coccinelle/exit.cocci
>=20
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> CC: Markus Armbruster <armbru@redhat.com>
> ---
>  trace/control.c | 10 +++++-----
>  util/error.c    |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)

Matching comments in error.h should be changed by this patch.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--toO2cIs8TOJuh2pH5ecvQKiq56Hd7oR9D--

--I615whXeOg6Mi1rU3STM86PoN2waHsK3J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJX3BYCAAoJEKeha0olJ0Nq4P0H/1AbelIQgaBV4R+Aq56MoxPM
oDZL3FUlqGPRhboyzj3h22Y7F3xeFk/wopoiKjYO9y3P924HAxsgmIlK96q+QxwI
5zR3nRTDhrlgGenUYfqNYsM/R+oxqdVFC31S94LI5K+bNgznh7cV3UY6WMpA12Cy
q7r/XRALzEaAXcx3LAXJfkZTWWHaPa0/tfEouOE1fUJtyTFBvAcdFJKbEqsgmN8U
gE8Fj72XUtMD3Th6//J+y3ONBIajLpSLG7TqijB6T5HFoiu0gTKrdRiLdWkMEbj9
KHAFhQsqV1lzbiN4RC8GFeeXq3KQDGM0JVQzcA/dYcpv9GIxmmzR65laHt9jQME=
=1Ds0
-----END PGP SIGNATURE-----

--I615whXeOg6Mi1rU3STM86PoN2waHsK3J--

