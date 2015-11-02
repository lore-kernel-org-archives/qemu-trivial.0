Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZtH3r-0003Ym-Cm
	for mharc-qemu-trivial@gnu.org; Mon, 02 Nov 2015 10:30:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZtH3o-0003Vo-Ql
	for qemu-trivial@nongnu.org; Mon, 02 Nov 2015 10:30:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZtH3k-00060w-Vu
	for qemu-trivial@nongnu.org; Mon, 02 Nov 2015 10:30:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55577)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ZtH3e-0005xj-VV; Mon, 02 Nov 2015 10:30:07 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 27735A3B41;
	Mon,  2 Nov 2015 15:30:06 +0000 (UTC)
Received: from [10.3.113.189] (ovpn-113-189.phx2.redhat.com [10.3.113.189])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA2FU5bc029067; Mon, 2 Nov 2015 10:30:05 -0500
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1446473857-11934-1-git-send-email-pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <5637817D.9000305@redhat.com>
Date: Mon, 2 Nov 2015 08:30:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1446473857-11934-1-git-send-email-pbonzini@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="GdhDXp8dvtpFfhIA2g4X5buNEC5PXqdQo"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pci-assign: do not test
 path with access() before opening
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
X-List-Received-Date: Mon, 02 Nov 2015 15:30:18 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GdhDXp8dvtpFfhIA2g4X5buNEC5PXqdQo
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/02/2015 07:17 AM, Paolo Bonzini wrote:
> Using access() is a time-of-check/time-of-use race condition.  It is
> okay to use them to provide better error messages, but that is pretty
> much it.
>=20
> In this case we can get the same error from fopen(), so just use
> strerror and errno there---which actually improves the error
> message most of the time.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/i386/pci-assign-load-rom.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--GdhDXp8dvtpFfhIA2g4X5buNEC5PXqdQo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWN4F9AAoJEKeha0olJ0Nqy8QIAKuFYwoDbZiNtuoV4FF2FmCT
6JCmkkuFgtE23GeADE2XUhzRbnhnjn8K8WetC8rBfYmdurWmpdwhZAUdvndo6p1g
JPoPW5wSc6wsAgd+A2cP3xdBcVtTHqVYTWlnXj2AJ/tkg96wVW4MTL9K+h7wuX8U
jUC3VyeZdUjoamAH/MHaGXiEyC8bM9fpSqPHpHLZNuhjdrrRIkP8FONlN/0Ojd2j
F5WjTJ5fE/61xz1tDYDqapJ3qq5WUN73ZGS+/GErW/J/UxZ4bp4kWE1zA4fV834L
AOpsPkaGlmpaLCoo9Jo1Nw5h0XIB6kHBhQ/d95aZx96N56a4dAAHCLXDL3l7JYU=
=gs6Q
-----END PGP SIGNATURE-----

--GdhDXp8dvtpFfhIA2g4X5buNEC5PXqdQo--

