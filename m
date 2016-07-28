Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bSnIK-0000a9-Kv
	for mharc-qemu-trivial@gnu.org; Thu, 28 Jul 2016 11:32:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bSnIH-0000Xe-EO
	for qemu-trivial@nongnu.org; Thu, 28 Jul 2016 11:32:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bSnIE-00047I-5r
	for qemu-trivial@nongnu.org; Thu, 28 Jul 2016 11:32:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60116)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bSnI3-00045i-Qs; Thu, 28 Jul 2016 11:32:04 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 39EE57F095;
	Thu, 28 Jul 2016 15:32:03 +0000 (UTC)
Received: from [10.3.116.90] (ovpn-116-90.phx2.redhat.com [10.3.116.90])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6SFW2Zp004034; Thu, 28 Jul 2016 11:32:02 -0400
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1469703004-14800-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <579A2571.9060101@redhat.com>
Date: Thu, 28 Jul 2016 09:32:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1469703004-14800-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="m8Gw44EG5A9U8avRbKK3ahUwu1CAHxvdf"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 28 Jul 2016 15:32:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] util/qemu-sockets: revert
 Yoda Conditions to normal
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
X-List-Received-Date: Thu, 28 Jul 2016 15:32:18 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--m8Gw44EG5A9U8avRbKK3ahUwu1CAHxvdf
Content-Type: multipart/mixed; boundary="7UkNXiVofKlvoGSRc80DDnHcA9NFDsEwo"
From: Eric Blake <eblake@redhat.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <579A2571.9060101@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] util/qemu-sockets: revert Yoda Conditions to
 normal
References: <1469703004-14800-1-git-send-email-caoj.fnst@cn.fujitsu.com>
In-Reply-To: <1469703004-14800-1-git-send-email-caoj.fnst@cn.fujitsu.com>

--7UkNXiVofKlvoGSRc80DDnHcA9NFDsEwo
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 07/28/2016 04:50 AM, Cao jin wrote:
> Follow CODING_STYLE
>=20
> Cc: Daniel P. Berrange <berrange@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
>=20
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  util/qemu-sockets.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> Daniel P. Berrange make me realized there is Yoda Conditions in this fi=
le,
> this file is mixed with both style, since I just touched this file, so,=

> reverting it is handy to me.
>=20
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 5e08723..a07acc5 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -386,7 +386,7 @@ static int inet_dgram_saddr(InetSocketAddress *srad=
dr,
>          goto err;
>      }
> =20
> -    if (0 !=3D (rc =3D getaddrinfo(addr, port, &ai, &peer))) {
> +    if ((rc =3D getaddrinfo(addr, port, &ai, &peer)) !=3D 0) {

CODING_STYLE is currently silent on whether assignment in conditionals
is appropriate, so maybe that should be patched.  But most of our code
prefers:

rc =3D getaddrinfo();
if (rc !=3D 0) {

rather than assignments in the conditional.  I don't have any strong
opinions on whether that would require a respin or whether your patch is
fine as is.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--7UkNXiVofKlvoGSRc80DDnHcA9NFDsEwo--

--m8Gw44EG5A9U8avRbKK3ahUwu1CAHxvdf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXmiVyAAoJEKeha0olJ0NqmUEH/jJ0xzh9gpBiuk+mDZvnehO2
pdooPgd/F9PZhPs+qbJZMwXpTmQRXfPyLPpiwy2uPNJw6Ip0MEzpV5PCrNWbDcCB
jegAbe+heajLoEoiXETOjezG5wsUizMGGzT/38GKz33kBKv6Is5ynDDzhBc6B5+U
5MtwNIOhDw6bq4A8y4+WYQKJPTAoTDD0MVFnQyOdv/vmo34t4UHu50PI0NArKXaD
RPjvTQyKRWb+TJdyP/uxN5WdqQqHXJCs569LgwPmpqPTkqqPIPR53sGRKwb9eh2G
MQJvv3NQfqPrY0XAuPuqwVkMNGwMemZuqf+pscMnCcPe2hthOmJtDYUZNyMsuF4=
=j876
-----END PGP SIGNATURE-----

--m8Gw44EG5A9U8avRbKK3ahUwu1CAHxvdf--

