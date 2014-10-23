Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhCR1-0007QL-RE
	for mharc-qemu-trivial@gnu.org; Thu, 23 Oct 2014 03:03:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1XhCQw-0007LC-6P
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 03:03:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1XhCQs-000167-1E
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 03:03:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48600)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1XhCQj-000147-BW; Thu, 23 Oct 2014 03:03:29 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9N73ROJ027091
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 23 Oct 2014 03:03:27 -0400
Received: from noname.redhat.com (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	SMTP id s9N73PAA009384; Thu, 23 Oct 2014 03:03:25 -0400
Date: Thu, 23 Oct 2014 09:03:25 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20141023070325.GA3522@noname.redhat.com>
References: <201410211604116199416@sangfor.com> <5446265E.306@redhat.com>
	<54482D38.5080904@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline
In-Reply-To: <54482D38.5080904@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Zhang Haoyu <zhanghy@sangfor.com>,
	qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
	Max Reitz <mreitz@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] snapshot: use local
 variable to bdrv_pwrite_sync L1 table
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
X-List-Received-Date: Thu, 23 Oct 2014 07:03:46 -0000


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 23.10.2014 um 00:18 hat Eric Blake geschrieben:
> On 10/21/2014 03:24 AM, Max Reitz wrote:
> > On 2014-10-21 at 10:04, Zhang Haoyu wrote:
> >> Use local variable to bdrv_pwrite_sync L1 table,
> >> needless to make conversion of cached L1 table between
> >> big-endian and host style.
> >>
> >> Signed-off-by: Zhang Haoyu <zhanghy@sangfor.com>
> >> ---
> >>   block/qcow2-refcount.c | 22 +++++++---------------
> >>   1 file changed, 7 insertions(+), 15 deletions(-)
> >>
>=20
> I know we're up to v5 and that Max already took it into his branch, but...
>=20
>=20
> >>       l1_size2 =3D l1_size * sizeof(uint64_t);
> >> +    l1_table =3D g_try_malloc0(align_offset(l1_size2, 512));
> >=20
> > I wanted to propose using qemu_try_blockalign(), but since it'd require
> > a memset() afterwards, it gets rather ugly.
>=20
> Not after this recent patch:
>=20
> https://lists.gnu.org/archive/html/qemu-devel/2014-10/msg02499.html

We can switch to qemu_try_blockalign0() in a follow-up patch.

But this is far from being a fast path, so there is very little to gain
anyway.

Kevin

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJUSKg8AAoJEH8JsnLIjy/WPgMP/0/EqgnHTY0zGEg9LmUBwjkj
0AqxzZQf/KDFY2w9acLntcnYLjf2CI4Hu8WZG0ebBYYo+tYQ6g2P0DeULJTj109k
ZvFwOoNIlr+tHpL8YQDH7fqleL12P6Hj3lz+3Sc86saSOkJRVjeXdJ+lEIlOPUzi
aYtd+uGsBWeyTjvWAe8Q6f9DJJaOdxpjJrmyjK0E8Izna7S4TvYN7clRwo5syMYX
IIbU1akBI4mnQ1dXWTXcDye9y4z5a5GuT+SjIAH5wG2/5560vwDp91lWJxxfNGuH
a8AXTS3jrhUS1QFcq28kcqvB9ICsTa3kv8TytW6KFJ7ZhG2lhVj1qOwCq78kRqIm
31zmC+1HBj+3SfvE4r/VOpRrleuFICwgKKx/OsnuSSSeZWEMV76/TQSPyahm2pXQ
gwhQmKomOHjy12KC+nYMBYRgbiGbAInJKQe2iXUj9CyKxOSJxdHsddHPc5kmMMPO
frDNRRcxtYjyyRqXHaNzdKf2sTu+EqC+uL/Gi/+TtXFbYPE/AManioQMKrQRyuD4
RTVKL2c39w/eERXWaT9yIa9e+gKjXDxd6odHk91hKF49YK0t8DXn9f9exSVez3dh
2JkPF+Fp8/jAg6fmaH5GxXqGeAB+KkMSg6q37OJoyF5XFATnr7XhFGpz2Sc6xvr/
2ezHGPU+WoG4KeAJXO8D
=Acxq
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--

