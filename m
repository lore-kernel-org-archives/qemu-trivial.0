Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W42YH-0003k3-QP
	for mharc-qemu-trivial@gnu.org; Fri, 17 Jan 2014 01:05:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42731)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1W42YF-0003cl-Oh
	for qemu-trivial@nongnu.org; Fri, 17 Jan 2014 01:05:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1W42YF-0000Ny-00
	for qemu-trivial@nongnu.org; Fri, 17 Jan 2014 01:05:07 -0500
Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236]:61137)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>)
	id 1W42YC-0000Gt-V5; Fri, 17 Jan 2014 01:05:05 -0500
Received: by mail-wi0-f182.google.com with SMTP id ex4so257305wid.3
	for <multiple recipients>; Thu, 16 Jan 2014 22:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=VVQuuM2j2Kk6J3bu0XpEUn6P8rvrVwuRzYFub2ACLVI=;
	b=Dmwz3UwLiuhSDxqMGBuyoHco7UZQyGtG+O6d/RPaqtna9wXU4DUmgpA9wf4Gp+agc1
	hfKhuINYzOI8HCw4N2vmlLBebwvbo5ejPpExDxvgtDnSq+Ih/cmLooO12ckwDf6rfrDw
	Nk3VMQQ+W2jAR7RK/zarVSaoXkn66kd3TWOI2udGPqcoYoxDTfazx5Snv3sRrvT+wluL
	NfIRDZMjXe/3Uxpz/v6wuDKfH6Nj7+8VDkYkTqR2VyVZeS2WkL1aPj2m6RcetLa0cJgL
	7DCOF/vfxnsEJ1ioBXWszeVXxiX5LG7EKBBbkvR8MNS+FNPFEZk4vkvFjIokdjtAJdUp
	QnyQ==
X-Received: by 10.194.22.129 with SMTP id d1mr121731wjf.22.1389938704072; Thu,
	16 Jan 2014 22:05:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.2.238 with HTTP; Thu, 16 Jan 2014 22:04:43 -0800 (PST)
In-Reply-To: <1389893719-16336-12-git-send-email-mjt@msgid.tls.msk.ru>
References: <1389893719-16336-1-git-send-email-mjt@msgid.tls.msk.ru>
	<1389893719-16336-12-git-send-email-mjt@msgid.tls.msk.ru>
From: Kewei Yu <keweihk@gmail.com>
Date: Fri, 17 Jan 2014 14:04:43 +0800
Message-ID: <CAJBZ5eMFESxEdXe8Uzy2upezYXy-9qdCr5_dqftADmtohi=nLA@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: multipart/alternative; boundary=047d7b5d5868b746f004f0245204
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::236
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	aliguori@amazon.com
Subject: Re: [Qemu-trivial] [PULL 11/11] vl: Add a blank space between the
	variable and '='
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
X-List-Received-Date: Fri, 17 Jan 2014 06:05:08 -0000

--047d7b5d5868b746f004f0245204
Content-Type: text/plain; charset=ISO-8859-1

Thanks, I will send patch with prefix to indicate which file of the
codebase after this.

Regard
Kewei


2014/1/17 Michael Tokarev <mjt@tls.msk.ru>

> From: Kewei Yu <keweihk@gmail.com>
>
> Signed-off-by: Kewei Yu <keweihk@gmail.com>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  vl.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/vl.c b/vl.c
> index 7f4fe0d..2b47866 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -2925,7 +2925,7 @@ int main(int argc, char **argv, char **envp)
>
>      bdrv_init_with_whitelist();
>
> -    autostart= 1;
> +    autostart = 1;
>
>      /* first pass of option parsing */
>      optind = 1;
> --
> 1.7.10.4
>
>

--047d7b5d5868b746f004f0245204
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, I will send patch with prefix to indicate which fi=
le <font face=3D"arial, sans-serif"><span style=3D"font-size:14px">of the c=
odebase after this.</span></font></div><div class=3D"gmail_extra"><br clear=
=3D"all">

<div><div dir=3D"ltr"><font size=3D"3"><span style=3D"color:rgb(0,0,0);font=
-family:&#39;lucida Grande&#39;,Verdana;font-size:12px;line-height:18px"></=
span></font><div>Regard<br></div><div>Kewei</div></div></div>
<br><br><div class=3D"gmail_quote">2014/1/17 Michael Tokarev <span dir=3D"l=
tr">&lt;<a href=3D"mailto:mjt@tls.msk.ru" target=3D"_blank">mjt@tls.msk.ru<=
/a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">

From: Kewei Yu &lt;<a href=3D"mailto:keweihk@gmail.com">keweihk@gmail.com</=
a>&gt;<br>
<br>
Signed-off-by: Kewei Yu &lt;<a href=3D"mailto:keweihk@gmail.com">keweihk@gm=
ail.com</a>&gt;<br>
Signed-off-by: Michael Tokarev &lt;<a href=3D"mailto:mjt@tls.msk.ru">mjt@tl=
s.msk.ru</a>&gt;<br>
---<br>
=A0vl.c | =A0 =A02 +-<br>
=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/vl.c b/vl.c<br>
index 7f4fe0d..2b47866 100644<br>
--- a/vl.c<br>
+++ b/vl.c<br>
@@ -2925,7 +2925,7 @@ int main(int argc, char **argv, char **envp)<br>
<br>
=A0 =A0 =A0bdrv_init_with_whitelist();<br>
<br>
- =A0 =A0autostart=3D 1;<br>
+ =A0 =A0autostart =3D 1;<br>
<br>
=A0 =A0 =A0/* first pass of option parsing */<br>
=A0 =A0 =A0optind =3D 1;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.10.4<br>
<br>
</font></span></blockquote></div><br></div>

--047d7b5d5868b746f004f0245204--

