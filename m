Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgsQI-0003fE-4a
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jun 2019 11:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50236)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <liq3ea@gmail.com>) id 1hgsQB-0003e8-79
 for qemu-trivial@nongnu.org; Fri, 28 Jun 2019 11:04:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liq3ea@gmail.com>) id 1hgsQ6-0005oB-Dq
 for qemu-trivial@nongnu.org; Fri, 28 Jun 2019 11:04:15 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:42891)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <liq3ea@gmail.com>)
 id 1hgsQ5-0005nI-H2; Fri, 28 Jun 2019 11:04:10 -0400
Received: by mail-ot1-x341.google.com with SMTP id l15so6250455otn.9;
 Fri, 28 Jun 2019 08:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SLWVSstXS2Sofga0QanyOrm+IhhXN9pkZsd/wfQpgOo=;
 b=pelwgNvqYUzDrXr9D6RVTNL5Usgn5RofRo+IPbJINngs5VAGwX7FPTMwi24EIFkTxS
 AIuL+dPeNfFV1nwVUQiXBsF+GeiWE/eKJGHnaouHUiF3wdJh7j7vtujbOCDVAAJ3vjRK
 sdGVvieku/KGXKlUP6QOf5HdhfjuXYeFYRGpxeJzwE0UsOMdnV0j/0kgb8E7Bwn9V1Xd
 Cdfo9QUA2FOmCiSSbDypeY5nxg509Y/jcLR+SxXbCwCToYfpdYm/Q17sBk9WeSCyzRxY
 H9W6vbERlYKmniEW5bTbCWIObgckmhjdVBzTgbvpiwX4PBRT9d+J34TST6dsvG+RDbA2
 nZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SLWVSstXS2Sofga0QanyOrm+IhhXN9pkZsd/wfQpgOo=;
 b=W0AXUK4QN8GYc9UB9rqInFLVkfCam2ezvH8Pgjt64w7LWJm1go7rQaBGDgXOyVvp0n
 C2wf4RfIhoBo1+hMOUtbeKUwfb08N1c3wvnfdbfnP0QD4z7FiJ0MfepP3vEGzdQ7FLVR
 ptCfawzNjfWNWAbqGfR2asNHj4Ojnd7+yD2+NNTdzu+vhZA6pa51/TYBUARhoHSRvRtp
 avT1Rhh3ds0fFJvHWS+JyWJv2/4YFslVI1UjaaNibK632tUxQ7iJ01gChYN0bduHppbc
 kCyz5FgSa2gkBjqotMa2/AnuJmGFIoEfz3dwuqX3WrZzf8IaD2pwuyLxyZeNqtYMrpod
 PK2w==
X-Gm-Message-State: APjAAAUuSPOcpYZBapYYgy79W0OU4GhX7n0hvyVh5I1VcDMypz9JZtJO
 BIXlGoRdfjF+ewym2zTdnxPXM4pgGwtDUCeUvXc=
X-Google-Smtp-Source: APXvYqwG4azZQ9gwztBNx7MTwpdqyGOOV/G48NInC5WHGO6dUpaaEEd98nQvMiZTGc7CCiTBnNrSWTxGF/q6OhS80xg=
X-Received: by 2002:a05:6830:1291:: with SMTP id
 z17mr8861511otp.194.1561734248526; 
 Fri, 28 Jun 2019 08:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <1561727317-30655-1-git-send-email-liam.merwick@oracle.com>
In-Reply-To: <1561727317-30655-1-git-send-email-liam.merwick@oracle.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Fri, 28 Jun 2019 23:03:32 +0800
Message-ID: <CAKXe6S+iv8ND-+w0DWXq9t61xkNFW2U19fJQTykaV_GXEZy27A@mail.gmail.com>
To: Liam Merwick <liam.merwick@oracle.com>
Cc: qemu-trivial@nongnu.org, Qemu Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000001df615058c6397e7"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] docs/devel/testing: Fix
 typo in dockerfile path
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
X-List-Received-Date: Fri, 28 Jun 2019 15:04:18 -0000

--0000000000001df615058c6397e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Liam Merwick <liam.merwick@oracle.com> =E4=BA=8E2019=E5=B9=B46=E6=9C=8828=
=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=889:38=E5=86=99=E9=81=93=EF=BC=
=9A

> Signed-off-by: Liam Merwick <liam.merwick@oracle.com>
>

Reviewed-by: Li Qiang <liq3ea@gmail.com>


> ---
>  docs/devel/testing.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index da2d0fc9646f..3ef50a61db4d 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -327,7 +327,7 @@ Images
>  ------
>
>  Along with many other images, the ``min-glib`` image is defined in a
> Dockerfile
> -in ``tests/docker/dockefiles/``, called ``min-glib.docker``. ``make
> docker``
> +in ``tests/docker/dockerfiles/``, called ``min-glib.docker``. ``make
> docker``
>  command will list all the available images.
>
>  To add a new image, simply create a new ``.docker`` file under the
> --
> 1.8.3.1
>
>
>

--0000000000001df615058c6397e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Liam Merwick &lt;<a href=3D"mailto:li=
am.merwick@oracle.com">liam.merwick@oracle.com</a>&gt; =E4=BA=8E2019=E5=B9=
=B46=E6=9C=8828=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=889:38=E5=86=99=
=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Signed-off-by: Liam Merwick &lt;<a href=3D"mailto:liam.merwick@oracle.co=
m" target=3D"_blank">liam.merwick@oracle.com</a>&gt;<br></blockquote><div><=
br></div><div>Reviewed-by: Li Qiang &lt;<a href=3D"mailto:liq3ea@gmail.com"=
>liq3ea@gmail.com</a>&gt;<br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
---<br>
=C2=A0docs/devel/testing.rst | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst<br>
index da2d0fc9646f..3ef50a61db4d 100644<br>
--- a/docs/devel/testing.rst<br>
+++ b/docs/devel/testing.rst<br>
@@ -327,7 +327,7 @@ Images<br>
=C2=A0------<br>
<br>
=C2=A0Along with many other images, the ``min-glib`` image is defined in a =
Dockerfile<br>
-in ``tests/docker/dockefiles/``, called ``min-glib.docker``. ``make docker=
``<br>
+in ``tests/docker/dockerfiles/``, called ``min-glib.docker``. ``make docke=
r``<br>
=C2=A0command will list all the available images.<br>
<br>
=C2=A0To add a new image, simply create a new ``.docker`` file under the<br=
>
-- <br>
1.8.3.1<br>
<br>
<br>
</blockquote></div></div>

--0000000000001df615058c6397e7--

