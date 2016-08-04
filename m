Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bVHow-0005MV-PU
	for mharc-qemu-trivial@gnu.org; Thu, 04 Aug 2016 08:32:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1bVHou-0005L7-6m
	for qemu-trivial@nongnu.org; Thu, 04 Aug 2016 08:32:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1bVHot-0000HB-4o
	for qemu-trivial@nongnu.org; Thu, 04 Aug 2016 08:32:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52062)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1bVHol-0000F2-OJ; Thu, 04 Aug 2016 08:32:07 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6CF4C80085;
	Thu,  4 Aug 2016 12:32:06 +0000 (UTC)
Received: from localhost (ovpn-112-50.ams2.redhat.com [10.36.112.50])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u74CW49M018516; Thu, 4 Aug 2016 08:32:05 -0400
Date: Thu, 4 Aug 2016 13:32:04 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
Cc: qemu devel <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>
Message-ID: <20160804123204.GM14185@stefanha-x1.localdomain>
References: <1470214147-32560-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lbQeYSs6J2ITmUo7"
Content-Disposition: inline
In-Reply-To: <1470214147-32560-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.6.2 (2016-07-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 04 Aug 2016 12:32:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] virtio-blk: rename virtio_device_info to
 virtio_blk_info
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
X-List-Received-Date: Thu, 04 Aug 2016 12:32:17 -0000


--lbQeYSs6J2ITmUo7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 03, 2016 at 04:49:07PM +0800, Changlong Xie wrote:
> The old one is confusing with @virtio_device_info in virtio.c,
> so make it more appropriate.
>=20
> Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
> ---
>  hw/block/virtio-blk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to my block-next tree:
https://github.com/stefanha/qemu/commits/block-next

Stefan

--lbQeYSs6J2ITmUo7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJXozXEAAoJEJykq7OBq3PIeB0H/36mkF6FNsfrrMjXg+xouAzx
g8EUj76V7yw3srI07o/GgjmSF6c9aebu+juMPipPrTqF2YAtgw/zuv05vxqpVDlc
2BxSqWe1A3CrfHV+IV3TFrX0CXY//Q5z/IacEuXqgNg2XKNrTyhBL16Nq9lb3C7V
hJwKoA/Ze9Vx2/ZgZAxw0CR1T/QE6yTszxAdCRaS75Y5qbXsYt/CRzr0lhO1B+WS
xKekzI6j8YCir9M90o7/IesjzyiVplyxcjTVkJvzz4ifScucNuiZOWd04myMS2TX
aEVBSgaFmkUdp3VXdAwnuSU1zYAhoEDoCSZcMWMH5mkZpUbYRBRdGGxain2XqYc=
=ZFcv
-----END PGP SIGNATURE-----

--lbQeYSs6J2ITmUo7--

