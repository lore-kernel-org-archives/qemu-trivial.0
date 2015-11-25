Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a1hIP-00076b-RF
	for mharc-qemu-trivial@gnu.org; Wed, 25 Nov 2015 16:08:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1a1hIK-00070J-Pt
	for qemu-trivial@nongnu.org; Wed, 25 Nov 2015 16:08:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1a1hIJ-00054e-Vp
	for qemu-trivial@nongnu.org; Wed, 25 Nov 2015 16:08:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38604)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1a1hIF-000545-NF; Wed, 25 Nov 2015 16:07:59 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 3DDECC07566B;
	Wed, 25 Nov 2015 21:07:59 +0000 (UTC)
Received: from [10.3.113.138] (ovpn-113-138.phx2.redhat.com [10.3.113.138])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAPL7wPQ023270; Wed, 25 Nov 2015 16:07:58 -0500
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <1448485417-8196-1-git-send-email-jsnow@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <56562329.5040109@redhat.com>
Date: Wed, 25 Nov 2015 14:07:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1448485417-8196-1-git-send-email-jsnow@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="8orhtRoIsGxlSbvlh3L0vJJVLrUfv2w86"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, jcody@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] util/id: fully allocate
	names table
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
X-List-Received-Date: Wed, 25 Nov 2015 21:08:08 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8orhtRoIsGxlSbvlh3L0vJJVLrUfv2w86
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/25/2015 02:03 PM, John Snow wrote:
> Trivial: this array should be allocated to have ID_MAX entries always.
> Otherwise if someone were to forget to expand this table, the assertion=

> in the id generator won't actually trigger; it will read junk data.
>=20
> v2: Fix the range assertion, too. Compare against the known actual size=

>     of the table instead of what it "should" be.

The v2 blurb would normally appear after the ---; it can be removed by
the maintainer.

>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  util/id.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--8orhtRoIsGxlSbvlh3L0vJJVLrUfv2w86
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWViMpAAoJEKeha0olJ0NqQIcH/3ahFRDkk6yVwJPgLY/AImvg
sWncjvAAIpjinYzW+QUcudIo1QK8Dy/hh+bNMqoUuPDpeaOB0DjL5+PNSXY1LEEt
2bxa01bZQpl1XIjbbMfl1oyVkCJlNLjdHYkeRVPZclxfQEDFfp/VItrBlxGIW2xz
GSsZPaIo7kzjE+KKODaC/z1UIvOEl0i3OqLHYHmG+WDlb3FrQDIv0StA3uW5A3x2
wJBuNTnPmsIX496RLrA+Tc7kvfBGKUeQNstdgVzJePfDv62cPKC7YMJnCZIJNAWw
xcwd0VY/yo/HFthTyQBHC8O7aYwE/n0/oJfzluMHEKTRXwFXWSgixVmBifgktOQ=
=w9DS
-----END PGP SIGNATURE-----

--8orhtRoIsGxlSbvlh3L0vJJVLrUfv2w86--

