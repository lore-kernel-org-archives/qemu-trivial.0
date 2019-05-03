Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMayS-0005wM-Lf
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2019 12:23:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46231)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liboxuan@connect.hku.hk>) id 1hMayP-0005u5-OK
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 12:23:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liboxuan@connect.hku.hk>) id 1hMayN-0007pB-Gy
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 12:23:45 -0400
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:43969)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liboxuan@connect.hku.hk>)
	id 1hMayM-0007nD-Rb
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 12:23:43 -0400
Received: by mail-yw1-xc41.google.com with SMTP id p19so1891397ywe.10
	for <qemu-trivial@nongnu.org>; Fri, 03 May 2019 09:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=connect-hku-hk.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ur8T8LWqDP6W0fjDMK0HxlnVo3TThPJnX1IonkrMF3c=;
	b=XnUBxiXrD44KUAsjTCoKP9ZUWQCCqS/gp9ul+eXsRfWzqUCIyopjjHZZOQcuyZxYgU
	mRz/Kht2qJY6Ad1QZIg8txZyTJFK0YtvYvEldDcyo2u8Cm4FmAqgolyoRSXbXoscwCmH
	15qf38fwGkmnJPkdKISi0DHaPoLnsf78gmpF+yQCGc/nUAI2iW/KYdQI7/LjLAtbx7VY
	Jh0lBIEfVMR54KsAbJLEFNFxxEBxUoD8yXHKuLs+Yx0tm9ZNsukT++G4Hn5TPI2/4NPf
	+x4NmKgDDy9EA8oTJvT9lp6nZagA4Q299BApbJcjmvqBwshEQONJt+mT/HkWilmUCQom
	dr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ur8T8LWqDP6W0fjDMK0HxlnVo3TThPJnX1IonkrMF3c=;
	b=qXzf0xmVVJwkkWjnLJA5L7CvWfKXulN/eP3S/5P1ywZEZRRqLniIcINKU7kBhDOnMI
	vIsIjzSJmKjAFa+MQkKXqhm2/3xK1hu0NUtNWk7Fe/LIVb30I8sUwOheC7Z1Z/vDaT86
	pHMJHMtLeQRI9GS3vzOMnGvgmNFhQnPNjxTvEPzcY3V549GI2tQ/Q6Hyc0flNbb8pd8d
	KM/RZfcOoNWN06gd4xpkpkNPlAGFNOqUsf3zHEu5/mPMj9Ez/t1nonUtb4xNShlxhgCP
	Pb9VBpoc5CSMae71kKz4b0R19lbJ52sc8GLcHUCteGeoiV7IiZ2htrKIAcUI2CIupMw0
	7Mmg==
X-Gm-Message-State: APjAAAU4WzV/r96bqhI2PM+8zQeo3yvAfEQvxDuOd7FDDGBpfHiHfEXD
	bQVSXf2O6XSWwcdR45qoiOaWogqE32USG4mevTsBfw==
X-Google-Smtp-Source: APXvYqxifS13lXVVO+85NMgL0tqt8L9ioW27WYUjWGCdu45H/ohu/K8EiA49cC9IJ5IwuezZqsWJ7BxmiAuAT2/beyY=
X-Received: by 2002:a25:ef01:: with SMTP id g1mr8602880ybd.399.1556900620986; 
	Fri, 03 May 2019 09:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190503154424.73933-1-liboxuan@connect.hku.hk>
	<87bm0j4im0.fsf@zen.linaroharston>
In-Reply-To: <87bm0j4im0.fsf@zen.linaroharston>
From: "LI, BO XUAN" <liboxuan@connect.hku.hk>
Date: Sat, 4 May 2019 00:23:05 +0800
Message-ID: <CALM0=-=b+z2aW-cuM=hmk3_oKG7w3ianMo_ZA7gj8zMgCOfC3g@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Yuval Shaia <yuval.shaia@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007711670587fe2cba"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::c41
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
X-List-Received-Date: Fri, 03 May 2019 16:23:48 -0000

--0000000000007711670587fe2cba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Sorry about that, I am still trying to get familiar with the patch
submission process. Since my patch has been changed from your last review,
I thought it would be safe to not include the r-b tag from last time. Will
take care next time!

Best regards,
Boxuan Li

On Sat, May 4, 2019 at 12:18 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> Boxuan Li <liboxuan@connect.hku.hk> writes:
>
> > Use traces for debug message and qemu_log_mask for errors.
> >
> > Signed-off-by: Boxuan Li <liboxuan@connect.hku.hk>
>
> You didn't add my r-b tags from last time. Anyway:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> > ---
> > v1:
> https://patchew.org/QEMU/20190428110258.86681-1-liboxuan@connect.hku.hk/
> > v2:
> https://patchew.org/QEMU/20190501081039.58938-1-liboxuan@connect.hku.hk/
> > v3:
> https://patchew.org/QEMU/20190503084654.18413-1-liboxuan@connect.hku.hk/
> > v4: Fix indentation and do not convert uint64_t to int
> > ---
> >  hw/virtio/trace-events  |  7 +++++++
> >  hw/virtio/virtio-mmio.c | 44
> +++++++++++++++++++++-----------------------
> >  2 files changed, 28 insertions(+), 23 deletions(-)
> >
> > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > index 60c649c4bc..e28ba48da6 100644
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
> > +virtio_mmio_read(uint64_t offset) "virtio_mmio_read offset 0x%" PRIx64
> > +virtio_mmio_write_offset(uint64_t offset, uint64_t value)
> "virtio_mmio_write offset 0x%" PRIx64 " value 0x%" PRIx64
> > +virtio_mmio_guest_page(uint64_t size, int shift) "guest page size 0x%"
> PRIx64 " shift %d"
> > +virtio_mmio_queue_write(uint64_t value, int max_size) "mmio_queue writ=
e
> 0x%" PRIx64 " max %d"
> > +virtio_mmio_setting_irq(int level) "virtio_mmio setting IRQ %d"
> > diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> > index 5807aa87fe..96c762f0bf 100644
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
> > +    trace_virtio_mmio_read(offset);
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
> > +                      "%s: wrong size access to register!\n",
> > +                      __func__);
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
> > +                      "%s: read of write-only register\n",
> > +                      __func__);
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
> > +    trace_virtio_mmio_write_offset(offset, value);
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
> > +                      "%s: wrong size access to register!\n",
> > +                      __func__);
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
> > +        trace_virtio_mmio_queue_write(value, VIRTQUEUE_MAX_SIZE);
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
> > +                      "%s: write to readonly register\n",
> > +                      __func__);
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
>
>
> --
> Alex Benn=C3=A9e
>

--0000000000007711670587fe2cba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alex,<div><br></div><div>Sorry about that, I am still t=
rying to get familiar with the patch submission process. Since my patch has=
 been changed from your last review, I thought it would be safe to not incl=
ude the r-b tag from last time. Will take care next time!<br></div><div><br=
></div><div>Best regards,</div><div>Boxuan Li</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 4, 2019 at 1=
2:18 AM Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex=
.bennee@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><br>
Boxuan Li &lt;<a href=3D"mailto:liboxuan@connect.hku.hk" target=3D"_blank">=
liboxuan@connect.hku.hk</a>&gt; writes:<br>
<br>
&gt; Use traces for debug message and qemu_log_mask for errors.<br>
&gt;<br>
&gt; Signed-off-by: Boxuan Li &lt;<a href=3D"mailto:liboxuan@connect.hku.hk=
" target=3D"_blank">liboxuan@connect.hku.hk</a>&gt;<br>
<br>
You didn&#39;t add my r-b tags from last time. Anyway:<br>
<br>
Reviewed-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org"=
 target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
<br>
&gt; ---<br>
&gt; v1: <a href=3D"https://patchew.org/QEMU/20190428110258.86681-1-liboxua=
n@connect.hku.hk/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org=
/QEMU/20190428110258.86681-1-liboxuan@connect.hku.hk/</a><br>
&gt; v2: <a href=3D"https://patchew.org/QEMU/20190501081039.58938-1-liboxua=
n@connect.hku.hk/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org=
/QEMU/20190501081039.58938-1-liboxuan@connect.hku.hk/</a><br>
&gt; v3: <a href=3D"https://patchew.org/QEMU/20190503084654.18413-1-liboxua=
n@connect.hku.hk/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org=
/QEMU/20190503084654.18413-1-liboxuan@connect.hku.hk/</a><br>
&gt; v4: Fix indentation and do not convert uint64_t to int<br>
&gt; ---<br>
&gt;=C2=A0 hw/virtio/trace-events=C2=A0 |=C2=A0 7 +++++++<br>
&gt;=C2=A0 hw/virtio/virtio-mmio.c | 44 +++++++++++++++++++++--------------=
---------<br>
&gt;=C2=A0 2 files changed, 28 insertions(+), 23 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events<br>
&gt; index 60c649c4bc..e28ba48da6 100644<br>
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
&gt; +virtio_mmio_read(uint64_t offset) &quot;virtio_mmio_read offset 0x%&q=
uot; PRIx64<br>
&gt; +virtio_mmio_write_offset(uint64_t offset, uint64_t value) &quot;virti=
o_mmio_write offset 0x%&quot; PRIx64 &quot; value 0x%&quot; PRIx64<br>
&gt; +virtio_mmio_guest_page(uint64_t size, int shift) &quot;guest page siz=
e 0x%&quot; PRIx64 &quot; shift %d&quot;<br>
&gt; +virtio_mmio_queue_write(uint64_t value, int max_size) &quot;mmio_queu=
e write 0x%&quot; PRIx64 &quot; max %d&quot;<br>
&gt; +virtio_mmio_setting_irq(int level) &quot;virtio_mmio setting IRQ %d&q=
uot;<br>
&gt; diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c<br>
&gt; index 5807aa87fe..96c762f0bf 100644<br>
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
&gt;<br>
&gt;=C2=A0 /* QOM macros */<br>
&gt;=C2=A0 /* virtio-mmio-bus */<br>
&gt; @@ -107,7 +99,7 @@ static uint64_t virtio_mmio_read(void *opaque, hwad=
dr offset, unsigned size)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 VirtIOMMIOProxy *proxy =3D (VirtIOMMIOProxy *)opaq=
ue;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 VirtIODevice *vdev =3D virtio_bus_get_device(&amp;=
proxy-&gt;bus);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 DPRINTF(&quot;virtio_mmio_read offset 0x%x\n&quot;, (in=
t)offset);<br>
&gt; +=C2=A0 =C2=A0 trace_virtio_mmio_read(offset);<br>
&gt;<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;%s: wrong size access to register!\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 __func__);<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;%s: read of write-only register\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 __func__);<br>
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
&gt;<br>
&gt; -=C2=A0 =C2=A0 DPRINTF(&quot;virtio_mmio_write offset 0x%x value 0x%&q=
uot; PRIx64 &quot;\n&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (int)offset, value);<br>
&gt; +=C2=A0 =C2=A0 trace_virtio_mmio_write_offset(offset, value);<br>
&gt;<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;%s: wrong size access to register!\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 __func__);<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_virtio_mmio_queue_write(value, VIRT=
QUEUE_MAX_SIZE);<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;%s: write to readonly register\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 __func__);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 DPRINTF(&quot;bad register offset\n&quot;=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: =
bad register offset\n&quot;, __func__);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;<br>
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
<br>
<br>
--<br>
Alex Benn=C3=A9e<br>
</blockquote></div>

--0000000000007711670587fe2cba--

