Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1celoA-0006V4-CQ
	for mharc-qemu-trivial@gnu.org; Fri, 17 Feb 2017 11:54:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chadjoan@gmail.com>) id 1celo6-0006TK-MO
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 11:54:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chadjoan@gmail.com>) id 1celo4-0007tV-Ta
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 11:54:54 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:34884)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <chadjoan@gmail.com>)
	id 1celo4-0007sg-N7; Fri, 17 Feb 2017 11:54:52 -0500
Received: by mail-qk0-x241.google.com with SMTP id u25so7331354qki.2;
	Fri, 17 Feb 2017 08:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q5ui368AD9R+5e2XzNX4D2wIGnjsBe3EuKVYCqfDSs4=;
	b=FIWPcBjetiSMu3Ervq39CQxvjZbXEcRUjziEGNDoDh8Qs0K/WT1kXZsrXKhA/GO0Lp
	HOIRktL2NnvSC2cm9vf+HKD+fE4/ueQIg+5E4706LohxfqmFMlEMNWdR7pHJTqxs59fm
	ZK/1ZxXJRzrnuxic86+0QIjlbUdgkLXFdzIubAjf4Gm8ITO/vCerq0tg8N//i7tX7NGI
	cOq9g9wXJ2hWWxqEC8HK1v2pcgIY8w8eHJm0R9za2j1/0dS6lz/5P74W0rTOwaNwB19H
	EjEILzTPwMplbNG6l+rQjtGgu5xgFe4TYH9ScrNrYwg5XZ6sIe15fKonaNc/uUKmtWXw
	pkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q5ui368AD9R+5e2XzNX4D2wIGnjsBe3EuKVYCqfDSs4=;
	b=cSV/R4KSL35Oerf8wiUzbiVoVJQzGq0UEkBmzgRYoSm2jM+/V/FO73Lcg1qFs5Y9+X
	PAhqcVFMzBLQkz44bI8qu1FDd4EoUhlUUkhqHU5l35knTgxAgqgq6GsfgWC/3sLNl+QH
	4sLP0UqE9ZZ+/6Xv1XdOD0lU27aMq9veV76VEJ5i+G7QyH6argRwFdlDLbV5kSh2SiMK
	2nnADI0kB6tHmdfJJoVbyIHgT7ql7iwFII9aBRV9pc5/KIhIxZuRKwpUQQt4Mk6Qk5WY
	q9G5vUUyQlne9C/umc8gbfSVcKpltXeKr6higAh6+nlC5jsDWlklZMQxZj7jl37NzH4Y
	TpTw==
X-Gm-Message-State: AMke39k3JO+K27CIKoNmkO+3Y3DeXp1O4qlK7K7MbS+kwvmU2yAG9Iw9Zgdzw/TNDlDy0VmnZ6uMnm36UjZNsw==
X-Received: by 10.55.164.70 with SMTP id n67mr7354961qke.95.1487350491788;
	Fri, 17 Feb 2017 08:54:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.148.225 with HTTP; Fri, 17 Feb 2017 08:54:31 -0800 (PST)
In-Reply-To: <6ab86cf8-4780-ca76-f648-ac0ce211e27b@redhat.com>
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
	<1933406e-2576-e687-3545-a72f3b999310@redhat.com>
	<bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
	<CABHMSTUsZy0u4b1b84YC5CgafKvD-Zms5dCQ=31+XnQphUQxLA@mail.gmail.com>
	<20170217064327.GB21716@lemon.lan>
	<CAFEAcA8_f8SVX+rirAFBJ76ZiXaKUwh9uO0AeBFoR7G_q8pGDg@mail.gmail.com>
	<6ab86cf8-4780-ca76-f648-ac0ce211e27b@redhat.com>
From: Chad Joan <chadjoan@gmail.com>
Date: Fri, 17 Feb 2017 11:54:31 -0500
Message-ID: <CABHMSTWN2KdAXDjEEbyWio6rNM2FuDk_NUj40mFW0HdyZFu68g@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary=94eb2c075eb4b83ecc0548bcc5b7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] Fix build break during
 configuration on musl-libc based Linux systems.
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
X-List-Received-Date: Fri, 17 Feb 2017 16:54:56 -0000

--94eb2c075eb4b83ecc0548bcc5b7
Content-Type: text/plain; charset=UTF-8

Wow, that is some quick turn-around.  Well done!

My thoughts:

   - I find this summary info very helpful!  On behalf of the N people
   trying to heal paper cuts: thank you!
   - I still recommend an example snippet for shell/bash interaction that
   demonstrates the workflow you expect from a first-time contributor.  It
   should be populated with commonly used values (ex: mailing list
   addresses).  I don't expect this to happen fast like the summary info; I
   suspect someone is going to have to pretend they are submitting a patch,
   write down what they do, and then think about how to present this.
   - Regarding the signature: IIRC, setting up certificates on a machine
   using gpg can be quite time consuming and learning-intensive if you've
   never needed to do it before.  Having that example will go a long way to
   help with this.  There is still a possible pain-point: you might write one
   line of git code in the example, and it is easy for you due to your
   workflow, but it could be hours of fiddling for someone who has never done
   it before.  If I'm wrong, show me (the hypothetical reader) how easy it is
   ;)  If I'm right (and that would be unfortunate, in this case), then it
   might be helpful if you politely ask the reader to spend time X amount of
   time on it (establish accurate expectations) and then provide a link to the
   most helpful how-to article you can find on the subject.
   - The email thing is a pain-point, but I wonder if QEMU can make it
   wonderful without sacrificing much--perhaps just a few words on the page.
   Presumably, not every email client mangles patches.  Can we have a
   whitelist?  So far the whitelist has one item: git send-email.  But git
   send-email is probably not even part of the majority population's workflow,
   so if we can test and approve even /some/ of the more popular mail clients
   (ex: gmail, thunderbird, outlook, etc) for use, it would help newbies A
   LOT.  Less importantly; a blacklist could be useful too, to prevent
   unnecessary "what about my mail client?" questions and unnecessary
   redundant testing in the future.
   - I should also mention that I found the rest of the document to be very
   well-written.  It's comprehensiveness became its weakness, but that's still
   important long-term, hence why I think an alternative path with a short
   example for trivial patches is plenty sufficient: from my perspective,
   there's no need to change the rest of the text; it is already good :).

Note that I'm bothering to stick around and provide feedback, despite other
pressing life obligations.  Providing advice on submit-a-patch usability
for QEMU isn't on my schedule, but I don't have the heart to bail on this,
especially when you all are kindly listening, having high quality
discussion, and sincerely trying to improve things.  If you read between
the lines, you see the truth: I am a yak shaver!

Oh man, when I hit a topic like "use git send-email", the hair started
flying: learning new git commands, two-factor auth on gmail, U2F keys,
governance for the no-mans-land of a server, and so on, a real yak-shaving
party.  After an hour or two, my safety triggered, and I thought, "man, I
am spending way too much time perfecting this workflow that I might never
do again" and I spent a few minutes writing a message in gmail.  I
certainly don't expect QEMU devs to fix garbled patches either: that also
seems like a huge waste of valuable time (and for talented and passionate
individuals, too).  There has to be a better way!  So I hope the whitelist
idea helps, or maybe it's enough to just call awareness to this potential
improvement.

Well, that ended up being very long.  I hope this is helpful and doesn't
spend too much of your time.

Thanks for listening!

On Fri, Feb 17, 2017 at 10:34 AM, Eric Blake <eblake@redhat.com> wrote:

> On 02/17/2017 03:28 AM, Peter Maydell wrote:
> > On 17 February 2017 at 06:43, Fam Zheng <famz@redhat.com> wrote:
> >> But your point is taken, we should make the first (or a one-shot)
> >> contribution as easy as possible.
> >
> > Yes; we could do with providing a "This page seems very long..."
> > introduction section. The absolute bare minimum requirements
> > for a submitter I think are:
> >  * Provide a Signed-off-by: line (this is a hard requirement
> >    because it's how you say "I'm legally OK to contribute this
> >    and am happy for it to go into QEMU")
> >  * send patch by email
> >  * read replies and act on them if you want your patch to go in
> >
> > The larger your contribution is, the more important the other
> > requirements detailed on the page are; but personally I'm
> > happy to manually fix up patches from a first-time submitter,
> > and I think most other maintainers are too.
>
> I've updated the wiki to put in that nice bullet list, prior to the
> table of contents.
>
> --
> Eric Blake   eblake redhat com    +1-919-301-3266
> Libvirt virtualization library http://libvirt.org
>
>

--94eb2c075eb4b83ecc0548bcc5b7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Wow, that is some quick turn-around.=C2=A0 Well done!=
<br><br></div><div>My thoughts:<br></div><ul><li>I find this summary info v=
ery helpful!=C2=A0 On behalf of the N people trying to heal paper cuts: tha=
nk you!</li><li>I still recommend an example snippet for shell/bash interac=
tion that demonstrates the workflow you expect from a first-time contributo=
r.=C2=A0 It should be populated with commonly used values (ex: mailing list=
 addresses).=C2=A0 I don&#39;t expect this to happen fast like the summary =
info; I suspect someone is going to have to pretend they are submitting a p=
atch, write down what they do, and then think about how to present this.</l=
i><li>Regarding the signature: IIRC, setting up certificates on a machine u=
sing gpg can be quite time consuming and learning-intensive if you&#39;ve n=
ever needed to do it before.=C2=A0 Having that example will go a long way t=
o help with this.=C2=A0 There is still a possible pain-point: you might wri=
te one line of git code in the example, and it is easy for you due to your =
workflow, but it could be hours of fiddling for someone who has never done =
it before.=C2=A0 If I&#39;m wrong, show me (the hypothetical reader) how ea=
sy it is ;)=C2=A0 If I&#39;m right (and that would be unfortunate, in this =
case), then it might be helpful if you politely ask the reader to spend tim=
e X amount of time on it (establish accurate expectations) and then provide=
 a link to the most helpful how-to article you can find on the subject.<br>=
</li><li>The email thing is a pain-point, but I wonder if QEMU can make it =
wonderful without sacrificing much--perhaps just a few words on the page.=
=C2=A0 Presumably, not every email client mangles patches.=C2=A0 Can we hav=
e a whitelist?=C2=A0 So far the whitelist has one item: git send-email.=C2=
=A0 But git send-email is probably not even part of the majority population=
&#39;s workflow, so if we can test and approve even /some/ of the more popu=
lar mail clients (ex: gmail, thunderbird, outlook, etc) for use, it would h=
elp newbies A LOT.=C2=A0 Less importantly; a blacklist could be useful too,=
 to prevent unnecessary &quot;what about my mail client?&quot; questions an=
d unnecessary redundant testing in the future.<br></li><li>I should also me=
ntion that I found the rest of the document to be very well-written.=C2=A0 =
It&#39;s comprehensiveness became its weakness, but that&#39;s still import=
ant long-term, hence why I think an alternative path with a short example f=
or trivial patches is plenty sufficient: from my perspective, there&#39;s n=
o need to change the rest of the text; it is already good :).<br></li></ul>=
<p>Note that I&#39;m bothering to stick around and provide feedback, despit=
e other pressing life obligations.=C2=A0 Providing advice on submit-a-patch=
 usability for QEMU isn&#39;t on my schedule, but I don&#39;t have the hear=
t to bail on this, especially when you all are kindly listening, having hig=
h quality discussion, and sincerely trying to improve things.=C2=A0 If you =
read between the lines, you see the truth: I am a yak shaver!</p><p>Oh man,=
 when I hit a topic like &quot;use git send-email&quot;, the hair started f=
lying: learning new git commands, two-factor auth on gmail, U2F keys, gover=
nance for the no-mans-land of a server, and so on, a real yak-shaving party=
.=C2=A0 After an hour or two, my safety triggered, and I thought, &quot;man=
, I am spending way too much time perfecting this workflow that I might nev=
er do again&quot; and I spent a few minutes writing a message in gmail.=C2=
=A0 I certainly don&#39;t expect QEMU devs to fix garbled patches either: t=
hat also seems like a huge waste of valuable time (and for talented and pas=
sionate individuals, too).=C2=A0 There has to be a better way!=C2=A0 So I h=
ope the whitelist idea helps, or maybe it&#39;s enough to just call awarene=
ss to this potential improvement.<br></p><p>Well, that ended up being very =
long.=C2=A0 I hope this is helpful and doesn&#39;t spend too much of your t=
ime.</p><p>Thanks for listening!<br></p></div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On Fri, Feb 17, 2017 at 10:34 AM, Eric Blake <=
span dir=3D"ltr">&lt;<a href=3D"mailto:eblake@redhat.com" target=3D"_blank"=
>eblake@redhat.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<span class=3D"">On 02/17/2017 03:28 AM, Peter Maydell wrote:<br>
&gt; On 17 February 2017 at 06:43, Fam Zheng &lt;<a href=3D"mailto:famz@red=
hat.com">famz@redhat.com</a>&gt; wrote:<br>
&gt;&gt; But your point is taken, we should make the first (or a one-shot)<=
br>
&gt;&gt; contribution as easy as possible.<br>
&gt;<br>
&gt; Yes; we could do with providing a &quot;This page seems very long...&q=
uot;<br>
&gt; introduction section. The absolute bare minimum requirements<br>
&gt; for a submitter I think are:<br>
&gt;=C2=A0 * Provide a Signed-off-by: line (this is a hard requirement<br>
&gt;=C2=A0 =C2=A0 because it&#39;s how you say &quot;I&#39;m legally OK to =
contribute this<br>
&gt;=C2=A0 =C2=A0 and am happy for it to go into QEMU&quot;)<br>
&gt;=C2=A0 * send patch by email<br>
&gt;=C2=A0 * read replies and act on them if you want your patch to go in<b=
r>
&gt;<br>
&gt; The larger your contribution is, the more important the other<br>
&gt; requirements detailed on the page are; but personally I&#39;m<br>
&gt; happy to manually fix up patches from a first-time submitter,<br>
&gt; and I think most other maintainers are too.<br>
<br>
</span>I&#39;ve updated the wiki to put in that nice bullet list, prior to =
the<br>
table of contents.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
Eric Blake=C2=A0 =C2=A0eblake redhat com=C2=A0 =C2=A0 <a href=3D"tel:%2B1-9=
19-301-3266" value=3D"+19193013266">+1-919-301-3266</a><br>
Libvirt virtualization library <a href=3D"http://libvirt.org" rel=3D"norefe=
rrer" target=3D"_blank">http://libvirt.org</a><br>
<br>
</div></div></blockquote></div><br></div>

--94eb2c075eb4b83ecc0548bcc5b7--

