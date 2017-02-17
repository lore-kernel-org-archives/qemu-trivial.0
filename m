Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cegxV-0007r4-9v
	for mharc-qemu-trivial@gnu.org; Fri, 17 Feb 2017 06:44:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37038)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chadjoan@gmail.com>) id 1cegxT-0007po-3I
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 06:44:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chadjoan@gmail.com>) id 1cegxR-00072q-Uq
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 06:44:15 -0500
Received: from mail-qk0-x22d.google.com ([2607:f8b0:400d:c09::22d]:36333)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <chadjoan@gmail.com>)
	id 1cegxP-000715-4t; Fri, 17 Feb 2017 06:44:11 -0500
Received: by mail-qk0-x22d.google.com with SMTP id 11so41191472qkl.3;
	Fri, 17 Feb 2017 03:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5LR6ccIlMEZIj9Uk5ctd/LRFjF/gE7GzpgcYKekpclc=;
	b=aICfKDemgh7kAcWYVRkse3bwMFvUe6ziUr1Y7XoNLyVhrOghZGoQ5B1Vo+IJtEkp/U
	D0TwkOFu18+APhRlkWRC5qYGMDkW189mh7MXcGRqd7mjOwIzZh+ycDUgZOZHpK1bzmkk
	ElCIBMD8QIRXDYJfoA0AqJFf6QpCT+5mhmSQJiCgQuwQFA7yp8PdnxLbdG67CLuvDRid
	vTJ6GmMPmtYEf7djP9hf2VOe9DzJ4PD5iH2sxZWzIsTLmGWsb/8I0Db6brexMvmtruR9
	aewKkYbUUN1BoZfcDslWZsrsLSMYIeKYz/f+T5Psm7KWUxTbu6hd1eZJZhsjMUkJbEfb
	LQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5LR6ccIlMEZIj9Uk5ctd/LRFjF/gE7GzpgcYKekpclc=;
	b=J94QqgCj34KKMuVW+Y5oYFq1Santaq9QPWYiTHfJ1imjqCHmm9GZjHvZvsj9ihhWmM
	Kr84rXK+vUDpseghfeATtm3UghsjzBr2N6U6u8YlB4rNhomVeYm0ygneiU44uc0XaQmy
	0ymqEDKFHN3fO/LSQ9kq/Hr4EXRcp7atKEAV28oXG6mA4eWpTdTPwpPD57e8OOlCeyf2
	Vv6kYVS3vNN49u1SZfJW/zMQb2O+L0O3WAMkbncM5cIM54KKsSP4zzu0wWsCRQuX0TUK
	rspsHHe2S5SnnUKTReY8RojwRX5Uysgs3VfOUxxtPohUMDro9V0Y+GGyjnabagnN16Uq
	lcvw==
X-Gm-Message-State: AMke39n8tFXSXdLrZ8fG1tcRph1emUeIHiGhey14atrr5gfoue8Akoz8VOOmpAm/7LNkTjDKdRbTmjLxVABCRw==
X-Received: by 10.55.164.70 with SMTP id n67mr5807616qke.95.1487331850545;
	Fri, 17 Feb 2017 03:44:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.148.225 with HTTP; Fri, 17 Feb 2017 03:43:50 -0800 (PST)
In-Reply-To: <6e37308a-5d95-8795-fd1a-25e4ace2158f@redhat.com>
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
	<1933406e-2576-e687-3545-a72f3b999310@redhat.com>
	<bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
	<e19aed34-77c2-f588-351d-2daa8a099ae9@redhat.com>
	<279d2ba8-dabc-0c50-ea7e-1cecccc22291@redhat.com>
	<6e37308a-5d95-8795-fd1a-25e4ace2158f@redhat.com>
From: Chad Joan <chadjoan@gmail.com>
Date: Fri, 17 Feb 2017 06:43:50 -0500
Message-ID: <CABHMSTXEgftj1if9_YZJztUOUa3sK-qFhTm5=_6+kC=wraOFLw@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary=94eb2c075eb49d712b0548b86ec9
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::22d
Subject: Re: [Qemu-trivial] Fix build break during configuration on
 musl-libc based Linux systems.
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
X-List-Received-Date: Fri, 17 Feb 2017 11:44:16 -0000

--94eb2c075eb49d712b0548b86ec9
Content-Type: text/plain; charset=UTF-8

Sure.

I'll see your -O2 and raise you a -c ;)

It went like this:

$ gcc -c first.c -O2
$ gcc -c second.c -O2
$ gcc -c third.c -O2

No complaints from gcc whatsoever (unless I drop the -c, then ld complains
about the undefined reference to main, which I think we all expect).

Just incase you expected one of them to fail (ex: as a control test), I
verified that the original snippet from the configure script still causes
an error on the system:
#########
$ cat << EOF > reference.c
> #include <locale.h>
> #include <curses.h>
> #include <wchar.h>
> int main(void) {
>   const char *s = curses_version();
>   wchar_t wch = L'w';
>   setlocale(LC_ALL, "");
>   resize_term(0, 0);
>   addwstr(L"wide chars\n");
>   addnwstr(&wch, 1);
>   add_wch(WACS_DEGREE);
>   return s != 0;
> }
> EOF
$ gcc reference.c -O2
reference.c: In function 'main':
reference.c:11:11: error: 'WACS_DEGREE' undeclared (first use in this
function)
   add_wch(WACS_DEGREE);
           ^
reference.c:11:11: note: each undeclared identifier is reported only once
for each function it appears in
#########

Hope that helps.

On Fri, Feb 17, 2017 at 6:11 AM, Paolo Bonzini <pbonzini@redhat.com> wrote:

>
>
> On 17/02/2017 10:17, Laszlo Ersek wrote:
> > Of course, *if* that other C library, and the Curses implementation,
> > claim compatibility with glibc as far as _GNU_SOURCE goes, *then* I
> > fully agree with you. (IOW, it depends on the condition that you
> > formulated above, "if musl wants to support _GNU_SOURCE".)
>
> They at least try, since their features.h supports it.
>
> > Same for ncurses -- do they aim at SUSv2 conformance, or do they intend
> > to consider _GNU_SOURCE specifically?
>
> Well, ncurses is a GNU project so I suppose they mostly care about
> whatever Autoconf does.  And indeed Autoconf does have some special
> casing for -D_XOPEN_SOURCE=500:
>
>   AC_CACHE_CHECK([whether _XOPEN_SOURCE should be defined],
>     [ac_cv_should_define__xopen_source],
>     [ac_cv_should_define__xopen_source=no
>      AC_COMPILE_IFELSE(
>        [AC_LANG_PROGRAM([[
>           #include <wchar.h>
>           mbstate_t x;]])],
>        [],
>        [AC_COMPILE_IFELSE(
>           [AC_LANG_PROGRAM([[
>              #define _XOPEN_SOURCE 500
>              #include <wchar.h>
>              mbstate_t x;]])],
>           [ac_cv_should_define__xopen_source=yes])])])
>   test $ac_cv_should_define__xopen_source = yes &&
>     AC_DEFINE([_XOPEN_SOURCE], [500])
>
> If musl needs _XOPEN_SOURCE for wchar.h, then it would be worth working
> around in QEMU.  If it's just happening with ncurses, however, it'd be a
> musl bug, which should be fixed in musl or worked around in ncurses.
>
> Chad, can you check whether the programs below fails with musl:
>
> /* First program */
> #define _GNU_SOURCE
> #include <wchar.h>
> mbstate_t x;
>
> /* Second program */
> #include <wchar.h>
> mbstate_t x;
>
> /* Third program */
> #define _XOPEN_SOURCE 500
> #include <wchar.h>
> mbstate_t x;
>
> Just compile them with "gcc foo.c -O2".
>
> Thanks,
>
> Paolo
>

--94eb2c075eb49d712b0548b86ec9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sure.<br><div><br>I&#39;ll see your -O2 and raise you a -c=
 ;)<br><div><br>It went like this:<br><br>$ gcc -c first.c -O2<br>$ gcc -c =
second.c -O2<br>$ gcc -c third.c -O2<br><br></div><div>No complaints from g=
cc whatsoever (unless I drop the -c, then ld complains about the undefined =
reference to main, which I think we all expect).<br><br></div><div>Just inc=
ase you expected one of them to fail (ex: as a control test), I verified th=
at the original snippet from the configure script still causes an error on =
the system:<br>#########<br>$ cat &lt;&lt; EOF &gt; reference.c<br>&gt; #in=
clude &lt;locale.h&gt;<br>&gt; #include &lt;curses.h&gt;<br>&gt; #include &=
lt;wchar.h&gt;<br>&gt; int main(void) {<br>&gt;=C2=A0=C2=A0 const char *s =
=3D curses_version();<br>&gt;=C2=A0=C2=A0 wchar_t wch =3D L&#39;w&#39;;<br>=
&gt;=C2=A0=C2=A0 setlocale(LC_ALL, &quot;&quot;);<br>&gt;=C2=A0=C2=A0 resiz=
e_term(0, 0);<br>&gt;=C2=A0=C2=A0 addwstr(L&quot;wide chars\n&quot;);<br>&g=
t;=C2=A0=C2=A0 addnwstr(&amp;wch, 1);<br>&gt;=C2=A0=C2=A0 add_wch(WACS_DEGR=
EE);<br>&gt;=C2=A0=C2=A0 return s !=3D 0;<br>&gt; }<br>&gt; EOF<br>$ gcc re=
ference.c -O2<br>reference.c: In function &#39;main&#39;:<br>reference.c:11=
:11: error: &#39;WACS_DEGREE&#39; undeclared (first use in this function)<b=
r>=C2=A0=C2=A0 add_wch(WACS_DEGREE);<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>reference.c:11:11: note: each undeclared i=
dentifier is reported only once for each function it appears in<br></div><d=
iv>#########<br><br></div><div>Hope that helps.<br></div></div></div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Feb 17, 2017 at=
 6:11 AM, Paolo Bonzini <span dir=3D"ltr">&lt;<a href=3D"mailto:pbonzini@re=
dhat.com" target=3D"_blank">pbonzini@redhat.com</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><span class=3D""><br>
<br>
On 17/02/2017 10:17, Laszlo Ersek wrote:<br>
&gt; Of course, *if* that other C library, and the Curses implementation,<b=
r>
&gt; claim compatibility with glibc as far as _GNU_SOURCE goes, *then* I<br=
>
&gt; fully agree with you. (IOW, it depends on the condition that you<br>
&gt; formulated above, &quot;if musl wants to support _GNU_SOURCE&quot;.)<b=
r>
<br>
</span>They at least try, since their features.h supports it.<br>
<span class=3D""><br>
&gt; Same for ncurses -- do they aim at SUSv2 conformance, or do they inten=
d<br>
&gt; to consider _GNU_SOURCE specifically?<br>
<br>
</span>Well, ncurses is a GNU project so I suppose they mostly care about<b=
r>
whatever Autoconf does.=C2=A0 And indeed Autoconf does have some special<br=
>
casing for -D_XOPEN_SOURCE=3D500:<br>
<br>
=C2=A0 AC_CACHE_CHECK([whether _XOPEN_SOURCE should be defined],<br>
=C2=A0 =C2=A0 [ac_cv_should_define__xopen_<wbr>source],<br>
=C2=A0 =C2=A0 [ac_cv_should_define__xopen_<wbr>source=3Dno<br>
=C2=A0 =C2=A0 =C2=A0AC_COMPILE_IFELSE(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LANG_PROGRAM([[<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #include &lt;wchar.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mbstate_t x;]])],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0[],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_COMPILE_IFELSE(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [AC_LANG_PROGRAM([[<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#define _XOPEN_SOURCE 500<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#include &lt;wchar.h&gt;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mbstate_t x;]])],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ac_cv_should_define__xopen_<wbr>source=
=3Dyes])])])<br>
=C2=A0 test $ac_cv_should_define__xopen_<wbr>source =3D yes &amp;&amp;<br>
=C2=A0 =C2=A0 AC_DEFINE([_XOPEN_SOURCE], [500])<br>
<br>
If musl needs _XOPEN_SOURCE for wchar.h, then it would be worth working<br>
around in QEMU.=C2=A0 If it&#39;s just happening with ncurses, however, it&=
#39;d be a<br>
musl bug, which should be fixed in musl or worked around in ncurses.<br>
<br>
Chad, can you check whether the programs below fails with musl:<br>
<br>
/* First program */<br>
#define _GNU_SOURCE<br>
#include &lt;wchar.h&gt;<br>
mbstate_t x;<br>
<br>
/* Second program */<br>
#include &lt;wchar.h&gt;<br>
mbstate_t x;<br>
<br>
/* Third program */<br>
#define _XOPEN_SOURCE 500<br>
#include &lt;wchar.h&gt;<br>
mbstate_t x;<br>
<br>
Just compile them with &quot;gcc foo.c -O2&quot;.<br>
<br>
Thanks,<br>
<br>
Paolo<br>
</blockquote></div><br></div>

--94eb2c075eb49d712b0548b86ec9--

