Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XcF7N-0006jL-LX
	for mharc-qemu-trivial@gnu.org; Thu, 09 Oct 2014 10:55:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XcF7H-0006cQ-2Y
	for qemu-trivial@nongnu.org; Thu, 09 Oct 2014 10:54:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XcF7B-00086d-VF
	for qemu-trivial@nongnu.org; Thu, 09 Oct 2014 10:54:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49358)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1XcF71-000849-MK; Thu, 09 Oct 2014 10:54:39 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s99EsZ1j018028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 9 Oct 2014 10:54:35 -0400
Received: from [10.3.113.90] (ovpn-113-90.phx2.redhat.com [10.3.113.90])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s99EsY6p005934; Thu, 9 Oct 2014 10:54:34 -0400
Message-ID: <5436A1AA.8020004@redhat.com>
Date: Thu, 09 Oct 2014 08:54:34 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>, peter.maydell@linaro.org,
	"rth@twiddle.net" <rth@twiddle.net>
References: <54369514.5000004@gmail.com>
In-Reply-To: <54369514.5000004@gmail.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="G4RO9AOtARKHodmv7of75nSIDGt3O6sps"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH]
 disas/libvixl/a64/instructions-a64.h: Remove useless varialbe to avoid
 building break with '-Werror'
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
X-List-Received-Date: Thu, 09 Oct 2014 14:55:00 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--G4RO9AOtARKHodmv7of75nSIDGt3O6sps
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/09/2014 08:00 AM, Chen Gang wrote:

That's a very long subject line.  Try to keep subjects around 60
characters or so ('git shortlog -30' can give you an idea of reasonable
subjects).  Also, s/varialbe/variable/ in the subject.

> The related variables are useless, need be removed, or can not pass
> microblaze building, after fix it, can build microblaze, successfully.
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--G4RO9AOtARKHodmv7of75nSIDGt3O6sps
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJUNqGqAAoJEKeha0olJ0NqupEIAIK5TFpjhE6XnjvWlDDNp4A6
cJnIq8eo6lipTMJIXmgKYby6iJCq2t9pp+8h6Pchy7imWdQi3H4OJ9Cw/7VzAqiF
vcu7YXKzdYlFaM2p48MuOJUQwt+8pN1FQtAeK7FNNwASGSx1V+FMnSCjHPOgIupq
pnQ0dPUkLyzJE4oe3DgImrsqk3i73jE+GdWJFfLhC09505AZ6UmCqC9cprL2Dgb7
GAHlye4Kd0kilz91t+9ouPlyNqbSSEC3bwV4T7v/PIHm4+OchAggLR1mVKbTpMiB
7DhUo6FUegMkAWVxdHE1hI21K36Du0SoJkhg2JEBZNR4wyD1eWAPd+5kfWrI5Ik=
=el45
-----END PGP SIGNATURE-----

--G4RO9AOtARKHodmv7of75nSIDGt3O6sps--

