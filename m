Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjXtz-0007sB-Tc
	for mharc-qemu-trivial@gnu.org; Thu, 02 Mar 2017 16:04:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjXtx-0007qa-Le
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 16:04:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjXtw-0005o0-Ar
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 16:04:41 -0500
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:36152)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjXtw-0005nc-44
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 16:04:40 -0500
Received: by mail-wm0-x231.google.com with SMTP id n11so1367037wma.1
	for <qemu-trivial@nongnu.org>; Thu, 02 Mar 2017 13:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vgMVE9dsiFRD/FoiaQcALcb++vFqHVH1Eo247PGRQN4=;
	b=FoBhiJmE4rYrUgcpDxupmVOnSynyysKYOPInTo2ORhxE3yh8heEZSpQzLy9Y5QcPSX
	QrMmEekYoL7qbF6k/UNnlo0ZYgR8ijbCcmi6ENlRVhNx9Nyaik2QCGrW8v6n+kshPB/O
	3/5HjlmDjr5jXYQrlpxc+ABt5Xkup7yqXKIe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vgMVE9dsiFRD/FoiaQcALcb++vFqHVH1Eo247PGRQN4=;
	b=Z+pX4OLMTjkh/dZfK54uBboco8+kiui16Xky8Lj//w7qmu/hISRFVLiyY6yuwx01tW
	wrlqkgWtdL0MqwMnjUxuizAx1yOj62Heoykpf3GqF3bwWXV/NARWaMoMZmfPNGh2xRph
	wdU3IV2PiTtzl/rB6JKq3Z2tGOgndOvaJRKeKR8ukVm6v3sNqXq5t9tC7BUz30JE0neW
	YVbNQ/ZSx+1i/CadbzEiDI9gb6m138UHKcxoVdxZfl3ue9hkO7x3exQS1qDV7xQgmGUB
	BwkOi9Nkc2DGTMJ13MT1gxtVU64cBEbWc5MAKu4kbkmaWmnhZQlMrtYd8WOqP3N+95Gl
	XfEQ==
X-Gm-Message-State: AMke39l8iciACNLnTYx2Z8gDR4K8mwsbI0j7bg/+qNnrHvnlr/lfpurtzUvYic4SeSNPfuQxk9y+ET+U0SYHOfZA
X-Received: by 10.28.16.70 with SMTP id 67mr211875wmq.142.1488488678606; Thu,
	02 Mar 2017 13:04:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 2 Mar 2017 13:04:18 -0800 (PST)
In-Reply-To: <6b70a9dfe56c3a0dc8e874c45d70612aff7b8e3a.1488068248.git.balaton@eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<6b70a9dfe56c3a0dc8e874c45d70612aff7b8e3a.1488068248.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2017 21:04:18 +0000
Message-ID: <CAFEAcA9FL-sshVzKewf+rCs6-5_c2Y86Qy0b=3DMog4MrVOpwA@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::231
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
X-List-Received-Date: Thu, 02 Mar 2017 21:04:43 -0000

On 25 February 2017 at 18:46, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>
> v2: Split off small clean up to other patch
>
>  hw/display/sm501.c          |  6 +++---
>  hw/display/sm501_template.h | 23 ++++++++++++++---------
>  2 files changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index b977094..2694081 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -849,7 +849,7 @@ static const MemoryRegionOps sm501_system_config_ops = {
>          .min_access_size = 4,
>          .max_access_size = 4,
>      },
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
>  };
>
>  static uint32_t sm501_palette_read(void *opaque, hwaddr addr)
> @@ -1085,7 +1085,7 @@ static const MemoryRegionOps sm501_disp_ctrl_ops = {
>          .min_access_size = 4,
>          .max_access_size = 4,
>      },
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
>  };
>
>  static uint64_t sm501_2d_engine_read(void *opaque, hwaddr addr,
> @@ -1173,7 +1173,7 @@ static const MemoryRegionOps sm501_2d_engine_ops = {
>          .min_access_size = 4,
>          .max_access_size = 4,
>      },
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
>  };
>
>  /* draw line functions for all console modes */
> diff --git a/hw/display/sm501_template.h b/hw/display/sm501_template.h
> index 832ee61..6e56baf 100644
> --- a/hw/display/sm501_template.h
> +++ b/hw/display/sm501_template.h
> @@ -64,10 +64,16 @@ static void glue(draw_line16_, PIXEL_NAME)(
>      uint8_t r, g, b;
>
>      do {
> -        rgb565 = lduw_p(s);
> -        r = ((rgb565 >> 11) & 0x1f) << 3;
> -        g = ((rgb565 >>  5) & 0x3f) << 2;
> -        b = ((rgb565 >>  0) & 0x1f) << 3;
> +        rgb565 = lduw_le_p(s);
> +#if defined(TARGET_WORDS_BIGENDIAN)
> +        r = (rgb565 >> 8) & 0xf8;
> +        g = (rgb565 >> 3) & 0xfc;
> +        b = (rgb565 << 3) & 0xf8;
> +#else
> +        b = (rgb565 >> 8) & 0xf8;
> +        g = (rgb565 >> 3) & 0xfc;
> +        r = (rgb565 << 3) & 0xf8;
> +#endif
>          *(PIXEL_TYPE *)d = glue(rgb_to_pixel, PIXEL_NAME)(r, g, b);
>          s += 2;
>          d += BPP;
> @@ -80,15 +86,14 @@ static void glue(draw_line32_, PIXEL_NAME)(
>      uint8_t r, g, b;
>
>      do {
> -        ldub_p(s);
>  #if defined(TARGET_WORDS_BIGENDIAN)
> +        r = s[0];
> +        g = s[1];
> +        b = s[2];
> +#else
>          r = s[1];
>          g = s[2];
>          b = s[3];
> -#else
> -        b = s[0];
> -        g = s[1];
> -        r = s[2];
>  #endif
>          *(PIXEL_TYPE *)d = glue(rgb_to_pixel, PIXEL_NAME)(r, g, b);
>          s += 4;

I still suspect this is not correct. In particular, if you
look at the Linux driver:

http://lxr.free-electrons.com/source/drivers/video/fbdev/sm501fb.c#L341

we have for 32 bit two layouts within a 32-bit word:
 BGRX (if "swap fb endian" is set)
 XRGB (the usual)
(plus the cross-product with "32-bit load is BE or LE",
since we've coded this as byte accesses rather than a ldl_*_p()).

and for 16 bit we have either RGB or BGR ordering.
I'm not completely sure this lines up with the code you have.

Looking at how the SWAP_FB_ENDIAN flag gets set:
 * for the r2d board it is set always
 * for PCI devices, it is set only if big-endian

I suspect that what we actually have here is something
like:
 * for the PCI device it's always little endian (and the
   code ought not to need to depend on TARGET_WORDS_BIGENDIAN)
 * sysbus device may be more complicated

Also I note there's an SM501_ENDIAN_CONTROL register on the
device, which presumably if written changes the behaviour.

Plus for the sysbus device if we change the settings to
DEVICE_LITTLE_ENDIAN for the various control register
regions that suggests we should be consistent about the
serial_mm_init() endian order and also the USB controller.

It's late evening here though so I can't investigate any
further right now.

thanks
-- PMM

