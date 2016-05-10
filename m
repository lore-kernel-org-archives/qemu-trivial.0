Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b0EMY-0003V3-Uo
	for mharc-qemu-trivial@gnu.org; Tue, 10 May 2016 16:34:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b0EMU-0003NF-FE
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 16:34:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b0EMR-0000Uf-4Q
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 16:34:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43381)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1b0EMH-0000TG-8T; Tue, 10 May 2016 16:34:21 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B245F62667;
	Tue, 10 May 2016 20:34:19 +0000 (UTC)
Received: from [10.3.113.79] (ovpn-113-79.phx2.redhat.com [10.3.113.79])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4AKYJHo019012; Tue, 10 May 2016 16:34:19 -0400
To: Quentin Casasnovas <quentin.casasnovas@oracle.com>,
	qemu-devel <qemu-devel@nongnu.org>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
	qemu-stable@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <573245CA.1030104@redhat.com>
Date: Tue, 10 May 2016 14:34:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="FTNDvrTBBrjM5jcj1mOsOSLhnkTx9MuKK"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 10 May 2016 20:34:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] nbd: fix trim/discard
 commands with a length bigger than NBD_MAX_BUFFER_SIZE
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
X-List-Received-Date: Tue, 10 May 2016 20:34:36 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FTNDvrTBBrjM5jcj1mOsOSLhnkTx9MuKK
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/06/2016 02:45 AM, Quentin Casasnovas wrote:
> When running fstrim on a filesystem mounted through qemu-nbd with
> --discard=3Don, fstrim would fail with I/O errors:
>=20
>   $ fstrim /k/spl/ice/
>   fstrim: /k/spl/ice/: FITRIM ioctl failed: Input/output error
>=20
> and qemu-nbd was spitting these:
>=20
>   nbd.c:nbd_co_receive_request():L1232: len (94621696) is larger than m=
ax len (33554432)

Your patch duplicates what is already present in qemu:

commit eb38c3b67018ff8069e4f674a28661931a8a3e4f
Author: Paolo Bonzini <pbonzini@redhat.com>
Date:   Thu Jan 7 14:32:42 2016 +0100

    nbd-server: do not check request length except for reads and writes

    Only reads and writes need to allocate memory correspondent to the
    request length.  Other requests can be sent to the storage without
    allocating any memory, and thus any request length is acceptable.

    Reported-by: Sitsofe Wheeler <sitsofe@yahoo.com>
    Cc: qemu-block@nongnu.org
    Reviewed-by: Max Reitz <mreitz@redhat.com>
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

For the purposes of qemu-stable, it's better to backport the existing
patch than to write a new version of it.

It also helps to state what version of qemu you were testing, as it is
obviously not the (soon-to-be-released) version 2.6 which already has
the fix.

>  nbd.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/nbd.c b/nbd.c
> index b3d9654..e733669 100644
> --- a/nbd.c
> +++ b/nbd.c
> @@ -1209,6 +1209,11 @@ static ssize_t nbd_co_send_reply(NBDRequest *req=
, struct nbd_reply *reply,
>      return rc;
>  }
> =20
> +static bool nbd_should_check_request_size(const struct nbd_request *re=
quest)
> +{
> +        return (request->type & NBD_CMD_MASK_COMMAND) !=3D NBD_CMD_TRI=
M;
> +}
> +
>  static ssize_t nbd_co_receive_request(NBDRequest *req, struct nbd_requ=
est *request)
>  {
>      NBDClient *client =3D req->client;
> @@ -1227,7 +1232,8 @@ static ssize_t nbd_co_receive_request(NBDRequest =
*req, struct nbd_request *reque
>          goto out;
>      }
> =20
> -    if (request->len > NBD_MAX_BUFFER_SIZE) {
> +    if (nbd_should_check_request_size(request) &&
> +        request->len > NBD_MAX_BUFFER_SIZE) {
>          LOG("len (%u) is larger than max len (%u)",
>              request->len, NBD_MAX_BUFFER_SIZE);
>          rc =3D -EINVAL;
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--FTNDvrTBBrjM5jcj1mOsOSLhnkTx9MuKK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXMkXKAAoJEKeha0olJ0NqhS4H/jwuYjfF8JMxnJFYOmpuERHD
avCMWK+hn4Bbd/Bb0+umlwo4pb6VrlXsnxGXzRbHohfLMHkpOutNF5B/eI2Unwbm
poryGXieaGc3aUAA0LHHM86oE5scMfgO2uUb6gxzJcTiawhQISIDE9AI5L9dfbJt
YOi3EX5CYla7GMXiapt9dNQUzhGEzu9NbCBTeNMKiuQmddkYe2vjEiNnPqwp0J4m
LIHaRjX5XjTNzwHdNkfFKxllnyliaxt+w6duQ/dNCrl++hoFgWw2LM8sDXGpkyA1
ELUNQUKKwCFu+tH6Wk3XtFXrbY1Q9IXMuBA+agyBkWV2uteJpieUadtCy3K9obQ=
=oq6P
-----END PGP SIGNATURE-----

--FTNDvrTBBrjM5jcj1mOsOSLhnkTx9MuKK--

