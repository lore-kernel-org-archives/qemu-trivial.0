Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVM4Y-0000dl-GH
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 11:27:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YVM4W-0000dd-K8
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 11:27:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YVM4R-0006CE-M4
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 11:27:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37494)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YVM4R-0006C3-Ew; Tue, 10 Mar 2015 11:27:47 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2AFRkcG032049
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 10 Mar 2015 11:27:46 -0400
Received: from [10.3.113.79] (ovpn-113-79.phx2.redhat.com [10.3.113.79])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2AFRjwd027488; Tue, 10 Mar 2015 11:27:45 -0400
Message-ID: <54FF0D71.8050008@redhat.com>
Date: Tue, 10 Mar 2015 09:27:45 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1425990184-30913-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1425990184-30913-1-git-send-email-armbru@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Ghc2W12mLebTV3IAxw0hOsGVMmJTwNNSk"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hmp: Fix texinfo
	documentation
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
X-List-Received-Date: Tue, 10 Mar 2015 15:27:53 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Ghc2W12mLebTV3IAxw0hOsGVMmJTwNNSk
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/10/2015 06:23 AM, Markus Armbruster wrote:
> Several issues:
>=20
> * Commands i and o lack @item.  Their one-liner documentation gets
>   squashed into the preceding command print.  Add the obvious @item.
>=20
> * Commands i, o and cpu-add lack @findex.  The function index doesn't
>   have them.  Add the obvious @findex.
>=20
> * Commit 727f005 put block_set_io_throttle was added in the middle of
>   block_passwd.  Move it.
>=20
> * Correct spelling of commands chardev-add and chardev-remove in @item
>   and @findex.
>=20
> * Some commands have a blank line between @item/@findex and the text,
>   most don't.  Normalize to no blank line.
>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hmp-commands.hx | 41 +++++++++++++++--------------------------
>  1 file changed, 15 insertions(+), 26 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--Ghc2W12mLebTV3IAxw0hOsGVMmJTwNNSk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJU/w1xAAoJEKeha0olJ0NqvsUH/2hXYTN+wkXVuukCUdlx6TcV
AhagSdZkihDHQMYwaclFybJXVLHgYIVyef/hnkRR4dRk16pP9zc/rYb9m6kdt8CN
Xjt/sU8pJXEyzrm6925T5Wr3TtyHLhs6TkJrgEk9Z+MKpPoYMjpWz25TlrUebhFV
ULlzqPaiqQrigRWxyxmqj1qfOgzYMAHR72WNl2D15OcV22ByJnm9MmfRssiDMpfk
Ym1UAAGd8pC8hKE60jBSd3zVIzMC9qDth8JfwM8hOv4MQgtZrNIrP/Q/Dqx7O8WL
c4KtTpK32R7TOK3IPZF5chB+PrBVnxJ5xlteeRDVjg6kg/7oQbW50O/23yLfe58=
=yfu1
-----END PGP SIGNATURE-----

--Ghc2W12mLebTV3IAxw0hOsGVMmJTwNNSk--

