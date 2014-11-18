Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xqaar-0007Oa-MS
	for mharc-qemu-trivial@gnu.org; Mon, 17 Nov 2014 23:40:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Xqaak-0007O7-Ur
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 23:40:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Xqaad-00049N-Vi
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 23:40:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51107)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Xqaad-00049F-Hu; Mon, 17 Nov 2014 23:40:31 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAI4eUCv026105
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 17 Nov 2014 23:40:30 -0500
Received: from [10.3.113.56] (ovpn-113-56.phx2.redhat.com [10.3.113.56])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAI4eTNP028472; Mon, 17 Nov 2014 23:40:29 -0500
Message-ID: <546ACDBD.9010403@redhat.com>
Date: Mon, 17 Nov 2014 21:40:29 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <1416278986-17320-1-git-send-email-famz@redhat.com>
In-Reply-To: <1416278986-17320-1-git-send-email-famz@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="EBqDc6db0f1G1VceLhp9nxpVoaQd3TRRj"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, mjt@tls.msk.ru,
	stefanha@redhat.com, mreitz@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-iotests: Fix error
 message if which(1) not installed
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
X-List-Received-Date: Tue, 18 Nov 2014 04:40:44 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EBqDc6db0f1G1VceLhp9nxpVoaQd3TRRj
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/17/2014 07:49 PM, Fam Zheng wrote:
> When which(1) is not installed, we complain "perl not found" because
> it's the first set_prog_path check. The error message is misleading.
>=20
> Fix it by adding a check for which(1) in the beginning.

Why not instead change set_prog_path to use 'command -v' instead of
'which'?  As this is a bash script, we shouldn't need to shell out to an
optional package for something we can do natively.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--EBqDc6db0f1G1VceLhp9nxpVoaQd3TRRj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJUas29AAoJEKeha0olJ0NqKrgH/iFPTJyjOd5tZ2HLSvV4SzMK
W/bR56j+gYnl/TgtREYw4NGYYFz0kfbrw/aTjqGR7elslZalWqtXDy4iOAfxQkNf
2gmYPnemTawxc3SheLU2JwqAUb3m1FAFowSZYuuUYefymCdqAbWEj86wS7KdZTga
+rV/DFSjmJrGNpT0OdeohmSjCeuDPHNRyuzYC2PV+eePHj74DsIEpOtVBDmg0csa
4wcxBKr+SQok1iO9sZ71xv3lr5uQZufsiva8jAysL+GpQ2AM7fvRlNivsxceRqJq
mKklSbJtuF+aL3+f1EdHvOTalVYs1V3KCXsW5jBzbA9JRF9DRcE/QobVROtLkeU=
=lsPh
-----END PGP SIGNATURE-----

--EBqDc6db0f1G1VceLhp9nxpVoaQd3TRRj--

