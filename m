Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFHjS-0001OW-CU
	for mharc-qemu-trivial@gnu.org; Fri, 20 Mar 2020 09:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51821)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yuval.shaia.ml@gmail.com>) id 1jFG9l-00013t-RX
 for qemu-trivial@nongnu.org; Fri, 20 Mar 2020 07:49:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yuval.shaia.ml@gmail.com>) id 1jFG9k-0004tF-Md
 for qemu-trivial@nongnu.org; Fri, 20 Mar 2020 07:49:41 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:40965)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1jFG9i-0004s8-AJ; Fri, 20 Mar 2020 07:49:38 -0400
Received: by mail-oi1-x244.google.com with SMTP id b17so6126711oic.8;
 Fri, 20 Mar 2020 04:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gyOnx1nzAHzLx2CPSjU3uktBQhRrmpu053D+0rZDdrs=;
 b=PU06joafaL9KHCeD+wfxOp8Se3vNNRfIf5pfUDGsvK/6WAb+f5SqruPpmfWJj/xkR9
 0m1/OcQULBlA5UIts0/PGUhghXUUXdwwIwY39fV6IVtGLmzGsiBjkPfjtZJo8BqqutSK
 q7+NTFZHoLUCS1xxdQeqX3C/+KhaouqAyxVU8WREgveyr/O6WCQ6/uDdKfb5ABcOAniW
 VmZhVuoSv6vt1Sf7m3E4vRmmPBR9DG6Ltl0PRdS2fL5wtLaJfR72J0JJAd601tC4SvEg
 77TLN2+gV7pZxcRO544BXoaTs4PH4PKWJFL0MYKdbxbc0kvy4kLKoJ+nb+8rP5A5iZ8z
 Xdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gyOnx1nzAHzLx2CPSjU3uktBQhRrmpu053D+0rZDdrs=;
 b=XBZMTRjuLY8WxIKGskAKdZYxW98AxkBw8W/RY4Hw3MQAF4xsfMn++T3OjZ//3GXmeU
 E+4QRYp4h7i0MC4itV3gN7nQTRMT+sX6pQ91swKZn5SFKwW035LleEgt/ay0zjmktAqR
 xQDffaA84cVi2EGB9x5wM2f1aqhJ0TQdhU5m+Bcz49jU9+qye+NCABX6/YUvXype9mh4
 Xr3BkO+3yQwHNv2tBOP2oVqBrCXVYQI1oXzUZkIq+i4JPEvGfa99I7k9QF9apYltN3b2
 i+NdISH0OiR+C6DFHXpN2AXXbjVshiQDplRll8k6fu6N6Vy5F5oLzvM//NbApRSoIylq
 1JAQ==
X-Gm-Message-State: ANhLgQ28sKz3MnlLatQZoGVku+sbpALmc57K+wl6ExPeqfaiqFM0E3kb
 +x9QGP/Yjp/bgbL5CPG6gFeWbYbWKfzOAVscfYM=
X-Google-Smtp-Source: ADFU+vuRXKolinRzb4RA/S259EekPXxH4S2n+HMzvC3JYl08lzf40ILwEjgLJEDWVF6W7hi+ouu6Fb5E4AviLdy3ees=
X-Received: by 2002:aca:cc08:: with SMTP id c8mr5912527oig.42.1584704977135;
 Fri, 20 Mar 2020 04:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200318134849.237011-1-jusual@redhat.com>
In-Reply-To: <20200318134849.237011-1-jusual@redhat.com>
From: Yuval Shaia <yuval.shaia.ml@gmail.com>
Date: Fri, 20 Mar 2020 13:49:26 +0200
Message-ID: <CAMPkWoPp7mSp5_bBBxmu8KJ1=C+_+-0UXX-oab6Wcw8vNjK5Jg@mail.gmail.com>
Subject: Re: [PATCH] hw/rdma/vmw/pvrdma_dev_ring: Replace strncpy with pstrcpy
To: Julia Suvorova <jusual@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000003c6bc105a147e1c5"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
X-Mailman-Approved-At: Fri, 20 Mar 2020 09:30:37 -0400
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
X-List-Received-Date: Fri, 20 Mar 2020 11:49:43 -0000

--0000000000003c6bc105a147e1c5
Content-Type: text/plain; charset="UTF-8"

Thanks,
Reviewed-by: Yuval Shaia <yuval.shaia.ml.gmail.com>

On Wed, 18 Mar 2020 at 15:49, Julia Suvorova <jusual@redhat.com> wrote:

> ring->name is defined as 'char name[MAX_RING_NAME_SZ]'. Replace untruncated
> strncpy with QEMU function.
> This case prevented QEMU from compiling with --enable-sanitizers.
>
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> ---
>  hw/rdma/vmw/pvrdma_dev_ring.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/rdma/vmw/pvrdma_dev_ring.c b/hw/rdma/vmw/pvrdma_dev_ring.c
> index d7bc7f5ccc..c2b3dd70a9 100644
> --- a/hw/rdma/vmw/pvrdma_dev_ring.c
> +++ b/hw/rdma/vmw/pvrdma_dev_ring.c
> @@ -16,6 +16,7 @@
>  #include "qemu/osdep.h"
>  #include "hw/pci/pci.h"
>  #include "cpu.h"
> +#include "qemu/cutils.h"
>
>  #include "trace.h"
>
> @@ -30,8 +31,7 @@ int pvrdma_ring_init(PvrdmaRing *ring, const char *name,
> PCIDevice *dev,
>      int i;
>      int rc = 0;
>
> -    strncpy(ring->name, name, MAX_RING_NAME_SZ);
> -    ring->name[MAX_RING_NAME_SZ - 1] = 0;
> +    pstrcpy(ring->name, MAX_RING_NAME_SZ, name);
>      ring->dev = dev;
>      ring->ring_state = ring_state;
>      ring->max_elems = max_elems;
> --
> 2.24.1
>
>

--0000000000003c6bc105a147e1c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks,<div>Reviewed-by: Yuval Shaia &lt;<a href=3D"http:/=
/yuval.shaia.ml.gmail.com">yuval.shaia.ml.gmail.com</a>&gt;</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 18=
 Mar 2020 at 15:49, Julia Suvorova &lt;<a href=3D"mailto:jusual@redhat.com"=
>jusual@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">ring-&gt;name is defined as &#39;char name[MAX_RING_NAME_=
SZ]&#39;. Replace untruncated<br>
strncpy with QEMU function.<br>
This case prevented QEMU from compiling with --enable-sanitizers.<br>
<br>
Signed-off-by: Julia Suvorova &lt;<a href=3D"mailto:jusual@redhat.com" targ=
et=3D"_blank">jusual@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/rdma/vmw/pvrdma_dev_ring.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/rdma/vmw/pvrdma_dev_ring.c b/hw/rdma/vmw/pvrdma_dev_ring.c<=
br>
index d7bc7f5ccc..c2b3dd70a9 100644<br>
--- a/hw/rdma/vmw/pvrdma_dev_ring.c<br>
+++ b/hw/rdma/vmw/pvrdma_dev_ring.c<br>
@@ -16,6 +16,7 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
+#include &quot;qemu/cutils.h&quot;<br>
<br>
=C2=A0#include &quot;trace.h&quot;<br>
<br>
@@ -30,8 +31,7 @@ int pvrdma_ring_init(PvrdmaRing *ring, const char *name, =
PCIDevice *dev,<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
=C2=A0 =C2=A0 =C2=A0int rc =3D 0;<br>
<br>
-=C2=A0 =C2=A0 strncpy(ring-&gt;name, name, MAX_RING_NAME_SZ);<br>
-=C2=A0 =C2=A0 ring-&gt;name[MAX_RING_NAME_SZ - 1] =3D 0;<br>
+=C2=A0 =C2=A0 pstrcpy(ring-&gt;name, MAX_RING_NAME_SZ, name);<br>
=C2=A0 =C2=A0 =C2=A0ring-&gt;dev =3D dev;<br>
=C2=A0 =C2=A0 =C2=A0ring-&gt;ring_state =3D ring_state;<br>
=C2=A0 =C2=A0 =C2=A0ring-&gt;max_elems =3D max_elems;<br>
-- <br>
2.24.1<br>
<br>
</blockquote></div>

--0000000000003c6bc105a147e1c5--

