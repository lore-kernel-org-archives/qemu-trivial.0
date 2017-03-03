Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjckp-0000zA-K6
	for mharc-qemu-trivial@gnu.org; Thu, 02 Mar 2017 21:15:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1cjckn-0000xp-Ch
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 21:15:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1cjckm-0005CS-0Z
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 21:15:33 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:48523)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1cjckg-0005As-Ns; Thu, 02 Mar 2017 21:15:27 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 58AA67456E4;
	Fri,  3 Mar 2017 03:15:25 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 25E7A7456D4; Fri,  3 Mar 2017 03:15:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id 256217456BA;
	Fri,  3 Mar 2017 03:15:25 +0100 (CET)
Date: Fri, 3 Mar 2017 03:15:25 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
cc: QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
In-Reply-To: <CAFEAcA9FL-sshVzKewf+rCs6-5_c2Y86Qy0b=3DMog4MrVOpwA@mail.gmail.com>
Message-ID: <alpine.BSF.2.20.1703030259350.33600@zero.eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<6b70a9dfe56c3a0dc8e874c45d70612aff7b8e3a.1488068248.git.balaton@eik.bme.hu>
	<CAFEAcA9FL-sshVzKewf+rCs6-5_c2Y86Qy0b=3DMog4MrVOpwA@mail.gmail.com>
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
X-List-Received-Date: Fri, 03 Mar 2017 02:15:34 -0000

On Thu, 2 Mar 2017, Peter Maydell wrote:
> On 25 February 2017 at 18:46, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>
>> v2: Split off small clean up to other patch
>>
>>  hw/display/sm501.c          |  6 +++---
>>  hw/display/sm501_template.h | 23 ++++++++++++++---------
>>  2 files changed, 17 insertions(+), 12 deletions(-)
>>
>> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
>> index b977094..2694081 100644
>> --- a/hw/display/sm501.c
>> +++ b/hw/display/sm501.c
>> @@ -849,7 +849,7 @@ static const MemoryRegionOps sm501_system_config_ops = {
>>          .min_access_size = 4,
>>          .max_access_size = 4,
>>      },
>> -    .endianness = DEVICE_NATIVE_ENDIAN,
>> +    .endianness = DEVICE_LITTLE_ENDIAN,
>>  };
>>
>>  static uint32_t sm501_palette_read(void *opaque, hwaddr addr)
>> @@ -1085,7 +1085,7 @@ static const MemoryRegionOps sm501_disp_ctrl_ops = {
>>          .min_access_size = 4,
>>          .max_access_size = 4,
>>      },
>> -    .endianness = DEVICE_NATIVE_ENDIAN,
>> +    .endianness = DEVICE_LITTLE_ENDIAN,
>>  };
>>
>>  static uint64_t sm501_2d_engine_read(void *opaque, hwaddr addr,
>> @@ -1173,7 +1173,7 @@ static const MemoryRegionOps sm501_2d_engine_ops = {
>>          .min_access_size = 4,
>>          .max_access_size = 4,
>>      },
>> -    .endianness = DEVICE_NATIVE_ENDIAN,
>> +    .endianness = DEVICE_LITTLE_ENDIAN,
>>  };
>>
>>  /* draw line functions for all console modes */
>> diff --git a/hw/display/sm501_template.h b/hw/display/sm501_template.h
>> index 832ee61..6e56baf 100644
>> --- a/hw/display/sm501_template.h
>> +++ b/hw/display/sm501_template.h
>> @@ -64,10 +64,16 @@ static void glue(draw_line16_, PIXEL_NAME)(
>>      uint8_t r, g, b;
>>
>>      do {
>> -        rgb565 = lduw_p(s);
>> -        r = ((rgb565 >> 11) & 0x1f) << 3;
>> -        g = ((rgb565 >>  5) & 0x3f) << 2;
>> -        b = ((rgb565 >>  0) & 0x1f) << 3;
>> +        rgb565 = lduw_le_p(s);
>> +#if defined(TARGET_WORDS_BIGENDIAN)
>> +        r = (rgb565 >> 8) & 0xf8;
>> +        g = (rgb565 >> 3) & 0xfc;
>> +        b = (rgb565 << 3) & 0xf8;
>> +#else
>> +        b = (rgb565 >> 8) & 0xf8;
>> +        g = (rgb565 >> 3) & 0xfc;
>> +        r = (rgb565 << 3) & 0xf8;
>> +#endif
>>          *(PIXEL_TYPE *)d = glue(rgb_to_pixel, PIXEL_NAME)(r, g, b);
>>          s += 2;
>>          d += BPP;
>> @@ -80,15 +86,14 @@ static void glue(draw_line32_, PIXEL_NAME)(
>>      uint8_t r, g, b;
>>
>>      do {
>> -        ldub_p(s);
>>  #if defined(TARGET_WORDS_BIGENDIAN)
>> +        r = s[0];
>> +        g = s[1];
>> +        b = s[2];
>> +#else
>>          r = s[1];
>>          g = s[2];
>>          b = s[3];
>> -#else
>> -        b = s[0];
>> -        g = s[1];
>> -        r = s[2];
>>  #endif
>>          *(PIXEL_TYPE *)d = glue(rgb_to_pixel, PIXEL_NAME)(r, g, b);
>>          s += 4;
>
> I still suspect this is not correct. In particular, if you
> look at the Linux driver:
>
> http://lxr.free-electrons.com/source/drivers/video/fbdev/sm501fb.c#L341
>
> we have for 32 bit two layouts within a 32-bit word:
> BGRX (if "swap fb endian" is set)
> XRGB (the usual)
> (plus the cross-product with "32-bit load is BE or LE",
> since we've coded this as byte accesses rather than a ldl_*_p()).
>
> and for 16 bit we have either RGB or BGR ordering.
> I'm not completely sure this lines up with the code you have.

Maybe it's not correct but works for everything I could test better than 
the original code (which was broken even for the SH images one can find) 
so I think we could just go with this until someone complains and provides 
a test case. I've given up on trying to understand it because I don't 
really know this device and SH so I could only go by the images I could 
find and they seem to like it this way.

> Looking at how the SWAP_FB_ENDIAN flag gets set:
> * for the r2d board it is set always
> * for PCI devices, it is set only if big-endian
>
> I suspect that what we actually have here is something
> like:
> * for the PCI device it's always little endian (and the
>   code ought not to need to depend on TARGET_WORDS_BIGENDIAN)
> * sysbus device may be more complicated
>
> Also I note there's an SM501_ENDIAN_CONTROL register on the
> device, which presumably if written changes the behaviour.

I've seen this but it's not emulated so it can be ignored for now. The 
spec also says that default is little endian so for regs at least 
DEVICE_LITTLE_ENDIAN should be OK.

> Plus for the sysbus device if we change the settings to
> DEVICE_LITTLE_ENDIAN for the various control register
> regions that suggests we should be consistent about the
> serial_mm_init() endian order and also the USB controller.
>
> It's late evening here though so I can't investigate any
> further right now.
>
> thanks
> -- PMM
>
>

