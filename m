Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xrbfd-0006Wy-OF
	for mharc-qemu-trivial@gnu.org; Thu, 20 Nov 2014 19:01:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XrbfY-0006Wc-9f
	for qemu-trivial@nongnu.org; Thu, 20 Nov 2014 19:01:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XrbfT-0001Va-Vt
	for qemu-trivial@nongnu.org; Thu, 20 Nov 2014 19:01:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43797)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1XrbfT-0001VS-Mx; Thu, 20 Nov 2014 19:01:43 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAL01dD9025173
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 20 Nov 2014 19:01:39 -0500
Received: from [10.3.113.50] (ovpn-113-50.phx2.redhat.com [10.3.113.50])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAL01cTM009233; Thu, 20 Nov 2014 19:01:39 -0500
Message-ID: <546E80E2.5040300@redhat.com>
Date: Thu, 20 Nov 2014 17:01:38 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1416473754-8660-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1416473754-8660-1-git-send-email-arei.gonglei@huawei.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="W6oSm7kUuTsoI4shu7TmpI2oW1EnjdBpv"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, mst@redhat.com
Subject: [Qemu-trivial] for 2.2: Re: [Qemu-devel] [PATCH] pcie: fix improper
 use of negative value
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
X-List-Received-Date: Fri, 21 Nov 2014 00:01:52 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--W6oSm7kUuTsoI4shu7TmpI2oW1EnjdBpv
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/20/2014 01:55 AM, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
>=20
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  hw/pci/pcie.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

adding qemu-trivial in cc.  This is a candidate for 2.2.

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index 58455bd..2902f7d 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -229,7 +229,7 @@ static void pcie_cap_slot_hotplug_common(PCIDevice =
*hotplug_dev,
>          /* the slot is electromechanically locked.
>           * This error is propagated up to qdev and then to HMP/QMP.
>           */
> -        error_setg_errno(errp, -EBUSY, "slot is electromechanically lo=
cked");
> +        error_setg_errno(errp, EBUSY, "slot is electromechanically loc=
ked");
>      }
>  }
> =20
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--W6oSm7kUuTsoI4shu7TmpI2oW1EnjdBpv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJUboDiAAoJEKeha0olJ0NqStcH/0VeufxvmS5k+NDqDncnbz3u
7F0WMliabx9qG0xZtdfzYm+E/cF0S6W3ooOfTcs1S+wPLBylvqMYDeXLF5xOnG5s
frUkyqQIdM90Z/eZ0n4a9FvHYJvbzv3Y5v7S0URD+20DGOesCKP6zLwdhNim/JIh
bXgX+Z9ZRu98hX379oS+Sh28hQYtiN5FXmzqRQ37/8xd76IUcZtgz52Ctdep0jgw
jHaBHIgsKPXyRXD9t0gGaZYFL5vayNoHJDuZNL7mDHre/kXUoAb8/uOH/CZ8DYK5
44IsNjFqGEvnJc5mDd2c3ZlMrvag2biHxXpR3PwvVNlrikGIzyCMVQLH3bYvhbE=
=TNqH
-----END PGP SIGNATURE-----

--W6oSm7kUuTsoI4shu7TmpI2oW1EnjdBpv--

