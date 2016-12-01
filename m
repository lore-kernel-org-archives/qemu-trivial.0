Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cCSnr-0004IM-IC
	for mharc-qemu-trivial@gnu.org; Thu, 01 Dec 2016 09:57:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cCSnp-0004GH-7f
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2016 09:57:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cCSno-0003L2-8U
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2016 09:57:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60030)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cCSni-0003HY-SX; Thu, 01 Dec 2016 09:57:31 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BC3D13A27C;
	Thu,  1 Dec 2016 14:57:29 +0000 (UTC)
Received: from [10.3.116.172] (ovpn-116-172.phx2.redhat.com [10.3.116.172])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uB1EvRsO004024; Thu, 1 Dec 2016 09:57:27 -0500
To: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>,
	qemu devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
References: <1480575357-25056-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>
Cc: Stefan Weil <sw@weilnetz.de>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <a1593129-ddb9-8e74-5865-b1e8400c991d@redhat.com>
Date: Thu, 1 Dec 2016 08:57:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480575357-25056-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Hf3sGJWKmA3QJ6ArghfesfR7ge5baQlPm"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 01 Dec 2016 14:57:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for-2.8] docs: Fix description of the
 sentence
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
X-List-Received-Date: Thu, 01 Dec 2016 14:57:38 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Hf3sGJWKmA3QJ6ArghfesfR7ge5baQlPm
Content-Type: multipart/mixed; boundary="LNlGS2VUMhpETDqsG0Lap39CBT4CsffLF";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>,
 qemu devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Cc: Stefan Weil <sw@weilnetz.de>
Message-ID: <a1593129-ddb9-8e74-5865-b1e8400c991d@redhat.com>
Subject: Re: [PATCH for-2.8] docs: Fix description of the sentence
References: <1480575357-25056-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>
In-Reply-To: <1480575357-25056-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>

--LNlGS2VUMhpETDqsG0Lap39CBT4CsffLF
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/01/2016 12:55 AM, Zhang Chen wrote:
> Say it in another way to make it easier to understand.
>=20
> Signed-off-by: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>

I guess that's because I suggested the replacement text to use, even
though I didn't write the patch.

At any rate, since this is doc-only, it's safe for inclusion in 2.8, if
the maintainer wants to send a last-minute pull request (but if it
misses the release, that's okay too)

> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  docs/colo-proxy.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/docs/colo-proxy.txt b/docs/colo-proxy.txt
> index 76767cb..c4941de 100644
> --- a/docs/colo-proxy.txt
> +++ b/docs/colo-proxy.txt
> @@ -158,7 +158,9 @@ secondary.
> =20
>  =3D=3D Usage =3D=3D
> =20
> -Here, we use demo ip and port discribe more clearly.
> +Here is an example using demonstration IP and port addresses to more
> +clearly describe the usage.
> +
>  Primary(ip:3.3.3.3):
>  -netdev tap,id=3Dhn0,vhost=3Doff,script=3D/etc/qemu-ifup,downscript=3D=
/etc/qemu-ifdown
>  -device e1000,id=3De0,netdev=3Dhn0,mac=3D52:a4:00:12:78:66
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--LNlGS2VUMhpETDqsG0Lap39CBT4CsffLF--

--Hf3sGJWKmA3QJ6ArghfesfR7ge5baQlPm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYQDpXAAoJEKeha0olJ0NqXxsH/RLXewDJBMS4LlJF6CNMX/F/
2Fn2OZbsSTCo7Cw0Me6G8/GQ8L7/1ad7XbKZquN6mutjowfdI7SEmvvIY1UEnyMv
dNDlR1WSrqkX2Oat4ivj4tF8m/O/ZGZBYdN6cLdpHfLJ7CBmoAuvckeVt5BIGVWB
R+PKTZIAPDUVDk8nDf71AujErJ840kOCKUfCZJt3Bdi+XjZUbBl9NrA5AnMqdN5p
B3+AL6TnNdRcb+ccs5whNr08cdkI+/1Mua62l6SPmnNhyffmV/k9WJEGPeSslaGO
pBYiPBU6QRGY/P4SY+iLFYlqi+O/3XB4SVUkce4tGPKE2yz3ZxWfcfu+Qtw/8Ho=
=1gQi
-----END PGP SIGNATURE-----

--Hf3sGJWKmA3QJ6ArghfesfR7ge5baQlPm--

