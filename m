Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cqorR-0003zm-G3
	for mharc-qemu-trivial@gnu.org; Wed, 22 Mar 2017 18:36:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46035)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1cqorO-0003yC-Rg
	for qemu-trivial@nongnu.org; Wed, 22 Mar 2017 18:36:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1cqorN-0007Mw-U7
	for qemu-trivial@nongnu.org; Wed, 22 Mar 2017 18:36:06 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:35815)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1cqorN-0007Lg-Jt; Wed, 22 Mar 2017 18:36:05 -0400
Received: by mail-lf0-x241.google.com with SMTP id v2so15151449lfi.2;
	Wed, 22 Mar 2017 15:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gYuCg1K/P0RxYfddWrIc58MVouF0w8l3PAusHzZbsRU=;
	b=lVF7v0ydNtg5PVr6sNlZZ3ciK6WlSNASgyG0BPXrsyOZ+BhZqiQ4Qxzm0kn/0/+nc/
	rIxgK6CuYf3hqVgeB+v72iHDLNUWhlEcGdxVeTk0yj2cqli+YikGx5Q/C6pNX9LWGEpL
	iDaz2l+HHQIC7WJHyr2YnW7WYtU7yBSBNp2YuB5PVJGt9iFNHaJ02qCznYDW1Gesv0wP
	0306D8DMK1bELYuwFV3iyun9Ce+iqLgWnbpB39ow2MVA3TfGDaH3H28g9t89YPIm0ZUM
	F+GXWzLf9/YKh9KdYeK0sbahk941NxQ0Cr7j0iX5RUPCCGyBpmt2TMsagFb6jwFKHJKg
	e4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gYuCg1K/P0RxYfddWrIc58MVouF0w8l3PAusHzZbsRU=;
	b=ZZtFo6td9pHVOZSxE253k9QZoES+FeReyl1r+AWfpE/kuRkJRmPTelsVMPQI9VkWBT
	zBxv4vqf2tcsqL09WOuhm8aETw35doYtvyoRIJ+d6759eB6YfoP+1oZ9Bd71ws6jg1Z1
	bs8gxEjZhPGeHvfFaE0p06hXHp0md7YziTOVBxkwcUYf0Ps+MFEJAebWMBnkwLCQFVpL
	ONnXkv003RTFJhnmbIrFZXHnxV4De+1gpHFsFuOK9+U0g6LeHNU+omIHXAsEI3EPyvmc
	ZnyaiJdQQ2UktPJP0pGtvFT+9AuXRg5fAMORaS2P4YEvXYsf1NbUkATYJBDsk7Ov4gSn
	P/9g==
X-Gm-Message-State: AFeK/H1edU83Swr35jiGAmyMcSG/xVKXUTmRHvd8T2gRlLMCTFRIcBDV3K2Qh7LTddFJAeaHFiGiiAK+97MIpA==
X-Received: by 10.25.67.89 with SMTP id m25mr12380567lfj.139.1490222164161;
	Wed, 22 Mar 2017 15:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <20170322204844.446-1-f4bug@amsat.org>
	<20170322204844.446-3-f4bug@amsat.org>
In-Reply-To: <20170322204844.446-3-f4bug@amsat.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Mar 2017 22:35:52 +0000
Message-ID: <CAJ+F1CJmyqHRsgP6uSRYSc6M=4Ud5fP7-UPjs_nUzApDGa3VuA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Alexander Graf <agraf@suse.de>, Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary=f403045ea2bebb3c1e054b5962b0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH RESEND 2/3] device_tree: fix
 compiler warnings (clang 5)
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
X-List-Received-Date: Wed, 22 Mar 2017 22:36:07 -0000

--f403045ea2bebb3c1e054b5962b0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2017 at 12:49 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> static code analyzer complain:
>
> device_tree.c:155:18: warning: Null pointer passed as an argument to a
> 'nonnull' parameter
>     while ((de =3D readdir(d)) !=3D NULL) {
>                  ^~~~~~~~~~
>
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>


Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  device_tree.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/device_tree.c b/device_tree.c
> index 6e06320830..a24ddff02b 100644
> --- a/device_tree.c
> +++ b/device_tree.c
> @@ -148,6 +148,7 @@ static void read_fstree(void *fdt, const char *dirnam=
e)
>      d =3D opendir(dirname);
>      if (!d) {
>          error_setg(&error_fatal, "%s cannot open %s", __func__, dirname)=
;
> +        return;
>      }
>
>      while ((de =3D readdir(d)) !=3D NULL) {
> --
> 2.11.0
>
>
> --
Marc-Andr=C3=A9 Lureau

--f403045ea2bebb3c1e054b5962b0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu=
, Mar 23, 2017 at 12:49 AM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailt=
o:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">static code analyzer complain:<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
device_tree.c:155:18: warning: Null pointer passed as an argument to a &#39=
;nonnull&#39; parameter<br class=3D"gmail_msg">
=C2=A0 =C2=A0 while ((de =3D readdir(d)) !=3D NULL) {<br class=3D"gmail_msg=
">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~<br=
 class=3D"gmail_msg">
<br class=3D"gmail_msg">
Reported-by: Clang Static Analyzer<br class=3D"gmail_msg">
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" class=3D"gmail_msg" target=3D"_blank">f4bug@amsat.org</a>&gt;<br cla=
ss=3D"gmail_msg"></blockquote><div><br><br>Reviewed-by: Marc-Andr=C3=A9 Lur=
eau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@red=
hat.com</a>&gt;<br><br>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
---<br class=3D"gmail_msg">
=C2=A0device_tree.c | 1 +<br class=3D"gmail_msg">
=C2=A01 file changed, 1 insertion(+)<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
diff --git a/device_tree.c b/device_tree.c<br class=3D"gmail_msg">
index 6e06320830..a24ddff02b 100644<br class=3D"gmail_msg">
--- a/device_tree.c<br class=3D"gmail_msg">
+++ b/device_tree.c<br class=3D"gmail_msg">
@@ -148,6 +148,7 @@ static void read_fstree(void *fdt, const char *dirname)=
<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0d =3D opendir(dirname);<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0if (!d) {<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(&amp;error_fatal, &quot;%s can=
not open %s&quot;, __func__, dirname);<br class=3D"gmail_msg">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0}<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0while ((de =3D readdir(d)) !=3D NULL) {<br class=3D"gma=
il_msg">
--<br class=3D"gmail_msg">
2.11.0<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
</blockquote></div></div><div dir=3D"ltr">-- <br></div><div data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div></div=
>

--f403045ea2bebb3c1e054b5962b0--

