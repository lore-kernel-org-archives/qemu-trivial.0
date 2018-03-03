Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1es8Lc-0000AG-MI
	for mharc-qemu-trivial@gnu.org; Sat, 03 Mar 2018 09:41:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52819)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anatoly.trosinenko@gmail.com>) id 1es7p7-0004F0-K1
	for qemu-trivial@nongnu.org; Sat, 03 Mar 2018 09:07:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anatoly.trosinenko@gmail.com>) id 1es7p6-0002ly-EU
	for qemu-trivial@nongnu.org; Sat, 03 Mar 2018 09:07:41 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:32796)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <anatoly.trosinenko@gmail.com>)
	id 1es7p4-0002ig-4t; Sat, 03 Mar 2018 09:07:38 -0500
Received: by mail-oi0-x243.google.com with SMTP id e9so2421451oii.0;
	Sat, 03 Mar 2018 06:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N96R2qxZDrQPK9KXR9KAKRelBaj+7G+xUvvkapFhMGk=;
	b=d3kTvzaQYm4nfoMVqH+gUSfvBfkMtNZIlWMTyJD074YqWU62Jh5FBX4y5UDvghMSzJ
	/h+knhweosyotwlXuzhsRouNDTyi63iOLq9NTqv24mTsvUUsjhfkLrY2RZf1qmOQD9X1
	SFg1alsANfH1Dfdntilvxgu7Q9IHr8ZUTkSWb3Tz5wmX4mrDazsO7lYU6d8Fy65ZRU5s
	Dc5bdNH6QZVki08z2XOmQrIYgymgYrmGYPo1RPlRrch9IYrzFyPBqmW9OlQy4vi+A+x3
	jrwsw3Y+fA+onP6Dxga4kPI2zbMHvUyf/YihdCZ0K/lfHwREZQGKU9G0uR9DQCrZ6AP2
	4G7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N96R2qxZDrQPK9KXR9KAKRelBaj+7G+xUvvkapFhMGk=;
	b=fn0LfFbEYkVnClzLBo0HFkYHuJZxqThW5Qqklc/N8bOoiSOdt7y738GtF4GzPjhPp9
	AJDt2S3tsdg8TSdb86rYEXk3xRbRrSsGVxgMTA66sUz6ifzGT0tHPHtjMIrFpdHOGeZ3
	9iivz7ZdCod2sVzul9tPv0p+NmiIKSDnMpM4DP1/CqT7LZ6taOtSfhZpxhF2xeoS+gMe
	paN55q20gNn+SbNl3rJNoVGYnNLvhymT/gz1XlfPhsaEBtBn5G8JqAmm7CTzyZ59GKOc
	S3QS+n2DqxYA7uxXAxfe5/4z04Q4UumRut2eGqX9shcY2mjwdLeWbZ8xironZTWAxAye
	S2Fw==
X-Gm-Message-State: APf1xPBByXX8589UUcAJxcLTcYL1jUQizsAIWCxoTJ4sWabHeU45dOZ6
	AAlgzGijR25Z2wvcz3ufQfcyJ/TtvLxijB5lpaY=
X-Google-Smtp-Source: AG47ELuIbIVkkefgO9P9juYKBBRPh//6Ow0iyNhSwMsEIraBL8IciDy4rpPFTYkNTAtSuNVwtTrBrqVHXXA8/1ViqVw=
X-Received: by 10.202.240.212 with SMTP id o203mr6141263oih.182.1520086057538; 
	Sat, 03 Mar 2018 06:07:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.0.169 with HTTP; Sat, 3 Mar 2018 06:07:37 -0800 (PST)
In-Reply-To: <efe4a642-a220-5a40-b1e0-769a4216389d@twiddle.net>
References: <20180127134908.24095-1-anatoly.trosinenko@gmail.com>
	<20180127134908.24095-2-anatoly.trosinenko@gmail.com>
	<aab013fb-5ada-6ee5-d038-0277d8ef0b24@weilnetz.de>
	<CAE5jQCfxjM9ykBCes0oDhrc0B6g8AC5Se39sXBsbZo=-dKQpyg@mail.gmail.com>
	<CAE5jQCe8O3BT=6SDdm2p7J_wxgzZTcqhyS1mfnEr=4tci9fipg@mail.gmail.com>
	<efe4a642-a220-5a40-b1e0-769a4216389d@twiddle.net>
From: Anatoly Trosinenko <anatoly.trosinenko@gmail.com>
Date: Sat, 3 Mar 2018 17:07:37 +0300
Message-ID: <CAE5jQCcCA=3kkVa=5eMZs-BGAM_p4fZG+GPu1SmQMg7_sPAH5Q@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Cc: qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="94eb2c0919dc7cd9ea0566829d36"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
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
X-List-Received-Date: Sat, 03 Mar 2018 14:07:44 -0000

--94eb2c0919dc7cd9ea0566829d36
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can rewriting TCI in such a way that every operation is aligned at 4- or
even 8-byte boundary fix the situation or are there some more serious
problems?

2018-03-03 16:57 GMT+03:00 Richard Henderson <rth@twiddle.net>:

> On 03/03/2018 12:54 AM, Anatoly Trosinenko wrote:
> > Ping.
> > Patchwork link: http://patchwork.ozlabs.org/patch/866732/
> > <http://patchwork.ozlabs.org/patch/866732/>
> > Patchew link:
> > http://patchew.org/QEMU/20180127134908.24095-1-
> anatoly.trosinenko@gmail.com/
> > <http://patchew.org/QEMU/20180127134908.24095-1-
> anatoly.trosinenko@gmail.com/>
> >
> > The code in tcg/tci.c reads some data from TCI bytecode through
> > pointer dereferencing. As far as I know unaligned reads in such a way a=
re
> > undefined behavior and compiling with -fsanitize=3Dundefined enumerated
> > them as such at run-time.
>
> This is exactly one of the reasons why I have urged for TCI to be
> abandoned.
>
> While your patch works, it is *enormously* inefficient for hosts that
> require it.
>
>
> r~
>



--=20
=D0=A1 =D1=83=D0=B2=D0=B0=D0=B6=D0=B5=D0=BD=D0=B8=D0=B5=D0=BC,
=D0=90=D0=BD=D0=B0=D1=82=D0=BE=D0=BB=D0=B8=D0=B9 =D0=A2=D1=80=D0=BE=D1=81=
=D0=B8=D0=BD=D0=B5=D0=BD=D0=BA=D0=BE
e-mail: anatoly.trosinenko@gmail.com

--94eb2c0919dc7cd9ea0566829d36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can rewriting TCI in such a way that every operation is al=
igned at 4- or even 8-byte boundary fix the situation or are there some mor=
e serious problems?<br></div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">2018-03-03 16:57 GMT+03:00 Richard Henderson <span dir=3D"ltr">=
&lt;<a href=3D"mailto:rth@twiddle.net" target=3D"_blank">rth@twiddle.net</a=
>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 03/03/2=
018 12:54 AM, Anatoly Trosinenko wrote:<br>
&gt; Ping.<br>
&gt; Patchwork link: <a href=3D"http://patchwork.ozlabs.org/patch/866732/" =
rel=3D"noreferrer" target=3D"_blank">http://patchwork.ozlabs.org/<wbr>patch=
/866732/</a><br>
&gt; &lt;<a href=3D"http://patchwork.ozlabs.org/patch/866732/" rel=3D"noref=
errer" target=3D"_blank">http://patchwork.ozlabs.org/<wbr>patch/866732/</a>=
&gt;<br>
&gt; Patchew link:<br>
&gt; <a href=3D"http://patchew.org/QEMU/20180127134908.24095-1-anatoly.tros=
inenko@gmail.com/" rel=3D"noreferrer" target=3D"_blank">http://patchew.org/=
QEMU/<wbr>20180127134908.24095-1-<wbr>anatoly.trosinenko@gmail.com/</a><br>
&gt; &lt;<a href=3D"http://patchew.org/QEMU/20180127134908.24095-1-anatoly.=
trosinenko@gmail.com/" rel=3D"noreferrer" target=3D"_blank">http://patchew.=
org/QEMU/<wbr>20180127134908.24095-1-<wbr>anatoly.trosinenko@gmail.com/</a>=
&gt;<br>
&gt;<br>
&gt; The code in tcg/tci.c reads some data from TCI bytecode through<br>
&gt; pointer dereferencing. As far as I know unaligned reads in such a way =
are<br>
&gt; undefined behavior and compiling with -fsanitize=3Dundefined enumerate=
d<br>
&gt; them as such at run-time.<br>
<br>
</span>This is exactly one of the reasons why I have urged for TCI to be ab=
andoned.<br>
<br>
While your patch works, it is *enormously* inefficient for hosts that requi=
re it.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
r~<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">=D0=A1 =D1=83=D0=
=B2=D0=B0=D0=B6=D0=B5=D0=BD=D0=B8=D0=B5=D0=BC,<br>=D0=90=D0=BD=D0=B0=D1=82=
=D0=BE=D0=BB=D0=B8=D0=B9 =D0=A2=D1=80=D0=BE=D1=81=D0=B8=D0=BD=D0=B5=D0=BD=
=D0=BA=D0=BE<br>e-mail: <a href=3D"mailto:anatoly.trosinenko@gmail.com" tar=
get=3D"_blank">anatoly.trosinenko@gmail.com</a></div>
</div>

--94eb2c0919dc7cd9ea0566829d36--

