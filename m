Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfUtK-0000N0-Al
	for mharc-qemu-trivial@gnu.org; Fri, 25 Sep 2015 11:26:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZfUtI-0000KH-4X
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 11:26:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZfUtH-0000Va-8B
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 11:26:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51573)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ZfUtC-0000UF-Ry; Fri, 25 Sep 2015 11:26:22 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 9014AC0B918B;
	Fri, 25 Sep 2015 15:26:22 +0000 (UTC)
Received: from [10.3.113.141] (ovpn-113-141.phx2.redhat.com [10.3.113.141])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8PFQLFG032536; Fri, 25 Sep 2015 11:26:22 -0400
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <1443189844-20341-1-git-send-email-marcandre.lureau@redhat.com>
	<1443189844-20341-8-git-send-email-marcandre.lureau@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <5605679D.4070207@redhat.com>
Date: Fri, 25 Sep 2015 09:26:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1443189844-20341-8-git-send-email-marcandre.lureau@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="q0M23f0MQBEcLPw2hH88VmPkg05pwXu0G"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 07/36] qapi: add some headings in docs
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
X-List-Received-Date: Fri, 25 Sep 2015 15:26:29 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--q0M23f0MQBEcLPw2hH88VmPkg05pwXu0G
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/25/2015 08:03 AM, marcandre.lureau@redhat.com wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> Add some missing double-#, the doc parser can't easily distinguish doc
> comments from comments to be ignored otherwise.
>=20
> Also add some more section headings.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---

Adding qemu-trivial; this can (mostly) be taken without waiting for
pending qapi patches, as it is a consistency cleanup.

> +++ b/qapi-schema.json
> @@ -67,6 +67,9 @@
>  { 'include': 'qapi/introspect.json' }
> =20
>  ##
> +# =3D QMP commands
> +
> +##
>  # @qmp_capabilities:

well, except that you'd want to rebase the cleanups in this patch to
occur before your other patches which are NOT trivial (while I'm in
favor of documenting qmp_capabilities in qapi-schema.json, that one is
not a trivial patch)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--q0M23f0MQBEcLPw2hH88VmPkg05pwXu0G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWBWedAAoJEKeha0olJ0NqIsUH/jw+80Cmq2k6dHLydQP5PoHv
QM6aLNJx0m6EmcU826fLz+8ltqQ9RR+bTCzvFhAXqQlRYbGdW2xE08e0HWzv1EFr
U5zTgfjcCWtzZTXDphU9cw1KbPlQ9/rhzy5tFv+ET4PmdETcZd4Pf26o2TL4w9ol
AJnFZVQ96Vuzn0Ppd/RlbVezvPZkOHpQrONG0WzQErfOffkRMaTaZqyX9+3oQD1s
YPPnUppePyDKpHEq7ME7VrqV3e8qq6WtLRN32PwRlZ2pNO+muahbM9NBdWMmptml
Ox/W2x3jA36ANtNE4WDB0jSDkDi3CIf/uBd6iTm/bU8QsrWSQK93Y21ZX4QMiDE=
=W+KU
-----END PGP SIGNATURE-----

--q0M23f0MQBEcLPw2hH88VmPkg05pwXu0G--

