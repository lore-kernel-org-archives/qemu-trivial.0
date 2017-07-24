Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZiTF-0003tW-Pg
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:52:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54675)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dZiTD-0003sD-Rm
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:52:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dZiTC-0002QJ-RA
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:52:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43926)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dZiT5-0002Lo-05; Mon, 24 Jul 2017 14:52:35 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D94C94A6E8;
	Mon, 24 Jul 2017 18:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D94C94A6E8
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com D94C94A6E8
Received: from [10.10.121.48] (ovpn-121-48.rdu2.redhat.com [10.10.121.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2431F69731;
	Mon, 24 Jul 2017 18:52:29 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-9-f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <ce86e2e7-1d11-c115-c4f1-b4b6a4180972@redhat.com>
Date: Mon, 24 Jul 2017 13:52:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170724182751.18261-9-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="vaOkS4dOu0JjMtvf25vQHg40CVgccpfwU"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 24 Jul 2017 18:52:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for 2.10 08/35] qcow2: fix null pointer
 dereference
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
X-List-Received-Date: Mon, 24 Jul 2017 18:52:45 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vaOkS4dOu0JjMtvf25vQHg40CVgccpfwU
Content-Type: multipart/mixed; boundary="uLbveSqgkR3EKMohU0xM3EE9q6SML5Ogu";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Message-ID: <ce86e2e7-1d11-c115-c4f1-b4b6a4180972@redhat.com>
Subject: Re: [PATCH for 2.10 08/35] qcow2: fix null pointer dereference
References: <20170724182751.18261-1-f4bug@amsat.org>
 <20170724182751.18261-9-f4bug@amsat.org>
In-Reply-To: <20170724182751.18261-9-f4bug@amsat.org>

--uLbveSqgkR3EKMohU0xM3EE9q6SML5Ogu
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/24/2017 01:27 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> It seems this assert() was somehow misplaced.
>=20
> block/qcow2-refcount.c:2193:42: warning: Array access (from variable 'o=
n_disk_reftable') results in a null pointer dereference
>         on_disk_reftable[refblock_index] =3D refblock_offset;
>         ~~~~~~~~~~~~~~~~                 ^
>=20
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  block/qcow2-refcount.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
> index c9b0dcb4f3..168fc32e7b 100644
> --- a/block/qcow2-refcount.c
> +++ b/block/qcow2-refcount.c
> @@ -2189,6 +2189,8 @@ write_refblocks:
>               * this will leak that range, but we can easily fix that b=
y running
>               * a leak-fixing check after this rebuild operation */
>              reftable_offset =3D -1;
> +        } else {
> +            assert(on_disk_reftable);
>          }
>          on_disk_reftable[refblock_index] =3D refblock_offset;
> =20
> @@ -2258,8 +2260,6 @@ write_refblocks:
>          goto write_refblocks;
>      }
> =20
> -    assert(on_disk_reftable);
> -
>      for (refblock_index =3D 0; refblock_index < reftable_size; refbloc=
k_index++) {
>          cpu_to_be64s(&on_disk_reftable[refblock_index]);
>      }
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--uLbveSqgkR3EKMohU0xM3EE9q6SML5Ogu--

--vaOkS4dOu0JjMtvf25vQHg40CVgccpfwU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAll2QecACgkQp6FrSiUn
Q2o56AgAm1hF8wJ6EKxP9LJLULiC7A1EpUybycWA1zEf5YmaTKaGLXydrM7BNU0w
+m0OrqHU/kHZV8gYFWPze8wBdmxVcktJsm89BEkUVqJ/5sAhM/JVaquXqfUOjWes
ZqJMMBoWshIAACdwSYgul9SuMxbkvzLyIMf9qZpXy/V78nSTZwJS9StSwWai5ZXE
B/2b7OWVzPOPh8XlS9W9nxs7FPQ1fg1Hdw57U9Emzg1zQwnabNUXl1bxpBP1h8Sc
W44GeL9hh2gynCODos/ImD+vQ/Y2vKsIWG4icF+EQjcrE1tM++avA4vaGwtJZLSx
5FLJgCMXz55DYeidk78x15K2Mp4KOg==
=26Ff
-----END PGP SIGNATURE-----

--vaOkS4dOu0JjMtvf25vQHg40CVgccpfwU--

