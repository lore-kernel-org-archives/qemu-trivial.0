Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db8Qc-0004ZX-H6
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 12:47:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1db8Qa-0004Xv-6x
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 12:47:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1db8QZ-0002cP-09
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 12:47:52 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:36851)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1db8QY-0002ZT-Om; Fri, 28 Jul 2017 12:47:50 -0400
Received: by mail-wm0-x243.google.com with SMTP id 184so28069611wmo.3;
	Fri, 28 Jul 2017 09:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=2V7lLz1BDbnKURw25/zqw9o68FkLUTdl8YCJBVGawes=;
	b=grtJMv5tKFRgYYOCkA39f/oHEfMjxs0kkx+pQz6+s6pvD+A83fsC4bVNyIBTsYt3Qy
	+YBWe7oxE4QzsFhPmzTVXSX9/laFRo60bBCXCm2jy6JWWWVo3NdRok1BHr9z1HT3KQgg
	nLdEJrm4dXEmssn8KgLN3L1Q+En6TIoDtPmF6Uk1JsMfYIHYeQ9P52qneUXDhRenTR09
	MRgyEzY5MCYpdO8ZHi9iAgDtVMkKiAKc5tx4GYUjgxBsW4iHkRqPEcfLLfN9tpuOdP0m
	5xUzoI/X3ASK2weulpuWuFdTM5ysLlf1XP281xAM4c8faCEy4a7pUUZ6L3nAHIW0l11Q
	swDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=2V7lLz1BDbnKURw25/zqw9o68FkLUTdl8YCJBVGawes=;
	b=hm9wBkQgaYbGAXhYBFklishomt+PruEKR7oCxRd7pDVlmXvICuXJCgY0A7wB2LeEnx
	z99N+6VPXPSbRvl4Pv+vCy7Nc4mvzKcTtpOLij20yiqL6l7ceTvOw+ymvG0JrQ+I0478
	0WttQmOJlEpjfpNBlt9L+YUhEaMbv/lSI+Fvh9cwqOV87pGqgo6Vnb9bTfgqwABMxt1g
	hYJF4Qt2pmWJvUAdalphhLSb+vOWA30f65UbFfYZnQA8d5PdeMBWpR6H/lnOaPupAs++
	XLG3S0VOSxYcJdricY77PI1PxU0MNM24Bx2kLm3tjch9PLL0dXE17+DrTwDwt2Tk0yH/
	tEBw==
X-Gm-Message-State: AIVw112W+adxQXVJbxtEs3JwR3RCWg7O2HeONCrCQzRg/bWnn0x7cc2y
	+rk1q0D4b2S5+QY/EDKsgTIJvIbqzg==
X-Received: by 10.28.20.76 with SMTP id 73mr6164176wmu.66.1501260466863; Fri,
	28 Jul 2017 09:47:46 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.191.88 with HTTP; Fri, 28 Jul 2017 09:47:16 -0700 (PDT)
In-Reply-To: <20170728053610.15770-46-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-46-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 28 Jul 2017 09:47:16 -0700
X-Google-Sender-Auth: Z9Ligl_hg5dPL1bYr2yduOYAtRI
Message-ID: <CAKmqyKNdP8aHTWo1XdAqjQt4tXXNOn4ORaXgcZKa=+zxSY-CVg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Alistair Francis <alistair.francis@xilinx.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [RFC PATCH 45/47] MAINTAINERS: add
 missing entries for loader
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
X-List-Received-Date: Fri, 28 Jul 2017 16:47:53 -0000

On Thu, Jul 27, 2017 at 10:36 PM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>
> RFC because I'm not sure 'loader' is the same goal than 'generic-loader'

loader.c is not the same, it is the core loading framework for QEMU
while generic-loader is just something that uses it. This greatly
increases the amount on maintainership here.

In saying that if no one else wants it I can maintain it.

Thanks,
Alistair

>
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dc1a69051c..224890643d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1196,6 +1196,8 @@ M: Alistair Francis <alistair.francis@xilinx.com>
>  S: Maintained
>  F: hw/core/generic-loader.c
>  F: include/hw/core/generic-loader.h
> +F: docs/generic-loader.txt
> +F: hw/core/loader.c
>
>  CHRP NVRAM
>  M: Thomas Huth <thuth@redhat.com>
> --
> 2.13.3
>
>

