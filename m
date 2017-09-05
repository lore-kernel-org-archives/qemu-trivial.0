Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dpDw5-0001up-R1
	for mharc-qemu-trivial@gnu.org; Tue, 05 Sep 2017 09:30:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dpDvv-0001m2-AB
	for qemu-trivial@nongnu.org; Tue, 05 Sep 2017 09:30:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dpDvk-0004Ut-VV
	for qemu-trivial@nongnu.org; Tue, 05 Sep 2017 09:30:27 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:33423)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1dpDvU-0004Fq-0H; Tue, 05 Sep 2017 09:30:00 -0400
Received: by mail-oi0-x242.google.com with SMTP id k191so2648935oih.0;
	Tue, 05 Sep 2017 06:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cxNcQD6oS2QBoVnmjqCLBPJmbt7PdbeW7QGIIHsQXX0=;
	b=ZCteUXCE1JGbI2nGM+z3q+pBX+WU5IVzZtO6kT1psgwAn27ALJPEMmuf+uxiTMjBVN
	yqrWaNBazOUe6kmda+puEUwW9XvSGJT22f/Pjtl+nqmN/zGgoD2zHelAdTHgyWSeUAnO
	alX8Q7GF09Fs59b2HoVJMn/9Qurb6TTGK3c+jdHjPQSg2c3qrXP28nkJP52poLDiyCk8
	fI7Su0zGY403/7Jl6OV+DECmDa1mqJCdWbgW7aGaW1b6XTvDyvekYWuE3BROmBV+5Vmj
	me4jHFo4sLeiIWPaQW6JJ6atNFM/gqhOPxfiFETnxoccGz+N6fUk+tnfwMe2aERX6s7I
	eEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cxNcQD6oS2QBoVnmjqCLBPJmbt7PdbeW7QGIIHsQXX0=;
	b=IxMg12vr++9d1BVjG/3GoRKKa4QAHDpHp9Mn0bxNfe33eqkkxdtFGGzIfpyaaNgt0g
	zvpCN1y/0q3P+/+tGuPjvDhzKhlsyq5zdJXt1qFf+PZkFvb8FrnWv0TvrGw06Qk5QN9A
	qGRJFxknfXNfhYQui+xn9/r+Ra+dg1z/LFuAbZVCeAnsFGIIGIj2zrokPNf1yJuydEQ1
	HDgOAzL8+V9Oa+0VLX3O3Vkx1aXZxnC19bvZ8aeSfCRQIv/dBKwOtK83CgFZQ4xH89mO
	WKxmtqRpiGnmvqPKrJw7uela5WL04TJ2Jm0ojoDlXZSDBd3/5dVXwk23Xol2ZnLoTc27
	Xvbg==
X-Gm-Message-State: AHPjjUgzoG94nJm55YeyFerFlALLvT+EM3lfi5xVxO1TaGfGwJYKc2nQ
	gbSbfCbkdvaKoFR9eQRwNlWnhekP9w==
X-Google-Smtp-Source: ADKCNb4Jbb+V9CWpKJpoP77PP7w/lLxbyvmMf0bZdM5GPNoayUhXmjh9YbnWKmSyVSVuvf7iYuSKFYHjs9awexwFjdc=
X-Received: by 10.202.57.69 with SMTP id g66mr3315924oia.28.1504618199121;
	Tue, 05 Sep 2017 06:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+F1C+mPu9ftXwgs4UrGTQp4f65-thhvmWoB-kuRmu0=vnFFw@mail.gmail.com>
	<87zia9palk.fsf@dusky.pond.sub.org>
In-Reply-To: <87zia9palk.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 05 Sep 2017 13:29:48 +0000
Message-ID: <CAJ+F1CJaxdbHnLQy6H=5=Q3ZMw0w01xsvK3ybhj80=6F9dR6gQ@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>
Content-Type: multipart/alternative; boundary="001a113cd1d848093d05587139c9"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
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
X-List-Received-Date: Tue, 05 Sep 2017 13:30:36 -0000

--001a113cd1d848093d05587139c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Sep 5, 2017 at 2:56 PM Markus Armbruster <armbru@redhat.com> wrote:

> Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:
>
> > Hi,
> >
> > I have a series of changes generated with clang-tidy qemu [1] pending
> > for review [2].
> >
> > It translates calloc/*malloc*/*realloc() calls to
> > g_new/g_newa/g_new0/g_renew() where the argument is a sizeof(T) [* N].
>
> Only for *type* T, or for arbitrary T?
>
>
If sizeof() argument is a type:
https://github.com/elmarco/clang-tools-extra/blob/master/clang-tidy/qemu/Us=
eGnewCheck.cpp#L65

For type T, we've done the transformation repeatedly with Coccinelle,
> first in commit b45c03f (commit message appended).  Repeatedly, because
> they creep back in.
>
> How does your technique compare to this prior one?
>

Well, for one, I have a lot of trouble running coccinelle, mostly because
it is slow and/or eat all my memory. Afaik, coccinelle also has trouble
parsing the code in various cases. I have also trouble writing coccinelle
semantic patch... And, I gave up.

clang-tidy in comparison, is quite fast (it takes a minute to apply on qemu
code base). I find it easier to write a tidy check, and more friendly
command line / output etc:

/tmp/test.c:3:17: warning: use g_new() instead [qemu-use-gnew]
        int *f =3D (int*)malloc(sizeof(int) * 2);
                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
                 g_new(int, 2)

clang-tidy should also respect clang-format rules when modifying the code
(see also
https://lists.nongnu.org/archive/html/qemu-devel/2017-08/msg05762.html).

I also imagine it should be possible to integrate to clang warnings in the
future (similar to libreoffice clang plugins for ex). All in all,
coccinelle or clang-tidy are probably both capable of doing this job, but
clang-tidy is snappier and has more potentials for toolchain integration.

> This is the first commit to give you an idea:
> >
> > diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
> > index 98fddd7ac1..75affcb8a6 100644
> > --- a/hw/timer/arm_timer.c
> > +++ b/hw/timer/arm_timer.c
> > @@ -166,7 +166,7 @@ static arm_timer_state *arm_timer_init(uint32_t fre=
q)
> >      arm_timer_state *s;
> >      QEMUBH *bh;
> >
> > -    s =3D (arm_timer_state *)g_malloc0(sizeof(arm_timer_state));
> > +    s =3D g_new0(arm_timer_state, 1);
> >      s->freq =3D freq;
> >      s->control =3D TIMER_CTRL_IE;
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
> > to use g_new(). What do you think?
>
> p =3D g_malloc(sizeof(*p)) is idiomatic, and not obviously inferior to
> p =3D g_new(T, 1), where T is the type of *p.  Use whatever is easier to
> read, I guess.
>
> But once you add multiplication, g_new() adds something useful: overflow
> protection.  Conversion to g_new() might make sense then.
>
> > I splitted the changes amont the various MAINTAINERS entries, but it
> > is still about 70 patches (without the typeof() changes).
> >
> >
> > [1] https://github.com/elmarco/clang-tools-extra/
> > [2] https://github.com/elmarco/qemu/commits/gnew
>
>
> commit b45c03f585ea9bb1af76c73e82195418c294919d
> Author: Markus Armbruster <armbru@redhat.com>
> Date:   Mon Sep 7 10:39:27 2015 +0100
>
>     arm: Use g_new() & friends where that makes obvious sense
>
>     g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
>     for two reasons.  One, it catches multiplication overflowing size_t.
>     Two, it returns T * rather than void *, which lets the compiler catch
>     more type errors.
>
>     This commit only touches allocations with size arguments of the form
>     sizeof(T).
>
>     Coccinelle semantic patch:
>
>         @@
>         type T;
>         @@
>         -g_malloc(sizeof(T))
>         +g_new(T, 1)
>         @@
>         type T;
>         @@
>         -g_try_malloc(sizeof(T))
>         +g_try_new(T, 1)
>

thanks, I actually forgot the g_try_new() family (I thought we didn't use
it!)

        @@
>         type T;
>         @@
>         -g_malloc0(sizeof(T))
>         +g_new0(T, 1)
>         @@
>         type T;
>         @@
>         -g_try_malloc0(sizeof(T))
>         +g_try_new0(T, 1)
>         @@
>         type T;
>         expression n;
>         @@
>         -g_malloc(sizeof(T) * (n))
>         +g_new(T, n)
>         @@
>         type T;
>         expression n;
>         @@
>         -g_try_malloc(sizeof(T) * (n))
>         +g_try_new(T, n)
>         @@
>         type T;
>         expression n;
>         @@
>         -g_malloc0(sizeof(T) * (n))
>         +g_new0(T, n)
>         @@
>         type T;
>         expression n;
>         @@
>         -g_try_malloc0(sizeof(T) * (n))
>         +g_try_new0(T, n)
>         @@
>         type T;
>         expression p, n;
>         @@
>         -g_realloc(p, sizeof(T) * (n))
>         +g_renew(T, p, n)
>         @@
>         type T;
>         expression p, n;
>         @@
>         -g_try_realloc(p, sizeof(T) * (n))
>         +g_try_renew(T, p, n)
>         @@
>         type T;
>         expression n;
>         @@
>         -(T *)g_new(T, n)
>         +g_new(T, n)
>         @@
>         type T;
>         expression n;
>         @@
>         -(T *)g_new0(T, n)
>         +g_new0(T, n)
>         @@
>         type T;
>         expression p, n;
>         @@
>         -(T *)g_renew(T, p, n)
>         +g_renew(T, p, n)
>
>     Signed-off-by: Markus Armbruster <armbru@redhat.com>
>     Reviewed-by: Eric Blake <eblake@redhat.com>
>     Message-id: 1440524394-15640-1-git-send-email-armbru@redhat.com
>     Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
--=20
Marc-Andr=C3=A9 Lureau

--001a113cd1d848093d05587139c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<br><div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
>On Tue, Sep 5, 2017 at 2:56 PM Markus Armbruster &lt;<a href=3D"mailto:arm=
bru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau=
@gmail.com" target=3D"_blank">marcandre.lureau@gmail.com</a>&gt; writes:<br=
>
<br>
&gt; Hi,<br>
&gt;<br>
&gt; I have a series of changes generated with clang-tidy qemu [1] pending<=
br>
&gt; for review [2].<br>
&gt;<br>
&gt; It translates calloc/*malloc*/*realloc() calls to<br>
&gt; g_new/g_newa/g_new0/g_renew() where the argument is a sizeof(T) [* N].=
<br>
<br>
Only for *type* T, or for arbitrary T?<br>
<br></blockquote><div><br></div><div>If sizeof() argument is a type:<br></d=
iv><div><a href=3D"https://github.com/elmarco/clang-tools-extra/blob/master=
/clang-tidy/qemu/UseGnewCheck.cpp#L65">https://github.com/elmarco/clang-too=
ls-extra/blob/master/clang-tidy/qemu/UseGnewCheck.cpp#L65</a></div><div> <b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
For type T, we&#39;ve done the transformation repeatedly with Coccinelle,<b=
r>
first in commit b45c03f (commit message appended).=C2=A0 Repeatedly, becaus=
e<br>
they creep back in.<br>
<br>
How does your technique compare to this prior one?<br></blockquote><div><br=
></div><div>Well, for one, I have a lot of trouble running coccinelle, most=
ly because it is slow and/or eat all my memory. Afaik, coccinelle also has =
trouble parsing the code in various cases. I have also trouble writing cocc=
inelle semantic patch... And, I gave up.<br></div><div><br></div><div>clang=
-tidy in comparison, is quite fast (it takes a minute to apply on qemu code=
 base). I find it easier to write a tidy check, and more friendly command l=
ine / output etc:<br></div><div><br></div><div>/tmp/test.c:3:17: warning: u=
se g_new() instead [qemu-use-gnew]<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 int *f =3D (int*)malloc(sizeof(int) * 2);<br>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_new(int, 2)<br>=
</div><div><br></div><div>clang-tidy should also respect clang-format rules=
 when modifying the code (see also <a href=3D"https://lists.nongnu.org/arch=
ive/html/qemu-devel/2017-08/msg05762.html">https://lists.nongnu.org/archive=
/html/qemu-devel/2017-08/msg05762.html</a>).<br></div><div><br></div><div>I=
 also imagine it should be possible to integrate to clang warnings in the f=
uture (similar to libreoffice clang plugins for ex). All in all, coccinelle=
 or clang-tidy are probably both capable of doing this job, but clang-tidy =
is snappier and has more potentials for toolchain integration.</div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
&gt; This is the first commit to give you an idea:<br>
&gt;<br>
&gt; diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c<br>
&gt; index 98fddd7ac1..75affcb8a6 100644<br>
&gt; --- a/hw/timer/arm_timer.c<br>
&gt; +++ b/hw/timer/arm_timer.c<br>
&gt; @@ -166,7 +166,7 @@ static arm_timer_state *arm_timer_init(uint32_t fr=
eq)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 arm_timer_state *s;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QEMUBH *bh;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 s =3D (arm_timer_state *)g_malloc0(sizeof(arm_timer_sta=
te));<br>
&gt; +=C2=A0 =C2=A0 s =3D g_new0(arm_timer_state, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;freq =3D freq;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;control =3D TIMER_CTRL_IE;<br>
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
&gt; to use g_new(). What do you think?<br>
<br>
p =3D g_malloc(sizeof(*p)) is idiomatic, and not obviously inferior to<br>
p =3D g_new(T, 1), where T is the type of *p.=C2=A0 Use whatever is easier =
to<br>
read, I guess.<br>
<br>
But once you add multiplication, g_new() adds something useful: overflow<br=
>
protection.=C2=A0 Conversion to g_new() might make sense then.<br>
<br>
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
<br>
<br>
commit b45c03f585ea9bb1af76c73e82195418c294919d<br>
Author: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=
=3D"_blank">armbru@redhat.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Mon Sep 7 10:39:27 2015 +0100<br>
<br>
=C2=A0 =C2=A0 arm: Use g_new() &amp; friends where that makes obvious sense=
<br>
<br>
=C2=A0 =C2=A0 g_new(T, n) is neater than g_malloc(sizeof(T) * n).=C2=A0 It&=
#39;s also safer,<br>
=C2=A0 =C2=A0 for two reasons.=C2=A0 One, it catches multiplication overflo=
wing size_t.<br>
=C2=A0 =C2=A0 Two, it returns T * rather than void *, which lets the compil=
er catch<br>
=C2=A0 =C2=A0 more type errors.<br>
<br>
=C2=A0 =C2=A0 This commit only touches allocations with size arguments of t=
he form<br>
=C2=A0 =C2=A0 sizeof(T).<br>
<br>
=C2=A0 =C2=A0 Coccinelle semantic patch:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 type T;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -g_malloc(sizeof(T))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +g_new(T, 1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 type T;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -g_try_malloc(sizeof(T))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +g_try_new(T, 1)<br></blockquote><div><br></div=
><div>thanks, I actually forgot the g_try_new() family (I thought we didn&#=
39;t use it!)<br></div><div> <br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 type T;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -g_malloc0(sizeof(T))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +g_new0(T, 1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 type T;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -g_try_malloc0(sizeof(T))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +g_try_new0(T, 1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 type T;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 expression n;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -g_malloc(sizeof(T) * (n))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +g_new(T, n)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 type T;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 expression n;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -g_try_malloc(sizeof(T) * (n))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +g_try_new(T, n)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 type T;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 expression n;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -g_malloc0(sizeof(T) * (n))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +g_new0(T, n)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 type T;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 expression n;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -g_try_malloc0(sizeof(T) * (n))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +g_try_new0(T, n)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 type T;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 expression p, n;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -g_realloc(p, sizeof(T) * (n))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +g_renew(T, p, n)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 type T;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 expression p, n;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -g_try_realloc(p, sizeof(T) * (n))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +g_try_renew(T, p, n)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 type T;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 expression n;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -(T *)g_new(T, n)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +g_new(T, n)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 type T;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 expression n;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -(T *)g_new0(T, n)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +g_new0(T, n)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 type T;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 expression p, n;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -(T *)g_renew(T, p, n)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +g_renew(T, p, n)<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru=
@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt;<br>
=C2=A0 =C2=A0 Reviewed-by: Eric Blake &lt;<a href=3D"mailto:eblake@redhat.c=
om" target=3D"_blank">eblake@redhat.com</a>&gt;<br>
=C2=A0 =C2=A0 Message-id: <a href=3D"mailto:1440524394-15640-1-git-send-ema=
il-armbru@redhat.com" target=3D"_blank">1440524394-15640-1-git-send-email-a=
rmbru@redhat.com</a><br>
=C2=A0 =C2=A0 Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.mayd=
ell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
</blockquote></div></div></div><div dir=3D"ltr">-- <br></div><div class=3D"=
gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Marc-A=
ndr=C3=A9 Lureau<br></div></div>

--001a113cd1d848093d05587139c9--

