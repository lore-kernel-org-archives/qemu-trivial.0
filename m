Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hAuZy-0005Qm-Nl
	for mharc-qemu-trivial@gnu.org; Mon, 01 Apr 2019 06:54:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1hAuZv-0005Mm-Mi
	for qemu-trivial@nongnu.org; Mon, 01 Apr 2019 06:54:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1hAuZu-00045c-Qu
	for qemu-trivial@nongnu.org; Mon, 01 Apr 2019 06:54:11 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:54304)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1hAuZs-000431-NC; Mon, 01 Apr 2019 06:54:08 -0400
Received: by mail-wm1-x335.google.com with SMTP id c1so8724582wml.4;
	Mon, 01 Apr 2019 03:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=5cJeChwef0BmpmVGPnXaQkW2yKCgqzLI9dbTp15GeoY=;
	b=Z3lqr5UsDbkNUR2TnuQQANcK8tKjdgEUni2OM+9+73eOUIawq9GK0tgtKD+O+DLsTq
	ZkybuKPyuwU4x+WUQrSjbx/18xPfQT1xdyB44rteC74oBOCQFqAURPaq/xhgt51IdgE9
	RTqH3ma1yz8Sk8yBssnFLuLalTQrXP6Nw6/pQ0e37hqZaC7Kr5OcEIjS7cf7z/1PUeVQ
	eO+/b4+G5TiKAnBmhBv5w1MT3kgw4TNyh7cFioLvOQvLMN8jIUbNTNujUcd9t4cO5eqr
	f4wTXeQ2meNn1FD1y2p+e8P3EKgiBBw6AHdK+HqYBr89q8Sll4JFrYzKkRPtiwpTU75p
	+tdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=5cJeChwef0BmpmVGPnXaQkW2yKCgqzLI9dbTp15GeoY=;
	b=ifrkVskinwN0dIZ3UradUe2mJXPP0OLgZENWOnPJXN3Pinx6z9jw3P5UfSGgco8dni
	qzvH0xkEn5zT9niaFPYt5nnrY7+v+LiPK1Mhk+reUs3+n+lFRgoPf+Pgs50yaLwqLWFu
	VNch0pqYg+2zDRWZoirgMjzqEm+oO6ympxuJAE0ksmwy1jorHFMMzuRBpvTsbqtvA2W+
	lp2roT1n1wlRqmvgj54+bor/g3+KFz1DEc5lHJqYa5rcvjpiURgDrc+xMIDASewG1h+7
	OeQTpCqje59/8ifJrOCRBIpu45zhglx/c15H0gJNLhA6TOfUpyjvDwvADGMa29BRRey9
	tTPg==
X-Gm-Message-State: APjAAAUlLA5omszqr0sCYkBZirfEDvpnSzc9FJT6AQ+NtY3xirtjyrhW
	VZ+LmAFkuPyc/TSdhNcVhCM=
X-Google-Smtp-Source: APXvYqzsrh1pXrrjbz0mpW6JW6WFtL7FpgUeFkznNcCzoO0wwuYW/D9Pm/GAV77MHwfbXtPDXnmwPw==
X-Received: by 2002:a1c:39d7:: with SMTP id g206mr11137366wma.99.1554116047813;
	Mon, 01 Apr 2019 03:54:07 -0700 (PDT)
Received: from localhost ([80.87.24.155]) by smtp.gmail.com with ESMTPSA id
	h2sm22049855wro.11.2019.04.01.03.54.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 01 Apr 2019 03:54:07 -0700 (PDT)
Date: Mon, 1 Apr 2019 10:09:40 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jules Irenge <jbi.octave@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20190401090940.GB643@stefanha-x1.localdomain>
References: <20190330112142.14082-1-jbi.octave@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uQr8t48UFsdbeI+V"
Content-Disposition: inline
In-Reply-To: <20190330112142.14082-1-jbi.octave@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::335
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] util/readline: Add braces
 to fix checkpatch errors
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
X-List-Received-Date: Mon, 01 Apr 2019 10:54:12 -0000


--uQr8t48UFsdbeI+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 30, 2019 at 11:21:42AM +0000, Jules Irenge wrote:
> Add braces to fix errors issued by checkpatch.pl tool
> "ERROR: braces {} are necessary for all arms of this statement"
> Within "util/readline.c" file
> ---
>  util/readline.c | 50 ++++++++++++++++++++++++++++++++-----------------
>  1 file changed, 33 insertions(+), 17 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--uQr8t48UFsdbeI+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcodVUAAoJEJykq7OBq3PIQs4IAL1KO/k5XCuPVkgft1Gx8yYF
W0OcaD0HVqUYnoxH9uaX8RIpZSN9GpKSVJ8RaWKmrzXS09HQf7XavjibOvig683t
rq5qsVu/wusAHX9ss3oXytyMYAuy/2EIlxB7YxSACCdB3Nbvnx1rHrjzSv/QfCV1
h77lsKQeqb2BSGgvC/hHH0ZCKE7BVtSdFmLcLxb58cN9rdWWaUsJYaCCqi0rX9aB
b9DlH3YGBc0BDHFP/p+fYQXJl2DTNmafTqUSrOn2S77o3PpiVy+s+djVdKFX4cNk
HriINteqygmCKJFKY0OXvRZdfBjDfKLhzuJBA2m0XZxaHYDgCuz2s7DKmyOhNSU=
=owFV
-----END PGP SIGNATURE-----

--uQr8t48UFsdbeI+V--

