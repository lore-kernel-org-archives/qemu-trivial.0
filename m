Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7mPn-0007b9-K1
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jun 2015 11:16:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1Z7mPl-0007ZG-Vk
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 11:16:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1Z7mPk-0001ja-Sj
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 11:16:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50626)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1Z7mPV-0001XJ-88; Wed, 24 Jun 2015 11:16:21 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 3FD56B82C7;
	Wed, 24 Jun 2015 15:16:20 +0000 (UTC)
Received: from localhost (ovpn-112-73.ams2.redhat.com [10.36.112.73])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5OFGJRh014366; Wed, 24 Jun 2015 11:16:19 -0400
Date: Wed, 24 Jun 2015 16:16:18 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: arei.gonglei@huawei.com
Message-ID: <20150624151618.GF7454@stefanha-thinkpad.redhat.com>
References: <1435138164-11728-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="udcq9yAoWb9A4FsZ"
Content-Disposition: inline
In-Reply-To: <1435138164-11728-1-git-send-email-arei.gonglei@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] virito-blk: drop duplicate check
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
X-List-Received-Date: Wed, 24 Jun 2015 15:16:38 -0000


--udcq9yAoWb9A4FsZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2015 at 05:29:24PM +0800, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
>=20
> in_num =3D req->elem.in_num, and req->elem.in_num is
> checked in line 489, so the check about in_num variable
> is superflous, let's drop it.
>=20
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  hw/block/virtio-blk.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

--udcq9yAoWb9A4FsZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVisnCAAoJEJykq7OBq3PIDWcIAImigMBdxkAv1/VL7GWuQzOa
DXfH7Q3kprvq1eBG/Ek6WFgxGDgP/lMZ8+wC646ZUO8J5sjbBqZWznBm1JVAzkg4
ox3vAhrD4briCZy7sFrlbBuKBWAFufnYKR+XryAW8KR/nX57TX6jpuei7634xFRe
EhSBRP2WLI4eFmDKBOQLhnu4a9ueUp4uujvM8AyAKzALeroN5O4dblaC5sIBii9O
3ZPPVZFuAq64MxW0lIRvhB9LZ/VFcTKUPM5Lwc8ttKHz3klw2d1FT3/0gD6VlSz0
sCts/+WgWcXg6u+5vT671MTjPBzsQX48603DY4zqA7vE/ubHaPK9y+Kv4iYOK7Q=
=JY7C
-----END PGP SIGNATURE-----

--udcq9yAoWb9A4FsZ--

