Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gehDQ-0000HK-GK
	for mharc-qemu-trivial@gnu.org; Wed, 02 Jan 2019 09:09:48 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gehDO-0000FJ-Ml
	for qemu-trivial@nongnu.org; Wed, 02 Jan 2019 09:09:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gehDN-0005CR-UR
	for qemu-trivial@nongnu.org; Wed, 02 Jan 2019 09:09:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58354)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gehDG-0004FC-K1; Wed, 02 Jan 2019 09:09:38 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E0A46CD66C;
	Wed,  2 Jan 2019 14:09:37 +0000 (UTC)
Received: from localhost (ovpn-116-137.ams2.redhat.com [10.36.116.137])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6AF2F5C22E;
	Wed,  2 Jan 2019 14:09:37 +0000 (UTC)
Date: Wed, 2 Jan 2019 14:09:36 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Julio Faracco <jcfaracco@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, kwolf@redhat.com,
	mreitz@redhat.com, qemu-block@nongnu.org
Message-ID: <20190102140936.GT24009@stefanha-x1.localdomain>
References: <20181228145055.18039-1-jcfaracco@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ceuyUbi+oA5bUa/n"
Content-Disposition: inline
In-Reply-To: <20181228145055.18039-1-jcfaracco@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 02 Jan 2019 14:09:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] dmg: Fixing wrong dmg block type value
 for block terminator.
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
X-List-Received-Date: Wed, 02 Jan 2019 14:09:47 -0000


--ceuyUbi+oA5bUa/n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 28, 2018 at 12:50:55PM -0200, Julio Faracco wrote:
> This is a trivial patch to fix a wrong value for block terminator.
> The old value was 0x7fffffff which is wrong. It was not affecting the
> code because QEMU dmg block is not handling block terminator right now.
> Neverthless, it should be fixed.
>=20
> Signed-off-by: Julio Faracco <jcfaracco@gmail.com>
> ---
>  block/dmg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

--ceuyUbi+oA5bUa/n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcLMYgAAoJEJykq7OBq3PISnUIAIREEpoX4A1LE+QgN2ivsCUO
DsRuyzOVfOmJQ2vj255xL664ZW/9F3/GLGVthRIJ6oBN40vLH4d0ZhBNFmmb1dvU
Wk4ffsNHwxA+RoVjMrsSqKz9x1YtZlE+zatEKfX4pcmeL9O+KpzetoluW0q+0Dtm
NhpIWT4D6dTadtsaYs56gedMjKOb1EO/HsQdUS2YE4mCp6OFH+QHitTTcUL8OM6G
+Ip26+gaCTmhKRIMd/M0SFyr96W/QGMcaH4RTnoVH4oDUxeg8YL12/q0HAK2Ube4
v0M8WiXd/zQX8+cUL2R6QQPEUh7o/Eo2GMI6Afvr0KKTw4KNIM5OmbxnK2ZlYh0=
=MllY
-----END PGP SIGNATURE-----

--ceuyUbi+oA5bUa/n--

