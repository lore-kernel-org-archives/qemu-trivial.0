Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1chH6O-00019y-OU
	for mharc-qemu-trivial@gnu.org; Fri, 24 Feb 2017 09:44:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1chH6M-00017Z-89
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2017 09:44:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1chH6K-00046u-RO
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2017 09:44:06 -0500
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:38607)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1chH6K-00046V-Ic
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2017 09:44:04 -0500
Received: by mail-wm0-x235.google.com with SMTP id r141so16201613wmg.1
	for <qemu-trivial@nongnu.org>; Fri, 24 Feb 2017 06:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Rt5MYd/H9PyeRkArNBdDWsNcCO6LEOuSn8Y7dnCKMhU=;
	b=O1i8XDMBvdfbR2AS6o5ukKptYMM/8ZtCK5VhKL4clCy28oLhmz18qUkSQWAG0bE4BE
	S7uQRCYS5GWBEOIj0ZNMvA6sxc6mL9qdtUTbZhokqR7tWH+ezEbquveytWKo36DlI2KQ
	D+2z9ZpRNh6AWSvCSwLQPsSKqypdh4FtRw0fU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Rt5MYd/H9PyeRkArNBdDWsNcCO6LEOuSn8Y7dnCKMhU=;
	b=BrDMxnaTNPvn3y/aPMgzXqEi7nRbodDymW8tJi367yxjN47+0xvFCW/HH75J56D+ez
	M+3tRB3f8zchmU/NMFbQnXkbPnWMT6RXTd69D+zVl0HmXrtEFOjGrcy5qLZrYM0dfSr5
	lTDjaEkGNAVRrylZO2J3RXcnPXqI5e0DxiyZ9n1N5hFw266Ei+bE9WiWqEzGNHlgRVVX
	JNomW2YtRvzSoHWq69IZbuY46VLrkNUMZ9uYSy25suXznKvQAL3hA2RRCXDenoJD1ur+
	rdlKTPGsEzCwLWMncX7mXk4ntNY2CXiwh2OwfMqOai4oKF17wcP97FU3oBcgeoqzafby
	rjuQ==
X-Gm-Message-State: AMke39nSkrtBL74kx1N+EPX9ZQHsXRITo3Y5MqlirxJCznJqRIg/FQYjHLnJ9XppW+8cOWAaZkzEntJoxsjVupm2
X-Received: by 10.28.55.199 with SMTP id e190mr2830699wma.92.1487947443242;
	Fri, 24 Feb 2017 06:44:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.172.207 with HTTP; Fri, 24 Feb 2017 06:43:41 -0800 (PST)
In-Reply-To: <4bed0ec61e74992657933af970366a9e2636589a.1487522123.git.balaton@eik.bme.hu>
References: <cover.1487522123.git.balaton@eik.bme.hu>
	<4bed0ec61e74992657933af970366a9e2636589a.1487522123.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2017 14:43:41 +0000
Message-ID: <CAFEAcA-KW64ar8dER9V7x87BzH0G_uQstqXFoA2kuf2j3Hc4WQ@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 04/10] sm501: Add emulation
 of chip connected via PCI
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
X-List-Received-Date: Fri, 24 Feb 2017 14:44:07 -0000

On 19 February 2017 at 16:35, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Only the display controller part is created automatically on PCI
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/display/sm501.c          | 58 +++++++++++++++++++++++++++++++++++++++++----
>  hw/display/sm501_template.h |  8 +++----
>  2 files changed, 58 insertions(+), 8 deletions(-)
>
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index b592022..e966896 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -31,6 +31,7 @@
>  #include "ui/console.h"
>  #include "hw/devices.h"
>  #include "hw/sysbus.h"
> +#include "hw/pci/pci.h"
>  #include "qemu/range.h"
>  #include "ui/pixel_ops.h"
>  #include "exec/address-spaces.h"
> @@ -460,7 +461,6 @@ typedef struct SM501State {
>      QemuConsole *con;
>
>      /* status & internal resources */
> -    hwaddr base;
>      uint32_t local_mem_size_index;
>      uint8_t *local_mem;
>      MemoryRegion local_mem_region;
> @@ -1397,12 +1397,11 @@ static const GraphicHwOps sm501_ops = {
>      .gfx_update  = sm501_update_display,
>  };
>
> -static void sm501_init(SM501State *s, DeviceState *dev, uint32_t base,
> +static void sm501_init(SM501State *s, DeviceState *dev,
>                         uint32_t local_mem_bytes)
>  {
>      MemoryRegion *mr;
>
> -    s->base = base;
>      s->local_mem_size_index = get_local_mem_size_index(local_mem_bytes);
>      SM501_DPRINTF("sm501 local mem size=%x. index=%d\n", get_local_mem_size(s),
>                    s->local_mem_size_index);
> @@ -1457,7 +1456,7 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
>      SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>      DeviceState *usb_dev;
>
> -    sm501_init(&s->state, dev, s->base, s->vram_size);
> +    sm501_init(&s->state, dev, s->vram_size);
>      sysbus_init_mmio(sbd, &s->state.local_mem_region);
>      sysbus_init_mmio(sbd, &s->state.mmio_region);
>
> @@ -1505,9 +1504,60 @@ static const TypeInfo sm501_sysbus_info = {
>      .class_init    = sm501_sysbus_class_init,
>  };
>
> +#define TYPE_PCI_SM501 "sm501"
> +#define PCI_SM501(obj) OBJECT_CHECK(SM501PCIState, (obj), TYPE_PCI_SM501)
> +
> +typedef struct {
> +    /*< private >*/
> +    PCIDevice parent_obj;
> +    /*< public >*/
> +    SM501State state;
> +    uint32_t vram_size;
> +} SM501PCIState;
> +
> +static void sm501_realize_pci(PCIDevice *dev, Error **errp)
> +{
> +    SM501PCIState *s = PCI_SM501(dev);
> +
> +    sm501_init(&s->state, DEVICE(dev), s->vram_size);
> +    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY,
> +                     &s->state.local_mem_region);
> +    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_MEMORY,
> +                     &s->state.mmio_region);
> +}
> +
> +static Property sm501_pci_properties[] = {
> +    DEFINE_PROP_UINT32("vram-size", SM501PCIState, vram_size,
> +                       64 * 1024 * 1024),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void sm501_pci_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> +
> +    k->realize = sm501_realize_pci;
> +    k->vendor_id = 0x126f;
> +    k->device_id = 0x0501;
> +    k->class_id = PCI_CLASS_DISPLAY_OTHER;
> +    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
> +    dc->desc = "SM501 Display Controller";
> +    dc->props = sm501_pci_properties;
> +    dc->hotpluggable = false;

This needs a reset function and a vmsd as well.

> +}
> +
> +static const TypeInfo sm501_pci_info = {
> +    .name          = TYPE_PCI_SM501,
> +    .parent        = TYPE_PCI_DEVICE,
> +    .instance_size = sizeof(SM501PCIState),
> +    .class_init    = sm501_pci_class_init,
> +};
> +
>  static void sm501_register_types(void)
>  {
>      type_register_static(&sm501_sysbus_info);
> +    type_register_static(&sm501_pci_info);
>  }
>
>  type_init(sm501_register_types)
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

Dropping the requirement for a base addr is not really the same
change as adding the PCI device.

thanks
-- PMM

