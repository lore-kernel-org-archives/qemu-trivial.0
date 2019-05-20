Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hSX6Q-0000Yu-Th
	for mharc-qemu-trivial@gnu.org; Sun, 19 May 2019 21:28:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1hSX6O-0000Y0-DZ
	for qemu-trivial@nongnu.org; Sun, 19 May 2019 21:28:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1hSX6M-0003I7-HB
	for qemu-trivial@nongnu.org; Sun, 19 May 2019 21:28:32 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:43013)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liq3ea@gmail.com>)
	id 1hSX6H-0003GE-Ok; Sun, 19 May 2019 21:28:26 -0400
Received: by mail-oi1-x242.google.com with SMTP id t187so8780433oie.10;
	Sun, 19 May 2019 18:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iwd3H7j1Rkw3fNfho1CBYGCEkGb8ak8eTd6zR2yanWM=;
	b=h1hcWFru1pTUyDOYnF5ELVqLUsQFgUaG3DAa66KhMCwfJRhrbD8h0R2l0cu3Fy+u4F
	rhzHm/QZI3KuNuxmZR/n2NBFzSE2Rh0GYUh8y5sLNfIqoB+Oh1RHva8/7X+vaw7SWPQR
	pbpuEqNuyMivoZdixiaMiZ4oooU2R01ZfS6Yo8+kn6aaIWyiYTZmovz3MSAt9nM7As2f
	tFT7xOhjhb4MhlYU3IPH9F1CKSwAg0EtGhZeZFO120uMB/ex+HSz9iiAQmS7zoB57L7p
	IIeqQa2hVIVLJHl2wbrkR9US5Xar9sOLBsAP2b36IDmrna7HisIVM6qlYe07EyGRP6Y2
	nGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iwd3H7j1Rkw3fNfho1CBYGCEkGb8ak8eTd6zR2yanWM=;
	b=oDpj1/d8rUCZdDnoR2sKcSz7S3iJkRonD8ScoOM5iGf+IrfM6VKzNeNwNHBKIttkmw
	ZU/5XvMc3oqYN7FQ7E9hxkjKjrPC4en15zaJXhnxNXPSVnJi14hdqTJd/LzqSP+8izi8
	8OXmWUN0NwyoYKpSorzR+7pdho0fUnz0744rtcjNa7edLAeY6/okMaqXelUefjbxbmcy
	uLJQy9aNgWTnwAIF5424yON4vbHbVFSK0xrQuISeUtFL4y2ctJb2ZIwvjn42cy91qfMn
	QVsBC++WNFrOhDwz4ew9eulJe14e38FAKgwAYWRuhNyNH8kMqGA4CMWDhQVlqIG8gQ4X
	IUbA==
X-Gm-Message-State: APjAAAWkbyRmnQ7/78hfPt+//d3zHZxtznQqXVAdlOEDBUeFb1glyH5J
	ui6ox/BWPN1bZO5OIQW7bjHWlPo0zR7qHhvSAZU=
X-Google-Smtp-Source: APXvYqzA68gsO/rd6NA6hNLuIUxSUhAz507RHNesga+3O8CzHW1Da5lg0v7sr6TdWL/Gf0bS/BL5KdCyCbpVAB1iseE=
X-Received: by 2002:aca:fc43:: with SMTP id a64mr1587143oii.129.1558315703318; 
	Sun, 19 May 2019 18:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190518032811.60341-1-liq3ea@163.com>
	<20190518081830.5adab426@x1.home>
In-Reply-To: <20190518081830.5adab426@x1.home>
From: Li Qiang <liq3ea@gmail.com>
Date: Mon, 20 May 2019 09:27:47 +0800
Message-ID: <CAKXe6SK=Uw7ZNPDvWHFoTHynFsOrEDcAK-+p2ft7YMpo86uC+A@mail.gmail.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Li Qiang <liq3ea@163.com>, lvivier@redhat.com, 
	Qemu Developers <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f1be32058947a51f"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-trivial] [PATCH 1/4] vfio: pci: make "vfio-pci-nohotplug"
 as MACRO
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
X-List-Received-Date: Mon, 20 May 2019 01:28:33 -0000

--000000000000f1be32058947a51f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alex Williamson <alex.williamson@redhat.com> =E4=BA=8E2019=E5=B9=B45=E6=9C=
=8818=E6=97=A5=E5=91=A8=E5=85=AD =E4=B8=8B=E5=8D=8810:18=E5=86=99=E9=81=93=
=EF=BC=9A

> On Fri, 17 May 2019 20:28:08 -0700
> Li Qiang <liq3ea@163.com> wrote:
>
> Why?  (No commit message, nor cover letter)
>
>
Once I think these are trivial so no cover letter and lack some commit
message.
I will add some commit message in the next revision.

For this patch, this is more consistent with QOMConventions:
-->https://wiki.qemu.org/Documentation/QOMConventions

Thanks,
Li Qiang


> > CC: qemu-trivial@nongnu.org
> > Signed-off-by: Li Qiang <liq3ea@163.com>
> > ---
> >  hw/vfio/pci.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> > index 8cecb53d5c..08729e5875 100644
> > --- a/hw/vfio/pci.c
> > +++ b/hw/vfio/pci.c
> > @@ -40,6 +40,8 @@
> >  #define TYPE_VFIO_PCI "vfio-pci"
> >  #define PCI_VFIO(obj)    OBJECT_CHECK(VFIOPCIDevice, obj, TYPE_VFIO_PC=
I)
> >
> > +#define TYPE_VIFO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
> > +
> >  static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
> >  static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);
> >
> > @@ -3304,8 +3306,8 @@ static void
> vfio_pci_nohotplug_dev_class_init(ObjectClass *klass, void *data)
> >  }
> >
> >  static const TypeInfo vfio_pci_nohotplug_dev_info =3D {
> > -    .name =3D "vfio-pci-nohotplug",
> > -    .parent =3D "vfio-pci",
> > +    .name =3D TYPE_VIFO_PCI_NOHOTPLUG,
> > +    .parent =3D TYPE_VFIO_PCI,
> >      .instance_size =3D sizeof(VFIOPCIDevice),
> >      .class_init =3D vfio_pci_nohotplug_dev_class_init,
> >  };
>
>

--000000000000f1be32058947a51f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Alex Williamson &lt;<a href=3D"mailto=
:alex.williamson@redhat.com">alex.williamson@redhat.com</a>&gt; =E4=BA=8E20=
19=E5=B9=B45=E6=9C=8818=E6=97=A5=E5=91=A8=E5=85=AD =E4=B8=8B=E5=8D=8810:18=
=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Fri, 17 May 2019 20:28:08 -0700<br>
Li Qiang &lt;<a href=3D"mailto:liq3ea@163.com" target=3D"_blank">liq3ea@163=
.com</a>&gt; wrote:<br>
<br>
Why?=C2=A0 (No commit message, nor cover letter)<br>
<br></blockquote><div><br></div><div>Once I think these are trivial so no c=
over letter and lack some commit message.</div><div>I will add some commit =
message in the next revision.</div><div><br></div><div>For this patch, this=
 is more consistent with QOMConventions:</div><div>--&gt;<a href=3D"https:/=
/wiki.qemu.org/Documentation/QOMConventions">https://wiki.qemu.org/Document=
ation/QOMConventions</a></div><div><br></div><div>Thanks,</div><div>Li Qian=
g</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; CC: <a href=3D"mailto:qemu-trivial@nongnu.org" target=3D"_blank">qemu-=
trivial@nongnu.org</a><br>
&gt; Signed-off-by: Li Qiang &lt;<a href=3D"mailto:liq3ea@163.com" target=
=3D"_blank">liq3ea@163.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/vfio/pci.c | 6 ++++--<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c<br>
&gt; index 8cecb53d5c..08729e5875 100644<br>
&gt; --- a/hw/vfio/pci.c<br>
&gt; +++ b/hw/vfio/pci.c<br>
&gt; @@ -40,6 +40,8 @@<br>
&gt;=C2=A0 #define TYPE_VFIO_PCI &quot;vfio-pci&quot;<br>
&gt;=C2=A0 #define PCI_VFIO(obj)=C2=A0 =C2=A0 OBJECT_CHECK(VFIOPCIDevice, o=
bj, TYPE_VFIO_PCI)<br>
&gt;=C2=A0 <br>
&gt; +#define TYPE_VIFO_PCI_NOHOTPLUG &quot;vfio-pci-nohotplug&quot;<br>
&gt; +<br>
&gt;=C2=A0 static void vfio_disable_interrupts(VFIOPCIDevice *vdev);<br>
&gt;=C2=A0 static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enab=
led);<br>
&gt;=C2=A0 <br>
&gt; @@ -3304,8 +3306,8 @@ static void vfio_pci_nohotplug_dev_class_init(Ob=
jectClass *klass, void *data)<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static const TypeInfo vfio_pci_nohotplug_dev_info =3D {<br>
&gt; -=C2=A0 =C2=A0 .name =3D &quot;vfio-pci-nohotplug&quot;,<br>
&gt; -=C2=A0 =C2=A0 .parent =3D &quot;vfio-pci&quot;,<br>
&gt; +=C2=A0 =C2=A0 .name =3D TYPE_VIFO_PCI_NOHOTPLUG,<br>
&gt; +=C2=A0 =C2=A0 .parent =3D TYPE_VFIO_PCI,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .instance_size =3D sizeof(VFIOPCIDevice),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .class_init =3D vfio_pci_nohotplug_dev_class_init,=
<br>
&gt;=C2=A0 };<br>
<br>
</blockquote></div></div>

--000000000000f1be32058947a51f--

