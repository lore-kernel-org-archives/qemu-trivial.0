Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cOppY-0007l0-Uv
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jan 2017 12:58:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39111)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1cOppW-0007fh-8i
	for qemu-trivial@nongnu.org; Wed, 04 Jan 2017 12:58:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1cOppV-0001Nb-BU
	for qemu-trivial@nongnu.org; Wed, 04 Jan 2017 12:58:30 -0500
Received: from mail-yw0-x241.google.com ([2607:f8b0:4002:c05::241]:33594)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1cOppT-0001Lk-39; Wed, 04 Jan 2017 12:58:27 -0500
Received: by mail-yw0-x241.google.com with SMTP id s68so42433391ywg.0;
	Wed, 04 Jan 2017 09:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tTHI1lia36Q6HcXVXvuh653FE/sxgxAoCg+jsZbQOwA=;
	b=iRH9yRbLc/A4YMa6u6ckWRbCvs2e+pKZ+e97AS8OZRKeF9BTvMhdprS2l7N2D/wXwP
	o7oAOOLSvOtpei44DITTaNK1YHCA5/ME2NmkcyFj0HPTl+K4xGaz59ksz2sgzfGOpxOa
	t2uaxMx90RMa7wVko+4fqbo+FsPflK0oaz3K15NYjykX0a+OlO6eCUf4gC63VW+Xd9z2
	ksehfpTD3Qce7AGcgqxJhU6/t9RoZVvg2rRFmmF9r4fKzVuqVJ8yI3YCt4qopPMdl+3W
	ISALhxzZuDVwuhcsYikWfWO0fcD2lo3zOP5sPBXG+CzQ1t2nvNi94UYjuZR9IiwlI1LX
	boeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tTHI1lia36Q6HcXVXvuh653FE/sxgxAoCg+jsZbQOwA=;
	b=SCHRzxV8gahQ0iCv21JxMNehZFjfsUTS8dXmL/aCJgmpHGpAKFOBNdq7R4Hbsby7sN
	vxKj2fmu3wlihcQMePTTYT4xsnjUNPAHLI8qlM7S+ZLvil4UobGr0AkcjFTKSHKBWuuD
	2salHA5TgKuZ1M8ffRjVkqhEM9gJCyokYhI6fkcu3c7HCs6UC0BGGTlUA6EHPunjSGXs
	mN3cKxCaDqNIGbqeKbRbGPUJPHszzu4vQzw7PYZhRZfwXyqBlfDIHrGGgdqIwqdxwMFq
	UgeEMMLo3RiDWvzaDxN4n4HJiCQqrtRAO2y6ZJSPHENFEZie4k2w6/5MN9vvEpcNQ0AE
	xNow==
X-Gm-Message-State: AIkVDXKkzD35XBH2ltBcnbnduFZGX58V3wMyQ9cxGaGRnQFiMBfAxYb669ApDuy0DhEnOZO3L/ADuJy/teT3eg==
X-Received: by 10.129.92.198 with SMTP id q189mr64582929ywb.95.1483552706221; 
	Wed, 04 Jan 2017 09:58:26 -0800 (PST)
MIME-Version: 1.0
References: <20170104145210.31608-1-pbonzini@redhat.com>
In-Reply-To: <20170104145210.31608-1-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 04 Jan 2017 17:58:15 +0000
Message-ID: <CAJ+F1C+CUdR6tAC09iw4xGZY1xM_TB8x8MAS9bPyJd6YBwKmPw@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary=001a114ca04c0f6ae8054548889b
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qga: fix erroneous argument
 to strerror
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
X-List-Received-Date: Wed, 04 Jan 2017 17:58:31 -0000

--001a114ca04c0f6ae8054548889b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 4, 2017 at 3:54 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> process_command returns a negative value in case of error.  Make this
> clear in the "if" statement and fix the strerror argument to flip it
> to positive.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>


Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


---
>  qga/main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qga/main.c b/qga/main.c
> index 6caf215..538e4ee 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -558,8 +558,8 @@ static void process_command(GAState *s, QDict *req)
>      rsp =3D qmp_dispatch(QOBJECT(req));
>      if (rsp) {
>          ret =3D send_response(s, rsp);
> -        if (ret) {
> -            g_warning("error sending response: %s", strerror(ret));
> +        if (ret < 0) {
> +            g_warning("error sending response: %s", strerror(-ret));
>          }
>          qobject_decref(rsp);
>      }
> --
> 2.9.3
>
>
> --
Marc-Andr=C3=A9 Lureau

--001a114ca04c0f6ae8054548889b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed=
, Jan 4, 2017 at 3:54 PM Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redha=
t.com">pbonzini@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">process_command returns a negative value in case of error.=C2=A0 Mak=
e this<br class=3D"gmail_msg">
clear in the &quot;if&quot; statement and fix the strerror argument to flip=
 it<br class=3D"gmail_msg">
to positive.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" cla=
ss=3D"gmail_msg" target=3D"_blank">pbonzini@redhat.com</a>&gt;<br class=3D"=
gmail_msg"></blockquote><br><br>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a =
href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>=
&gt;<br><br><br> <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
---<br class=3D"gmail_msg">
=C2=A0qga/main.c | 4 ++--<br class=3D"gmail_msg">
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br class=3D"gmail_msg=
">
<br class=3D"gmail_msg">
diff --git a/qga/main.c b/qga/main.c<br class=3D"gmail_msg">
index 6caf215..538e4ee 100644<br class=3D"gmail_msg">
--- a/qga/main.c<br class=3D"gmail_msg">
+++ b/qga/main.c<br class=3D"gmail_msg">
@@ -558,8 +558,8 @@ static void process_command(GAState *s, QDict *req)<br =
class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0rsp =3D qmp_dispatch(QOBJECT(req));<br class=3D"gmail_m=
sg">
=C2=A0 =C2=A0 =C2=A0if (rsp) {<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D send_response(s, rsp);<br class=
=3D"gmail_msg">
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br class=3D"gmail_msg">
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_warning(&quot;error sending re=
sponse: %s&quot;, strerror(ret));<br class=3D"gmail_msg">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br class=3D"gmail_msg">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_warning(&quot;error sending re=
sponse: %s&quot;, strerror(-ret));<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qobject_decref(rsp);<br class=3D"gmail_ms=
g">
=C2=A0 =C2=A0 =C2=A0}<br class=3D"gmail_msg">
--<br class=3D"gmail_msg">
2.9.3<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
</blockquote></div></div><div dir=3D"ltr">-- <br></div><div data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div></div=
>

--001a114ca04c0f6ae8054548889b--

