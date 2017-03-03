Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjtXw-0007Eb-UG
	for mharc-qemu-trivial@gnu.org; Fri, 03 Mar 2017 15:11:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1cjtXt-0007Cl-SC
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 15:11:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1cjtXs-0003Dl-PW
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 15:11:21 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:48392)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1cjtXn-00039q-1D; Fri, 03 Mar 2017 15:11:15 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 555617456D4;
	Fri,  3 Mar 2017 21:11:06 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id AB93D7456BC; Fri,  3 Mar 2017 21:11:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id A9AB77456AD;
	Fri,  3 Mar 2017 21:11:05 +0100 (CET)
Date: Fri, 3 Mar 2017 21:11:05 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
cc: QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
In-Reply-To: <CAFEAcA-PUcPaOPOXXhab1N=YAHja0xCf5yaZYm5m0p1=j6A=WA@mail.gmail.com>
Message-ID: <alpine.BSF.2.20.1703032100430.14293@zero.eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<6b70a9dfe56c3a0dc8e874c45d70612aff7b8e3a.1488068248.git.balaton@eik.bme.hu>
	<CAFEAcA9FL-sshVzKewf+rCs6-5_c2Y86Qy0b=3DMog4MrVOpwA@mail.gmail.com>
	<alpine.BSF.2.20.1703030259350.33600@zero.eik.bme.hu>
	<CAFEAcA-PUcPaOPOXXhab1N=YAHja0xCf5yaZYm5m0p1=j6A=WA@mail.gmail.com>
User-Agent: Alpine 2.20 (BSF 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
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
X-List-Received-Date: Fri, 03 Mar 2017 20:11:23 -0000

On Fri, 3 Mar 2017, Peter Maydell wrote:
> On 3 March 2017 at 02:15, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> Maybe it's not correct but works for everything I could test better than the
>> original code (which was broken even for the SH images one can find) so I
>> think we could just go with this until someone complains and provides a test
>> case. I've given up on trying to understand it because I don't really know
>> this device and SH so I could only go by the images I could find and they
>> seem to like it this way.
>
> So what cases have you tested? The Linux kernel seems to support:
> * sh embedded device, little endian
> * PCI card, little endian host
> * PCI card, big endian host
> and there are also
> * 16 bit pixel format
> * 32 bit pixel format
>
> which makes 6 different combinations.
> (It's a shame there's no sh4 BE code to run on this.)

As mentioned before I've used this image to test SH:

https://people.debian.org/~aurel32/qemu/sh4/

with video=800x600-16 kernel parameter where changing -16 to different bit 
depths (8, 32) reproduces the problem. On ppc I've tested with MorphOS 
which uses 16 bpp, Linux and U-boot which I think uses 8 bit. These run on 
real hardware so I think if they work the emulation should be OK.

You've said before that PCI is likely always little endian and SH embedded 
is LE too so unless something uses the device in BE mode (which we don't 
emulate) setting it to little endian should be correct. For frame buffer 
endianness I can only go with what I've seen clients doing and my patch 
does what worked for the above on SH and PPC. I can't prove it's correct 
but works for the systems I've targeted and also fixes the SH case which 
seemed to be broken.

>>> Looking at how the SWAP_FB_ENDIAN flag gets set:
>>> * for the r2d board it is set always
>>> * for PCI devices, it is set only if big-endian
>>>
>>> I suspect that what we actually have here is something
>>> like:
>>> * for the PCI device it's always little endian (and the
>>>   code ought not to need to depend on TARGET_WORDS_BIGENDIAN)
>>> * sysbus device may be more complicated
>>>
>>> Also I note there's an SM501_ENDIAN_CONTROL register on the
>>> device, which presumably if written changes the behaviour.
>
>> I've seen this but it's not emulated so it can be ignored for now. The spec
>> also says that default is little endian so for regs at least
>> DEVICE_LITTLE_ENDIAN should be OK.
>
> Yes, that makes sense. So we should be modelling this as an "always
> little endian device".
>
> The changes you have to the memory region ops achieve this for
> the registers implemented in this device itself. It looks like
> SYSBUS_OHCI is already always little endian. You also need to
> change the argument to the serial_mm_init() call to pass
> DEVICE_LITTLE_ENDIAN.

OK, will do that.

