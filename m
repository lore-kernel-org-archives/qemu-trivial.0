Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQuDL-0006pN-4M
	for mharc-qemu-trivial@gnu.org; Thu, 07 Jun 2018 08:40:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fQuDJ-0006oF-8t
	for qemu-trivial@nongnu.org; Thu, 07 Jun 2018 08:40:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fQuDD-0005Rf-Ew
	for qemu-trivial@nongnu.org; Thu, 07 Jun 2018 08:40:25 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:39564)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fQuDD-0005QS-4y; Thu, 07 Jun 2018 08:40:19 -0400
Received: by mail-wm0-x241.google.com with SMTP id p11-v6so18853846wmc.4;
	Thu, 07 Jun 2018 05:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=f53viIz9fTujyPSkFusGptnUmwTKbID0SXhQIiaU79Y=;
	b=Z6AwwWVcwLOqBaLhxa/Vx2CaasHh8JkyFOaTmunT49xpSVmBN1YDyhWlNWcBgBskon
	uk1M3zJA3Vmma8aOB33NsNa00uPnmzjgWMK+Oanh/iAgTtVEHe3ZvHdhPDsBfunvDpdB
	0hZEUF7jZMvOaMwuuUH5hgxbnSajJlvd4LwrGL5tsoVHnbce9T/bDc9730JH4xzaqDVx
	fQSaPMi7rqjLMtCc4pf8MsdYVSnPvpy/EVAStRQ1f3+xOmq77Ys6WFq0sd1Pk+So++zZ
	MRD7QlRdyKpoJsPCCmq1J5n2RleOnYWD4vyCYaG9p8TxfonjH3HcQc+rdXA6QKxtJr/0
	f+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=f53viIz9fTujyPSkFusGptnUmwTKbID0SXhQIiaU79Y=;
	b=rRAISJz31yGzRuUNfjH683oHNIaJ2YvPcJWMnSd57tmuVh9gCT/ZH+I1DR+pGpax8i
	+7563+Zwj3Fmdz6IKYH4uM6lVp43lvgXhpS+9KEZ+oVPe2TJThleh3ShioKKp61a3+42
	RCq2uDGWdqOxnEbfkEZhPPrzr3n0txSxh4oDoYDf4TbbPgnFZYQccwYLUT9qVzgWYou7
	kJuVqroTv0i7DgiVzhNDEBCQEVwBYhtUQuzzRJq1YXaKEixo1wCqZ1deW8+yT6XDkmkL
	VpZHHQI21C+bxCrYXL7F6h326Hsm9AlpGg/XW+CbB9FT25USiETRXfQOPQ5pbx8JSu4F
	JffQ==
X-Gm-Message-State: APt69E2sRDjXcJLdRBB4unvTT0++8uIdzMJr9UQBMfuP7IAdsAw9MsmP
	XwQ7l8nhV1qSkbPx1azJ1e8=
X-Google-Smtp-Source: ADUXVKJsr4egxYzSeFRsg5mOhY2wwDSH8PKVwJYMxrRZSREgfr4+wM5iIxqTydzm3rCQXvDsO1ENtw==
X-Received: by 2002:a1c:4291:: with SMTP id
	k17-v6mr1444142wmi.74.1528375218156; 
	Thu, 07 Jun 2018 05:40:18 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	p6-v6sm23636130wrq.19.2018.06.07.05.40.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 07 Jun 2018 05:40:17 -0700 (PDT)
Date: Thu, 7 Jun 2018 13:40:16 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	patches@linaro.org, qemu-devel@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Message-ID: <20180607124016.GJ19032@stefanha-x1.localdomain>
References: <20180604162140.20688-1-peter.maydell@linaro.org>
	<20180604191756.1ae61871@w520.home>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qD3brAgIG4LbUq6d"
Content-Disposition: inline
In-Reply-To: <20180604191756.1ae61871@w520.home>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] CODING_STYLE: Define our
 preferred form for multiline comments
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
X-List-Received-Date: Thu, 07 Jun 2018 12:40:26 -0000


--qD3brAgIG4LbUq6d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 04, 2018 at 07:17:56PM -0600, Alex Williamson wrote:
> Note that the kernel coding style, except for certain exceptions, is:
>=20
> /*
>  * This is a
>  * multi-line
>  * comment
>  */

Amen, the one true way.  :-)

Stefan

--qD3brAgIG4LbUq6d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbGSewAAoJEJykq7OBq3PIPfcH/0ppV22KbSpTEefkgA6jUlSB
LFLJofelfszjaRkXbenfrpv64u49QuPhIqJ8DD127alFaBm1XDXyB3mx9JbmYVUU
FXKoI8fpS7FBy8TUIFnJMKH1/skDDEF8dvrk0Be4Vu4RFFCo0OTdwBLp8B0viDQH
ShfZGussMLWOr+pY+i5i4K84ikBCtIOaISb+2NpHIekVsJzzs+4tEwSKiz0fGN+r
BA0bvTbWRtzTEknN4KKvi/FWEC0PZrG2e8Rs1kUWa2d9OCR48gpsqi6et9+fYzAv
57WJikqE9LrwVk2WTljxCTXQbEwu8FQrzioC3FyI72IzslZbSVpLY8YAH5AplE0=
=qYCk
-----END PGP SIGNATURE-----

--qD3brAgIG4LbUq6d--

