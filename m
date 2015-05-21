Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YvGpP-0003cI-Ox
	for mharc-qemu-trivial@gnu.org; Wed, 20 May 2015 23:07:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YvGpN-0003Yc-DI
	for qemu-trivial@nongnu.org; Wed, 20 May 2015 23:07:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YvGpM-0003qz-4s
	for qemu-trivial@nongnu.org; Wed, 20 May 2015 23:07:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57287)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YvGpD-0003lz-HM; Wed, 20 May 2015 23:07:11 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id A512FC1F09;
	Thu, 21 May 2015 03:07:10 +0000 (UTC)
Received: from [10.3.113.69] (ovpn-113-69.phx2.redhat.com [10.3.113.69])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4L37A93023232; Wed, 20 May 2015 23:07:10 -0400
Message-ID: <555D4BDD.5070604@redhat.com>
Date: Wed, 20 May 2015 21:07:09 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1432176875-5984-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1432176875-5984-1-git-send-email-arei.gonglei@huawei.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="EU156MWqMTV55Smht43nsghgX2752tB7n"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qemu-error: make the timestamp more
	obvious and clear
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
X-List-Received-Date: Thu, 21 May 2015 03:07:22 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EU156MWqMTV55Smht43nsghgX2752tB7n
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/20/2015 08:54 PM, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
>=20
> before:
>    (qemu) 2015-05-21T02:07:43.695065Z qemu-system-x86_64: test....

Ah, but the trailing Z is UTC,

> after applying this patch:
>    (qemu) [2015-05-21T02:21:46.023619Z UTC] qemu-system-x86_64: test...=
=2E

so this representation is now redundant for specifying the same timezone
twice.  Basically, 'Z', '+0000', and ' UTC' are synonyms; I don't know
if any one form is more popular than others, but I don't think we need
this patch.

>=20
> Cc: Eric Blake <eblake@redhat.com>
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  util/qemu-error.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/util/qemu-error.c b/util/qemu-error.c
> index 9bba5f5..0b91cbc 100644
> --- a/util/qemu-error.c
> +++ b/util/qemu-error.c
> @@ -212,7 +212,7 @@ void error_vreport(const char *fmt, va_list ap)
>      if (enable_timestamp_msg) {
>          g_get_current_time(&tv);
>          timestr =3D g_time_val_to_iso8601(&tv);

Since glib already provided a trailing Z, it's actually more work to
strip it and provide an alternative of ' UTC'; so I'm inclined to NACK
this patch, unless anyone else has a strong opinion in favor of it.

> -        error_printf("%s ", timestr);
> +        error_printf("[%s UTC] ", timestr);
>          g_free(timestr);
>      }
> =20
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--EU156MWqMTV55Smht43nsghgX2752tB7n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVXUvdAAoJEKeha0olJ0NqXWoH/22K2TggZR4gXsB3XD/7+DXB
/R1/PXpCkPs71TmPqOkomn80oO4Yv6Ib70VkE+cjwUG+biJ5jIOwT76rdl9GCdt1
BLjJaer8avq4AUX4/4ERaV80nKh79tb4ojxAOXyhSRNnqwbcYwRGnklC9Nx4ULvk
t34DSO9LmfkZjwR2+Ky0IHcjfoh6U2eOyhwRoYe16qiO6DU/MNjf33VhvceSxotK
zijzI/WoUXcglLKnGRPwLzukZhMqavPkrVvNI8jxSq0QZS796CfjFU+0mkDmjd1/
POqNrF6S9NDk8+Gl0P3h1DY1kPTC2zgnn/2BOQm7Vb7f9SNkH+MTJwU/M8A2aNo=
=+pqX
-----END PGP SIGNATURE-----

--EU156MWqMTV55Smht43nsghgX2752tB7n--

