Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMaYk-0006bc-Cp
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2019 11:57:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1hMaYh-0006Zv-Hs
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 11:57:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1hMaYg-000093-3R
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 11:57:11 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44380)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1hMaYf-00007x-SN; Fri, 03 May 2019 11:57:10 -0400
Received: by mail-wr1-x444.google.com with SMTP id c5so8469221wrs.11;
	Fri, 03 May 2019 08:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UflN6O/cC2oAHvB7oVstYZTEynT12/71bOY2BTbtmTc=;
	b=KIqV4vqMqRfwL2WVXdvocBRmA86tIwefo5Jbsu/d+st77CwTOXC2xtYFjmHd1NVGl+
	3vZ9WpYh7hvf76WPYnkval1tRdIidfkv+OSyb8qVmYBo6R9V7FK+S0olf2ptTIF/ZW3V
	8T3C9TDM6E0zUGnyWJWRhNsrsRO4dyWsUDTtiXncm/d2FWcIXipTsv/Xiq8KHZaJ7Llt
	yqCcCBO3LjNInHPO8sZeBCMczZtmc27fE4Qyu3KF9Tg11XfspAax0fkSAM005l5atsgP
	qWHfL/t4/73iKL94hurwrZXrtahqoca+JSVR8lWwkz3PVzmIJj5ldFsr2RQ8ExtKyQLm
	yVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UflN6O/cC2oAHvB7oVstYZTEynT12/71bOY2BTbtmTc=;
	b=lzP1N9fwMVOcNHdhmup/aTCrJvx4qQssknz/MyyvYpjNfVuNgizvQFnFtB6OcCbEO1
	SKbfOPo/MLuH4bz3mcINlrX/SZpVMVbTDy6wSNgd7gR4u4dKUNDkFcsH/JHI2bZyI2Lf
	iwpCdIWIucMN21+X0huf7LcbjHLL6nVbon9P1s6z7mZBlxpctIck5KOOvXfS/moGvFeL
	Kei6MTLc9uqLRvOwdAFDjQ3fmZOATx1J+OPIw/hwFSItpK/eSTxEYS4coWiUJpr6O0FA
	JdXM6sIeoslQI8jijgwZ66CgQG8Q1cXKFlswC72xH9c6sW04l6K/jhqZRaA4rkUa2Tm/
	wDjQ==
X-Gm-Message-State: APjAAAWUhz4WzOUaN56LHvQupcCIjwgHQ0F0p6STx8smLukX4VkMvdgt
	TR/cjfVK8hHcQnq+oBIa+P4QtJGYefWhd1/6pHc=
X-Google-Smtp-Source: APXvYqwaYQ0DRJMGMlkKGP6YFUcp4DlWhsKQTYgYhSG0nWPNqHbNbLmnmuQocvWs/c+OQGR1NIOdshT/YW9BsEQPYBE=
X-Received: by 2002:adf:b641:: with SMTP id i1mr7517545wre.288.1556899028217; 
	Fri, 03 May 2019 08:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190503002206.9751-1-driver1998@foxmail.com>
	<20190503003618.10089-1-driver1998@foxmail.com>
	<aa0dce0b-1be0-7247-8f81-c4f265ba0009@redhat.com>
	<CAFEAcA9a8oQHe+cbSotO+BR2-iqgKOBV5Pg4n1aOBY7_tnvqFg@mail.gmail.com>
In-Reply-To: <CAFEAcA9a8oQHe+cbSotO+BR2-iqgKOBV5Pg4n1aOBY7_tnvqFg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 3 May 2019 17:56:56 +0200
Message-ID: <CAJ+F1CL+2YGHMZteU74y9a61rW6fXLDxcb4KGzPBEAL6878Ujg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu trival <qemu-trivial@nongnu.org>, 
	Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>, 
	Cao Jiaxi <driver1998@foxmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: multipart/alternative; boundary="0000000000008736860587fdcd1a"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 1/4] QEMU_PACKED: Remove
 gcc_struct attribute in Windows non x86 targets
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
X-List-Received-Date: Fri, 03 May 2019 15:57:13 -0000

--0000000000008736860587fdcd1a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

Le ven. 3 mai 2019 =C3=A0 17:23, Peter Maydell <peter.maydell@linaro.org> a
=C3=A9crit :

> On Fri, 3 May 2019 at 06:07, Thomas Huth <thuth@redhat.com> wrote:
> >
> > On 03/05/2019 02.36, Cao Jiaxi wrote:
> > > gcc_struct is for x86 only, and it generates an warning on ARM64
> Clang/MinGW targets.
> > >
> > > Signed-off-by: Cao Jiaxi <driver1998@foxmail.com>
> > > ---
> > >  contrib/libvhost-user/libvhost-user.h | 2 +-
> > >  include/qemu/compiler.h               | 2 +-
> > >  scripts/cocci-macro-file.h            | 7 ++++++-
> > >  slirp/src/util.h                      | 2 +-
> > >  4 files changed, 9 insertions(+), 4 deletions(-)
>
> > > diff --git a/slirp/src/util.h b/slirp/src/util.h
> > > index 01f1e0e068..278828fe3f 100644
> > > --- a/slirp/src/util.h
> > > +++ b/slirp/src/util.h
> > > @@ -43,7 +43,7 @@
> > >  #include <netinet/in.h>
> > >  #endif
> > >
> > > -#if defined(_WIN32)
> > > +#if defined(_WIN32) && (defined(__x86_64__) || defined(__i386__))
> > >  # define SLIRP_PACKED __attribute__((gcc_struct, packed))
> > >  #else
> > >  # define SLIRP_PACKED __attribute__((packed))
> > >
> >
> > The slirp code is currently on its way into a separate module, so you
> > might need to provide that hunk to the libslirp folks again... I'm
> > putting the slirp maintainers on CC:, maybe they can pick it up from
> here.
>
> Yes, the slirp module has now landed in master, so this patch
> definitely needs to be split into two. I've kept in my
> target-arm.next tree the parts which are applicable to
> the QEMU repo itself (ie everything except the slirp/ change),
> so we just need a new patch for the slirp submodule part.
>
> Marc-Andr=C3=A9, Samuel -- what's the process for submitting and
> getting reviewed changes to the slirp submodule now it's a
> separate project ?
>

It's hosted on gitlab.freedesktop.org, with some CI. It's fine to send
patches on qemu devel, as long as Samuel or I are in CC. But in the long
term, I think gitlab MR will be favoured (after a while using it, I think
gitlab is better than ML for patches & bug tracking tbh)

>

--0000000000008736860587fdcd1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi<br><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">Le ven. 3 mai 2019 =C3=A0 17:23, Peter Maydell &lt;<=
a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt;=
 a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, 3 May =
2019 at 06:07, Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">thuth@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 03/05/2019 02.36, Cao Jiaxi wrote:<br>
&gt; &gt; gcc_struct is for x86 only, and it generates an warning on ARM64 =
Clang/MinGW targets.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Cao Jiaxi &lt;<a href=3D"mailto:driver1998@foxmail=
.com" target=3D"_blank" rel=3D"noreferrer">driver1998@foxmail.com</a>&gt;<b=
r>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 contrib/libvhost-user/libvhost-user.h | 2 +-<br>
&gt; &gt;=C2=A0 include/qemu/compiler.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt; &gt;=C2=A0 scripts/cocci-macro-file.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 7 ++++++-<br>
&gt; &gt;=C2=A0 slirp/src/util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt; &gt;=C2=A0 4 files changed, 9 insertions(+), 4 deletions(-)<br>
<br>
&gt; &gt; diff --git a/slirp/src/util.h b/slirp/src/util.h<br>
&gt; &gt; index 01f1e0e068..278828fe3f 100644<br>
&gt; &gt; --- a/slirp/src/util.h<br>
&gt; &gt; +++ b/slirp/src/util.h<br>
&gt; &gt; @@ -43,7 +43,7 @@<br>
&gt; &gt;=C2=A0 #include &lt;netinet/in.h&gt;<br>
&gt; &gt;=C2=A0 #endif<br>
&gt; &gt;<br>
&gt; &gt; -#if defined(_WIN32)<br>
&gt; &gt; +#if defined(_WIN32) &amp;&amp; (defined(__x86_64__) || defined(_=
_i386__))<br>
&gt; &gt;=C2=A0 # define SLIRP_PACKED __attribute__((gcc_struct, packed))<b=
r>
&gt; &gt;=C2=A0 #else<br>
&gt; &gt;=C2=A0 # define SLIRP_PACKED __attribute__((packed))<br>
&gt; &gt;<br>
&gt;<br>
&gt; The slirp code is currently on its way into a separate module, so you<=
br>
&gt; might need to provide that hunk to the libslirp folks again... I&#39;m=
<br>
&gt; putting the slirp maintainers on CC:, maybe they can pick it up from h=
ere.<br>
<br>
Yes, the slirp module has now landed in master, so this patch<br>
definitely needs to be split into two. I&#39;ve kept in my<br>
target-arm.next tree the parts which are applicable to<br>
the QEMU repo itself (ie everything except the slirp/ change),<br>
so we just need a new patch for the slirp submodule part.<br>
<br>
Marc-Andr=C3=A9, Samuel -- what&#39;s the process for submitting and<br>
getting reviewed changes to the slirp submodule now it&#39;s a<br>
separate project ?<br></blockquote></div></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">It&#39;s hosted on <a href=3D"http://gitlab.freedesktop.o=
rg">gitlab.freedesktop.org</a>, with some CI. It&#39;s fine to send patches=
 on qemu devel, as long as Samuel or I are in CC. But in the long term, I t=
hink gitlab MR will be favoured (after a while using it, I think gitlab is =
better than ML for patches &amp; bug tracking tbh)</div><div dir=3D"auto"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote></div=
></div></div>

--0000000000008736860587fdcd1a--

