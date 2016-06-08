Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bAddr-0000Om-V2
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jun 2016 09:35:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bAddp-0000Mk-G9
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 09:35:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bAddl-0006aS-FX
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 09:35:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60658)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bAddT-0006Va-9E; Wed, 08 Jun 2016 09:35:07 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 77387C00DE02;
	Wed,  8 Jun 2016 13:35:06 +0000 (UTC)
Received: from [10.3.116.88] (ovpn-116-88.phx2.redhat.com [10.3.116.88])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u58DZ5CF018576; Wed, 8 Jun 2016 09:35:05 -0400
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
References: <1465382576-25552-1-git-send-email-berrange@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-stable@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <57581F08.9080508@redhat.com>
Date: Wed, 8 Jun 2016 07:35:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1465382576-25552-1-git-send-email-berrange@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="K55DsTq4DUvOPxTrnpiag5OR4ScElTEgO"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 08 Jun 2016 13:35:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ui: fix regression in
 printing VNC host/port on startup
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
X-List-Received-Date: Wed, 08 Jun 2016 13:35:30 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--K55DsTq4DUvOPxTrnpiag5OR4ScElTEgO
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/08/2016 04:42 AM, Daniel P. Berrange wrote:
> If VNC is chosen as the compile time default display backend,
> QEMU will print the host/port it listens on at startup.
> Previously this would look like
>=20
>   VNC server running on '::1:5900'
>=20
> but in 04d2529da27db512dcbd5e99d0e26d333f16efcc the ':' was
> accidentally replaced with a ';'. This the ':' back.
>=20
> Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  ui/vnc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/ui/vnc.c b/ui/vnc.c
> index c862fdc..75ae2a7 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -3225,7 +3225,7 @@ char *vnc_display_local_addr(const char *id)
>          qapi_free_SocketAddress(addr);
>          return NULL;
>      }
> -    ret =3D g_strdup_printf("%s;%s", addr->u.inet.data->host,
> +    ret =3D g_strdup_printf("%s:%s", addr->u.inet.data->host,
>                            addr->u.inet.data->port);
>      qapi_free_SocketAddress(addr);
> =20
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--K55DsTq4DUvOPxTrnpiag5OR4ScElTEgO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXWB8IAAoJEKeha0olJ0Nq7hQH+gN3ipHvpDsym1OarGA+OjNr
5g4UG17VjVn8uTNrKUQXhsNaOvzGcMDbKN+Q4WX5MAStg/FiTgEg9xe9SfzHYCbk
RAaRs4C9wjjHiQlwL9i9PEa6XOPkG4JlulUJ1LrWL5y7kFVIarTSHp6IcUvzPxS9
nnv2uNseqDZhckV0D2ooRBFxYu3Olz0Kjio9LKRf9eL8p0NOhVmQWTeChR73Hr5e
DBAzFD9KS8y1ZfSLAyibnB5sQKxOdh8S/kh1U+58Qkl0q+Th+Tt5A+C83k5jwKsD
G+NleAwxh9MeDYIHwvKn1Uzf8cly/TqEcSE+L8e7GdrMlQj1/fB4Iusre8Kw/lQ=
=QwuW
-----END PGP SIGNATURE-----

--K55DsTq4DUvOPxTrnpiag5OR4ScElTEgO--

