Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fT5zN-00006u-Mz
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jun 2018 09:39:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fT5zK-0008VX-N4
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 09:39:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fT5zJ-0006FS-V3
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 09:39:02 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50198 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fT5zF-0005zx-H7; Wed, 13 Jun 2018 09:38:57 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E588D4338;
	Wed, 13 Jun 2018 13:38:57 +0000 (UTC)
Received: from localhost (ovpn-117-110.ams2.redhat.com [10.36.117.110])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C127B1116704;
	Wed, 13 Jun 2018 13:38:56 +0000 (UTC)
Date: Wed, 13 Jun 2018 14:38:55 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Ben Warren <ben@skyportsystems.com>, zhang.zhanghailiang@huawei.com,
	Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org
Message-ID: <20180613133855.GN24528@stefanha-x1.localdomain>
References: <1528866321-23886-1-git-send-email-thuth@redhat.com>
	<1528866321-23886-4-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yK/6QRnH3Zanb0EF"
Content-Disposition: inline
In-Reply-To: <1528866321-23886-4-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 13 Jun 2018 13:38:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 13 Jun 2018 13:38:57 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH 3/4] qemu-options: Improve the
 documentation of '-accel' and '-machine accel=...'
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
X-List-Received-Date: Wed, 13 Jun 2018 13:39:04 -0000


--yK/6QRnH3Zanb0EF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 13, 2018 at 07:05:20AM +0200, Thomas Huth wrote:
> Instead of repeating the same text for both options, let's rather change
> the '-machine accel' documentation to point to the preferred '-accel' opt=
ion
> instead.
> And in the documenation of the -accel option, make it clear that you can
> use colons to specify multiple accelerators.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  qemu-options.hx | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--yK/6QRnH3Zanb0EF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbIR5uAAoJEJykq7OBq3PICDkH/3hsoMwaLqVnLNd5wKeZZ5wh
S7/H/LUvhexLs7VMhOMCOX6Z8eEOonr36VXyw4dVscmqY5ufIam9hw88yk2uypma
5ETbex5gQPS/osSlq/9ph8/wlXlnSc2P7bUHHmg9PmF1n4r8rT7v7LgXULT76qqi
fNDCmoJtpnZxaVNabbzNTX4voqaWTWJQ/4FdMKzM2NUQbt7p5QYYanNJqSsIt0fL
dgl+VjHcrHWQt561SVG+vAB7Cz0iNoPTxauG2WOxAYzwlSW9za+GT6o3iu0XDxiL
6hQhAjHfYi6BKmtbsCHSd1hTfWr6/79mAt0xgah1VTHa5glywplunfkllVx0Uew=
=opkH
-----END PGP SIGNATURE-----

--yK/6QRnH3Zanb0EF--

