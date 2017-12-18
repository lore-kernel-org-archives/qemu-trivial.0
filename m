Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQs1u-00045d-NH
	for mharc-qemu-trivial@gnu.org; Mon, 18 Dec 2017 04:48:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1eQs1s-00044F-Ge
	for qemu-trivial@nongnu.org; Mon, 18 Dec 2017 04:48:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1eQs1m-0000Hr-QQ
	for qemu-trivial@nongnu.org; Mon, 18 Dec 2017 04:48:12 -0500
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:34372)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1eQs1j-0000Fh-U4; Mon, 18 Dec 2017 04:48:04 -0500
Received: by mail-wr0-x244.google.com with SMTP id y21so13457846wrc.1;
	Mon, 18 Dec 2017 01:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YC9i6RaCm8TNEAPM1CiQF5jxy/vJoY6st+tu+kXpgv0=;
	b=RgINEvoxuPTLUxv4oo8uB57cH8CF+9d45AOUY8w7DQMYFwxXVSqmNEMozefox7Avxg
	I7D50WBch4R+Gh7ZkhyaNQjjtcY95moyDaTh8eV7oJKDcsqx3ua2ChG0Dt7JvYcvQRjg
	8NYXJ58mdQ3W25vfkzHGsoBhA0EBQoQDGwqVZ2B4hm3OjQsNx/vKUM3FOjhEImWqqfrY
	7Rqmt2MQTDA+0z9yyD9O12tJFP0iz/g9M4seRUh5lFMuij+MliJpGnHrndjTn56zflQ9
	nvatmB16qVOuQ6tMcO6xL9CoeL4a0M+dBXgvb4H9mo9LavtSI2BVd8uHGJIqVbWM2+J0
	3/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YC9i6RaCm8TNEAPM1CiQF5jxy/vJoY6st+tu+kXpgv0=;
	b=dDrVZPhOxOhuAnGhj6IggYn2xBJ1c5U52lT6ks0o8g2VPBIVjg234cTOHYc3tAfNU4
	g2fjDRlbcc8RR10/STtqD7QjlEzjuv4R72mpS1odcJGON8Oz8HHFdMy4U0BI9iYfH8z/
	gZaB/QGxQ0Fi9pJNr91GP2LLnWXBi8lPKtRFxD7rP+w0OgROojjtlDyRHFLvTV3WipuK
	7rVEv8taQ/l3EbKcUk2QfH4b0k1pcb4uNnpFwOSIx39YdEibS7u8RMxUsrju4TTQ/Ajn
	cvwAJj2aI+AqJBiUSo1qA6/gR9BLK42MKq5pOFt38A6Av59cJhrApnHS8Rpuk2+GGXED
	J7bg==
X-Gm-Message-State: AKGB3mKZQ+0eV84ahowaQnyUUhySic4lY9V37XDr3qxseDwmozZAmeI/
	UzCBQwSXo9rO/XOuArLVmONbyMo5WvT6KThqF7c=
X-Google-Smtp-Source: ACJfBotrRCR8xekHBPXDcW4c8GpyxWdBpmJU/eI8/OSQPM+NGuy0594xZ1HS99cfRi9QFZ62+CLKFLwid93rX5wA9Vg=
X-Received: by 10.223.187.210 with SMTP id z18mr15521880wrg.117.1513590482568; 
	Mon, 18 Dec 2017 01:48:02 -0800 (PST)
MIME-Version: 1.0
References: <20171218015947.17293-1-f4bug@amsat.org>
In-Reply-To: <20171218015947.17293-1-f4bug@amsat.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 18 Dec 2017 09:47:52 +0000
Message-ID: <CAJ+F1C+42pi5=9KX6811ndi6P_8z_Yr75gRYpzmgZ3ZZRruPZA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Michael Tokarev <mjt@tls.msk.ru>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="089e0820ee800c8bbb05609a3fd1"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/tpm: remove old i386
 dependency
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
X-List-Received-Date: Mon, 18 Dec 2017 09:48:13 -0000

--089e0820ee800c8bbb05609a3fd1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com>

Le lun. 18 d=C3=A9c. 2017 =C3=A0 03:01, Philippe Mathieu-Daud=C3=A9 <f4bug@=
amsat.org> a
=C3=A9crit :

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
> ---
> Based-on: 1513446109-9013-33-git-send-email-stefanb@linux.vnet.ibm.com
> ---
>  hw/tpm/tpm_emulator.c    | 1 -
>  hw/tpm/tpm_passthrough.c | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/hw/tpm/tpm_emulator.c b/hw/tpm/tpm_emulator.c
> index 3ae8bf6c5a..38b6f175a1 100644
> --- a/hw/tpm/tpm_emulator.c
> +++ b/hw/tpm/tpm_emulator.c
> @@ -33,7 +33,6 @@
>  #include "sysemu/tpm_backend.h"
>  #include "tpm_int.h"
>  #include "hw/hw.h"
> -#include "hw/i386/pc.h"
>  #include "tpm_util.h"
>  #include "tpm_ioctl.h"
>  #include "migration/blocker.h"
> diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
> index 487aae2043..149fae63e6 100644
> --- a/hw/tpm/tpm_passthrough.c
> +++ b/hw/tpm/tpm_passthrough.c
> @@ -29,7 +29,6 @@
>  #include "sysemu/tpm_backend.h"
>  #include "tpm_int.h"
>  #include "hw/hw.h"
> -#include "hw/i386/pc.h"
>  #include "qapi/clone-visitor.h"
>  #include "tpm_util.h"
>
> --
> 2.15.1
>
>
> --
Marc-Andr=C3=A9 Lureau

--089e0820ee800c8bbb05609a3fd1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
gmail.com">marcandre.lureau@gmail.com</a>&gt;<br><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr">Le lun. 18 d=C3=A9c. 2017 =C3=A0 03:01, Philippe Math=
ieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&g=
t; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-b=
y: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org" targe=
t=3D"_blank">f4bug@amsat.org</a>&gt;<br>
Reviewed-by: Stefan Berger &lt;<a href=3D"mailto:stefanb@linux.vnet.ibm.com=
" target=3D"_blank">stefanb@linux.vnet.ibm.com</a>&gt;<br>
---<br>
Based-on: <a href=3D"mailto:1513446109-9013-33-git-send-email-stefanb@linux=
.vnet.ibm.com" target=3D"_blank">1513446109-9013-33-git-send-email-stefanb@=
linux.vnet.ibm.com</a><br>
---<br>
=C2=A0hw/tpm/tpm_emulator.c=C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/tpm/tpm_passthrough.c | 1 -<br>
=C2=A02 files changed, 2 deletions(-)<br>
<br>
diff --git a/hw/tpm/tpm_emulator.c b/hw/tpm/tpm_emulator.c<br>
index 3ae8bf6c5a..38b6f175a1 100644<br>
--- a/hw/tpm/tpm_emulator.c<br>
+++ b/hw/tpm/tpm_emulator.c<br>
@@ -33,7 +33,6 @@<br>
=C2=A0#include &quot;sysemu/tpm_backend.h&quot;<br>
=C2=A0#include &quot;tpm_int.h&quot;<br>
=C2=A0#include &quot;hw/hw.h&quot;<br>
-#include &quot;hw/i386/pc.h&quot;<br>
=C2=A0#include &quot;tpm_util.h&quot;<br>
=C2=A0#include &quot;tpm_ioctl.h&quot;<br>
=C2=A0#include &quot;migration/blocker.h&quot;<br>
diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c<br>
index 487aae2043..149fae63e6 100644<br>
--- a/hw/tpm/tpm_passthrough.c<br>
+++ b/hw/tpm/tpm_passthrough.c<br>
@@ -29,7 +29,6 @@<br>
=C2=A0#include &quot;sysemu/tpm_backend.h&quot;<br>
=C2=A0#include &quot;tpm_int.h&quot;<br>
=C2=A0#include &quot;hw/hw.h&quot;<br>
-#include &quot;hw/i386/pc.h&quot;<br>
=C2=A0#include &quot;qapi/clone-visitor.h&quot;<br>
=C2=A0#include &quot;tpm_util.h&quot;<br>
<br>
--<br>
2.15.1<br>
<br>
<br>
</blockquote></div><div dir=3D"ltr">-- <br></div><div class=3D"gmail_signat=
ure" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Marc-Andr=C3=A9 Lu=
reau<br></div></div>

--089e0820ee800c8bbb05609a3fd1--

