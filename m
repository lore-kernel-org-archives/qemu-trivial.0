Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fYWNd-000216-UR
	for mharc-qemu-trivial@gnu.org; Thu, 28 Jun 2018 08:50:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44636)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fYWNb-0001zk-IJ
	for qemu-trivial@nongnu.org; Thu, 28 Jun 2018 08:50:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fYWNX-0006FB-1y
	for qemu-trivial@nongnu.org; Thu, 28 Jun 2018 08:50:31 -0400
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:40219)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fYWNW-0006E6-Qj; Thu, 28 Jun 2018 08:50:26 -0400
Received: by mail-wr0-x244.google.com with SMTP id l2-v6so4817694wro.7;
	Thu, 28 Jun 2018 05:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=b3Wpb8jGeeKInPhAqrj3bosNQBR66SbQWU1bCTPIg5k=;
	b=K+7PrM3p4pYegIK9zxkSvABj5JFn5kofrOgzw5oZWqtnLlVUN49yct1p/eDIJZmyK6
	4v+yAVoRjIYsTqYyhCpJD6wvsLfMn5ssOjOgZrQFRcCtTF19Nso4gAP9ZubT7EGnem17
	41Mp+76kj2xmYWX2jKs69+l6OqVy/LFtGoc6CSHkyqE7QI1tuirs37wK7t8q2+8vM4WL
	zYNZiXsoiaqAjrRIk07L2kem/P7i0DiIMqwJhK/lMUKRweMfik9bz43C1SeWCeK12JeP
	qMyXBoJ1SLkL+4ZGmtXL0auYox0+wwFh2FfUSZlUGHW/00Bybx6rpkR4BpsE/2bCejVI
	aA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=b3Wpb8jGeeKInPhAqrj3bosNQBR66SbQWU1bCTPIg5k=;
	b=b0IRN8ycBvqYn29p4jfbPmUjOt4tSoUqHWsXnM3BNVfaB1dnbq0T/W2vvCLVMyMIM4
	W443mg5693kVRVGXlhM6kyE01jVPPS0eVDgmQP7PiwWsWUFlDodHlA7BpThW5+BfULJd
	kJ9cZ/wDVzZqZAou5/ChjvD+AaLCa5cF1qsjNh3+JfBr4VJuGAXX+9dricKcyT1mIfSn
	3TzaXfHXK7B2Rv/YLkFIMW2i5t4XXf2qp+Mmst3snvLwmt5dWV5S5lRFOHuqfXjbzEkR
	EOZzTKAJY4KZ6nYHBt/TJs9DBxLk1puUUGm9jXg8Rhwt6NjiLF99ucAjV4KF6yL+wTRn
	6FYw==
X-Gm-Message-State: APt69E2ko6lfXzHWNGmG4CW/TzbRWSfRn616WBasdRXz96XsRDI6E9W+
	MgbmKppa/yiesL/v51VjR+s=
X-Google-Smtp-Source: AAOMgpe4u9nDtmiCU/3CdAWx2on0xpWGLcCu8Kao69QDulD45GhEarAdYZ7YZAXD5t66GLAvM3u9eA==
X-Received: by 2002:adf:afd3:: with SMTP id
	y19-v6mr9310310wrd.176.1530190225311; 
	Thu, 28 Jun 2018 05:50:25 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	g18-v6sm6097742wrm.34.2018.06.28.05.50.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 28 Jun 2018 05:50:24 -0700 (PDT)
Date: Thu, 28 Jun 2018 13:50:23 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowang@redhat.com>,
	John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-trivial@nongnu.org,
	qemu-block@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20180628125023.GA24618@stefanha-x1.localdomain>
References: <20180621171257.14897-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
In-Reply-To: <20180621171257.14897-1-f4bug@amsat.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 00/11] hw: various
 conversions to trace-events
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
X-List-Received-Date: Thu, 28 Jun 2018 12:50:32 -0000


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 21, 2018 at 02:12:46PM -0300, Philippe Mathieu-Daud=E9 wrote:
> Hi,
>=20
> This series is a collection of various trivial patches from
> different stagnating branches. Time to share before loosing
> them.
>=20
> Only the first differs and is meant for Stefan, other will
> probably go via the Trivial tree once Acked.
>=20
> Regards,
>=20
> Phil.
>=20
> Philippe Mathieu-Daud=E9 (11):
>   trace: Fix format string for the struct timeval members casted to size_t
>   sdcard: Reduce sdcard_set_blocklen() trace digits
>   hw/char/serial: Convert from DPRINTF macro to trace events
>   hw/char/parallel: Convert from pdebug() macro to trace events
>   hw/display/cirrus: Convert printf() calls to trace events
>   hw/input/tsc2005: Convert a fprintf() call to trace events
>   hw/net/ne2000: Add trace events
>   hw/net/ne2000: Convert printf() calls to trace events
>   hw/net/etraxfs_eth: Convert printf() calls to trace events
>   hw/block/fdc: Convert from FLOPPY_DPRINTF() macro to trace events
>   hw/block/pflash_cfi: Convert from DPRINTF() macro to trace events
>=20
>  hw/block/fdc.c                   |  6 ++---
>  hw/block/pflash_cfi01.c          | 42 ++++++++++++--------------------
>  hw/block/pflash_cfi02.c          | 18 +++++++-------
>  hw/char/parallel.c               | 16 +++++++++---
>  hw/char/serial.c                 |  5 ++--
>  hw/display/cirrus_vga.c          | 25 +++++--------------
>  hw/input/tsc2005.c               |  7 +++---
>  hw/net/etraxfs_eth.c             |  8 +++---
>  hw/net/ne2000.c                  | 25 ++++++++++---------
>  hw/block/trace-events            | 17 +++++++++++++
>  hw/char/trace-events             |  8 ++++++
>  hw/display/trace-events          |  2 ++
>  hw/input/trace-events            |  3 +++
>  hw/net/trace-events              | 11 +++++++++
>  hw/sd/trace-events               |  2 +-
>  scripts/tracetool/backend/log.py |  2 +-
>  16 files changed, 113 insertions(+), 84 deletions(-)
>=20
> --=20
> 2.18.0.rc2
>=20
>=20

Thanks, applied to my tracing-next tree:
https://github.com/stefanha/qemu/commits/tracing-next

Stefan

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbNNmOAAoJEJykq7OBq3PIg3sH/2kJp27tRpA4BD50tWr9DgsJ
GEo43xEr1qRrCYNEoS3pC/v7ASiYGf5MtNgkZWcEddOmLxfFm8O0KNwBfb5A3zLo
JRdaKczrdDax8fSTpaOCqE1zAYZYLWdnMyN3Jbxieu5uW39jeDQxaYhQO6NcssZj
AxsSowOi66DoTQ7CCMZo5/GyRs54C4mXiyXLVdchvM3WELGf+j+XL0FeuXDjAtza
5UHndoZMkxtipexCiwQfYvDeawiG1Fb8RYZuNFtua2pDl5mKFSr0sNDZ/WNX4Z6i
5vYDXPozEh/4ktIMLvrbsiB3s1M2MDizNC5Y/2pAm4XLMIiSco3P6XOf4F2QbkU=
=Nbbi
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--

