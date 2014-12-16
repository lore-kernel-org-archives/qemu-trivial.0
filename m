Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y0nNX-000710-Ut
	for mharc-qemu-trivial@gnu.org; Tue, 16 Dec 2014 03:21:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53439)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Y0nNR-0006zw-9D
	for qemu-trivial@nongnu.org; Tue, 16 Dec 2014 03:21:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Y0nNM-0000iX-AG
	for qemu-trivial@nongnu.org; Tue, 16 Dec 2014 03:21:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52742)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Y0nNM-0000i1-1M; Tue, 16 Dec 2014 03:21:00 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sBG8Kx27023895
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 16 Dec 2014 03:20:59 -0500
Received: from [10.3.113.193] (ovpn-113-193.phx2.redhat.com [10.3.113.193])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sBG8KPIQ006457; Tue, 16 Dec 2014 03:20:36 -0500
Message-ID: <548FEB22.2050506@redhat.com>
Date: Tue, 16 Dec 2014 01:19:46 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <1418694024-26498-1-git-send-email-famz@redhat.com>
In-Reply-To: <1418694024-26498-1-git-send-email-famz@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="lq8QO4lP4dFJco5OTpx5mK9KPkQJbj9pV"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] qapi: Fix document for
	BlockStats.node-name
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
X-List-Received-Date: Tue, 16 Dec 2014 08:21:10 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lq8QO4lP4dFJco5OTpx5mK9KPkQJbj9pV
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

[adding qemu-trivial in cc]

On 12/15/2014 06:40 PM, Fam Zheng wrote:
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  qapi/block-core.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 6e8db15..2d8bd25 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -423,7 +423,7 @@
>  # @device: #optional If the stats are for a virtual block device, the =
name
>  #          corresponding to the virtual block device.
>  #
> -# @device: #optional The node name of the device. (Since 2.3)
> +# @node-name: #optional The node name of the device. (Since 2.3)
>  #
>  # @stats:  A @BlockDeviceStats for the device.
>  #
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--lq8QO4lP4dFJco5OTpx5mK9KPkQJbj9pV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJUj+syAAoJEKeha0olJ0Nq6rkIAJR90KvotK97H0S3MDrbb++X
12hxvn0uL5KnHIOD22Tfnr8WG6Ts69e+/cXWcN4d2cxu7bWPvY5Df0uuSkR3Q7Ub
RtsfeMr6wiDIuNimnkZg4Y4oFUb4DRNGTUfGcEoLyRTX2JJU+CfRajmD9Dyvqq8s
KWCCBhqcqUhiQT21eGA7R02Iem9FUcOE/69uXZWjsRcMfh+BuESc3qxBmnILzzTS
4Q0PQvl/SEBxkSpnFA0bIs9zyW4sstHN7jWdE0y5zi2wjgNJUol65fRwnnKD4N0T
vSWpjdcsXaaPFz4LsAacwx8/eGN15zBU1e7DM9w7MUKR9yeGzr6TfYe4wEot264=
=/fYO
-----END PGP SIGNATURE-----

--lq8QO4lP4dFJco5OTpx5mK9KPkQJbj9pV--

