Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ceQ9v-00019X-BR
	for mharc-qemu-trivial@gnu.org; Thu, 16 Feb 2017 12:47:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chadjoan@gmail.com>) id 1ceQ9r-000178-Sr
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2017 12:47:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chadjoan@gmail.com>) id 1ceQ9q-0005bR-0F
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2017 12:47:55 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:34829)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <chadjoan@gmail.com>)
	id 1ceQ9l-0005b4-Gj; Thu, 16 Feb 2017 12:47:49 -0500
Received: by mail-qt0-x241.google.com with SMTP id s58so3079399qtc.2;
	Thu, 16 Feb 2017 09:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kHm994MQpBCeWSKp15mT6jHkTxAHYmUcp7MqngMU+FM=;
	b=V3SCQ6XVhf8AYoGQAz54T6GNOCpcBrFXgu89/4me7akLjJt7IAS6mVP050Wv/12j1P
	qtqgskNdmcxcavXTPGNvOpsu1qQVPDh0hz2uIZqJRrOLKVLELPn6MghAHiaxtOReqaV5
	ssDa6H/twLo+bVV6e5xychj4FQPQHsJMbpdsIWTIZg8w4AsXEExv8nWRww4NM3l6exhE
	qkwIOHgqcawlnmn3Oi2aSwI9L72d7XYUCvaLqUfoV2kATmC+PNNB73ZHI7mYus9ssaKD
	VFOZ3xu8Ar2EmxR+f14EbNUGlL8k199mCONbT8lOQWvqmECjZRPFSYYqtpui7C5rjSn1
	kvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kHm994MQpBCeWSKp15mT6jHkTxAHYmUcp7MqngMU+FM=;
	b=uJSq2XB9dY8o2LsZdsqiKSMJC9xSzgP05fYCElptL8Pu4MfZA0oCQjDSQF3HNmIcNf
	IVGcnmB4YeHbd5so5tTpC46lbPh8t6KjCbHcIrcJjeHgc9hBPYySBb2K1t3Us5df2W8o
	bakAP5pFS3MxRVUUt74AoT3l3rSzdMcjhtVV/7/KX5Um202EzBblWg8JAy0UEzq8Kl+i
	3ek+EfprexFk6B5Mp09Rzw4Ag+Ihmu1MUUbYRntHZdXBlZP8GSXoztmtzX9whGZZ3/1Y
	iO5PvGfrwqnNZCwV5F5d524kFAdOzecHS+6icax/nN9lRt6mH7TWdPCWJLNf0/wkhW6m
	YFfw==
X-Gm-Message-State: AMke39mQSWNWj2/lGn+79xpPR5XFAWGQyJGXnVACEpYa3CdHO8hMnvtUY4v02SuQAAeDZHCyV5qwttnRUgrVzA==
X-Received: by 10.200.1.11 with SMTP id e11mr3144610qtg.85.1487267268747; Thu,
	16 Feb 2017 09:47:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.148.225 with HTTP; Thu, 16 Feb 2017 09:47:28 -0800 (PST)
In-Reply-To: <bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
	<1933406e-2576-e687-3545-a72f3b999310@redhat.com>
	<bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
From: Chad Joan <chadjoan@gmail.com>
Date: Thu, 16 Feb 2017 12:47:28 -0500
Message-ID: <CABHMSTUsZy0u4b1b84YC5CgafKvD-Zms5dCQ=31+XnQphUQxLA@mail.gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary=f403045f39783d8c720548a965d6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::241
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
X-List-Received-Date: Thu, 16 Feb 2017 17:47:57 -0000

--f403045f39783d8c720548a965d6
Content-Type: text/plain; charset=UTF-8

I am glad others are chiming in and might provide better solutions.

Honestly, following the instructions at
http://wiki.qemu-project.org/Contribute/SubmitAPatch to-the-letter is quite
daunting to me, just to get one line of code changed.  It might help if
that page had some kind of dead-simple example for trivial patches;
something like:
$ cd <QEMU directory>
$ git format-patch blah blah blah
$ maybe-some-other-command
$ # Now copy the contents of file xyz.patch into your email client and send
to qemu-devel@nongnu.org and qemu-trivial@nongnu.org

Ask me to do signing/secure-signatures/etc (or any foray into gnupg
commands), setup and secure new email connectivity (ex: git send-email), or
install new software on my system... and I'm going to bounce ;)  Sorry.

I kind of expected that discerning maintainers might want to do this patch
differently.  I'm not familiar with the why's of how your configure script
is organized, so I really hope the QEMU devs can meet me in the middle and
take this the rest of the way.  I am perfectly willing to run commands on
my machine and echo results to you if it helps you learn the nature of this
problem.

Hope that helps.
- Chad

On Thu, Feb 16, 2017 at 12:23 PM, Laszlo Ersek <lersek@redhat.com> wrote:

> On 02/16/17 17:58, Paolo Bonzini wrote:
> >
> >
> > On 16/02/2017 17:30, Chad Joan wrote:
> >> Hello,
> >>
> >> This is a one-line patch to the configure script that will allow QEMU
> to be
> >> built on musl-libc based Linux systems.  This problem is only noticeable
> >> when QEMU is built with --enable-curses.
> >>
> >> Detailed reading material if you want to know where this came from:
> >> https://bugs.gentoo.org/show_bug.cgi?id=609364
> >
> > Hi,
> >
> > can you explain exactly which function is missing without
> > -D_XOPEN_SOURCE=500?  If it is curses' wide-char functions, why does it
> > fail with musl but not with glibc?  Is _XOPEN_SOURCE always defined by
> > glibc if you have _D_GNU_SOURCE?
>
> It is not necessarily auto-defined, but the effect is "as if".
>
> It is documented in the libc info:
>
> https://www.gnu.org/software/libc/manual/html_node/Feature-
> Test-Macros.html#index-_005fXOPEN_005fSOURCE
>
> > Macro: _XOPEN_SOURCE
> > Macro: _XOPEN_SOURCE_EXTENDED
> >
> >     If you define this macro, functionality described in the X/Open
> >     Portability Guide is included. This is a superset of the POSIX.1
> >     and POSIX.2 functionality and in fact _POSIX_SOURCE and
> >     _POSIX_C_SOURCE are automatically defined.
> >
> >     As the unification of all Unices, functionality only available in
> >     BSD and SVID is also included.
> >
> >     If the macro _XOPEN_SOURCE_EXTENDED is also defined, even more
> >     functionality is available. The extra functions will make all
> >     functions available which are necessary for the X/Open Unix brand.
> >
> >     If the macro _XOPEN_SOURCE has the value 500 this includes all
> >     functionality described so far plus some new definitions from the
> >     Single Unix Specification, version 2.
>
> https://www.gnu.org/software/libc/manual/html_node/Feature-
> Test-Macros.html#index-_005fGNU_005fSOURCE
>
> > Macro: _GNU_SOURCE
> >
> >     If you define this macro, everything is included: ISO C89, ISO
> >     C99, POSIX.1, POSIX.2, BSD, SVID, X/Open, LFS, and GNU extensions.
> >     In the cases where POSIX.1 conflicts with BSD, the POSIX
> >     definitions take precedence.
>
> Curiously, I managed to recall this from years ago, when I was still
> living and breathing the SUS (and looking frequently at the glibc info
> too).
>
> Laszlo
>

--f403045f39783d8c720548a965d6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div><div><div>I am glad oth=
ers are chiming in and might provide better solutions.<br><br></div>Honestl=
y, following the instructions at <a href=3D"http://wiki.qemu-project.org/Co=
ntribute/SubmitAPatch">http://wiki.qemu-project.org/Contribute/SubmitAPatch=
</a> to-the-letter is quite daunting to me, just to get one line of code ch=
anged.=C2=A0 It might help if that page had some kind of dead-simple exampl=
e for trivial patches; something like:<br></div>$ cd &lt;QEMU directory&gt;=
<br></div>$ git format-patch blah blah blah<br></div>$ maybe-some-other-com=
mand<br></div>$ # Now copy the contents of file xyz.patch into your email c=
lient and send to <span class=3D"gmail-gI"><span><a href=3D"mailto:qemu-dev=
el@nongnu.org">qemu-devel@nongnu.org</a> and </span></span><span class=3D"g=
mail-gI"><span><a href=3D"mailto:qemu-trivial@nongnu.org">qemu-trivial@nong=
nu.org</a><br><br></span></span></div><span class=3D"gmail-gI"><span>Ask me=
 to do signing/secure-signatures/etc (or any foray into gnupg commands), se=
tup and secure new email connectivity (ex: git send-email), or install new =
software on my system... and I&#39;m going to bounce ;)=C2=A0 Sorry.<br><br=
></span></span></div><span class=3D"gmail-gI"><span>I kind of expected that=
 discerning maintainers might want to do this patch differently.=C2=A0 I&#3=
9;m not familiar with the why&#39;s of how your configure script is organiz=
ed, so I really hope the QEMU devs can meet me in the middle and take this =
the rest of the way.=C2=A0 I am perfectly willing to run commands on my mac=
hine and echo results to you if it helps you learn the nature of this probl=
em.<br><br></span></span></div><span class=3D"gmail-gI"><span>Hope that hel=
ps.<br></span></span></div><span class=3D"gmail-gI"><span>- Chad<br></span>=
</span></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On T=
hu, Feb 16, 2017 at 12:23 PM, Laszlo Ersek <span dir=3D"ltr">&lt;<a href=3D=
"mailto:lersek@redhat.com" target=3D"_blank">lersek@redhat.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 02/16/17 17=
:58, Paolo Bonzini wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 16/02/2017 17:30, Chad Joan wrote:<br>
&gt;&gt; Hello,<br>
&gt;&gt;<br>
&gt;&gt; This is a one-line patch to the configure script that will allow Q=
EMU to be<br>
&gt;&gt; built on musl-libc based Linux systems.=C2=A0 This problem is only=
 noticeable<br>
&gt;&gt; when QEMU is built with --enable-curses.<br>
&gt;&gt;<br>
&gt;&gt; Detailed reading material if you want to know where this came from=
:<br>
&gt;&gt; <a href=3D"https://bugs.gentoo.org/show_bug.cgi?id=3D609364" rel=
=3D"noreferrer" target=3D"_blank">https://bugs.gentoo.org/show_<wbr>bug.cgi=
?id=3D609364</a><br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; can you explain exactly which function is missing without<br>
&gt; -D_XOPEN_SOURCE=3D500?=C2=A0 If it is curses&#39; wide-char functions,=
 why does it<br>
&gt; fail with musl but not with glibc?=C2=A0 Is _XOPEN_SOURCE always defin=
ed by<br>
&gt; glibc if you have _D_GNU_SOURCE?<br>
<br>
</span>It is not necessarily auto-defined, but the effect is &quot;as if&qu=
ot;.<br>
<br>
It is documented in the libc info:<br>
<br>
<a href=3D"https://www.gnu.org/software/libc/manual/html_node/Feature-Test-=
Macros.html#index-_005fXOPEN_005fSOURCE" rel=3D"noreferrer" target=3D"_blan=
k">https://www.gnu.org/software/<wbr>libc/manual/html_node/Feature-<wbr>Tes=
t-Macros.html#index-_<wbr>005fXOPEN_005fSOURCE</a><br>
<br>
&gt; Macro: _XOPEN_SOURCE<br>
&gt; Macro: _XOPEN_SOURCE_EXTENDED<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0If you define this macro, functionality described i=
n the X/Open<br>
&gt;=C2=A0 =C2=A0 =C2=A0Portability Guide is included. This is a superset o=
f the POSIX.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0and POSIX.2 functionality and in fact _POSIX_SOURCE=
 and<br>
&gt;=C2=A0 =C2=A0 =C2=A0_POSIX_C_SOURCE are automatically defined.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0As the unification of all Unices, functionality onl=
y available in<br>
&gt;=C2=A0 =C2=A0 =C2=A0BSD and SVID is also included.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0If the macro _XOPEN_SOURCE_EXTENDED is also defined=
, even more<br>
&gt;=C2=A0 =C2=A0 =C2=A0functionality is available. The extra functions wil=
l make all<br>
&gt;=C2=A0 =C2=A0 =C2=A0functions available which are necessary for the X/O=
pen Unix brand.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0If the macro _XOPEN_SOURCE has the value 500 this i=
ncludes all<br>
&gt;=C2=A0 =C2=A0 =C2=A0functionality described so far plus some new defini=
tions from the<br>
&gt;=C2=A0 =C2=A0 =C2=A0Single Unix Specification, version 2.<br>
<br>
<a href=3D"https://www.gnu.org/software/libc/manual/html_node/Feature-Test-=
Macros.html#index-_005fGNU_005fSOURCE" rel=3D"noreferrer" target=3D"_blank"=
>https://www.gnu.org/software/<wbr>libc/manual/html_node/Feature-<wbr>Test-=
Macros.html#index-_<wbr>005fGNU_005fSOURCE</a><br>
<br>
&gt; Macro: _GNU_SOURCE<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0If you define this macro, everything is included: I=
SO C89, ISO<br>
&gt;=C2=A0 =C2=A0 =C2=A0C99, POSIX.1, POSIX.2, BSD, SVID, X/Open, LFS, and =
GNU extensions.<br>
&gt;=C2=A0 =C2=A0 =C2=A0In the cases where POSIX.1 conflicts with BSD, the =
POSIX<br>
&gt;=C2=A0 =C2=A0 =C2=A0definitions take precedence.<br>
<br>
Curiously, I managed to recall this from years ago, when I was still<br>
living and breathing the SUS (and looking frequently at the glibc info too)=
.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Laszlo<br>
</font></span></blockquote></div><br></div>

--f403045f39783d8c720548a965d6--

