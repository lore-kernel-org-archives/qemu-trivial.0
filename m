Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gee3K-0007qu-C2
	for mharc-qemu-trivial@gnu.org; Wed, 02 Jan 2019 05:47:10 -0500
Received: from eggs.gnu.org ([208.118.235.92]:41273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gee3I-0007on-MZ
	for qemu-trivial@nongnu.org; Wed, 02 Jan 2019 05:47:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gee3H-0005CK-WC
	for qemu-trivial@nongnu.org; Wed, 02 Jan 2019 05:47:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37322)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gee3C-00058e-CH; Wed, 02 Jan 2019 05:47:02 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 76CA3C049DC1;
	Wed,  2 Jan 2019 10:47:01 +0000 (UTC)
Received: from localhost (ovpn-116-137.ams2.redhat.com [10.36.116.137])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F270A60C66;
	Wed,  2 Jan 2019 10:47:00 +0000 (UTC)
Date: Wed, 2 Jan 2019 10:46:59 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: yuchenlin <npes87184@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20190102104659.GG24009@stefanha-x1.localdomain>
References: <20181221135803.9583-1-npes87184@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xjyYRNSh/RebjC6o"
Content-Disposition: inline
In-Reply-To: <20181221135803.9583-1-npes87184@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 02 Jan 2019 10:47:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] dmg: fix binary search
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
X-List-Received-Date: Wed, 02 Jan 2019 10:47:09 -0000


--xjyYRNSh/RebjC6o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 21, 2018 at 09:58:03PM +0800, yuchenlin wrote:
> There is a possible hang in original binary searsh implemtation. That is
> if chunk1 =3D 4, chunk2 =3D 5, chunk3 =3D 4, and we go else case.
>=20
> The chunk1 will be still 4, and so on.
>=20
> Signed-off-by: yuchenlin <npes87184@gmail.com>
> ---
>  block/dmg.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Do you have an example dmg file that triggers this bug?

> diff --git a/block/dmg.c b/block/dmg.c
> index 50e91aef6d..0e05702f5d 100644
> --- a/block/dmg.c
> +++ b/block/dmg.c
> @@ -572,14 +572,14 @@ static inline uint32_t search_chunk(BDRVDMGState *s=
, uint64_t sector_num)
>  {
>      /* binary search */
>      uint32_t chunk1 =3D 0, chunk2 =3D s->n_chunks, chunk3;
> -    while (chunk1 !=3D chunk2) {
> +    while (chunk1 <=3D chunk2) {
>          chunk3 =3D (chunk1 + chunk2) / 2;
>          if (s->sectors[chunk3] > sector_num) {
> -            chunk2 =3D chunk3;
> +            chunk2 =3D chunk3 - 1;

What if chunk1 =3D 0 and chunk2 =3D 1?  chunk3 =3D 0 and the new chunk2 val=
ue
would be 0xffffffff so the loop continues with out-of-bounds sectors[]
accesses!

--xjyYRNSh/RebjC6o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcLJajAAoJEJykq7OBq3PIJw4H/Rm/gU4yon7+M0pl4VuikjjH
K8DAKBg81jx8k7MJ9ps5YYEBruRUzbW3XszcuF8GW4JsXZdLCm61NuPwGsQeyL8r
CgetPXdolvE5DUvyE7OtGZLhz5jlAn4jIc3AB5arwAdM75jvWmXR1SA9CzYAE1X3
DozqOlxjqc2W0ld/a15tDaTCUpmnRf3DnxuwE8ukNyl7DmnbcHs7WP+Za/swQX6C
r4GhtK0GUGT60X+/Gs8dQjxIfKR7Y8FXT5Yr2A8zlflamLXE2QDkuoXTozgJK8z1
1FebUJaEy47r4N9vNQf1ZGE/GnAdFUkNxrz0hFutEMSSz1cjdQUZlUXtolzoG6c=
=Oskr
-----END PGP SIGNATURE-----

--xjyYRNSh/RebjC6o--

