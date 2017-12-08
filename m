Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eNH9o-0002jA-2Z
	for mharc-qemu-trivial@gnu.org; Fri, 08 Dec 2017 06:49:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eNH9m-0002il-AQ
	for qemu-trivial@nongnu.org; Fri, 08 Dec 2017 06:49:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eNH9l-0005DR-D4
	for qemu-trivial@nongnu.org; Fri, 08 Dec 2017 06:49:30 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:35271)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eNH9l-0005DC-7r
	for qemu-trivial@nongnu.org; Fri, 08 Dec 2017 06:49:29 -0500
Received: by mail-oi0-x241.google.com with SMTP id 184so7025888oii.2
	for <qemu-trivial@nongnu.org>; Fri, 08 Dec 2017 03:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=i34iCx8wVKW3DpP/aSf7ZG+3YcW+HIk2RckyVWswt4M=;
	b=B8Y1zPu5ABPWf0oYZND4kJTJDmI8Xt+CwS4tydS2cTUIR5LQYx5lu09eliFdHRobeO
	avCMhhZsdaW8mKZN/Qlk3PPWmmmUZDoRcxwIOG9AL8Cksv+SNwuoJ4NijS1orc14lwcT
	Yj+AxUqGyKP486aRD2IhW2+8nVBHq+3fAxUkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=i34iCx8wVKW3DpP/aSf7ZG+3YcW+HIk2RckyVWswt4M=;
	b=WhBYTL8oB8UVOfnNKuk+/VHNzP1bkTly0jpoRb4Fz4hdg5F4+Xb/jMDtcLSzY3OY2C
	cRLMqsQpRdIcLMfdTsA5ORugtbxwo4/QnJZIbmdb5b64MUy7TeAMP3D/EUH/ra2nwcA5
	Ke5/x+2Uxt8BC6Xqc1jCPrddYgwc5wW6Ti8EaNIzXbVrEsksNK2K2PQEEWP8rlFDae2P
	71Q9gkxwD6mnQSPo5TNidzGU0O1YPl15E75vfbiU8MTWXUP531XXKFo5OsFHDruu3ucw
	IocjPrHD0MVeb1Ux+KuOHnC5aEMj9r/m8D6Z5v2Ct6DQFZb0am0q4bt4nKQhFrqG+YpK
	35cQ==
X-Gm-Message-State: AJaThX6n191xP5mVCF3CfVfV+mR0bXZIq+MtHq3Rqgfy/gUGSENtS1YP
	15prLwsvw0G4+fHImxQykRrXRJXx9rrvxoN25HNUOw==
X-Google-Smtp-Source: AGs4zMbCI1J+3wB9/6lOE/0HB28OseoLxvn9jvXwkf9/RZgxxhdG06qHCvhrKv+WPnmAIG94WstuU1+bTd0kPfS5b+8=
X-Received: by 10.202.199.134 with SMTP id x128mr25946088oif.63.1512733768274; 
	Fri, 08 Dec 2017 03:49:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Fri, 8 Dec 2017 03:49:07 -0800 (PST)
In-Reply-To: <CAHmME9qNnqYEbW_m8LG0E0HBKUE38YjUodbBihnSi2k0FrZJtw@mail.gmail.com>
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
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Dec 2017 11:49:07 +0000
Message-ID: <CAFEAcA-5F2GMx9UNoH=LJAa-m1DXg2HW8PJZ47kurjx5x3NhWA@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andrew Jones <drjones@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
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
X-List-Received-Date: Fri, 08 Dec 2017 11:49:31 -0000

On 26 October 2017 at 18:31, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On Thu, Oct 26, 2017 at 6:41 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> Those are primarily about migration compatibility -- you should
>> be able to live migrate a guest from QEMU 2.6's virt-2.6 machine to
>> QEMU 2.7's virt-2.6 machine. That's a stricter requirement than
>> the compatibility we want to keep for non-versioned machines,
>> where generally we don't want to break command lines but are OK
>> to make changes if they don't break those existing uses.
>>
>> Command lines get baked into all sorts of scripts and so they're
>> effectively part of QEMU's "ABI". People don't like it when we
>> break their previously working flows :-)
>
> Fair enough. So in that case, secure=no means serials 1-4 are for
> kernel. With secure=yes, serials 1,3-5 are for kernel, with serial 2
> being for trustzone. Seems like that's the best of all worlds.

Now that the 2.11 release is mostly out of the way, I've been
working through some of my other todo list items so I've
come back to this thread.

My suggestion is that we should add a second non-secure UART
to the virt board, so if you're using secure=no then you
get serial 1 and 2, and for secure=yes serial 1 is the first
NS uart, serial 2 is the secure uart and serial 3 is the
2nd NS uart. (I don't really want to add a 4th uart unless
there's some good reason to -- maybe we would turn out to
want it for the secure side, for instance.)

I'll probably write a patch for this next week, unless you
want to do it.

thanks
-- PMM

