Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ghXfe-0004Pu-FT
	for mharc-qemu-trivial@gnu.org; Thu, 10 Jan 2019 05:34:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ghXfb-0004Nk-Vz
	for qemu-trivial@nongnu.org; Thu, 10 Jan 2019 05:34:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ghXfW-00015s-8p
	for qemu-trivial@nongnu.org; Thu, 10 Jan 2019 05:34:37 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:35700)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1ghXfQ-00013X-8j; Thu, 10 Jan 2019 05:34:28 -0500
Received: by mail-wm1-x342.google.com with SMTP id t200so11559868wmt.0;
	Thu, 10 Jan 2019 02:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=6o4jcL6QYnVwkn4s9DcP1G00GqMX4WxRc7KLz98uVrI=;
	b=HlR0coGfKamCm9/WPCn1JApM+xoROyim3ixdxwaqjYCVBoOYJ8rixXZvKdLJkGONEW
	8kwjG6FKMqklrmrxr59tcagkcv2WeAWj5nzsQifChAIZN1I4e3612d32UqjElbuJR9Is
	wKRTak134/vBpQ/uq5j4zT7CD77q4RFXhIBp419mF9o4zRTZe45H+13sOKqQEW1bYfW7
	jEECpH36Z8tVqBoS5nj2QQvx0MHPRqkwPN4ZrGMe9i7mV6bD344o0oOxtiiSvrP0/Oxl
	J/t7Tl6ifn7EvVcbWun7mttDxLgO9ifXpc2nHQ2FD/pjJph13YGs0JbPOMYIN/+BkZQ6
	V8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=6o4jcL6QYnVwkn4s9DcP1G00GqMX4WxRc7KLz98uVrI=;
	b=pM7afC1g5gIypduvckbbTEtIZzuCvOk/FxeJOGPTuIaxocG10KxzDbSJoV1KN5JCSC
	5asmFNOhw8D87Ds/FxgoWCMQXH0Hv62Uv9KiA+eFdwZ22CsPdFh28JsMNJol3eXyTnOX
	h8gANCZF/bpFDoUJKagNipzPlCBzcrgJUTPCJF/xeii41D6E/3Y/rR07OVlaSeNCzm2C
	j/zndXW1/28G9dIFopokpugczifwadFoSGGlw1rjSAmDkeGdIT1iRFLxbN3mAUQd57vm
	zmXb4UvIt+uAXiQDz6ZztvmvjNYdFJ1+qUXXPPzXZ975p1gn4kr3dLHCBNMzqrXTPR1v
	v85g==
X-Gm-Message-State: AJcUukdHfBuAhQFPhVKXwQcq62Y49fgyDU7FyBzUI4rZop/a03NkPCMh
	wcO7xaF0lSBo3emThyVxyNw=
X-Google-Smtp-Source: ALg8bN7H0uh4sDVoAalzdsMyIv6Y76GXYJfW18YBKN9XMb9nS93yTitFQsgkhlBR8xKz5wTasUm9Ag==
X-Received: by 2002:a1c:85d2:: with SMTP id h201mr8754583wmd.151.1547116465194;
	Thu, 10 Jan 2019 02:34:25 -0800 (PST)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	y13sm46282888wrw.85.2019.01.10.02.34.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 10 Jan 2019 02:34:24 -0800 (PST)
Date: Thu, 10 Jan 2019 10:34:23 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Li Qiang <liq3ea@gmail.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20190110103423.GF19025@stefanha-x1.localdomain>
References: <1545028456-2797-1-git-send-email-liq3ea@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DEueqSqTbz/jWVG1"
Content-Disposition: inline
In-Reply-To: <1545028456-2797-1-git-send-email-liq3ea@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] main-loop: remove unused
 header file
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
X-List-Received-Date: Thu, 10 Jan 2019 10:34:40 -0000


--DEueqSqTbz/jWVG1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 16, 2018 at 10:34:16PM -0800, Li Qiang wrote:
> Signed-off-by: Li Qiang <liq3ea@gmail.com>
> ---

A candidate for the trivial patches tree.

>  util/main-loop.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/util/main-loop.c b/util/main-loop.c
> index affe0403c5..845a4b1f13 100644
> --- a/util/main-loop.c
> +++ b/util/main-loop.c
> @@ -26,7 +26,6 @@
>  #include "qapi/error.h"
>  #include "qemu/cutils.h"
>  #include "qemu/timer.h"
> -#include "qemu/sockets.h"	// struct in_addr needed for libslirp.h
>  #include "sysemu/qtest.h"
>  #include "sysemu/cpus.h"
>  #include "sysemu/replay.h"
> --=20
> 2.11.0
>=20
>=20

--DEueqSqTbz/jWVG1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcNx+vAAoJEJykq7OBq3PIlNAH/2qlNPFdnCjjvU+/5Dog2E2x
Nl8ruMYPt0pgLfTs91LN68F+Nx/jSWNXBjZpbz6q3RoVcelEB16SGZ7jerNrufvT
LSbMwqNek6yK4r1mBuk/Tpq76mSlrgNpl7FOUrpawhdowXHv1Zbcg59+AxKr9hX3
GfN8a6oa9m3Ywm6VmRTWhsQvIb2EBVixJ9HQIb+qacZ7XcaEro8+44D8KRjZgz6+
MmNzOPlwOlhal1AGN2b2jRGjvjZ1yQ2UpKvITX+IwyOx8oHbXmtSi6JpqyrCfiPB
sbt9nNx/RF+si46qaecJRZ55xwnpha9qzIt98g/dzEjdBxbdqZtXEz0s3LVPhzg=
=kz0A
-----END PGP SIGNATURE-----

--DEueqSqTbz/jWVG1--

