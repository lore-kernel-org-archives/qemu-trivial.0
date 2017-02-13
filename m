Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cdI6v-0003JI-46
	for mharc-qemu-trivial@gnu.org; Mon, 13 Feb 2017 10:00:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cdI6s-0003Dd-5R
	for qemu-trivial@nongnu.org; Mon, 13 Feb 2017 10:00:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cdI6o-0006GA-VP
	for qemu-trivial@nongnu.org; Mon, 13 Feb 2017 10:00:10 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:35144)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1cdI6o-0006FO-PJ; Mon, 13 Feb 2017 10:00:06 -0500
Received: by mail-wm0-x241.google.com with SMTP id u63so19978500wmu.2;
	Mon, 13 Feb 2017 07:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=5bJ0bdMUdhI1RCsrE2WWNXziO9zN8AOfda1qpV/kmEA=;
	b=EKZ5OW8p8BRthJH07WtzlgVyFhUwBaxUXXd0kuvZC5HD1RL6/lNeg6KcDhgjhUvSBv
	EbSulXiKljpoOaw9CsS+i4+7hm4AWlUKlhI3+MKHW4lom7GQz5CMLCVQ7JJ9w/W5QEvW
	ujQ147zqNW0JamlqAHpb1ZN1jk8sju6KdN+9Qgf1OD7iUYMEGg1pcyN+GGXannUlTgh9
	Wy21NgbBVN9U1FNMgZ/CDz20XHnS0q0d9PJxmhqgkrwjfIc7QJCXulg4KO1mBO7eRQEG
	qSuMXbyEgxIW/Z9wbBiuAaAcRfXWFpfoYmqcyYnb7KjXu1ANO1v+ph1GFjO1azdPPRKw
	JFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=5bJ0bdMUdhI1RCsrE2WWNXziO9zN8AOfda1qpV/kmEA=;
	b=Mb/3ZGOBjfOkuXqCFajS9zyifv+kW9F07Cl+MejoTByN9X5zQ6f9aaGf/Nm8pufiQE
	RR4Kz+vz5s2nFuEjbrf1oTTzqzmqAcX2Hz39mLyWk/RIBeu+x/dloj6FUabjwutd/hPM
	RpyKs5dAsMGOBvo0o9Wtn5lO9yPLfFsnvENfvfatNVuHgZbS7UNBdYvU7F04248HUMN8
	0wbX5IDQusUZFQOIUNdCnwQWesaKTFjO6L2CKVEAsu55FE9keDCRRfAPNagbf5xpE50n
	MZonkyNHYAEV+X+O8N6ILADf2OEyTu58/HhrkMa2wFQhqCvPfdzydmAOgjB+ssUR0uUS
	4OkA==
X-Gm-Message-State: AMke39kQIuPkylUDJL5t7VqqV4rxPNGqy7cATd8yvjzVd7DpKmVpz26wYLAuXGt7QN/ctw==
X-Received: by 10.28.57.131 with SMTP id g125mr18695120wma.33.1486998005660;
	Mon, 13 Feb 2017 07:00:05 -0800 (PST)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	o143sm5718514wmd.3.2017.02.13.07.00.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Feb 2017 07:00:04 -0800 (PST)
Date: Mon, 13 Feb 2017 15:00:03 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, qemu-devel@nongnu.org
Message-ID: <20170213150003.GO10361@stefanha-x1.localdomain>
References: <20170208170533.28822-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lCFQJunhLz1tFGpX"
Content-Disposition: inline
In-Reply-To: <20170208170533.28822-1-jsnow@redhat.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ide: remove undefined
 behavior in ide-test
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
X-List-Received-Date: Mon, 13 Feb 2017 15:00:11 -0000


--lCFQJunhLz1tFGpX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 08, 2017 at 12:05:33PM -0500, John Snow wrote:
> trivial: initialize the dirty buffer with a random-ish byte.
> Stops valgrind from whining about uninitialized buffers.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/ide-test.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/ide-test.c b/tests/ide-test.c
> index 2fa97bc..139ebc0 100644
> --- a/tests/ide-test.c
> +++ b/tests/ide-test.c
> @@ -550,6 +550,7 @@ static void make_dirty(uint8_t device)
> =20
>      guest_buf =3D guest_alloc(guest_malloc, len);
>      buf =3D g_malloc(len);
> +    memset(buf, rand() % 255 + 1, len);

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

>      g_assert(guest_buf);
>      g_assert(buf);

Pre-existing issue:
g_assert(buf) is unnecessary since g_malloc() is guaranteed to return
non-NULL.

--lCFQJunhLz1tFGpX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJYocnzAAoJEJykq7OBq3PIxsMH/3IPQSmdSDkeryjxY0Aaa5/l
rISxzCyc4P83J0zqznDN2rctasaTbDkyeAhrM+YH6GUYUL6b7vsK4WzmqZwSsrl2
bA4oe//Ls8VNI80BkkfTKC0Vr5+YbqJdcEAmpT+nqqLYOeKWwS8Y2WK+4GDAOaL+
yQZBaGH2UlYm5V5k/k5UrlSVRz0DpjQwt84r50LQzu7ywd/7mrJxQcLnXyGAYEcB
ATWYUvfiu7wkvdRcKicgns35x0AccR65TnLcBLG1JiU+6ED0V7vzyZJIQFytiyuo
qptbdEWkuRHu6mwcQCPCNhw6Mdh0cXu6A9tu7r5iRbzQxXU4QLpLaJxPcpepj0U=
=yy8y
-----END PGP SIGNATURE-----

--lCFQJunhLz1tFGpX--

