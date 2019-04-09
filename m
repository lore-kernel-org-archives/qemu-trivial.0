Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hDuYo-00023u-TZ
	for mharc-qemu-trivial@gnu.org; Tue, 09 Apr 2019 13:29:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aruna.15@cse.mrt.ac.lk>) id 1hDtyC-0005CX-Nr
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2019 12:51:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aruna.15@cse.mrt.ac.lk>) id 1hDtyB-0005Yp-86
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2019 12:51:36 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:35779)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aruna.15@cse.mrt.ac.lk>)
	id 1hDtyA-0005YM-Qt
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2019 12:51:35 -0400
Received: by mail-wm1-x343.google.com with SMTP id y197so4174963wmd.0
	for <qemu-trivial@nongnu.org>; Tue, 09 Apr 2019 09:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cse.mrt.ac.lk; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=utSakDnHBza1vNblMwJKHIgfAMO7KSjE6Rsldr6W6FI=;
	b=XCQH+Zi754WhJRYYXAbgDQ0AHwP+Vp2W2MzUyQwj83UzDaoLfJ7y0MlYgMqQT2DmZw
	kbYF1OHAqIaoUVlZeu/qbJBopbGO/sOnmNGZofV/tUXOUaSgQL8oVlUII4sgLFxQVHUb
	6gPUOud9yOHy//FUqrl44cVG3GjBMNofJBfSDHKZn9LbD6lJw3FWMAjOEZYDa3zsT/Wj
	ZvBpx6slExRsr5bvsMObOiEywslZLNwX+my70pFqg+cltsWaXGGxHenIYPrhFmH4TT54
	8f90v3C052/tPrR6o//D/F83M1bPUop6UX03b/O9lGiLjWIwDBL1L4wzKn1p0BS6Tik8
	wNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=utSakDnHBza1vNblMwJKHIgfAMO7KSjE6Rsldr6W6FI=;
	b=d5mtG3haseXXaCCZgqApQ+vOvVwPnb4zjwFIpXh8gEe2v/MXaikzJR8UwKhLhXdfT0
	45dRYTiX5/3TZZY5zFJ/FYgcIQdVyqyAj+wzRMylC9Rk2tIyXofL5eZdyucgZbnF7stw
	ms01XmAQ2sePACli70N1A4Tpz29DMHDdiooQ9wvlgQtnGv8ynC/lwHX0JO1bGfQjricJ
	wwzTs6fDyybTMXoCq+02Yddr7zdzv8LcfEKRLtZpsBsa6jEVM9cnIrZYbbK4Qbw5B43F
	gtn9S5pK7kkafRBMyxE7AX5vKKmuxIW/9061H9CdCsV8oBXViUmwQcofe0dCB4gqSYOE
	kKFw==
X-Gm-Message-State: APjAAAV7XxLCorenYdTlxY3wzexMdAqGbobNJawKiwU3ZqFNyugYiwll
	wjMkgvIGSFI+MVMck2+78f+fN1JRiejurYbi988yEA==
X-Google-Smtp-Source: APXvYqwzXqLHGXFHthBSyJrvCMa71/7f0S52R8kCUVtkD9+DJBBlRDLy9fM9ilx6Zfmgv5cVCMamf84PiNrDhjOSWrY=
X-Received: by 2002:a7b:c14c:: with SMTP id z12mr21551844wmi.138.1554828693167;
	Tue, 09 Apr 2019 09:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190409155635.10276-1-aruna.15@cse.mrt.ac.lk>
	<CAFEAcA-k0KEsjb0VvbhhkpvTN7nFBDNtqKwx-Lai5uYbCkztJA@mail.gmail.com>
	<CAH95U0j6rHGdZj4B8DK-Ty-SqZHMb3Kmg16w+j3jx5bdkeijLQ@mail.gmail.com>
	<CAFEAcA9DSaZE-dsKV4321meT2hBEJRLmWBLF0U5o0jG=mzcmRA@mail.gmail.com>
In-Reply-To: <CAFEAcA9DSaZE-dsKV4321meT2hBEJRLmWBLF0U5o0jG=mzcmRA@mail.gmail.com>
From: Aruna Jayasena <aruna.15@cse.mrt.ac.lk>
Date: Tue, 9 Apr 2019 22:21:21 +0530
Message-ID: <CAH95U0jVP2SXr9+t+NQ4xoWODMJgMxpSgdMM4RiTSKcEX9v6ZQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000f17ca705861bc372"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
X-Mailman-Approved-At: Tue, 09 Apr 2019 13:29:25 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/4] Header cleanups
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
X-List-Received-Date: Tue, 09 Apr 2019 16:51:38 -0000

--000000000000f17ca705861bc372
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, thanks

On Tue, Apr 9, 2019 at 10:20 PM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 9 Apr 2019 at 17:42, Aruna Jayasena <aruna.15@cse.mrt.ac.lk>
> wrote:
> >
> > Yeah this is a stand alone patch.
>
> OK, thanks -- just wanted to check there wasn't a missing
> bit. I think this could go in via the qemu-trivial tree
> so I have cc'd them.
>
> We're in the middle of a release at the moment, but we
> should reopen for development in a couple of weeks. If
> this patch still hasn't gone anywhere by a week or so after
> that then please follow up with a 'ping' to check it hasn't
> been forgotten by accident.
>
> > On Tue, Apr 9, 2019 at 10:10 PM, Peter Maydell <peter.maydell@linaro.or=
g>
> wrote:
> >> On Tue, 9 Apr 2019 at 16:58, Aruna Jayasena <aruna.15@cse.mrt.ac.lk>
> wrote:
> >> >
> >> > Removed unwanted includes from cpu-common.h
> >> > This task was under https://wiki.qemu.org/Contribute/BiteSizedTasks
> >> >
> >> > Signed-off-by: Aruna Jayasena <aruna.15@cse.mrt.ac.lk>
> >> >
> >> > ---
> >> >  include/exec/cpu-common.h | 2 --
> >> >  1 file changed, 2 deletions(-)
> >> >
> >> > diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> >> > index cef8b88a2a..a3594f3f50 100644
> >> > --- a/include/exec/cpu-common.h
> >> > +++ b/include/exec/cpu-common.h
> >> > @@ -7,8 +7,6 @@
> >> >  #include "exec/hwaddr.h"
> >> >  #endif
> >> >
> >> > -#include "qemu/bswap.h"
> >> > -#include "qemu/queue.h"
> >> >  #include "qemu/fprintf-fn.h"
> >> >
> >>
> >> I was surprised that no .c files are implicitly relying
> >> on these includes, but apparently none are, so we can
> >> safely remove them.
> >>
> >> A couple of notes:
> >>  * this doesn't need to go to qemu-stable as it's just a
> >>    code cleanup
> >>  * did something go wrong with your sending of this patch?
> >>    Its subject is "PATCH 0/4" which would usually indicate
> >>    a cover letter for a four-patch series, but this seems
> >>    to be a stand-alone patch.
> >>
> >> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> thanks
> -- PMM
>
--=20
*Aruna* Jayasena
Embedded Systems and Computer Science Engineering Undergraduate
University of Moratuwa
*=E2=9C=86 **+94719872152 *
=E2=9C=89 <aruna.15@cse.mrt.ac.lk> =E2=8C=A8 <http://archfx.github.io> in
<https://www.linkedin.com/in/arunajayasena/>

--000000000000f17ca705861bc372
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Ok, thanks</div></div><div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 9, 2019 at 10:20 PM=
, Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.mayde=
ll@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue=
, 9 Apr 2019 at 17:42, Aruna Jayasena &lt;<a href=3D"mailto:aruna.15@cse.mr=
t.ac.lk" target=3D"_blank">aruna.15@cse.mrt.ac.lk</a>&gt; wrote:<br>
&gt;<br>
&gt; Yeah this is a stand alone patch.<br>
<br>
OK, thanks -- just wanted to check there wasn&#39;t a missing<br>
bit. I think this could go in via the qemu-trivial tree<br>
so I have cc&#39;d them.<br>
<br>
We&#39;re in the middle of a release at the moment, but we<br>
should reopen for development in a couple of weeks. If<br>
this patch still hasn&#39;t gone anywhere by a week or so after<br>
that then please follow up with a &#39;ping&#39; to check it hasn&#39;t<br>
been forgotten by accident.<br>
<br>
&gt; On Tue, Apr 9, 2019 at 10:10 PM, Peter Maydell &lt;<a href=3D"mailto:p=
eter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;=
 wrote:<br>
&gt;&gt; On Tue, 9 Apr 2019 at 16:58, Aruna Jayasena &lt;<a href=3D"mailto:=
aruna.15@cse.mrt.ac.lk" target=3D"_blank">aruna.15@cse.mrt.ac.lk</a>&gt; wr=
ote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Removed unwanted includes from cpu-common.h<br>
&gt;&gt; &gt; This task was under <a href=3D"https://wiki.qemu.org/Contribu=
te/BiteSizedTasks" rel=3D"noreferrer" target=3D"_blank">https://wiki.qemu.o=
rg/Contribute/BiteSizedTasks</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Aruna Jayasena &lt;<a href=3D"mailto:aruna.15@=
cse.mrt.ac.lk" target=3D"_blank">aruna.15@cse.mrt.ac.lk</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 include/exec/cpu-common.h | 2 --<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 2 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/include/exec/cpu-common.h b/include/exec/cpu-com=
mon.h<br>
&gt;&gt; &gt; index cef8b88a2a..a3594f3f50 100644<br>
&gt;&gt; &gt; --- a/include/exec/cpu-common.h<br>
&gt;&gt; &gt; +++ b/include/exec/cpu-common.h<br>
&gt;&gt; &gt; @@ -7,8 +7,6 @@<br>
&gt;&gt; &gt;=C2=A0 #include &quot;exec/hwaddr.h&quot;<br>
&gt;&gt; &gt;=C2=A0 #endif<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -#include &quot;qemu/bswap.h&quot;<br>
&gt;&gt; &gt; -#include &quot;qemu/queue.h&quot;<br>
&gt;&gt; &gt;=C2=A0 #include &quot;qemu/fprintf-fn.h&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; I was surprised that no .c files are implicitly relying<br>
&gt;&gt; on these includes, but apparently none are, so we can<br>
&gt;&gt; safely remove them.<br>
&gt;&gt;<br>
&gt;&gt; A couple of notes:<br>
&gt;&gt;=C2=A0 * this doesn&#39;t need to go to qemu-stable as it&#39;s jus=
t a<br>
&gt;&gt;=C2=A0 =C2=A0 code cleanup<br>
&gt;&gt;=C2=A0 * did something go wrong with your sending of this patch?<br=
>
&gt;&gt;=C2=A0 =C2=A0 Its subject is &quot;PATCH 0/4&quot; which would usua=
lly indicate<br>
&gt;&gt;=C2=A0 =C2=A0 a cover letter for a four-patch series, but this seem=
s<br>
&gt;&gt;=C2=A0 =C2=A0 to be a stand-alone patch.<br>
&gt;&gt;<br>
&gt;&gt; Reviewed-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@lin=
aro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><=
div><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr"><font=
 size=3D"6"></font></div></div><div style=3D"text-align:center"><font face=
=3D"verdana, sans-serif" size=3D"4"><b>Aruna</b> Jayasena</font></div><div =
style=3D"text-align:center"><font face=3D"arial narrow, sans-serif" color=
=3D"#666666">Embedded Systems and Computer Science Engineering Undergraduat=
e</font></div><div style=3D"text-align:center"><font face=3D"verdana, sans-=
serif" color=3D"#999999">University of Moratuwa</font></div><div style=3D"t=
ext-align:center"><font size=3D"1" face=3D"monospace, monospace"><b>=E2=9C=
=86=C2=A0</b></font><b><font size=3D"1"><font face=3D"monospace, monospace"=
>+94719872152</font><font face=3D"arial narrow, sans-serif">=C2=A0</font></=
font></b><font face=3D"verdana, sans-serif" color=3D"#999999"><br></font></=
div><div style=3D"text-align:center"><font size=3D"4"><a href=3D"mailto:aru=
na.15@cse.mrt.ac.lk" target=3D"_blank">=E2=9C=89</a>=C2=A0<a href=3D"http:/=
/archfx.github.io" target=3D"_blank">=E2=8C=A8</a>=C2=A0<font face=3D"verda=
na, sans-serif"><a href=3D"https://www.linkedin.com/in/arunajayasena/" targ=
et=3D"_blank">in</a></font></font></div><div style=3D"text-align:center"><b=
r><br></div></div></div></div></div></div></div></div></div></div></div></d=
iv></div>

--000000000000f17ca705861bc372--

