Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cem0c-0000HN-7P
	for mharc-qemu-trivial@gnu.org; Fri, 17 Feb 2017 12:07:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chadjoan@gmail.com>) id 1cem0Z-0000Fu-Ou
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 12:07:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chadjoan@gmail.com>) id 1cem0Y-0005s0-Tb
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 12:07:47 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:36766)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <chadjoan@gmail.com>)
	id 1cem0Y-0005rU-Mv; Fri, 17 Feb 2017 12:07:46 -0500
Received: by mail-qk0-x241.google.com with SMTP id p22so7416662qka.3;
	Fri, 17 Feb 2017 09:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SzNk4PdYZYF+gpneMM0EKwwBM5PJ+qzIiWIQ835GlKg=;
	b=brEx2kA6o3QNWYLESnXCKR4gCEc7UHLFj/3uSdCt6SP2Fwr97dzEJz4238TqsUTI9t
	Bwzq7A8RTyBYgc9em2EaZUuAmQ6I9G9XLKEjFoyO3hzn692pv/kmcPWm5oRoHNlvq+n1
	QOR/54QJy64TJ4Ue3SYPZdKLooR9FEhfQtZsF7nPnt2TE17pxlPPyY7T9HtmzFrIibXM
	hbeVS/XxAdOZcbgA6Axa7zfE6hgc9Hu1Dr0s9Bkpmk6Je+QMcIxPe7gWXa7lvVnxeSbi
	CTtPQqeT4k3RiJ8dDNFTAC9NJf2r9JNq0Kq3GDVnPnVOA5FOnfrXR5wOGoojRODyi032
	JdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SzNk4PdYZYF+gpneMM0EKwwBM5PJ+qzIiWIQ835GlKg=;
	b=lkR+cAeAKuFIIdN5wNGQH58cO0VqkQNTcKY08Jego8ENmcXMhEiYxE7YVvX4s3pYny
	+10+hF9ikaqX4EgRMXCpRy5fClkdu93eQQhHiFi4W/19mox+K00TPb61WrC7yqb/yQ9J
	pZrNzzu0OAsGvm37VuW04cDIdjdTvxEdpQhmB9+BMAhbZFMpwpvsDOC8xkBuE9GlvPEn
	cYfVe0hgonemZ9ICoTmTqBSBe0bP4cg8HlbWrcgt1O4YLLj887mskKD2fFDGJqP75y0A
	EunWuXbUTBrsFpwCGBOJe506Q7PDuNTSEUHbItRVdkyd6+J9lUAgbVMqIvLAXZNRLGPO
	tjZQ==
X-Gm-Message-State: AMke39lz+mX++DDIuL0vmBeSKfsMP0d1LRakQQVovD/YwoGSZcAv6o5nrQY2kUOt9xKxOAL/BeZY0aANpmSkJA==
X-Received: by 10.55.163.74 with SMTP id m71mr1857490qke.243.1487351265900;
	Fri, 17 Feb 2017 09:07:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.148.225 with HTTP; Fri, 17 Feb 2017 09:07:25 -0800 (PST)
In-Reply-To: <f42b803f-ba9e-fe14-a085-2023ac062c1c@redhat.com>
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
	<1933406e-2576-e687-3545-a72f3b999310@redhat.com>
	<bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
	<CABHMSTUsZy0u4b1b84YC5CgafKvD-Zms5dCQ=31+XnQphUQxLA@mail.gmail.com>
	<20170217064327.GB21716@lemon.lan>
	<CAFEAcA8_f8SVX+rirAFBJ76ZiXaKUwh9uO0AeBFoR7G_q8pGDg@mail.gmail.com>
	<6ab86cf8-4780-ca76-f648-ac0ce211e27b@redhat.com>
	<CABHMSTWN2KdAXDjEEbyWio6rNM2FuDk_NUj40mFW0HdyZFu68g@mail.gmail.com>
	<f42b803f-ba9e-fe14-a085-2023ac062c1c@redhat.com>
From: Chad Joan <chadjoan@gmail.com>
Date: Fri, 17 Feb 2017 12:07:25 -0500
Message-ID: <CABHMSTWJseqJXq+S9y+38fym8H2FXLMumSGdQf6mn028mz7pcQ@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Fam Zheng <famz@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
	Laszlo Ersek <lersek@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary=94eb2c06de80dc3e680548bcf3aa
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
X-List-Received-Date: Fri, 17 Feb 2017 17:07:48 -0000

--94eb2c06de80dc3e680548bcf3aa
Content-Type: text/plain; charset=UTF-8

How wonderful!  Problem solved.  Now I think that just having an example
could kill the misconception forever ;)

On Fri, Feb 17, 2017 at 11:57 AM, Paolo Bonzini <pbonzini@redhat.com> wrote:

>
>
> On 17/02/2017 17:54, Chad Joan wrote:
> > Regarding the signature: IIRC, setting up certificates on a machine
> > using gpg can be quite time consuming and learning-intensive if you've
> > never needed to do it before.  Having that example will go a long way to
> > help with this.  There is still a possible pain-point: you might write
> > one line of git code in the example, and it is easy for you due to your
> > workflow, but it could be hours of fiddling for someone who has never
> > done it before.  If I'm wrong, show me (the hypothetical reader) how
> > easy it is ;)  If I'm right (and that would be unfortunate, in this
> > case), then it might be helpful if you politely ask the reader to spend
> > time X amount of time on it (establish accurate expectations) and then
> > provide a link to the most helpful how-to article you can find on the
> > subject.
>
> GPG signing is not needed.  All you need is "git commit -s".
>
> Adding "Signed-off-by: Chad Joan <chadjoan@gmail.com>" basically is a
> way to tell us "I understand I'm contributing this under the GNU GPL or
> a compatible license".  It's not a cryptographic signature.
>
> Paolo
>

--94eb2c06de80dc3e680548bcf3aa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">How wonderful!=C2=A0 Problem solved.=C2=A0 Now I think tha=
t just having an example could kill the misconception forever ;)<br></div><=
div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Feb 17, 20=
17 at 11:57 AM, Paolo Bonzini <span dir=3D"ltr">&lt;<a href=3D"mailto:pbonz=
ini@redhat.com" target=3D"_blank">pbonzini@redhat.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><span class=3D""><br>
<br>
On 17/02/2017 17:54, Chad Joan wrote:<br>
&gt; Regarding the signature: IIRC, setting up certificates on a machine<br=
>
&gt; using gpg can be quite time consuming and learning-intensive if you&#3=
9;ve<br>
&gt; never needed to do it before.=C2=A0 Having that example will go a long=
 way to<br>
&gt; help with this.=C2=A0 There is still a possible pain-point: you might =
write<br>
&gt; one line of git code in the example, and it is easy for you due to you=
r<br>
&gt; workflow, but it could be hours of fiddling for someone who has never<=
br>
&gt; done it before.=C2=A0 If I&#39;m wrong, show me (the hypothetical read=
er) how<br>
&gt; easy it is ;)=C2=A0 If I&#39;m right (and that would be unfortunate, i=
n this<br>
&gt; case), then it might be helpful if you politely ask the reader to spen=
d<br>
&gt; time X amount of time on it (establish accurate expectations) and then=
<br>
&gt; provide a link to the most helpful how-to article you can find on the<=
br>
&gt; subject.<br>
<br>
</span>GPG signing is not needed.=C2=A0 All you need is &quot;git commit -s=
&quot;.<br>
<br>
Adding &quot;Signed-off-by: Chad Joan &lt;<a href=3D"mailto:chadjoan@gmail.=
com">chadjoan@gmail.com</a>&gt;&quot; basically is a<br>
way to tell us &quot;I understand I&#39;m contributing this under the GNU G=
PL or<br>
a compatible license&quot;.=C2=A0 It&#39;s not a cryptographic signature.<b=
r>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Paolo<br>
</font></span></blockquote></div><br></div>

--94eb2c06de80dc3e680548bcf3aa--

