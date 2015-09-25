Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfVYb-0007Qm-62
	for mharc-qemu-trivial@gnu.org; Fri, 25 Sep 2015 12:09:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZfVYT-00079k-6Z
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 12:09:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZfVYS-0003wa-83
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 12:09:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35447)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ZfVYL-0003tw-Dp; Fri, 25 Sep 2015 12:08:53 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 07A3AC0B91B8;
	Fri, 25 Sep 2015 16:08:53 +0000 (UTC)
Received: from [10.3.113.141] (ovpn-113-141.phx2.redhat.com [10.3.113.141])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8PG8qTv003117; Fri, 25 Sep 2015 12:08:52 -0400
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <1443189844-20341-1-git-send-email-marcandre.lureau@redhat.com>
	<1443189844-20341-22-git-send-email-marcandre.lureau@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <56057193.5060508@redhat.com>
Date: Fri, 25 Sep 2015 10:08:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1443189844-20341-22-git-send-email-marcandre.lureau@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="uNtUj6KX6O8TSql3gU2l5uqTbbaex94SV"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 21/36] misc: spelling
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
X-List-Received-Date: Fri, 25 Sep 2015 16:09:07 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uNtUj6KX6O8TSql3gU2l5uqTbbaex94SV
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/25/2015 08:03 AM, marcandre.lureau@redhat.com wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> ---
>  monitor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Trivial, can be applied now without waiting for pending qapi patches.

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/monitor.c b/monitor.c
> index 4deef29..25f9608 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -306,7 +306,7 @@ static void monitor_flush_locked(Monitor *mon)
>              return;
>          }
>          if (rc > 0) {
> -            /* partinal write */
> +            /* partial write */
>              QString *tmp =3D qstring_from_str(buf + rc);
>              QDECREF(mon->outbuf);
>              mon->outbuf =3D tmp;
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--uNtUj6KX6O8TSql3gU2l5uqTbbaex94SV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWBXGTAAoJEKeha0olJ0NqlbMH/jvQv3di2cxyPnRaUCucEtqT
9J5IgsD+NKSBRQ9Rugy2hZBl4+jf6F8h1OTS3Pm2sf1I1qF63NTlj6PCAeulkWrB
mv1PXg68mDqsdfNwn140SLJZG1amWA+9dn+GdO6WHQ270WcGKCp/fDfFGfuSEwaX
ChTwJPsfwSDlCac2QwYjy03x0QxrjUmX26mAhqCYVvVYdGo3SxKGPcmFbUw0c9JL
N2vKyJ14PYIZOCtfM1niadDxAWqMwvF2S0DAHrzVttMDSlnwlwn1HKOlk1sfuHl2
CDJ1v2sFNA1xnbFjCb6XeP27YIcR/t69khnWWwguQSISyTyi8NIEp4EkyZ0qul8=
=m3Yw
-----END PGP SIGNATURE-----

--uNtUj6KX6O8TSql3gU2l5uqTbbaex94SV--

