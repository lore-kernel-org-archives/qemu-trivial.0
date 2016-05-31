Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7nM0-0000qp-NL
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2016 13:21:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b7nLy-0000oH-0S
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 13:21:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b7nLt-0007KQ-Go
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 13:21:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51460)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1b7nLc-0007Ip-TQ; Tue, 31 May 2016 13:20:57 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 684443B72A;
	Tue, 31 May 2016 17:20:56 +0000 (UTC)
Received: from [10.3.116.22] (ovpn-116-22.phx2.redhat.com [10.3.116.22])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4VHKt0j005243; Tue, 31 May 2016 13:20:56 -0400
To: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
	<1464712565-14857-4-git-send-email-lvivier@redhat.com>
Cc: qemu-block@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <574DC7F7.1030905@redhat.com>
Date: Tue, 31 May 2016 11:20:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1464712565-14857-4-git-send-email-lvivier@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="vjI6QOTSfLoEoQ69Hk2crkpXgTMTMGaws"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 31 May 2016 17:20:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 03/16] qcow/qcow2: Use
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
X-List-Received-Date: Tue, 31 May 2016 17:21:19 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vjI6QOTSfLoEoQ69Hk2crkpXgTMTMGaws
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/31/2016 10:35 AM, Laurent Vivier wrote:
> Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).
>=20
> This patch is the result of coccinelle script
> scripts/coccinelle/round.cocci
>=20
> CC: qemu-block@nongnu.org
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  block/qcow.c           | 4 ++--
>  block/qcow2-cluster.c  | 4 ++--
>  block/qcow2-refcount.c | 6 ++----
>  3 files changed, 6 insertions(+), 8 deletions(-)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--vjI6QOTSfLoEoQ69Hk2crkpXgTMTMGaws
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXTcf3AAoJEKeha0olJ0NqL+0IAIlXbolTLeLaisB6Bb61Kni9
wt+8h3voRlTMea23aHZsbcqrUBjHAJYRusvpu83IASZT19OFpY959Z1jHduM7jaT
XSVtykT2RkGjN07sWO4yJmNsDHVDtjQ05bDjeGmK6TYjN9KkhU2sQPmVJHE+dpyr
0TXOpiComv7iMnHx54MD6cbc7HAIEPkx2E+M6WQ6SOjhkrXSRiSSypbiTw8GSvmL
qamvjznoqEBO9AR3ZA/v7JUnAc5VnUifMtlSxm/AWGD+JvCHnm63hk98JnV68dXH
A3F6gYomZrvTsH5mgC9EOJafAeIwX3rSMV2PdYnnlkZBFIdPoyeJEHgrMIfR66k=
=lW5X
-----END PGP SIGNATURE-----

--vjI6QOTSfLoEoQ69Hk2crkpXgTMTMGaws--

