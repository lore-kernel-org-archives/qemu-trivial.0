Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xwbz0-0001Lw-W0
	for mharc-qemu-trivial@gnu.org; Thu, 04 Dec 2014 14:22:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54937)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Xwbyv-0001Lc-Dn
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 14:22:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Xwbyq-0004lY-HF
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 14:22:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45595)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Xwbyq-0004lT-8Q; Thu, 04 Dec 2014 14:22:24 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB4JMN8q012503
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 4 Dec 2014 14:22:23 -0500
Received: from [10.3.113.183] (ovpn-113-183.phx2.redhat.com [10.3.113.183])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB4JMMB2025922; Thu, 4 Dec 2014 14:22:23 -0500
Message-ID: <5480B46E.9080808@redhat.com>
Date: Thu, 04 Dec 2014 12:22:22 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1417685215-5289-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1417685215-5289-1-git-send-email-armbru@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="WS6aGebuVJmP1m6DVKQX1H1cKJBM1TK0h"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Drop superfluous
	conditionals around g_strdup()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Dec 2014 19:22:34 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WS6aGebuVJmP1m6DVKQX1H1cKJBM1TK0h
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/04/2014 02:26 AM, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  backends/rng-random.c    |  6 +-----
>  hw/tpm/tpm_passthrough.c |  4 +---
>  util/uri.c               | 43 +++++++++++++++++-----------------------=
---
>  3 files changed, 19 insertions(+), 34 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--WS6aGebuVJmP1m6DVKQX1H1cKJBM1TK0h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJUgLRuAAoJEKeha0olJ0NqujoIAKiY3EtnxpHL9du3ERGiKw31
OQFY9s5kcDc3UjjDFqgsPtQFTcYmPsq1IagmC/42x0k0yVaVzaAgA3/4Y7UFSDm5
Zu39K3+5sKxnr2xKbAtHIs45eVH9LFM1jYgKzFheejqVIxZm+2iDUWIL5A1SMWxA
G49mzwdBEwaAad7cwLQMFVzZbUuTumwsFVBPhoDq/P1ee9+G3e+aLWmQNLOfVaYe
O+SHqzVP3iH5jy5a37fzx6quT+cd20Hzy85D9vcEvkyqGxMatcISXYV9FhqZGunX
O3RLsdO6SRrxOwyZ/hJtKX5fpjsim+ZOjXP0hvivjm7P7dc22aH3JepK9JyXa4c=
=NXLq
-----END PGP SIGNATURE-----

--WS6aGebuVJmP1m6DVKQX1H1cKJBM1TK0h--

