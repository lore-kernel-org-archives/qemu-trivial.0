Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WGqP0-0000Qg-1z
	for mharc-qemu-trivial@gnu.org; Fri, 21 Feb 2014 08:44:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WGqOt-0000HV-3Z
	for qemu-trivial@nongnu.org; Fri, 21 Feb 2014 08:44:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WGqOn-0002pe-HP
	for qemu-trivial@nongnu.org; Fri, 21 Feb 2014 08:44:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:22803)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1WGqOd-0002mg-Ed; Fri, 21 Feb 2014 08:44:07 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1LDi3kN031284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 21 Feb 2014 08:44:04 -0500
Received: from [10.3.113.40] (ovpn-113-40.phx2.redhat.com [10.3.113.40])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s1LDi28K023023; Fri, 21 Feb 2014 08:44:02 -0500
Message-ID: <53075822.40808@redhat.com>
Date: Fri, 21 Feb 2014 06:44:02 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1392986209-32162-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1392986209-32162-1-git-send-email-armbru@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="XfOe8rJ7kgt4RA8mHMeNF8RVUEoPm6T2d"
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qga: Fix memory allocation
	pasto
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
X-List-Received-Date: Fri, 21 Feb 2014 13:44:28 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XfOe8rJ7kgt4RA8mHMeNF8RVUEoPm6T2d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 02/21/2014 05:36 AM, Markus Armbruster wrote:
> qmp_guest_file_seek() allocates memory for a GuestFileRead object
> instead of the GuestFileSeek object it actually uses.  Harmless,
> because the GuestFileRead is slightly larger.
>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qga/commands-posix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index cae4171..2c496b6 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -525,7 +525,7 @@ struct GuestFileSeek *qmp_guest_file_seek(int64_t h=
andle, int64_t offset,
>      if (ret =3D=3D -1) {
>          error_setg_errno(err, errno, "failed to seek file");
>      } else {
> -        seek_data =3D g_malloc0(sizeof(GuestFileRead));
> +        seek_data =3D g_new0(GuestFileSeek, 1);
>          seek_data->position =3D ftell(fh);
>          seek_data->eof =3D feof(fh);
>      }
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--XfOe8rJ7kgt4RA8mHMeNF8RVUEoPm6T2d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJTB1giAAoJEKeha0olJ0NqfQsH/1dNQdVa8xkZpGjDmxhb300y
2YlS+cyFrmg41WTz8l0QGOfU0FLJShyFhiHMGroT4VsDv9FStf44yM/GoTPp5jDj
28rc+ZIFxvp1vZSsDPrSnCjQelU/I3cAJ98AqS36P8v7lYGdN0Hpt4XOf1r/dhUf
sT+vI6KjKucWq14stPZDE93jqr4J9oPIHA+Y27mSO1/DHDYhiGr9P/Cj4L9FXUtQ
vESS/m1K6v8i1sDpvB0ClQdItxdLht9rxvRi1mUus8hIAhNx+2rwmlxb+b/f9C/l
VW7iWy5BwrUuFu4KcN5f83bVGRfDOCcE+C6ZJh5uvCfrQEAPLXF04DGAOGKd+gE=
=oTcH
-----END PGP SIGNATURE-----

--XfOe8rJ7kgt4RA8mHMeNF8RVUEoPm6T2d--

