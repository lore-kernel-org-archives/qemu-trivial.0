Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aKDqU-0007ab-Iv
	for mharc-qemu-trivial@gnu.org; Fri, 15 Jan 2016 18:31:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36675)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1aKDqS-0007YG-GV
	for qemu-trivial@nongnu.org; Fri, 15 Jan 2016 18:31:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1aKDqR-0002Vi-Gj
	for qemu-trivial@nongnu.org; Fri, 15 Jan 2016 18:31:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59160)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1aKDqM-0002VP-R9; Fri, 15 Jan 2016 18:31:46 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 7D13C8E221;
	Fri, 15 Jan 2016 23:31:46 +0000 (UTC)
Received: from [10.3.113.164] (ovpn-113-164.phx2.redhat.com [10.3.113.164])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0FNVj0Z029983; Fri, 15 Jan 2016 18:31:46 -0500
To: Christophe Fergeau <cfergeau@redhat.com>, qemu-devel@nongnu.org
References: <1452605979-744-1-git-send-email-cfergeau@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <56998161.7080207@redhat.com>
Date: Fri, 15 Jan 2016 16:31:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1452605979-744-1-git-send-email-cfergeau@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="StmbkIbe8J19DrWLaOID2Wi297C5cXTaa"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] man: virtfs-proxy-helper:
 Fix 'capbilities' typo
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
X-List-Received-Date: Fri, 15 Jan 2016 23:31:53 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--StmbkIbe8J19DrWLaOID2Wi297C5cXTaa
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01/12/2016 06:39 AM, Christophe Fergeau wrote:
> Signed-off-by: Christophe Fergeau <cfergeau@redhat.com>
> ---
>  fsdev/virtfs-proxy-helper.texi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/fsdev/virtfs-proxy-helper.texi b/fsdev/virtfs-proxy-helper=
=2Etexi
> index e60e3b9..1b905a0 100644
> --- a/fsdev/virtfs-proxy-helper.texi
> +++ b/fsdev/virtfs-proxy-helper.texi
> @@ -29,7 +29,7 @@ driver sends filesystem request to proxy helper and r=
eceives the
>  response from it.
> =20
>  Proxy helper is designed so that it can drop the root privilege with
> -retaining capbilities needed for doing filesystem operations only.
> +retaining capabilities needed for doing filesystem operations only.

Still reads awkwardly; better might be:

The proxy helper is designed so that it can drop root privileges except
for the capabilities needed for doing filesystem operations.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--StmbkIbe8J19DrWLaOID2Wi297C5cXTaa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWmYFhAAoJEKeha0olJ0NqYgwH/0CFu7JPRtvYP4udC8LS+PAi
IoyZETCOSDAw/CgU0pioGNDReFAGpb4SmXJpfqIM7L8PL+gBhWNIFqLb8prggD/E
VeQS3sWWRtz8VOJYmS9C21AtsLpMfpzrNBb5Hkj7xl+IgUvp0AyykRm0b2MvwY7M
bTxTdfFVpxPpOYYL1cusAW8vs9o3LQLaKy9QKi3D5X624csuJtuAr4YDtNA4Mxam
wVS9QSP8488AawzYiVMi8Ae1rq3/N/jyrOwH/ewGb28Fo1VMmq5u38qz2a16QT+L
TiYfY0PsSp9VTv+ylp2/GZfqG+ErMTvZn1hdM7Eq1QqegRFc0thVM6pYOHg3Kyo=
=HgnJ
-----END PGP SIGNATURE-----

--StmbkIbe8J19DrWLaOID2Wi297C5cXTaa--

