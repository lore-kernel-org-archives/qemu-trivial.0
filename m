Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cq8zW-00065z-GG
	for mharc-qemu-trivial@gnu.org; Mon, 20 Mar 2017 21:53:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cq8zT-00064T-Lh
	for qemu-trivial@nongnu.org; Mon, 20 Mar 2017 21:53:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cq8zS-0004Ya-OC
	for qemu-trivial@nongnu.org; Mon, 20 Mar 2017 21:53:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48584)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cq8zO-0004Wg-1Q; Mon, 20 Mar 2017 21:53:34 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B87918047A;
	Tue, 21 Mar 2017 01:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B87918047A
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com B87918047A
Received: from [10.10.121.124] (ovpn-121-124.rdu2.redhat.com [10.10.121.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0CE83183EE;
	Tue, 21 Mar 2017 01:53:31 +0000 (UTC)
To: wangguang <wang.guang55@zte.com.cn>, qemu-devel@nongnu.org,
	qemu-trivial <qemu-trivial@nongnu.org>
References: <1490060356096-474442.post@n7.nabble.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <0268b783-e9fb-8c16-8198-c0bb4e6ca9d3@redhat.com>
Date: Mon, 20 Mar 2017 20:53:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1490060356096-474442.post@n7.nabble.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="UFPeqJFR6ibu3mu7duNk91M6fXVjUjx60"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 21 Mar 2017 01:53:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5]COLO:Fix spell error in
 Colo doc
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
X-List-Received-Date: Tue, 21 Mar 2017 01:53:41 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UFPeqJFR6ibu3mu7duNk91M6fXVjUjx60
Content-Type: multipart/mixed; boundary="B0GRvrQ407AqiCHiKqoXFkOluiWkmfkFf";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: wangguang <wang.guang55@zte.com.cn>, qemu-devel@nongnu.org,
 qemu-trivial <qemu-trivial@nongnu.org>
Message-ID: <0268b783-e9fb-8c16-8198-c0bb4e6ca9d3@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v5]COLO:Fix spell error in Colo doc
References: <1490060356096-474442.post@n7.nabble.com>
In-Reply-To: <1490060356096-474442.post@n7.nabble.com>

--B0GRvrQ407AqiCHiKqoXFkOluiWkmfkFf
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/20/2017 08:39 PM, wangguang wrote:
> Subject: [PATCH]COLO:Fix spell error in Colo doc

I added qemu-trivial in v4; you should keep it in the loop.

Still missing a space after ':' in the subject line, and still the
awkward duplication of the subject line in the body of the commit message=
=2E

>=20
> This is an error in COLO-FT.txt.=20
> secondeary-disk0 should be secondary-disk0.=20
>=20
> Signed-off-by: Guang Wang <wang.guang55@zte.com.cn>

Since I gave R-b on v4, it's worth adding it here to save time to show
that no code has changed since that submission.  Otherwise, it's nice to
mention (after the --- separator) what changed from the previous version
to cause you to send the next revision.

At any rate,
Reviewed-by: Eric Blake <eblake@redhat.com>

> ---=20
>  docs/COLO-FT.txt | 2 +-=20
>  1 file changed, 1 insertion(+), 1 deletion(-)=20
>=20
> diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt=20
> index e289be2..bec7547 100644=20
> --- a/docs/COLO-FT.txt=20
> +++ b/docs/COLO-FT.txt=20
> @@ -139,7 +139,7 @@ Secondary:=20
>  { 'execute': 'nbd-server-start',=20
>    'arguments': {'addr': {'type': 'inet', 'data': {'host': 'xx.xx.xx.xx=
',
> 'port': '8889'} } }=20
>  }=20
> -{'execute': 'nbd-server-add', 'arguments': {'device': 'secondeary-disk=
0',
> 'writable': true } }=20
> +{'execute': 'nbd-server-add', 'arguments': {'device': 'secondary-disk0=
',
> 'writable': true } }=20
>  =20
>  Note:=20
>    a. The qmp command nbd-server-start and nbd-server-add must be run=20
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--B0GRvrQ407AqiCHiKqoXFkOluiWkmfkFf--

--UFPeqJFR6ibu3mu7duNk91M6fXVjUjx60
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJY0IeaAAoJEKeha0olJ0NqLEAIAKapqYMiyWqGhKoJCF7B7Eav
SLKyFd15EoSrrFMYJoqXCd+AAj5F7gAFMeee/+bfDcVTliJSGnpn77WU1CV59y0S
srSYpiCnC+uGN0ybP4tAuBjfc6Iq/Dmm2iAGohVgycp/0qoQ3Xvay1gLIJW1NKmm
Id11qNBwz+YIPhWz7oIZB13yxD8JqyVxnrF2T7z5zPlp5v59yzB/1avFMtOjvvd6
HGmXKGN8N8937ioYTQLizwRmeGIbfnlq9CVwq5m8yHltmrSuSgi63bZHjr5AVDJw
qlbZcvlnhkGgLFNjafGRRThZOVBJydBRnNNZzAUvuOli2SAHcAR0BaWXPYexnj8=
=S0tQ
-----END PGP SIGNATURE-----

--UFPeqJFR6ibu3mu7duNk91M6fXVjUjx60--

