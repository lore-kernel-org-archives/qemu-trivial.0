Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZxFkL-0004wy-5g
	for mharc-qemu-trivial@gnu.org; Fri, 13 Nov 2015 09:54:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZxFkF-0004nQ-32
	for qemu-trivial@nongnu.org; Fri, 13 Nov 2015 09:54:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZxFkE-0004Xu-35
	for qemu-trivial@nongnu.org; Fri, 13 Nov 2015 09:54:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53516)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ZxFk8-0004VX-1I; Fri, 13 Nov 2015 09:54:24 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 51038692;
	Fri, 13 Nov 2015 14:54:23 +0000 (UTC)
Received: from [10.3.113.115] (ovpn-113-115.phx2.redhat.com [10.3.113.115])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tADEsMws001851; Fri, 13 Nov 2015 09:54:22 -0500
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1447419494-10670-1-git-send-email-pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <5645F999.6040509@redhat.com>
Date: Fri, 13 Nov 2015 07:54:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447419494-10670-1-git-send-email-pbonzini@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="2oBS7bOKND8P7OEcqBM2oGHukD4KRg8M3"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net: convert qemu_log to
	error_report
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
X-List-Received-Date: Fri, 13 Nov 2015 14:54:35 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2oBS7bOKND8P7OEcqBM2oGHukD4KRg8M3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/13/2015 05:58 AM, Paolo Bonzini wrote:
> Ensure that the error is printed with the proper timestamp.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  net/dump.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/net/dump.c b/net/dump.c
> index dd0555f..ab71ffc 100644
> --- a/net/dump.c
> +++ b/net/dump.c
> @@ -84,7 +84,7 @@ static ssize_t dump_receive_iov(DumpState *s, const s=
truct iovec *iov, int cnt)
>      cnt =3D iov_copy(&dumpiov[1], cnt, iov, cnt, 0, caplen);
> =20
>      if (writev(s->fd, dumpiov, cnt + 1) !=3D sizeof(hdr) + caplen) {
> -        qemu_log("-net dump write error - stop dump\n");
> +        error_report("-net dump write error - stop dump");
>          close(s->fd);
>          s->fd =3D -1;
>      }
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--2oBS7bOKND8P7OEcqBM2oGHukD4KRg8M3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWRfmaAAoJEKeha0olJ0Nq+uEH/iF2/IRj6FUAoxk+IsC2k0ec
PAjioBeNHK/sTCupmgGZPa4FbMifnYvkFNndBGnE1QUitYvh3By7BW1TKMpLlKEp
C/bvF2HeY8G2enhxuUk+ivJo55X7YfbaYMxes68ezSj3rooAwfggt5yrStOhPS85
YGdIdy1M/lutTJWCBNE0oodyuBoIgl411iEnj2SQaarqPzO3E3tBGUWG0LBccxPa
qbVs1NpUo+DXbNLellEKWZJQlw2HrhFlOT/yfTCx3UvUs5iZObX11O+6qcbBkQMJ
CYKG45vo4KWotsYPpbQYM77H/pow5DW5cP/sdquA7j+8JPovt3O0u++irDIjDEo=
=uiYd
-----END PGP SIGNATURE-----

--2oBS7bOKND8P7OEcqBM2oGHukD4KRg8M3--

