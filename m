Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjsH2-0006ot-GQ
	for mharc-qemu-trivial@gnu.org; Fri, 03 Mar 2017 13:49:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42607)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjsGz-0006o1-FY
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:49:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjsGy-0005Y2-IK
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:49:49 -0500
Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a]:33258)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjsGy-0005Xj-BQ
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:49:48 -0500
Received: by mail-wr0-x22a.google.com with SMTP id u48so79651791wrc.0
	for <qemu-trivial@nongnu.org>; Fri, 03 Mar 2017 10:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8DtoWLTKUCBpoRAMK27ETkWW5fLiRqBZ9qJEAYspOg4=;
	b=d866+E4x9D2bV8E5ucGhK3vnDFrSW0j7NryRENOsZ1A3PMNv5OJr0hyk4TqdGiN0Ft
	AVeJvRtCxDuuhZwPBHmOC9CE6duQmjxuEw5SMzeiMtVgO7x6SwXRxDM/C0yY/qbfUjgb
	SVPIDnL+jVWG9ON68vzVXUPSf5SsEOmGkyvSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8DtoWLTKUCBpoRAMK27ETkWW5fLiRqBZ9qJEAYspOg4=;
	b=ClU44eZr12dXGyJ98rXaxkq8qY5MgrRrPOhViBFHI1ri1OdC3apvnvwXMb3hTt6GZR
	KHJJXPUtuuwGJY1xOKDhtfKKuwwzRbu8iaKO++UzlFGRWmf39GGYqjuLz2Z+GJM65qyV
	3303O91ZktRxkPD/nDWMDq5YVRBTyMwCFmeNb6H+XVNAARvOPUw7ehSiwZBZMho9/U27
	cuMz5kfXpx3IihZlBkba/lplVI0FQit/jiEupLFPhxhxMCHXddyFbdz25fjsGVhQ6ETl
	ruF0bKT6qpZyW/xl34IG8hqsxdZJ5i0km0Os11FmTV+Xos7UiSXfgEStM55ZKJv7iWvo
	TIww==
X-Gm-Message-State: AMke39lq5PV0CMbGCnIych7U0odqgd2Dzzikvd5zLNYI6PfuIF12MtM3uig15f3ZsZ7ytqavOf1oP3YDQ1nl53Jb
X-Received: by 10.223.150.205 with SMTP id u71mr3917988wrb.195.1488566986834; 
	Fri, 03 Mar 2017 10:49:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Fri, 3 Mar 2017 10:49:26 -0800 (PST)
In-Reply-To: <alpine.BSF.2.20.1703030259350.33600@zero.eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<6b70a9dfe56c3a0dc8e874c45d70612aff7b8e3a.1488068248.git.balaton@eik.bme.hu>
	<CAFEAcA9FL-sshVzKewf+rCs6-5_c2Y86Qy0b=3DMog4MrVOpwA@mail.gmail.com>
	<alpine.BSF.2.20.1703030259350.33600@zero.eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2017 18:49:26 +0000
Message-ID: <CAFEAcA-PUcPaOPOXXhab1N=YAHja0xCf5yaZYm5m0p1=j6A=WA@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22a
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
X-List-Received-Date: Fri, 03 Mar 2017 18:49:50 -0000

On 3 March 2017 at 02:15, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Maybe it's not correct but works for everything I could test better than the
> original code (which was broken even for the SH images one can find) so I
> think we could just go with this until someone complains and provides a test
> case. I've given up on trying to understand it because I don't really know
> this device and SH so I could only go by the images I could find and they
> seem to like it this way.

So what cases have you tested? The Linux kernel seems to support:
 * sh embedded device, little endian
 * PCI card, little endian host
 * PCI card, big endian host
and there are also
 * 16 bit pixel format
 * 32 bit pixel format

which makes 6 different combinations.
(It's a shame there's no sh4 BE code to run on this.)

>> Looking at how the SWAP_FB_ENDIAN flag gets set:
>> * for the r2d board it is set always
>> * for PCI devices, it is set only if big-endian
>>
>> I suspect that what we actually have here is something
>> like:
>> * for the PCI device it's always little endian (and the
>>   code ought not to need to depend on TARGET_WORDS_BIGENDIAN)
>> * sysbus device may be more complicated
>>
>> Also I note there's an SM501_ENDIAN_CONTROL register on the
>> device, which presumably if written changes the behaviour.

> I've seen this but it's not emulated so it can be ignored for now. The spec
> also says that default is little endian so for regs at least
> DEVICE_LITTLE_ENDIAN should be OK.

Yes, that makes sense. So we should be modelling this as an "always
little endian device".

The changes you have to the memory region ops achieve this for
the registers implemented in this device itself. It looks like
SYSBUS_OHCI is already always little endian. You also need to
change the argument to the serial_mm_init() call to pass
DEVICE_LITTLE_ENDIAN.

thanks
-- PMM

