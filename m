Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hLoa1-0002GR-HO
	for mharc-qemu-trivial@gnu.org; Wed, 01 May 2019 08:43:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liboxuan@connect.hku.hk>) id 1hLoZx-0002Dv-85
	for qemu-trivial@nongnu.org; Wed, 01 May 2019 08:43:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liboxuan@connect.hku.hk>) id 1hLoZs-0003lg-RT
	for qemu-trivial@nongnu.org; Wed, 01 May 2019 08:43:16 -0400
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:44180)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liboxuan@connect.hku.hk>)
	id 1hLoZs-0003kt-B6
	for qemu-trivial@nongnu.org; Wed, 01 May 2019 08:43:12 -0400
Received: by mail-yw1-xc43.google.com with SMTP id j4so8191400ywk.11
	for <qemu-trivial@nongnu.org>; Wed, 01 May 2019 05:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=connect-hku-hk.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=U9+Qe/rpAXmEHYKhZzN17g8LBLYABwUoh1AWgyH/LBk=;
	b=AdQVj6iIojTY6MdwWCo65a+kSbaWXoiDQ4KS72EhMAqiLH/5WOtpRvA8d0gEHALdo6
	9ZR0O5bt/UI9gaqTSwsOG/jgR6r/1eeF2DLK4B9n6/6rovrV46II7a1+BnkSsNJohJ3+
	x/VpOp0Eil0nLLR7Ty3Wkbppsn3za4x0gsB2t85k0TK3APGPR+SaqgroFqQQ+N388pUg
	yE7y+QzCsfm5JfZxV279nAlty+PmmLZT9HWiN/0wmCe4kCP/Q0XwGxc316Mfl+jI7nZl
	/jWZYJ442X82vzBYV7AXscr/JkVpuodjjlg7CG+2yyXSlaIOLWPJBxEq5HKpLCazv7Od
	IDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=U9+Qe/rpAXmEHYKhZzN17g8LBLYABwUoh1AWgyH/LBk=;
	b=N8kPAPherIOQrsGKxPZvZWiFFL8jwYZCt1kSPILf8zeddNey/GxagmA7ZW5KJ0WYoS
	y8SkfXQ0BS6Tb2Knqi39MPHo0+jpb9BQ3i6JsgVmXSZXYvfcE+/lE8zqYPUHZxYEDwTA
	H2wn2F2AQJY8FOsAUM7UzDhn+O9ZvfyyKqfKbmv5nsD6t3Q73uyih0PgKrTo0tLlwFzN
	v+aBSQOvlf43LWjKSp8Ze474UcAcBwOgHiNJGQBuQ2Ban9L75UwlJpsiDvx7oEsj1212
	SFxDw9VW77GPcnkKqKuHBFVHk/vaN74BvbwOIOrWrQsz3PKthj7eI+plUUVR9pyzQ306
	pWpA==
X-Gm-Message-State: APjAAAXG9tIZLU4NlMitNuQz1s9kPPudZNjdmwTGvFhMgtPy8Q3mycc7
	VZevyt3xh9g9+rHEnEhZiI14R04LehNA2iJfsbX/Zw==
X-Google-Smtp-Source: APXvYqzUCE2RQ9hs33WJ5BLpZPW/x0ae7x0fKmQFZKZ4QTK4TJj7IYPcVhpZkkYDi7GwrvtCsvIHNqhEuImooNKzU3M=
X-Received: by 2002:a25:41c1:: with SMTP id
	o184mr61493027yba.183.1556714590878; 
	Wed, 01 May 2019 05:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190501081039.58938-1-liboxuan@connect.hku.hk>
	<20190501085805.GA8174@lap1>
In-Reply-To: <20190501085805.GA8174@lap1>
From: "LI, BO XUAN" <liboxuan@connect.hku.hk>
Date: Wed, 1 May 2019 20:42:35 +0800
Message-ID: <CALM0=-=cbHTajGz8R4Who9eKh=sfa19H_nMuH4PFO8vVq2=drQ@mail.gmail.com>
To: Yuval Shaia <yuval.shaia@oracle.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000034d5370587d2dc08"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::c43
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] hw/virtio/virtio-mmio:
 Convert DPRINTF to traces
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
X-List-Received-Date: Wed, 01 May 2019 12:43:20 -0000

--00000000000034d5370587d2dc08
Content-Type: text/plain; charset="UTF-8"

On Wed, May 1, 2019 at 4:58 PM Yuval Shaia <yuval.shaia@oracle.com> wrote:

> On Wed, May 01, 2019 at 04:10:39PM +0800, Boxuan Li wrote:
> > Signed-off-by: Boxuan Li <liboxuan@connect.hku.hk>
> > ---
> > v2: Instead of using conditional debugs, convert DPRINTF to traces
> > ---
> >  hw/virtio/trace-events  | 13 +++++++++++++
> >  hw/virtio/virtio-mmio.c | 35 ++++++++++++-----------------------
> >  2 files changed, 25 insertions(+), 23 deletions(-)
> >
> > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > index 60c649c4bc..37c781b487 100644
> > --- a/hw/virtio/trace-events
> > +++ b/hw/virtio/trace-events
> > @@ -46,3 +46,16 @@ virtio_balloon_handle_output(const char *name,
> uint64_t gpa) "section name: %s g
> >  virtio_balloon_get_config(uint32_t num_pages, uint32_t actual)
> "num_pages: %d actual: %d"
> >  virtio_balloon_set_config(uint32_t actual, uint32_t oldactual) "actual:
> %d oldactual: %d"
> >  virtio_balloon_to_target(uint64_t target, uint32_t num_pages) "balloon
> target: 0x%"PRIx64" num_pages: %d"
> > +
> > +# virtio-mmio.c
> > +virtio_mmio_read(int offset) "virtio_mmio_read offset 0x%x"
> > +virtio_mmio_wrong_size_read(void) "wrong size access to register!"
> > +virtio_mmio_read_interrupt(void) "read of write-only register"
> > +virtio_mmio_bad_read_offset(void) "bad register offset"
> > +virtio_mmio_write_offset(int offset, uint64_t value) "virtio_mmio_write
> offset 0x%x value 0x%" PRIx64
> > +virtio_mmio_wrong_size_write(void) "wrong size access to register!"
> > +virtio_mmio_guest_page(uint64_t size, int shift) "guest page size 0x%"
> PRIx64 " shift %d"
> > +virtio_mmio_queue_write(int value, int max_size) "mmio_queue write %d
> max %d"
> > +virtio_mmio_write_interrupt(void) "write to readonly register"
> > +virtio_mmio_bad_write_offset(void) "bad register offset"
> > +virtio_mmio_setting_irq(int level) "virtio_mmio setting IRQ %d"
> > diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> > index 5807aa87fe..4251df399d 100644
> > --- a/hw/virtio/virtio-mmio.c
> > +++ b/hw/virtio/virtio-mmio.c
> > @@ -27,16 +27,7 @@
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
> > +#include "trace.h"
> >
> >  /* QOM macros */
> >  /* virtio-mmio-bus */
> > @@ -107,7 +98,7 @@ static uint64_t virtio_mmio_read(void *opaque, hwaddr
> offset, unsigned size)
> >      VirtIOMMIOProxy *proxy = (VirtIOMMIOProxy *)opaque;
> >      VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> >
> > -    DPRINTF("virtio_mmio_read offset 0x%x\n", (int)offset);
> > +    trace_virtio_mmio_read((int)offset);
> >
> >      if (!vdev) {
> >          /* If no backend is present, we treat most registers as
> > @@ -144,7 +135,7 @@ static uint64_t virtio_mmio_read(void *opaque,
> hwaddr offset, unsigned size)
> >          }
> >      }
> >      if (size != 4) {
> > -        DPRINTF("wrong size access to register!\n");
> > +        trace_virtio_mmio_wrong_size_read();
>
> Have you considered using qemu_error_report to report such errors?
>
>
Thanks for the suggestion. I am a newcomer here so my question might be a
bit dumb: I thought they are warnings instead of errors since return values
are 0. Do you suggest using error_report function and changing return
values from 0 to -1?

Best regards,
Boxuan Li


> >          return 0;
> >      }
> >      switch (offset) {
> > @@ -182,10 +173,10 @@ static uint64_t virtio_mmio_read(void *opaque,
> hwaddr offset, unsigned size)
> >      case VIRTIO_MMIO_QUEUE_ALIGN:
> >      case VIRTIO_MMIO_QUEUE_NOTIFY:
> >      case VIRTIO_MMIO_INTERRUPT_ACK:
> > -        DPRINTF("read of write-only register\n");
> > +        trace_virtio_mmio_read_interrupt();
> >          return 0;
> >      default:
> > -        DPRINTF("bad register offset\n");
> > +        trace_virtio_mmio_bad_read_offset();
>
> Ditto to all other errors.
>
> >          return 0;
> >      }
> >      return 0;
> > @@ -197,8 +188,7 @@ static void virtio_mmio_write(void *opaque, hwaddr
> offset, uint64_t value,
> >      VirtIOMMIOProxy *proxy = (VirtIOMMIOProxy *)opaque;
> >      VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> >
> > -    DPRINTF("virtio_mmio_write offset 0x%x value 0x%" PRIx64 "\n",
> > -            (int)offset, value);
> > +    trace_virtio_mmio_write_offset((int)offset, value);
> >
> >      if (!vdev) {
> >          /* If no backend is present, we just make all registers
> > @@ -226,7 +216,7 @@ static void virtio_mmio_write(void *opaque, hwaddr
> offset, uint64_t value,
> >          return;
> >      }
> >      if (size != 4) {
> > -        DPRINTF("wrong size access to register!\n");
> > +        trace_virtio_mmio_wrong_size_write();
> >          return;
> >      }
> >      switch (offset) {
> > @@ -246,8 +236,7 @@ static void virtio_mmio_write(void *opaque, hwaddr
> offset, uint64_t value,
> >          if (proxy->guest_page_shift > 31) {
> >              proxy->guest_page_shift = 0;
> >          }
> > -        DPRINTF("guest page size %" PRIx64 " shift %d\n", value,
> > -                proxy->guest_page_shift);
> > +        trace_virtio_mmio_guest_page(value, proxy->guest_page_shift);
> >          break;
> >      case VIRTIO_MMIO_QUEUE_SEL:
> >          if (value < VIRTIO_QUEUE_MAX) {
> > @@ -255,7 +244,7 @@ static void virtio_mmio_write(void *opaque, hwaddr
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
> > @@ -303,11 +292,11 @@ static void virtio_mmio_write(void *opaque, hwaddr
> offset, uint64_t value,
> >      case VIRTIO_MMIO_DEVICE_FEATURES:
> >      case VIRTIO_MMIO_QUEUE_NUM_MAX:
> >      case VIRTIO_MMIO_INTERRUPT_STATUS:
> > -        DPRINTF("write to readonly register\n");
> > +        trace_virtio_mmio_write_interrupt();
> >          break;
> >
> >      default:
> > -        DPRINTF("bad register offset\n");
> > +        trace_virtio_mmio_bad_write_offset();
> >      }
> >  }
> >
> > @@ -327,7 +316,7 @@ static void virtio_mmio_update_irq(DeviceState
> *opaque, uint16_t vector)
> >          return;
> >      }
> >      level = (atomic_read(&vdev->isr) != 0);
> > -    DPRINTF("virtio_mmio setting IRQ %d\n", level);
> > +    trace_virtio_mmio_setting_irq(level);
> >      qemu_set_irq(proxy->irq, level);
> >  }
>
> I went through all code changes and found no mistakes but suggesting to
> turn errors to errors and not just threat them as traces.
>
> If you already considered it then fine.
>
> >
> > --
> > 2.13.2
> >
> >
>

--00000000000034d5370587d2dc08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 1, 2019 at 4:58 PM Yuval =
Shaia &lt;<a href=3D"mailto:yuval.shaia@oracle.com">yuval.shaia@oracle.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Wed, May 01, 2019 at 04:10:39PM +0800, Boxuan Li wrote:<br>
&gt; Signed-off-by: Boxuan Li &lt;<a href=3D"mailto:liboxuan@connect.hku.hk=
" target=3D"_blank">liboxuan@connect.hku.hk</a>&gt;<br>
&gt; ---<br>
&gt; v2: Instead of using conditional debugs, convert DPRINTF to traces<br>
&gt; ---<br>
&gt;=C2=A0 hw/virtio/trace-events=C2=A0 | 13 +++++++++++++<br>
&gt;=C2=A0 hw/virtio/virtio-mmio.c | 35 ++++++++++++-----------------------=
<br>
&gt;=C2=A0 2 files changed, 25 insertions(+), 23 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events<br>
&gt; index 60c649c4bc..37c781b487 100644<br>
&gt; --- a/hw/virtio/trace-events<br>
&gt; +++ b/hw/virtio/trace-events<br>
&gt; @@ -46,3 +46,16 @@ virtio_balloon_handle_output(const char *name, uint=
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
&gt; +virtio_mmio_wrong_size_read(void) &quot;wrong size access to register=
!&quot;<br>
&gt; +virtio_mmio_read_interrupt(void) &quot;read of write-only register&qu=
ot;<br>
&gt; +virtio_mmio_bad_read_offset(void) &quot;bad register offset&quot;<br>
&gt; +virtio_mmio_write_offset(int offset, uint64_t value) &quot;virtio_mmi=
o_write offset 0x%x value 0x%&quot; PRIx64<br>
&gt; +virtio_mmio_wrong_size_write(void) &quot;wrong size access to registe=
r!&quot;<br>
&gt; +virtio_mmio_guest_page(uint64_t size, int shift) &quot;guest page siz=
e 0x%&quot; PRIx64 &quot; shift %d&quot;<br>
&gt; +virtio_mmio_queue_write(int value, int max_size) &quot;mmio_queue wri=
te %d max %d&quot;<br>
&gt; +virtio_mmio_write_interrupt(void) &quot;write to readonly register&qu=
ot;<br>
&gt; +virtio_mmio_bad_write_offset(void) &quot;bad register offset&quot;<br=
>
&gt; +virtio_mmio_setting_irq(int level) &quot;virtio_mmio setting IRQ %d&q=
uot;<br>
&gt; diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c<br>
&gt; index 5807aa87fe..4251df399d 100644<br>
&gt; --- a/hw/virtio/virtio-mmio.c<br>
&gt; +++ b/hw/virtio/virtio-mmio.c<br>
&gt; @@ -27,16 +27,7 @@<br>
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
&gt; +#include &quot;trace.h&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /* QOM macros */<br>
&gt;=C2=A0 /* virtio-mmio-bus */<br>
&gt; @@ -107,7 +98,7 @@ static uint64_t virtio_mmio_read(void *opaque, hwad=
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
&gt; @@ -144,7 +135,7 @@ static uint64_t virtio_mmio_read(void *opaque, hwa=
ddr offset, unsigned size)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (size !=3D 4) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 DPRINTF(&quot;wrong size access to regist=
er!\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_virtio_mmio_wrong_size_read();<br>
<br>
Have you considered using qemu_error_report to report such errors?<br>
<br></blockquote><div><br></div><div>Thanks for the suggestion. I am a newc=
omer here so my question might be a bit dumb: I thought they are warnings i=
nstead of errors since return values are 0. Do you suggest using error_repo=
rt function and changing return values from 0 to -1?</div><div><br></div><d=
iv>Best regards,</div><div>Boxuan Li</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 switch (offset) {<br>
&gt; @@ -182,10 +173,10 @@ static uint64_t virtio_mmio_read(void *opaque, h=
waddr offset, unsigned size)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case VIRTIO_MMIO_QUEUE_ALIGN:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case VIRTIO_MMIO_QUEUE_NOTIFY:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case VIRTIO_MMIO_INTERRUPT_ACK:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 DPRINTF(&quot;read of write-only register=
\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_virtio_mmio_read_interrupt();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 DPRINTF(&quot;bad register offset\n&quot;=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_virtio_mmio_bad_read_offset();<br>
<br>
Ditto to all other errors.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; @@ -197,8 +188,7 @@ static void virtio_mmio_write(void *opaque, hwaddr=
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
&gt; @@ -226,7 +216,7 @@ static void virtio_mmio_write(void *opaque, hwaddr=
 offset, uint64_t value,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (size !=3D 4) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 DPRINTF(&quot;wrong size access to regist=
er!\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_virtio_mmio_wrong_size_write();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 switch (offset) {<br>
&gt; @@ -246,8 +236,7 @@ static void virtio_mmio_write(void *opaque, hwaddr=
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
&gt; @@ -255,7 +244,7 @@ static void virtio_mmio_write(void *opaque, hwaddr=
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
&gt; @@ -303,11 +292,11 @@ static void virtio_mmio_write(void *opaque, hwad=
dr offset, uint64_t value,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case VIRTIO_MMIO_DEVICE_FEATURES:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case VIRTIO_MMIO_QUEUE_NUM_MAX:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case VIRTIO_MMIO_INTERRUPT_STATUS:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 DPRINTF(&quot;write to readonly register\=
n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_virtio_mmio_write_interrupt();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 DPRINTF(&quot;bad register offset\n&quot;=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_virtio_mmio_bad_write_offset();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -327,7 +316,7 @@ static void virtio_mmio_update_irq(DeviceState *op=
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
I went through all code changes and found no mistakes but suggesting to<br>
turn errors to errors and not just threat them as traces.<br>
<br>
If you already considered it then fine.<br>
<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.13.2<br>
&gt; <br>
&gt; <br>
</blockquote></div></div>

--00000000000034d5370587d2dc08--

