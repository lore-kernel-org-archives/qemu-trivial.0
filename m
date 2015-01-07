Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y8t3V-0000y3-PP
	for mharc-qemu-trivial@gnu.org; Wed, 07 Jan 2015 11:01:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Y8t3O-0000nU-Of
	for qemu-trivial@nongnu.org; Wed, 07 Jan 2015 11:01:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Y8t3I-0004CK-O9
	for qemu-trivial@nongnu.org; Wed, 07 Jan 2015 11:01:50 -0500
Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e]:36004)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Y8t3D-0004BC-I6; Wed, 07 Jan 2015 11:01:39 -0500
Received: by mail-wi0-f174.google.com with SMTP id h11so7810842wiw.7;
	Wed, 07 Jan 2015 08:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3zTVkc/vcEfSL1X/AqBoOXLSirGnLHiZ7Jpeb1LIANc=;
	b=eqdJBU8rEsCG4v2h2x2nfYrKLUJsJD/oktvn0+auzfPZuggMCdXe0b+JWppcFNm4mP
	FQyg0WjKzvMzskwt95B3vWW/nJHE29qYsZLvsOJE1ttlO0nRdBZZtz30ar2kU1HRnsXn
	T4V2F/cHytMZ112/d2kjQUgkMcJVy38aBr4gTj9jZsxV8zKy0wyihoO55Qb9zbKEAAvC
	0Zbf6gVJCkbTXzY1Jh1lAk0aACDvDT4Z7YiHKPqeFx8NaOoswwu02Uy6u4n3rvJFd3VH
	TUy7LvuydS96j/M+Ycoh4PiDn6aaEcFyHlxtcVRXHaQiG9aab6O0K4DVy6MUPnwzAJ1Y
	yV1w==
X-Received: by 10.194.94.1 with SMTP id cy1mr7418935wjb.127.1420646498859;
	Wed, 07 Jan 2015 08:01:38 -0800 (PST)
Received: from localhost ([31.185.131.133])
	by mx.google.com with ESMTPSA id cs8sm18376881wib.1.2015.01.07.08.01.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jan 2015 08:01:25 -0800 (PST)
Date: Wed, 7 Jan 2015 16:01:24 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
Message-ID: <20150107160124.GO22440@stefanha-thinkpad.redhat.com>
References: <54909D02.2030404@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gqEssfNGWsEa4HfM"
Content-Disposition: inline
In-Reply-To: <54909D02.2030404@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22e
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/net/xen_nic.c: Set
 'netdev->mac' to NULL after free it
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
X-List-Received-Date: Wed, 07 Jan 2015 16:01:56 -0000


--gqEssfNGWsEa4HfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2014 at 04:58:42AM +0800, Chen Gang wrote:
> Since net_init() checks whether 'netdev->mac' is NULL, before alloc it;
> net_release() also need set 'netdev->mac' to NULL after free it.
>=20
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  hw/net/xen_nic.c | 1 +
>  1 file changed, 1 insertion(+)

Thanks, applied to my net tree:
https://github.com/stefanha/qemu/commits/net

Stefan

--gqEssfNGWsEa4HfM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJUrVhUAAoJEJykq7OBq3PIKIoIAMcP0x+076oqOM1VnEKlFwok
UHAmycfPTficb2UiEKjFnf+dGDXvunNBwwC8oVH5+wA/WVAErSaqP4WsQnjTdo/f
SefWeQVYWQkhqAG4zj5TYSOwsgq1Zz49Eyqyp7Ka6VeiJR92vrBId6NKK5zZnEmW
CIkfLQgFCXp0d1wdi/8KSHPpO2/mSGyOOLbq5wayWdNWSFSTvaK2OnYApZwnaL14
P62BG0/r8HmJSUtL1hIzWpNd6X6XsWISOtzsCAoXKAO65DYnAeVJM6KueElz9Nuo
uvw+4Psm2aqb7/mhbPZ6g1ES46uv0W3A3dKilJdjfOhtWaiR9ayIy2g3sBN7cBY=
=mtmQ
-----END PGP SIGNATURE-----

--gqEssfNGWsEa4HfM--

