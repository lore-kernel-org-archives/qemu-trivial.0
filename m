Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMU21-00017M-Tg
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2019 04:59:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60330)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hMU1y-00016d-Nu
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 04:59:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hMU1x-0007F5-86
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 04:58:58 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:52527)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hMU1x-0007EZ-1g
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 04:58:57 -0400
Received: by mail-wm1-x342.google.com with SMTP id y26so988068wma.2
	for <qemu-trivial@nongnu.org>; Fri, 03 May 2019 01:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=FI/B3IEAgFCQ4GF/q7Db+t8ZiASIhW8RIHHxcktckv8=;
	b=GN3toUmVdMVgxp7ds3/PZIQ0nOxiuqxWNfMtDRHoJnqmv1wjzyhEpJxUISjF7VtJso
	lqnHeFtMbY/4x61SzPzO+PnJjNlBnKhyuNeQ/dDXiVCWDh37X5pVvrDgWcuVOzE7CSkg
	C8cBrmnEXCVwZ/qCnie41pLhr3Ztm3ttmQw+FHE/Jaeil87zjdgAuR3MSo6wRSvLrI5N
	ScvVeOr+XUwHLtzUw8Ji3V9y2Fll+Sbv0xMadEWcyyCAtxViowl7JFA0vYDKg6USMQ9g
	VNx7wjTHC/D3mYZ6qCV6ouDhydbdarlEMNOhMZ0r+ptCr7/Al6bJ3sbU64zltsMxRHMn
	h4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=FI/B3IEAgFCQ4GF/q7Db+t8ZiASIhW8RIHHxcktckv8=;
	b=CmIQqFvNUXkZ/u9Q+zw4J0dQlaHW2pH0rJr12uheabHmGq21WbcwtTnQ8A9r9dVUej
	KSHlHrWcSIDDVaMtw5f6dZ3yyFuu9QBFY/pbDJ8eqeDPrYoDWdMLOEdKgOZCINZSgn87
	8w0EQJ0rILwYAXVZolJRgEL8eu/U3vzVP4dmD++hXIoi2x8ci8OhGkt+hZ4cxHl/+GlN
	nyIsMYdMbd7ghXvnniw7D4TAJafSFo6Gpbaz0ac9D33h8xihqbzxNYpcTcctp5ACfqMH
	5cqkgajzHZ/D58AEqu/lc4Mw3dH2aam9Sw4KVSl88PUC+AqLAzYIGEd9BkbAmAEaf7lS
	ooBg==
X-Gm-Message-State: APjAAAX8rYVL5cwRlxsGJqj/2T0qR4DasCcD+/kncBoZk7m9KrPnyqSW
	ExPT0Ve8RuuhrvMtFtED45R1Og==
X-Google-Smtp-Source: APXvYqwJL9epJilOXo6lobzArWyaZDoIW64Jtw2+9boELl+shM/gmllcjjKOosf54pBAEpaJ/6FgjQ==
X-Received: by 2002:a05:600c:2283:: with SMTP id
	3mr5177547wmf.125.1556873935388; 
	Fri, 03 May 2019 01:58:55 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id t6sm1466838wmt.8.2019.05.03.01.58.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 03 May 2019 01:58:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6756E1FF87;
	Fri,  3 May 2019 09:58:54 +0100 (BST)
References: <20190503084654.18413-1-liboxuan@connect.hku.hk>
User-agent: mu4e 1.3.1; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Boxuan Li <liboxuan@connect.hku.hk>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, eblake@redhat.com,
	philmd@redhat.com, yuval.shaia@oracle.com,
	"Michael S. Tsirkin" <mst@redhat.com>
In-reply-to: <20190503084654.18413-1-liboxuan@connect.hku.hk>
Date: Fri, 03 May 2019 09:58:54 +0100
Message-ID: <87woj752y9.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-trivial] [PATCH v3] hw/virtio/virtio-mmio: Convert
 DPRINTF to trace and log
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
X-List-Received-Date: Fri, 03 May 2019 08:59:00 -0000


Boxuan Li <liboxuan@connect.hku.hk> writes:

> Use traces for debug message and qemu_log_mask for errors.
>
> Signed-off-by: Boxuan Li <liboxuan@connect.hku.hk>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
> v1: https://patchew.org/QEMU/20190428110258.86681-1-liboxuan@connect.hku.=
hk/
> v2: https://patchew.org/QEMU/20190501081039.58938-1-liboxuan@connect.hku.=
hk/
> v3: Use qemu_log_mask for errors
> ---
>  hw/virtio/trace-events  |  7 +++++++
>  hw/virtio/virtio-mmio.c | 44 +++++++++++++++++++++-----------------------
>  2 files changed, 28 insertions(+), 23 deletions(-)
>
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 60c649c4bc..81cbe1c4b2 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -46,3 +46,10 @@ virtio_balloon_handle_output(const char *name, uint64_=
t gpa) "section name: %s g
>  virtio_balloon_get_config(uint32_t num_pages, uint32_t actual) "num_page=
s: %d actual: %d"
>  virtio_balloon_set_config(uint32_t actual, uint32_t oldactual) "actual: =
%d oldactual: %d"
>  virtio_balloon_to_target(uint64_t target, uint32_t num_pages) "balloon t=
arget: 0x%"PRIx64" num_pages: %d"
> +
> +# virtio-mmio.c
> +virtio_mmio_read(int offset) "virtio_mmio_read offset 0x%x"
> +virtio_mmio_write_offset(int offset, uint64_t value) "virtio_mmio_write =
offset 0x%x value 0x%" PRIx64
> +virtio_mmio_guest_page(uint64_t size, int shift) "guest page size 0x%" P=
RIx64 " shift %d"
> +virtio_mmio_queue_write(int value, int max_size) "mmio_queue write %d ma=
x %d"
> +virtio_mmio_setting_irq(int level) "virtio_mmio setting IRQ %d"
> diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> index 5807aa87fe..c8a9d974b3 100644
> --- a/hw/virtio/virtio-mmio.c
> +++ b/hw/virtio/virtio-mmio.c
> @@ -27,16 +27,8 @@
>  #include "sysemu/kvm.h"
>  #include "hw/virtio/virtio-bus.h"
>  #include "qemu/error-report.h"
> -
> -/* #define DEBUG_VIRTIO_MMIO */
> -
> -#ifdef DEBUG_VIRTIO_MMIO
> -
> -#define DPRINTF(fmt, ...) \
> -do { printf("virtio_mmio: " fmt , ## __VA_ARGS__); } while (0)
> -#else
> -#define DPRINTF(fmt, ...) do {} while (0)
> -#endif
> +#include "qemu/log.h"
> +#include "trace.h"
>
>  /* QOM macros */
>  /* virtio-mmio-bus */
> @@ -107,7 +99,7 @@ static uint64_t virtio_mmio_read(void *opaque, hwaddr =
offset, unsigned size)
>      VirtIOMMIOProxy *proxy =3D (VirtIOMMIOProxy *)opaque;
>      VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
>
> -    DPRINTF("virtio_mmio_read offset 0x%x\n", (int)offset);
> +    trace_virtio_mmio_read((int)offset);
>
>      if (!vdev) {
>          /* If no backend is present, we treat most registers as
> @@ -144,7 +136,9 @@ static uint64_t virtio_mmio_read(void *opaque, hwaddr=
 offset, unsigned size)
>          }
>      }
>      if (size !=3D 4) {
> -        DPRINTF("wrong size access to register!\n");
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                "%s: wrong size access to register!\n",
> +                __func__);
>          return 0;
>      }
>      switch (offset) {
> @@ -182,10 +176,12 @@ static uint64_t virtio_mmio_read(void *opaque, hwad=
dr offset, unsigned size)
>      case VIRTIO_MMIO_QUEUE_ALIGN:
>      case VIRTIO_MMIO_QUEUE_NOTIFY:
>      case VIRTIO_MMIO_INTERRUPT_ACK:
> -        DPRINTF("read of write-only register\n");
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                "%s: read of write-only register\n",
> +                __func__);
>          return 0;
>      default:
> -        DPRINTF("bad register offset\n");
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad register offset\n", __fu=
nc__);
>          return 0;
>      }
>      return 0;
> @@ -197,8 +193,7 @@ static void virtio_mmio_write(void *opaque, hwaddr of=
fset, uint64_t value,
>      VirtIOMMIOProxy *proxy =3D (VirtIOMMIOProxy *)opaque;
>      VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
>
> -    DPRINTF("virtio_mmio_write offset 0x%x value 0x%" PRIx64 "\n",
> -            (int)offset, value);
> +    trace_virtio_mmio_write_offset((int)offset, value);
>
>      if (!vdev) {
>          /* If no backend is present, we just make all registers
> @@ -226,7 +221,9 @@ static void virtio_mmio_write(void *opaque, hwaddr of=
fset, uint64_t value,
>          return;
>      }
>      if (size !=3D 4) {
> -        DPRINTF("wrong size access to register!\n");
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                "%s: wrong size access to register!\n",
> +                __func__);
>          return;
>      }
>      switch (offset) {
> @@ -246,8 +243,7 @@ static void virtio_mmio_write(void *opaque, hwaddr of=
fset, uint64_t value,
>          if (proxy->guest_page_shift > 31) {
>              proxy->guest_page_shift =3D 0;
>          }
> -        DPRINTF("guest page size %" PRIx64 " shift %d\n", value,
> -                proxy->guest_page_shift);
> +        trace_virtio_mmio_guest_page(value, proxy->guest_page_shift);
>          break;
>      case VIRTIO_MMIO_QUEUE_SEL:
>          if (value < VIRTIO_QUEUE_MAX) {
> @@ -255,7 +251,7 @@ static void virtio_mmio_write(void *opaque, hwaddr of=
fset, uint64_t value,
>          }
>          break;
>      case VIRTIO_MMIO_QUEUE_NUM:
> -        DPRINTF("mmio_queue write %d max %d\n", (int)value, VIRTQUEUE_MA=
X_SIZE);
> +        trace_virtio_mmio_queue_write((int)value, VIRTQUEUE_MAX_SIZE);
>          virtio_queue_set_num(vdev, vdev->queue_sel, value);
>          /* Note: only call this function for legacy devices */
>          virtio_queue_update_rings(vdev, vdev->queue_sel);
> @@ -303,11 +299,13 @@ static void virtio_mmio_write(void *opaque, hwaddr =
offset, uint64_t value,
>      case VIRTIO_MMIO_DEVICE_FEATURES:
>      case VIRTIO_MMIO_QUEUE_NUM_MAX:
>      case VIRTIO_MMIO_INTERRUPT_STATUS:
> -        DPRINTF("write to readonly register\n");
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                "%s: write to readonly register\n",
> +                __func__);
>          break;
>
>      default:
> -        DPRINTF("bad register offset\n");
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad register offset\n", __fu=
nc__);
>      }
>  }
>
> @@ -327,7 +325,7 @@ static void virtio_mmio_update_irq(DeviceState *opaqu=
e, uint16_t vector)
>          return;
>      }
>      level =3D (atomic_read(&vdev->isr) !=3D 0);
> -    DPRINTF("virtio_mmio setting IRQ %d\n", level);
> +    trace_virtio_mmio_setting_irq(level);
>      qemu_set_irq(proxy->irq, level);
>  }


--
Alex Benn=C3=A9e

