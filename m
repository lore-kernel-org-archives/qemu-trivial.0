Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvVIt-0002QO-Ob
	for mharc-qemu-trivial@gnu.org; Wed, 16 Jan 2013 10:53:27 -0500
Received: from eggs.gnu.org ([208.118.235.92]:60752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1TvVIp-0002Dp-8L
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 10:53:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1TvVIk-00066d-2K
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 10:53:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:10120)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1TvVIZ-00065H-HN; Wed, 16 Jan 2013 10:53:07 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0GFr6Vs026098
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 16 Jan 2013 10:53:06 -0500
Received: from [10.3.113.75] (ovpn-113-75.phx2.redhat.com [10.3.113.75])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0GFr546009664; Wed, 16 Jan 2013 10:53:06 -0500
Message-ID: <50F6CCE1.4020503@redhat.com>
Date: Wed, 16 Jan 2013 08:53:05 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1358346998-26328-1-git-send-email-armbru@redhat.com>
	<1358346998-26328-9-git-send-email-armbru@redhat.com>
In-Reply-To: <1358346998-26328-9-git-send-email-armbru@redhat.com>
X-Enigmail-Version: 1.5.0
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="----enig2MTSQLJLONMRHQUBBNDGL"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 08/11] qemu-log: Plug
 trivial memory leak in cpu_set_log_filename()
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
X-List-Received-Date: Wed, 16 Jan 2013 15:53:26 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2MTSQLJLONMRHQUBBNDGL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 01/16/2013 07:36 AM, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qemu-log.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>=20
> diff --git a/qemu-log.c b/qemu-log.c
> index 64a1b88..1eadf1b 100644
> --- a/qemu-log.c
> +++ b/qemu-log.c
> @@ -21,10 +21,12 @@
>  #include "qemu/log.h"
> =20
>  #ifdef WIN32
> -static const char *logfilename =3D "qemu.log";
> +#define DEFAULT_LOGFILENAME =3D "qemu.log"

Syntax error.

> @@ -54,11 +56,13 @@ void qemu_log_mask(int mask, const char *fmt, ...)
>  /* enable or disable low levels log */
>  void qemu_set_log(int log_flags, bool use_own_buffers)
>  {
> +    const char *fname =3D logfilename ?: DEFAULT_LOGFILENAME;

?: is not C99, but a GNU extension.  What is our policy on using it?

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


------enig2MTSQLJLONMRHQUBBNDGL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJQ9szhAAoJEKeha0olJ0NqmVEH/1ureQ7RdXpfHLiDPZxt2vWd
fDZV4pFqU9zoGkrd368AtiFGwyeHbu+ffGpo5C54wMfzoolDX0SBqD/38XcfanKy
3Bqky8ypjgoyAlhcK5Bdq92Fp2hqem8XteVZ9fq+4+R+//YTUz/W9i1rpjUDhKPz
VpOcyIKrRdTBLT5mT+X+Gb25CL6rvNvscXm9JmL2Rpk9Ov7jitbr1kIMSYSlBYm+
OBwW1o98UTwEVlUdvAZK8oqUqWXx/gbM6Nur/5tqdxOY7yDPDLcRUbNEbPCkTwyb
1zmN/QBGLSj4qREqW0oiBLgMp3D3ZiRRIeMi6YjlwF0ML1ywnMCNrCBilhshqQ8=
=8+lg
-----END PGP SIGNATURE-----

------enig2MTSQLJLONMRHQUBBNDGL--

