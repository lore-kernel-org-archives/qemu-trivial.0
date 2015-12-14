Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a8ftX-0006cC-Gz
	for mharc-qemu-trivial@gnu.org; Mon, 14 Dec 2015 22:03:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1a8ftU-0006Wv-Fy
	for qemu-trivial@nongnu.org; Mon, 14 Dec 2015 22:03:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1a8ftT-0006dJ-K1
	for qemu-trivial@nongnu.org; Mon, 14 Dec 2015 22:03:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54178)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1a8ftO-0006av-IQ; Mon, 14 Dec 2015 22:03:10 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 9F3F019F96F;
	Tue, 15 Dec 2015 03:03:09 +0000 (UTC)
Received: from localhost (ovpn-112-24.ams2.redhat.com [10.36.112.24])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBF335QF026853; Mon, 14 Dec 2015 22:03:08 -0500
Date: Mon, 14 Dec 2015 20:21:34 +0800
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Qinghua Jin <qhjin_dev@163.com>
Message-ID: <20151214122134.GF5027@stefanha-x1.localdomain>
References: <6aa1b449.fb8b.1518fdc8641.Coremail.qhjin_dev@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TU+u6i6jrDPzmlWF"
Content-Disposition: inline
In-Reply-To: <6aa1b449.fb8b.1518fdc8641.Coremail.qhjin_dev@163.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] trace: reflect the file name change
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
X-List-Received-Date: Tue, 15 Dec 2015 03:03:17 -0000


--TU+u6i6jrDPzmlWF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 11, 2015 at 03:06:12PM +0800, Qinghua Jin wrote:
> Some functions was moved from block.c to block/io.c, so the trace-events =
file should reflect that change.
>=20
>=20
> Signed-off-by: Qinghua Jin <qhjin_dev@163.com>
> ---
>  trace-events | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Please use git-send-email(1) in the future.  I had to manually apply
your patch.


Thanks, applied to my tracing-next tree:
https://github.com/stefanha/qemu/commits/tracing-next

Stefan

--TU+u6i6jrDPzmlWF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJWbrROAAoJEJykq7OBq3PIJZEIAJah4n7k0fKn3rRMzU6QuUDc
YRlni3bIjK3uKKdZjhD8HUhhFAutspCcwlP8DawEm0K2TygaapeBb16eSUz7Tz1K
nwpuDLLwgC3GMJqeWJmklF2YHgUC9twQ+4qEslflZ7aXfCbC71y7QETZiH074Y7b
rZOr9Ko8Kp33+pjBQBjefHZVv1DZoV0lD+a9Iv6Q/TV0esfs6yqHSZIyUXGeJUIU
w8IU1V9sxEQzEooDp5Qp18kXKa0HgFhTgmwCnavz3+1mrYOFmsgbKlxyrntjTcOu
yNyT0onUs4xb4/eFdg1Z1kWBQCFyZ5CNEfg+QUNpx93xg0sSxKce2amAcQ9HVGo=
=ahWU
-----END PGP SIGNATURE-----

--TU+u6i6jrDPzmlWF--

