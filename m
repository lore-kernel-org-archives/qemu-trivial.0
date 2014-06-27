Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X0Ug7-0001B6-85
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jun 2014 07:50:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1X0Ug0-0001Am-4s
	for qemu-trivial@nongnu.org; Fri, 27 Jun 2014 07:50:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1X0Uft-0007W2-Tr
	for qemu-trivial@nongnu.org; Fri, 27 Jun 2014 07:50:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:28851)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1X0Uft-0007Vw-FR; Fri, 27 Jun 2014 07:50:37 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s5RBoYDJ012230
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 27 Jun 2014 07:50:34 -0400
Received: from localhost (dhcp-64-106.muc.redhat.com [10.32.64.106])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s5RBoX5N007367; Fri, 27 Jun 2014 07:50:33 -0400
Date: Fri, 27 Jun 2014 13:50:32 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20140627115032.GN12061@stefanha-thinkpad.muc.redhat.com>
References: <53A84797.9040304@gmail.com>
	<20140624104614.GD3458@noname.redhat.com>
	<87d2dywoyn.fsf@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b/Q3JWIUAuLE0ZFy"
Content-Disposition: inline
In-Reply-To: <87d2dywoyn.fsf@blackfin.pond.sub.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Kevin Wolf <kwolf@redhat.com>, famz@redhat.com,
	Chen Gang <gang.chen.5i5j@gmail.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org, mreitz@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial v2] block.c: Add
 return value for bdrv_append_temp_snapshot() to avoid incorrect failure
 processing issue
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
X-List-Received-Date: Fri, 27 Jun 2014 11:50:50 -0000


--b/Q3JWIUAuLE0ZFy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2014 at 01:01:52PM +0200, Markus Armbruster wrote:
> Kevin Wolf <kwolf@redhat.com> writes:
>=20
> > Am 23.06.2014 um 17:28 hat Chen Gang geschrieben:
> >> When failure occurs, 'ret' need be set, or may return 0 to indicate su=
ccess.
> >> And error_propagate() also need be called only one time within a funct=
ion.
> >>=20
> >> It is abnormal to prevent bdrv_append_temp_snapshot() return value but=
 still
> >> set errp when error occurs -- although it contents return value intern=
ally.
> >>=20
> >> So let bdrv_append_temp_snapshot() internal return value outside, and =
let
> >> all things normal, then fix the issue too.
> >>=20
> >> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> >
> > What does this fix?
>=20
> It fixes the return value of bdrv_open() when
> bdrv_append_temp_snapshot() fails.  Before this patch, it returns a
> positive value, which is wrong.  After the patch, it returns the
> negative error code bdrv_append_temp_snapshot() now returns.

Exactly.  I asked for the -errno return because otherwise bdrv_open()
would have no accurate errno.

Stefan

--b/Q3JWIUAuLE0ZFy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJTrVqIAAoJEJykq7OBq3PIXmEIAMIdxsEpHEj3m/HicDIbxqlr
mdnEk95JKi5N4EFFfrhbbifRr/JHR/Fs2dIoxoZbvWAzu83ZqhbGTe7c4EZx/BDc
TpAEXHjIYpD1fN2yaptoBGqeHQxzX2qxQQskzy9IiLWavuFiv97nLK6X8nMalHJ+
dc48gbYhjCYZxrjuGkVobL0Du6SpXMneTgsMbP3rlO87rfiED/gubxu5bXWlhEjH
5sjoLUx6bauQ94Q4NyrxN9o+8x30qjBH3NslZT3FIu1p4IkGpLG5T25fCBKQi3zL
4WhZUr3NZED9MwvGhuOWzOo7zLehJ0MQswI+v1VLz845WlTl1bIMvju0ZxfoHIg=
=qFJz
-----END PGP SIGNATURE-----

--b/Q3JWIUAuLE0ZFy--

