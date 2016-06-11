Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bBpj2-0005r2-1P
	for mharc-qemu-trivial@gnu.org; Sat, 11 Jun 2016 16:41:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bBpiz-0005pe-AL
	for qemu-trivial@nongnu.org; Sat, 11 Jun 2016 16:41:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bBpiy-0005TT-8Q
	for qemu-trivial@nongnu.org; Sat, 11 Jun 2016 16:41:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52360)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bBpit-0005Si-Mj; Sat, 11 Jun 2016 16:41:39 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DCA4885A00;
	Sat, 11 Jun 2016 20:41:38 +0000 (UTC)
Received: from [10.3.116.47] (ovpn-116-47.phx2.redhat.com [10.3.116.47])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5BKfJpL001132; Sat, 11 Jun 2016 16:41:21 -0400
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1465575021-3774-1-git-send-email-peter.maydell@linaro.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>, patches@linaro.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <575C7765.6050806@redhat.com>
Date: Sat, 11 Jun 2016 14:41:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1465575021-3774-1-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="gVIGV6GpvhXiqdgGGvjAGd5smCmHcSWT0"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Sat, 11 Jun 2016 20:41:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/sh4/sh_pci.c: Use
 ldl_le_p() and stl_le_p()
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
X-List-Received-Date: Sat, 11 Jun 2016 20:41:46 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gVIGV6GpvhXiqdgGGvjAGd5smCmHcSWT0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/10/2016 10:10 AM, Peter Maydell wrote:
> Use ldl_le_p() and stl_le_p() instead of le32_to_cpup() and
> cpu_to_le32w(); the former handle misaligned addresses and don't
> need casts, and the latter are deprecated.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/sh4/sh_pci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--gVIGV6GpvhXiqdgGGvjAGd5smCmHcSWT0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXXHdlAAoJEKeha0olJ0Nq/OYH/2yDKZzzd1YcfcQgn2PezXKl
wnv2DJ4Q/O3RoQbloPtm+aHwy5khSzc5tjmM7f2s5YsJwJ3Omx5K7Iw5wJ9wr8l2
4M2Tbe5fpxOqYTvZXndTI72m+HVwuh1c6jfKAsn1UFMghCAHiwwbXi4ovfsdrS5i
6Ab9cSMKCml7q45jd5wqyN16KXrY2uhAfbfPlPhmBY459UUba7LJz6BQcoTbdjMu
WIkihlDCeRLtz3rctxRRQkyqxWTzsLsVqoxiLnwtXSEYclpwYNX9Dw8xyJjBDKYS
hnYmATNu3g9vQCVLU5a7frp7JV1OzHb52T2GQYKDXXSTzAhoKfM7FuFx+QLJoTc=
=+7wZ
-----END PGP SIGNATURE-----

--gVIGV6GpvhXiqdgGGvjAGd5smCmHcSWT0--

