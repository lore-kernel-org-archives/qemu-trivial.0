Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkLqq-0002kd-06
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 20:48:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZkLqk-0002jU-Ip
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 20:47:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZkKik-0006Pl-Sl
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 19:36:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34515)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ZkKhF-0001Zx-Td; Thu, 08 Oct 2015 19:34:02 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id EFFF170;
	Thu,  8 Oct 2015 23:34:00 +0000 (UTC)
Received: from [10.3.113.202] (ovpn-113-202.phx2.redhat.com [10.3.113.202])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t98NY0VT004393; Thu, 8 Oct 2015 19:34:00 -0400
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1444332916-16476-1-git-send-email-thuth@redhat.com>
	<1444332916-16476-4-git-send-email-thuth@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <5616FD68.5050801@redhat.com>
Date: Thu, 8 Oct 2015 17:34:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1444332916-16476-4-git-send-email-thuth@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="mLkkPfNiRijDJeU0L4xUiiBc0CFlkCMA6"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/5] hw/input/tsc210x:
 Remove superfluous memset
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
X-List-Received-Date: Fri, 09 Oct 2015 00:47:57 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mLkkPfNiRijDJeU0L4xUiiBc0CFlkCMA6
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/08/2015 01:35 PM, Thomas Huth wrote:
> g_malloc0 already clears the memory, so no need for additional
> memsets here. And while we're at it, let's also remove the
> superfluous typecasts for the return values of g_malloc0.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/input/tsc210x.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
> index fae3385..92b076a 100644
> --- a/hw/input/tsc210x.c
> +++ b/hw/input/tsc210x.c
> @@ -1086,9 +1086,7 @@ uWireSlave *tsc2102_init(qemu_irq pint)
>  {
>      TSC210xState *s;
> =20
> -    s =3D (TSC210xState *)
> -            g_malloc0(sizeof(TSC210xState));
> -    memset(s, 0, sizeof(TSC210xState));
> +    s =3D g_malloc0(sizeof(TSC210xState));

This should probably be g_new0(TSC210xState, 1), consistent with Markus'
recent cleanup patches.

>      s->x =3D 160;
>      s->y =3D 160;
>      s->pressure =3D 0;
> @@ -1135,9 +1133,7 @@ uWireSlave *tsc2301_init(qemu_irq penirq, qemu_ir=
q kbirq, qemu_irq dav)
>  {
>      TSC210xState *s;
> =20
> -    s =3D (TSC210xState *)
> -            g_malloc0(sizeof(TSC210xState));
> -    memset(s, 0, sizeof(TSC210xState));
> +    s =3D g_malloc0(sizeof(TSC210xState));

Likewise.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--mLkkPfNiRijDJeU0L4xUiiBc0CFlkCMA6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWFv1oAAoJEKeha0olJ0Nq9/UH/1wbuGMmJV2S95pFPSRpMeDo
hQpbPY3XSzogec8F1R6upuIeMsbU6oqRL2sX0SUujGO8m8ZAdnz9uTy7LxiDJ5qZ
9a8wjWwWbnu/A737Se570fUv5zNXSqgWYHP4YRw0ksLHinclJc0LHqgmUWZ31yno
jTnI29hL3QGaI6z7YgYKebOXPL3kbcMrdkFLZ4aJcEJTuFc4H3HWAiYWVd5xLAz+
vXvNJj8gcB1tYrSo634akiS1pQpSr0j3n7xXn7eYJnZUlqrAMUUv4qcVgYpiVH5t
m7tKTGzLLIMfYNZ1QebMlr7iFhFGYJkLVmHtdQDLJ37i+cONoMtxXJyZ/byhueU=
=W81Z
-----END PGP SIGNATURE-----

--mLkkPfNiRijDJeU0L4xUiiBc0CFlkCMA6--

