Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1es8Ld-0000BS-RE
	for mharc-qemu-trivial@gnu.org; Sat, 03 Mar 2018 09:41:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anatoly.trosinenko@gmail.com>) id 1es7UQ-0005ax-Ur
	for qemu-trivial@nongnu.org; Sat, 03 Mar 2018 08:46:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anatoly.trosinenko@gmail.com>) id 1es7UP-0006Ju-LA
	for qemu-trivial@nongnu.org; Sat, 03 Mar 2018 08:46:18 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:39593)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <anatoly.trosinenko@gmail.com>)
	id 1es7UL-0006It-Dw; Sat, 03 Mar 2018 08:46:13 -0500
Received: by mail-oi0-x241.google.com with SMTP id t185so9031337oif.6;
	Sat, 03 Mar 2018 05:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IRo1muRzFgo+yR/c5sHWfgZyF4KWE2ty5BaQmh1l6Ac=;
	b=j0B97fUW5bR21Jk+lXTDN5vk+x9I7st0nvP16NQppa9ZeIriSsWPkD21pysYJXB0nw
	0qKFy81ceTbxCue3ZIHTUAAm1Ge642MHAmwZOJ2BnYrqN+yx02jHUeJnsUNKOeQoy8eP
	i3VVHYnVwL92JM0Ud8bSe8rPJMhGLucuPv1sepsOU0m4i34l5KapiqzxPUzZP8sdZdSb
	Y9DxWkPVZHcpYjciERz3gN+xAhyKvV8YgC5UJ96WdcT7dIWCo0qliCsxbCWby/l03LLn
	dmWdzb8JeYUQyX7167cpxnvkHlUtwl75gJSvIbR4sLM5WTKJoySS8Hpr9/zXPXIk1Ew7
	3KzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IRo1muRzFgo+yR/c5sHWfgZyF4KWE2ty5BaQmh1l6Ac=;
	b=GUVCjKix12+kuCLue0JoXgYeAn5THcisq0bgu06rnKcBf4rr5QCDWhXwPvewrfavGW
	9FlVJlOaIQr3Vx8/jXsUn7CKMI77cMzRczFZjCoM8r6Zz0kOSWNBDQXbRpW9uXvcfsg6
	pFNCWYdKFnUKUm6BiwZ0+MN8fd6n28+bI2cF8ETW01T/tXwgpbcWPMdUwSvR0eZ/dLiN
	8Av64YTKtyni52THCIYIF1udVcy+eyCtU+gvmwPxGVLGNzqTYpRcSZY/dc6oQxroAa00
	zCarqNrgGEOh6IYk1iqSjD88x9C5p/Iszc4vZES0JaxQ6pPBKP2g5FyFWu0vVF2oo5jw
	LsOQ==
X-Gm-Message-State: APf1xPBpc2VP/6DrClyfdHiwusKd3qBqhYAw+yNSmOVLHdGqJUGdX/PH
	L4a2m19u22DQEocfFfYpRAZNZfYVtVGzvjy3K17AlQnc
X-Google-Smtp-Source: AG47ELtYnqgY2PKUQ8iU7Ww23wXEyrRveCS5vtdb+s4T/45mSUQ15dsZuzRjvxGPdyvc6ytTFNyoneKNesF0jhQq5a8=
X-Received: by 10.202.169.140 with SMTP id s134mr5621173oie.318.1520067290557; 
	Sat, 03 Mar 2018 00:54:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.0.169 with HTTP; Sat, 3 Mar 2018 00:54:50 -0800 (PST)
In-Reply-To: <CAE5jQCfxjM9ykBCes0oDhrc0B6g8AC5Se39sXBsbZo=-dKQpyg@mail.gmail.com>
References: <20180127134908.24095-1-anatoly.trosinenko@gmail.com>
	<20180127134908.24095-2-anatoly.trosinenko@gmail.com>
	<aab013fb-5ada-6ee5-d038-0277d8ef0b24@weilnetz.de>
	<CAE5jQCfxjM9ykBCes0oDhrc0B6g8AC5Se39sXBsbZo=-dKQpyg@mail.gmail.com>
From: Anatoly Trosinenko <anatoly.trosinenko@gmail.com>
Date: Sat, 3 Mar 2018 11:54:50 +0300
Message-ID: <CAE5jQCe8O3BT=6SDdm2p7J_wxgzZTcqhyS1mfnEr=4tci9fipg@mail.gmail.com>
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>, Richard Henderson <rth@twiddle.net>,
	qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="001a113cd4f6e371f605667e3e0c"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
X-Mailman-Approved-At: Sat, 03 Mar 2018 09:41:16 -0500
Subject: Re: [Qemu-trivial] [PATCH 1/1] tci: eliminate UB due to unaligned
 reads
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
X-List-Received-Date: Sat, 03 Mar 2018 13:46:20 -0000

--001a113cd4f6e371f605667e3e0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping.
Patchwork link: http://patchwork.ozlabs.org/patch/866732/
Patchew link: http://patchew.org/QEMU/20180127134908.24095-1-anatoly.
trosinenko@gmail.com/

The code in tcg/tci.c reads some data from TCI bytecode through
pointer dereferencing. As far as I know unaligned reads in such a way are
undefined behavior and compiling with -fsanitize=3Dundefined enumerated
them as such at run-time.

I have replaced such reads with invocations of ld{l,q}_he_p.
A comment in include/qemu/bswap.h:310 suggests they should be properly
translated by the compiler. I didn't added signed/unsigned casts
since bswap.h does contain separate signed/unsigned versions
for 16-bit integers but does not for 32- and 64-bit ones, so I supposed
the developers of the bswap.h already arranged everything so
integer promotions don't mess things up. I can add casts in case I'm
not right about it.
http://lists.nongnu.org/archive/html/qemu-devel/2018-01/msg06516.html

2018-01-28 9:42 GMT+03:00 Anatoly Trosinenko <anatoly.trosinenko@gmail.com>=
:

> My patch is kind of trivial quick fix that just eliminates these unaligne=
d
> reads and doesn't seem to require complicated testing supposing my code
> properly handles integer promotion (and hope it will not slow the
> interpreter down).
>
> Aligning everything, on the other hand, can not only remove the UB but
> also speed things up, but if I get it right, requires O(opcode count)
> manual work and subsequent less trivial testing that every opcode's
> argument layout match on generation and interpretation side (errors shoul=
d
> be significantly localized due to present assertion on operation size,
> though). So my patch may be considered as temporary solution.
>
> In fact, I had to similarly make these unaligned reads explicit when
> porting QEMU to JavaScript because Emscripten hugely relies on absence of
> some kinds of UB such as "implicit" unaligned accesses, and such fix seem=
ed
> to resolve this issue for me on "host with special alignment requirement"=
.
>
>
> 2018-01-27 19:38 GMT+03:00 Stefan Weil <sw@weilnetz.de>:
>
>> Am 27.01.2018 um 14:49 schrieb Anatoly Trosinenko:
>> > Use ldl_he_p / ldq_he_p functions instead of a plain memory access
>> > through pointer.
>> >
>> > Signed-off-by: Anatoly Trosinenko <anatoly.trosinenko@gmail.com>
>> > ---
>> >  tcg/tci.c | 16 +++++++++++-----
>> >  1 file changed, 11 insertions(+), 5 deletions(-)
>>
>> A better alternative might be aligning the relevant data when generating
>> the bytecode. See also my comment on alignment in tcg/tci/README.
>>
>> Stefan
>>
>>
>
>
> --
> =D0=A1 =D1=83=D0=B2=D0=B0=D0=B6=D0=B5=D0=BD=D0=B8=D0=B5=D0=BC,
> =D0=90=D0=BD=D0=B0=D1=82=D0=BE=D0=BB=D0=B8=D0=B9 =D0=A2=D1=80=D0=BE=D1=81=
=D0=B8=D0=BD=D0=B5=D0=BD=D0=BA=D0=BE
> e-mail: anatoly.trosinenko@gmail.com
>



--=20
=D0=A1 =D1=83=D0=B2=D0=B0=D0=B6=D0=B5=D0=BD=D0=B8=D0=B5=D0=BC,
=D0=90=D0=BD=D0=B0=D1=82=D0=BE=D0=BB=D0=B8=D0=B9 =D0=A2=D1=80=D0=BE=D1=81=
=D0=B8=D0=BD=D0=B5=D0=BD=D0=BA=D0=BE
e-mail: anatoly.trosinenko@gmail.com

--001a113cd4f6e371f605667e3e0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Ping.<br>Patchwork link: <a href=3D"http://patchwork.=
ozlabs.org/patch/866732/" target=3D"_blank">http://patchwork.ozlabs.org/pa<=
wbr>tch/866732/</a><br></div>Patchew link: <a href=3D"http://patchew.org/QE=
MU/20180127134908.24095-1-anatoly.trosinenko@gmail.com/" target=3D"_blank">=
http://patchew.org/QEMU/201801<wbr>27134908.24095-1-anatoly.<wbr>trosinenko=
@gmail.com/</a><br><br>The code in tcg/tci.c reads some data from TCI bytec=
ode through<br>
pointer dereferencing. As far as I know unaligned reads in such a way are<b=
r>
undefined behavior and compiling with -fsanitize=3Dundefined enumerated<br>
them as such at run-time.<br>
<br>
I have replaced such reads with invocations of ld{l,q}_he_p.<br>
A comment in include/qemu/bswap.h:310 suggests they should be properly<br>
translated by the compiler. I didn&#39;t added signed/unsigned casts<br>
since bswap.h does contain separate signed/unsigned versions<br>
for 16-bit integers but does not for 32- and 64-bit ones, so I supposed<br>
the developers of the bswap.h already arranged everything so<br>
integer promotions don&#39;t mess things up. I can add casts in case I&#39;=
m<br>
not right about it.<br><a href=3D"http://lists.nongnu.org/archive/html/qemu=
-devel/2018-01/msg06516.html" target=3D"_blank">http://lists.nongnu.org/<wb=
r>archive/html/qemu-devel/2018-<wbr>01/msg06516.html</a><br></div><div clas=
s=3D"gmail_extra"><br><div class=3D"gmail_quote">2018-01-28 9:42 GMT+03:00 =
Anatoly Trosinenko <span dir=3D"ltr">&lt;<a href=3D"mailto:anatoly.trosinen=
ko@gmail.com" target=3D"_blank">anatoly.trosinenko@gmail.com</a>&gt;</span>=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><span class=3D""><div>=
<div>My patch is kind of trivial quick fix that just eliminates=20
these unaligned reads and doesn&#39;t seem to require complicated testing=
=20
supposing my code properly handles integer promotion (and hope it will=20
not slow the interpreter down).<br><br></div>Aligning everything, on the
 other hand, can not only remove the UB but also speed things up, but if
 I get it right, requires O(opcode count) manual work and subsequent=20
less trivial testing that every opcode&#39;s argument layout match on=20
generation and interpretation side (errors should be significantly=20
localized due to present assertion on operation size, though). So my=20
patch may be considered as temporary solution.<br><br></div>In fact, I=20
had to similarly make these unaligned reads explicit when porting QEMU=20
to JavaScript because Emscripten hugely relies on absence of some kinds=20
of UB such as &quot;implicit&quot; unaligned accesses, and such fix seemed =
to=20
resolve this issue for me on &quot;host with special alignment requirement&=
quot;.</span><div class=3D"m_-8379512254039344552gmail-yj6qo m_-83795122540=
39344552gmail-ajU"><div id=3D"m_-8379512254039344552gmail-:h3" class=3D"m_-=
8379512254039344552gmail-ajR"><img class=3D"m_-8379512254039344552gmail-ajT=
" src=3D"https://ssl.gstatic.com/ui/v1/icons/mail/images/cleardot.gif"><br>=
</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><span=
 class=3D"">2018-01-27 19:38 GMT+03:00 Stefan Weil <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:sw@weilnetz.de" target=3D"_blank">sw@weilnetz.de</a>&gt;</s=
pan>:<br></span><div><div class=3D"h5"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span=
>Am 27.01.2018 um 14:49 schrieb Anatoly Trosinenko:<br>
&gt; Use ldl_he_p / ldq_he_p functions instead of a plain memory access<br>
&gt; through pointer.<br>
&gt;<br>
&gt; Signed-off-by: Anatoly Trosinenko &lt;<a href=3D"mailto:anatoly.trosin=
enko@gmail.com" target=3D"_blank">anatoly.trosinenko@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tcg/tci.c | 16 +++++++++++-----<br>
&gt;=C2=A0 1 file changed, 11 insertions(+), 5 deletions(-)<br>
<br>
</span>A better alternative might be aligning the relevant data when genera=
ting<br>
the bytecode. See also my comment on alignment in tcg/tci/README.<br>
<span class=3D"m_-8379512254039344552HOEnZb"><font color=3D"#888888"><br>
Stefan<br>
<br>
</font></span></blockquote></div></div></div><br><br clear=3D"all"><span cl=
ass=3D""><br>-- <br><div class=3D"m_-8379512254039344552gmail_signature" da=
ta-smartmail=3D"gmail_signature">=D0=A1 =D1=83=D0=B2=D0=B0=D0=B6=D0=B5=D0=
=BD=D0=B8=D0=B5=D0=BC,<br>=D0=90=D0=BD=D0=B0=D1=82=D0=BE=D0=BB=D0=B8=D0=B9 =
=D0=A2=D1=80=D0=BE=D1=81=D0=B8=D0=BD=D0=B5=D0=BD=D0=BA=D0=BE<br>e-mail: <a =
href=3D"mailto:anatoly.trosinenko@gmail.com" target=3D"_blank">anatoly.tros=
inenko@gmail.com</a></div>
</span></div></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature">=D0=A1 =D1=83=D0=B2=D0=B0=D0=B6=
=D0=B5=D0=BD=D0=B8=D0=B5=D0=BC,<br>=D0=90=D0=BD=D0=B0=D1=82=D0=BE=D0=BB=D0=
=B8=D0=B9 =D0=A2=D1=80=D0=BE=D1=81=D0=B8=D0=BD=D0=B5=D0=BD=D0=BA=D0=BE<br>e=
-mail: <a href=3D"mailto:anatoly.trosinenko@gmail.com" target=3D"_blank">an=
atoly.trosinenko@gmail.com</a></div>
</div>

--001a113cd4f6e371f605667e3e0c--

