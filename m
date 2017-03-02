Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjWBP-00041s-0z
	for mharc-qemu-trivial@gnu.org; Thu, 02 Mar 2017 14:14:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjWBM-00040X-Kr
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 14:14:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjWBI-0001D7-L5
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 14:14:32 -0500
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:37911)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjWBI-0001Cu-Ds
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 14:14:28 -0500
Received: by mail-wm0-x22b.google.com with SMTP id t193so20447979wmt.1
	for <qemu-trivial@nongnu.org>; Thu, 02 Mar 2017 11:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+YvMGnGrn+EIxSdTRWIkGfN08ANMJtVHI1oQAy9lCp4=;
	b=Gq6Eziz/psbsGpeFBuzWQD3ez/yT+YYxcCezuXtAbpgFzpggBFOEfMqeTk7V8MuZ/j
	u8hVhFG4Oxp2nqrok3Fp00XmNqKibRKCrt1RRwqWpDcalPicxvtRmFUKoW0l2v8Mg+oH
	C4vFAeOJdaOS5ScBWmkvby6Q77C3LaRjXaCn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+YvMGnGrn+EIxSdTRWIkGfN08ANMJtVHI1oQAy9lCp4=;
	b=hIj5n2zw80OPNXDutUXpGFjJt1Zej/3FWEDil18WdP7co+Xtplfp3vqSEuSbpjkoA6
	EViwRifrMR8Gnuo1UzEWNeYPyANi7kBDP6CRg5meH2aIVaV5ZZj4OLq3cmwxOoUNvy0K
	VUNYiO3peP5RMnVz+Ho7Y+RR6rRRI6PASIcsFqPcy4ERWKTnqlEQ/tIhb83D0IY7iVin
	V57QiAoVa/mf5JdUT21KMJBOH1DMC9rPOdKiad2U3794U2582PfAgYAJi/B/zcLHGAXO
	o0gUv9+YBWG1jvMwKUnxL6L9wNpp06jmhce/WpBkSrxRquHliYVnhadydGeVN8UNO1qu
	eK3w==
X-Gm-Message-State: AMke39lujeACw0Yj5CPc2QiPASqYE4jEXccBEQhYoVtf8ysVcpH3DJ8DYihJt+h4jbYOsTlKR/eFuOoolzIAfF+Y
X-Received: by 10.28.157.67 with SMTP id g64mr9361277wme.111.1488482066772;
	Thu, 02 Mar 2017 11:14:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 2 Mar 2017 11:14:06 -0800 (PST)
In-Reply-To: <7c6e8c071cbd47d6d9065635e97dd88a7197b5be.1488068248.git.balaton@eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<7c6e8c071cbd47d6d9065635e97dd88a7197b5be.1488068248.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2017 19:14:06 +0000
Message-ID: <CAFEAcA-01wdWYs_F-Maxoq7Wa=Xo1J1iaheEQFUdVL1G4PDG7w@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22b
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 04/14] sm501: Get rid of
 base address in draw_hwc_line
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
X-List-Received-Date: Thu, 02 Mar 2017 19:14:33 -0000

On 25 February 2017 at 18:23, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Do not use the base address to access data in local memory. This is in
> preparation to allow chip connected via PCI where base address depends
> on where the BAR is mapped so it will be unknown.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/display/sm501.c          | 6 ++----
>  hw/display/sm501_template.h | 8 ++++----
>  2 files changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index 22cac97..1cda127 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -460,7 +460,6 @@ typedef struct SM501State {
>      QemuConsole *con;
>
>      /* status & internal resources */
> -    hwaddr base;
>      uint32_t local_mem_size_index;
>      uint8_t *local_mem;
>      MemoryRegion local_mem_region;
> @@ -1400,10 +1399,9 @@ static const GraphicHwOps sm501_ops = {
>      .gfx_update  = sm501_update_display,
>  };
>
> -static void sm501_init(SM501State *s, DeviceState *dev, uint32_t base,
> +static void sm501_init(SM501State *s, DeviceState *dev,
>                         uint32_t local_mem_bytes)
>  {
> -    s->base = base;
>      s->local_mem_size_index = get_local_mem_size_index(local_mem_bytes);
>      SM501_DPRINTF("sm501 local mem size=%x. index=%d\n", get_local_mem_size(s),
>                    s->local_mem_size_index);
> @@ -1461,7 +1459,7 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
>      SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>      DeviceState *usb_dev;
>
> -    sm501_init(&s->state, dev, s->base, s->vram_size);
> +    sm501_init(&s->state, dev, s->vram_size);
>      sysbus_init_mmio(sbd, &s->state.local_mem_region);
>      sysbus_init_mmio(sbd, &s->state.mmio_region);
>
> diff --git a/hw/display/sm501_template.h b/hw/display/sm501_template.h
> index 16e500b..832ee61 100644
> --- a/hw/display/sm501_template.h
> +++ b/hw/display/sm501_template.h
> @@ -103,13 +103,13 @@ static void glue(draw_hwc_line_, PIXEL_NAME)(SM501State *s, int crt,
>                   uint8_t *palette, int c_y, uint8_t *d, int width)
>  {
>      int x, i;
> -    uint8_t bitset = 0;
> +    uint8_t *pixval, bitset = 0;
>
>      /* get hardware cursor pattern */
>      uint32_t cursor_addr = get_hwc_address(s, crt);
>      assert(0 <= c_y && c_y < SM501_HWC_HEIGHT);
>      cursor_addr += SM501_HWC_WIDTH * c_y / 4;  /* 4 pixels per byte */
> -    cursor_addr += s->base;
> +    pixval = s->local_mem + cursor_addr;
>
>      /* get cursor position */
>      x = get_hwc_x(s, crt);
> @@ -120,8 +120,8 @@ static void glue(draw_hwc_line_, PIXEL_NAME)(SM501State *s, int crt,
>
>          /* get pixel value */
>          if (i % 4 == 0) {
> -            bitset = ldub_phys(&address_space_memory, cursor_addr);
> -            cursor_addr++;
> +            bitset = ldub_p(pixval);
> +            pixval++;
>          }
>          v = bitset & 3;
>          bitset >>= 2;
> --
> 2.7.4

(The data sheet suggests that the hardware cursor can also be in
"external memory", but it looks like we never supported that
previously and I can't figure out how it is supposed to work either.
So no problem with restricting it to be in the local video ram blob.)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

