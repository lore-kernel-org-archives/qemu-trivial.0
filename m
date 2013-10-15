Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VW5MC-0000Nq-T2
	for mharc-qemu-trivial@gnu.org; Tue, 15 Oct 2013 10:12:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1VW5M6-0000GK-1P
	for qemu-trivial@nongnu.org; Tue, 15 Oct 2013 10:12:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1VW5M1-0003ME-5s
	for qemu-trivial@nongnu.org; Tue, 15 Oct 2013 10:12:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32204)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1VW5Lr-0003KE-4d; Tue, 15 Oct 2013 10:11:59 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9FEBvEM007668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 15 Oct 2013 10:11:57 -0400
Received: from [10.3.113.119] (ovpn-113-119.phx2.redhat.com [10.3.113.119])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r9FEBupu027638; Tue, 15 Oct 2013 10:11:57 -0400
Message-ID: <525D4D2C.9040805@redhat.com>
Date: Tue, 15 Oct 2013 08:11:56 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1381842635-21699-1-git-send-email-lersek@redhat.com>
In-Reply-To: <1381842635-21699-1-git-send-email-lersek@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="5shjQri0A9g3aEIwgt5w02gdqLSBw3DiR"
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] move test-* from .gitignore
	to tests/.gitignore
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
X-List-Received-Date: Tue, 15 Oct 2013 14:12:19 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5shjQri0A9g3aEIwgt5w02gdqLSBw3DiR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10/15/2013 07:10 AM, Laszlo Ersek wrote:
> Also sort the test-* entries in the latter.
>=20
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> ---
>  .gitignore       |  9 ---------
>  tests/.gitignore | 11 +++++++++--
>  2 files changed, 9 insertions(+), 11 deletions(-)

This feels backwards to me.  I'd much rather have a single top-level
=2Egitignore for everything.  We are no longer in the CVS days of having =
a
per-directory ignore file.

But I'm not the maintainer, so someone with actual check-in privileges
can feel free to override me preference.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--5shjQri0A9g3aEIwgt5w02gdqLSBw3DiR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJSXU0sAAoJEKeha0olJ0NqFDoIAKTfaD5lvnh9iJ0EDP2n3EqM
+EuUCUgAkKNReMR5qQEx4K5HwKsto9Qa+L/Ci0q9F3FoTS07hOc6wDm0lP/H5MK8
v4A6dV0RDnMJjI9zLVBqaqYfIev6ynvnzJMvSdufj12641SlCgvs9XD4nnS5Fsg8
y8qsWIRRaTJYDd9yNpY5ye9rU1SbxjBboj7wFJEzM4LNSSTBkr2SmIYxtDDJbsfi
NaoFr/O/A7GRW3buvCFqr5mZs8WWT18P4xYKXR9X6PHOjH++hMCKfjEh3DD8h4Cm
fmpVlCGJInq9XMGT27BngqaokzQJmqV20d/KdXFdKHsMyBPckAg6nSRPt0p8Hj0=
=3WDM
-----END PGP SIGNATURE-----

--5shjQri0A9g3aEIwgt5w02gdqLSBw3DiR--

