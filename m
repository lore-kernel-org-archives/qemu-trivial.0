Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1chHCc-00085e-PQ
	for mharc-qemu-trivial@gnu.org; Fri, 24 Feb 2017 09:50:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1chHCZ-00083h-Uw
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2017 09:50:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1chHCY-0007Bq-OW
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2017 09:50:32 -0500
Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e]:35588)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1chHCY-0007BG-IM
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2017 09:50:30 -0500
Received: by mail-wr0-x22e.google.com with SMTP id g10so12787239wrg.2
	for <qemu-trivial@nongnu.org>; Fri, 24 Feb 2017 06:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BLs2O6MRTslmZMrAjOAiHs6QrhwWpQE5dtiQ+Fh0nKM=;
	b=QaUdZzejj5QghOUYhAjtV0LRcBQIKp4j5At33g22FOfGteWBnya4DUg1jvVlC/y+p+
	CqOUN+LotYEDvXLvdR82T9Y3nK6Ey5dFXyhR96nIdCJ0AKSyhwhV0/vWifg1wLt5t/J+
	v5m9SOffNLdaZlXluyoJFQbpBA1drSCkibutE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BLs2O6MRTslmZMrAjOAiHs6QrhwWpQE5dtiQ+Fh0nKM=;
	b=hxwHWFB/pOTdZiK/w58+AK0k+eqeoqB46lfLaIBNMwT78tRN4ChEymGD+JpP5rVYiF
	ojwpmnhmlxCXBA8d3Pg4pwkUfKvJ5DTGWpUSnpOk9kZRZjSPD4QH9k0ItpZg5QeBFj31
	wl63wKLScdoR6Pf2Dl+smBAjeowSa2DIDtIF//DJHifYWdj63SqV924myx7bMkfU/45k
	oC0DclWsNm5KL/VgfyWTVZtRDhFiPagj0gtnnbX11gGY+xUon7YgEBrClYFDcrsTMrMF
	J+xQXeTMsNzi8eWtv6a0x8sk0AgL5M0Hfp8UmYVvjHmp3VrlrRm9KLvOOy39buTRZ/Cy
	7tXA==
X-Gm-Message-State: AMke39kYjN08y9LFb9jPM3AFl/uqQ2AnCw7gV7p1nehJN+2s3egQ/ID8KBFDqWXVDuSi2GokVX1/Toa+YE9lJORs
X-Received: by 10.223.152.241 with SMTP id w104mr3221676wrb.151.1487947829346; 
	Fri, 24 Feb 2017 06:50:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.172.207 with HTTP; Fri, 24 Feb 2017 06:50:08 -0800 (PST)
In-Reply-To: <9c4f503401fa3defa5dff8b938a0bee3aa8d89d5.1487522123.git.balaton@eik.bme.hu>
References: <cover.1487522123.git.balaton@eik.bme.hu>
	<9c4f503401fa3defa5dff8b938a0bee3aa8d89d5.1487522123.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2017 14:50:08 +0000
Message-ID: <CAFEAcA9uOtUmPisVgeTDCVR_tuXzB=nb7OYHiVty1iVnk8pXQQ@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::22e
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 06/10] sm501: Fix device
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
X-List-Received-Date: Fri, 24 Feb 2017 14:50:33 -0000

On 19 February 2017 at 16:35, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/display/sm501.c          |  6 +++---
>  hw/display/sm501_template.h | 31 ++++++++++++++++++-------------
>  2 files changed, 21 insertions(+), 16 deletions(-)
>
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index 9091bb5..3d32a3c 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -846,7 +846,7 @@ static const MemoryRegionOps sm501_system_config_ops = {
>          .min_access_size = 4,
>          .max_access_size = 4,
>      },
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
>  };
>
>  static uint32_t sm501_palette_read(void *opaque, hwaddr addr)
> @@ -1082,7 +1082,7 @@ static const MemoryRegionOps sm501_disp_ctrl_ops = {
>          .min_access_size = 4,
>          .max_access_size = 4,
>      },
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
>  };
>
>  static uint64_t sm501_2d_engine_read(void *opaque, hwaddr addr,
> @@ -1170,7 +1170,7 @@ static const MemoryRegionOps sm501_2d_engine_ops = {
>          .min_access_size = 4,
>          .max_access_size = 4,
>      },
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
>  };

Does this still all work for the sh4eb (big-endian) sysbus device case?

>  /* draw line functions for all console modes */
> diff --git a/hw/display/sm501_template.h b/hw/display/sm501_template.h
> index 832ee61..5b516d6 100644
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

This looks really suspicious. Previously we had
 TARGET_WORDS_BIGENDIAN -> bytes are XRGB
 otherwise                 bytes are BGRX

Now we have
 TARGET_WORDS_BIGENDIAN -> bytes are RGBX
 otherwise              -> bytes are XRGB

That doesn't seem very plausible at all.

>          *(PIXEL_TYPE *)d = glue(rgb_to_pixel, PIXEL_NAME)(r, g, b);
>          s += 4;


> @@ -103,7 +108,7 @@ static void glue(draw_hwc_line_, PIXEL_NAME)(SM501State *s, int crt,
>                   uint8_t *palette, int c_y, uint8_t *d, int width)
>  {
>      int x, i;
> -    uint8_t *pixval, bitset = 0;
> +    uint8_t *pixval, r, g, b, bitset = 0;
>
>      /* get hardware cursor pattern */
>      uint32_t cursor_addr = get_hwc_address(s, crt);
> @@ -129,9 +134,9 @@ static void glue(draw_hwc_line_, PIXEL_NAME)(SM501State *s, int crt,
>          /* write pixel */
>          if (v) {
>              v--;
> -            uint8_t r = palette[v * 3 + 0];
> -            uint8_t g = palette[v * 3 + 1];
> -            uint8_t b = palette[v * 3 + 2];
> +            r = palette[v * 3 + 0];
> +            g = palette[v * 3 + 1];
> +            b = palette[v * 3 + 2];
>              *(PIXEL_TYPE *)d = glue(rgb_to_pixel, PIXEL_NAME)(r, g, b);
>          }
>          d += BPP;

This doesn't seem to be related to the rest of this patch?

thanks
-- PMM

