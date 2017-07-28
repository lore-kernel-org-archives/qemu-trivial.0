Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db45C-0004OV-FU
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 08:09:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1db45A-0004K2-1x
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:09:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1db457-0002l3-9S
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:09:28 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:35724)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1db457-0002jS-2j; Fri, 28 Jul 2017 08:09:25 -0400
Received: by mail-wm0-x243.google.com with SMTP id r77so14077266wmd.2;
	Fri, 28 Jul 2017 05:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=5ENqXEDQ+GMY3q+uxQrXhdUT/U7S7x6Mj9z8CRcWRtw=;
	b=h7zaQE6ASfEZWI1CT/j3HvX2+ma1IcyNkkMOYr+9dUB4yEnGUd9ucFwmA+mpE1Ays9
	IFXytmf8cyM8lnL5U7bqP5QLTbIiWxqrb8wssHn3cSEJoeSGDoWOVjEQsB4mIKBkRx7t
	BtISJJZjOnOGshXiWA9BZyxWZ6RIdyO0NFJdQ8MSrc3QxoFAYSOGcl/TIPBSwBBnsJOf
	gonpERawKJvPYKxBc1FYjJV5qMMLlEjIqN5qTmLQrK8/2X24CR1BUeDhYanKZviPHksy
	0TJUxv9nxIMu900SEhTVdESE++m0yPhJz2MlhJIS1GFvXdw5kuKwFgi7Uv0njSbD9rwa
	BhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=5ENqXEDQ+GMY3q+uxQrXhdUT/U7S7x6Mj9z8CRcWRtw=;
	b=Vgnd/AYF0uA6NjL9FWiicUq0/OWa8750F6bWCqKOoxSfAMACCfaQSDISBdq/bx40+E
	rUakUHYybNofd861A/5K63NgLBau45kUSpMak8hk6a6urwVzEfsfk5EoN1W4q4UMqlZW
	XzAQZSY7mbnEMPc/LJRtuHnHievbJMDNub6bpjtwoYIBd4F/fQ2WxkSafxRlDnHYBc0z
	ahF9IWNqjLZ1Xd+kR4QbTUSdbB/icToxMIZA7cJFaV+Bkfm2xjWybo83FTaFBaPTpib+
	bN4mcayMAdXNNpN536S8MzVN4IkkIarDQSqz54sXHLxMgoBsHkfJAzWj1AJwlNlfGSVU
	EHhQ==
X-Gm-Message-State: AIVw110H/laSuo8xUGdmK9+xq9yxX4uRtIN1jlBzhtWdiv4Q5x733PB0
	uY3XgdOZ9fUm5VcUcLI=
X-Received: by 10.80.219.203 with SMTP id s11mr6455213edk.113.1501243764077;
	Fri, 28 Jul 2017 05:09:24 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	m41sm10863892edd.37.2017.07.28.05.09.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 28 Jul 2017 05:09:22 -0700 (PDT)
Date: Fri, 28 Jul 2017 13:09:21 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-trivial@nongnu.org,
	qemu-block@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20170728120921.GE12364@stefanha-x1.localdomain>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-11-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PGNNI9BzQDUtgA2J"
Content-Disposition: inline
In-Reply-To: <20170728053610.15770-11-f4bug@amsat.org>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 10/47] MAINTAINERS: add
 missing entry for virtio/blk
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
X-List-Received-Date: Fri, 28 Jul 2017 12:09:29 -0000


--PGNNI9BzQDUtgA2J
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2017 at 02:35:33AM -0300, Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4f9ce6e686..2958dd2479 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1067,6 +1067,7 @@ S: Supported
>  F: hw/block/virtio-blk.c
>  F: hw/block/dataplane/*
>  F: tests/virtio-blk-test.c
> +F: include/standard-headers/linux/virtio_blk.h

This file is imported from Linux mechanically using a script.  I'm still
happy to review changes to the file though.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--PGNNI9BzQDUtgA2J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZeylxAAoJEJykq7OBq3PIeRkH+gOkt7z+ACzrQGdbA/Uzko6U
fOsiAHoBcVKMFdSR6iviuIu4H7546xehLSKaxoT1CAXSZPCfi5/L6LIy2go1V6G8
2lrG5/OMBc+Zs6XvM5VS6RTJgX9KJLBtZ1nnCjqrlG0vF5rYoBtK1TOJO3HM6Y2a
V3XM1mZDB1VOHww8sy1eGkwcZJ5TizOCWGOKbOAbe/3o2TRdKqdmQOS5ec6LzgGy
Z3tuNenQ/jQz1Qg02c8fdgNqNeUJBcv00m5FHOjtkWbm0FRaVBsuJDevKAK8+SIH
loWoYm0DX5Mon4stfHii2YuWVv62gCGaNGl6ykmJPUW3D5JXpnKPWgFwrkUpG7U=
=IV/z
-----END PGP SIGNATURE-----

--PGNNI9BzQDUtgA2J--

