Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VqMBo-0004ji-3g
	for mharc-qemu-trivial@gnu.org; Tue, 10 Dec 2013 07:13:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1VqMBg-0004Uf-NK
	for qemu-trivial@nongnu.org; Tue, 10 Dec 2013 07:13:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1VqMBb-0007cu-US
	for qemu-trivial@nongnu.org; Tue, 10 Dec 2013 07:13:16 -0500
Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a]:40457)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>)
	id 1VqMBV-0007c3-LU; Tue, 10 Dec 2013 07:13:05 -0500
Received: by mail-wi0-f170.google.com with SMTP id hq4so5217695wib.5
	for <multiple recipients>; Tue, 10 Dec 2013 04:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=e8jbYPJwPfnGfKnn9tclWJBxIZ3YeTs8+ioxq1ntz68=;
	b=ccvVlS00eTWEHgFUkibB9+/yOulpPvdig/VpHsSdtgms8k9w8omB5xclNM7kaHjaDo
	ddfr3jt75dpXHMVEEDQNgUKCFt/ZR+raqXEdpjvnIvtz0Krqyj7/3KTCYDmCq3ta2W94
	QFcdi603rADVP/Ks26jCtk2hKJBgFvZ3NXkRFpSL8EMkE6iWmnHJW9C2IQfHKUfGEXFJ
	GHFvjEJ0FEQtklgnWDQ9Oda52sT2IRaFdCKmCE5sE1Ogy/2SkeLG2bwPkxUig7jTNK93
	fZGSGDvMtkJCBTJO3zvQTqzzLoLWsgDDv2c6sflaEtCL5D/pXvM0JA6Em5fgbSOp/jtG
	bkvw==
X-Received: by 10.194.78.179 with SMTP id c19mr41363wjx.84.1386677584233; Tue,
	10 Dec 2013 04:13:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.19.161 with HTTP; Tue, 10 Dec 2013 04:12:44 -0800 (PST)
In-Reply-To: <1386675153-1147-1-git-send-email-imammedo@redhat.com>
References: <1386675153-1147-1-git-send-email-imammedo@redhat.com>
From: Kewei Yu <keweihk@gmail.com>
Date: Tue, 10 Dec 2013 20:12:44 +0800
Message-ID: <CAJBZ5ePuQmSnXM=mYZrXvpVzu3QCkR20yW9RBen0mdzFhpJpEQ@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary=047d7bfcf6a2d38d9904ed2d088b
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22a
Cc: qemu-trivial@nongnu.org, sw@weilnetz.de, mjt@tls.msk.ru,
	qemu-devel@nongnu.org, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] fix build regression in qxl-render.c
 caused by ac86048
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Dec 2013 12:13:22 -0000

--047d7bfcf6a2d38d9904ed2d088b
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

I=91m wondering why can't I build qemu successful, I have found the first b=
ad
commit with git bisect.
I'm a novice to qemu, I hope I will help you to fix some bugs.
Who can introduce some documents to me for the preparing.

 Faithfully yours
Kewei Yu

Address : Room 4-308, Building FIT of Tsinghua University
Tel         : 13552980886
Msn       : david.yu@hotmail.com


2013/12/10 Igor Mammedov <imammedo@redhat.com>

> fixes regression caused by commit
>   ac86048 trace: Remove trace.h from console.h (less dependencies)
> which makes build fail with:
>
> hw/display/qxl-render.c: In function =91qxl_blit=92:
> hw/display/qxl-render.c:34:5: error: implicit declaration of function
> =91trace_qxl_render_blit=92 [-Werror=3Dimplicit-function-declaration]
>      trace_qxl_render_blit(qxl->guest_primary.qxl_stride,
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/display/qxl-render.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
> index d34b0c4..84f1367 100644
> --- a/hw/display/qxl-render.c
> +++ b/hw/display/qxl-render.c
> @@ -20,6 +20,7 @@
>   */
>
>  #include "qxl.h"
> +#include "trace.h"
>
>  static void qxl_blit(PCIQXLDevice *qxl, QXLRect *rect)
>  {
> --
> 1.8.3.1
>
>
>

--047d7bfcf6a2d38d9904ed2d088b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I=E2=80=98m wondering why can&#39;t I<span style=3D"font-f=
amily:arial,sans-serif;font-size:14px">=C2=A0build qemu </span><font face=
=3D"arial, sans-serif"><span style=3D"font-size:14px">successful, I have fo=
und the first bad commit with git bisect.</span></font><div class=3D"gmail_=
extra">


I&#39;m a novice to qemu, I hope I will help you to fix some bugs.</div><di=
v class=3D"gmail_extra">Who can introduce some documents to me for the prep=
aring.</div><div class=3D"gmail_extra"><br clear=3D"all"><div><div dir=3D"l=
tr">

<font size=3D"3"><span style=3D"line-height:18px;font-size:12px;font-family=
:&#39;lucida Grande&#39;,Verdana"><div>
<span style=3D"color:rgb(51,51,51);font-family:=E5=BE=AE=E8=BD=AF=E9=9B=85=
=E9=BB=91,PMingLiU,Verdana,Arial,Helvetica,sans-serif;font-size:13px;line-h=
eight:22px;background-color:rgb(250,250,250)">Faithfully yours</span></div>=
<div><span style=3D"color:rgb(51,51,51);font-family:=E5=BE=AE=E8=BD=AF=E9=
=9B=85=E9=BB=91,PMingLiU,Verdana,Arial,Helvetica,sans-serif;font-size:13px;=
line-height:22px;background-color:rgb(250,250,250)">Kewei Yu</span></div>


<div><span style=3D"color:rgb(51,51,51);font-family:=E5=BE=AE=E8=BD=AF=E9=
=9B=85=E9=BB=91,PMingLiU,Verdana,Arial,Helvetica,sans-serif;font-size:13px;=
line-height:22px;background-color:rgb(250,250,250)"><br></span></div><div>A=
ddress : Room 4-308, B<span style=3D"line-height:1.5">uilding=C2=A0</span><=
span style=3D"line-height:1.5">FIT</span><span style=3D"line-height:1.5">=
=C2=A0of Tsinghua University</span></div>


<div>Tel =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 13552980886</div><div>Msn =C2=A0 =C2=
=A0 =C2=A0 : <a href=3D"mailto:david.yu@hotmail.com" target=3D"_blank">davi=
d.yu@hotmail.com</a></div></span></font></div></div>
<br><br><div class=3D"gmail_quote">2013/12/10 Igor Mammedov <span dir=3D"lt=
r">&lt;<a href=3D"mailto:imammedo@redhat.com" target=3D"_blank">imammedo@re=
dhat.com</a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204=
);border-left-style:solid;padding-left:1ex">


fixes regression caused by commit<br>
=C2=A0 ac86048 trace: Remove trace.h from console.h (less dependencies)<br>
which makes build fail with:<br>
<br>
hw/display/qxl-render.c: In function =E2=80=98qxl_blit=E2=80=99:<br>
hw/display/qxl-render.c:34:5: error: implicit declaration of function =E2=
=80=98trace_qxl_render_blit=E2=80=99 [-Werror=3Dimplicit-function-declarati=
on]<br>
=C2=A0 =C2=A0 =C2=A0trace_qxl_render_blit(qxl-&gt;guest_primary.qxl_stride,=
<br>
<br>
Signed-off-by: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com" tar=
get=3D"_blank">imammedo@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/display/qxl-render.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c<br>
index d34b0c4..84f1367 100644<br>
--- a/hw/display/qxl-render.c<br>
+++ b/hw/display/qxl-render.c<br>
@@ -20,6 +20,7 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qxl.h&quot;<br>
+#include &quot;trace.h&quot;<br>
<br>
=C2=A0static void qxl_blit(PCIQXLDevice *qxl, QXLRect *rect)<br>
=C2=A0{<br>
<span><font color=3D"#888888">--<br>
1.8.3.1<br>
<br>
<br>
</font></span></blockquote></div><br></div></div>

--047d7bfcf6a2d38d9904ed2d088b--

