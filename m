Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bNhKF-0007ue-4k
	for mharc-qemu-trivial@gnu.org; Thu, 14 Jul 2016 10:09:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bNhKA-0007ir-Cl
	for qemu-trivial@nongnu.org; Thu, 14 Jul 2016 10:09:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bNhK8-0007XC-5Y
	for qemu-trivial@nongnu.org; Thu, 14 Jul 2016 10:09:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52524)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bNhK0-0007WD-8g; Thu, 14 Jul 2016 10:09:00 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C2810D6842;
	Thu, 14 Jul 2016 14:08:59 +0000 (UTC)
Received: from [10.3.116.64] (ovpn-116-64.phx2.redhat.com [10.3.116.64])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6EE8wT1032264; Thu, 14 Jul 2016 10:08:59 -0400
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1468501843-14927-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Cc: qemu-trivial@nongnu.org, famz@redhat.com, qemu-block@nongnu.org,
	stefanha@redhat.com
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <57879CFA.9040700@redhat.com>
Date: Thu, 14 Jul 2016 08:08:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1468501843-14927-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="bR1Q8qTSPQbWQqxgXnJdCs50fXcqBerJ9"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 14 Jul 2016 14:08:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] aio_ctx_check: follow
 CODING_STYLE
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jul 2016 14:09:14 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bR1Q8qTSPQbWQqxgXnJdCs50fXcqBerJ9
Content-Type: multipart/mixed; boundary="voUDPu2mwRiFJbbgW4M1BWn0rmWv3NKXC"
From: Eric Blake <eblake@redhat.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, famz@redhat.com, qemu-block@nongnu.org,
 stefanha@redhat.com
Message-ID: <57879CFA.9040700@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] aio_ctx_check: follow CODING_STYLE
References: <1468501843-14927-1-git-send-email-caoj.fnst@cn.fujitsu.com>
In-Reply-To: <1468501843-14927-1-git-send-email-caoj.fnst@cn.fujitsu.com>

--voUDPu2mwRiFJbbgW4M1BWn0rmWv3NKXC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 07/14/2016 07:10 AM, Cao jin wrote:
> replace tab with spaces
>=20
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  async.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Whitespace-only changes are best done as part of a series that is
already touching nearby code for other reasons (depending on the size of
the whitespace changes and on the rest of your patch, it may be okay to
squash the whitespace change in place, or better to split into separate
patches to make review of both patches easier).  Otherwise, it just
makes 'git blame' output dirtier.
>=20
> diff --git a/async.c b/async.c
> index 1f9754b..8589017 100644
> --- a/async.c
> +++ b/async.c
> @@ -217,7 +217,7 @@ aio_ctx_check(GSource *source)
>      for (bh =3D ctx->first_bh; bh; bh =3D bh->next) {
>          if (!bh->deleted && bh->scheduled) {
>              return true;
> -	}
> +        }

Nothing wrong with the patch itself, and I won't oppose it going in, but
it's generally not worth the effort if nothing else in this file needs
fixing.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--voUDPu2mwRiFJbbgW4M1BWn0rmWv3NKXC--

--bR1Q8qTSPQbWQqxgXnJdCs50fXcqBerJ9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXh5z6AAoJEKeha0olJ0NqChUH/iRhnQmYpeDLiiBPJmx3BRYF
/ZG1T/fWK85mRLocjm0gsB4/GIOGNhe14lNtmz9/Qp0kRs37+P88gfkw1cbJGBKA
D2rgDhm0tf+0eNcJSH4yeUpUjLNcQAFIQTBVt3+ntBWlHHr2A5XIWUdwhfxlUhP7
OH278VVu0YsfMp6nrL1MIcpuky8LpGuQK35STH9vTNcN7eLYtHioAwK542X387h1
UcSBC+XH+GjC0p+dZ99oD8Se/uibdJsc4I0zd4/Bz57oTOzZnBggzFMSYbY0Gb2O
53zPePBroYzvgWo7lNQIqya0c00w5+oEw/y/f1se4DeLBkv97IPj5MEENdLaD68=
=5S9L
-----END PGP SIGNATURE-----

--bR1Q8qTSPQbWQqxgXnJdCs50fXcqBerJ9--

