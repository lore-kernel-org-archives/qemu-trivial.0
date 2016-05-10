Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b08EK-0005He-P2
	for mharc-qemu-trivial@gnu.org; Tue, 10 May 2016 10:01:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b08ED-00053u-Ig
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 10:01:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b08EB-00054X-Oo
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 10:01:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59550)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1b08De-0004vi-Q2; Tue, 10 May 2016 10:01:03 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A279D83F47;
	Tue, 10 May 2016 14:01:01 +0000 (UTC)
Received: from [10.3.113.79] (ovpn-113-79.phx2.redhat.com [10.3.113.79])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4AE10MN007977; Tue, 10 May 2016 10:01:00 -0400
To: Quentin Casasnovas <quentin.casasnovas@oracle.com>,
	qemu-devel <qemu-devel@nongnu.org>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
	qemu-stable@nongnu.org,
	"nbd-general@lists.sourceforge.net" <nbd-general@lists.sourceforge.net>,
	qemu block <qemu-block@nongnu.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
X-Enigmail-Draft-Status: N1110
Organization: Red Hat, Inc.
Message-ID: <5731E99C.3000108@redhat.com>
Date: Tue, 10 May 2016 08:01:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="btlhFRkI2bGlL6boM8Fc9QXRj2n8Xm9MS"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 10 May 2016 14:01:02 +0000 (UTC)
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
X-List-Received-Date: Tue, 10 May 2016 14:01:42 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--btlhFRkI2bGlL6boM8Fc9QXRj2n8Xm9MS
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

[adding nbd-devel, qemu-block]

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
>=20

>=20
> The length of the request seems huge but this is really just the filesy=
stem
> telling the block device driver that "this length should be trimmed", a=
nd,
> unlike for a NBD_CMD_READ or NBD_CMD_WRITE, we'll not try to read/write=

> that amount of data from/to the NBD socket.  It is thus safe to remove =
the
> length check for a NBD_CMD_TRIM.
>=20
> I've confirmed this with both the protocol documentation at:
>=20
>  https://github.com/yoe/nbd/blob/master/doc/proto.md

Hmm. The current wording of the experimental block size additions does
NOT allow the client to send a NBD_CMD_TRIM with a size larger than the
maximum NBD_CMD_WRITE:
https://github.com/yoe/nbd/blob/extension-info/doc/proto.md#block-size-co=
nstraints

Maybe we should revisit that in the spec, and/or advertise yet another
block size (since the maximum size for a trim and/or write_zeroes
request may indeed be different than the maximum size for a read/write).

But since the kernel is the one sending the large length request, and
since you are right that this is not a denial-of-service in the amount
of data being sent in a single NBD message, I definitely agree that qemu
would be wise as a quality-of-implementation to allow the larger size,
for maximum interoperability, even if it exceeds advertised limits (that
is, when no limits are advertised, we should handle everything possible
if it is not so large as to be construed a denial-of-service, and
NBD_CMD_TRIM is not large; and when limits ARE advertised, a client that
violates limits is out of spec but we can still be liberal and respond
successfully to such a client rather than having to outright reject it).
 So I think this patch is headed in the right direction.

>=20
> and looking at the kernel side implementation of the nbd device
> (drivers/block/nbd.c) where it only sends the request header with no da=
ta
> for a NBD_CMD_TRIM.
>=20
> With this fix in, I am now able to run fstrim on my qcow2 images and ke=
ep
> them small (or at least keep their size proportional to the amount of d=
ata
> present on them).
>=20
> Signed-off-by: Quentin Casasnovas <quentin.casasnovas@oracle.com>
> CC: Paolo Bonzini <pbonzini@redhat.com>
> CC: <qemu-devel@nongnu.org>
> CC: <qemu-stable@nongnu.org>
> CC: <qemu-trivial@nongnu.org>

This is NOT trivial material and should not go in through that tree.
However, I concur that it qualifies for a backport on a stable branch.

> ---
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

I'd rather sort out the implications of this on the NBD protocol before
taking anything into qemu.  We've got time on our hand, so let's use it
to get this right.  (That, and I have several pending patches that
conflict with this as part of adding WRITE_ZEROES and INFO_BLOCK_SIZE
support, where it may be easier to resubmit this fix on top of my
pending patches).

>          LOG("len (%u) is larger than max len (%u)",
>              request->len, NBD_MAX_BUFFER_SIZE);
>          rc =3D -EINVAL;
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--btlhFRkI2bGlL6boM8Fc9QXRj2n8Xm9MS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXMemcAAoJEKeha0olJ0NqZY8IAJnUlLRyIyUDg9GNvN8iiKGG
oDJ6J7X5n2ofCYs75fon8blMcgavQ2fFy9R4cAY10u3BuTwaZ8Z5eSn45eT66xnn
rbOLduQ1LX+VBZkt4dq83Flr9eeNFN8zWOSlm6r7RhYx9OEZuBdlbNHYhwLocWUT
iz54IPlglgexgpghuZvJxuPcj7FqzJgDIZUBlTRaBpnz0cnxgcAWUdmcuJEDK9pP
txns/ktXwx+3VYkPRfYQ31yENt8OL3TGlUZNEcYCSUuIcnc0hf3I5L7rAB4p3JtD
VqAcK1GU/ooJ+5FRiTgVN5vT1C126oUmkdvK0DBtN2PRAm4vQn/fL7V0rHrwkbI=
=T5jO
-----END PGP SIGNATURE-----

--btlhFRkI2bGlL6boM8Fc9QXRj2n8Xm9MS--

