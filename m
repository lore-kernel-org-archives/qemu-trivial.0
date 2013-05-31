Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UiOj0-0001FU-N9
	for mharc-qemu-trivial@gnu.org; Fri, 31 May 2013 08:46:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35058)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1UiOiy-0001DV-Bt
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 08:46:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1UiOiw-0004sI-Qm
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 08:46:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:25058)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1UiOit-0004rc-4g; Fri, 31 May 2013 08:46:23 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r4VCkMiv020354
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 31 May 2013 08:46:22 -0400
Received: from [10.3.113.110] (ovpn-113-110.phx2.redhat.com [10.3.113.110])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r4VCkLtM019090; Fri, 31 May 2013 08:46:21 -0400
Message-ID: <51A89B9D.9010404@redhat.com>
Date: Fri, 31 May 2013 06:46:21 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1370001627-11830-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1370001627-11830-1-git-send-email-pbonzini@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="----enig2DABIGSRIWSBGQCVFEKHP"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] do not check pointers after
 dereferencing them
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
X-List-Received-Date: Fri, 31 May 2013 12:46:29 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2DABIGSRIWSBGQCVFEKHP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 05/31/2013 06:00 AM, Paolo Bonzini wrote:
> Two instances, both spotted by Coverity.  In one, two blocks were
> swapped.  In the other, the check is not needed anymore.
>=20
> Cc: qemu-stable@nongnu.org
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  monitor.c |  2 +-
>  savevm.c  | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)

This version of the savevm.c fix is nicer than Stefan's attempt:
https://lists.gnu.org/archive/html/qemu-devel/2013-05/msg04506.html

Reviewed-by: Eric Blake <eblake@redhat.com>

> +++ b/savevm.c
> @@ -322,16 +322,16 @@ QEMUFile *qemu_popen_cmd(const char *command, con=
st char *mode)
>      FILE *stdio_file;
>      QEMUFileStdio *s;
> =20
> -    stdio_file =3D popen(command, mode);
> -    if (stdio_file =3D=3D NULL) {
> -        return NULL;
> -    }
> -
>      if (mode =3D=3D NULL || (mode[0] !=3D 'r' && mode[0] !=3D 'w') || =
mode[1] !=3D 0) {
>          fprintf(stderr, "qemu_popen: Argument validity check failed\n"=
);
>          return NULL;
>      }
> =20
> +    stdio_file =3D popen(command, mode);
> +    if (stdio_file =3D=3D NULL) {
> +        return NULL;
> +    }
> +
>      s =3D g_malloc0(sizeof(QEMUFileStdio));
> =20
>      s->stdio_file =3D stdio_file;
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


------enig2DABIGSRIWSBGQCVFEKHP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJRqJudAAoJEKeha0olJ0NqFjgH/146PPOty+EcTKd6yB0hXhq2
ujsDdOfMyC3ZDEQPgHiW3c1wT39xW5GhvyQBlXpNMDh9jnKcWN18gA26NLvhi0Sr
q+XzSsEG0z8ZcoYaQ1Io7c+Oiv1OK89CeDQGrZFIc9bZ2l9s8VSgNaLjwXYNJv0c
bie779ZfNoQ8k8b/x8fdez7EcKvvpiZdhK38fOscntibhbEG53rqL8DyW6WPUe/k
A0+WHItCZNlcmjrMTImvwiyrp8A59U30KjYxXxtZW49lqtFdN+IHg+23OFv9yJI8
MIImrTrX4/ysP/3sBUzsjKTY6MAY8+q2xg+lVZhftUJ2Ih2AT/wuNqDwxHUt308=
=HOGI
-----END PGP SIGNATURE-----

------enig2DABIGSRIWSBGQCVFEKHP--

