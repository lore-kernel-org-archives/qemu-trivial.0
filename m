Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpz7k-0006dG-B2
	for mharc-qemu-trivial@gnu.org; Fri, 30 Sep 2016 10:49:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bpz7h-0006b5-Ld
	for qemu-trivial@nongnu.org; Fri, 30 Sep 2016 10:49:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bpz7g-0005D3-ET
	for qemu-trivial@nongnu.org; Fri, 30 Sep 2016 10:49:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53582)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bpz7Y-00056A-8w; Fri, 30 Sep 2016 10:49:04 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E344943A44;
	Fri, 30 Sep 2016 14:49:02 +0000 (UTC)
Received: from [10.3.116.116] (ovpn-116-116.phx2.redhat.com [10.3.116.116])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8UEn16k023306; Fri, 30 Sep 2016 10:49:02 -0400
To: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>,
	qemu devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	qemu-trivial <qemu-trivial@nongnu.org>
References: <1475202478-20716-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <51eb078a-7f10-fcdc-59f3-0aa5d4ca9c84@redhat.com>
Date: Fri, 30 Sep 2016 09:49:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1475202478-20716-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="w8nRsoE7agoAaFvgTxBUHk1eUeWbe0io9"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 30 Sep 2016 14:49:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net/filter-mirror: Fix
 mirror initial check typo
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
X-List-Received-Date: Fri, 30 Sep 2016 14:49:15 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--w8nRsoE7agoAaFvgTxBUHk1eUeWbe0io9
Content-Type: multipart/mixed; boundary="O8wKGsQPsIlQugdh1h0HpBivJVL4r4T85";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>,
 qemu devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-trivial <qemu-trivial@nongnu.org>
Message-ID: <51eb078a-7f10-fcdc-59f3-0aa5d4ca9c84@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] net/filter-mirror: Fix mirror initial check
 typo
References: <1475202478-20716-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>
In-Reply-To: <1475202478-20716-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>

--O8wKGsQPsIlQugdh1h0HpBivJVL4r4T85
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/29/2016 09:27 PM, Zhang Chen wrote:
> Signed-off-by: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
> ---
>  net/filter-mirror.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

Could also go through qemu-trivial (cc'd).

> diff --git a/net/filter-mirror.c b/net/filter-mirror.c
> index 35df374..0ee58d9 100644
> --- a/net/filter-mirror.c
> +++ b/net/filter-mirror.c
> @@ -198,7 +198,7 @@ static void filter_mirror_setup(NetFilterState *nf,=
 Error **errp)
>      MirrorState *s =3D FILTER_MIRROR(nf);
> =20
>      if (!s->outdev) {
> -        error_setg(errp, "filter filter mirror needs 'outdev' "
> +        error_setg(errp, "filter mirror needs 'outdev' "
>                     "property set");
>          return;
>      }
> @@ -315,7 +315,7 @@ filter_mirror_set_outdev(Object *obj, const char *v=
alue, Error **errp)
>      g_free(s->outdev);
>      s->outdev =3D g_strdup(value);
>      if (!s->outdev) {
> -        error_setg(errp, "filter filter mirror needs 'outdev' "
> +        error_setg(errp, "filter mirror needs 'outdev' "
>                     "property set");
>          return;
>      }
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--O8wKGsQPsIlQugdh1h0HpBivJVL4r4T85--

--w8nRsoE7agoAaFvgTxBUHk1eUeWbe0io9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJX7ntdAAoJEKeha0olJ0NqQlkH/ji6kaajY1cK4Td5QVKEUyW5
6vCrFZ5gsQR1ov1A0iqBhke8nLLu9EyMbA43YFgoUps4Amz0qEokTlwy4R+6OzVI
dUPoCE6lxxiQkOy7zMlrRAzxExI7Pw8aiV7VoRG9kazp4eCaPNlgOtjiUxzrLO0i
lZC1Gj2jdYVQ8Gb5sZMZlF8rahC/XcOsRAGZHOcfMflJqqAQT8XNX8BRe+LKyF33
6EP6JWpxcLvvLhUkmx4CoJVKet5EJnLIl5LB52S1z2363kpVUn0YCBWwIPcOP8zu
PoZuWRBzxT2yU2sI8/sbxnJzUalwEv0FejyDIHT2UdPYmDqQhXKxMNsVz/xYp1U=
=LzC4
-----END PGP SIGNATURE-----

--w8nRsoE7agoAaFvgTxBUHk1eUeWbe0io9--

