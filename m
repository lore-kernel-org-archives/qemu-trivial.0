Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1USwLe-00007u-R9
	for mharc-qemu-trivial@gnu.org; Thu, 18 Apr 2013 17:26:30 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1USwLd-00006O-5s
	for qemu-trivial@nongnu.org; Thu, 18 Apr 2013 17:26:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1USwJJ-0005Tp-R3
	for qemu-trivial@nongnu.org; Thu, 18 Apr 2013 17:24:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40778)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1USwJJ-0005Te-Dy; Thu, 18 Apr 2013 17:24:05 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r3ILO46u000996
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 18 Apr 2013 17:24:04 -0400
Received: from [10.3.113.85] (ovpn-113-85.phx2.redhat.com [10.3.113.85])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r3ILO32w005962; Thu, 18 Apr 2013 17:24:03 -0400
Message-ID: <51706473.7030808@redhat.com>
Date: Thu, 18 Apr 2013 15:24:03 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130402 Thunderbird/17.0.5
MIME-Version: 1.0
To: "Richard W.M. Jones" <rjones@redhat.com>
References: <1366319373-12926-1-git-send-email-rjones@redhat.com>
In-Reply-To: <1366319373-12926-1-git-send-email-rjones@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="----enig2FQDMDJIVXMGHDSJWCDXH"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, sw@weilnetz.de, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ssh: Remove unnecessary use
	of strlen function.
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
X-List-Received-Date: Thu, 18 Apr 2013 21:26:30 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2FQDMDJIVXMGHDSJWCDXH
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 04/18/2013 03:09 PM, Richard W.M. Jones wrote:
> From: "Richard W.M. Jones" <rjones@redhat.com>
>=20
> ---
>  block/ssh.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


------enig2FQDMDJIVXMGHDSJWCDXH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJRcGRzAAoJEKeha0olJ0NqAJQH+QH6gZoVz0uq9skczmdE1PUs
Vaj3AfKUFXt5J+alzH6TSLyPP7XTjs211BlFakcuKVKHeJMFsruk7wuA9e1ZJD/b
/VLl0VXT2rF7gApamJZJaJU5ParPaeHJ3heUyRvHpuWfofEn5CbZ47Nen0gIhQRs
G3Rh206pEZqFb1na22irjhN3Ae3k2F8WyW+9mp+RH6KI4j5oDEXs6/a/ekoSqHZX
MNQl8cO0GuCt+pB/2MUtSmVZ98AAW1/HzauQwaj0z5YVq6qlYzOadJetQmvsbMyW
9T72bEZdKjr4Ah6HC2Y8R4ywtKg5PWvgHdLMeSBIr04KfTqVmhtUCHNu5Tp7SlA=
=nlkS
-----END PGP SIGNATURE-----

------enig2FQDMDJIVXMGHDSJWCDXH--

