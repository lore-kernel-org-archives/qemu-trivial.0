Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hEmu8-0004IG-10
	for mharc-qemu-trivial@gnu.org; Thu, 11 Apr 2019 23:31:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53011)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aruna.15@cse.mrt.ac.lk>) id 1hEmu5-0004Hg-9v
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2019 23:31:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aruna.15@cse.mrt.ac.lk>) id 1hEmu3-00019j-Vf
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2019 23:31:01 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:33246)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aruna.15@cse.mrt.ac.lk>)
	id 1hEmu1-00016d-PZ
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2019 23:30:59 -0400
Received: by mail-wr1-x441.google.com with SMTP id q1so10027173wrp.0
	for <qemu-trivial@nongnu.org>; Thu, 11 Apr 2019 20:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cse.mrt.ac.lk; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zSjtjUNvqnJTVTEUMLGDSxylmm2UCGBKLw9BUM/FoWo=;
	b=AWVMJCR0gj+dmgFJKTCY4SlLDLc6rdUGxz/BO3fY+LGlTpL6iECm9DAAh2ajP9FGhA
	48n5DTOTPbIgI56eVF0aCwRPz+9nayfto8P63VorDJCx9yYPVHXDQ5mXoYLfhCzpNNyp
	f3wCC+ErCefbORGnLzFcM4EQpGvTLCGi9Gd06fWQrRvsriVcJkYXTc00FMdJyYI5tLpP
	ardDU/lqSpt1LoGl09qh+J4Ogr+nyjZAdJka93ZY/ejOaIHxWqM5ithU321mWISKZsy/
	HrTADFuR4Kj5hqA/iaNsFkYW+1rQQ1YqiJyvMooa/zzEQXssCpVR/pU9ffk9rq8e3AUa
	Xo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zSjtjUNvqnJTVTEUMLGDSxylmm2UCGBKLw9BUM/FoWo=;
	b=bfOguM2TOQKR3LdOd/RSmZ8k19712GOYE/rc9A/BRh8+YB5an+IEnqptjL4iznMO2U
	ivY9U/qNxCRACLb/7tJQ6BeHAX7I24agVp1M5QqX8ATu3HMlmyPeOgdo4mRfbeFY1PEZ
	wKtn5gVgt57PPhPiWMs14iSmsLYk8MXlylgEUle3DlFRwrotFD06nHuci4tRaOAmxC8g
	U+pGFi7ML7tqxBBWfllYrF/N3n91ymVWll60qeHDmV3cMNUpBMMjE3JxbA61QQTYN4kJ
	S3YY4jZOOB62ivs6zvdrZnKmGGad9FJlM3cYG2nmCI2x5ahMT2fRKc7oavLKNZnfcAeC
	Ny7Q==
X-Gm-Message-State: APjAAAWSSX1qjvvpey5WqFHpu67hHIJ6E4T7mP/dxbuDrubaRuhMj0Sw
	pa1KxYnFQhP3DSPMVMPLJFUFarBLqiGaiYcbQJf6SA==
X-Google-Smtp-Source: APXvYqyRag+GCBwdEqTTeSp3jpFtFcORQuu8AYHqFUWTt5Ru7XehUovOZAq11MV+BE3PhsxscR5DBBGiRf0hXCR9U/M=
X-Received: by 2002:adf:dc88:: with SMTP id r8mr11873620wrj.28.1555039855120; 
	Thu, 11 Apr 2019 20:30:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190409155635.10276-1-aruna.15@cse.mrt.ac.lk>
	<CAFEAcA-k0KEsjb0VvbhhkpvTN7nFBDNtqKwx-Lai5uYbCkztJA@mail.gmail.com>
	<CAH95U0j6rHGdZj4B8DK-Ty-SqZHMb3Kmg16w+j3jx5bdkeijLQ@mail.gmail.com>
	<CAFEAcA9DSaZE-dsKV4321meT2hBEJRLmWBLF0U5o0jG=mzcmRA@mail.gmail.com>
	<87d0lu4exq.fsf@dusky.pond.sub.org>
	<d18656fb-332b-5e01-cb86-efa692ff5daa@vivier.eu>
In-Reply-To: <d18656fb-332b-5e01-cb86-efa692ff5daa@vivier.eu>
From: Aruna Jayasena <aruna.15@cse.mrt.ac.lk>
Date: Fri, 12 Apr 2019 09:00:43 +0530
Message-ID: <CAH95U0hA9gKrws5xfTo8yqi92-doM+NsEa-K=9QxL-9BkHa_VQ@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000002d27e905864ceea3"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
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
X-List-Received-Date: Fri, 12 Apr 2019 03:31:02 -0000

--0000000000002d27e905864ceea3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks!

On Fri, Apr 12, 2019 at 1:50 AM, Laurent Vivier <laurent@vivier.eu> wrote:

> On 10/04/2019 07:17, Markus Armbruster wrote:
> > Peter Maydell <peter.maydell@linaro.org> writes:
> >
> >> On Tue, 9 Apr 2019 at 17:42, Aruna Jayasena <aruna.15@cse.mrt.ac.lk>
> wrote:
> >>>
> >>> Yeah this is a stand alone patch.
> >>
> >> OK, thanks -- just wanted to check there wasn't a missing
> >> bit. I think this could go in via the qemu-trivial tree
> >> so I have cc'd them.
> >>
> >> We're in the middle of a release at the moment, but we
> >> should reopen for development in a couple of weeks. If
> >> this patch still hasn't gone anywhere by a week or so after
> >> that then please follow up with a 'ping' to check it hasn't
> >> been forgotten by accident.
> >
> > Hopefully, qemu-trivial won't wait for the next development cycle to
> > begin just to queue patches for it.
> >
> > Regardless, patch submitters should watch their patches and inquire whe=
n
> > they don't get up within a reasonable time frame.  Normally, waiting fo=
r
> > two weeks feels about right.  Perhaps give it an extra week or so when
> > the release circus is in town (like now).
> >
>
> Applied to my trivial-patches branch.
>
> Thanks,
> Laurent
>
--=20
*Aruna* Jayasena
Embedded Systems and Computer Science Engineering Undergraduate
University of Moratuwa
*=E2=9C=86 **+94719872152 *
=E2=9C=89 <aruna.15@cse.mrt.ac.lk> =E2=8C=A8 <http://archfx.github.io> in
<https://www.linkedin.com/in/arunajayasena/>

--0000000000002d27e905864ceea3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Thanks!</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Fri, Apr 12, 2019 at 1:50 AM, Laurent Vivier &lt;<a hre=
f=3D"mailto:laurent@vivier.eu">laurent@vivier.eu</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">On 10/04/2019 07:17, Markus Armbruster wrote:<=
br>
&gt; Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=
=3D"_blank">peter.maydell@linaro.org</a>&gt; writes:<br>
&gt; <br>
&gt;&gt; On Tue, 9 Apr 2019 at 17:42, Aruna Jayasena &lt;<a href=3D"mailto:=
aruna.15@cse.mrt.ac.lk" target=3D"_blank">aruna.15@cse.mrt.ac.lk</a>&gt; wr=
ote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Yeah this is a stand alone patch.<br>
&gt;&gt;<br>
&gt;&gt; OK, thanks -- just wanted to check there wasn&#39;t a missing<br>
&gt;&gt; bit. I think this could go in via the qemu-trivial tree<br>
&gt;&gt; so I have cc&#39;d them.<br>
&gt;&gt;<br>
&gt;&gt; We&#39;re in the middle of a release at the moment, but we<br>
&gt;&gt; should reopen for development in a couple of weeks. If<br>
&gt;&gt; this patch still hasn&#39;t gone anywhere by a week or so after<br=
>
&gt;&gt; that then please follow up with a &#39;ping&#39; to check it hasn&=
#39;t<br>
&gt;&gt; been forgotten by accident.<br>
&gt; <br>
&gt; Hopefully, qemu-trivial won&#39;t wait for the next development cycle =
to<br>
&gt; begin just to queue patches for it.<br>
&gt; <br>
&gt; Regardless, patch submitters should watch their patches and inquire wh=
en<br>
&gt; they don&#39;t get up within a reasonable time frame.=C2=A0 Normally, =
waiting for<br>
&gt; two weeks feels about right.=C2=A0 Perhaps give it an extra week or so=
 when<br>
&gt; the release circus is in town (like now).<br>
&gt; <br>
<br>
Applied to my trivial-patches branch.<br>
<br>
Thanks,<br>
Laurent<br>
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

--0000000000002d27e905864ceea3--

