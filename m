Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tyjhs-00030A-76
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2013 08:52:36 -0500
Received: from eggs.gnu.org ([208.118.235.92]:57705)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Tyjhk-0002gx-6F
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 08:52:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Tyjhd-0006QM-SD
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 08:52:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:62680)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1TyjhM-0006N2-Vm; Fri, 25 Jan 2013 08:52:05 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0PDq4Dm006244
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 25 Jan 2013 08:52:04 -0500
Received: from [10.3.113.27] (ovpn-113-27.phx2.redhat.com [10.3.113.27])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0PDq3Pl031973; Fri, 25 Jan 2013 08:52:03 -0500
Message-ID: <51028E03.7040001@redhat.com>
Date: Fri, 25 Jan 2013 06:52:03 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Michal Privoznik <mprivozn@redhat.com>
References: <ef9bb01f7a2cd566bcdc10f19dc0881818754c4e.1359120428.git.mprivozn@redhat.com>
In-Reply-To: <ef9bb01f7a2cd566bcdc10f19dc0881818754c4e.1359120428.git.mprivozn@redhat.com>
X-Enigmail-Version: 1.5.0
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="----enig2SDLGXRVXNVACPOMOSITP"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qmp-commands.hx:
 s/tray-open/tray_open/ to match qapi schema
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
X-List-Received-Date: Fri, 25 Jan 2013 13:52:33 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2SDLGXRVXNVACPOMOSITP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 01/25/2013 06:27 AM, Michal Privoznik wrote:
> Currently, we are using 'tray_open' in QMP and 'tray-open' in
> HMP. However, the QMP documentation was mistakenly using the
> HMP version.
> ---
>  qmp-commands.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/qmp-commands.hx b/qmp-commands.hx
> index cbf1280..870ee54 100644
> --- a/qmp-commands.hx
> +++ b/qmp-commands.hx
> @@ -1585,7 +1585,7 @@ Each json-object contain the following:
>           - Possible values: "unknown"
>  - "removable": true if the device is removable, false otherwise (json-=
bool)
>  - "locked": true if the device is locked, false otherwise (json-bool)
> -- "tray-open": only present if removable, true if the device has a tra=
y,
> +- "tray_open": only present if removable, true if the device has a tra=
y,
>                 and it is open (json-bool)
>  - "inserted": only present if the device is inserted, it is a json-obj=
ect
>     containing the following:
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


------enig2SDLGXRVXNVACPOMOSITP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJRAo4DAAoJEKeha0olJ0NqGDsIAK1JLJBRZusiSFlkoa/a+LGT
gYpMULMvm8AmY+2x3mZDG4gWZiIWmlWBrXpdulJ2TbNmLhMtBLfsskqPHMY4MGM0
uPaUsfR/bCFyQXdA1q58UsrQzcyj0p6LNdsRthXduM4kxZcUNlgRW7LU9kN2Wv3k
+1yd4J8YWtKzuCpdboHUzWFrhemu/uqJqkEoC5Jdmh5p8mYJyRT4k2o/UDqEWw5J
VBzuE71TlkWtcw+6SNf3nflut5OEUw402P6BbiqLQ/yD/fYszRu+7yKA8joOQPfD
a7UXUwgEqp3DClrDWIsQqz2PD1KXX2MAa3fgU+bY8ZMgLOW52QTp9t7v1S21Qt8=
=g2zc
-----END PGP SIGNATURE-----

------enig2SDLGXRVXNVACPOMOSITP--

