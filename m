Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dSkYw-0000Rc-4o
	for mharc-qemu-trivial@gnu.org; Wed, 05 Jul 2017 09:41:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1dSkYt-0000Or-5d
	for qemu-trivial@nongnu.org; Wed, 05 Jul 2017 09:41:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1dSkYs-0006F1-DD
	for qemu-trivial@nongnu.org; Wed, 05 Jul 2017 09:41:47 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:33720)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1dSkYn-0006D5-VB; Wed, 05 Jul 2017 09:41:42 -0400
Received: by mail-wm0-x243.google.com with SMTP id j85so32573386wmj.0;
	Wed, 05 Jul 2017 06:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Mq8ybmJqfY8aS2yy5Rb46e5Kab+eDDaP/bVmjj5rUpM=;
	b=rvZVJ2xImtFPl1OGd+ekQ2WfTESv0aLbzYamf1J5Dg6jFkh4hKCAlhRbzUXomXc51X
	43FbmxGNHu4YGpahU8fKeyieGASd2LvRDHRmNK2+UH7njINN2tAPyEgoqRBirvNblO2B
	NKzpFevV6QmZYjVX1A24sENSkU2BKrwGyMivSqXcTedyPvJabZVCBGa03mbyTnwy2Uya
	O3y0XaTubLDhuRyYPZt2d9CzBD4LBbL3EdTsHdL/znVKkkW+pDbWpH9w/zEUQjHLji8y
	W7h070DzkxvmVXdzgF+NKl7oY643tO0XSTwtnaMe5XV1qxAUlWmK7IO1X/dsS+xOSgWV
	vx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Mq8ybmJqfY8aS2yy5Rb46e5Kab+eDDaP/bVmjj5rUpM=;
	b=QNhMrE02rqQ7CsZSUoK29TVxbjNzSfX2b0nenKj4HlPSpRhVbaQDAlKVIhQdRzzxHh
	R4QcIMxWlT8ZU6sgo78lI76U3ISTgU7jo/tmqbvr5VIsjjeE37YZo8Pzs5KCE6BUpb0W
	mPYuNs1Ge/WmLGjDzHqOQ45/GbcrnL6XRcRWpzgztbSW36fBjzW8dwBt8nywVk6nnY2N
	Nzyy8ZvF6BY/rj2jJbSO3OYtgkEuk/u9lgDjS+CNGotNgQzW1p9X2T2XD2SZfUCXaFle
	wJQrc+mtHpiT2KXcf1w4df/FDnupbAbsOn8yDaIcGN2tP25jJihmspwcDhmxoxuxfjig
	FLBQ==
X-Gm-Message-State: AKS2vOzLxEQYkaCWVKlpKWCXkQamUBrP2tdSI4qdXEDKbjEWxXwetgmr
	64CAE+jPbgPpfA==
X-Received: by 10.80.137.67 with SMTP id f3mr22331678edf.152.1499262100888;
	Wed, 05 Jul 2017 06:41:40 -0700 (PDT)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id 4sm10659453eds.48.2017.07.05.06.41.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Jul 2017 06:41:39 -0700 (PDT)
Date: Wed, 5 Jul 2017 14:41:38 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20170705134138.GE1280@stefanha-x1.localdomain>
References: <20170626101159.19676-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ffoCPvUAPMgSXi6H"
Content-Disposition: inline
In-Reply-To: <20170626101159.19676-1-berrange@redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] sockets: avoid formatting
 buffer that may not be NULL terminated
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
X-List-Received-Date: Wed, 05 Jul 2017 13:41:48 -0000


--ffoCPvUAPMgSXi6H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 26, 2017 at 11:11:59AM +0100, Daniel P. Berrange wrote:
> The 'sun_path' field in the sockaddr_un struct is not required
> to be NULL termianted, so when reporting an error, we must use
> the separate 'path' variable which is guaranteed terminated.
>=20
> Fixes a bug spotted by coverity that was introduced in
>=20
>   commit ad9579aaa16d5b385922d49edac2c96c79bcfb62
>   Author: Daniel P. Berrange <berrange@redhat.com>
>   Date:   Thu May 25 16:53:00 2017 +0100
>=20
>     sockets: improve error reporting if UNIX socket path is too long
>=20
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  util/qemu-sockets.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--ffoCPvUAPMgSXi6H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZXOySAAoJEJykq7OBq3PIFYUH/3WJTMmnlemPTvRUdDd/z0Cq
ZE+0CtGJS9y4Jkx6GEe7zuvHkGPJnkMvMiZUzsi3BYdY1A4InBJak1y34g+QhfQn
db8MMsCrX+RBE7PwUUaIDblRdnvvr/0kYl6TVxOPVazOHVkJVSerVHoP5p3jbeQE
DaufkCFrVtUL3JTQn0a1PK3XG5D3oPheEUir9FG8AV/4Cg+UJeZ99Eaoda2+viQR
JonaErNREqrTPvGbTw3KouonMqQCjjmEJbX6uHtGpnvI+I2IOE9uswBFOz8U9juw
zFDPy26suwmUWp8CBtn0ceIcYCFyAehaqvOj98GflJai9Xjtrilyga3G+He5Qu4=
=DyU5
-----END PGP SIGNATURE-----

--ffoCPvUAPMgSXi6H--

