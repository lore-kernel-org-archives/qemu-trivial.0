Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bzOLH-0002E1-BD
	for mharc-qemu-trivial@gnu.org; Wed, 26 Oct 2016 09:34:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bzOLB-00029k-Q8
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2016 09:34:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bzOL6-0000k6-K7
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2016 09:34:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40906)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1bzOKq-0000ft-PN; Wed, 26 Oct 2016 09:33:40 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B11A2C05A282;
	Wed, 26 Oct 2016 13:33:38 +0000 (UTC)
Received: from [10.3.116.106] (ovpn-116-106.phx2.redhat.com [10.3.116.106])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9QDXbHc011513; Wed, 26 Oct 2016 09:33:37 -0400
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1477466334-4078-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Cc: peter.maydell@linaro.org, gkurz@linux.vnet.ibm.com, armbru@redhat.com,
	mst@redhat.com
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <d95a35fa-df3c-0b0e-52bf-d4cc002bde8f@redhat.com>
Date: Wed, 26 Oct 2016 08:33:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1477466334-4078-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="rgX2Mm6W7ObI0o1nIoWvet8PssRKph3V9"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 26 Oct 2016 13:33:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] util/mmap-alloc: check
 parameter before using
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
X-List-Received-Date: Wed, 26 Oct 2016 13:34:06 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rgX2Mm6W7ObI0o1nIoWvet8PssRKph3V9
Content-Type: multipart/mixed; boundary="4apKEeR42nTFRE1lkEi1cKsAWNameCXMx";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: peter.maydell@linaro.org, gkurz@linux.vnet.ibm.com, armbru@redhat.com,
 mst@redhat.com
Message-ID: <d95a35fa-df3c-0b0e-52bf-d4cc002bde8f@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] util/mmap-alloc: check parameter before
 using
References: <1477466334-4078-1-git-send-email-caoj.fnst@cn.fujitsu.com>
In-Reply-To: <1477466334-4078-1-git-send-email-caoj.fnst@cn.fujitsu.com>

--4apKEeR42nTFRE1lkEi1cKsAWNameCXMx
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/26/2016 02:18 AM, Cao jin wrote:
> Also refactor some code hunk for readability
>=20
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  util/mmap-alloc.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
>=20
> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
> index 5a85aa3..92c123a 100644
> --- a/util/mmap-alloc.c
> +++ b/util/mmap-alloc.c
> @@ -41,6 +41,11 @@ size_t qemu_fd_getpagesize(int fd)
> =20
>  void *qemu_ram_mmap(int fd, size_t size, size_t align, bool shared)
>  {
> +    /* Make sure align is a power of 2 */
> +    assert(!(align & (align - 1)));

Better to spell this:

assert(is_power_of_2(align));

at which point the comment is redundant and can be omitted.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--4apKEeR42nTFRE1lkEi1cKsAWNameCXMx--

--rgX2Mm6W7ObI0o1nIoWvet8PssRKph3V9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYELCxAAoJEKeha0olJ0Nq4MYH/jGg4sBwUkmx1uulQAWkAuce
FM9vr2jtkMeU0QYni/1GmG7jUkhUgFYFqfLjVZasbHCXMuadBaOQZP1Kf2WmsXpH
rKOzhUIoMnbkEwJJ9hzixhRNbbiqVeEpfnTUIUYBovmKCmoWXzl9gKXy41zXgNng
JsXeCaMW970UQ4hZVjAqDfA+Oo3GtYDz15m8o1t2b1vPactHwCD9p0S6nNq1qsA6
M+IaSU4wcgX928Z/ZiLz0YGyI5hgklhmsAZTxGoEXF+bB4KT9kZgSMw24hkzbu7/
ItN4AGgcSqUhhfbSjBmeSXmaiY/lfFlpg2nZ4MbU/YpKXBQkRlSzKP9jt4BhfSc=
=ZrdN
-----END PGP SIGNATURE-----

--rgX2Mm6W7ObI0o1nIoWvet8PssRKph3V9--

