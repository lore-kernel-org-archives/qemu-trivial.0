Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xy0aD-0001I6-58
	for mharc-qemu-trivial@gnu.org; Mon, 08 Dec 2014 10:50:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Xy0a2-0001H9-UX
	for qemu-trivial@nongnu.org; Mon, 08 Dec 2014 10:50:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Xy0Zv-0003pX-Sn
	for qemu-trivial@nongnu.org; Mon, 08 Dec 2014 10:50:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44781)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Xy0Zv-0003of-KC; Mon, 08 Dec 2014 10:50:27 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB8FoCSp012855
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 8 Dec 2014 10:50:13 -0500
Received: from [10.3.113.52] (ovpn-113-52.phx2.redhat.com [10.3.113.52])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB8FoB3G001994; Mon, 8 Dec 2014 10:50:11 -0500
Message-ID: <5485C8B3.30608@redhat.com>
Date: Mon, 08 Dec 2014 08:50:11 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1418038820-9792-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1418038820-9792-1-git-send-email-arei.gonglei@huawei.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="bIQLhM7S9QwnnGScbwQjnIeHHTiMEor5q"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, zhang.zhanghailiang@huawei.com, armbru@redhat.com,
	lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] qapi-schema: fix typo about
	change-vnc-password
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
X-List-Received-Date: Mon, 08 Dec 2014 15:50:39 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bIQLhM7S9QwnnGScbwQjnIeHHTiMEor5q
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/08/2014 04:40 AM, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
>=20
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  qapi-schema.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/qapi-schema.json b/qapi-schema.json
> index 9ffdcf8..563b4ad 100644
> --- a/qapi-schema.json
> +++ b/qapi-schema.json
> @@ -1533,7 +1533,7 @@
>  #
>  # Change the VNC server password.
>  #
> -# @target:  the new password to use with VNC authentication
> +# @password:  the new password to use with VNC authentication
>  #
>  # Since: 1.1
>  #
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--bIQLhM7S9QwnnGScbwQjnIeHHTiMEor5q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJUhcizAAoJEKeha0olJ0Nq4bkH/Rh848UkQCuTKY3rQMWAXuBb
ZUFKUnCrJU28F6kHB+/Uj9CTW904RPVrGXfvbE47gkvMg2D7/ywLFDTSIt0RsZrW
i31hlqP9PiL9EaogxW/Kgtm9R8WqxFZeXRG0a3vjzh2fJjkr1N7xOPWpL4K54Ns3
nVUsfyMZeLIZc5OoZ8AjYeMOHos5iCIP3R7wbGgC8KdsvzT+sXmC+cmrVVFh72DS
W6Vv8w1r2FE3AtoUXQ9pNLrOVcWRSKYDinufz/oV8mu0AIWHmD0iXOwQp3QvRWEL
4Y0FfcxuJwkQEjv7VHWde4ahD8qbWHqX6Ov6jOvH/Nf8VR61qw+1MNWvEhCVDzA=
=swwP
-----END PGP SIGNATURE-----

--bIQLhM7S9QwnnGScbwQjnIeHHTiMEor5q--

