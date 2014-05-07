Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhqhT-0005xE-KB
	for mharc-qemu-trivial@gnu.org; Tue, 06 May 2014 21:31:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WhqhN-0005qC-Jb
	for qemu-trivial@nongnu.org; Tue, 06 May 2014 21:31:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WhqhI-0000MZ-MG
	for qemu-trivial@nongnu.org; Tue, 06 May 2014 21:31:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:19339)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Whqh6-0008UL-Ft; Tue, 06 May 2014 21:30:48 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s471UZO1001137
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 6 May 2014 21:30:40 -0400
Received: from [10.3.113.86] (ovpn-113-86.phx2.redhat.com [10.3.113.86])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s471UYUk013815; Tue, 6 May 2014 21:30:34 -0400
Message-ID: <53698CBA.7040901@redhat.com>
Date: Tue, 06 May 2014 19:30:34 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <1399341953-14387-1-git-send-email-famz@redhat.com>
In-Reply-To: <1399341953-14387-1-git-send-email-famz@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="e6K8aNGc0EInhOHVe9AptbpWb4URWQDO5"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v2] qapi: Document optional arguments'
	backwards compatibility
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
X-List-Received-Date: Wed, 07 May 2014 01:31:10 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--e6K8aNGc0EInhOHVe9AptbpWb4URWQDO5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 05/05/2014 08:05 PM, Fam Zheng wrote:
> Signed-off-by: Fam Zheng <famz@redhat.com>
>=20
> ---
> v2: Employ the text suggested by Eric. (Thanks!)

Since much of it is my wording, it's probably better to credit me as an
author, by adding:

Signed-off-by: Eric Blake <eblake@redhat.com>

>=20
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  docs/qapi-code-gen.txt | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
>=20
> +The use of '*' as a prefix to the name means the member is optional.
> +
> +The default initialization value of an optional argument should not be=
 changed
> +between versions of QEMU unless the new default maintains backward
> +compatibility to the user-visible behavior of the old default.

Maybe worth adding:

With proper documentation, this policy still allows some flexibility;
for example, documenting that a default of 0 picks an optimal buffer
size allows one release to declare the optimal size at 512 while another
release declares the optimal size at 4096 - the user-visible behavior is
not the bytes used by the buffer, but the fact that the buffer was
optimal size.

> +
> +On input structures (only mentioned in the 'data' side of a command), =
changing
> +from mandatory to optional is safe (older clients will supply the opti=
on, and
> +newer clients can benefit from the default); changing from optional to=

> +mandatory is backwards incompatible (older clients may be omitting the=
 option,
> +and must continue to work).
> +
> +On output structures (only mentioned in the 'returns' side of a comman=
d),
> +changing from mandatory to optional is in general unsafe (older client=
s may be
> +expecting the field, and could crash if it is missing), although it ca=
n be done
> +if the only way that the optional argument will be omitted is when it =
is
> +triggered by the presence of a new input flag to the command that olde=
r clients
> +don't know to send.  Changing from optional to mandatory is safe.
> +
> +A structure that is used in both input and output of various commands
> +must consider the backwards compatibility constraints of both directio=
ns
> +of use.


--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--e6K8aNGc0EInhOHVe9AptbpWb4URWQDO5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJTaYy6AAoJEKeha0olJ0NqtEAH/1Ypq0t+3JMIpO/Ubvh4TnYX
fmm/SEZPOhuUrOAivXSY88pQgFpq8mOvKWndZmAXMPkhlPZLGFlffB6WAP7gGoXj
xAxJO1WtinMbWAq49kx8scHEidg/lTSa1i4j5ArNHJY3QRB+2wxFsXmSpWrvJ9h1
qrFXTS7nHzmc1WgapzSOmiwx2SOw2Zy87Ju3ojIpE7jMf/zquBMg4NFWoxuwVoM9
LGdeYK8sMx1CH/kPHK75nwpDHYfz3Xjle/6Pq3WYXuUswzM79DbO57yeGe82Fea7
ISPlcC59a6G3BfY0mCZfTcKSem7GZWk5WXW5DXXmuz6iJ3SW8Vd4lZg506scXFM=
=oAFg
-----END PGP SIGNATURE-----

--e6K8aNGc0EInhOHVe9AptbpWb4URWQDO5--

