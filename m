Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e7jGr-0005X8-FS
	for mharc-qemu-trivial@gnu.org; Thu, 26 Oct 2017 10:36:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e7jGn-0005V7-BS
	for qemu-trivial@nongnu.org; Thu, 26 Oct 2017 10:36:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e7jGm-0006Nm-Hb
	for qemu-trivial@nongnu.org; Thu, 26 Oct 2017 10:36:29 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:50855)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e7jGm-0006Mv-9h
	for qemu-trivial@nongnu.org; Thu, 26 Oct 2017 10:36:28 -0400
Received: by mail-wm0-x244.google.com with SMTP id s66so3331415wmf.5
	for <qemu-trivial@nongnu.org>; Thu, 26 Oct 2017 07:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=C2icBD95VSE0AkV/yv+bqJ83vktnQw4oNTXhuQkrhsQ=;
	b=fY4uQTy1my9lFBK+cFol52txssro7V+RgAKAHYWV6jIbnNLVHEGsGnKdD+Tm0+3IuC
	Uw6o2aKChOF6shBETSl8YHdeN+yZ9UPP9Ozhd7RojyeJcDDI1orGjbQQeWTVSPsyk0H8
	/l4o0rExX8bCcX/3keru7qF7wXB0Xf7gmUdYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=C2icBD95VSE0AkV/yv+bqJ83vktnQw4oNTXhuQkrhsQ=;
	b=UvLPwUVes33Hj7ydgkMUJK+O9m2lhZjGEJ0x8k/B3HctCYPx4+WGxZHcij1d8iEUX1
	oGtGbMjO2hQlhdTeTCq222b21SlwlfOGUIFP7jYlhDivrIzJ7KfbWuOUoQikvIvAsPZd
	ykindegF18CedJjXXCAXkgshnui7RaN+IoyLTpXvz+r+YLrXlKigtY4WjK2IQLCo0pho
	gZcaAUH0egMjwqqJyRjGscvLH2qXHaHXXD5O3Sa5uXtdQjTJPW18Vh16qGkfdZXqpVxS
	yLDAVwf81UgDxq2BFRHl/VfCPgQfZAPrXla0pmaBkSY34+JehRvnqjApFESP+69n2i8E
	tVCg==
X-Gm-Message-State: AMCzsaU8/LINHY5K8OI+6c62UGtp0AvVuLERWrybH1FvTtguCpKWlTcs
	eM+vra2BMwKaYcRS84DD4auT1HZA3vnfi3VjagCG7g==
X-Google-Smtp-Source: ABhQp+TSTLMAL+jpB3TRYIUrGkExQrUuYPDkXgKyW7vOSI1KjO1MQonuo86htah04kLtnW4nmL4Odr5CgVZbHH/tY+s=
X-Received: by 10.28.92.136 with SMTP id q130mr1693085wmb.35.1509028587128;
	Thu, 26 Oct 2017 07:36:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Thu, 26 Oct 2017 07:36:06 -0700 (PDT)
In-Reply-To: <CAHmME9oyBvAV8FF9QMHyF46n8Ct6KZqThQVih2ipQmivD94Cag@mail.gmail.com>
References: <20171023122719.17199-1-Jason@zx2c4.com>
	<CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
	<10e16ca3-175b-9f34-65e7-031b883b7201@amsat.org>
	<CAHmME9qtBiuAEnkCeuMd7EdeZveTVa4UOf+AQhMCFye0SYJY=Q@mail.gmail.com>
	<20171026133445.kemzfgvpbmtcogsl@kamzik.brq.redhat.com>
	<CAHmME9oyBvAV8FF9QMHyF46n8Ct6KZqThQVih2ipQmivD94Cag@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Oct 2017 15:36:06 +0100
Message-ID: <CAFEAcA8O6YyS1tSzaydckFpsqpb8HXgW5PJe-VTWud_5YGdW5A@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andrew Jones <drjones@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-arm] [PATCH] hw/arm/virt:
 support 4 serial ports
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
X-List-Received-Date: Thu, 26 Oct 2017 14:36:31 -0000

On 26 October 2017 at 15:13, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> The problem with this approach is that then different architectures
> need different fancy options, which makes things a hassle. With the
> old guarantee of each machine providing four serial ports

This has *never* been guaranteed or indeed true. It's just happened
to be true for the x86 PC machine and perhaps for some others that
you've been using. For instance, the MIPS boston board only has
one uart. highbank has one. integratorcp has 2. The microblaze
boards only have one uart. And so on. In cases where we're
modelling real hardware, if the real board only has one UART
then we're only going to provide one UART, so in some cases you
just have to deal with that and have some way in your communication
protocol to multiplex across a single communications channel.

> Could we just do the simple patch of adding four pl011s in there?

I'm still thinking about this. (You definitely can't have four,
though, because we already have 2 in the trustzone-enabled
config, so we can only add another 2.)

thanks
-- PMM

