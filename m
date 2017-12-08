Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eNNYX-00063k-Mt
	for mharc-qemu-trivial@gnu.org; Fri, 08 Dec 2017 13:39:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1eNNYU-00062C-Iv
	for qemu-trivial@nongnu.org; Fri, 08 Dec 2017 13:39:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1eNNYT-00048F-QW
	for qemu-trivial@nongnu.org; Fri, 08 Dec 2017 13:39:26 -0500
Received: from frisell.zx2c4.com ([192.95.5.64]:59967)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Jason@zx2c4.com>)
	id 1eNNYP-00046O-Hi; Fri, 08 Dec 2017 13:39:21 -0500
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ccd8da93;
	Fri, 8 Dec 2017 18:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
	:in-reply-to:references:from:date:message-id:subject:to:cc
	:content-type; s=mail; bh=sZZpzd3xIlTcsCW867dNLE8bXt4=; b=rMKTxD
	NU/vVxFYWUfhVh2FGgOzgcIUYgyACE0nYZzASOuY3bHCw2d1BCJb95epJXcEoyQj
	YbG/g7BHV6mCFKd8GfsiTVeZc9UpbQpG9Jw8Y6knWOaVJFHG0Rr/jmY+4/ZD+iv9
	tekys2X8GitO+J85yhQFBfSVw+RcqbpFbHYiif8Dc5nOnx4KG9i+sOg+zemXKSbz
	P0AD2o5xWhUvjxjctWLHaLuamelhVJ2Co2pYdwIZ9stjrSnjGdURybpH5CDVz5qY
	iHFnDUkjNIWiMLkQ4I+UEMKdRjrTjcamiQdJ7Whbb/qd3A0x5IobHpZdjMGjrgoE
	JUkHP29qoNO7yJHA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ebd2dd5f
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO); 
	Fri, 8 Dec 2017 18:32:04 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id v21so9916238oth.6;
	Fri, 08 Dec 2017 10:39:15 -0800 (PST)
X-Gm-Message-State: AJaThX64Wr9xjFhn2cd89Lh2xMP/0dyx+xR0xyIrxZsKKnvAft9m039y
	qtKj1Rag3CmQL+SGF1r2tfnWtlBslsJRxcs/3HA=
X-Google-Smtp-Source: AGs4zMYvP7eYSJ0scugH0Ma60zT72x5Q7SLsyfuO8S2ckabvvNUMmE1OxrkH/02tVKDJePXeGQABmxjnSFja2aoWnj4=
X-Received: by 10.157.3.166 with SMTP id f35mr29096318otf.155.1512758355006;
	Fri, 08 Dec 2017 10:39:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.74.56.78 with HTTP; Fri, 8 Dec 2017 10:39:14 -0800 (PST)
In-Reply-To: <CAFEAcA-5F2GMx9UNoH=LJAa-m1DXg2HW8PJZ47kurjx5x3NhWA@mail.gmail.com>
References: <20171023122719.17199-1-Jason@zx2c4.com>
	<CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
	<10e16ca3-175b-9f34-65e7-031b883b7201@amsat.org>
	<CAHmME9qtBiuAEnkCeuMd7EdeZveTVa4UOf+AQhMCFye0SYJY=Q@mail.gmail.com>
	<20171026133445.kemzfgvpbmtcogsl@kamzik.brq.redhat.com>
	<CAHmME9oyBvAV8FF9QMHyF46n8Ct6KZqThQVih2ipQmivD94Cag@mail.gmail.com>
	<CAFEAcA8O6YyS1tSzaydckFpsqpb8HXgW5PJe-VTWud_5YGdW5A@mail.gmail.com>
	<CAHmME9pE79krWx-zD=VGiScT4c=4TZ1wVxYFiF3m+8wsx9Fqeg@mail.gmail.com>
	<CAFEAcA9XoeXDCQCmRBehntWSo0WGRBsaMDmC8QCqgU1K8jAF_A@mail.gmail.com>
	<CAHmME9qSJSPjANce_cWN6nm=qJsncfczgk7PoPa0xkOHmZjLUA@mail.gmail.com>
	<CAFEAcA-bKPNwJpcny=1azScO8bzHsi0Ou+m3rYPq-=v52Gf26g@mail.gmail.com>
	<CAHmME9qNnqYEbW_m8LG0E0HBKUE38YjUodbBihnSi2k0FrZJtw@mail.gmail.com>
	<CAFEAcA-5F2GMx9UNoH=LJAa-m1DXg2HW8PJZ47kurjx5x3NhWA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 8 Dec 2017 19:39:14 +0100
X-Gmail-Original-Message-ID: <CAHmME9rSEtwg=n1gtqOVh=Et5yn45Yveh3LEFj357aqRZXwwcQ@mail.gmail.com>
Message-ID: <CAHmME9rSEtwg=n1gtqOVh=Et5yn45Yveh3LEFj357aqRZXwwcQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jones <drjones@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 192.95.5.64
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
X-List-Received-Date: Fri, 08 Dec 2017 18:39:27 -0000

On Fri, Dec 8, 2017 at 12:49 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> Now that the 2.11 release is mostly out of the way, I've been
> working through some of my other todo list items so I've
> come back to this thread.
>
> My suggestion is that we should add a second non-secure UART
> to the virt board, so if you're using secure=no then you
> get serial 1 and 2, and for secure=yes serial 1 is the first
> NS uart, serial 2 is the secure uart and serial 3 is the
> 2nd NS uart. (I don't really want to add a 4th uart unless
> there's some good reason to -- maybe we would turn out to
> want it for the secure side, for instance.)
>
> I'll probably write a patch for this next week, unless you
> want to do it.

Sounds great to me. Thanks!

I'm curious why you don't want to add a 4th UART. It seems trivial to
do, and the more the merrier? Or that's a silly attitude? Mostly just
curious about that, as having two personally suits my needs.

