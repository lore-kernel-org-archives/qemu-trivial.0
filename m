Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qfjkv-0002LF-Ad
	for mharc-qemu-trivial@gnu.org; Mon, 11 Sep 2023 12:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1qfjku-0002Kr-1n
 for qemu-trivial@nongnu.org; Mon, 11 Sep 2023 12:27:20 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1qfjkr-0007Ca-0L
 for qemu-trivial@nongnu.org; Mon, 11 Sep 2023 12:27:19 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so582520866b.2
 for <qemu-trivial@nongnu.org>; Mon, 11 Sep 2023 09:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1694449634; x=1695054434;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gJrkMv3DX288iFZdqP3nlpaVlhqOfIIY51ZbF5RGet8=;
 b=APOXqSADYngGHhvmcd7md7tpfh6N0Yc5oSJxYVzgb4GozcLXd6hBMagCify8eqB1AY
 FaQ7mT0yQutYZ76IJsm0Ei99WK6xDXyNGNf41LOd7NASt9XyzxrAzeJSs55dGRKiJE6x
 xj2OYUlQVTshwhPIEIskNmZexvvQ2opo2Oh2kI25zm0qTWOQmqnQdReHW0E6M6j6ymI5
 XmSBCzqWG2ogYyyq61Ssesl0depVwlVjJ/hUKKm8JXLYl/OdGBSJp+ED+lwP3qJlrUXP
 97R2qX4nSl1LImXeI+onnuCUtx3GAiHeKjoscIHiey2zc3WGFkskFHqRFfStrQYQ5/uC
 cwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694449634; x=1695054434;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gJrkMv3DX288iFZdqP3nlpaVlhqOfIIY51ZbF5RGet8=;
 b=JBl1TJwkDjEQcTNo+GGQnOxOSd0Kr1RsrzSq31flN787PS9y7eB+6W/csiEbDTIGQ/
 9GUaHCCE9oj5rxJpv+lDgduGlhf0QV5obkwKdomZPg+9+EPepCq3ZCd6yOaqB9c29hor
 hBa8VTKqUi8kkeN7aCcYHp+8VBcOA7m82ZyVaYG9cJJFEBHIMpAUSwjkwoEDDnD/vzM6
 CIOlBv/ehilut5It7VoxERlQnYKHfnoURAmaQRxG0w8YWyBSzPKHuZTQThIWWhSb88ot
 K78Ne5MgzGZxBfcH4FjhaJHuXmnnYrcTbeOSkGImQSjPTmGczIhAqKdvIi8s9KEi7KYT
 70UA==
X-Gm-Message-State: AOJu0YzpmBHKUnVOvB0VcgcYy6tK1jBYtAgImxtBNoECXv0souG11edx
 qjJxczZmUt4UbgY8SHygCWSy4fgQj69dsixSIOkA2aR2dmoZj3VZ
X-Google-Smtp-Source: AGHT+IF6UO+cKJK93UgifLvFGBFq0Sd8eRwB/L3Muq1K8+PALbTJ8qqrr0SB7nP9qf1wG5QFnGgH7ewPKyd6f2P/Wt0=
X-Received: by 2002:a17:907:75e6:b0:9a2:16e2:35a with SMTP id
 jz6-20020a17090775e600b009a216e2035amr7686638ejc.62.1694449634457; Mon, 11
 Sep 2023 09:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230909131258.354675-1-mjt@tls.msk.ru>
 <20230909131258.354675-2-mjt@tls.msk.ru>
 <adda04f3-d19b-a29f-6fbd-6d3d2ccf6357@tls.msk.ru>
 <e7792841-4ca3-1a14-ecc8-1bfd1afed2e4@FreeBSD.org>
In-Reply-To: <e7792841-4ca3-1a14-ecc8-1bfd1afed2e4@FreeBSD.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 11 Sep 2023 10:27:02 -0600
Message-ID: <CANCZdfqbHrU=_XM+fVWYez57xOUhO6_Znp9f5KgZAceG1+Us5w@mail.gmail.com>
Subject: Re: [PATCH 1/7] bsd-user: spelling fixes
To: Kyle Evans <kevans@freebsd.org>
Cc: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000008d4aea060517cc51"
Received-SPF: none client-ip=2a00:1450:4864:20::62a;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Sep 2023 16:27:20 -0000

--0000000000008d4aea060517cc51
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 11, 2023, 10:12 AM Kyle Evans <kevans@freebsd.org> wrote:

> On 9/11/23 03:39, Michael Tokarev wrote:
> > Warner, Kyle, can you take a look please?
> >
> >
> https://patchew.org/QEMU/20230909131258.354675-1-mjt@tls.msk.ru/20230909131258.354675-2-mjt@tls.msk.ru/
> >
>
> Hmm, the original for this doesn't seem to have landed in my inbox, but
> these all look OK to me.
>


Same. None of these will cause a conflict. I'll make sure any out of tree
files are updated... though cut and paste rarely flows from these files.


> > 09.09.2023 16:12, Michael Tokarev:
> >> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> >> ---
> >>   bsd-user/errno_defs.h                | 2 +-
> >>   bsd-user/freebsd/target_os_siginfo.h | 2 +-
> >>   bsd-user/freebsd/target_os_stack.h   | 4 ++--
> >>   bsd-user/freebsd/target_os_user.h    | 2 +-
> >>   bsd-user/qemu.h                      | 2 +-
> >>   bsd-user/signal-common.h             | 4 ++--
> >>   bsd-user/signal.c                    | 6 +++---
> >>   7 files changed, 11 insertions(+), 11 deletions(-)
> >
>
> Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

Thanks,
>
> Kyle Evans
>
>

--0000000000008d4aea060517cc51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Sep 11, 2023, 10:12 AM Kyle Evans &lt;<a href=
=3D"mailto:kevans@freebsd.org" target=3D"_blank" rel=3D"noreferrer">kevans@=
freebsd.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 9/11/=
23 03:39, Michael Tokarev wrote:<br>
&gt; Warner, Kyle, can you take a look please?<br>
&gt; <br>
&gt; <a href=3D"https://patchew.org/QEMU/20230909131258.354675-1-mjt@tls.ms=
k.ru/20230909131258.354675-2-mjt@tls.msk.ru/" rel=3D"noreferrer noreferrer =
noreferrer" target=3D"_blank">https://patchew.org/QEMU/20230909131258.35467=
5-1-mjt@tls.msk.ru/20230909131258.354675-2-mjt@tls.msk.ru/</a><br>
&gt; <br>
<br>
Hmm, the original for this doesn&#39;t seem to have landed in my inbox, but=
 <br>
these all look OK to me.<br></blockquote></div></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Same. None of these wil=
l cause a conflict. I&#39;ll make sure any out of tree files are updated...=
 though cut and paste rarely flows from these files.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
&gt; 09.09.2023 16:12, Michael Tokarev:<br>
&gt;&gt; Signed-off-by: Michael Tokarev &lt;<a href=3D"mailto:mjt@tls.msk.r=
u" rel=3D"noreferrer noreferrer" target=3D"_blank">mjt@tls.msk.ru</a>&gt;<b=
r>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 bsd-user/errno_defs.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-<br>
&gt;&gt; =C2=A0 bsd-user/freebsd/target_os_siginfo.h | 2 +-<br>
&gt;&gt; =C2=A0 bsd-user/freebsd/target_os_stack.h=C2=A0=C2=A0 | 4 ++--<br>
&gt;&gt; =C2=A0 bsd-user/freebsd/target_os_user.h=C2=A0=C2=A0=C2=A0 | 2 +-<=
br>
&gt;&gt; =C2=A0 bsd-user/qemu.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 2 +-<br>
&gt;&gt; =C2=A0 bsd-user/signal-common.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--<br>
&gt;&gt; =C2=A0 bsd-user/signal.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
6 +++---<br>
&gt;&gt; =C2=A0 7 files changed, 11 insertions(+), 11 deletions(-)<br>
&gt; <br>
<br>
Reviewed-by: Kyle Evans &lt;kevans@FreeBSD.org&gt;<br></blockquote></div></=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Reviewed-by: Warner Losh =
&lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"_blank" rel=3D"noreferrer">=
imp@bsdimp.com</a>&gt;</div><div dir=3D"auto"><br></div><div dir=3D"auto"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Thanks,<br>
<br>
Kyle Evans<br>
<br>
</blockquote></div></div></div>

--0000000000008d4aea060517cc51--

