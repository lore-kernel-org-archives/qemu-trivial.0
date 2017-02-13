Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cdHBV-0000i2-Km
	for mharc-qemu-trivial@gnu.org; Mon, 13 Feb 2017 09:00:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50801)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cdHBR-0000d9-H2
	for qemu-trivial@nongnu.org; Mon, 13 Feb 2017 09:00:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cdHBQ-0005Yu-Mb
	for qemu-trivial@nongnu.org; Mon, 13 Feb 2017 09:00:49 -0500
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:33742)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1cdHBJ-0005XT-VF; Mon, 13 Feb 2017 09:00:42 -0500
Received: by mail-wr0-x244.google.com with SMTP id i10so24320547wrb.0;
	Mon, 13 Feb 2017 06:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=u0RJZ/qgkAUTQIq6p1KZDnbWD7ZowgvMb0gKFB5cweE=;
	b=KgaKA5/wbmxgGurZASPKAEVuHmD2ab0l4LTt2FK/nsdYdAs+tugF1YF3WaqmKvpje/
	09RUG7W98+Ny8KK9zcKuQ30F3woLXw53tH+OeuPZmYRF7zfwzTTshIsJ2XmxQNPv1wPi
	4jO3gaeVHZk5l/OvZtnIeSEPPCvSfpjyvU667xmAMHLn6YhzNzdX4UInibBEj2LsTRTS
	hT5Vbl686XsmQT5V40byNMYS/c1cqHoJ8Y+8zTZXoAuFAtffJox7STGU7BoVJklgjp2J
	3xU7lbSzEttoKyCk+g6lC+mSFm3vnd6/U0qJ2XbZQjpizMZ3zNGnCdQ74yzLzoEdzurH
	Mu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=u0RJZ/qgkAUTQIq6p1KZDnbWD7ZowgvMb0gKFB5cweE=;
	b=rTut4BsZKoruGS/AJWi56zwe7qPelvEPUYs8wGRh90XIoqz4RBrIMyOyTUD6C7WAob
	mku/ul1otd6R0lTlkvDAHLpzeJq229K4iLveGn1ZvD9pmoXQgQ6NnmtJJ370l620QSnm
	WgvZyM4przvpQrBAoZwfMlW9OKmNUQOCNUwyU/fjzPmnrSWZBxOcgIrYk+M6rwGuSVPX
	dIktDchfpqtK9Qzzpn2eBJbQn6DNlVTUUkFEh0ocv5KjNqDYXqKBZZAm35hsLn3V/qJ2
	dEOd+anP98D0N6oHJoaPLbhnqKARtXkQzBwHZC1+oxQ50Va36he53Ht6/a8OpqAs6WoG
	kDYw==
X-Gm-Message-State: AMke39lqd/6idirFbF3uxcaNTrOx+2wcoc2AC/HwI0NNj0pM7uI9oO4lrCag5ReWuYVsUg==
X-Received: by 10.223.139.90 with SMTP id v26mr18737959wra.143.1486994440812; 
	Mon, 13 Feb 2017 06:00:40 -0800 (PST)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	o42sm14010427wrb.18.2017.02.13.06.00.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Feb 2017 06:00:39 -0800 (PST)
Date: Mon, 13 Feb 2017 14:00:38 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>, patches@linaro.org
Message-ID: <20170213140038.GE10361@stefanha-x1.localdomain>
References: <1486144722-6021-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wchHw8dVAp53YPj8"
Content-Disposition: inline
In-Reply-To: <1486144722-6021-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] CODING_STYLE: Mention
 preferred comment form
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
X-List-Received-Date: Mon, 13 Feb 2017 14:00:51 -0000


--wchHw8dVAp53YPj8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2017 at 05:58:42PM +0000, Peter Maydell wrote:
> Our defacto coding style strongly prefers /* */ style comments
> over the single-line // style, and checkpatch enforces this,
> but we don't actually document this. Mention it in CODING_STYLE.
>=20
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  CODING_STYLE | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--wchHw8dVAp53YPj8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJYobwGAAoJEJykq7OBq3PItDoH/3U2NhnSQv9ne1ot4r3p3V8M
1L5nHpFK4fcl116pOXUXJbncaOYFxHpiFLgpaQBA1btBOI+gW9vUIh1tqbtn+Xak
JiwPjn4rOMPH0ILDNXhOI9WjYWy6quANiZ+o8DcUamOTwcUziHroQJmZqOrXihZe
8LcSh9EtUIOq/4WzYJLpwrvYG9rc3urRMJR68xpghXu3jEGNwlG7F9IhEzsXtf1/
IO6FimI8i2/O/f7UGR+9ZDZ0uz2CHNZ5L24HSqPIaE3nfcUqgI5F1fAHzaU9zLsM
2p1XxC1NDaF+0uGznp4z5hp+6VStKAYjcsqzXmoH7TlXM3e8zwEgE0WXnsFnpog=
=/x9J
-----END PGP SIGNATURE-----

--wchHw8dVAp53YPj8--

