Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a6rU7-0001z9-V6
	for mharc-qemu-trivial@gnu.org; Wed, 09 Dec 2015 22:01:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1a6rU5-0001w7-AU
	for qemu-trivial@nongnu.org; Wed, 09 Dec 2015 22:01:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1a6rU4-0006Su-CN
	for qemu-trivial@nongnu.org; Wed, 09 Dec 2015 22:01:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34628)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1a6rU0-0006Rm-72; Wed, 09 Dec 2015 22:01:28 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id C3FC9C001274;
	Thu, 10 Dec 2015 03:01:26 +0000 (UTC)
Received: from [10.3.113.183] (ovpn-113-183.phx2.redhat.com [10.3.113.183])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBA31QpS031140; Wed, 9 Dec 2015 22:01:26 -0500
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <1449708466-13366-1-git-send-email-marcandre.lureau@redhat.com>
	<1449708466-13366-2-git-send-email-marcandre.lureau@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <5668EB05.7050008@redhat.com>
Date: Wed, 9 Dec 2015 20:01:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1449708466-13366-2-git-send-email-marcandre.lureau@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="nF85tfKNSEW1nopxlb0b7d1vcFVX5ogh3"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] configure: fix trace
	backend check
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
X-List-Received-Date: Thu, 10 Dec 2015 03:01:34 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nF85tfKNSEW1nopxlb0b7d1vcFVX5ogh3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/09/2015 05:47 PM, marcandre.lureau@redhat.com wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> Found thanks to shellcheck!
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/configure b/configure
> index 6a971a2..ba57b3f 100755
> --- a/configure
> +++ b/configure
> @@ -4816,7 +4816,7 @@ echo "libcap-ng support $cap_ng"
>  echo "vhost-net support $vhost_net"
>  echo "vhost-scsi support $vhost_scsi"
>  echo "Trace backends    $trace_backends"
> -if test "$trace_backend" =3D "simple"; then
> +if have_backend "simple"; then
>  echo "Trace output file $trace_file-<pid>"
>  fi
>  if test "$spice" =3D "yes"; then
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--nF85tfKNSEW1nopxlb0b7d1vcFVX5ogh3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWaOsFAAoJEKeha0olJ0NqNTMH/iSKfziGlFa93oBIw32CtqS1
xNJfJl0wAQS1lcOPDHGvtM6eDwkXYuNpW30sVHp3AReU9nHHfo1p5JsNnIim4d6k
MRYQ2DethczVhVdYkJvz5vQ4pjpJtqqF3wHIYy6Ofmt5sGi8DJFiZf82hHKLxGcE
StDBfAFdPX6L/EyUj1IeER5pNEPUltinIWM2WOlbsN3dz+5AtTcHfeNBPrV7NSTh
+z5VBPGzLKWvcEKVq9SHtNlgBr20alIpIVSroALCIsR4PvTalgA8YIu6ivLupq0f
hOQO61qwpWSARCkU2Yc8OeJnIYcNOszoX4PXvUHhjgmBKPTtJbkPaphqeyaaGto=
=BXhX
-----END PGP SIGNATURE-----

--nF85tfKNSEW1nopxlb0b7d1vcFVX5ogh3--

