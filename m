Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yb7UK-0008Qr-9m
	for mharc-qemu-trivial@gnu.org; Thu, 26 Mar 2015 09:06:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Yb7UE-0008J3-9M
	for qemu-trivial@nongnu.org; Thu, 26 Mar 2015 09:06:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Yb7U9-0001I4-Uc
	for qemu-trivial@nongnu.org; Thu, 26 Mar 2015 09:06:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47528)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Yb7U9-0001Hv-KY; Thu, 26 Mar 2015 09:06:09 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2QD65tG000744
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 26 Mar 2015 09:06:05 -0400
Received: from [10.3.113.15] ([10.3.113.15])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2QD6499010089; Thu, 26 Mar 2015 09:06:05 -0400
Message-ID: <5514043C.6050306@redhat.com>
Date: Thu, 26 Mar 2015 07:06:04 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1427374663-10168-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1427374663-10168-1-git-send-email-arei.gonglei@huawei.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="nUWHEjCg7P5DNuIp4Ji1BHdqQUKLBBscW"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] misc: fix typos in
	copyright declaration
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
X-List-Received-Date: Thu, 26 Mar 2015 13:06:18 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nUWHEjCg7P5DNuIp4Ji1BHdqQUKLBBscW
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/26/2015 06:57 AM, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
>=20
> Add a space after comma.
>=20
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  bootdevice.c              | 2 +-
>  tests/usb-hcd-ohci-test.c | 2 +-
>  tests/usb-hcd-uhci-test.c | 2 +-
>  tests/usb-hcd-xhci-test.c | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

Safe for 2.3 if desired, as it has no impact on code.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--nUWHEjCg7P5DNuIp4Ji1BHdqQUKLBBscW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVFAQ8AAoJEKeha0olJ0Nq6PoIAIHG4njBNinqreppz5wdZtq3
vpD0MBIucGvk4LSr3pw+5ZiX038o6CDIE18uUWyFMbMEfWGtV6/U139N/wJhJzhP
Ai61rPIZm/vXQz7ySzknwPdxnKDfEyaR4IJKb94rwfmP1QG9Fv/Ru6/tW1Kzo+iL
TCyr5sNXP2/F/hxgq0qJ9HiQ5egiJGMD6ZIk9raP9U0F1PvsPzRJf7aI6gHlF37Q
nDvZtqEEyXNNgEa9jJfH4N2ADZJfkPy6a+1Qj3chScO6qqm25gixDBL0ug+7khGm
Jc1/nDPqLAtpsWh2cJZMtw/miiW2bLSO5B9WWAfQ5j/aaWTFPPxRFPLovTGlDeQ=
=4oJA
-----END PGP SIGNATURE-----

--nUWHEjCg7P5DNuIp4Ji1BHdqQUKLBBscW--

