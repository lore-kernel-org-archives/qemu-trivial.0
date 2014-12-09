Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XyMpZ-0006lW-7e
	for mharc-qemu-trivial@gnu.org; Tue, 09 Dec 2014 10:36:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XyMpT-0006ep-Do
	for qemu-trivial@nongnu.org; Tue, 09 Dec 2014 10:36:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XyMpP-00037R-2G
	for qemu-trivial@nongnu.org; Tue, 09 Dec 2014 10:35:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54246)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1XyMpF-00035m-6T; Tue, 09 Dec 2014 10:35:45 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB9FZ6dK014945
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 9 Dec 2014 10:35:07 -0500
Received: from [10.3.113.52] (ovpn-113-52.phx2.redhat.com [10.3.113.52])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB9FZ50t011606; Tue, 9 Dec 2014 10:35:05 -0500
Message-ID: <548716A9.3040009@redhat.com>
Date: Tue, 09 Dec 2014 08:35:05 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-trivial@nongnu.org
References: <1418107117-9892-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1418107117-9892-1-git-send-email-zhang.zhanghailiang@huawei.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="lWK8iKIidCsHt4KoLQbpHk7KX5o35oaJb"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: lcapitulino@redhat.com, peter.huangpeng@huawei.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qmp-command.hx: add missing
 docs for migration capabilites
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
X-List-Received-Date: Tue, 09 Dec 2014 15:36:03 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lWK8iKIidCsHt4KoLQbpHk7KX5o35oaJb
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/08/2014 11:38 PM, zhanghailiang wrote:
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  qmp-commands.hx | 6 ++++++
>  1 file changed, 6 insertions(+)


>  - "xbzrle": XBZRLE support
> +- "rdma-pin-all": pin all pages when use of RDMA during migration

s/use of/using/

With the grammar fix,
Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--lWK8iKIidCsHt4KoLQbpHk7KX5o35oaJb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJUhxapAAoJEKeha0olJ0Nq+c8H/1+o7WF4687LyaM9ES2Uc6lY
1EcRHNMm+0/ZihwwWesAO4E3+JBpoUGSSVGJnonU6GscAo3Pe/e3yuTAvGcutx/X
Frjay5m/1d7ShcWeVyarZiQ2CYG+qXK3jItjVKdeboVgrt65Tuk+K9QiZ8Ny/imH
X7mKNqdzg9oQvztw/+MTJ/duZLZq7f9Qoaekb46tBAMtROgeexlOpq5uN9deaTXS
bJltdw7QrMuHUcjztCcEU5wT1IiscuuBxN6E8Vk7pU5U0OHqWfMGDTjGIB8gESpq
VsLWHe+Hfhr3F5733y3wUoSzbJGHuiZ+BSSVRHwP/48DdhofcLweXrkjwrbw1H8=
=vx85
-----END PGP SIGNATURE-----

--lWK8iKIidCsHt4KoLQbpHk7KX5o35oaJb--

