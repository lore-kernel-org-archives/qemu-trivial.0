Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ck8zN-00088m-Co
	for mharc-qemu-trivial@gnu.org; Sat, 04 Mar 2017 07:40:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56640)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ck8zK-00088C-7o
	for qemu-trivial@nongnu.org; Sat, 04 Mar 2017 07:40:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ck8zI-0005J9-TL
	for qemu-trivial@nongnu.org; Sat, 04 Mar 2017 07:40:42 -0500
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236]:36355)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ck8zI-0005I7-MZ
	for qemu-trivial@nongnu.org; Sat, 04 Mar 2017 07:40:40 -0500
Received: by mail-wm0-x236.google.com with SMTP id n11so33194357wma.1
	for <qemu-trivial@nongnu.org>; Sat, 04 Mar 2017 04:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SEBXq9Xjk1VT5JfJZ200Wx0w2/6NYLXZtX/hxveg/k4=;
	b=PDM+1S2RkXkrhxRy4zT84o2GMsvsi+3uo8MEDKCJWAd/tmR8Y0Li8iyNJ3eOtSgp62
	VSR6XUyf5kzINiadM6zId4nmTu2JeF1ZzZBzlhrjIgE08m55epFGgPQInBrpZGzsPSX/
	PuM+yxXTmmHJ/oepbQgU/nXuxo6wT1aipkTbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SEBXq9Xjk1VT5JfJZ200Wx0w2/6NYLXZtX/hxveg/k4=;
	b=UdnmM0Wo3b0PLjVR37SyXGBHGAwqNbzfP4Jfgk/cwSixs9+Dm01/Jr1nVHgVFz117a
	htHW1sbLq2PdSm8omPUYyLTsNy8+l4c6c4NxZhvJ5OqO54nBqRucIFIMGomNjvhY0yT3
	ND0Px3DcdSmQGJRGA6zbUR1DPR2WOI+yOp3H7gHG7S9tGeJWIF2zLcdzvPCTlh1TadH5
	NV3QpGONd2FbWHCV/lB5l8KZmsQe7T+gqw84OWneuvVGL5IYV6X7dItSBPEhFoNGsO3m
	v+tHYtykxWZqaERQplfQiruYkxksL0yWBNwsZhw24tQQg7rDawccqA4F90UIHbqfl+5K
	GSmQ==
X-Gm-Message-State: AMke39mCZPQQ1pyA3wqINl90vO2wBZab8sBBfExviixl2SHpIEm+cvuJOxON2PHbXiO2FrDEbUotPy9biIIY0NBf
X-Received: by 10.28.226.215 with SMTP id z206mr6205927wmg.92.1488631237815;
	Sat, 04 Mar 2017 04:40:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Sat, 4 Mar 2017 04:40:17 -0800 (PST)
In-Reply-To: <alpine.BSF.2.20.1703032100430.14293@zero.eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<6b70a9dfe56c3a0dc8e874c45d70612aff7b8e3a.1488068248.git.balaton@eik.bme.hu>
	<CAFEAcA9FL-sshVzKewf+rCs6-5_c2Y86Qy0b=3DMog4MrVOpwA@mail.gmail.com>
	<alpine.BSF.2.20.1703030259350.33600@zero.eik.bme.hu>
	<CAFEAcA-PUcPaOPOXXhab1N=YAHja0xCf5yaZYm5m0p1=j6A=WA@mail.gmail.com>
	<alpine.BSF.2.20.1703032100430.14293@zero.eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 4 Mar 2017 12:40:17 +0000
Message-ID: <CAFEAcA_KxS6J3Mzrc+ijg0LGdxZsk_FDd9xAExGROgWYn-3qyQ@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::236
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
X-List-Received-Date: Sat, 04 Mar 2017 12:40:43 -0000

On 3 March 2017 at 20:11, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> On Fri, 3 Mar 2017, Peter Maydell wrote:
>> So what cases have you tested? The Linux kernel seems to support:
>> * sh embedded device, little endian
>> * PCI card, little endian host
>> * PCI card, big endian host
>> and there are also
>> * 16 bit pixel format
>> * 32 bit pixel format
>>
>> which makes 6 different combinations.
>> (It's a shame there's no sh4 BE code to run on this.)
>
>
> As mentioned before I've used this image to test SH:
>
> https://people.debian.org/~aurel32/qemu/sh4/
>
> with video=800x600-16 kernel parameter where changing -16 to different bit
> depths (8, 32) reproduces the problem. On ppc I've tested with MorphOS which
> uses 16 bpp, Linux and U-boot which I think uses 8 bit. These run on real
> hardware so I think if they work the emulation should be OK.
>
> You've said before that PCI is likely always little endian and SH embedded
> is LE too so unless something uses the device in BE mode (which we don't
> emulate) setting it to little endian should be correct. For frame buffer
> endianness I can only go with what I've seen clients doing and my patch does
> what worked for the above on SH and PPC. I can't prove it's correct but
> works for the systems I've targeted and also fixes the SH case which seemed
> to be broken.

Right, but we should test the PCI-on-a-little-endian CPU
case, because right now your code has #ifdef TARGET_WORDS_BIGENDIAN
in it which means that the PCI device will behave differently
on big and little endian CPUs, and you have a case that you
haven't tested.

(At the moment with the set of cases you've tested the
sh embedded device ones will always be using the "not
TARGET_WORDS_BIGENDIAN" code and the PCI-on-PPC will
always use the "is TARGET_WORDS_BIGENDIAN" code. But
TARGET_WORDS_BIGENDIAN set/not set is orthogonal to
PCI-vs-embedded.)

thanks
-- PMM

