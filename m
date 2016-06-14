Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bCwRi-0006PQ-P9
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jun 2016 18:04:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bCwRh-0006OA-98
	for qemu-trivial@nongnu.org; Tue, 14 Jun 2016 18:04:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bCwRe-0006HA-2V
	for qemu-trivial@nongnu.org; Tue, 14 Jun 2016 18:04:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52336)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bCwRV-0006Bs-1J; Tue, 14 Jun 2016 18:04:17 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 96FABC05B1DE;
	Tue, 14 Jun 2016 22:04:16 +0000 (UTC)
Received: from [10.3.116.106] (ovpn-116-106.phx2.redhat.com [10.3.116.106])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5EM4Ft9010440; Tue, 14 Jun 2016 18:04:15 -0400
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <1459967330-4573-1-git-send-email-mreitz@redhat.com>
	<1459967330-4573-3-git-send-email-mreitz@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Luiz Capitulino <lcapitulino@redhat.com>,
	qemu-trivial <qemu-trivial@nongnu.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <57607F5F.8090908@redhat.com>
Date: Tue, 14 Jun 2016 16:04:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1459967330-4573-3-git-send-email-mreitz@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="reD56Rbb5VrSpKRKlQ668iea6t20Xg06r"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 14 Jun 2016 22:04:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v3 02/14] block/nbd: Drop trailing "." in
 error messages
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
X-List-Received-Date: Tue, 14 Jun 2016 22:04:30 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--reD56Rbb5VrSpKRKlQ668iea6t20Xg06r
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 04/06/2016 12:28 PM, Max Reitz wrote:
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  block/nbd.c                   | 4 ++--
>  tests/qemu-iotests/051.out    | 4 ++--
>  tests/qemu-iotests/051.pc.out | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

Could go in via qemu-trivial, if desired.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--reD56Rbb5VrSpKRKlQ668iea6t20Xg06r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXYH9fAAoJEKeha0olJ0NqpjEIAKS651MjIphd4+S4Iy8lxZr8
6/oy9v6TSf+Y7nHmBAaE0h64Ki8TESk7U/5xgqhjUviwK/miaJEVCGHThc4Zu2vS
DQbROXhmBeSDJ85ZBr2xxQF+JykGWgMAdIg6VDOd6M5hpzaf7OyShxsfhBgJkIKu
5Dw59xTwbQjVmoX+OZ0+5B/zyn7BAPZaBnsZUJQPGqRjq6W4ev3RgnzBGoz6PZ6g
UQrN2h4rEH1IMa407v83ihoQAHwpve8Zy4AtOlqj3rOsBWQvkdgHFLq7KQic0xkK
mW6BR+kcO3peROrcL6S6vSP7alWnGp9GgFbD4kytJTeR3paSGVcCUNM+/rN5n3E=
=pVxJ
-----END PGP SIGNATURE-----

--reD56Rbb5VrSpKRKlQ668iea6t20Xg06r--

