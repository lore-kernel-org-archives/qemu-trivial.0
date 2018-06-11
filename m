Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBXT-0001ok-SB
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:22:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjc@sifive.com>) id 1fSBXR-0001mZ-Nd
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:22:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjc@sifive.com>) id 1fSBXQ-00062F-MM
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:22:29 -0400
Received: from mail-ot0-x229.google.com ([2607:f8b0:4003:c0f::229]:41201)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mjc@sifive.com>) id 1fSBXQ-00061q-GX
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:22:28 -0400
Received: by mail-ot0-x229.google.com with SMTP id d19-v6so16373185oti.8
	for <qemu-trivial@nongnu.org>; Sun, 10 Jun 2018 18:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xN+9NAbGToqTCBQubovFAMrbYF0SkFVicLqHl087VGw=;
	b=kXl7cB7e1s2nxV6TZy3IzgxT7yb5kQX1XvqOSXVX36NOcli9huVW23/euVlvIxLgvX
	LsMlRk6DjmprkI3q1i9OYLdAgNJt6NZ+O1xvNK+NsSFDDliRyrYe3/ZdaTa+N76D1mCr
	wnYYylAYB0gbn9iZN9fIPuvgplLYClwONNle6HpinCRyK0DaZUHpjC/VZFN7WtcAZHcB
	ExdsIKP/ZhDwF6OhW+4Ovfimf54iJMV+Wj71kJuh3NO2IyUcHLHf3jsr0VGhXGtTBqiy
	LSKHSvHJ6TCi0KZVXvfC1y1YBzk1GJwQ7WOBz1uTJyNS3m/hJmO6bVpTnPRYqYObay72
	CIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xN+9NAbGToqTCBQubovFAMrbYF0SkFVicLqHl087VGw=;
	b=dnvzmj/mD4+INIbw6ao7JxLkUWy7s3ZO34v6L+EatieW+fZd/vayNxSqax/dAqceII
	gCgHgC1kAwlJPWNDIU9nIiSJKoMMxyZUOBpSFNJAzPXCFusfJC3kwczHb6EPFyso9ZdY
	Jdgr1fnJao8BSqLYbxcKioanQJDndRxoYjbXDNQOvcaUvtpTA9zbNxVpU1L3h21EnaQg
	eShSDG73SHakRKD/cdbIT7Mq49WG8uuaWBb1AoYF991I5XE7/ruZoU3EJ0ZaPsw3aBgB
	jbj2I/I2BdumgqPbsK9lOUSMdpFpEAGvO0pC3u2ExYjptfWtT4Fx8cB+JpRfX/nu+bbR
	QkWg==
X-Gm-Message-State: APt69E3/o+03Lqv0IEPvQ8nVdH2AN9jPUp3KMIW2SDzC12+F5GrVeX5P
	ivSVqqru2Qf85eu7WGUok4kjwzyu5MOuwe/efdBHjg==
X-Google-Smtp-Source: ADUXVKImE1dm6+pzC2dIW/6vn+I9ex0/AJjEMSpMnQLGQ9DjVtqvjl2j+IU5IPzZTnmO9aJnbvBgRPPFInGB7g0Ge4U=
X-Received: by 2002:a9d:34c3:: with SMTP id
	t3-v6mr9540164otd.313.1528680147608; 
	Sun, 10 Jun 2018 18:22:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:19d6:0:0:0:0:0 with HTTP; Sun, 10 Jun 2018 18:22:27
	-0700 (PDT)
In-Reply-To: <20180611011501.10235-17-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
	<20180611011501.10235-17-f4bug@amsat.org>
From: Michael Clark <mjc@sifive.com>
Date: Mon, 11 Jun 2018 13:22:27 +1200
Message-ID: <CAHNT7NtGEgDee=3ZsJU28=q_FYUpYbDEgNYmcSP4qf0c713UhA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, 
	Palmer Dabbelt <palmer@sifive.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: multipart/alternative; boundary="0000000000002c7845056e5395de"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::229
Subject: Re: [Qemu-trivial] [PATCH v4 16/40] hw/riscv: Use the IEC binary
 prefix definitions
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
X-List-Received-Date: Mon, 11 Jun 2018 01:22:30 -0000

--0000000000002c7845056e5395de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 11, 2018 at 1:14 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> It eases code review, unit is explicit.
>
> Patch generated using:
>
>   $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/
> include/hw/
>
> and modified manually.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>

Reviewed-by: Michael Clark <mjc@sifive.com>


> ---
>  hw/riscv/virt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index ad03113e0f..34d48993a2 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -19,6 +19,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qemu/log.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
> @@ -84,7 +85,7 @@ static hwaddr load_initrd(const char *filename, uint64_=
t
> mem_size,
>       * halfway into RAM, and for boards with 256MB of RAM or more we put
>       * the initrd at 128MB.
>       */
> -    *start =3D kernel_entry + MIN(mem_size / 2, 128 * 1024 * 1024);
> +    *start =3D kernel_entry + MIN(mem_size / 2, 128 * MiB);
>
>      size =3D load_ramdisk(filename, *start, mem_size - *start);
>      if (size =3D=3D -1) {
> --
> 2.17.1
>
>

--0000000000002c7845056e5395de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Jun 11, 2018 at 1:14 PM, Philippe Mathieu-Daud=C3=A9 <span dir=
=3D"ltr">&lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@ams=
at.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">It eases cod=
e review, unit is explicit.<br>
<br>
Patch generated using:<br>
<br>
=C2=A0 $ git grep -E &#39;(1024|2048|4096|8192|(&lt;&lt;|&gt;&gt;).<wbr>?(1=
0|20|30))&#39; hw/ include/hw/<br>
<br>
and modified manually.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org">f4bug@amsat.org</a>&gt;<br></blockquote><div><br></div><div>Reviewed=
-by: Michael Clark &lt;<a href=3D"mailto:mjc@sifive.com">mjc@sifive.com</a>=
&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
---<br>
=C2=A0hw/riscv/virt.c | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c<br>
index ad03113e0f..34d48993a2 100644<br>
--- a/hw/riscv/virt.c<br>
+++ b/hw/riscv/virt.c<br>
@@ -19,6 +19,7 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
@@ -84,7 +85,7 @@ static hwaddr load_initrd(const char *filename, uint64_t =
mem_size,<br>
=C2=A0 =C2=A0 =C2=A0 * halfway into RAM, and for boards with 256MB of RAM o=
r more we put<br>
=C2=A0 =C2=A0 =C2=A0 * the initrd at 128MB.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 *start =3D kernel_entry + MIN(mem_size / 2, 128 * 1024 * 102=
4);<br>
+=C2=A0 =C2=A0 *start =3D kernel_entry + MIN(mem_size / 2, 128 * MiB);<br>
<br>
=C2=A0 =C2=A0 =C2=A0size =3D load_ramdisk(filename, *start, mem_size - *sta=
rt);<br>
=C2=A0 =C2=A0 =C2=A0if (size =3D=3D -1) {<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.17.1<br>
<br>
</font></span></blockquote></div><br></div></div>

--0000000000002c7845056e5395de--

