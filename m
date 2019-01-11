Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gi1DH-0000Ra-7d
	for mharc-qemu-trivial@gnu.org; Fri, 11 Jan 2019 13:07:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.m.mail@gmail.com>) id 1ghzhF-00076Q-HI
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2019 11:30:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.m.mail@gmail.com>) id 1ghzhD-0002La-Hi
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2019 11:30:13 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:38451)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
	id 1ghzh4-00025c-Gw; Fri, 11 Jan 2019 11:30:03 -0500
Received: by mail-ot1-x341.google.com with SMTP id e12so13615603otl.5;
	Fri, 11 Jan 2019 08:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t95/Vd5Ok1mVUhsX2TPwJv0Gc/CTKQwz6ckgs/zlsHk=;
	b=S8KycRGF+1nvrt/gxsNmgHom0vSWMyWi0gZCHvNdUPF/OtLZvIJvWmuq1XMf24wBco
	x5TPt9aQWYe4TDScr1Tb+JQDs1yhwZK23wWjkI+pCqWDFsD+EzPQwiyTwn0CDdvxvZRi
	PNmFsL/rv8vntvphFMUSO1wZSmCiIQfwaxeKXGMKZ70NAL8i6VAj4mLTReTbVNAcofNm
	SFXHIlBNVMmGgH0b95lemGhHNLyeLQxbCdQfON8RBtf8Kl55JE4s1wkrD5W4NNa64r2m
	VAPRM6oUdFantafx0k+uYdmmtYZ+W2g1FFKkRE4+Z9AQ5n77QY4Zz/BrbNQuzNbU9azY
	XSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t95/Vd5Ok1mVUhsX2TPwJv0Gc/CTKQwz6ckgs/zlsHk=;
	b=tTo+CNfYTusPYveNOjgWeZCzclw8Kxc8Jc37psIJYHZmc01VfoRD2IQWmPquZRbqO2
	LMswQ+ylqO0IzTMcFvPuXbxcVYTgmy+BnfbZno5uxkYah2Hh2VabuQpFJyS+vi0D5HAr
	TBQUj14tf2a9099k8xwAJpirSGvkTvn0QkQ68ZSMm+MdjdUZ7kweJ6cL3dsTxW+OAjnQ
	w/qrJayToxyrGADPoh7wH7taaC/pz72s6fbxCapXVKemKhOyAmSLl7AgIvw6gfKwlcaV
	sDfzbS81FHSex0UXSA0ZKQUFRd8hC8N1SgZ2rxpRpHRkeyYhoDjsw4I92MlI/v5I57su
	wZMw==
X-Gm-Message-State: AJcUukeBBdjKwW4+rDM1Ya9Vc6SWq/DXfMeOFzkpdWVgvl6F6cwl+0RN
	C1FYavPF+DjpONCJD+erbspo3q/Zw0xVugaroWw=
X-Google-Smtp-Source: ALg8bN4Ln/s+zBraZl8jI75HJMrEmHQdegWUeeIom9X8azNyCHCy2CWfV2H1hBy8utgUAhnr7AAsGT4vBKIFQBv/omU=
X-Received: by 2002:a9d:3f7:: with SMTP id f110mr10525317otf.171.1547224198390;
	Fri, 11 Jan 2019 08:29:58 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6830:1504:0:0:0:0 with HTTP; Fri, 11 Jan 2019 08:29:57
	-0800 (PST)
In-Reply-To: <20190111155555.8270-1-philmd@redhat.com>
References: <20190111155555.8270-1-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 11 Jan 2019 17:29:57 +0100
Message-ID: <CAL1e-=hmJegfALunXYQLCMAutu9RS_61Te9azVpkqhgYCDU-xA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000bbaa09057f3134d3"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
X-Mailman-Approved-At: Fri, 11 Jan 2019 13:07:21 -0500
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] contrib/gitdm: Fix a typo
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
X-List-Received-Date: Fri, 11 Jan 2019 16:30:14 -0000

--000000000000bbaa09057f3134d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Friday, January 11, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
>
wrote:

> Typo comes from upstream git://git.lwn.net/gitdm.git.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  contrib/gitdm/filetypes.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/contrib/gitdm/filetypes.txt b/contrib/gitdm/filetypes.txt
> index 15d6f803b9..165b71b3f9 100644
> --- a/contrib/gitdm/filetypes.txt
> +++ b/contrib/gitdm/filetypes.txt
> @@ -4,7 +4,7 @@
>  # This program is free software; you can redistribute it and/or modify
>  # it under the terms of the GNU General Public License as published by
>  # the Free Software Foundation; either version 2 of the License, or
> -# (at your option  any later version.
> +# (at your option) any later version.
>  #
>  # This program is distributed in the hope that it will be useful,
>  # but WITHOUT ANY WARRANTY; without even the implied warranty of


Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>


> --
> 2.17.2
>
>
>

--000000000000bbaa09057f3134d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, January 11, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hre=
f=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">Typo comes from upstream git://<a href=3D"http://git=
.lwn.net/gitdm.git" target=3D"_blank">git.lwn.net/gitdm.git</a>.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0contrib/gitdm/filetypes.txt | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/contrib/gitdm/filetypes.txt b/contrib/gitdm/filetypes.txt<br>
index 15d6f803b9..165b71b3f9 100644<br>
--- a/contrib/gitdm/filetypes.txt<br>
+++ b/contrib/gitdm/filetypes.txt<br>
@@ -4,7 +4,7 @@<br>
=C2=A0# This program is free software; you can redistribute it and/or modif=
y<br>
=C2=A0# it under the terms of the GNU General Public License as published b=
y<br>
=C2=A0# the Free Software Foundation; either version 2 of the License, or<b=
r>
-# (at your option=C2=A0 any later version.<br>
+# (at your option) any later version.<br>
=C2=A0#<br>
=C2=A0# This program is distributed in the hope that it will be useful,<br>
=C2=A0# but WITHOUT ANY WARRANTY; without even the implied warranty of</blo=
ckquote><div><br></div><div><span style=3D"color:rgb(34,34,34);font-size:14=
px">Reviewed-by: Aleksandar Markovic &lt;</span><a href=3D"mailto:amarkovic=
@wavecomp.com" target=3D"_blank" style=3D"font-size:14px">amarkovic@wavecom=
p.com</a><span style=3D"color:rgb(34,34,34);font-size:14px">&gt;</span><br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
-- <br>
2.17.2<br>
<br>
<br>
</blockquote>

--000000000000bbaa09057f3134d3--

