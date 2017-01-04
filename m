Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cOp0s-0004RY-Jt
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jan 2017 12:06:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51634)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cOp0n-0004Os-Fc
	for qemu-trivial@nongnu.org; Wed, 04 Jan 2017 12:06:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cOp0h-00030r-SJ
	for qemu-trivial@nongnu.org; Wed, 04 Jan 2017 12:06:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52838)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cOp0c-0002yS-3d; Wed, 04 Jan 2017 12:05:54 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1527B61B9B;
	Wed,  4 Jan 2017 17:05:54 +0000 (UTC)
Received: from [10.10.117.58] (ovpn-117-58.rdu2.redhat.com [10.10.117.58])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v04H5rBb027938; Wed, 4 Jan 2017 12:05:53 -0500
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20170104150525.4246-1-pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <dfd6fda1-a6a1-8001-2e69-6890ab7948c5@redhat.com>
Date: Wed, 4 Jan 2017 11:05:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170104150525.4246-1-pbonzini@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Me86KTIEkUtse54tOFBp1K87beHEgv6PP"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 04 Jan 2017 17:05:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pci-assign: avoid pointless
 stat
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jan 2017 17:06:09 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Me86KTIEkUtse54tOFBp1K87beHEgv6PP
Content-Type: multipart/mixed; boundary="HsBolxLW6AX2afII2MIvGSfHE8g83tDRx";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Message-ID: <dfd6fda1-a6a1-8001-2e69-6890ab7948c5@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] pci-assign: avoid pointless stat
References: <20170104150525.4246-1-pbonzini@redhat.com>
In-Reply-To: <20170104150525.4246-1-pbonzini@redhat.com>

--HsBolxLW6AX2afII2MIvGSfHE8g83tDRx
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01/04/2017 09:05 AM, Paolo Bonzini wrote:
> Just check the errno value after fopen and follow it with fstat.
> This shuts up Coverity's complaint about TOC/TOU violation.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/i386/pci-assign-load-rom.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/hw/i386/pci-assign-load-rom.c b/hw/i386/pci-assign-load-ro=
m.c
> index 0d8e4b2..fd59076 100644
> --- a/hw/i386/pci-assign-load-rom.c
> +++ b/hw/i386/pci-assign-load-rom.c
> @@ -39,19 +39,19 @@ void *pci_assign_dev_load_option_rom(PCIDevice *dev=
, struct Object *owner,
>               "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/rom",
>               domain, bus, slot, function);
> =20
> -    if (stat(rom_file, &st)) {
> -        if (errno !=3D ENOENT) {
> -            error_report("pci-assign: Invalid ROM.");
> -        }
> -        return NULL;
> -    }
> -
>      /* Write "1" to the ROM file to enable it */
>      fp =3D fopen(rom_file, "r+");
>      if (fp =3D=3D NULL) {
> -        error_report("pci-assign: Cannot open %s: %s", rom_file, strer=
ror(errno));
> +        if (errno !=3D ENOENT) {
> +            error_report("pci-assign: Cannot open %s: %s", rom_file, s=
trerror(errno));
> +        }
>          return NULL;
>      }
> +    if (fstat(fileno(fp), &st) =3D=3D -1) {
> +        error_report("pci-assign: Cannot stat %s: %s", rom_file, strer=
ror(errno));
> +        goto close_rom;

fstat() failure after fopen() success is quite unlikely, but I suppose
it is still possible in some weird situations.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--HsBolxLW6AX2afII2MIvGSfHE8g83tDRx--

--Me86KTIEkUtse54tOFBp1K87beHEgv6PP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYbStvAAoJEKeha0olJ0Nqo4gH/05gm6A7E/WWzU67pz5SpSPG
zw/KfNw9+FJvL1unQC7SUstF2/cdKF5RNdWodWRebFy2x8fycFhDuceLFxhbTwdR
cqqMBhxx5DNYGqTVVVB+x6fko8TO7OTWq4s+mm+UobpnnpG5A5eMNRM15kSh72ZV
l8QPn2AWBZ42xKncZe8cvn+IHRVi2RL0AdCa5uASorx75b+UJ1a2kNHtoX02J1lL
ssMGstEcsXVQYExLb5jri8CWeiij0emdC9mkb8xwgM+YOVi8O6woyFF0BH5ACZCL
5UERRYMmJRVoBQrzuLoSM2d2H6jB85tP2MWlCuwxPPCqjSX6iU9xjhcgOrZ44SY=
=bGeN
-----END PGP SIGNATURE-----

--Me86KTIEkUtse54tOFBp1K87beHEgv6PP--

