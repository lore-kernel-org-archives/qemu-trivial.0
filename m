Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UBQDo-0005ZH-0f
	for mharc-qemu-trivial@gnu.org; Fri, 01 Mar 2013 08:42:00 -0500
Received: from eggs.gnu.org ([208.118.235.92]:42467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1UBQDk-0005U9-NC
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2013 08:41:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1UBQDj-0001eB-93
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2013 08:41:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:3011)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1UBQDi-0001e5-U3; Fri, 01 Mar 2013 08:41:55 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r21Da1lH019833
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 1 Mar 2013 08:36:02 -0500
Received: from [10.3.113.158] (ovpn-113-158.phx2.redhat.com [10.3.113.158])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r21Da1Tl008103; Fri, 1 Mar 2013 08:36:01 -0500
Message-ID: <5130AEC0.5060800@redhat.com>
Date: Fri, 01 Mar 2013 06:36:00 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130219 Thunderbird/17.0.3
MIME-Version: 1.0
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <5130A4E3.70003@linux.vnet.ibm.com>
In-Reply-To: <5130A4E3.70003@linux.vnet.ibm.com>
X-Enigmail-Version: 1.5.1
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="----enig2LQTQNCSVJAQKXTPBQANP"
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Use qemu_open / qemu_close in rng backend
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
X-List-Received-Date: Fri, 01 Mar 2013 13:41:58 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2LQTQNCSVJAQKXTPBQANP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

[don't you also need to cc the main qemu list, even for trivial patches?]=


On 03/01/2013 05:53 AM, Stefan Berger wrote:
> In the rng backend use qemu_open and qemu_close rather than POSIX
> open/close.
>=20
> Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/backends/rng-random.c b/backends/rng-random.c
> index 0d11088..acd20af 100644
> --- a/backends/rng-random.c
> +++ b/backends/rng-random.c
> @@ -74,7 +74,7 @@ static void rng_random_opened(RngBackend *b, Error
> **errp)
>          error_set(errp, QERR_INVALID_PARAMETER_VALUE,
>                    "filename", "a valid filename");
>      } else {
> -        s->fd =3D open(s->filename, O_RDONLY | O_NONBLOCK);
> +        s->fd =3D qemu_open(s->filename, O_RDONLY | O_NONBLOCK);
>=20
>          if (s->fd =3D=3D -1) {
>              error_set(errp, QERR_OPEN_FILE_FAILED, s->filename);
> @@ -130,7 +130,7 @@ static void rng_random_finalize(Object *obj)
>      qemu_set_fd_handler(s->fd, NULL, NULL, NULL);
>=20
>      if (s->fd !=3D -1) {
> -        close(s->fd);
> +        qemu_close(s->fd);
>      }
>=20
>      g_free(s->filename);
>=20
>=20
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


------enig2LQTQNCSVJAQKXTPBQANP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJRMK7AAAoJEKeha0olJ0Nqy/IH/j2Xpy9Yf0Md1YRb29X5s/tR
zZH7L3nHXJ/WcHjQwQcKkeTdyHa7aCJeK7z7BiPLK468rNHeXv0ntflFD03Lh9R+
ymTdi1MqgeBjiGcw8SHbIhn+h2LKyyfzEcjRBV/DmLTaQzFE/jcH5iq4D8V4BqWM
qMBwB+8tTtrscLaQij1G0hflKvkE/H9bZaMr5EWSKLj9nFvMNzFtw270D/fVsm9f
Xp08oQBAhFKnaqbvitlijb4m8QBBQP9mlObLdqDgdQfHZOPpCshVEoTQtXZ/stcm
+vAGk+jIe4iWwKP9PEFqjAQuGdhfJssh5aqoLDzFTLEidh5qQETDmaoHI3XuDrs=
=92Pm
-----END PGP SIGNATURE-----

------enig2LQTQNCSVJAQKXTPBQANP--

