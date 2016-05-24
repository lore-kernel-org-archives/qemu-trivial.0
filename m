Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b5LUG-0004vW-7M
	for mharc-qemu-trivial@gnu.org; Tue, 24 May 2016 19:11:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b5LUD-0004th-Nj
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 19:11:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b5LUC-0006ax-Fh
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 19:11:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52175)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1b5LU5-0006Xz-Eq; Tue, 24 May 2016 19:11:33 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EADA67F370;
	Tue, 24 May 2016 23:11:31 +0000 (UTC)
Received: from [10.3.116.141] (ovpn-116-141.phx2.redhat.com [10.3.116.141])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4ONBVT0011799; Tue, 24 May 2016 19:11:31 -0400
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <1464091153-11057-1-git-send-email-berto@igalia.com>
Cc: qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <5744DFA3.1070806@redhat.com>
Date: Tue, 24 May 2016 17:11:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1464091153-11057-1-git-send-email-berto@igalia.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Qw6DbW1UQc1iMcUw2xxqPajDC6TvltTsA"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 24 May 2016 23:11:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] docs: Fix a couple of typos
 in throttle.txt
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
X-List-Received-Date: Tue, 24 May 2016 23:11:42 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Qw6DbW1UQc1iMcUw2xxqPajDC6TvltTsA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/24/2016 05:59 AM, Alberto Garcia wrote:
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>  docs/throttle.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/docs/throttle.txt b/docs/throttle.txt
> index 06ed9b3..b4431f6 100644
> --- a/docs/throttle.txt
> +++ b/docs/throttle.txt
> @@ -39,7 +39,7 @@ the parameters for both cases:
>  | throttling.bps-write  | bps_wr                |
>  |-----------------------+-----------------------|
> =20
> -It is possible to set limits for both IOPS and bps and the same time,
> +It is possible to set limits for both IOPS and bps at the same time,
>  and for each case we can decide whether to have separate read and
>  write limits or not, but note that if iops-total is set then neither
>  iops-read nor iops-write can be set. The same applies to bps-total and=

> @@ -235,7 +235,7 @@ consider the following values:
>    - Water leaks from the bucket at a rate of 100 IOPS.
>    - Water can be added to the bucket at a rate of 2000 IOPS.
>    - The size of the bucket is 2000 x 60 =3D 120000
> -  - If 'iops-total-max-length' is unset then the bucket size is 100.
> +  - If 'iops-total-max' is unset then the bucket size is 100.
> =20
>  The bucket is initially empty, therefore water can be added until it's=

>  full at a rate of 2000 IOPS (the burst rate). Once the bucket is full
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--Qw6DbW1UQc1iMcUw2xxqPajDC6TvltTsA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXRN+jAAoJEKeha0olJ0Nq6MUIAI93LJ7xOJpKzFftmCW/kmOU
hbo/iSvHFLB9QvUBCZGiiqUgvm1GoHjxGbOAhdjmM9jlWAfEz1zUqpErnVr2RYZV
dIrKTBhmWtIwvz1kV0+WFR5qn61LvlrYlq/4ex2qhdq8mfiunAe2nekHcVRmYgaI
1TC6pGVw3uq9JVmsHrjCuwGwgybQtsgrdJjgY6C3wkZq6bser7UUY/oq4tmPa58f
VjHj1vlzFOAk6TvMThJzjnCZvfbNGh1En5JfCReGBUq0aTVUyM84DG/LujqrY0FU
92Ql7nkrQ61iBTh23MP39eR5pabc8Z4i4YQFiRtuy7KHlen1n1ZXuWDw62GvOwk=
=5IAR
-----END PGP SIGNATURE-----

--Qw6DbW1UQc1iMcUw2xxqPajDC6TvltTsA--

