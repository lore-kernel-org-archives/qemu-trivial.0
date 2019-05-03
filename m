Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMUhI-0004Om-7B
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2019 05:41:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liboxuan@connect.hku.hk>) id 1hMUhE-0004Mi-Mx
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 05:41:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liboxuan@connect.hku.hk>) id 1hMUhC-00068U-GJ
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 05:41:36 -0400
Received: from mail-yw1-xc42.google.com ([2607:f8b0:4864:20::c42]:39207)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liboxuan@connect.hku.hk>)
	id 1hMUhB-000688-US
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 05:41:34 -0400
Received: by mail-yw1-xc42.google.com with SMTP id x204so3819439ywg.6
	for <qemu-trivial@nongnu.org>; Fri, 03 May 2019 02:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=connect-hku-hk.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9i58FFWVeZZyMkI0tuKumsAKqliaf4k/fr4QfEZ/1/k=;
	b=sf0/0u2kQPue5sST8f/jqKGyTq7tC63luY7xTloLxe2Erw4qkOUj6QESTToFK8d8pO
	lMTgFjdkQoxP8eH9d8mF8a7l2jGP8/tr/jtxTdmFFvROXCxL/D4QElja2E512pjhSggP
	AaRtpfy3TtSWiPxrJ8fif5jUBWmRjajRR1GQQE14chcUzF4aEQXhPSzyj2mMSve/hqVx
	SlqCy8YBDOgd8jl7kLDglM2kkTWtLTWhXvTGDwrrKWlgtsNFh9FGtaUwAk5xwd1IYgXC
	V6BnDSZuVAe//VIS6SstmWbrGqH/s12hA2GCN4cpv9nz3W3+JY8GqlM6WD4M7+IB/tul
	jIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9i58FFWVeZZyMkI0tuKumsAKqliaf4k/fr4QfEZ/1/k=;
	b=cEmgo02/+DF6cVIKql/CgMvXvVb7+Ba/mGKm5xRSzFeqEMRSpLSvKqEDu0wzVx/xfN
	mIHrpwM0UpSo1tP/jgYIPYCaAA/yGQXqcY88PC+ymvGhn/BzpxYm9HVKyUZ5Gn2KNfKo
	qH3yr2zAEpyifgIIxBB2q+4r23648oqTX1Ek4weyFZJIpI89L1G8neDOVJejjdHmEJ66
	GPmQfbMH+5hEeW3jPv4PsofJF4XWHg8Y+i9yP3GWphcY2vDTGbabUlJ7WnpiTxWM2rpb
	ZFWe0h/5iGeNYJ6ei/LV1cWCKhKBy9FAmZVmq9F44TwwoMrnqJKc/XPKdMOowNnK+sen
	TxWA==
X-Gm-Message-State: APjAAAXNsJG2jy60eRE5v4xgsOQwMuhlzOWfeDR/5aXKU79h9ih08A84
	Glj6hFxL3y9S3MKNGbmdVwISiF9KnQEF3jbmuN24JQ==
X-Google-Smtp-Source: APXvYqzIVEykZOYg4RXqAD8XfkoegW3zlgZw4RCGU7hBF0/Lm0eWo81B26Pfrs9IgmsIOoh7qyd4zavIoL8IPRsxuk4=
X-Received: by 2002:a81:2ac3:: with SMTP id q186mr7096684ywq.335.1556876492946;
	Fri, 03 May 2019 02:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190503084654.18413-1-liboxuan@connect.hku.hk>
	<0f731e62-b716-8f90-4505-019f731bd072@redhat.com>
In-Reply-To: <0f731e62-b716-8f90-4505-019f731bd072@redhat.com>
From: "LI, BO XUAN" <liboxuan@connect.hku.hk>
Date: Fri, 3 May 2019 17:40:57 +0800
Message-ID: <CALM0=-kVRG+gdcBXQdpowuq89pDCkmwbyE9Ha8T=MKdA5eEM0A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
	Eric Blake <eblake@redhat.com>, Yuval Shaia <yuval.shaia@oracle.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000525a030587f88e31"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::c42
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
X-List-Received-Date: Fri, 03 May 2019 09:41:38 -0000

--000000000000525a030587f88e31
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gotcha, thanks for the tip! I'll resend updated patch soon.

On Fri, May 3, 2019 at 5:12 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om>
wrote:

> Hi Li,
>
> On 5/3/19 10:46 AM, Boxuan Li wrote:
> > Use traces for debug message and qemu_log_mask for errors.
> >
> > Signed-off-by: Boxuan Li <liboxuan@connect.hku.hk>
> > ---
> > v1:
> https://patchew.org/QEMU/20190428110258.86681-1-liboxuan@connect.hku.hk/
> > v2:
> https://patchew.org/QEMU/20190501081039.58938-1-liboxuan@connect.hku.hk/
> > v3: Use qemu_log_mask for errors
> > ---
> >  hw/virtio/trace-events  |  7 +++++++
> >  hw/virtio/virtio-mmio.c | 44
> +++++++++++++++++++++-----------------------
> >  2 files changed, 28 insertions(+), 23 deletions(-)
> >
> > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > index 60c649c4bc..81cbe1c4b2 100644
> > --- a/hw/virtio/trace-events
> > +++ b/hw/virtio/trace-events
> > @@ -46,3 +46,10 @@ virtio_balloon_handle_output(const char *name,
> uint64_t gpa) "section name: %s g
> >  virtio_balloon_get_config(uint32_t num_pages, uint32_t actual)
> "num_pages: %d actual: %d"
> >  virtio_balloon_set_config(uint32_t actual, uint32_t oldactual) "actual=
:
> %d oldactual: %d"
> >  virtio_balloon_to_target(uint64_t target, uint32_t num_pages) "balloon
> target: 0x%"PRIx64" num_pages: %d"
> > +
> > +# virtio-mmio.c
> > +virtio_mmio_read(int offset) "virtio_mmio_read offset 0x%x"
> > +virtio_mmio_write_offset(int offset, uint64_t value) "virtio_mmio_writ=
e
> offset 0x%x value 0x%" PRIx64
>
> If possible, use uint64_t/PRIx64 for offset (to avoid casting to int).
>
> > +virtio_mmio_guest_page(uint64_t size, int shift) "guest page size 0x%"
> PRIx64 " shift %d"
> > +virtio_mmio_queue_write(int value, int max_size) "mmio_queue write %d
> max %d"
> > +virtio_mmio_setting_irq(int level) "virtio_mmio setting IRQ %d"
> > diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> > index 5807aa87fe..c8a9d974b3 100644
> > --- a/hw/virtio/virtio-mmio.c
> > +++ b/hw/virtio/virtio-mmio.c
> > @@ -27,16 +27,8 @@
> >  #include "sysemu/kvm.h"
> >  #include "hw/virtio/virtio-bus.h"
> >  #include "qemu/error-report.h"
> > -
> > -/* #define DEBUG_VIRTIO_MMIO */
> > -
> > -#ifdef DEBUG_VIRTIO_MMIO
> > -
> > -#define DPRINTF(fmt, ...) \
> > -do { printf("virtio_mmio: " fmt , ## __VA_ARGS__); } while (0)
> > -#else
> > -#define DPRINTF(fmt, ...) do {} while (0)
> > -#endif
> > +#include "qemu/log.h"
> > +#include "trace.h"
> >
> >  /* QOM macros */
> >  /* virtio-mmio-bus */
> > @@ -107,7 +99,7 @@ static uint64_t virtio_mmio_read(void *opaque, hwadd=
r
> offset, unsigned size)
> >      VirtIOMMIOProxy *proxy =3D (VirtIOMMIOProxy *)opaque;
> >      VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> >
> > -    DPRINTF("virtio_mmio_read offset 0x%x\n", (int)offset);
> > +    trace_virtio_mmio_read((int)offset);
> >
> >      if (!vdev) {
> >          /* If no backend is present, we treat most registers as
> > @@ -144,7 +136,9 @@ static uint64_t virtio_mmio_read(void *opaque,
> hwaddr offset, unsigned size)
> >          }
> >      }
> >      if (size !=3D 4) {
> > -        DPRINTF("wrong size access to register!\n");
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                "%s: wrong size access to register!\n",
> > +                __func__);
>
> QEMU codying style is to indent the arguments aligned, after the caller
> parenthesis:
>
>         qemu_log_mask(LOG_GUEST_ERROR,
>                       "%s: wrong size access to register!\n",
>                       __func__);
>
> That said:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> Thanks for the cleanup!
>
> >          return 0;
> >      }
> >      switch (offset) {
> > @@ -182,10 +176,12 @@ static uint64_t virtio_mmio_read(void *opaque,
> hwaddr offset, unsigned size)
> >      case VIRTIO_MMIO_QUEUE_ALIGN:
> >      case VIRTIO_MMIO_QUEUE_NOTIFY:
> >      case VIRTIO_MMIO_INTERRUPT_ACK:
> > -        DPRINTF("read of write-only register\n");
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                "%s: read of write-only register\n",
> > +                __func__);
> >          return 0;
> >      default:
> > -        DPRINTF("bad register offset\n");
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad register offset\n",
> __func__);
> >          return 0;
> >      }
> >      return 0;
> > @@ -197,8 +193,7 @@ static void virtio_mmio_write(void *opaque, hwaddr
> offset, uint64_t value,
> >      VirtIOMMIOProxy *proxy =3D (VirtIOMMIOProxy *)opaque;
> >      VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> >
> > -    DPRINTF("virtio_mmio_write offset 0x%x value 0x%" PRIx64 "\n",
> > -            (int)offset, value);
> > +    trace_virtio_mmio_write_offset((int)offset, value);
> >
> >      if (!vdev) {
> >          /* If no backend is present, we just make all registers
> > @@ -226,7 +221,9 @@ static void virtio_mmio_write(void *opaque, hwaddr
> offset, uint64_t value,
> >          return;
> >      }
> >      if (size !=3D 4) {
> > -        DPRINTF("wrong size access to register!\n");
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                "%s: wrong size access to register!\n",
> > +                __func__);
> >          return;
> >      }
> >      switch (offset) {
> > @@ -246,8 +243,7 @@ static void virtio_mmio_write(void *opaque, hwaddr
> offset, uint64_t value,
> >          if (proxy->guest_page_shift > 31) {
> >              proxy->guest_page_shift =3D 0;
> >          }
> > -        DPRINTF("guest page size %" PRIx64 " shift %d\n", value,
> > -                proxy->guest_page_shift);
> > +        trace_virtio_mmio_guest_page(value, proxy->guest_page_shift);
> >          break;
> >      case VIRTIO_MMIO_QUEUE_SEL:
> >          if (value < VIRTIO_QUEUE_MAX) {
> > @@ -255,7 +251,7 @@ static void virtio_mmio_write(void *opaque, hwaddr
> offset, uint64_t value,
> >          }
> >          break;
> >      case VIRTIO_MMIO_QUEUE_NUM:
> > -        DPRINTF("mmio_queue write %d max %d\n", (int)value,
> VIRTQUEUE_MAX_SIZE);
> > +        trace_virtio_mmio_queue_write((int)value, VIRTQUEUE_MAX_SIZE);
> >          virtio_queue_set_num(vdev, vdev->queue_sel, value);
> >          /* Note: only call this function for legacy devices */
> >          virtio_queue_update_rings(vdev, vdev->queue_sel);
> > @@ -303,11 +299,13 @@ static void virtio_mmio_write(void *opaque, hwadd=
r
> offset, uint64_t value,
> >      case VIRTIO_MMIO_DEVICE_FEATURES:
> >      case VIRTIO_MMIO_QUEUE_NUM_MAX:
> >      case VIRTIO_MMIO_INTERRUPT_STATUS:
> > -        DPRINTF("write to readonly register\n");
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                "%s: write to readonly register\n",
> > +                __func__);
> >          break;
> >
> >      default:
> > -        DPRINTF("bad register offset\n");
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad register offset\n",
> __func__);
> >      }
> >  }
> >
> > @@ -327,7 +325,7 @@ static void virtio_mmio_update_irq(DeviceState
> *opaque, uint16_t vector)
> >          return;
> >      }
> >      level =3D (atomic_read(&vdev->isr) !=3D 0);
> > -    DPRINTF("virtio_mmio setting IRQ %d\n", level);
> > +    trace_virtio_mmio_setting_irq(level);
> >      qemu_set_irq(proxy->irq, level);
> >  }
> >
> >
>

--000000000000525a030587f88e31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Gotcha, thanks for the tip! I&#39;ll resend updated patch =
soon.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Fri, May 3, 2019 at 5:12 PM Philippe Mathieu-Daud=C3=A9 &lt;<a =
href=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
On 5/3/19 10:46 AM, Boxuan Li wrote:<br>
&gt; Use traces for debug message and qemu_log_mask for errors.<br>
&gt; <br>
&gt; Signed-off-by: Boxuan Li &lt;<a href=3D"mailto:liboxuan@connect.hku.hk=
" target=3D"_blank">liboxuan@connect.hku.hk</a>&gt;<br>
&gt; ---<br>
&gt; v1: <a href=3D"https://patchew.org/QEMU/20190428110258.86681-1-liboxua=
n@connect.hku.hk/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org=
/QEMU/20190428110258.86681-1-liboxuan@connect.hku.hk/</a><br>
&gt; v2: <a href=3D"https://patchew.org/QEMU/20190501081039.58938-1-liboxua=
n@connect.hku.hk/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org=
/QEMU/20190501081039.58938-1-liboxuan@connect.hku.hk/</a><br>
&gt; v3: Use qemu_log_mask for errors<br>
&gt; ---<br>
&gt;=C2=A0 hw/virtio/trace-events=C2=A0 |=C2=A0 7 +++++++<br>
&gt;=C2=A0 hw/virtio/virtio-mmio.c | 44 +++++++++++++++++++++--------------=
---------<br>
&gt;=C2=A0 2 files changed, 28 insertions(+), 23 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events<br>
&gt; index 60c649c4bc..81cbe1c4b2 100644<br>
&gt; --- a/hw/virtio/trace-events<br>
&gt; +++ b/hw/virtio/trace-events<br>
&gt; @@ -46,3 +46,10 @@ virtio_balloon_handle_output(const char *name, uint=
64_t gpa) &quot;section name: %s g<br>
&gt;=C2=A0 virtio_balloon_get_config(uint32_t num_pages, uint32_t actual) &=
quot;num_pages: %d actual: %d&quot;<br>
&gt;=C2=A0 virtio_balloon_set_config(uint32_t actual, uint32_t oldactual) &=
quot;actual: %d oldactual: %d&quot;<br>
&gt;=C2=A0 virtio_balloon_to_target(uint64_t target, uint32_t num_pages) &q=
uot;balloon target: 0x%&quot;PRIx64&quot; num_pages: %d&quot;<br>
&gt; +<br>
&gt; +# virtio-mmio.c<br>
&gt; +virtio_mmio_read(int offset) &quot;virtio_mmio_read offset 0x%x&quot;=
<br>
&gt; +virtio_mmio_write_offset(int offset, uint64_t value) &quot;virtio_mmi=
o_write offset 0x%x value 0x%&quot; PRIx64<br>
<br>
If possible, use uint64_t/PRIx64 for offset (to avoid casting to int).<br>
<br>
&gt; +virtio_mmio_guest_page(uint64_t size, int shift) &quot;guest page siz=
e 0x%&quot; PRIx64 &quot; shift %d&quot;<br>
&gt; +virtio_mmio_queue_write(int value, int max_size) &quot;mmio_queue wri=
te %d max %d&quot;<br>
&gt; +virtio_mmio_setting_irq(int level) &quot;virtio_mmio setting IRQ %d&q=
uot;<br>
&gt; diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c<br>
&gt; index 5807aa87fe..c8a9d974b3 100644<br>
&gt; --- a/hw/virtio/virtio-mmio.c<br>
&gt; +++ b/hw/virtio/virtio-mmio.c<br>
&gt; @@ -27,16 +27,8 @@<br>
&gt;=C2=A0 #include &quot;sysemu/kvm.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/virtio/virtio-bus.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/error-report.h&quot;<br>
&gt; -<br>
&gt; -/* #define DEBUG_VIRTIO_MMIO */<br>
&gt; -<br>
&gt; -#ifdef DEBUG_VIRTIO_MMIO<br>
&gt; -<br>
&gt; -#define DPRINTF(fmt, ...) \<br>
&gt; -do { printf(&quot;virtio_mmio: &quot; fmt , ## __VA_ARGS__); } while =
(0)<br>
&gt; -#else<br>
&gt; -#define DPRINTF(fmt, ...) do {} while (0)<br>
&gt; -#endif<br>
&gt; +#include &quot;qemu/log.h&quot;<br>
&gt; +#include &quot;trace.h&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /* QOM macros */<br>
&gt;=C2=A0 /* virtio-mmio-bus */<br>
&gt; @@ -107,7 +99,7 @@ static uint64_t virtio_mmio_read(void *opaque, hwad=
dr offset, unsigned size)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 VirtIOMMIOProxy *proxy =3D (VirtIOMMIOProxy *)opaq=
ue;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 VirtIODevice *vdev =3D virtio_bus_get_device(&amp;=
proxy-&gt;bus);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 DPRINTF(&quot;virtio_mmio_read offset 0x%x\n&quot;, (in=
t)offset);<br>
&gt; +=C2=A0 =C2=A0 trace_virtio_mmio_read((int)offset);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!vdev) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If no backend is present, we trea=
t most registers as<br>
&gt; @@ -144,7 +136,9 @@ static uint64_t virtio_mmio_read(void *opaque, hwa=
ddr offset, unsigned size)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (size !=3D 4) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 DPRINTF(&quot;wrong size access to regist=
er!\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: wro=
ng size access to register!\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__);<br=
>
<br>
QEMU codying style is to indent the arguments aligned, after the caller<br>
parenthesis:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;%s: wrong size access to register!\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__);<br>
<br>
That said:<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redha=
t.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
Tested-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.=
com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
<br>
Thanks for the cleanup!<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 switch (offset) {<br>
&gt; @@ -182,10 +176,12 @@ static uint64_t virtio_mmio_read(void *opaque, h=
waddr offset, unsigned size)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case VIRTIO_MMIO_QUEUE_ALIGN:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case VIRTIO_MMIO_QUEUE_NOTIFY:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case VIRTIO_MMIO_INTERRUPT_ACK:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 DPRINTF(&quot;read of write-only register=
\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: rea=
d of write-only register\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 DPRINTF(&quot;bad register offset\n&quot;=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: =
bad register offset\n&quot;, __func__);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; @@ -197,8 +193,7 @@ static void virtio_mmio_write(void *opaque, hwaddr=
 offset, uint64_t value,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 VirtIOMMIOProxy *proxy =3D (VirtIOMMIOProxy *)opaq=
ue;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 VirtIODevice *vdev =3D virtio_bus_get_device(&amp;=
proxy-&gt;bus);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 DPRINTF(&quot;virtio_mmio_write offset 0x%x value 0x%&q=
uot; PRIx64 &quot;\n&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (int)offset, value);<br>
&gt; +=C2=A0 =C2=A0 trace_virtio_mmio_write_offset((int)offset, value);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!vdev) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If no backend is present, we just=
 make all registers<br>
&gt; @@ -226,7 +221,9 @@ static void virtio_mmio_write(void *opaque, hwaddr=
 offset, uint64_t value,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (size !=3D 4) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 DPRINTF(&quot;wrong size access to regist=
er!\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: wro=
ng size access to register!\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 switch (offset) {<br>
&gt; @@ -246,8 +243,7 @@ static void virtio_mmio_write(void *opaque, hwaddr=
 offset, uint64_t value,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (proxy-&gt;guest_page_shift &gt; =
31) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proxy-&gt;guest_page_s=
hift =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 DPRINTF(&quot;guest page size %&quot; PRI=
x64 &quot; shift %d\n&quot;, value,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proxy-&gt;gue=
st_page_shift);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_virtio_mmio_guest_page(value, proxy=
-&gt;guest_page_shift);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case VIRTIO_MMIO_QUEUE_SEL:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &lt; VIRTIO_QUEUE_MAX) {<b=
r>
&gt; @@ -255,7 +251,7 @@ static void virtio_mmio_write(void *opaque, hwaddr=
 offset, uint64_t value,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case VIRTIO_MMIO_QUEUE_NUM:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 DPRINTF(&quot;mmio_queue write %d max %d\=
n&quot;, (int)value, VIRTQUEUE_MAX_SIZE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_virtio_mmio_queue_write((int)value,=
 VIRTQUEUE_MAX_SIZE);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_queue_set_num(vdev, vdev-&gt;=
queue_sel, value);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Note: only call this function for=
 legacy devices */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_queue_update_rings(vdev, vdev=
-&gt;queue_sel);<br>
&gt; @@ -303,11 +299,13 @@ static void virtio_mmio_write(void *opaque, hwad=
dr offset, uint64_t value,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case VIRTIO_MMIO_DEVICE_FEATURES:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case VIRTIO_MMIO_QUEUE_NUM_MAX:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case VIRTIO_MMIO_INTERRUPT_STATUS:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 DPRINTF(&quot;write to readonly register\=
n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: wri=
te to readonly register\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 DPRINTF(&quot;bad register offset\n&quot;=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: =
bad register offset\n&quot;, __func__);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -327,7 +325,7 @@ static void virtio_mmio_update_irq(DeviceState *op=
aque, uint16_t vector)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 level =3D (atomic_read(&amp;vdev-&gt;isr) !=3D 0);=
<br>
&gt; -=C2=A0 =C2=A0 DPRINTF(&quot;virtio_mmio setting IRQ %d\n&quot;, level=
);<br>
&gt; +=C2=A0 =C2=A0 trace_virtio_mmio_setting_irq(level);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_set_irq(proxy-&gt;irq, level);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; <br>
</blockquote></div>

--000000000000525a030587f88e31--

