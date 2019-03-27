Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h97rQ-0006Gg-IE
	for mharc-qemu-trivial@gnu.org; Wed, 27 Mar 2019 08:40:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h97rO-0006EM-Ec
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2019 08:40:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h97rN-0003HY-DX
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2019 08:40:50 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:34708)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h97rK-0003Gk-SX; Wed, 27 Mar 2019 08:40:47 -0400
Received: by mail-yw1-f67.google.com with SMTP id x129so11584961ywc.1;
	Wed, 27 Mar 2019 05:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9+fvAHaso4MEpfecyiS3LpzLLvxIumLJBpwHLGclcbw=;
	b=cS9vzMI4rTMUW62xxm+/H3DZdyOUmLnfGT9ZdPC47E5t43F/hhJofmJBJX6drjgg2C
	PswVpg7+mcEXHhW/8uFXcmgSUmaw0N647CJWLy5mDagxlSZgddzCoDSBcXIaJStKJYOo
	jvLh5zi3hin6R2sSLLhsb4pdlLkgYb04wGdfhQdAEnFCSfyyn/VXOYIWltB9pC9dOt3G
	pedXUlg8VplaWGTRyhaFGijd3AKq4qp6r/qzdaKbr46GfVNFCWceDuOt90nCI+O4Asha
	1nhXU4lZ8PLUNl03hTFWMTHbcKBIQJjiuxqBf7RJ9wJbl+JgxLWB5oM5X7ZQxaH2zj9b
	C3hw==
X-Gm-Message-State: APjAAAWUDyppGh5/OIrojTSKSJeix7xicKr+pW6o922Fzyxo3G/UR4Ya
	km5MRCw/nzdOKJHFgIxpcZu/IMB4dVTjpcoLyZwLENo6
X-Google-Smtp-Source: APXvYqzGqhA6iKobP0x/oXe5ZuBV9+QK3N2pBMUnWTLOG9Mo3x++6F+Qi4/UFMeTvIlYtUvDRM6A1ZxfXK/qAi0fozk=
X-Received: by 2002:a0d:fe05:: with SMTP id o5mr30346632ywf.356.1553690446249; 
	Wed, 27 Mar 2019 05:40:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190327095634.53038-1-sgarzare@redhat.com>
	<20190327095634.53038-2-sgarzare@redhat.com>
In-Reply-To: <20190327095634.53038-2-sgarzare@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 27 Mar 2019 13:40:35 +0100
Message-ID: <CAAdtpL6y-8nsQY7zhPSo9-Ny4A+8xH1grxjWacef3nNwF2+4Dg@mail.gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Max Reitz <mreitz@redhat.com>, 
	John Snow <jsnow@redhat.com>, qemu-trivial@nongnu.org,
	Jeff Cody <codyprime@gmail.com>, 
	qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000023c564058512bf60"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.67
Subject: Re: [Qemu-trivial] [PATCH v2 1/2] block/vhdx: Remove redundant IEC
 binary prefixes definition
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
X-List-Received-Date: Wed, 27 Mar 2019 12:40:51 -0000

--00000000000023c564058512bf60
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 27 mars 2019 10:56, Stefano Garzarella <sgarzare@redhat.com> a
=C3=A9crit :

> IEC binary prefixes are already defined in "qemu/units.h",
> so we can remove redundant definitions in "block/vhdx.h".
>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  block/vhdx.c | 3 ++-
>  block/vhdx.h | 6 +-----
>  2 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/block/vhdx.c b/block/vhdx.c
> index b785aef4b7..7cd1fc3731 100644
> --- a/block/vhdx.c
> +++ b/block/vhdx.c
> @@ -1889,7 +1889,8 @@ static int coroutine_fn
> vhdx_co_create(BlockdevCreateOptions *opts,
>          return -EINVAL;
>      }
>      if (block_size > VHDX_BLOCK_SIZE_MAX) {
> -        error_setg(errp, "Block size must not exceed %d",
> VHDX_BLOCK_SIZE_MAX);
> +        error_setg(errp, "Block size must not exceed %" PRId64,
> +                   VHDX_BLOCK_SIZE_MAX);
>          return -EINVAL;
>      }
>
> diff --git a/block/vhdx.h b/block/vhdx.h
> index 1bfb4e4f73..bf72090c8f 100644
> --- a/block/vhdx.h
> +++ b/block/vhdx.h
> @@ -17,11 +17,7 @@
>
>  #ifndef BLOCK_VHDX_H
>  #define BLOCK_VHDX_H
> -
> -#define KiB              (1 * 1024)
> -#define MiB            (KiB * 1024)
> -#define GiB            (MiB * 1024)
> -#define TiB ((uint64_t) GiB * 1024)
> +#include "qemu/units.h"
>
>  #define DEFAULT_LOG_SIZE 1048576 /* 1MiB */
>  /* Structures and fields present in the VHDX file */
> --
> 2.20.1
>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

>

--00000000000023c564058512bf60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
Le mer. 27 mars 2019 10:56, Stefano Garzarella &lt;<a href=3D"mailto:sgarza=
re@redhat.com">sgarzare@redhat.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">IEC binary prefixes are already defined in &quo=
t;qemu/units.h&quot;,<br>
so we can remove redundant definitions in &quot;block/vhdx.h&quot;.<br>
<br>
Signed-off-by: Stefano Garzarella &lt;<a href=3D"mailto:sgarzare@redhat.com=
" target=3D"_blank" rel=3D"noreferrer">sgarzare@redhat.com</a>&gt;<br>
---<br>
=C2=A0block/vhdx.c | 3 ++-<br>
=C2=A0block/vhdx.h | 6 +-----<br>
=C2=A02 files changed, 3 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/block/vhdx.c b/block/vhdx.c<br>
index b785aef4b7..7cd1fc3731 100644<br>
--- a/block/vhdx.c<br>
+++ b/block/vhdx.c<br>
@@ -1889,7 +1889,8 @@ static int coroutine_fn vhdx_co_create(BlockdevCreate=
Options *opts,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (block_size &gt; VHDX_BLOCK_SIZE_MAX) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Block size must not exc=
eed %d&quot;, VHDX_BLOCK_SIZE_MAX);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Block size must not exc=
eed %&quot; PRId64,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VHDX_=
BLOCK_SIZE_MAX);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/block/vhdx.h b/block/vhdx.h<br>
index 1bfb4e4f73..bf72090c8f 100644<br>
--- a/block/vhdx.h<br>
+++ b/block/vhdx.h<br>
@@ -17,11 +17,7 @@<br>
<br>
=C2=A0#ifndef BLOCK_VHDX_H<br>
=C2=A0#define BLOCK_VHDX_H<br>
-<br>
-#define KiB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 * 1024)<br>
-#define MiB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (KiB * 1024)<br>
-#define GiB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (MiB * 1024)<br>
-#define TiB ((uint64_t) GiB * 1024)<br>
+#include &quot;qemu/units.h&quot;<br>
<br>
=C2=A0#define DEFAULT_LOG_SIZE 1048576 /* 1MiB */<br>
=C2=A0/* Structures and fields present in the VHDX file */<br>
-- <br>
2.20.1<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@=
amsat.org">f4bug@amsat.org</a>&gt;<br></div><div dir=3D"auto"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000023c564058512bf60--

