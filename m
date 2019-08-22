Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i0hut-0002fb-70
	for mharc-qemu-trivial@gnu.org; Thu, 22 Aug 2019 03:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51064)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liq3ea@gmail.com>) id 1i0huq-0002dj-CS
 for qemu-trivial@nongnu.org; Thu, 22 Aug 2019 03:53:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liq3ea@gmail.com>) id 1i0hup-0004AT-8a
 for qemu-trivial@nongnu.org; Thu, 22 Aug 2019 03:53:52 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:34999)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <liq3ea@gmail.com>)
 id 1i0hum-00044D-K9; Thu, 22 Aug 2019 03:53:48 -0400
Received: by mail-ot1-x341.google.com with SMTP id g17so4650714otl.2;
 Thu, 22 Aug 2019 00:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DhX60WgWKF1Oo3EyNc1LWbZrmr7k6OPfTDHvb3kiuJY=;
 b=VrvzFtj23F3s4s8bCmYLLACbh7CGkyKdB+jAQQj16HGjACZpkPeAo3D48ZaCjD+qBT
 9BgNWQsob/d5us8xw0LO0pl5wrd9kbgFu8X449KMgY4VkNrO94dN1U7dhoVixpquD3/+
 qZXAOChv5j36J2RL9H4N2+bRgJOrdrRG61MS6MYO5JbzkCdyJi72Wl5ZWz67AKmKPmJc
 XU9/hrp3NliSjmUqxcDRB9tK59a4Lf8yUoTLV+9e720m5iryOyxAXr80tkWr16FzKlcI
 04/flblDl1jiJpbbbX71xjJrDoxjQB3Y8ZM6sIqnbJjaC88qagG1jbVXYvYXQPyxK9wC
 iiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DhX60WgWKF1Oo3EyNc1LWbZrmr7k6OPfTDHvb3kiuJY=;
 b=X3UECUEsbKqYPvwekIgOHobZgrNmTukAxk8JSNIzqDvGjlrp2Kd0/isxIO8kVyRgj3
 E3DojL1ww173lIb65SjTo+njMW9S1yBpjF84mYjK/Jy3GJeMCp9blbype5IMOHLXnURE
 1XYSSrnNuotmQAFV3dXtSWegpJt9IT+TubUH+JxylAcuTZye/IQt+pwRw5K0Ebca1Ugv
 S0McCN7OUPA+sjl3gi93GBTrWSmkenAZ1W3ZEkhTafUvgJ8V5DNrYPFHAnmZRZ9H+ae0
 0YdbiBy4a7CK+5h/GrLKdNhtK7otBLBVnqj+AlaXpfYU9qsqi0VXFq7r6Xxh7b77iPF/
 Bo7Q==
X-Gm-Message-State: APjAAAXcehJ/u1jovJ5LdNQfVN+XmRNvM2XaDr+BvvvTuPAozqTmBd9S
 WmHZaqucB5Ps2OHkZGtIJb8fFtV2k9VkhpBMEQI=
X-Google-Smtp-Source: APXvYqwrgH1omanFT/XqP8EOHPjIHg8SbZ6HpR2WoL0BZCnLbSvjy0PXW+gNrM/PKhpcjiKWiciAQJA/f3ZTISZQtek=
X-Received: by 2002:a05:6830:4ac:: with SMTP id
 l12mr1871859otd.333.1566460427186; 
 Thu, 22 Aug 2019 00:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <8E5A9C27-C76D-46CF-85B0-79121A00B05F@me.com>
In-Reply-To: <8E5A9C27-C76D-46CF-85B0-79121A00B05F@me.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Thu, 22 Aug 2019 15:53:10 +0800
Message-ID: <CAKXe6SKTPxPqRjabm6ytUYiZGO0oHoTQXD=1MvMbvYBe1D0jTQ@mail.gmail.com>
To: Chen Zhang <tgfbeta@me.com>
Cc: Qemu Developers <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, 
 Alex Williamson <alex.williamson@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005137a00590affdbe"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vfio: fix a typo
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Aug 2019 07:53:53 -0000

--0000000000005137a00590affdbe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chen Zhang via Qemu-devel <qemu-devel@nongnu.org> =E4=BA=8E2019=E5=B9=B48=
=E6=9C=8822=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=882:49=E5=86=99=E9=
=81=93=EF=BC=9A

> Signed-off-by: Chen Zhang <tgfbeta@me.com>
>


Reviewed-by: Li Qiang <liq3ea@gmail.com>



> ---
>  hw/vfio/pci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index dc3479c..c5e6fe6 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -44,7 +44,7 @@
>  #define TYPE_VFIO_PCI "vfio-pci"
>  #define PCI_VFIO(obj)    OBJECT_CHECK(VFIOPCIDevice, obj, TYPE_VFIO_PCI)
>
> -#define TYPE_VIFO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
> +#define TYPE_VFIO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
>
>  static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
>  static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);
> @@ -3199,7 +3199,7 @@ static void
> vfio_pci_nohotplug_dev_class_init(ObjectClass *klass, void *data)
>  }
>
>  static const TypeInfo vfio_pci_nohotplug_dev_info =3D {
> -    .name =3D TYPE_VIFO_PCI_NOHOTPLUG,
> +    .name =3D TYPE_VFIO_PCI_NOHOTPLUG,
>      .parent =3D TYPE_VFIO_PCI,
>      .instance_size =3D sizeof(VFIOPCIDevice),
>      .class_init =3D vfio_pci_nohotplug_dev_class_init,
> --
> 2.7.4
>
>
>
>

--0000000000005137a00590affdbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Chen Zhang via Qemu-devel &lt;<a href=
=3D"mailto:qemu-devel@nongnu.org">qemu-devel@nongnu.org</a>&gt; =E4=BA=8E20=
19=E5=B9=B48=E6=9C=8822=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=882:49=
=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Signed-off-by: Chen Zhang &lt;<a href=3D"mailto:tgfbeta@me.com"=
 target=3D"_blank">tgfbeta@me.com</a>&gt;<br></blockquote><div><br></div><d=
iv><br></div><div>Reviewed-by: Li Qiang &lt;<a href=3D"mailto:liq3ea@gmail.=
com">liq3ea@gmail.com</a>&gt;</div><div><br></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/vfio/pci.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c<br>
index dc3479c..c5e6fe6 100644<br>
--- a/hw/vfio/pci.c<br>
+++ b/hw/vfio/pci.c<br>
@@ -44,7 +44,7 @@<br>
=C2=A0#define TYPE_VFIO_PCI &quot;vfio-pci&quot;<br>
=C2=A0#define PCI_VFIO(obj)=C2=A0 =C2=A0 OBJECT_CHECK(VFIOPCIDevice, obj, T=
YPE_VFIO_PCI)<br>
<br>
-#define TYPE_VIFO_PCI_NOHOTPLUG &quot;vfio-pci-nohotplug&quot;<br>
+#define TYPE_VFIO_PCI_NOHOTPLUG &quot;vfio-pci-nohotplug&quot;<br>
<br>
=C2=A0static void vfio_disable_interrupts(VFIOPCIDevice *vdev);<br>
=C2=A0static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);=
<br>
@@ -3199,7 +3199,7 @@ static void vfio_pci_nohotplug_dev_class_init(ObjectC=
lass *klass, void *data)<br>
=C2=A0}<br>
<br>
=C2=A0static const TypeInfo vfio_pci_nohotplug_dev_info =3D { <br>
-=C2=A0 =C2=A0 .name =3D TYPE_VIFO_PCI_NOHOTPLUG,<br>
+=C2=A0 =C2=A0 .name =3D TYPE_VFIO_PCI_NOHOTPLUG,<br>
=C2=A0 =C2=A0 =C2=A0.parent =3D TYPE_VFIO_PCI,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(VFIOPCIDevice),<br>
=C2=A0 =C2=A0 =C2=A0.class_init =3D vfio_pci_nohotplug_dev_class_init,<br>
-- <br>
2.7.4<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000005137a00590affdbe--

