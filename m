Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hDuYq-000251-4b
	for mharc-qemu-trivial@gnu.org; Tue, 09 Apr 2019 13:29:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aruna.15@cse.mrt.ac.lk>) id 1hDuDR-0001g4-R3
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2019 13:07:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aruna.15@cse.mrt.ac.lk>) id 1hDuDQ-0006Yv-Nd
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2019 13:07:21 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40785)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aruna.15@cse.mrt.ac.lk>)
	id 1hDuDP-0006VR-Ae
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2019 13:07:20 -0400
Received: by mail-wr1-x442.google.com with SMTP id h4so21872969wre.7
	for <qemu-trivial@nongnu.org>; Tue, 09 Apr 2019 10:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cse.mrt.ac.lk; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jNiYLfvh/vDXwbCeYLQ6mL+AjMUsPn7+gBjqEeZiEow=;
	b=ZJBEUzcWut46WTDQpNtv/o3s7651330PXgGGSZuDeuoVZeKv1ETUZyKMQEZY2cp9NK
	zyOn9GsOPvjQv4zBFlBmABLxhAB99pkSs5bc0u+yXzXRK8dU3zW4YKE7Pvfl0wk/315W
	7JEtQSFml90DPA6wnIJyv+VYbpY5VzmfoZHbgHMWeOlsnL8BWXv7B4ZUMUKty/FEUdVT
	nit4IutsSR+JeM+bf2omI11c1WDPaOGniq2XXj0GMDcykpp/rH9JJGoKGKWP4dVtGH/Y
	m96m7v5IkFO/3Ix77e0y7bmrTiO/8/FRfjjSdCIM9syukqpfvQf2ye4NdDzOhYvGEzBX
	jwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jNiYLfvh/vDXwbCeYLQ6mL+AjMUsPn7+gBjqEeZiEow=;
	b=ZA1z50N6XqN+n/EIl86xTjXRGGHz/UHYo9FfiL1srfo0pqN6p45FPr1sZfQBmn3cly
	nVpKcTmGQXkM9rtIoU/cpLNtlkth5x+SQbU7LaXHUiH2am2zg0HSwXVEtPWvPVnmNukj
	CcknITcsBXHdDWc4Cbw7oDxl+FaNfapFO37rvvYnJ5adTwliz6d76Wn8fGV46fh1uLHu
	lzUGQBxnqbvNtQVM53P0S/Yz3lnI3AWSPd3KcR/ctQnxxihDT6X3msWp5ykGC3mf2d7z
	5Y6zgEVLs8RLKQ5ByOkMhj1YVxo8STFrrrS8UZo8xSRia8bEq0mmL4usuPhokAxEOTmm
	cX+Q==
X-Gm-Message-State: APjAAAWU/3uV6OilPdIdK8BjNXInG/eaxvt1+L395yRxJ5pJKcVfKRgK
	3QxulP1/J9Dp5g0SPm21ULBoc3O41hnmA+bHXKdAWg==
X-Google-Smtp-Source: APXvYqzPcYCydhidtkXzb0FbvW4tZq1Jcw2H30QHfLb9f30mcLckKHpY+MRfj8ew+qopfLakezPg6Z/m+IxKW2ZvqYE=
X-Received: by 2002:adf:f68d:: with SMTP id v13mr23248844wrp.6.1554829637112; 
	Tue, 09 Apr 2019 10:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190409155635.10276-1-aruna.15@cse.mrt.ac.lk>
	<fbe81e69-01f1-4755-49a8-e25df108a196@redhat.com>
In-Reply-To: <fbe81e69-01f1-4755-49a8-e25df108a196@redhat.com>
From: Aruna Jayasena <aruna.15@cse.mrt.ac.lk>
Date: Tue, 9 Apr 2019 22:37:05 +0530
Message-ID: <CAH95U0j5Ph_OZS+ZY2juM6UxvESGO=dv+cYV6uLiNAOpHVS7mw@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000034dff305861bfcfc"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
X-Mailman-Approved-At: Tue, 09 Apr 2019 13:29:26 -0400
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
X-List-Received-Date: Tue, 09 Apr 2019 17:07:23 -0000

--00000000000034dff305861bfcfc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks!

On Tue, Apr 9, 2019 at 10:36 PM, Thomas Huth <thuth@redhat.com> wrote:

> On 09/04/2019 17.56, Aruna Jayasena wrote:
> > Removed unwanted includes from cpu-common.h
> > This task was under https://wiki.qemu.org/Contribute/BiteSizedTasks
> >
> > Signed-off-by: Aruna Jayasena <aruna.15@cse.mrt.ac.lk>
> >
> > ---
> >  include/exec/cpu-common.h | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> > index cef8b88a2a..a3594f3f50 100644
> > --- a/include/exec/cpu-common.h
> > +++ b/include/exec/cpu-common.h
> > @@ -7,8 +7,6 @@
> >  #include "exec/hwaddr.h"
> >  #endif
> >
> > -#include "qemu/bswap.h"
> > -#include "qemu/queue.h"
> >  #include "qemu/fprintf-fn.h"
> >
> >  /**
> >
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
>
--=20
*Aruna* Jayasena
Embedded Systems and Computer Science Engineering Undergraduate
University of Moratuwa
*=E2=9C=86 **+94719872152 *
=E2=9C=89 <aruna.15@cse.mrt.ac.lk> =E2=8C=A8 <http://archfx.github.io> in
<https://www.linkedin.com/in/arunajayasena/>

--00000000000034dff305861bfcfc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Thanks!</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Tue, Apr 9, 2019 at 10:36 PM, Thomas Huth &lt;<a href=
=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">On 09/04/2019 17.56, Aruna Jayasena wrote:<br>
&gt; Removed unwanted includes from cpu-common.h<br>
&gt; This task was under <a href=3D"https://wiki.qemu.org/Contribute/BiteSi=
zedTasks" rel=3D"noreferrer" target=3D"_blank">https://wiki.qemu.org/Contri=
bute/BiteSizedTasks</a><br>
&gt; <br>
&gt; Signed-off-by: Aruna Jayasena &lt;<a href=3D"mailto:aruna.15@cse.mrt.a=
c.lk" target=3D"_blank">aruna.15@cse.mrt.ac.lk</a>&gt;<br>
&gt; <br>
&gt; ---<br>
&gt;=C2=A0 include/exec/cpu-common.h | 2 --<br>
&gt;=C2=A0 1 file changed, 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h<br>
&gt; index cef8b88a2a..a3594f3f50 100644<br>
&gt; --- a/include/exec/cpu-common.h<br>
&gt; +++ b/include/exec/cpu-common.h<br>
&gt; @@ -7,8 +7,6 @@<br>
&gt;=C2=A0 #include &quot;exec/hwaddr.h&quot;<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 <br>
&gt; -#include &quot;qemu/bswap.h&quot;<br>
&gt; -#include &quot;qemu/queue.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/fprintf-fn.h&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /**<br>
&gt; <br>
<br>
Reviewed-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"=
_blank">thuth@redhat.com</a>&gt;<br>
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

--00000000000034dff305861bfcfc--

