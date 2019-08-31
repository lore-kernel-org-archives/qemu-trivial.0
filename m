Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i3sAi-0001JK-QW
	for mharc-qemu-trivial@gnu.org; Fri, 30 Aug 2019 21:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33439)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jkz@google.com>) id 1i3sAf-0001Ir-Ag
 for qemu-trivial@nongnu.org; Fri, 30 Aug 2019 21:27:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jkz@google.com>) id 1i3sAa-0000yS-5z
 for qemu-trivial@nongnu.org; Fri, 30 Aug 2019 21:27:16 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:42188)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jkz@google.com>) id 1i3sAZ-0000qQ-HJ
 for qemu-trivial@nongnu.org; Fri, 30 Aug 2019 21:27:12 -0400
Received: by mail-lj1-x244.google.com with SMTP id l14so8028397ljj.9
 for <qemu-trivial@nongnu.org>; Fri, 30 Aug 2019 18:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0bePa13kNaMutq5/z+1LHE8Cnf4z6IufvknZ2NESa8I=;
 b=M+JzsVcJwO0gXOEToBYJ100m4ztrxF2VJSOIOxDVYeenfttSmo6Z6PpEo5kF7zxKS2
 PyzcTFC64oP0dDlrew0dzwc2yxx7Ho7ziwDGQ02kp4KD4F7Q5kKkQ2oHU3nczyWwY/3R
 WFQyf/Z1zX8N1wpNXXa0T4d1wjQltSTwnsEEPN69S3Ps5gQG81KZ6kfHLUjlPvBUxokw
 N6axo06RjPRkYi09L9qWLVEmFf+FqH0purkWDZh0/T1nyZdAo+DxgR30+4mcXmwWZ0bq
 HgRkCaK+Q2+5ZweCOllNzvxv3byacrelhCjLIiC4lqzyJjsMKq8Lx1Tjh5OIqfkgIGcB
 rxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0bePa13kNaMutq5/z+1LHE8Cnf4z6IufvknZ2NESa8I=;
 b=YXr02sIAvI+xjf+wDqtdNauL9Jnro3Qv3shqoEdCAh1unqA1c8IL5fY3ZAxKXkILBO
 cxa0zOgry0f6YGvcpCT5kEazG5uYIyFBlrDE/KwfflmYMgYWui5TFCjk1r0Z98rWZEj7
 CliOImHXBYkOVVYMJpZOlgtBHQmBi0OinqN0sL1DgW+vaVkFeg5n8cuoWqTF9OYGPixK
 1tNIbjT9HYq9pkMV2fu+gT0vvKtDcnEWDoxc35Ka0g+KxQJDUh/VLW8yY4d68O9rYAQn
 i78EP8QOTNWYyNaCJaLecJenygS/oQeM/L2seZ+VJ0ZsD3d8ENEV72OfGAJvhBlZynus
 jv8g==
X-Gm-Message-State: APjAAAX2bjJ5Jikz6Wg4DbqOPVFPxlJHq6lR4o99FV4Txl/75zA8QLR9
 hTyv69/XUR8gx3OJvwZLA3f1ea7MtqjLKQRc40YfNw==
X-Google-Smtp-Source: APXvYqw47p5Tmw2t2f6mN77B0uEu8x2HgT4j9HTQ6FgvWAR0ueoxaU7zW6oWfEwix2eEgHhnqdBy7wzKfD83bL6NQng=
X-Received: by 2002:a2e:b16d:: with SMTP id a13mr9851410ljm.1.1567214827995;
 Fri, 30 Aug 2019 18:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <CADgy-2vznasvwaUwNSi96Sy=ucPC=-3e=O9irqc5DSpV_uhWUg@mail.gmail.com>
 <abf5f3b6-7c05-a85b-051f-9905b8f50041@vivier.eu>
 <CADgy-2va2xVmO_a1gDwg+zkpNcLJTW5D1j=2kk1TnRMxyPaLMg@mail.gmail.com>
 <6542ac57-6b06-1337-825b-dd1187accd15@vivier.eu>
 <BN6PR2201MB125123754144B7214725BF05C6A30@BN6PR2201MB1251.namprd22.prod.outlook.com>
In-Reply-To: <BN6PR2201MB125123754144B7214725BF05C6A30@BN6PR2201MB1251.namprd22.prod.outlook.com>
From: Josh Kunz <jkz@google.com>
Date: Fri, 30 Aug 2019 18:26:57 -0700
Message-ID: <CADgy-2vkeDa2kPsamm=K=uceqo30A2n53AUfND4Dx3CifQeJAw@mail.gmail.com>
To: Aleksandar Markovic <amarkovic@wavecomp.com>
Cc: Laurent Vivier <laurent@vivier.eu>,
 Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, 
 "milos.stojanovic@rt-rk.com" <milos.stojanovic@rt-rk.com>,
 Petar Jovanovic <pjovanovic@wavecomp.com>, 
 "marlies.ruck@gmail.com" <marlies.ruck@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "riku.voipio@iki.fi" <riku.voipio@iki.fi>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Shu-Chun Weng <scw@google.com>
Content-Type: multipart/alternative; boundary="0000000000001c49f705915fa388"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-trivial] [EXTERNAL]Re: [Qemu-devel] patch to swap
 SIGRTMIN + 1 and SIGRTMAX - 1
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
X-List-Received-Date: Sat, 31 Aug 2019 01:27:19 -0000

--0000000000001c49f705915fa388
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I can take over the series. I'll rebase the patch set, and update it to
address the SIGRTMIN - 1 issue. I should have an update sometime next week.

On Wed, Aug 28, 2019 at 10:31 AM Aleksandar Markovic <amarkovic@wavecomp.co=
m>
wrote:

> > From: Laurent Vivier <laurent@vivier.eu>
> > Sent: Wednesday, August 28, 2019 10:51 AM
> > To: Josh Kunz; Aleksandar Markovic; milos.stojanovic@rt-rk.com
> > Cc: marlies.ruck@gmail.com; qemu-devel@nongnu.org; riku.voipio@iki.fi;
> > qemu-trivial@nongnu.org; Peter Maydell; Shu-Chun Weng; Aleksandar
> Markovic
> > Subject: [EXTERNAL]Re: [Qemu-devel] patch to swap SIGRTMIN + 1 and
> SIGRTMAX - 1
> >
> > Le 26/08/2019 =C3=A0 23:10, Josh Kunz a =C3=A9crit :
> > > On Wed, Aug 21, 2019 at 2:28 AM Laurent Vivier <laurent@vivier.eu
> > > <mailto:laurent@vivier.eu>> wrote:
> > >
> > >     Le 19/08/2019 =C3=A0 23:46, Josh Kunz via Qemu-devel a =C3=A9crit=
 :
> > >     > Hi all,
> > >     >
> > >     > I have also experienced issues with SIGRTMIN + 1, and am
> interested in
> > >     > moving this patch forwards. Anything I can do here to help?
> Would the
> > >     > maintainers prefer myself or Marli re-submit the patch?
> > >     >
> > >     > The Go issue here seems particularly sticky. Even if we update
> the Go
> > >     > runtime, users may try and run older binaries built with older
> > >     versions of
> > >     > Go for quite some time (months? years?). Would it be better to
> > >     hide this
> > >     > behind some kind of build-time flag
> > >     (`--enable-sigrtmin-plus-one-proxy` or
> > >     > something), so that some users can opt-in, but older binaries
> > >     still work as
> > >     > expected?
> > >     >
> > >     > Also, here is a link to the original thread this message is in
> > >     reply to
> > >     > in-case my mail-client doesn't set up the reply properly:
> > >     >
> https://lists.nongnu.org/archive/html/qemu-devel/2019-07/msg01303.html
> > >
> > >     The problem here is we break something to fix something else.
> > >
> > >     I'm wondering if the series from Aleksandar Markovic, "linux-user=
:
> > >     Support signal passing for targets having more signals than host"
> [1]
> > >     can fix the problem in a better way?
> > >
> > >
> > > That patch[1] (which I'll refer to as the MUX patch to avoid confusio=
n)
> > > does not directly fix the issue addressed by this patch (re-wiring
> > > SIGRTMIN+1), but since it basically implements generic signal
> > > multiplexing, it could be re-worked to address this case as well. The
> > > way it handles `si_code` spooks me a little bit. It could easily be
> > > broken by a kernel version change, and such a breakage could be hard =
to
> > > detect or lead to surprising results. Other than that, it looks like =
a
> > > reasonable implementation.
> > >
> > > That said, overall, fixing the SIGRTMIN+1 issue using a more-generic
> > > signal-multiplexing mechanism doesn't seem *that* much better to me. =
It
> > > adds a lot of complexity, and only saves a single signal (assuming
> glibc
> > > doesn't add more reserved signals). The "big win" is additional
> > > emulation features, like those introduced in MUX patch (being able to
> > > utilize signals outside of the host range). If having those features =
in
> > > QEMU warrants the additional complexity, then re-working this patch
> > > on-top of that infrastructure seems like a good idea.
> > >
> > > If the maintainers want to go down that route, then I would be happy =
to
> > > re-work this patch utilizing the infrastructure from the MUX patch.
> > > Unfortunately it will require non-trivial changes, so it may be best =
to
> > > wait until that patch is merged. I could also provide a patch "on top
> > > of" the MUX patch, if that's desired/more convenient.
> > >
> > > Just one last note, if you do decide to merge the MUX patch, then it
> > > would be best to use SIGRTMAX (instead of SIGRTMAX-1) as the
> > > multiplexing signal if possible, to avoid breaking go binaries.
> > >
> >
> > Personally, I prefer a solution that breaks nothing.
> >
> > Aleksandar, Milos,
> >
> > do you have an updated version of you series "Support signal passing fo=
r
> > targets having more signals than host"?
> >
>
> Milos is unfortunetely working on an entirely different project now, and
> can't spare enough time to finish the series. I am also busy with other
> issues, even though I would like very much this or equivalent solution to
> be integrated. Alternatively, someone in the team may have time later thi=
s
> year, but I do not know that yet  - perhaps somebody else (Josh) can take
> over the series?
>
> Sincerely,
> Aleksandar
>
>
> > Thanks,
> > Laurent
> >

--0000000000001c49f705915fa388
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I can take over the series. I&#39;ll rebase the patch set,=
 and update it to address the SIGRTMIN - 1 issue. I should have an update s=
ometime next week.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Wed, Aug 28, 2019 at 10:31 AM Aleksandar Markovic &lt;=
<a href=3D"mailto:amarkovic@wavecomp.com">amarkovic@wavecomp.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; From: =
Laurent Vivier &lt;<a href=3D"mailto:laurent@vivier.eu" target=3D"_blank">l=
aurent@vivier.eu</a>&gt;<br>
&gt; Sent: Wednesday, August 28, 2019 10:51 AM<br>
&gt; To: Josh Kunz; Aleksandar Markovic; <a href=3D"mailto:milos.stojanovic=
@rt-rk.com" target=3D"_blank">milos.stojanovic@rt-rk.com</a><br>
&gt; Cc: <a href=3D"mailto:marlies.ruck@gmail.com" target=3D"_blank">marlie=
s.ruck@gmail.com</a>; <a href=3D"mailto:qemu-devel@nongnu.org" target=3D"_b=
lank">qemu-devel@nongnu.org</a>; <a href=3D"mailto:riku.voipio@iki.fi" targ=
et=3D"_blank">riku.voipio@iki.fi</a>; &gt; <a href=3D"mailto:qemu-trivial@n=
ongnu.org" target=3D"_blank">qemu-trivial@nongnu.org</a>; Peter Maydell; Sh=
u-Chun Weng; Aleksandar Markovic<br>
&gt; Subject: [EXTERNAL]Re: [Qemu-devel] patch to swap SIGRTMIN + 1 and SIG=
RTMAX - 1<br>
&gt; <br>
&gt; Le 26/08/2019 =C3=A0 23:10, Josh Kunz a =C3=A9crit :<br>
&gt; &gt; On Wed, Aug 21, 2019 at 2:28 AM Laurent Vivier &lt;<a href=3D"mai=
lto:laurent@vivier.eu" target=3D"_blank">laurent@vivier.eu</a><br>
&gt; &gt; &lt;mailto:<a href=3D"mailto:laurent@vivier.eu" target=3D"_blank"=
>laurent@vivier.eu</a>&gt;&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Le 19/08/2019 =C3=A0 23:46, Josh Kunz via Qemu=
-devel a =C3=A9crit :<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi all,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; I have also experienced issues with SIGRT=
MIN + 1, and am interested in<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; moving this patch forwards. Anything I ca=
n do here to help? Would the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; maintainers prefer myself or Marli re-sub=
mit the patch?<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; The Go issue here seems particularly stic=
ky. Even if we update the Go<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; runtime, users may try and run older bina=
ries built with older<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0versions of<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; Go for quite some time (months? years?). =
Would it be better to<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0hide this<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; behind some kind of build-time flag<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0(`--enable-sigrtmin-plus-one-proxy` or<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; something), so that some users can opt-in=
, but older binaries<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0still work as<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; expected?<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; Also, here is a link to the original thre=
ad this message is in<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0reply to<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; in-case my mail-client doesn&#39;t set up=
 the reply properly:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://lists.nongnu.org/archi=
ve/html/qemu-devel/2019-07/msg01303.html" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.nongnu.org/archive/html/qemu-devel/2019-07/msg01303.html<=
/a><br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0The problem here is we break something to fix =
something else.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0I&#39;m wondering if the series from Aleksanda=
r Markovic, &quot;linux-user:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Support signal passing for targets having more=
 signals than host&quot; [1]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0can fix the problem in a better way?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; That patch[1] (which I&#39;ll refer to as the MUX patch to avoid =
confusion)<br>
&gt; &gt; does not directly fix the issue addressed by this patch (re-wirin=
g<br>
&gt; &gt; SIGRTMIN+1), but since it basically implements generic signal<br>
&gt; &gt; multiplexing, it could be re-worked to address this case as well.=
 The<br>
&gt; &gt; way it handles `si_code` spooks me a little bit. It could easily =
be<br>
&gt; &gt; broken by a kernel version change, and such a breakage could be h=
ard to<br>
&gt; &gt; detect or lead to surprising results. Other than that, it looks l=
ike a<br>
&gt; &gt; reasonable implementation.<br>
&gt; &gt;<br>
&gt; &gt; That said, overall, fixing the SIGRTMIN+1 issue using a more-gene=
ric<br>
&gt; &gt; signal-multiplexing mechanism doesn&#39;t seem *that* much better=
 to me. It<br>
&gt; &gt; adds a lot of complexity, and only saves a single signal (assumin=
g glibc<br>
&gt; &gt; doesn&#39;t add more reserved signals). The &quot;big win&quot; i=
s additional<br>
&gt; &gt; emulation features, like those introduced in MUX patch (being abl=
e to<br>
&gt; &gt; utilize signals outside of the host range). If having those featu=
res in<br>
&gt; &gt; QEMU warrants the additional complexity, then re-working this pat=
ch<br>
&gt; &gt; on-top of that infrastructure seems like a good idea.<br>
&gt; &gt;<br>
&gt; &gt; If the maintainers want to go down that route, then I would be ha=
ppy to<br>
&gt; &gt; re-work this patch utilizing the infrastructure from the MUX patc=
h.<br>
&gt; &gt; Unfortunately it will require non-trivial changes, so it may be b=
est to<br>
&gt; &gt; wait until that patch is merged. I could also provide a patch &qu=
ot;on top<br>
&gt; &gt; of&quot; the MUX patch, if that&#39;s desired/more convenient.<br=
>
&gt; &gt;<br>
&gt; &gt; Just one last note, if you do decide to merge the MUX patch, then=
 it<br>
&gt; &gt; would be best to use SIGRTMAX (instead of SIGRTMAX-1) as the<br>
&gt; &gt; multiplexing signal if possible, to avoid breaking go binaries.<b=
r>
&gt; &gt;<br>
&gt; <br>
&gt; Personally, I prefer a solution that breaks nothing.<br>
&gt; <br>
&gt; Aleksandar, Milos,<br>
&gt; <br>
&gt; do you have an updated version of you series &quot;Support signal pass=
ing for<br>
&gt; targets having more signals than host&quot;?<br>
&gt; <br>
<br>
Milos is unfortunetely working on an entirely different project now, and ca=
n&#39;t spare enough time to finish the series. I am also busy with other i=
ssues, even though I would like very much this or equivalent solution to be=
 integrated. Alternatively, someone in the team may have time later this ye=
ar, but I do not know that yet=C2=A0 - perhaps somebody else (Josh) can tak=
e over the series?<br>
<br>
Sincerely,<br>
Aleksandar<br>
<br>
<br>
&gt; Thanks,<br>
&gt; Laurent<br>
&gt; </blockquote></div>

--0000000000001c49f705915fa388--

