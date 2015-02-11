Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLXZ5-0007HU-8d
	for mharc-qemu-trivial@gnu.org; Wed, 11 Feb 2015 08:42:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51517)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YLXZ2-0007HE-Kh
	for qemu-trivial@nongnu.org; Wed, 11 Feb 2015 08:42:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YLXZ0-0004Au-IX
	for qemu-trivial@nongnu.org; Wed, 11 Feb 2015 08:42:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46318)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YLXZ0-0004Ad-9U; Wed, 11 Feb 2015 08:42:46 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1BDgiZ6020920
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 11 Feb 2015 08:42:45 -0500
Received: from [10.3.113.9] ([10.3.113.9])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1BDgiTd029221; Wed, 11 Feb 2015 08:42:44 -0500
Message-ID: <54DB5C53.1070601@redhat.com>
Date: Wed, 11 Feb 2015 06:42:43 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1423654243-20992-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1423654243-20992-1-git-send-email-pbonzini@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Rj8o6m6NXfJNPrxr9QhI2ETqlcCX34G4W"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] cutils: refine strtol error
 handling in parse_debug_env
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
X-List-Received-Date: Wed, 11 Feb 2015 13:42:49 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Rj8o6m6NXfJNPrxr9QhI2ETqlcCX34G4W
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/11/2015 04:30 AM, Paolo Bonzini wrote:
> Avoid truncation of a 64-bit long to a 32-bit int, and check for errno
> (especially ERANGE).
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
> 	v1->v2: clear errno before strtol
> ---
>  util/cutils.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--Rj8o6m6NXfJNPrxr9QhI2ETqlcCX34G4W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJU21xTAAoJEKeha0olJ0NqLHsIAIeRq/t6RYAii29+1eTEswv0
8XDi6o0wAGgq+j05ZO0NUqo/VUU3ZLu5cavJlqveC4E3NkrjJXClesm+sLQg5ChW
iOSzbLOD8Jo6WPcpiteB4iuHX2RrZRXxf4+9VAEtvA4OI0vfHrzMe09aJ7XMixv2
5Bx08YoAYdeq6jyraYqTmre/YHvKSNpj1VmMNFBmjT+9vjGCXRooWCp2ibemc8NQ
JZNJ0ZkIDRREIXNAbqcn6Pyj/TCtG6HQ5QulzShvetrzcLaLHvrAZy3Ggx3+MK1K
p27f0fNDs/KkL537V/c0EE6OaeqhGJifZq4DUkwZ/7+aicA1BHyktOqYN+UvLxY=
=Z+ER
-----END PGP SIGNATURE-----

--Rj8o6m6NXfJNPrxr9QhI2ETqlcCX34G4W--

