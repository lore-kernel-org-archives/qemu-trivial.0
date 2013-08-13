Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V9UtR-0005R1-SW
	for mharc-qemu-trivial@gnu.org; Wed, 14 Aug 2013 02:49:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1V9M1k-0001Xa-Np
	for qemu-trivial@nongnu.org; Tue, 13 Aug 2013 17:21:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1V9M1g-0003hm-Q1
	for qemu-trivial@nongnu.org; Tue, 13 Aug 2013 17:21:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39617)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1V9M1X-0003fh-E8; Tue, 13 Aug 2013 17:21:03 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r7DLKwBY010355
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 13 Aug 2013 17:20:58 -0400
Received: from [10.3.113.47] (ovpn-113-47.phx2.redhat.com [10.3.113.47])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r7DLKvv8028073; Tue, 13 Aug 2013 17:20:57 -0400
Message-ID: <520AA338.2010408@redhat.com>
Date: Tue, 13 Aug 2013 15:20:56 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Taimoor <taimoor.mrza@gmail.com>
References: <1376424027-26208-1-git-send-email-tmirza@codesourcery.com>
	<1376427925-26767-1-git-send-email-tmirza@codesourcery.com>
In-Reply-To: <1376427925-26767-1-git-send-email-tmirza@codesourcery.com>
X-Enigmail-Version: 1.5.2
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="acC4DUkJ8XmTUlhXR2rGar1XrLX8mF7f5"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Wed, 14 Aug 2013 02:49:15 -0400
Cc: qemu-trivial@nongnu.org, Taimoor Mirza <tmirza@codesourcery.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: Port redirection
 option behave differently on Linux and Windows
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
X-List-Received-Date: Tue, 13 Aug 2013 21:21:20 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--acC4DUkJ8XmTUlhXR2rGar1XrLX8mF7f5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 08/13/2013 03:05 PM, Taimoor wrote:
> From: Taimoor Mirza <tmirza@codesourcery.com>
>=20
> port redirection code uses SO_REUSEADDR socket option before binding to=

> host port. Behavior of SO_REUSEADDR is different on Windows and Linux.
> Relaunching QEMU with same host and guest port redirection values on Li=
nux
> throws error but on Windows it does not throw any error.
> Problem is discussed in http://lists.gnu.org/archive/html/qemu-devel/20=
13-04/msg03089.html

When resending a patch, please use a v2 in the subject line (git
send-email --subject-prefix PATCHv2), send as a top-level thread, and
include a changelog after the --- divider that explains what changed
from v1.  See http://wiki.qemu.org/Contribute/SubmitAPatch for more hints=
=2E

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--acC4DUkJ8XmTUlhXR2rGar1XrLX8mF7f5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJSCqM5AAoJEKeha0olJ0NqDacIAJF13YIb+h4Ng77fckZZmCV0
SUZq3xD4n5tS1aYkK9vzAyana7r6BPJDr+ffIGffI5G2a+l89t+biYLgPgHgIkV2
6sTUBlgHRfNd1RyqIIkGj+1ocDy+KRpoVo9TCdFQYNFwMIDcs0PTZ5X+AuAF7RZy
std0S8oqs3RNeW7fNpCpo+QmhXQINopbwUOCuT0iUT1JpFCmaN3sYN5gcvt0zAHS
lud52Lzl38r6/MMGDph0sDVjy0tj5Ni2Q8r7AwwvvNe38sW2xnHehZpuke8cy/PB
N1cbgk4nC0iq/1/AwLEnVCI48FeM0yUcqEzuTkr33GAxwcrxSujXN/6P/cMoxfQ=
=30eC
-----END PGP SIGNATURE-----

--acC4DUkJ8XmTUlhXR2rGar1XrLX8mF7f5--

