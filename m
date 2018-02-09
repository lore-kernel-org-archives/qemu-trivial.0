Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ek96E-0002Uh-W1
	for mharc-qemu-trivial@gnu.org; Fri, 09 Feb 2018 08:52:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1ek96C-0002Sd-34
	for qemu-trivial@nongnu.org; Fri, 09 Feb 2018 08:52:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1ek96B-0005TI-8y
	for qemu-trivial@nongnu.org; Fri, 09 Feb 2018 08:52:20 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:60316 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1ek965-0005Mi-Jj; Fri, 09 Feb 2018 08:52:13 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2673C4022905;
	Fri,  9 Feb 2018 13:52:13 +0000 (UTC)
Received: from localhost (ovpn-117-210.ams2.redhat.com [10.36.117.210])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E511F41C0;
	Fri,  9 Feb 2018 13:52:10 +0000 (UTC)
Date: Fri, 9 Feb 2018 10:16:30 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>
Message-ID: <20180209101630.GB30827@stefanha-x1.localdomain>
References: <20180208162447.10851-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Content-Disposition: inline
In-Reply-To: <20180208162447.10851-1-marcandre.lureau@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 09 Feb 2018 13:52:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 09 Feb 2018 13:52:13 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH] misc: fix spelling
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
X-List-Received-Date: Fri, 09 Feb 2018 13:52:21 -0000


--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 08, 2018 at 05:24:47PM +0100, Marc-Andr=E9 Lureau wrote:
> s/pupulate/populate
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> ---
>  util/qemu-coroutine-lock.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJafXT+AAoJEJykq7OBq3PIIocH/jkdS/XpdqTzQaQFgaW0MBET
wIMLchHdZAWbia50ZAZK6O/s+OqxE24tKG05jQJwPZocARM9aF63ODPbzaMSEE+p
1FfRcv03Xe5HwUL0kNrgO7UxZ8zwzEBu+nRIAbcUBnq3F6BNJyW0lH29/9DkTt5v
vwKDklqlWuptTHVLmQnMYcC4KE2EOrNsP1dpFipfIo7jSGHFSrYw7LJNjLHscnjd
8s+G6wC/8i93D3uk2z5kmdmVwz3KRcKxYR2w/eTP7BE1TheaELUCj4di2/TsFRL9
eVBpwFO7e5FSdxHKj/ZVsfoMPaPBtzPRxJumQDTonq7U3Q99a7j4ppzEYP8w1f8=
=z0qL
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--

