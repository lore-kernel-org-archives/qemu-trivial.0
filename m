Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXtN9-0003DF-3z
	for mharc-qemu-trivial@gnu.org; Tue, 17 Mar 2015 11:25:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YXtN1-0002xl-Lv
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 11:25:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YXtMw-0001jz-Q4
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 11:25:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43792)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YXtMw-0001i6-Hj; Tue, 17 Mar 2015 11:25:22 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2HFOw9o008030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 17 Mar 2015 11:24:59 -0400
Received: from [10.3.113.105] (ovpn-113-105.phx2.redhat.com [10.3.113.105])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2HFOv0j003095; Tue, 17 Mar 2015 11:24:58 -0400
Message-ID: <55084749.4030607@redhat.com>
Date: Tue, 17 Mar 2015 09:24:57 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Viswesh <visweshn92@gmail.com>, qemu-devel@nongnu.org
References: <1426603988-3541-1-git-send-email-visweshn92@gmail.com>
In-Reply-To: <1426603988-3541-1-git-send-email-visweshn92@gmail.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="JUskqUqpu8k02nebT4mmQgK2ePUu026Wt"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kbastian@mail.uni-paderborn.de,
	aneesh.kumar@linux.vnet.ibm.com, peter.maydell@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] Fix typos in comments
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
X-List-Received-Date: Tue, 17 Mar 2015 15:25:33 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JUskqUqpu8k02nebT4mmQgK2ePUu026Wt
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/17/2015 08:53 AM, Viswesh wrote:
> The commit message is changed per review comments of Peter Maydell.
> This should be good now.

These two sentences...

>=20
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Viswesh <visweshn92@gmail.com>
> ---

=2E..belong better here.  They describe how the patch changed from v1, an=
d
not the patch itself (that is, a year from now when reading 'git log',
we won't care how many revisions it took to get to the patch that was
accepted, we will only care about the one revision that was accepted).

>  fsdev/virtfs-proxy-helper.c |  2 +-
>  target-tricore/translate.c  | 22 +++++++++++-----------
>  2 files changed, 12 insertions(+), 12 deletions(-)
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--JUskqUqpu8k02nebT4mmQgK2ePUu026Wt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVCEdJAAoJEKeha0olJ0Nq4hIH/2o6CrRZl8MGuf1AFJQSXek+
dbF4kb/aYpWgNetfC5vDmBicdeIMvHwJqWYdlBuVJk/Sisjm75Cu4U1HpjUDDT8S
jXW6zItRxfv/TEXO8IjxQFNTuR371iLsjPTKyuvLrIGSVW1cFb7PULquYTsIuyQv
H0rsSs5qsTiDkYKxXQr3dD/MQjcHdyBf91KfER81KW5Mx4yIi1g7Htyt1deEwvq7
H1TwZ/Imzo+2zilCdKAnXrrl5mKvMum0KYrnr7AtVQoD1esJJdhHebDzrLF36Kpe
yF4bCHwse8WA08Tu8BOWSTI2vnn4WhrXRnG2CdOxHV7Hn4Klx4jgdlR4Wa5JjzQ=
=F9LK
-----END PGP SIGNATURE-----

--JUskqUqpu8k02nebT4mmQgK2ePUu026Wt--

