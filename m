Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMatB-00022d-PR
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2019 12:18:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hMat9-00022P-IQ
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 12:18:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hMat8-0002Kn-1t
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 12:18:19 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51675)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hMat7-0002Ik-PY
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 12:18:17 -0400
Received: by mail-wm1-x342.google.com with SMTP id t76so7798298wmt.1
	for <qemu-trivial@nongnu.org>; Fri, 03 May 2019 09:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=2DeXh+ySkhyX5ae4OuxCScEKbvVQrdzbdCChYD5iPBs=;
	b=K9hD8CDoIcOFKkYFXBSsdqwl/UPBDfeeZSRjl0sVVa9H7HdWxac58TFJ+fHQYydgL/
	AWnMcmouMgGORA6xyYDIdsZL4brChT4WH1+Pxd09BGG0Lwv0Snmw17tc8xDvF4JAWKCu
	Bt0EkCi75B6ogrampcz/kkD70mn9i1TEBJ60cVdLnwyHJWBeo1G4B19Gs0kKEvpaZ3Qe
	xFc7oYW0DwNHeq9MCzXAjoiPHMMR3danYoL//FiF6jB86ofl64izBxVKP+Cr/udd+8bh
	Q6e+XsgH3rrenygbigmOuifC+962vnK3v1kfROt03Uxg76Z77J0akCYz/Y1lAnzGud06
	nPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=2DeXh+ySkhyX5ae4OuxCScEKbvVQrdzbdCChYD5iPBs=;
	b=mmI2r8knBTlqtAwbvHcpkgDUOdF6JR4yudlM5wIaO15KJSDVjrmN0IeEky9kFH9BbO
	SRCq6J8VGEvd5eiPbQ61hvu9Q8dxVSHZaosELzcbOdtceZl2ZtYmFI5kd2NeENJGf4i/
	c27JlUd8Zv0fMpgcUSRsPIpoysh57/sJwSGa/AOFdSdgDum+lCT1qTLaWaDbAVfvDRhg
	whYZEi62oSiuDhtfPlLncWczrf+mo9QKwf0SDsBUNwehPQtypruZLqb2HT6Ax0D21APM
	Z8fTnIjW2tjkwD0UjDsSRdj0Q02/G1i/t/cXS4cky4KaADxf16pG5ae3f7xNS7tSRACj
	9Q9g==
X-Gm-Message-State: APjAAAXwJTtUqnW2MINO6tzJKIMC3GBc6+D7cQnMe6HhU3DZKvgRy3oA
	rfYJWDTAp9W3FAsnsxf9jQXpQw==
X-Google-Smtp-Source: APXvYqwkQ9dLXhi9CRVI1GdfOZvAMJzQrgM63tOwe2GtF1XWLk0FZBLaWeV4z8G3murfI1Pog/kYlQ==
X-Received: by 2002:a1c:eb03:: with SMTP id j3mr7002534wmh.15.1556900296311;
	Fri, 03 May 2019 09:18:16 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	c10sm5441316wrd.69.2019.05.03.09.18.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 03 May 2019 09:18:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 22C8C1FF87;
	Fri,  3 May 2019 17:18:15 +0100 (BST)
References: <20190503154424.73933-1-liboxuan@connect.hku.hk>
User-agent: mu4e 1.3.1; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Boxuan Li <liboxuan@connect.hku.hk>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, eblake@redhat.com,
	philmd@redhat.com, yuval.shaia@oracle.com,
	"Michael S. Tsirkin" <mst@redhat.com>
In-reply-to: <20190503154424.73933-1-liboxuan@connect.hku.hk>
Date: Fri, 03 May 2019 17:18:15 +0100
Message-ID: <87bm0j4im0.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-trivial] [PATCH v4] hw/virtio/virtio-mmio: Convert
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
X-List-Received-Date: Fri, 03 May 2019 16:18:21 -0000


Boxuan Li <liboxuan@connect.hku.hk> writes:

> Use traces for debug message and qemu_log_mask for errors.
>
> Signed-off-by: Boxuan Li <liboxuan@connect.hku.hk>

You didn't add my r-b tags from last time. Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
> v1: https://patchew.org/QEMU/20190428110258.86681-1-liboxuan@connect.hku.=
hk/
> v2: https://patchew.org/QEMU/20190501081039.58938-1-liboxuan@connect.hku.=
hk/
> v3: https://patchew.org/QEMU/20190503084654.18413-1-liboxuan@connect.hku.=
hk/
> v4: Fix indentation and do not convert uint64_t to int
> ---
>  hw/virtio/trace-events  |  7 +++++++
>  hw/virtio/virtio-mmio.c | 44 +++++++++++++++++++++-----------------------
>  2 files changed, 28 insertions(+), 23 deletions(-)
>
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 60c649c4bc..e28ba48da6 100644
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
> +virtio_mmio_read(uint64_t offset) "virtio_mmio_read offset 0x%" PRIx64
> +virtio_mmio_write_offset(uint64_t offset, uint64_t value) "virtio_mmio_w=
rite offset 0x%" PRIx64 " value 0x%" PRIx64
> +virtio_mmio_guest_page(uint64_t size, int shift) "guest page size 0x%" P=
RIx64 " shift %d"
> +virtio_mmio_queue_write(uint64_t value, int max_size) "mmio_queue write =
0x%" PRIx64 " max %d"
> +virtio_mmio_setting_irq(int level) "virtio_mmio setting IRQ %d"
> diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> index 5807aa87fe..96c762f0bf 100644
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
> +    trace_virtio_mmio_read(offset);
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
> +                      "%s: wrong size access to register!\n",
> +                      __func__);
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
> +                      "%s: read of write-only register\n",
> +                      __func__);
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
> +    trace_virtio_mmio_write_offset(offset, value);
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
> +                      "%s: wrong size access to register!\n",
> +                      __func__);
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
> +        trace_virtio_mmio_queue_write(value, VIRTQUEUE_MAX_SIZE);
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
> +                      "%s: write to readonly register\n",
> +                      __func__);
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

