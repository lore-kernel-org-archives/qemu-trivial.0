Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dJLq7-0007OB-17
	for mharc-qemu-trivial@gnu.org; Fri, 09 Jun 2017 11:28:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dJLq4-0007MS-Cl
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 11:28:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dJLq3-0001MV-Ee
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 11:28:40 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:36353)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1dJLq1-0001Li-0y; Fri, 09 Jun 2017 11:28:37 -0400
Received: by mail-lf0-x244.google.com with SMTP id x81so5369518lfb.3;
	Fri, 09 Jun 2017 08:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CxOQ1R/zPn9/VuTeu2H2flktCKRr2jHz03KI9ClTujs=;
	b=A+X+k+Z28uTkTHIibyRrBzUnlEQESJK0uK+SXnPaCENFkfbAh49pmRAjBM0u+1UOrt
	U6qH7kuB5CvVsd0nngRFnWprl0HuIxrAamI67w2jfmw8MTUDn+Rz8NfKmK3FKXl6coUp
	tm9sevR4pcTa7rgb2MP00IPiOrNoPNcdOIvxPWBIzR4HDXFZeNlVRCSGu1AToIyDyRns
	74Nr5HR5W1xUm7DztdcSrtmBLlLeFKAKGHDHKVBsr0gq4rGllGY+Vlx1uT7fEpVAupSA
	X+ai4RRSbYHqk9V634m4/yG2jzPA+Y2ouZhC1YewDOglJzgVWUmZr72J4WiGjCL1VssH
	XaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CxOQ1R/zPn9/VuTeu2H2flktCKRr2jHz03KI9ClTujs=;
	b=a5Akf+d/JEiWO9PHRsaNfG2OxOTC+GIl5Yjri8uJf/iG6fXyViKufWxf3QD+N+0jjQ
	d1yXvbcXqiPKrj6nhiOEQZM/MsZq340pNhom5XJNFM8YWTXN2JXUz2CF6KQ6vrUMWmDX
	N/1DclJ3xX9HuH1+TRMFtgcEm6dlfZpT1JOZRd9gnHrdYcL5X8OJbDQffjRsPpP4vcHI
	xi8SSSs1hyuRZS9zx1N1J7hAooQffVL5wQdfwtKSYWcnoGOangiLIIc+qG21g7+Nl/Y3
	bMxBr9m0A+13NGUMkvJXaI4iQOUh/vFc/s5KiOKVqeHHriccQ6cAYh0BIB3+o0k1fLrh
	hycg==
X-Gm-Message-State: AKS2vOy1vxB72KqjhkbEyvmwgS6/oUBLG8ohKwbxFBETwElWNRvEHBta
	qS6K8ieRbrmraCC0HdzELc4KxNjVBw==
X-Received: by 10.25.145.25 with SMTP id t25mr661lfd.139.1497022115595; Fri,
	09 Jun 2017 08:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <20170609152017.7286-1-eblake@redhat.com>
	<20170609152017.7286-2-eblake@redhat.com>
In-Reply-To: <20170609152017.7286-2-eblake@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 09 Jun 2017 15:28:24 +0000
Message-ID: <CAJ+F1CJL04MkrYmnhM3rLaSAuEXYo7JsZwyDLeXA35bV6dvqqA@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Content-Type: multipart/alternative; boundary="94eb2c1cd3366bcfd10551889f41"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] qobject: Update
 coccinelle script to catch Q{INC, DEC}REF
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
X-List-Received-Date: Fri, 09 Jun 2017 15:28:41 -0000

--94eb2c1cd3366bcfd10551889f41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Jun 9, 2017 at 7:20 PM Eric Blake <eblake@redhat.com> wrote:

> A recent patch submission was about to use qobject_decref(QOBJECT(E)),
> even though we already have QDECREF(E) for that purpose.  While our
> tree is currently free from the longhand form, we might as well update
>

Oh?

 $ git grep 'object_unref(OBJECT('  | wc -l
152

our coccinelle script to catch any future relapses.
>

sadly, coccinelle is unabarebly slow on my machine, not easy to grasp, and
thereby fails to catch a lot of cases.. I am looking at alternative from
clang tools/lib, by curiosity.


>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  scripts/coccinelle/qobject.cocci | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/scripts/coccinelle/qobject.cocci
> b/scripts/coccinelle/qobject.cocci
> index 97703a4..656dc3e 100644
> --- a/scripts/coccinelle/qobject.cocci
> +++ b/scripts/coccinelle/qobject.cocci
> @@ -3,6 +3,12 @@
>  expression Obj, Key, E;
>  @@
>  (
> +- qobject_incref(QOBJECT(E));
> ++ QINCREF(E);
> +|
> +- qobject_decref(QOBJECT(E));
> ++ QDECREF(E);
> +|
>  - qdict_put_obj(Obj, Key, QOBJECT(E));
>  + qdict_put(Obj, Key, E);
>  |
> --
> 2.9.4
>
>
> --
Marc-Andr=C3=A9 Lureau

--94eb2c1cd3366bcfd10551889f41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<br><div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
>On Fri, Jun 9, 2017 at 7:20 PM Eric Blake &lt;<a href=3D"mailto:eblake@red=
hat.com">eblake@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">A recent patch submission was about to use qobject_decref(QOBJECT(E)=
),<br>
even though we already have QDECREF(E) for that purpose.=C2=A0 While our<br=
>
tree is currently free from the longhand form, we might as well update<br><=
/blockquote><div><br></div><div>Oh?<br><br>=C2=A0$ git grep &#39;object_unr=
ef(OBJECT(&#39;=C2=A0 | wc -l<br>152<br><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">
our coccinelle script to catch any future relapses.<br></blockquote><div><b=
r></div><div>sadly, coccinelle is unabarebly slow on my machine, not easy t=
o grasp, and thereby fails to catch a lot of cases.. I am looking at altern=
ative from clang tools/lib, by curiosity.<br>=C2=A0<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
<br>
Signed-off-by: Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com" target=
=3D"_blank">eblake@redhat.com</a>&gt;<br>
---<br>
=C2=A0scripts/coccinelle/qobject.cocci | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/scripts/coccinelle/qobject.cocci b/scripts/coccinelle/qobject.=
cocci<br>
index 97703a4..656dc3e 100644<br>
--- a/scripts/coccinelle/qobject.cocci<br>
+++ b/scripts/coccinelle/qobject.cocci<br>
@@ -3,6 +3,12 @@<br>
=C2=A0expression Obj, Key, E;<br>
=C2=A0@@<br>
=C2=A0(<br>
+- qobject_incref(QOBJECT(E));<br>
++ QINCREF(E);<br>
+|<br>
+- qobject_decref(QOBJECT(E));<br>
++ QDECREF(E);<br>
+|<br>
=C2=A0- qdict_put_obj(Obj, Key, QOBJECT(E));<br>
=C2=A0+ qdict_put(Obj, Key, E);<br>
=C2=A0|<br>
--<br>
2.9.4<br>
<br>
<br>
</blockquote></div></div></div><div dir=3D"ltr">-- <br></div><div data-smar=
tmail=3D"gmail_signature"><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div>=
</div>

--94eb2c1cd3366bcfd10551889f41--

