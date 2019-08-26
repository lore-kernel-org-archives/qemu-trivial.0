Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i2MGZ-0000i0-OH
	for mharc-qemu-trivial@gnu.org; Mon, 26 Aug 2019 17:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35123)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jkz@google.com>) id 1i2MGW-0000he-G4
 for qemu-trivial@nongnu.org; Mon, 26 Aug 2019 17:11:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jkz@google.com>) id 1i2MGU-000641-Pi
 for qemu-trivial@nongnu.org; Mon, 26 Aug 2019 17:11:04 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:42957)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jkz@google.com>) id 1i2MGU-000623-Gc
 for qemu-trivial@nongnu.org; Mon, 26 Aug 2019 17:11:02 -0400
Received: by mail-pf1-x444.google.com with SMTP id i30so12584578pfk.9
 for <qemu-trivial@nongnu.org>; Mon, 26 Aug 2019 14:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z8ZIExFHtrlKt7DHcnRJlAw2R9efWUXORN53HJrWQMo=;
 b=cKdPB7auUFwld61wp0mwxwO0cvr++TE8t/Gbmh9rISkfSr5fiJzQvZGGaXse2GCLDN
 Ubyp4Nm0mp9eONSjbjZyrCVF3YsyWq0J2LVzF3Jll0NEmUVcP4gaxL7jmVT1cNrU9K5R
 6kNdaiRru/1AU88aSPbylC3hbdUqO0Z9+37idDrx7qS3DOZvRNMUb2nCcbocBpyN6HVx
 GUQTBmIPhR5OiI9LF/Dc0m2dmDvI9GAb+xgChsPIX7EOTMaNamcvme4IVQZ4f5PC+aBe
 HChp53Sz4paSko7jdSVexZhfzGU0Wia5PWJRTHW6ebFHtG0RxvFICZrrorS5JczI9Cmt
 sY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z8ZIExFHtrlKt7DHcnRJlAw2R9efWUXORN53HJrWQMo=;
 b=g6/EakLipFdaf8Aa6IuWTRiSAqiUSlhWreTaTMWYUhsFscuu5Dj7/By96uQTX0ghqr
 lKe2OG64H8ZSj+zndp3QP/WwNvP7e5eXft+Ms/pBwm2chkuqYwW4YyuB0Y+T+rkpgck2
 pvKKGTitKQr5wCGXUMtnwFUYOBHkTAUAvyt/fguh3B8gVCUvcSfOroyMYslu0TvVFgiB
 LGJY+tKOwdPfEc/jzVBpDvk9C4UbHU0VS5F8ucpRDEctLjI5NTTgmB6jG6cls3spdw/v
 ZS6o2XadLbFwpd5N31LHTlJnXM83wG+DBiF6hHI9gvxP1p86aU15Wlp6HYOd0TsempO1
 0DOw==
X-Gm-Message-State: APjAAAUkVi/yvNB/623yVzAL1YjSMQN1+C1vUDGcrmD7eKrDoa+FzTdP
 iTWPyHQ5F9UTZoXjRa25c6kB8Ok8zEh/pw0rZPMF4Q==
X-Google-Smtp-Source: APXvYqyaDO6+AT99PLb3/AhO/c3C+gmncs7UQtnkvhT7sf4SrGLRO5s2T5lOxp2QwlRudWRzkunwnC76jHkMWxsG04Q=
X-Received: by 2002:aa7:96b3:: with SMTP id g19mr21578265pfk.26.1566853857932; 
 Mon, 26 Aug 2019 14:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <CADgy-2vznasvwaUwNSi96Sy=ucPC=-3e=O9irqc5DSpV_uhWUg@mail.gmail.com>
 <abf5f3b6-7c05-a85b-051f-9905b8f50041@vivier.eu>
In-Reply-To: <abf5f3b6-7c05-a85b-051f-9905b8f50041@vivier.eu>
From: Josh Kunz <jkz@google.com>
Date: Mon, 26 Aug 2019 14:10:46 -0700
Message-ID: <CADgy-2va2xVmO_a1gDwg+zkpNcLJTW5D1j=2kk1TnRMxyPaLMg@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: marlies.ruck@gmail.com, qemu-devel@nongnu.org, riku.voipio@iki.fi, 
 qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Shu-Chun Weng <scw@google.com>,
 Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, 
 milos.stojanovic@rt-rk.com, Aleksandar Markovic <amarkovic@wavecomp.com>
Content-Type: multipart/alternative; boundary="0000000000009e835a05910b97c7"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-trivial] [Qemu-devel] patch to swap SIGRTMIN + 1 and
 SIGRTMAX - 1
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
X-List-Received-Date: Mon, 26 Aug 2019 21:11:06 -0000

--0000000000009e835a05910b97c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2019 at 2:28 AM Laurent Vivier <laurent@vivier.eu> wrote:

> Le 19/08/2019 =C3=A0 23:46, Josh Kunz via Qemu-devel a =C3=A9crit :
> > Hi all,
> >
> > I have also experienced issues with SIGRTMIN + 1, and am interested in
> > moving this patch forwards. Anything I can do here to help? Would the
> > maintainers prefer myself or Marli re-submit the patch?
> >
> > The Go issue here seems particularly sticky. Even if we update the Go
> > runtime, users may try and run older binaries built with older versions
> of
> > Go for quite some time (months? years?). Would it be better to hide thi=
s
> > behind some kind of build-time flag (`--enable-sigrtmin-plus-one-proxy`
> or
> > something), so that some users can opt-in, but older binaries still wor=
k
> as
> > expected?
> >
> > Also, here is a link to the original thread this message is in reply to
> > in-case my mail-client doesn't set up the reply properly:
> > https://lists.nongnu.org/archive/html/qemu-devel/2019-07/msg01303.html
>
> The problem here is we break something to fix something else.
>
> I'm wondering if the series from Aleksandar Markovic, "linux-user:
> Support signal passing for targets having more signals than host" [1]
> can fix the problem in a better way?
>

That patch[1] (which I'll refer to as the MUX patch to avoid confusion)
does not directly fix the issue addressed by this patch (re-wiring
SIGRTMIN+1), but since it basically implements generic signal multiplexing,
it could be re-worked to address this case as well. The way it handles
`si_code` spooks me a little bit. It could easily be broken by a kernel
version change, and such a breakage could be hard to detect or lead to
surprising results. Other than that, it looks like a reasonable
implementation.

That said, overall, fixing the SIGRTMIN+1 issue using a more-generic
signal-multiplexing mechanism doesn't seem *that* much better to me. It
adds a lot of complexity, and only saves a single signal (assuming glibc
doesn't add more reserved signals). The "big win" is additional emulation
features, like those introduced in MUX patch (being able to utilize signals
outside of the host range). If having those features in QEMU warrants the
additional complexity, then re-working this patch on-top of that
infrastructure seems like a good idea.

If the maintainers want to go down that route, then I would be happy to
re-work this patch utilizing the infrastructure from the MUX patch.
Unfortunately it will require non-trivial changes, so it may be best to
wait until that patch is merged. I could also provide a patch "on top of"
the MUX patch, if that's desired/more convenient.

Just one last note, if you do decide to merge the MUX patch, then it would
be best to use SIGRTMAX (instead of SIGRTMAX-1) as the multiplexing signal
if possible, to avoid breaking go binaries.

Thanks again for taking a look at this issue.

Cheers,
Josh Kunz

[1] http://patchwork.ozlabs.org/cover/1103565/

--0000000000009e835a05910b97c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Aug 21, 2019 at 2:28 AM Laurent V=
ivier &lt;<a href=3D"mailto:laurent@vivier.eu" target=3D"_blank">laurent@vi=
vier.eu</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Le 19/08/2019 =C3=A0 23:46, Josh Kunz via=
 Qemu-devel a =C3=A9crit=C2=A0:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; I have also experienced issues with SIGRTMIN + 1, and am interested in=
<br>
&gt; moving this patch forwards. Anything I can do here to help? Would the<=
br>
&gt; maintainers prefer myself or Marli re-submit the patch?<br>
&gt; <br>
&gt; The Go issue here seems particularly sticky. Even if we update the Go<=
br>
&gt; runtime, users may try and run older binaries built with older version=
s of<br>
&gt; Go for quite some time (months? years?). Would it be better to hide th=
is<br>
&gt; behind some kind of build-time flag (`--enable-sigrtmin-plus-one-proxy=
` or<br>
&gt; something), so that some users can opt-in, but older binaries still wo=
rk as<br>
&gt; expected?<br>
&gt; <br>
&gt; Also, here is a link to the original thread this message is in reply t=
o<br>
&gt; in-case my mail-client doesn&#39;t set up the reply properly:<br>
&gt; <a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/2019-07/ms=
g01303.html" rel=3D"noreferrer" target=3D"_blank">https://lists.nongnu.org/=
archive/html/qemu-devel/2019-07/msg01303.html</a><br>
<br>
The problem here is we break something to fix something else.<br>
<br>
I&#39;m wondering if the series from Aleksandar Markovic, &quot;linux-user:=
<br>
Support signal passing for targets having more signals than host&quot; [1]<=
br>
can fix the problem in a better way?<br></blockquote><div><br></div><div>Th=
at patch[1] (which I&#39;ll refer to as the MUX patch to avoid confusion) d=
oes not directly fix the issue addressed by this patch (re-wiring SIGRTMIN+=
1), but since it basically implements generic signal multiplexing, it could=
 be re-worked to address this case as well. The way it handles `si_code` sp=
ooks me a little bit. It could easily be broken by a kernel version change,=
 and such a breakage could be hard to detect or lead to surprising results.=
 Other than that, it looks like a reasonable implementation.</div><div><br>=
</div><div>That said, overall, fixing the SIGRTMIN+1 issue using a more-gen=
eric signal-multiplexing mechanism doesn&#39;t seem *that* much better to m=
e. It adds a lot of complexity, and only saves a single signal (assuming gl=
ibc doesn&#39;t add more reserved signals). The &quot;big win&quot; is addi=
tional emulation features, like those introduced in MUX patch (being able t=
o utilize signals outside of the host range). If having those features in Q=
EMU warrants the additional complexity, then re-working this patch on-top o=
f that infrastructure seems like a good idea.</div><div><br></div><div>If t=
he maintainers want to go down that route, then I would be happy to re-work=
 this patch utilizing the infrastructure from the MUX patch. Unfortunately =
it will require non-trivial changes, so it may be best to wait until that p=
atch is merged. I could also provide a patch &quot;on top of&quot; the MUX =
patch, if that&#39;s desired/more convenient.</div><div><br></div><div>Just=
 one last note, if you do decide to merge the MUX patch, then it would be b=
est to use SIGRTMAX (instead of SIGRTMAX-1) as the multiplexing signal if p=
ossible, to avoid breaking go binaries.</div><div><br></div><div>Thanks aga=
in for taking a look at this issue.</div><div><br></div><div>Cheers,</div><=
div>Josh Kunz</div><div><br></div><div>[1]=C2=A0<a href=3D"http://patchwork=
.ozlabs.org/cover/1103565/" rel=3D"noreferrer" target=3D"_blank">http://pat=
chwork.ozlabs.org/cover/1103565/</a></div></div></div>

--0000000000009e835a05910b97c7--

