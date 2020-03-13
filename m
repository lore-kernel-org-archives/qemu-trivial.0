Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCu7A-0007Dj-VY
	for mharc-qemu-trivial@gnu.org; Fri, 13 Mar 2020 19:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39974)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yuanzi@google.com>) id 1jCu78-0007DC-8x
 for qemu-trivial@nongnu.org; Fri, 13 Mar 2020 19:53:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yuanzi@google.com>) id 1jCu75-0003K2-T6
 for qemu-trivial@nongnu.org; Fri, 13 Mar 2020 19:53:14 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:43676)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <yuanzi@google.com>) id 1jCu75-0003BX-LF
 for qemu-trivial@nongnu.org; Fri, 13 Mar 2020 19:53:11 -0400
Received: by mail-oi1-x242.google.com with SMTP id p125so11332025oif.10
 for <qemu-trivial@nongnu.org>; Fri, 13 Mar 2020 16:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4qgvcBvsvxDXUIWoO/wStgaB8uHC5dmwflQZN278YUQ=;
 b=bPf3KX4Xydh9j2K9GUYotdqrRqvKfQxy+To3dATfLYUaw2i/c6Q3X2dYavVdfcYYgj
 6Jtz0Tq1gQiIZJP4jC5yOSQi7k/WTSyFWnXc2U8JyYVZaQA8vhb7ItwCPY+Z7YBNG+oP
 e/rZ0PfliAanj4d2ZR2n/X6TE86wqnSbfy+XBEwWGro6tIeUCbnbAAjHq9PY9JuQMtfS
 TvnOW58ZLlQ0WHPJGP3lLGzmzSdVLEFxQKutghcDbvFuZu9uiJbb83liepH+WQmQ+BfT
 CGr7q+TlJaEtLCBDYlsm95H8oQxYNsXAMcHwIJlb2I53HCjjRnx0VqJduiNWzeZIiFkS
 wTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4qgvcBvsvxDXUIWoO/wStgaB8uHC5dmwflQZN278YUQ=;
 b=ebwznC2V7Jd6KzlTRS5HDPGYBLtUes9MJf3dqsGZ0sbkZxle5jYQud/D66f6OlXK0G
 F5Zo+ndxiNEBufgm5F7YZQkRYJx8EEWReEN4xUbvT4tEx3MxOnqrT8B0ZXISHF2sP+lF
 F5e161SngXrYCMhuxMN4p9yfKTiZAFvgigEhhJ6/tN9tDixx0mnNxMT5WE15Zr1mV0+c
 CXrQSD//pbItyg7OPH//UvgodXJPaGd2af0NGynjFQ8fB6Jwi5MH+hnXDwWysVfwDFtj
 DaVZFpF5+xElufWRgjbTad5Wsy+2mKygJu0r0wkDjCfUB/tk16fVa9/50jYGAr3xT+WD
 GfrQ==
X-Gm-Message-State: ANhLgQ0fA2HjRDPpGSBCTmqoqiK4ZshiV55RhkUC/lFEuuyy6HJLVIgA
 9zFlIi8JTqvho8NmTWDck4fqHaynHe7xOTrzbfS6jQ==
X-Google-Smtp-Source: ADFU+vv20X3XOYWAK8HLABJQVEO5xWI+eMM4RDKWBqKsyFX4CZQtN+pZZho90suHspwgAQAP1XE1Ku39b6tHhS6Iugg=
X-Received: by 2002:aca:b4c3:: with SMTP id d186mr8787914oif.131.1584143589805; 
 Fri, 13 Mar 2020 16:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200313002813.3857-1-yuanzi@google.com>
 <d7185952-521e-8ad5-30fb-cea86e356e5e@vivier.eu>
In-Reply-To: <d7185952-521e-8ad5-30fb-cea86e356e5e@vivier.eu>
From: Lirong Yuan <yuanzi@google.com>
Date: Fri, 13 Mar 2020 16:52:58 -0700
Message-ID: <CADjx4C+BdQGk=zAfO+dFanJoucoWrpENQaGo6_tPVSXi0MuM+A@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Update TASK_UNMAPPED_BASE for aarch64
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Riku Voipio <riku.voipio@iki.fi>, Shu-Chun Weng <scw@google.com>,
 Josh Kunz <jkz@google.com>
Content-Type: multipart/alternative; boundary="000000000000f1ed2805a0c52b14"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
X-List-Received-Date: Fri, 13 Mar 2020 23:53:15 -0000

--000000000000f1ed2805a0c52b14
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2020 at 2:45 PM Laurent Vivier <laurent@vivier.eu> wrote:

> Le 13/03/2020 =C3=A0 01:28, Lirong Yuan a =C3=A9crit :
> > This change updates TASK_UNMAPPED_BASE (the base address for guest
> programs) for aarch64. It is needed to allow qemu to work with Thread
> Sanitizer (TSan), which has specific boundary definitions for memory
> mappings on different platforms:
> >
> https://github.com/llvm/llvm-project/blob/master/compiler-rt/lib/tsan/rtl=
/tsan_platform.h
> >
> > Signed-off-by: Lirong Yuan <yuanzi@google.com>
> > ---
> >  linux-user/mmap.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> > index 8685f02e7e..e378033797 100644
> > --- a/linux-user/mmap.c
> > +++ b/linux-user/mmap.c
> > @@ -184,7 +184,11 @@ static int mmap_frag(abi_ulong real_start,
> >  }
> >
> >  #if HOST_LONG_BITS =3D=3D 64 && TARGET_ABI_BITS =3D=3D 64
> > +#ifdef TARGET_AARCH64
> > +# define TASK_UNMAPPED_BASE  0x5500000000
> > +#else
> >  # define TASK_UNMAPPED_BASE  (1ul << 38)
> > +#endif
> >  #else
> >  # define TASK_UNMAPPED_BASE  0x40000000
> >  #endif
> >
>
> Applied to my linux-user branch.
>
> Thanks,
> Laurent
>

Great, thanks a lot! :)

--000000000000f1ed2805a0c52b14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 13, 2020 at 2:45 PM Laurent V=
ivier &lt;<a href=3D"mailto:laurent@vivier.eu">laurent@vivier.eu</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Le 13/03/20=
20 =C3=A0 01:28, Lirong Yuan a =C3=A9crit=C2=A0:<br>
&gt; This change updates TASK_UNMAPPED_BASE (the base address for guest pro=
grams) for aarch64. It is needed to allow qemu to work with Thread Sanitize=
r (TSan), which has specific boundary definitions for memory mappings on di=
fferent platforms:<br>
&gt; <a href=3D"https://github.com/llvm/llvm-project/blob/master/compiler-r=
t/lib/tsan/rtl/tsan_platform.h" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/llvm/llvm-project/blob/master/compiler-rt/lib/tsan/rtl/tsan_pl=
atform.h</a><br>
&gt; <br>
&gt; Signed-off-by: Lirong Yuan &lt;<a href=3D"mailto:yuanzi@google.com" ta=
rget=3D"_blank">yuanzi@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 linux-user/mmap.c | 4 ++++<br>
&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt; <br>
&gt; diff --git a/linux-user/mmap.c b/linux-user/mmap.c<br>
&gt; index 8685f02e7e..e378033797 100644<br>
&gt; --- a/linux-user/mmap.c<br>
&gt; +++ b/linux-user/mmap.c<br>
&gt; @@ -184,7 +184,11 @@ static int mmap_frag(abi_ulong real_start,<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #if HOST_LONG_BITS =3D=3D 64 &amp;&amp; TARGET_ABI_BITS =3D=3D 6=
4<br>
&gt; +#ifdef TARGET_AARCH64<br>
&gt; +# define TASK_UNMAPPED_BASE=C2=A0 0x5500000000<br>
&gt; +#else<br>
&gt;=C2=A0 # define TASK_UNMAPPED_BASE=C2=A0 (1ul &lt;&lt; 38)<br>
&gt; +#endif<br>
&gt;=C2=A0 #else<br>
&gt;=C2=A0 # define TASK_UNMAPPED_BASE=C2=A0 0x40000000<br>
&gt;=C2=A0 #endif<br>
&gt; <br>
<br>
Applied to my linux-user branch.<br>
<br>
Thanks,<br>
Laurent<br></blockquote><div><br></div><div>Great, thanks a lot! :)=C2=A0</=
div></div></div>

--000000000000f1ed2805a0c52b14--

