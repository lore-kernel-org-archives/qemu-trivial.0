Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMR2c-00036O-Gf
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2019 01:47:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liboxuan@connect.hku.hk>) id 1hMR2Z-00036B-JA
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 01:47:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liboxuan@connect.hku.hk>) id 1hMR2X-0006r7-Gk
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 01:47:23 -0400
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:35507)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liboxuan@connect.hku.hk>)
	id 1hMR2V-0006lt-Hz
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 01:47:20 -0400
Received: by mail-yw1-xc43.google.com with SMTP id n188so3464624ywe.2
	for <qemu-trivial@nongnu.org>; Thu, 02 May 2019 22:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=connect-hku-hk.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wjqEbOpVDMVf/hBm3tJWrKczkF6hYNVMuVVVKeaawAc=;
	b=UK5fFz+uvTt+2YFNyRG+RC9WLt1GBFdnkTo/GQ5WeGlyYx1/uNer+v51cgCTKpw3Bm
	6/78d3jazOYxyIDe/JE/Q4NZuYZS0OChY7jaFqYuRZomOA6ck+BIjgyyKapJhxTDafjA
	/fG2KkGZDj1M6Q4rrgvG/6EJiEvVJx1dRwG+zJLaRScgtMvTWNuc11I12nB1mr/+2bPK
	cMbPFXG4dC9f5NwGQXK1/lpLzlTNoyyEI9zbGkFUDtHJoqAIHBVQJ1CMK0HT0btvz6si
	QEqGKb3OW70I/v8VO0DQS94bMMr4BHrcZfWLOwF/nD5hZxHwnMFFzanf0SOcwMAuffDb
	6HBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wjqEbOpVDMVf/hBm3tJWrKczkF6hYNVMuVVVKeaawAc=;
	b=GSdZIR/s9AejTh9oQ95xO4T9tWqXcJk2413njs+6gWp4U/BTZeN3DFTFzUof2dOsL7
	Fj90L0XIoacOZTyMVn3rW8II+Xk065dOor8dcfSUg8iYeiSZZ4SHRkmuilUMJoME6+pP
	fcFKSu3oKXAO491d/gYGSidDhvu/PdFSZO0I6xXewqT5zBpEv9CCvrjo86Xn5O2mHNjj
	63DRvAtbBeWsG3EVhAhzeCcXkHYonweP97lpYG+m4jr0qODYnlB0OMDwyrgnDZHvyFx0
	rUSlJyQBry46YHgNIkL3P1VF8PzA/YxR2mn9r3M2IAFH1YhuqvvFRKa3S2RiMMAV1nv7
	Cf6A==
X-Gm-Message-State: APjAAAVRPKKlQhRKr79TAQiVGB9RnoDhMxiYVyy18vcZ98M6Fjz5QVMR
	3PN1zrv42Yip3oh4+UbULJCLJwOGnG1xLN7r3XhBsg==
X-Google-Smtp-Source: APXvYqynANkc1fOh28LQinwnY7flB8xJflKmYFzJyrIXgabZJYcX1hXEdhcMQciJDYxQVUKG1/PPTbt8MReT0BiykIg=
X-Received: by 2002:a25:850e:: with SMTP id w14mr6459865ybk.13.1556862436266; 
	Thu, 02 May 2019 22:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190501081039.58938-1-liboxuan@connect.hku.hk>
	<20190501085805.GA8174@lap1>
	<CALM0=-=cbHTajGz8R4Who9eKh=sfa19H_nMuH4PFO8vVq2=drQ@mail.gmail.com>
	<20190501135807.GA11932@lap1> <87y33q5hmw.fsf@zen.linaroharston>
In-Reply-To: <87y33q5hmw.fsf@zen.linaroharston>
From: "LI, BO XUAN" <liboxuan@connect.hku.hk>
Date: Fri, 3 May 2019 13:46:40 +0800
Message-ID: <CALM0=-m9y31XHuqzi=36AuxQmM7YBCXc_AW2fc=xAF-LV5Tofg@mail.gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-trivial@nongnu.org,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Yuval Shaia <yuval.shaia@oracle.com>
Content-Type: multipart/alternative; boundary="0000000000007a783c0587f54894"
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
X-List-Received-Date: Fri, 03 May 2019 05:47:25 -0000

--0000000000007a783c0587f54894
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yuval and Alex,

Thanks for the suggestions. I'll update and send a patch v3 soon.

Best regards,
Boxuan Li

On Wed, May 1, 2019 at 11:17 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> Yuval Shaia <yuval.shaia@oracle.com> writes:
>
> > On Wed, May 01, 2019 at 08:42:35PM +0800, LI, BO XUAN wrote:
> >>    On Wed, May 1, 2019 at 4:58 PM Yuval Shaia <[1]
> yuval.shaia@oracle.com>
> >>    wrote:
> >>
> >>      On Wed, May 01, 2019 at 04:10:39PM +0800, Boxuan Li wrote:
> >>      > Signed-off-by: Boxuan Li <[2]liboxuan@connect.hku.hk>
> >>      > ---
> >>      > v2: Instead of using conditional debugs, convert DPRINTF to
> traces
> >>      > ---
> >>      >  hw/virtio/trace-events  | 13 +++++++++++++
> >>      >  hw/virtio/virtio-mmio.c | 35 ++++++++++++---------------------=
--
> >>      >  2 files changed, 25 insertions(+), 23 deletions(-)
> >>      >
> >>      > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> >>      > index 60c649c4bc..37c781b487 100644
> >>      > --- a/hw/virtio/trace-events
> >>      > +++ b/hw/virtio/trace-events
> >>      > @@ -46,3 +46,16 @@ virtio_balloon_handle_output(const char *nam=
e,
> >>      uint64_t gpa) "section name: %s g
> >>      >  virtio_balloon_get_config(uint32_t num_pages, uint32_t actual)
> >>      "num_pages: %d actual: %d"
> >>      >  virtio_balloon_set_config(uint32_t actual, uint32_t oldactual)
> >>      "actual: %d oldactual: %d"
> >>      >  virtio_balloon_to_target(uint64_t target, uint32_t num_pages)
> >>      "balloon target: 0x%"PRIx64" num_pages: %d"
> >>      > +
> >>      > +# virtio-mmio.c
> >>      > +virtio_mmio_read(int offset) "virtio_mmio_read offset 0x%x"
> >>      > +virtio_mmio_wrong_size_read(void) "wrong size access to
> >>      register!"
> >>      > +virtio_mmio_read_interrupt(void) "read of write-only register"
> >>      > +virtio_mmio_bad_read_offset(void) "bad register offset"
> >>      > +virtio_mmio_write_offset(int offset, uint64_t value)
> >>      "virtio_mmio_write offset 0x%x value 0x%" PRIx64
> >>      > +virtio_mmio_wrong_size_write(void) "wrong size access to
> >>      register!"
> >>      > +virtio_mmio_guest_page(uint64_t size, int shift) "guest page
> size
> >>      0x%" PRIx64 " shift %d"
> >>      > +virtio_mmio_queue_write(int value, int max_size) "mmio_queue
> >>      write %d max %d"
> >>      > +virtio_mmio_write_interrupt(void) "write to readonly register"
> >>      > +virtio_mmio_bad_write_offset(void) "bad register offset"
> >>      > +virtio_mmio_setting_irq(int level) "virtio_mmio setting IRQ %d=
"
> >>      > diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> >>      > index 5807aa87fe..4251df399d 100644
> >>      > --- a/hw/virtio/virtio-mmio.c
> >>      > +++ b/hw/virtio/virtio-mmio.c
> >>      > @@ -27,16 +27,7 @@
> >>      >  #include "sysemu/kvm.h"
> >>      >  #include "hw/virtio/virtio-bus.h"
> >>      >  #include "qemu/error-report.h"
> >>      > -
> >>      > -/* #define DEBUG_VIRTIO_MMIO */
> >>      > -
> >>      > -#ifdef DEBUG_VIRTIO_MMIO
> >>      > -
> >>      > -#define DPRINTF(fmt, ...) \
> >>      > -do { printf("virtio_mmio: " fmt , ## __VA_ARGS__); } while (0)
> >>      > -#else
> >>      > -#define DPRINTF(fmt, ...) do {} while (0)
> >>      > -#endif
> >>      > +#include "trace.h"
> >>      >
> >>      >  /* QOM macros */
> >>      >  /* virtio-mmio-bus */
> >>      > @@ -107,7 +98,7 @@ static uint64_t virtio_mmio_read(void *opaqu=
e,
> >>      hwaddr offset, unsigned size)
> >>      >      VirtIOMMIOProxy *proxy =3D (VirtIOMMIOProxy *)opaque;
> >>      >      VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> >>      >
> >>      > -    DPRINTF("virtio_mmio_read offset 0x%x\n", (int)offset);
> >>      > +    trace_virtio_mmio_read((int)offset);
> >>      >
> >>      >      if (!vdev) {
> >>      >          /* If no backend is present, we treat most registers a=
s
> >>      > @@ -144,7 +135,7 @@ static uint64_t virtio_mmio_read(void
> *opaque,
> >>      hwaddr offset, unsigned size)
> >>      >          }
> >>      >      }
> >>      >      if (size !=3D 4) {
> >>      > -        DPRINTF("wrong size access to register!\n");
> >>      > +        trace_virtio_mmio_wrong_size_read();
> >>      Have you considered using qemu_error_report to report such errors=
?
> >>
> >>    Thanks for the suggestion. I am a newcomer here so my question migh=
t
> be
> >>    a bit dumb: I thought they are warnings instead of errors since
> return
> >>    values are 0. Do you suggest using error_report function and changi=
ng
> >>    return values from 0 to -1?
> >>    Best regards,
> >>    Boxuan Li
> >
> > I think that when driver store invalid data in device register it is an
> > error but the best is to check what other devices do.
>
> We could have:
>
>         qemu_log_mask(LOG_GUEST_ERROR, "%s: wrong size access to
> register!\n". __func__);
>
> --
> Alex Benn=C3=A9e
>

--0000000000007a783c0587f54894
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Yuval and Alex,<div><br></div><div>Thanks for the sugge=
stions. I&#39;ll update and send a patch v3 soon.</div><div><br></div><div>=
Best regards,</div><div>Boxuan Li</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 1, 2019 at 11:17 PM Alex=
 Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><br>
Yuval Shaia &lt;<a href=3D"mailto:yuval.shaia@oracle.com" target=3D"_blank"=
>yuval.shaia@oracle.com</a>&gt; writes:<br>
<br>
&gt; On Wed, May 01, 2019 at 08:42:35PM +0800, LI, BO XUAN wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 On Wed, May 1, 2019 at 4:58 PM Yuval Shaia &lt;[1]<a =
href=3D"mailto:yuval.shaia@oracle.com" target=3D"_blank">yuval.shaia@oracle=
.com</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 wrote:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 On Wed, May 01, 2019 at 04:10:39PM +0800, Boxu=
an Li wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Boxuan Li &lt;[2]<a href=
=3D"mailto:liboxuan@connect.hku.hk" target=3D"_blank">liboxuan@connect.hku.=
hk</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; v2: Instead of using conditional debugs, =
convert DPRINTF to traces<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 hw/virtio/trace-events=C2=A0 | 13 +=
++++++++++++<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 hw/virtio/virtio-mmio.c | 35 ++++++=
++++++-----------------------<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 2 files changed, 25 insertions(+), =
23 deletions(-)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/hw/virtio/trace-events b/hw/=
virtio/trace-events<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 60c649c4bc..37c781b487 100644<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/hw/virtio/trace-events<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/hw/virtio/trace-events<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -46,3 +46,16 @@ virtio_balloon_handle_=
output(const char *name,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t gpa) &quot;section name: %s g<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 virtio_balloon_get_config(uint32_t =
num_pages, uint32_t actual)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;num_pages: %d actual: %d&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 virtio_balloon_set_config(uint32_t =
actual, uint32_t oldactual)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;actual: %d oldactual: %d&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 virtio_balloon_to_target(uint64_t t=
arget, uint32_t num_pages)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;balloon target: 0x%&quot;PRIx64&quot; nu=
m_pages: %d&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +# virtio-mmio.c<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +virtio_mmio_read(int offset) &quot;virti=
o_mmio_read offset 0x%x&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +virtio_mmio_wrong_size_read(void) &quot;=
wrong size access to<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 register!&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +virtio_mmio_read_interrupt(void) &quot;r=
ead of write-only register&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +virtio_mmio_bad_read_offset(void) &quot;=
bad register offset&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +virtio_mmio_write_offset(int offset, uin=
t64_t value)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;virtio_mmio_write offset 0x%x value 0x%&=
quot; PRIx64<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +virtio_mmio_wrong_size_write(void) &quot=
;wrong size access to<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 register!&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +virtio_mmio_guest_page(uint64_t size, in=
t shift) &quot;guest page size<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 0x%&quot; PRIx64 &quot; shift %d&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +virtio_mmio_queue_write(int value, int m=
ax_size) &quot;mmio_queue<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 write %d max %d&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +virtio_mmio_write_interrupt(void) &quot;=
write to readonly register&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +virtio_mmio_bad_write_offset(void) &quot=
;bad register offset&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +virtio_mmio_setting_irq(int level) &quot=
;virtio_mmio setting IRQ %d&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/hw/virtio/virtio-mmio.c b/hw=
/virtio/virtio-mmio.c<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 5807aa87fe..4251df399d 100644<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/hw/virtio/virtio-mmio.c<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/hw/virtio/virtio-mmio.c<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -27,16 +27,7 @@<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 #include &quot;sysemu/kvm.h&quot;<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 #include &quot;hw/virtio/virtio-bus=
.h&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 #include &quot;qemu/error-report.h&=
quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -/* #define DEBUG_VIRTIO_MMIO */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -#ifdef DEBUG_VIRTIO_MMIO<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -#define DPRINTF(fmt, ...) \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -do { printf(&quot;virtio_mmio: &quot; fm=
t , ## __VA_ARGS__); } while (0)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -#else<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -#define DPRINTF(fmt, ...) do {} while (0=
)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -#endif<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#include &quot;trace.h&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 /* QOM macros */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 /* virtio-mmio-bus */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -107,7 +98,7 @@ static uint64_t virtio=
_mmio_read(void *opaque,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 hwaddr offset, unsigned size)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 VirtIOMMIOProxy *prox=
y =3D (VirtIOMMIOProxy *)opaque;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 VirtIODevice *vdev =
=3D virtio_bus_get_device(&amp;proxy-&gt;bus);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 DPRINTF(&quot;virtio_mmio_=
read offset 0x%x\n&quot;, (int)offset);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 trace_virtio_mmio_read((in=
t)offset);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 if (!vdev) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If n=
o backend is present, we treat most registers as<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -144,7 +135,7 @@ static uint64_t virti=
o_mmio_read(void *opaque,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 hwaddr offset, unsigned size)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 if (size !=3D 4) {<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 DPRINTF(&quo=
t;wrong size access to register!\n&quot;);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_virtio=
_mmio_wrong_size_read();<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Have you considered using qemu_error_report to=
 report such errors?<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 Thanks for the suggestion. I am a newcomer here so my=
 question might be<br>
&gt;&gt;=C2=A0 =C2=A0 a bit dumb: I thought they are warnings instead of er=
rors since return<br>
&gt;&gt;=C2=A0 =C2=A0 values are 0. Do you suggest using error_report funct=
ion and changing<br>
&gt;&gt;=C2=A0 =C2=A0 return values from 0 to -1?<br>
&gt;&gt;=C2=A0 =C2=A0 Best regards,<br>
&gt;&gt;=C2=A0 =C2=A0 Boxuan Li<br>
&gt;<br>
&gt; I think that when driver store invalid data in device register it is a=
n<br>
&gt; error but the best is to check what other devices do.<br>
<br>
We could have:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: wrong =
size access to register!\n&quot;. __func__);<br>
<br>
--<br>
Alex Benn=C3=A9e<br>
</blockquote></div>

--0000000000007a783c0587f54894--

