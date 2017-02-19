Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cfLWB-000762-5W
	for mharc-qemu-trivial@gnu.org; Sun, 19 Feb 2017 02:02:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chadjoan@gmail.com>) id 1cfLW7-00075t-Vf
	for qemu-trivial@nongnu.org; Sun, 19 Feb 2017 02:02:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chadjoan@gmail.com>) id 1cfLW5-000822-Ft
	for qemu-trivial@nongnu.org; Sun, 19 Feb 2017 02:02:44 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:36359)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <chadjoan@gmail.com>)
	id 1cfLW5-00081i-9L; Sun, 19 Feb 2017 02:02:41 -0500
Received: by mail-qk0-x243.google.com with SMTP id p22so11766665qka.3;
	Sat, 18 Feb 2017 23:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Efxn9AOKVi19MQbRiE1zJPP2g7VhDlVBKYR/PXjupTE=;
	b=Lbk+u7XJgIJU5E0kEj2sGiMzde09iySJcvNvEsL61BylyDxFCmTl/Il7cXjf9q1H3v
	ast1hp+VCQ31iy1yHV3/23Z70nrqWRu69RpWfXvVV5tR+x4WqJyqGJ/KVnzjjfPmTlvZ
	4lOsqPTtED2DovzyAFHkOrdtJjRxCdwNeVs0/SLNvUiingT65ZDAdVLE0DIIjlnHAgM8
	W2fPJR5QpNPVlKuBmeQmRptyniSD6zWMGVDC2XfxbCtTIQp2DIHp7YQ69PX0MdDthyRQ
	0BWvRnOaNDkg1NlPNbiDZuSW8JEB0a6TNCMLUrMZpxoXZkJ5qnaY3uck/YIQEZ6vOgyv
	HELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Efxn9AOKVi19MQbRiE1zJPP2g7VhDlVBKYR/PXjupTE=;
	b=dfhHr67a8FIPnT+CiYbhHSQQe7otG2KxvLQPcrAS+wurF6CsP2BSom2vg6W3vhVLpW
	7ylxVfFHG3SJ3YcSoIzj8eAAVnWCGMhc2rhaJabUsp9uiC0HpMJBJH+t1TKi17Kc+QFF
	iJe26eujcqkZdeZoTMPR5d6SvYpBsAxhqa3p0beQiJ5NRPpP+UHKK3FIMI912NJIbwWj
	INkD/iQBKH1k0n5dyPeSkAw6zz+K5kbCoD4JYc7b5yZ9c/WaXHYa3ZKZ0VNqEN+S+njT
	mb/GXOuoPjfBafOqXTRl9XEUCl5OAPNqr/IL0ZQUvjXYDJmhfHeCl8B2w7KQwkuvpDlI
	uRlg==
X-Gm-Message-State: AMke39n3hTayBSEliVWtbQNmwMiW5VSWSQtWxxKTx3diItGD1gM7yWmOResa7alZR7n+e6LlbWH/KTBXvzyplw==
X-Received: by 10.55.116.70 with SMTP id p67mr14369607qkc.216.1487487760449;
	Sat, 18 Feb 2017 23:02:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.149.146 with HTTP; Sat, 18 Feb 2017 23:02:19 -0800 (PST)
In-Reply-To: <fc3b6729-6739-5daf-5e78-85fbd7d3260d@redhat.com>
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
	<1933406e-2576-e687-3545-a72f3b999310@redhat.com>
	<bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
	<CABHMSTUsZy0u4b1b84YC5CgafKvD-Zms5dCQ=31+XnQphUQxLA@mail.gmail.com>
	<20170217064327.GB21716@lemon.lan>
	<CAFEAcA8_f8SVX+rirAFBJ76ZiXaKUwh9uO0AeBFoR7G_q8pGDg@mail.gmail.com>
	<6ab86cf8-4780-ca76-f648-ac0ce211e27b@redhat.com>
	<CABHMSTWN2KdAXDjEEbyWio6rNM2FuDk_NUj40mFW0HdyZFu68g@mail.gmail.com>
	<fc3b6729-6739-5daf-5e78-85fbd7d3260d@redhat.com>
From: Chad Joan <chadjoan@gmail.com>
Date: Sun, 19 Feb 2017 02:02:19 -0500
Message-ID: <CABHMSTUS4Oi5WZt0NcYaOnX9_u8zQeu=CupLVX2LjvD+mTYATg@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary=001a114ff26c91c96b0548dcbba0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::243
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
X-List-Received-Date: Sun, 19 Feb 2017 07:02:46 -0000

--001a114ff26c91c96b0548dcbba0
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 17, 2017 at 12:17 PM, Eric Blake <eblake@redhat.com> wrote:

> On 02/17/2017 10:54 AM, Chad Joan wrote:
> > Wow, that is some quick turn-around.  Well done!
> >
> > My thoughts:
> >
> >    - I find this summary info very helpful!  On behalf of the N people
> >    trying to heal paper cuts: thank you!
> >    - I still recommend an example snippet for shell/bash interaction that
> >    demonstrates the workflow you expect from a first-time contributor.
> It
> >    should be populated with commonly used values (ex: mailing list
> >    addresses).  I don't expect this to happen fast like the summary
> info; I
> >    suspect someone is going to have to pretend they are submitting a
> patch,
> >    write down what they do, and then think about how to present this.
>
> For a quickie patch, I make my edits, then 'git commit -a -s' and 'git
> send-email -1' - but that works because I've already set up git hooks to
> auto-cc the list, and I already debugged my 'get send-email' setup years
> ago.  So yeah, doing it from a completely virgin environment could
> benefit from a complete command line that reproduces what I take for
> granted in my normal environment.  And some email setups are a lot
> friendlier than others (I personally do not use gmail, but will readily
> admit that it is probably a lot easier to set up my work emails to use
> Red Hat's SMTP servers than it is for a gmail contributor to get their
> email setup working in a way that does not mangle patches).
>
>
I appreciate this retrospective :)

In my case I am working on a machine that wasn't even supposed to see any
development work.  There are no user accounts, just root.  I have tried to
avoid putting any personal information on it.  If I am on it, then I'm
editing files in /etc or installing system-wide software.  I'm realizing
that I might have to change this a bit due to the WIP nature of the
hardened-musl profile: ultimately I *am* doing development work on it, and
that kind of snuck up on me.  If I give myself a user account, then
authoring patches with git (and using send-email) becomes somewhat more
practical (putting smtp login information onto the machine still bugs me).
Still, I can't imagine I'm the only person who runs into this kind of thing
and wants to write quick patches on an impersonal machine.


> [...]
>
> But nothing requires you to set up a certificate to submit a patch.  I'm
> not sure which piece of the documentation got you steered in that
> direction, but gpg signing of patches is only required of maintainers,
> not contributors (or maybe you're hinting at the extra effort required
> to set up gmail as a valid 'git send-email' target, to which I have no
> experience, but which starts to leave the realm of qemu-specific
> instructions into something where it would be better to link to a good
> git setup tutorial, if one exists).
>
>
I think this is just language ambiguity and confirmation bias doing their
thing.  Usually when I read "you have to sign this" in an OSS context, I
think of cryptographic signing.  I haven't encountered the requirement for
non-cryptographic signing before.  Language is arbitrary and we all have
different experiences and backgrounds.

This is one of the reasons why I suggest a simple example: it would be both
very concise and unambiguous.  If there are no signing steps in the example
then you don't even need to spend words telling the reader that
cryptographic signing is unnecessary.  It'll be implied.

Thankfully, this is a separate concern from the 'git send-email' thing.



> >  Having that example will go a long way to
> >    help with this.
>
> <snip lots of useful ideas for improvement>
>
> >    - I should also mention that I found the rest of the document to be
> very
> >    well-written.  It's comprehensiveness became its weakness, but that's
> still
> >    important long-term, hence why I think an alternative path with a
> short
> >    example for trivial patches is plenty sufficient: from my perspective,
> >    there's no need to change the rest of the text; it is already good :).
>
> Thanks for that feedback.  It's often hard for a core contributor to
> remember what it was like to submit their first patch years ago, and
> having a fresh take on the matter from a new contributor is well worth
> the reminders.  It's also nice to hear this as a compliment, and not
> just a complaint.
>
>
Thanks for listening :)

I know what you mean about the complaint thing.  It's unfortunate, but it
can be very hard to know the significance of your words for others.  For
many people (possibly myself included; hard to remember) it may take a long
time to learn and internalize the implications of a truth such as "no one
wants to be hurt".  I try to be the world that I want to live in.  I'm glad
it's working out for everyone this time around.

FWIW, this thread has also left me impressed with the culture in the QEMU
community, and it makes me feel good about choosing this software too.
Good job everyone!


> >
> > Note that I'm bothering to stick around and provide feedback, despite
> other
> > pressing life obligations.  Providing advice on submit-a-patch usability
> > for QEMU isn't on my schedule, but I don't have the heart to bail on
> this,
> > especially when you all are kindly listening, having high quality
> > discussion, and sincerely trying to improve things.  If you read between
> > the lines, you see the truth: I am a yak shaver!
>
> At the risk of pushing too hard, you could always turn your (good!)
> suggestions into concrete wording, or even request a wiki account to
> make the changes yourself. But even if that is beyond your planned level
> of involvement, I do hope that various readers will be able to act on
> the suggestions in this mail to improve things.
>
>
It's always worth asking!

I'm in deep enough now that I wouldn't cheap out on it ;)

I'm more worried that I'm completely unqualified to do this.  I could try
to read the whole thing and make a small 2-4 liner that would do what QEMU
devs want.  But I'm almost certain I'd botch it up somehow.  I've already
misinterpreted the gpg signature thing; there's more where that came from!
I think a QEMU dev would get results that a QEMU dev would expect.

Well, let me know if you want me to try *anyways*.


> >
> > Oh man, when I hit a topic like "use git send-email", the hair started
> > flying: learning new git commands, two-factor auth on gmail, U2F keys,
> > governance for the no-mans-land of a server, and so on, a real
> yak-shaving
> > party.  After an hour or two, my safety triggered, and I thought, "man, I
> > am spending way too much time perfecting this workflow that I might never
> > do again" and I spent a few minutes writing a message in gmail.  I
> > certainly don't expect QEMU devs to fix garbled patches either: that also
> > seems like a huge waste of valuable time (and for talented and passionate
> > individuals, too).  There has to be a better way!  So I hope the
> whitelist
> > idea helps, or maybe it's enough to just call awareness to this potential
> > improvement.
>
> Again, part of the problem may be that gmail is not really suited to the
> ideal patch flow, and so that's going to be a pain point for any such
> contributor.  Submitting patches as an attachment is harder than the
> inline version you get with 'git send-email', but it is one of those
> one-off manual fixups that a maintainer can overlook, as long as it
> really is a one-off thing and not a repeated pattern.  And yes, we
> should document that use of an attachment is the most likely to avoid
> mangling the patch if you don't have 'git send-email' working, even if
> it is harder for the maintainer to apply such a patch.
>
>
> --
> Eric Blake   eblake redhat com    +1-919-301-3266
> Libvirt virtualization library http://libvirt.org
>
>
Interesting.  I certainly think that would help.  If the QEMU maintainers
could meet me (the hypothetical mass of first-timers) in the middle and
handle 1-3 attachments or so, then that would make things very painless on
my side.  And at the point where I am submitting more than a few patches, I
know that there is a pattern developing and I wouldn't mind spending the
effort to streamline it for everyone.  tl;dr: This idea makes sense on my
side too.

--001a114ff26c91c96b0548dcbba0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Feb 17, 2017 at 12:17 PM, Eric Blake <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:eblake@redhat.com" target=3D"_blank">eblake@redhat.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span>On 02/17/2017 10:54=
 AM, Chad Joan wrote:<br>
&gt; Wow, that is some quick turn-around.=C2=A0 Well done!<br>
&gt;<br>
&gt; My thoughts:<br>
&gt;<br>
</span>&gt;=C2=A0 =C2=A0 - I find this summary info very helpful!=C2=A0 On =
behalf of the N people<br>
<span>&gt;=C2=A0 =C2=A0 trying to heal paper cuts: thank you!<br>
</span>&gt;=C2=A0 =C2=A0 - I still recommend an example snippet for shell/b=
ash interaction that<br>
<span>&gt;=C2=A0 =C2=A0 demonstrates the workflow you expect from a first-t=
ime contributor.=C2=A0 It<br>
&gt;=C2=A0 =C2=A0 should be populated with commonly used values (ex: mailin=
g list<br>
&gt;=C2=A0 =C2=A0 addresses).=C2=A0 I don&#39;t expect this to happen fast =
like the summary info; I<br>
&gt;=C2=A0 =C2=A0 suspect someone is going to have to pretend they are subm=
itting a patch,<br>
&gt;=C2=A0 =C2=A0 write down what they do, and then think about how to pres=
ent this.<br>
<br>
</span>For a quickie patch, I make my edits, then &#39;git commit -a -s&#39=
; and &#39;git<br>
send-email -1&#39; - but that works because I&#39;ve already set up git hoo=
ks to<br>
auto-cc the list, and I already debugged my &#39;get send-email&#39; setup =
years<br>
ago.=C2=A0 So yeah, doing it from a completely virgin environment could<br>
benefit from a complete command line that reproduces what I take for<br>
granted in my normal environment.=C2=A0 And some email setups are a lot<br>
friendlier than others (I personally do not use gmail, but will readily<br>
admit that it is probably a lot easier to set up my work emails to use<br>
Red Hat&#39;s SMTP servers than it is for a gmail contributor to get their<=
br>
email setup working in a way that does not mangle patches).<br>
<br></blockquote><div><br></div><div>I appreciate this retrospective :)<br>=
<br></div><div>In my case I am working on a machine that wasn&#39;t even su=
pposed to see any development work.=C2=A0 There are no user accounts, just =
root.=C2=A0 I have tried to avoid putting any personal information on it.=
=C2=A0 If I am on it, then I&#39;m editing files in /etc or installing syst=
em-wide software.=C2=A0 I&#39;m realizing that I might have to change this =
a bit due to the WIP nature of the hardened-musl profile: ultimately I <i>a=
m</i> doing development work on it, and that kind of snuck up on me.=C2=A0 =
If I give myself a user account, then authoring patches with git (and using=
 send-email) becomes somewhat more practical (putting smtp login informatio=
n onto the machine still bugs me).=C2=A0 Still, I can&#39;t imagine I&#39;m=
 the only person who runs into this kind of thing and wants to write quick =
patches on an impersonal machine.<br></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">[...]<span><br>
<br>
</span>But nothing requires you to set up a certificate to submit a patch.=
=C2=A0 I&#39;m<br>
not sure which piece of the documentation got you steered in that<br>
direction, but gpg signing of patches is only required of maintainers,<br>
not contributors (or maybe you&#39;re hinting at the extra effort required<=
br>
to set up gmail as a valid &#39;git send-email&#39; target, to which I have=
 no<br>
experience, but which starts to leave the realm of qemu-specific<br>
instructions into something where it would be better to link to a good<br>
git setup tutorial, if one exists).<br>
<span><br></span></blockquote><div><br></div><div>I think this is just lang=
uage ambiguity and confirmation bias doing their thing.=C2=A0 Usually when =
I read &quot;you have to sign this&quot; in an OSS context, I think of cryp=
tographic signing.=C2=A0 I haven&#39;t encountered the requirement for non-=
cryptographic signing before.=C2=A0 Language is arbitrary and we all have d=
ifferent experiences and backgrounds.<br><br></div><div>This is one of the =
reasons why I suggest a simple example: it would be both very concise and u=
nambiguous.=C2=A0 If there are no signing steps in the example then you don=
&#39;t even need to spend words telling the reader that cryptographic signi=
ng is unnecessary.=C2=A0 It&#39;ll be implied.<br></div><div><br></div><div=
>Thankfully, this is a separate concern from the &#39;git send-email&#39; t=
hing.<br><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span>
&gt;=C2=A0 Having that example will go a long way to<br>
&gt;=C2=A0 =C2=A0 help with this.<br>
<br>
</span>&lt;snip lots of useful ideas for improvement&gt;<br>
<br>
&gt;=C2=A0 =C2=A0 - I should also mention that I found the rest of the docu=
ment to be very<br>
<span>&gt;=C2=A0 =C2=A0 well-written.=C2=A0 It&#39;s comprehensiveness beca=
me its weakness, but that&#39;s still<br>
&gt;=C2=A0 =C2=A0 important long-term, hence why I think an alternative pat=
h with a short<br>
&gt;=C2=A0 =C2=A0 example for trivial patches is plenty sufficient: from my=
 perspective,<br>
&gt;=C2=A0 =C2=A0 there&#39;s no need to change the rest of the text; it is=
 already good :).<br>
<br>
</span>Thanks for that feedback.=C2=A0 It&#39;s often hard for a core contr=
ibutor to<br>
remember what it was like to submit their first patch years ago, and<br>
having a fresh take on the matter from a new contributor is well worth<br>
the reminders.=C2=A0 It&#39;s also nice to hear this as a compliment, and n=
ot<br>
just a complaint.<br>
<span><br></span></blockquote><div><br></div><div>Thanks for listening :)<b=
r><br></div><div>I know what you mean about the complaint thing.=C2=A0 It&#=
39;s unfortunate, but it can be very hard to know the significance of your =
words for others.=C2=A0 For many people (possibly myself included; hard to =
remember) it may take a long time to learn and internalize the implications=
 of a truth such as &quot;no one wants to be hurt&quot;.=C2=A0 I try to be =
the world that I want to live in.=C2=A0 I&#39;m glad it&#39;s working out f=
or everyone this time around.<br><br></div><div>FWIW, this thread has also =
left me impressed with the culture in the QEMU community, and it makes me f=
eel good about choosing this software too.=C2=A0 Good job everyone!<br></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span>
&gt;<br>
&gt; Note that I&#39;m bothering to stick around and provide feedback, desp=
ite other<br>
&gt; pressing life obligations.=C2=A0 Providing advice on submit-a-patch us=
ability<br>
&gt; for QEMU isn&#39;t on my schedule, but I don&#39;t have the heart to b=
ail on this,<br>
&gt; especially when you all are kindly listening, having high quality<br>
&gt; discussion, and sincerely trying to improve things.=C2=A0 If you read =
between<br>
&gt; the lines, you see the truth: I am a yak shaver!<br>
<br>
</span>At the risk of pushing too hard, you could always turn your (good!)<=
br>
suggestions into concrete wording, or even request a wiki account to<br>
make the changes yourself. But even if that is beyond your planned level<br=
>
of involvement, I do hope that various readers will be able to act on<br>
the suggestions in this mail to improve things.<br>
<span><br></span></blockquote><div><br></div><div>It&#39;s always worth ask=
ing!<br><br></div><div>I&#39;m in deep enough now that I wouldn&#39;t cheap=
 out on it ;)<br><br></div><div>I&#39;m more worried that I&#39;m completel=
y unqualified to do this.=C2=A0 I could try to read the whole thing and mak=
e a small 2-4 liner that would do what QEMU devs want.=C2=A0 But I&#39;m al=
most certain I&#39;d botch it up somehow.=C2=A0 I&#39;ve already misinterpr=
eted the gpg signature thing; there&#39;s more where that came from!=C2=A0 =
I think a QEMU dev would get results that a QEMU dev would expect.<br><br><=
/div><div>Well, let me know if you want me to try <i>anyways</i>.<br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><span>
&gt;<br>
&gt; Oh man, when I hit a topic like &quot;use git send-email&quot;, the ha=
ir started<br>
&gt; flying: learning new git commands, two-factor auth on gmail, U2F keys,=
<br>
&gt; governance for the no-mans-land of a server, and so on, a real yak-sha=
ving<br>
&gt; party.=C2=A0 After an hour or two, my safety triggered, and I thought,=
 &quot;man, I<br>
&gt; am spending way too much time perfecting this workflow that I might ne=
ver<br>
&gt; do again&quot; and I spent a few minutes writing a message in gmail.=
=C2=A0 I<br>
&gt; certainly don&#39;t expect QEMU devs to fix garbled patches either: th=
at also<br>
&gt; seems like a huge waste of valuable time (and for talented and passion=
ate<br>
&gt; individuals, too).=C2=A0 There has to be a better way!=C2=A0 So I hope=
 the whitelist<br>
&gt; idea helps, or maybe it&#39;s enough to just call awareness to this po=
tential<br>
&gt; improvement.<br>
<br>
</span>Again, part of the problem may be that gmail is not really suited to=
 the<br>
ideal patch flow, and so that&#39;s going to be a pain point for any such<b=
r>
contributor.=C2=A0 Submitting patches as an attachment is harder than the<b=
r>
inline version you get with &#39;git send-email&#39;, but it is one of thos=
e<br>
one-off manual fixups that a maintainer can overlook, as long as it<br>
really is a one-off thing and not a repeated pattern.=C2=A0 And yes, we<br>
should document that use of an attachment is the most likely to avoid<br>
mangling the patch if you don&#39;t have &#39;git send-email&#39; working, =
even if<br>
it is harder for the maintainer to apply such a patch.<br>
<div class=3D"m_3513061243481072125HOEnZb"><div class=3D"m_3513061243481072=
125h5"><br>
<br>
--<br>
Eric Blake=C2=A0 =C2=A0eblake redhat com=C2=A0 =C2=A0 <a href=3D"tel:%2B1-9=
19-301-3266" value=3D"+19193013266" target=3D"_blank">+1-919-301-3266</a><b=
r>
Libvirt virtualization library <a href=3D"http://libvirt.org" rel=3D"norefe=
rrer" target=3D"_blank">http://libvirt.org</a><br>
<br>
</div></div></blockquote></div><br></div><div class=3D"gmail_extra">Interes=
ting.=C2=A0 I certainly think that would help.=C2=A0 If the QEMU maintainer=
s could meet me (the hypothetical mass of first-timers) in the middle and h=
andle 1-3 attachments or so, then that would make things very painless on m=
y side.=C2=A0 And at the point where I am submitting more than a few patche=
s, I know that there is a pattern developing and I wouldn&#39;t mind spendi=
ng the effort to streamline it for everyone.=C2=A0 tl;dr: This idea makes s=
ense on my side too.<br><br><br></div></div>

--001a114ff26c91c96b0548dcbba0--

