Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ckpwV-00026k-Jv
	for mharc-qemu-trivial@gnu.org; Mon, 06 Mar 2017 05:32:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ckpwT-00026G-Dz
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 05:32:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ckpwS-0008W9-ED
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 05:32:37 -0500
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:35989)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ckpwS-0008Vu-9N
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 05:32:36 -0500
Received: by mail-wm0-x22e.google.com with SMTP id n11so60022323wma.1
	for <qemu-trivial@nongnu.org>; Mon, 06 Mar 2017 02:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6Be8il6GYglSEp7eqZsM3kdnoqZJmcEaNJZm7GAFu2E=;
	b=AMMkiyLdz8zGgkRg7TiU+c/2bukcKpAlCNWZuP4Y/zyW657g3pRJzHwYfQsH4AUyCo
	NuD36T2JPyJIJvgVce2yW1KQ1nIVNCam+dT0w3QFTA2XIJ6oxWW+eRengjqK9m1q++GQ
	vdPw4wkUaelJHeZD/qRAxI2BUFCDmkgBZJ2ug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6Be8il6GYglSEp7eqZsM3kdnoqZJmcEaNJZm7GAFu2E=;
	b=hM7071ojjo2y0PXz0lezOlQcE4hhYr72CQbr1jdzlgccXmYML8C0gwxgBDl1JO6B/R
	63gfOwQ0Qfgksg8RsSy/BIjVGzPhlAm25yNOtCVhcowewq0kWUMZ/pqhkwftPh9G3i3R
	ubR1WfYV1yJz2NjwbiK9hZ6ylYFQ/00sBpZBycQL6YuteUvBqJFofBsQPUXrCvFFShpn
	x69/XGqGuidcj8OPBjyw9vpYEp1l7LM/V0xyimdcqyHpusS7bUzKPNq6OFiiHkasBGmh
	aFCui0etcdTNcIJL6D5vOyWC67XuA0ySbvcXQJoN8LZuGulAgtfWswerbydj3rZVVq32
	FF0A==
X-Gm-Message-State: AMke39na9qMXDyuL79cSmWNBk3x1X+KBfvJQZCvoDo/C6E6I/Ec+Fo3kTA/5OPqt8iKMSPVEfEiA5c6vRCtkAgVe
X-Received: by 10.28.16.70 with SMTP id 67mr13247536wmq.142.1488796355235;
	Mon, 06 Mar 2017 02:32:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Mon, 6 Mar 2017 02:32:14 -0800 (PST)
In-Reply-To: <alpine.BSF.2.20.1703042344460.63482@zero.eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<6b70a9dfe56c3a0dc8e874c45d70612aff7b8e3a.1488068248.git.balaton@eik.bme.hu>
	<CAFEAcA9FL-sshVzKewf+rCs6-5_c2Y86Qy0b=3DMog4MrVOpwA@mail.gmail.com>
	<alpine.BSF.2.20.1703030259350.33600@zero.eik.bme.hu>
	<CAFEAcA-PUcPaOPOXXhab1N=YAHja0xCf5yaZYm5m0p1=j6A=WA@mail.gmail.com>
	<alpine.BSF.2.20.1703032100430.14293@zero.eik.bme.hu>
	<CAFEAcA_KxS6J3Mzrc+ijg0LGdxZsk_FDd9xAExGROgWYn-3qyQ@mail.gmail.com>
	<alpine.BSF.2.20.1703042344460.63482@zero.eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2017 10:32:14 +0000
Message-ID: <CAFEAcA9euFa=fypaZaO5prpNQ6mdCmaSZgu3dofVgh2bYcSSxA@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22e
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 07/14] sm501: Fix device
 endianness
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
X-List-Received-Date: Mon, 06 Mar 2017 10:32:38 -0000

On 4 March 2017 at 22:58, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> On Sat, 4 Mar 2017, Peter Maydell wrote:
>> Right, but we should test the PCI-on-a-little-endian CPU
>> case, because right now your code has #ifdef TARGET_WORDS_BIGENDIAN
>> in it which means that the PCI device will behave differently
>> on big and little endian CPUs, and you have a case that you
>> haven't tested.
>
>
> I could not find an image to test this. I've tried removing the sysbus
> version from SH and add a PCI one instead but then Linux did not seem to
> find the card.

I was thinking about testing the PCI card on x86.

> I could not find any other OS images that would have this
> combination that is also known to work on any real hardware so I think if
> someone ever finds a problem with such combination then we can fix it when
> having a test case, since I could not figure out theoretically what should
> be the right way.
>
>> (At the moment with the set of cases you've tested the
>> sh embedded device ones will always be using the "not
>> TARGET_WORDS_BIGENDIAN" code and the PCI-on-PPC will
>> always use the "is TARGET_WORDS_BIGENDIAN" code. But
>> TARGET_WORDS_BIGENDIAN set/not set is orthogonal to
>> PCI-vs-embedded.)
>
>
> Why do you think that framebuffer endianness is dependent on PCI-vs-embedded
> as opposed to target endianness? The latter seems more plausible to me.

The PCI card should behave the same way whether you plug it
into a PPC system or an x86 system (since it's the same
hardware). So code in the handling of the PCI card that
looks at TARGET_WORDS_BIGENDIAN is suspicious.

thanks
-- PMM

