Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cBViT-0001jE-AJ
	for mharc-qemu-trivial@gnu.org; Mon, 28 Nov 2016 18:52:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36931)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cBViP-0001hI-LE
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2016 18:52:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cBViO-0005Vy-9E
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2016 18:52:05 -0500
Received: from mail-oi0-f67.google.com ([209.85.218.67]:36411)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1cBViI-0005VL-Tj; Mon, 28 Nov 2016 18:51:59 -0500
Received: by mail-oi0-f67.google.com with SMTP id u15so16087415oie.3;
	Mon, 28 Nov 2016 15:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=F19BV7IJopPTCW/F44h59QlZUD9oGSbvESYt6iwzkzA=;
	b=wGt7SifOAOniMuDgIu1CqLcUPmnvfCJOHMAKJV8+vsRHbnkDJwE5l8leHS0245gyFk
	ojsYPoEmR5Ydo2vxL1VRpq6dAP2TP+ekIKKHHQDb/GLNVpXPdBm6CEFWPlAtGyNRljhf
	9i5IRfm9OJfvCobkfxhIcgq7fmUJrXAaQG+yOqVnV33KRRaoNKKCQ5iiIE7TtpaUiq7K
	y7p5M4VaBZXdJcjp9UOMpYhFit2BCr4ZWo6lbSASi0fw37iimiEUcnSSr0Vg1iMpfFkJ
	uchQxqX6VzdPQPYsDjF+Pa4Vq+a00sIbvbnRtiQVwnr+3aF1B53laInEvYvzljxtsx4F
	ijMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=F19BV7IJopPTCW/F44h59QlZUD9oGSbvESYt6iwzkzA=;
	b=QZNXCtR1OyW48f+Q7/U7fAHOV7L9DlIt+bzpdJNMcv5Org5xb9F0LZBIaF5HnLH890
	Vy4hPLPzFa+dAnHTarAxiFcmjYhFj5AEoIBXNiCWWbeCSm+yQQLTcjTvhH18bl1dzBU2
	SOVL6vwCnv2aHSCffzYZTcB9D7rRg7f+J7/3CtGymPKat0w3k+QegWmt/H0y57lIBtS6
	IR3gygIiK6mJC1koydFuhdSz0AA7nZ5JcqzI+3A+QELxJ6+N0GSeldMJReb9AjRDKP+C
	BNz/dOkWmHnmuPrh7EDE/A0TIRvIXLvSzHJjIDlO9jliFW2IMWxUeZlc5fIs4Yax9Yzs
	uaew==
X-Gm-Message-State: AKaTC006BGTyuVWjxWFlnE95O83/yGe6ram0pNCKdhCOpnGkjWBhHfuVosarUzWkbwyGl4I8DrjJkdpcl+YV/g==
X-Received: by 10.202.242.67 with SMTP id q64mr11746268oih.98.1480377057920;
	Mon, 28 Nov 2016 15:50:57 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.182.122.34 with HTTP; Mon, 28 Nov 2016 15:50:27 -0800 (PST)
In-Reply-To: <20161119192926.19632-1-sw@weilnetz.de>
References: <20161119192926.19632-1-sw@weilnetz.de>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 28 Nov 2016 15:50:27 -0800
X-Google-Sender-Auth: 0KwqeCXr57YXQhgfw85rwTWGrWA
Message-ID: <CAKmqyKMdjx=Xq3qr626R95Nj=Os9nzEKd=zjhaKRcXk9YUXS8A@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: QEMU Developer <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Alistair Francis <alistair.francis@xilinx.com>,
	Gerd Hoffmann <kraxel@redhat.com>, 
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, 
	Max Reitz <mreitz@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.218.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.8] hw: Fix typos found
 by codespell
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
X-List-Received-Date: Mon, 28 Nov 2016 23:52:08 -0000

On Sat, Nov 19, 2016 at 11:29 AM, Stefan Weil <sw@weilnetz.de> wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Acked-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  hw/block/m25p80.c         | 4 ++--
>  hw/core/generic-loader.c  | 4 ++--
>  hw/core/qdev-properties.c | 2 +-
>  hw/display/xlnx_dp.c      | 4 ++--
>  hw/i386/pc.c              | 2 +-
>  hw/net/cadence_gem.c      | 2 +-
>  hw/net/spapr_llan.c       | 4 ++--
>  hw/ppc/spapr_drc.c        | 2 +-
>  hw/s390x/s390-pci-bus.h   | 4 ++--
>  hw/usb/dev-mtp.c          | 2 +-
>  hw/vfio/pci-quirks.c      | 2 +-
>  hw/virtio/virtio-crypto.c | 2 +-
>  12 files changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index d29ff4c..09ea51f 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -121,7 +121,7 @@ typedef struct FlashPartInfo {
>  #define CFG_DUMMY_CLK_LEN 4
>  #define NVCFG_DUMMY_CLK_POS 12
>  #define VCFG_DUMMY_CLK_POS 4
> -#define EVCFG_OUT_DRIVER_STRENGHT_DEF 7
> +#define EVCFG_OUT_DRIVER_STRENGTH_DEF 7
>  #define EVCFG_VPP_ACCELERATOR (1 << 3)
>  #define EVCFG_RESET_HOLD_ENABLED (1 << 4)
>  #define NVCFG_DUAL_IO_MASK (1 << 2)
> @@ -700,7 +700,7 @@ static void reset_memory(Flash *s)
>                              );
>
>          s->enh_volatile_cfg = 0;
> -        s->enh_volatile_cfg |= EVCFG_OUT_DRIVER_STRENGHT_DEF;
> +        s->enh_volatile_cfg |= EVCFG_OUT_DRIVER_STRENGTH_DEF;
>          s->enh_volatile_cfg |= EVCFG_VPP_ACCELERATOR;
>          s->enh_volatile_cfg |= EVCFG_RESET_HOLD_ENABLED;
>          if (s->nonvolatile_cfg & NVCFG_DUAL_IO_MASK) {
> diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
> index 79ab6df..8716cc3 100644
> --- a/hw/core/generic-loader.c
> +++ b/hw/core/generic-loader.c
> @@ -27,7 +27,7 @@
>   * this it needs a backend to manage the datas, the same as other
>   * memory-related devices. In this case as the backend is so trivial we
>   * have merged it with the frontend instead of creating and maintaining a
> - * seperate backend.
> + * separate backend.
>   */
>
>  #include "qemu/osdep.h"
> @@ -79,7 +79,7 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
>                         "loading memory values");
>              return;
>          } else if (!s->data_len) {
> -            /* We cant' check for !data here as a value of 0 is still valid. */
> +            /* We can't check for !data here as a value of 0 is still valid. */
>              error_setg(errp, "Both data and data-len must be specified");
>              return;
>          } else if (s->data_len > 8) {
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index 2a82768..6ab4265 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -711,7 +711,7 @@ static void get_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
>
>      /*
>       * Catch "invalid" device reference from vfio-pci and allow the
> -     * default buffer representing the non-existant device to be used.
> +     * default buffer representing the non-existent device to be used.
>       */
>      if (~addr->domain || ~addr->bus || ~addr->slot || ~addr->function) {
>          rc = snprintf(buffer, sizeof(buffer), "%04x:%02x:%02x.%0d",
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index f43eb09..f7b7b80 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -555,7 +555,7 @@ static void xlnx_dp_recreate_surface(XlnxDPState *s)
>      if ((width != 0) && (height != 0)) {
>          /*
>           * As dpy_gfx_replace_surface calls qemu_free_displaysurface on the
> -         * surface we need to be carefull and don't free the surface associated
> +         * surface we need to be careful and don't free the surface associated
>           * to the console or double free will happen.
>           */
>          if (s->bout_plane.surface != current_console_surface) {
> @@ -1160,7 +1160,7 @@ static void xlnx_dp_update_display(void *opaque)
>       */
>      if (!xlnx_dpdma_start_operation(s->dpdma, 3, false)) {
>          /*
> -         * An error occured don't do anything with the data..
> +         * An error occurred don't do anything with the data..
>           * Trigger an underflow interrupt.
>           */
>          s->core_registers[DP_INT_STATUS] |= (1 << 21);
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index a9b1950..0c3ee99 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1785,7 +1785,7 @@ static int pc_apic_cmp(const void *a, const void *b)
>
>  /* returns pointer to CPUArchId descriptor that matches CPU's apic_id
>   * in pcms->possible_cpus->cpus, if pcms->possible_cpus->cpus has no
> - * entry correponding to CPU's apic_id returns NULL.
> + * entry corresponding to CPU's apic_id returns NULL.
>   */
>  static CPUArchId *pc_find_cpu_slot(PCMachineState *pcms, CPUState *cpu,
>                                     int *idx)
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 7915732..e99d454 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -896,7 +896,7 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>
>      DB_PRINT("config bufsize: %d packet size: %ld\n", rxbufsize, size);
>
> -    /* Find which queue we are targetting */
> +    /* Find which queue we are targeting */
>      q = get_queue_from_screen(s, rxbuf_ptr, rxbufsize);
>
>      while (bytes_to_copy) {
> diff --git a/hw/net/spapr_llan.c b/hw/net/spapr_llan.c
> index 01ecb02..058908d 100644
> --- a/hw/net/spapr_llan.c
> +++ b/hw/net/spapr_llan.c
> @@ -105,7 +105,7 @@ typedef struct VIOsPAPRVLANDevice {
>      uint32_t add_buf_ptr, use_buf_ptr, rx_bufs;
>      hwaddr rxq_ptr;
>      QEMUTimer *rxp_timer;
> -    uint32_t compat_flags;             /* Compatability flags for migration */
> +    uint32_t compat_flags;             /* Compatibility flags for migration */
>      RxBufPool *rx_pool[RX_MAX_POOLS];  /* Receive buffer descriptor pools */
>  } VIOsPAPRVLANDevice;
>
> @@ -559,7 +559,7 @@ static target_long spapr_vlan_add_rxbuf_to_pool(VIOsPAPRVLANDevice *dev,
>      if (pool < 0) {
>          /*
>           * No matching pool found? Try to use a new one. If the guest used all
> -         * pools before, but changed the size of one pool inbetween, we might
> +         * pools before, but changed the size of one pool in the meantime, we might
>           * need to recycle that pool here (if it's empty already). Thus scan
>           * all buffer pools now, starting with the last (likely empty) one.
>           */
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index a0c44ee..2de6377 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -59,7 +59,7 @@ static uint32_t set_isolation_state(sPAPRDRConnector *drc,
>      trace_spapr_drc_set_isolation_state(get_index(drc), state);
>
>      if (state == SPAPR_DR_ISOLATION_STATE_UNISOLATED) {
> -        /* cannot unisolate a non-existant resource, and, or resources
> +        /* cannot unisolate a non-existent resource, and, or resources
>           * which are in an 'UNUSABLE' allocation state. (PAPR 2.7, 13.5.3.5)
>           */
>          if (!drc->dev ||
> diff --git a/hw/s390x/s390-pci-bus.h b/hw/s390x/s390-pci-bus.h
> index 7f27013..ad0511d 100644
> --- a/hw/s390x/s390-pci-bus.h
> +++ b/hw/s390x/s390-pci-bus.h
> @@ -180,8 +180,8 @@ enum ZpciIoatDtype {
>   *          may enter an error state
>   * blocked: ignore all DMA and interrupts; transition back to enabled or from
>   *          error state via mpcifc
> - * error: an error occured; transition back to enabled via mpcifc
> - * permanent error: an unrecoverable error occured; transition to standby via
> + * error: an error occurred; transition back to enabled via mpcifc
> + * permanent error: an unrecoverable error occurred; transition to standby via
>   *                  sclp deconfigure
>   */
>  typedef enum {
> diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
> index 9cb0f50..809dcf5 100644
> --- a/hw/usb/dev-mtp.c
> +++ b/hw/usb/dev-mtp.c
> @@ -1093,7 +1093,7 @@ static MTPData *usb_mtp_get_object_prop_value(MTPState *s, MTPControl *c,
>          }
>          break;
>      case PROP_PERSISTENT_UNIQUE_OBJECT_IDENTIFIER:
> -        /* Should be persistant between sessions,
> +        /* Should be persistent between sessions,
>           * but using our objedt ID is "good enough"
>           * for now */
>          usb_mtp_add_u64(d, 0x0000000000000000);
> diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
> index 811eecd..6c771f7 100644
> --- a/hw/vfio/pci-quirks.c
> +++ b/hw/vfio/pci-quirks.c
> @@ -1171,7 +1171,7 @@ static int vfio_pci_igd_host_init(VFIOPCIDevice *vdev,
>   * IGD LPC/ISA bridge support code.  The vBIOS needs this, but we can't write
>   * arbitrary values into just any bridge, so we must create our own.  We try
>   * to handle if the user has created it for us, which they might want to do
> - * to enable multifuction so we don't occupy the whole PCI slot.
> + * to enable multifunction so we don't occupy the whole PCI slot.
>   */
>  static void vfio_pci_igd_lpc_bridge_realize(PCIDevice *pdev, Error **errp)
>  {
> diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> index 3293843..11ba6e3 100644
> --- a/hw/virtio/virtio-crypto.c
> +++ b/hw/virtio/virtio-crypto.c
> @@ -766,7 +766,7 @@ static void virtio_crypto_device_realize(DeviceState *dev, Error **errp)
>      vcrypto->max_queues = MAX(vcrypto->cryptodev->conf.peers.queues, 1);
>      if (vcrypto->max_queues + 1 > VIRTIO_QUEUE_MAX) {
>          error_setg(errp, "Invalid number of queues (= %" PRIu32 "), "
> -                   "must be a postive integer less than %d.",
> +                   "must be a positive integer less than %d.",
>                     vcrypto->max_queues, VIRTIO_QUEUE_MAX);
>          return;
>      }
> --
> 2.10.2
>
>

