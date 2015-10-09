Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkiTa-0006Ct-0F
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 20:57:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Zkd6a-0002Xh-Ns
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 15:13:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Zkd6Z-0002lq-Mf
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 15:13:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57028)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Zkd6U-0002cI-N9; Fri, 09 Oct 2015 15:13:19 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 48F6D3C221;
	Fri,  9 Oct 2015 19:13:18 +0000 (UTC)
Received: from [10.3.113.202] (ovpn-113-202.phx2.redhat.com [10.3.113.202])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t99JDH8e026773; Fri, 9 Oct 2015 15:13:17 -0400
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1444406198-6521-1-git-send-email-thuth@redhat.com>
	<1444406198-6521-3-git-send-email-thuth@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <561811CD.5030007@redhat.com>
Date: Fri, 9 Oct 2015 13:13:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1444406198-6521-3-git-send-email-thuth@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="6Att95fX23a1VhWkntOG16IpRmrCbFv3v"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 2/4] hw/input/tsc210x:
 Remove superfluous memset
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
X-List-Received-Date: Fri, 09 Oct 2015 19:13:25 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6Att95fX23a1VhWkntOG16IpRmrCbFv3v
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/09/2015 09:56 AM, Thomas Huth wrote:
> g_malloc0 already clears the memory, so no need for additional
> memsets here. And while we're at it, let's also remove the
> superfluous typecasts for the return values of g_malloc0
> and use the type-safe g_new0 instead.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/input/tsc210x.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--6Att95fX23a1VhWkntOG16IpRmrCbFv3v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWGBHNAAoJEKeha0olJ0Nq+sAH/Ry5pVl99jmcuVo6heioi/Hp
mi2Lwf2LeGzaPFaDHvLD+we5vls/YAg64A6sF3Bt9Xclfly8ET/1pBM50FbZZbed
PBDRUykVIlYYHQ1wjTKSAPM0OWe/pjgAx2GLaI4xFoVeTr0miC8RFs0kTwpag/bH
sZlpmWU4zN/jAlIZT4LD8xNgd4wxmbbB/bJV6ovAX8q2m6+/2T7+plgR/lYd9kwL
ZmeWNrcLDH/MoVrtiqyGnQMw7cCMwLDTESG3CdlvF+FVNpRlZfllovzyoHRfy6gq
GJf9jyQ6TRS3MGZ0nu2wNFQgBCcAGJJ4xENNji/2aItDmEPMxDDn0WjGIpDV1uk=
=9HNj
-----END PGP SIGNATURE-----

--6Att95fX23a1VhWkntOG16IpRmrCbFv3v--

