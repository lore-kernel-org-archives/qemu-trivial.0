Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjWea-000410-Jl
	for mharc-qemu-trivial@gnu.org; Thu, 02 Mar 2017 14:44:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjWeX-0003zW-Lw
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 14:44:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjWeW-0007HA-C1
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 14:44:41 -0500
Received: from mail-wr0-x231.google.com ([2a00:1450:400c:c0c::231]:34038)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjWeW-0007Gl-2S
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 14:44:40 -0500
Received: by mail-wr0-x231.google.com with SMTP id l37so60101018wrc.1
	for <qemu-trivial@nongnu.org>; Thu, 02 Mar 2017 11:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RASBlttOdbNhymPyi6DZ87mJu5hJEUjU4WvrOetxlP4=;
	b=JGrCui6Aa7puNf3HRzedWju2rAgUgIlu49goYSsnxRucpGJvBLYFcW7EY8LjjbFyf3
	p/A2f9l56RVV7cKfk3nEHjkTgAuQWGba+iDJXTIpANcxfjHczWgujPles6Z4XJvC4u10
	IuePk5XEHcPSOItNB6TKDhmDuiUqh4iVVN4iQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RASBlttOdbNhymPyi6DZ87mJu5hJEUjU4WvrOetxlP4=;
	b=mnICAQTnWQEWVQGVqmLGu5+oTZ43tTuuXUhNG/qPOcfAZmsjxFUzHK7IRN2ILhMGm8
	ZxXxwa4fpd0B9F8P6cl3MX8bzxhw0/dATtuxL77/rFWDe44ZFAANDT6kR3sA3cAKxPi2
	neO0JdIDBjiBuQ1hOXY77Fo/JPaKF82XToChW56k5P3v2bUMt8vkODhIDe6F4POwQW9Z
	Dyh8skXQ8Oy75c0Dy7CYpytyDt06PI9pQ7U+ND+qsKjohCk8sWuduQN50yo3dQoZ8pnN
	NJEDEA3eOGRPnqSGEXjDDHvmoCC39ADxVbQMRWRvlGR/8i4PRpPj9iehjM4dvUjhTGEA
	9y1w==
X-Gm-Message-State: AMke39lc8aOz9gR8yNreXHhoRfmf79BsbQG335eHEKUx3DwDeG4x1IrmpBNnRzlAqjSyfhOWZUSPkIzl5SXIDoWj
X-Received: by 10.223.169.45 with SMTP id u42mr13291606wrc.187.1488483878823; 
	Thu, 02 Mar 2017 11:44:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 2 Mar 2017 11:44:18 -0800 (PST)
In-Reply-To: <ae7dc986dd60d4a4baef3d4aef31e10b281e85a7.1488068248.git.balaton@eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<ae7dc986dd60d4a4baef3d4aef31e10b281e85a7.1488068248.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2017 19:44:18 +0000
Message-ID: <CAFEAcA-7AiUb6pMdVf5kRY3eg2Teqw4TOhWt9RNqVjcfvDRx+g@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::231
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 10/14] sm501: Add support
 for panel layer
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
X-List-Received-Date: Thu, 02 Mar 2017 19:44:43 -0000

On 25 February 2017 at 19:25, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>
> v2: Split off renaming a variable to separate clean up patch
>
>  hw/display/sm501.c | 63 +++++++++++++++++++++++++++---------------------------
>  1 file changed, 32 insertions(+), 31 deletions(-)
>
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index 9c5ded3..caa7e5c 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -2,6 +2,7 @@
>   * QEMU SM501 Device
>   *
>   * Copyright (c) 2008 Shin-ichiro KAWASAKI
> + * Copyright (c) 2016 BALATON Zoltan
>   *
>   * Permission is hereby granted, free of charge, to any person obtaining a copy
>   * of this software and associated documentation files (the "Software"), to deal
> @@ -41,8 +42,11 @@
>   *   - Minimum implementation for Linux console : mmio regs and CRT layer.
>   *   - 2D graphics acceleration partially supported : only fill rectangle.
>   *
> - * TODO:
> + * Status: 2016/12/04
> + *   - Misc fixes: endianness, hardware cursor
>   *   - Panel support
> + *
> + * TODO:
>   *   - Touch panel support
>   *   - USB support
>   *   - UART support
> @@ -1300,18 +1304,16 @@ static inline int get_depth_index(DisplaySurface *surface)
>      }
>  }
>
> -static void sm501_draw_crt(SM501State *s)
> +static void sm501_update_display(void *opaque)
>  {
> +    SM501State *s = (SM501State *)opaque;
>      DisplaySurface *surface = qemu_console_surface(s->con);
>      int y, c_x, c_y;
> -    uint8_t *hwc_src, *src = s->local_mem;
> -    int width = get_width(s, 1);
> -    int height = get_height(s, 1);
> -    int src_bpp = get_bpp(s, 1);
> +    int crt = (s->dc_crt_control & SM501_DC_CRT_CONTROL_SEL) ? 1 : 0;
> +    int width = get_width(s, crt);
> +    int height = get_height(s, crt);
> +    int src_bpp = get_bpp(s, crt);
>      int dst_bpp = surface_bytes_per_pixel(surface);
> -    uint32_t *palette = (uint32_t *)&s->dc_palette[SM501_DC_CRT_PALETTE -
> -                                                   SM501_DC_PANEL_PALETTE];
> -    uint8_t hwc_palette[3 * 3];
>      int dst_depth_index = get_depth_index(surface);
>      draw_line_func *draw_line = NULL;
>      draw_hwc_line_func *draw_hwc_line = NULL;
> @@ -1319,7 +1321,19 @@ static void sm501_draw_crt(SM501State *s)
>      int y_start = -1;
>      ram_addr_t page_min = ~0l;
>      ram_addr_t page_max = 0l;
> -    ram_addr_t offset = 0;
> +    ram_addr_t offset;
> +    uint32_t *palette;
> +    uint8_t hwc_palette[3 * 3];
> +    uint8_t *hwc_src;
> +
> +    if (!((crt ? s->dc_crt_control : s->dc_panel_control)
> +          & SM501_DC_CRT_CONTROL_ENABLE)) {
> +        return;
> +    }
> +
> +    palette = (uint32_t *)(crt ? &s->dc_palette[SM501_DC_CRT_PALETTE -
> +                                                SM501_DC_PANEL_PALETTE]
> +                               : &s->dc_palette[0]);
>
>      /* choose draw_line function */
>      switch (src_bpp) {
> @@ -1333,20 +1347,19 @@ static void sm501_draw_crt(SM501State *s)
>          draw_line = draw_line32_funcs[dst_depth_index];
>          break;
>      default:
> -        printf("sm501 draw crt : invalid DC_CRT_CONTROL=%x.\n",
> -               s->dc_crt_control);
> +        printf("sm501 update display : invalid control register value.\n");
>          abort();
>          break;
>      }
>
>      /* set up to draw hardware cursor */
> -    if (is_hwc_enabled(s, 1)) {
> +    if (is_hwc_enabled(s, crt)) {
>          /* choose cursor draw line function */
>          draw_hwc_line = draw_hwc_line_funcs[dst_depth_index];
> -        hwc_src = get_hwc_address(s, 1);
> -        c_x = get_hwc_x(s, 1);
> -        c_y = get_hwc_y(s, 1);
> -        get_hwc_palette(s, 1, hwc_palette);
> +        hwc_src = get_hwc_address(s, crt);
> +        c_x = get_hwc_x(s, crt);
> +        c_y = get_hwc_y(s, crt);
> +        get_hwc_palette(s, crt, hwc_palette);
>      }
>
>      /* adjust console size */
> @@ -1360,7 +1373,7 @@ static void sm501_draw_crt(SM501State *s)
>
>      /* draw each line according to conditions */
>      memory_region_sync_dirty_bitmap(&s->local_mem_region);
> -    for (y = 0; y < height; y++) {
> +    for (y = 0, offset = 0; y < height; y++, offset += width * src_bpp) {
>          int update, update_hwc;
>          ram_addr_t page0 = offset;
>          ram_addr_t page1 = offset + width * src_bpp - 1;
> @@ -1378,7 +1391,7 @@ static void sm501_draw_crt(SM501State *s)
>              d +=  y * width * dst_bpp;
>
>              /* draw graphics layer */
> -            draw_line(d, src, width, palette);
> +            draw_line(d, s->local_mem + offset, width, palette);
>
>              /* draw hardware cursor */
>              if (update_hwc) {
> @@ -1401,9 +1414,6 @@ static void sm501_draw_crt(SM501State *s)
>                  y_start = -1;
>              }
>          }
> -
> -        src += width * src_bpp;
> -        offset += width * src_bpp;
>      }

This is another refactoring that's unrelated to adding panel
layer support, right? (It's just changing from having src and
offset updated at the end of the loop to dropping src and having offset
be updated in the for()).

>      /* complete flush to display */
> @@ -1419,15 +1429,6 @@ static void sm501_draw_crt(SM501State *s)
>      }
>  }
>
> -static void sm501_update_display(void *opaque)
> -{
> -    SM501State *s = (SM501State *)opaque;
> -
> -    if (s->dc_crt_control & SM501_DC_CRT_CONTROL_ENABLE) {
> -        sm501_draw_crt(s);
> -    }
> -}
> -
>  static const GraphicHwOps sm501_ops = {
>      .gfx_update  = sm501_update_display,
>  };
> --
> 2.7.4
>
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

