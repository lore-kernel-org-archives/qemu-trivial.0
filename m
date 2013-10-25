Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VZa21-0000tw-RC
	for mharc-qemu-trivial@gnu.org; Fri, 25 Oct 2013 01:33:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1VZa1w-0000nP-BV
	for qemu-trivial@nongnu.org; Fri, 25 Oct 2013 01:33:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1VZa1s-0006fq-47
	for qemu-trivial@nongnu.org; Fri, 25 Oct 2013 01:33:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:5885)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1VZa1j-0006dd-Av; Fri, 25 Oct 2013 01:33:39 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9P5XZDO002978
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 25 Oct 2013 01:33:35 -0400
Received: from [10.3.113.77] (ovpn-113-77.phx2.redhat.com [10.3.113.77])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r9P5XXjt011865; Fri, 25 Oct 2013 01:33:34 -0400
Message-ID: <526A02AD.3080903@redhat.com>
Date: Fri, 25 Oct 2013 06:33:33 +0100
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Weng Fan <wengfan-fnst@cn.fujitsu.com>,
	"Qemu-devel@nongnu.org" <Qemu-devel@nongnu.org>,
	qemu-trivial <qemu-trivial@nongnu.org>
References: <5269E751.8090107@cn.fujitsu.com>
In-Reply-To: <5269E751.8090107@cn.fujitsu.com>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="fgQTUv2KKh2wlJVbFGFqPlKlSWWRJjGA7"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/1] docs/ccid.txt: fix the
	typo
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
X-List-Received-Date: Fri, 25 Oct 2013 05:33:56 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fgQTUv2KKh2wlJVbFGFqPlKlSWWRJjGA7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

[adding qemu-trivial]

On 10/25/2013 04:36 AM, Weng Fan wrote:
> From: WengFan <wengfan-fnst@cn.fujitsu.com>
> Date: Wed, 25 Oct 2013 11:18:22 -0400
> Subject: [PATCH 1/1] fix the typo
>=20
> Signed-off-by: WengFan <wengfan-fnst@cn.fujitsu.com>
> ---
>  qemu-master/docs/ccid.txt |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/qemu-master/docs/ccid.txt b/qemu-master/docs/ccid.txt
> index 8bbaa94..83c174d 100644
> --- a/qemu-master/docs/ccid.txt
> +++ b/qemu-master/docs/ccid.txt
> @@ -52,7 +52,7 @@ Configuring and building:
>  Assuming you have a working smartcard on the host with the current
>  user, using NSS, qemu acts as another NSS client using ccid-card-emula=
ted:
>=20
> -    qemu -usb -device usb-ccid -device ccid-card-emualated
> +    qemu -usb -device usb-ccid -device ccid-card-emulated
>=20
>  4. Using ccid-card-emulated with certificates
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--fgQTUv2KKh2wlJVbFGFqPlKlSWWRJjGA7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJSagKtAAoJEKeha0olJ0NqdiAIAIzWvGCpQmCh8ykUCi4IPfAN
7p91CecjglmEl2h7WMpRJolayz905cADEMXwJgi4rZJq21S+Fr0lzxDQiUbemHco
mrh8ubYORJikIY2SkyV73QyOkUbUpp0CAz6anUIDlNf3OHTokYKeScR5OsVNMhuL
eHOyBt2YkFXgkJbM4CEHTupE/WF13SqpGJANDqfe7EQdBLwyHjBGYlTInDI9iMEt
00fk113DGQGLxVx+4hnqNvBD/9MDhcB+CjYDg9b4ZffoHIpz4mYLNEq7aypGat2k
eC++oKi3trq9l2BqFHHZZFrVGHpFeRVcoE2uoCldhjQ6xcnfZ0fy1D/pY5WUaF4=
=GVQX
-----END PGP SIGNATURE-----

--fgQTUv2KKh2wlJVbFGFqPlKlSWWRJjGA7--

