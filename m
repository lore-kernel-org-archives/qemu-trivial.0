Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZwyXG-0001rZ-GX
	for mharc-qemu-trivial@gnu.org; Thu, 12 Nov 2015 15:31:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZwyXE-0001np-EF
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 15:31:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZwyXD-0004GG-1c
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 15:31:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38253)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ZwyX7-0004Eq-W9; Thu, 12 Nov 2015 15:31:50 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 9AACCC1C35CC;
	Thu, 12 Nov 2015 20:31:49 +0000 (UTC)
Received: from [10.3.113.115] (ovpn-113-115.phx2.redhat.com [10.3.113.115])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tACKVnrL010764; Thu, 12 Nov 2015 15:31:49 -0500
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <1447359664-25407-1-git-send-email-jsnow@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <5644F734.6020201@redhat.com>
Date: Thu, 12 Nov 2015 13:31:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447359664-25407-1-git-send-email-jsnow@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="MWbcmWlhmwCxmIqUkBwEeIQMxiNAwMFox"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests/.gitignore: ignore
	test-blockjob-txn
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
X-List-Received-Date: Thu, 12 Nov 2015 20:31:57 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MWbcmWlhmwCxmIqUkBwEeIQMxiNAwMFox
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/12/2015 01:21 PM, John Snow wrote:
> Reported-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/.gitignore | 1 +
>  1 file changed, 1 insertion(+)

My version of this same patch at least called out the commit that
introduced the problem :)
https://lists.gnu.org/archive/html/qemu-devel/2015-11/msg03142.html

>=20
> diff --git a/tests/.gitignore b/tests/.gitignore
> index e96f569..de5e793 100644
> --- a/tests/.gitignore
> +++ b/tests/.gitignore
> @@ -9,6 +9,7 @@ check-qom-proplist
>  rcutorture
>  test-aio
>  test-bitops
> +test-blockjob-txn
>  test-coroutine
>  test-crypto-cipher
>  test-crypto-hash
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--MWbcmWlhmwCxmIqUkBwEeIQMxiNAwMFox
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWRPc0AAoJEKeha0olJ0NqsCsH+wYZdpBZhHQnLO2wP0Iui5Uv
WQZVXef9CXUQnc4K37jPoGcetXqZqZFnWpiHiSqmgJxSZ7XZ7OGfrm//qgq6eCKc
CWrO7tdm9L7DfIire82MqBfjCFodX7asBCu9sHFhT6AcbLJ5ou0OCBbzcwwC50Yh
oBD/lD1glCLN1RgMk+X/8TbJsOZ7R3gbT0EPr0BqDHy9MPY+6lVhSb05r5oV71tp
8GU2c6Bn0sas0/DeRQETEH2JN8rU792ZPJX1kcYTY1MrXPX+JioaOnczGAtaw5GE
1KJvpTIi3SjTMHoQNTyFk9lRwbNwgkyMji1mBAyvXGQbfxsi4Kjg0jYhthWzOk0=
=u1Kg
-----END PGP SIGNATURE-----

--MWbcmWlhmwCxmIqUkBwEeIQMxiNAwMFox--

