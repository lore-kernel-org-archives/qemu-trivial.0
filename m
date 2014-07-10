Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X53Mn-0006xR-5q
	for mharc-qemu-trivial@gnu.org; Wed, 09 Jul 2014 21:41:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1X53Md-0006si-TC
	for qemu-trivial@nongnu.org; Wed, 09 Jul 2014 21:41:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1X53MZ-000796-Gn
	for qemu-trivial@nongnu.org; Wed, 09 Jul 2014 21:41:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:6826)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1X53MQ-00075Z-6c; Wed, 09 Jul 2014 21:41:22 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s6A1fId5003256
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 9 Jul 2014 21:41:18 -0400
Received: from [10.3.113.16] ([10.3.113.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s6A1fIus009175; Wed, 9 Jul 2014 21:41:18 -0400
Message-ID: <53BDEF3D.1000309@redhat.com>
Date: Wed, 09 Jul 2014 19:41:17 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <1404915288-604-1-git-send-email-kwolf@redhat.com>
In-Reply-To: <1404915288-604-1-git-send-email-kwolf@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="8HrVIsgVOeOeH8lMnVJrGd9629SSaDds7"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, hutao@cn.fujitsu.com, mst@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.1]
 test-string-output-visitor: Fix unterminated string
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
X-List-Received-Date: Thu, 10 Jul 2014 01:41:40 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8HrVIsgVOeOeH8lMnVJrGd9629SSaDds7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 07/09/2014 08:14 AM, Kevin Wolf wrote:
> Don't forget to add a terminating '\0' or the test case will be randoml=
y
> failing. The broken code was added in commit b4900c0e.

Sorry, but I prefer this solution better:
https://lists.gnu.org/archive/html/qemu-devel/2014-07/msg01595.html

>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  tests/test-string-output-visitor.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/test-string-output-visitor.c b/tests/test-string-out=
put-visitor.c
> index e89e43c..f2c427f 100644
> --- a/tests/test-string-output-visitor.c
> +++ b/tests/test-string-output-visitor.c
> @@ -201,11 +201,11 @@ static void test_visitor_out_enum(TestOutputVisit=
orData *data,
>          visit_type_EnumOne(data->ov, &i, "unused", &err);
>          g_assert(!err);
> =20
> -        len =3D strlen(EnumOne_lookup[i]) + 2;
> +        len =3D strlen(EnumOne_lookup[i]) + 3;
>          str_human =3D g_malloc0(len);
>          str_human[0] =3D '"';
>          strncpy(str_human + 1, EnumOne_lookup[i], strlen(EnumOne_looku=
p[i]));
> -        str_human[len - 1] =3D '"';
> +        str_human[len - 2] =3D '"';

Manually doing this when g_strdup_printf can do it as a one-liner is
just lunacy.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--8HrVIsgVOeOeH8lMnVJrGd9629SSaDds7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJTve89AAoJEKeha0olJ0NqtcMH/2vAA3SpD4kLeypZpTxUBB4d
n7oucJX6LaKLhj8T/9lK3hErXcJzOQW2GUFhUNNc9H+yCs2MI0KiQoUyn8nA0uLw
fFuvYQG/mgoMZvGyZXrIydQCbcEykpmfj9sSy41VfDE+h+qh3cubqPa9psb4JWSO
7iAa9jvJNeYJvojJMpkcZ+E5RrbC0m52mdJkYwi2I8enenihVpiDJeoshzUVFkIn
H9yPkxJFBhUBV1FqMebQWVjpuNrXVV6YhocOpHBHVxe2mnXcNLNexHU7GLiodDNR
sRY+ekWKYGc7L1e/u6BrakG7i9uUNmbSj2SIujHFqhS0fg3yR9jhxYu8tpTLBNU=
=idHC
-----END PGP SIGNATURE-----

--8HrVIsgVOeOeH8lMnVJrGd9629SSaDds7--

