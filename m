Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zk6Aq-0000Wg-HT
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 04:03:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Zj7iB-0000Ow-IM
	for qemu-trivial@nongnu.org; Mon, 05 Oct 2015 11:30:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Zj7iA-00020z-Ig
	for qemu-trivial@nongnu.org; Mon, 05 Oct 2015 11:29:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40640)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Zj7i1-0001ud-TF; Mon, 05 Oct 2015 11:29:49 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 88EF28E690;
	Mon,  5 Oct 2015 15:29:49 +0000 (UTC)
Received: from [10.3.113.192] (ovpn-113-192.phx2.redhat.com [10.3.113.192])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t95FTm0m032681; Mon, 5 Oct 2015 11:29:48 -0400
To: Michael Tokarev <mjt@tls.msk.ru>, Shraddha Barke <shraddha.6596@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-trivial@nongnu.org
References: <1443191763-3445-1-git-send-email-shraddha.6596@gmail.com>
	<1443191763-3445-2-git-send-email-shraddha.6596@gmail.com>
	<5610097E.5090306@msgid.tls.msk.ru>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <5612976B.3060809@redhat.com>
Date: Mon, 5 Oct 2015 09:29:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <5610097E.5090306@msgid.tls.msk.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="7KadcS8wS4l4nQtlFLLUt8FEoqC5Qrovm"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] Hw: timer: Remove
	unnecessary variable
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
X-List-Received-Date: Mon, 05 Oct 2015 15:37:52 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7KadcS8wS4l4nQtlFLLUt8FEoqC5Qrovm
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/03/2015 10:59 AM, Michael Tokarev wrote:
> 25.09.2015 17:36, Shraddha Barke wrote:
>> Compress lines and remove the variable.
>=20
> Applied to -trivial, removing the Coccinelle script
> from the commit message.

Why cripple the commit message? The coccinelle recipe is useful for
someone trying to backport the script to a different branch where a
straight backport doesn't quite work, but rerunning the coccinelle
recipe does.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--7KadcS8wS4l4nQtlFLLUt8FEoqC5Qrovm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWEpdrAAoJEKeha0olJ0NqUbEIAJtev69Ktv5w9M45gBYsPjHT
yn91WxF1CQiXJnxLG+7BGY9y+c8Bst3yMxwJmuVsJ+gTDbeev9c8Kkv2EysFS8B7
l3ZoXtkkLQg96rs0zE9nahNIF/ZE6XblRoIjyXzmQ2t1PB0w+XvjJNsL8HDESytU
lbuDmJZtpZ9AJ7wmOitufo5f6/gOxUcyUiTbaIKci/6H+GWpWRXIQKAgAW5bLq5P
8zm905jsJRhb/BCMQGdgeX2Uhr0w9JcwfhgtB01y7iHND1o3CKRP/mInX2xrxU2L
yGnKbwTpBRDwXlFEd3FRlULcVMPvmtb1xGTxEo6MIMbTQbjPTKn7DJKBZLysC5w=
=VaTA
-----END PGP SIGNATURE-----

--7KadcS8wS4l4nQtlFLLUt8FEoqC5Qrovm--

