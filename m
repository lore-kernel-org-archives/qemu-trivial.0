Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dpDI1-0003jh-0B
	for mharc-qemu-trivial@gnu.org; Tue, 05 Sep 2017 08:49:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34581)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dpDHt-0003eN-Vm
	for qemu-trivial@nongnu.org; Tue, 05 Sep 2017 08:49:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dpDHo-0006Xl-SU
	for qemu-trivial@nongnu.org; Tue, 05 Sep 2017 08:49:06 -0400
Received: from mail-oi0-x22c.google.com ([2607:f8b0:4003:c06::22c]:33230)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1dpDHb-0006Kq-3o; Tue, 05 Sep 2017 08:48:47 -0400
Received: by mail-oi0-x22c.google.com with SMTP id x184so23881143oia.0;
	Tue, 05 Sep 2017 05:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=qRpJjd6Ai2dT4y1KebMiUxQL8r8ZhevGZh9McwkCLo8=;
	b=GJd3PAqZivNy+KYjWSW01DhDC7Z/mOX29mlXKKsqPXj4viFiQKcfkCHNZsk6sKBb9c
	EamqtLO1+y3miQxK9V7ouER42Jf5I7ql5Bg3exo+jPkmwlUKWaBANh94HHkirA8WokOk
	MW7DTri4ugPzToGpvWOOfjDpAagx8ddbLSMcnM/pCa6qvnDO2vzyCu6TX9vdJi8l7FVF
	5An1Aqr5gbHZhoOu8gtpwJ6eymtuPyfxdFdFd7oBFfRKdh8sP14w0aIQbBQCG7CBIqr0
	9CWbGMYTVi/E3YoE8ggJ+QUp+W/9cI9y67k+AVQZ6IQQDvAO3C66S+vyMvIG+54iwSOr
	BxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=qRpJjd6Ai2dT4y1KebMiUxQL8r8ZhevGZh9McwkCLo8=;
	b=eOx8vecr1NE7m679g6HxZNRtYsrcQN4StBYHSPsWJVbzrqlQn0DmSFdZt6KVPYRt82
	nKc3xau9oNMLaYHHtCAVl1YOIFKKMDRnMQhGzqJgY7IATp9WgJekDE8wgPwwXM2Aid5Q
	HDhdHgEoZs7io+Oq5RgkjT9PwUQbXvLGwMQJeeOyyuzPP4CxkPT0NOfah1RMjg5W65A+
	AYXhD3JCgcd9LH68mHybOeFEvy/RdDxAmJSOklS8IdxjHBidYSyYfwz+0r9T69fgtDWg
	3nS8V5U0WdTSk28xsOmC/mihckHNcEkf1zALKskrkGloLyquqkXjlfntAwlW5uyBswCe
	2TVQ==
X-Gm-Message-State: AHPjjUhSo049Q/DrDk8Mgnt1W2j5R8CVH81WNK9DgGuNH6QWzoP7vJ7R
	IRRBHPm8n46E4jFSyDnmIu2n4Yw+JA==
X-Google-Smtp-Source: ADKCNb5fb0ieaiMsK9FkEi9AB9A8+worq4kbtnYXNAbn03TRp5v3CcnkWQX6/fnO9pzu6WJejZdqyjktTfpzSFr0su4=
X-Received: by 10.202.81.200 with SMTP id f191mr3587714oib.137.1504615726071; 
	Tue, 05 Sep 2017 05:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+F1C+mPu9ftXwgs4UrGTQp4f65-thhvmWoB-kuRmu0=vnFFw@mail.gmail.com>
	<54c80221-aaf8-48c3-d58d-485003f77988@amsat.org>
In-Reply-To: <54c80221-aaf8-48c3-d58d-485003f77988@amsat.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 05 Sep 2017 12:48:35 +0000
Message-ID: <CAJ+F1C+JR8QqRGXaFizqHNrmWfi7v4ZuFAsOzUeqmXW=rqnFZw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	QEMU <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>, 
	Juan Quintela <quintela@redhat.com>
Content-Type: multipart/alternative; boundary="001a113b065ae044c8055870a565"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22c
Subject: Re: [Qemu-trivial] [Qemu-devel] clang-tidy: use g_new() family of
 functions
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
X-List-Received-Date: Tue, 05 Sep 2017 12:49:11 -0000

--001a113b065ae044c8055870a565
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 5, 2017 at 2:41 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Hi Marc-Andr=C3=A9,
>
> On 09/05/2017 09:14 AM, Marc-Andr=C3=A9 Lureau wrote:
> > Hi,
> >
> > I have a series of changes generated with clang-tidy qemu [1] pending
> > for review [2].
> >
> > It translates calloc/*malloc*/*realloc() calls to
> > g_new/g_newa/g_new0/g_renew() where the argument is a sizeof(T) [* N].
> >
> > This is the first commit to give you an idea:
> >
> > diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
> > index 98fddd7ac1..75affcb8a6 100644
> > --- a/hw/timer/arm_timer.c
> > +++ b/hw/timer/arm_timer.c
> > @@ -166,7 +166,7 @@ static arm_timer_state *arm_timer_init(uint32_t fre=
q)
> >       arm_timer_state *s;
> >       QEMUBH *bh;
> >
> > -    s =3D (arm_timer_state *)g_malloc0(sizeof(arm_timer_state));
> > +    s =3D g_new0(arm_timer_state, 1);
> >       s->freq =3D freq;
> >       s->control =3D TIMER_CTRL_IE;
> >
> > g_new() advantages (from glib doc):
> > - the returned pointer is cast to a pointer to the given type.
> > - care is taken to avoid overflow when calculating the size of the
> > allocated block.
> >
> > But it is also shorter&nicer :)
> >
> > I have not included in the first batch the opportunity to also
> > translate: alloc(sizeof(*p) * x) to g_new(typeof(*p), x), since it is
> > arguably not much nicer. But for consistency, I think it would be good
>
> "avoid overflow when calculating the size" sounds nicer.
>
> > to use g_new(). What do you think?
>
> Dunno if useful, but Juan Quintela had some issue:
>
> http://lists.nongnu.org/archive/html/qemu-devel/2017-09/msg00085.html


Thanks for pointing this out.

It looks like the last iteration didn't change it after all:
https://lists.gnu.org/archive/html/qemu-devel/2017-09/msg00076.html


>
> >
> > I splitted the changes amont the various MAINTAINERS entries, but it
> > is still about 70 patches (without the typeof() changes).
> >
> >
> > [1] https://github.com/elmarco/clang-tools-extra/
> > [2] https://github.com/elmarco/qemu/commits/gnew
> >
> >
>
--=20
Marc-Andr=C3=A9 Lureau

--001a113b065ae044c8055870a565
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue=
, Sep 5, 2017 at 2:41 PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:=
f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Hi Marc-Andr=C3=A9,<br>
<br>
On 09/05/2017 09:14 AM, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; I have a series of changes generated with clang-tidy qemu [1] pending<=
br>
&gt; for review [2].<br>
&gt;<br>
&gt; It translates calloc/*malloc*/*realloc() calls to<br>
&gt; g_new/g_newa/g_new0/g_renew() where the argument is a sizeof(T) [* N].=
<br>
&gt;<br>
&gt; This is the first commit to give you an idea:<br>
&gt;<br>
&gt; diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c<br>
&gt; index 98fddd7ac1..75affcb8a6 100644<br>
&gt; --- a/hw/timer/arm_timer.c<br>
&gt; +++ b/hw/timer/arm_timer.c<br>
&gt; @@ -166,7 +166,7 @@ static arm_timer_state *arm_timer_init(uint32_t fr=
eq)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0arm_timer_state *s;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUBH *bh;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 s =3D (arm_timer_state *)g_malloc0(sizeof(arm_timer_sta=
te));<br>
&gt; +=C2=A0 =C2=A0 s =3D g_new0(arm_timer_state, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;freq =3D freq;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;control =3D TIMER_CTRL_IE;<br>
&gt;<br>
&gt; g_new() advantages (from glib doc):<br>
&gt; - the returned pointer is cast to a pointer to the given type.<br>
&gt; - care is taken to avoid overflow when calculating the size of the<br>
&gt; allocated block.<br>
&gt;<br>
&gt; But it is also shorter&amp;nicer :)<br>
&gt;<br>
&gt; I have not included in the first batch the opportunity to also<br>
&gt; translate: alloc(sizeof(*p) * x) to g_new(typeof(*p), x), since it is<=
br>
&gt; arguably not much nicer. But for consistency, I think it would be good=
<br>
<br>
&quot;avoid overflow when calculating the size&quot; sounds nicer.<br>
<br>
&gt; to use g_new(). What do you think?<br>
<br>
Dunno if useful, but Juan Quintela had some issue:<br>
<br>
<a href=3D"http://lists.nongnu.org/archive/html/qemu-devel/2017-09/msg00085=
.html" rel=3D"noreferrer" target=3D"_blank">http://lists.nongnu.org/archive=
/html/qemu-devel/2017-09/msg00085.html</a></blockquote><div><br></div><div>=
Thanks for pointing this out.</div><div><br></div>It looks like the last it=
eration didn&#39;t change it after all:</div><div class=3D"gmail_quote"><a =
href=3D"https://lists.gnu.org/archive/html/qemu-devel/2017-09/msg00076.html=
">https://lists.gnu.org/archive/html/qemu-devel/2017-09/msg00076.html</a></=
div><div class=3D"gmail_quote"><br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
&gt;<br>
&gt; I splitted the changes amont the various MAINTAINERS entries, but it<b=
r>
&gt; is still about 70 patches (without the typeof() changes).<br>
&gt;<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/elmarco/clang-tools-extra/" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/elmarco/clang-tools-extra/<=
/a><br>
&gt; [2] <a href=3D"https://github.com/elmarco/qemu/commits/gnew" rel=3D"no=
referrer" target=3D"_blank">https://github.com/elmarco/qemu/commits/gnew</a=
><br>
&gt;<br>
&gt;<br>
</blockquote></div></div><div dir=3D"ltr">-- <br></div><div class=3D"gmail_=
signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Marc-Andr=C3=
=A9 Lureau<br></div></div>

--001a113b065ae044c8055870a565--

