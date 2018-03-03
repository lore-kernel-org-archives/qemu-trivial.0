Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1es8d2-0005uo-0q
	for mharc-qemu-trivial@gnu.org; Sat, 03 Mar 2018 09:59:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anatoly.trosinenko@gmail.com>) id 1es8cz-0005t5-6q
	for qemu-trivial@nongnu.org; Sat, 03 Mar 2018 09:59:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anatoly.trosinenko@gmail.com>) id 1es8cy-0001sv-7e
	for qemu-trivial@nongnu.org; Sat, 03 Mar 2018 09:59:13 -0500
Received: from mail-ot0-x236.google.com ([2607:f8b0:4003:c0f::236]:45900)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <anatoly.trosinenko@gmail.com>)
	id 1es8cv-0001sE-Qc; Sat, 03 Mar 2018 09:59:09 -0500
Received: by mail-ot0-x236.google.com with SMTP id f11so11292150otj.12;
	Sat, 03 Mar 2018 06:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3cy0yAUmpHDaCK2u45NIlDuutkho4BVzim6/dI+F55M=;
	b=Csb5zA1C72cxx1kyFKEvX99bH9ivF3ATNpe+beuO6h3itza4hPf2+9HcVKJqt//Zd+
	vYIso5WPMJCVVGZTO7ze3aYSLfnjhHeaF7IEHNiIoL3Lhlo5zq6+JTTksmUluyKCURxi
	TI87Ozszll+ZM9Y5lBQSN0WWcadwnVtt4oEdK7+5JmGkg6+AUTEsoBQvPFM4n95F2779
	p+enxJemAYBR3cdTOynDcLCAtzqtqb6qGI6Duw5psrfMionTYFC6Tc/GCycX+zAdC0sF
	sMR2pRjUc83m11hzGEiAOnwuXv0SBvGfwdWuGAtMFc+770A268C/j4Yg9zsOsAUhWt1w
	T0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3cy0yAUmpHDaCK2u45NIlDuutkho4BVzim6/dI+F55M=;
	b=MTN90FjChgXBf/MOZnoN6vce93vL6a957VB5/35Yak8bnM77La56/WYKZC0dgCYuIQ
	XE9ba1H2pGkh8csf6F2UbGlwFYCpGBbJAwckn7pVdFOHHykJeKZgsXT//iSBY1LvrwrL
	b3L727z3mSUyr0M7NcnA2+EDvwHNwzDJeHDJSoG4UZUI/mXEJYh24OId+XZ9kLF9v+Lg
	Ajrh0U9H26KmpfUeeoGiYCFVa0DCN6maCxafmrL55DdEayZicMYi5tDWtvvMYMMa2MzV
	av59vk061xkD8mSLxTCKC07sHZL0ZYbmZVcrxOdPg52oKfwGJjAickqEEIg53s8CqyCw
	INzQ==
X-Gm-Message-State: AElRT7Hb27uC/zaGCm5Y0mApq/+vG4TV0udvLx0/vUgbyBxdHlw81d1i
	Ccb0oioBHRNT4zx3FqKy8z4dtKIEMOTiowywAsTz0AvaDAg=
X-Google-Smtp-Source: AG47ELtJdnnB549QNr5DVq0rf3dPlzH4b3C59kk1X0ZhUSlzYoxJiCmtJurnpvTlKoEoiOC03ckXLOYshTm0hQ91U2c=
X-Received: by 10.157.26.5 with SMTP id a5mr6270561ote.108.1520089148905; Sat,
	03 Mar 2018 06:59:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.0.169 with HTTP; Sat, 3 Mar 2018 06:59:08 -0800 (PST)
In-Reply-To: <a9fb7f08-9eeb-4120-620e-1f05715ee329@twiddle.net>
References: <20180127134908.24095-1-anatoly.trosinenko@gmail.com>
	<20180127134908.24095-2-anatoly.trosinenko@gmail.com>
	<aab013fb-5ada-6ee5-d038-0277d8ef0b24@weilnetz.de>
	<CAE5jQCfxjM9ykBCes0oDhrc0B6g8AC5Se39sXBsbZo=-dKQpyg@mail.gmail.com>
	<CAE5jQCe8O3BT=6SDdm2p7J_wxgzZTcqhyS1mfnEr=4tci9fipg@mail.gmail.com>
	<efe4a642-a220-5a40-b1e0-769a4216389d@twiddle.net>
	<CAE5jQCcCA=3kkVa=5eMZs-BGAM_p4fZG+GPu1SmQMg7_sPAH5Q@mail.gmail.com>
	<a9fb7f08-9eeb-4120-620e-1f05715ee329@twiddle.net>
From: Anatoly Trosinenko <anatoly.trosinenko@gmail.com>
Date: Sat, 3 Mar 2018 17:59:08 +0300
Message-ID: <CAE5jQCcZxx5dZaqAxMFBjrAKyfZnnLx1ARQXStBrYBvPgU5d6A@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Cc: qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="001a1141ca54bf5d350566835524"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::236
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
X-List-Received-Date: Sat, 03 Mar 2018 14:59:14 -0000

--001a1141ca54bf5d350566835524
Content-Type: text/plain; charset="UTF-8"

> So.  Why do you want to use TCI instead of a native TCG backend?

Frankly speaking, personally I just have a strange experiment on porting
QEMU to JavaScript. :) I used the TCI bytecode as some intermediate
patchable form for rarely executing BBs and for (re)generating asm.js from
it when required. I used a Python script to generate wrappers with exactly
10 arguments around helper functions. In fact, it may be worth for me to
create WebAssembly TCG backend and interpret **that** bytecode if required.

TCI may still be useful for someone else running QEMU on unsupported host,
though.

2018-03-03 17:13 GMT+03:00 Richard Henderson <rth@twiddle.net>:

> On 03/03/2018 06:07 AM, Anatoly Trosinenko wrote:
> > Can rewriting TCI in such a way that every operation is aligned at 4- or
> even
> > 8-byte boundary fix the situation or are there some more serious
> problems?
>
> With the current TCI, there are also problems with calls to helper
> functions.
> The only portable way to do this is to use a library such as libffi.
>
> I once rewrote TCI completely in order to address both problems, but that
> only
> brought questions as to why TCI is useful at all.
>
> So.  Why do you want to use TCI instead of a native TCG backend?
>
>
> r~
>

--
Best regards,
Anatoly

--001a1141ca54bf5d350566835524
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&gt; So.=C2=A0 Why do you want to use TCI instead of =
a native TCG backend?<br><br>Frankly
 speaking, personally I just have a strange experiment on porting QEMU=20
to JavaScript. :) I used the TCI bytecode as some intermediate patchable
 form for rarely executing BBs and for (re)generating asm.js from it=20
when required. I used  a Python script to generate wrappers with exactly
 10 arguments around helper functions. In fact, it may be worth for me=20
to create WebAssembly TCG backend and interpret **that** bytecode if=20
required.<br><br></div>TCI may still be useful for someone else running QEM=
U on unsupported host, though.<br><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">2018-03-03 17:13 GMT+03:00 Richard Henderson <span dir=3D"=
ltr">&lt;<a href=3D"mailto:rth@twiddle.net" target=3D"_blank">rth@twiddle.n=
et</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 03=
/03/2018 06:07 AM, Anatoly Trosinenko wrote:<br>
&gt; Can rewriting TCI in such a way that every operation is aligned at 4- =
or even<br>
&gt; 8-byte boundary fix the situation or are there some more serious probl=
ems?<br>
<br>
</span>With the current TCI, there are also problems with calls to helper f=
unctions.<br>
The only portable way to do this is to use a library such as libffi.<br>
<br>
I once rewrote TCI completely in order to address both problems, but that o=
nly<br>
brought questions as to why TCI is useful at all.<br>
<br>
So.=C2=A0 Why do you want to use TCI instead of a native TCG backend?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
r~<br>
</font></span></blockquote></div><br>--<br></div><div class=3D"gmail_extra"=
>Best regards,<br></div><div class=3D"gmail_extra">Anatoly<br>
</div></div>

--001a1141ca54bf5d350566835524--

