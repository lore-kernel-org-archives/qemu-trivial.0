Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yt0L2-0003Ex-1Q
	for mharc-qemu-trivial@gnu.org; Thu, 14 May 2015 17:06:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60289)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Yt0Kz-00036x-BC
	for qemu-trivial@nongnu.org; Thu, 14 May 2015 17:06:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Yt0Ky-0006su-8u
	for qemu-trivial@nongnu.org; Thu, 14 May 2015 17:06:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34241)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Yt0Kt-0006r2-KZ; Thu, 14 May 2015 17:06:31 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t4EL6T8A015481
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 14 May 2015 17:06:29 -0400
Received: from [10.3.113.69] (ovpn-113-69.phx2.redhat.com [10.3.113.69])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4EL6Som018763; Thu, 14 May 2015 17:06:29 -0400
Message-ID: <55550E54.2080405@redhat.com>
Date: Thu, 14 May 2015 15:06:28 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1431635892-31996-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1431635892-31996-1-git-send-email-sw@weilnetz.de>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="XAqw65qs5CKlKHCddCCIXkrrgpDt2OFFJ"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pci: Fix compiler warning
 (MinGW-w64 gcc 4.9)
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
X-List-Received-Date: Thu, 14 May 2015 21:06:38 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XAqw65qs5CKlKHCddCCIXkrrgpDt2OFFJ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/14/2015 02:38 PM, Stefan Weil wrote:
> i686-w64-mingw32-gcc 4.9.1 from Debian Jessie complains:
>=20
> hw/pci/pci.c:938:29: warning:
>  array subscript is above array bounds [-Warray-bounds]
>=20
> Using g_assert instead of assert fixes this warning.

Is that because the mingw headers don't properly mark the expansion of
the failed branch of assert() as noreturn, whereas g_assert() does, and
therefore the compiler has more information about what variables must be
if the rest of the function is reached?

>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/pci/pci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 48f19a3..34f71dc 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -927,8 +927,8 @@ void pci_register_bar(PCIDevice *pci_dev, int regio=
n_num,
>      uint64_t wmask;
>      pcibus_t size =3D memory_region_size(memory);
> =20
> -    assert(region_num >=3D 0);
> -    assert(region_num < PCI_NUM_REGIONS);
> +    g_assert(region_num >=3D 0);
> +    g_assert(region_num < PCI_NUM_REGIONS);

I must say, this is the strangest way I've ever heard of silencing a
compiler warning.  But if it works and my uneducated guess above about
why is correct,

Reviewed-by: Eric Blake <eblake@redhat.com>

Meanwhile, you may want to file a bug to the mingw maintainers that
their header is puny when compared to glibc assert() or to glib's
g_assert, when it comes to giving gcc decent hints.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--XAqw65qs5CKlKHCddCCIXkrrgpDt2OFFJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVVQ5UAAoJEKeha0olJ0NqqJEH/jwG+uLfk03nTFSKRSHsgw0W
d2ZNuMzUCIHqSyiu4vcA/5M5wKST3BH4yPOvKutsfuK3JvApiR1TTSIj6FBhXe+b
2L0AinHvntWt9LORHpd23CQN9veWVKGmsVotB5v2r8f/89aSNnSvlJhpMnP32cxo
DTfTeNpbIm0kY7LmW4xnQoKUtmOVHp95BELJePi25o1xUIrhP0Mhd04dp1LatVpP
G/5qa+hYpKLyhW4bQt2NUD94zekFst1gcKFXUI5Y97Lr316pa/sBdRcMO5Gi8S53
InYujOdXTf/yDEDwVfBxJm+Ow0YAbUgu56GVJdWfVr47KNw0mYVNiEiTeXYko5A=
=3pJb
-----END PGP SIGNATURE-----

--XAqw65qs5CKlKHCddCCIXkrrgpDt2OFFJ--

