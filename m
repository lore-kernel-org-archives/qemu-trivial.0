Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gehMn-0005Hf-Sn
	for mharc-qemu-trivial@gnu.org; Wed, 02 Jan 2019 09:19:29 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcfaracco@gmail.com>) id 1gehMl-0005FZ-Ro
	for qemu-trivial@nongnu.org; Wed, 02 Jan 2019 09:19:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcfaracco@gmail.com>) id 1gehMk-0007xP-Tb
	for qemu-trivial@nongnu.org; Wed, 02 Jan 2019 09:19:27 -0500
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144]:56070)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jcfaracco@gmail.com>)
	id 1gehMk-0007vO-MD; Wed, 02 Jan 2019 09:19:26 -0500
Received: by mail-it1-x144.google.com with SMTP id m62so41013087ith.5;
	Wed, 02 Jan 2019 06:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hbwuruvBIiJ6p3zL721uaxTSW3sI/l4UtB7GuS54QEc=;
	b=XDimDj23fXI7jhQ/rADUWjn5ASGECQ/YkSACCM28CYJnbfX/3IEeUNY/MWAGlklqBr
	V0eHY8dLMoH4NDb1HXNGcd87bRSpnfctzAEOVtroW8Lqwr8uq7TuCJrp8NMdH23WGP8C
	+/YFmBrPVibrNaF9MyHecO/aoJvoc01NqJqrIyPFVfx1/alZq3lQ1vtbZvvrc861bG68
	62W08PGWrbjgmetbD09VWf3Jq6DXDAh2CAtInsJmnGyMgTKhh0mnhd5bD8pz+hQc/xl5
	S75cB70TxPNiCfKFO5YvdxeYz1jeKlY6v6+T0OxOY8gXFtoLyU/ZPZpq1Ti3coo6Xh1z
	3fQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hbwuruvBIiJ6p3zL721uaxTSW3sI/l4UtB7GuS54QEc=;
	b=FHML2yzRYt+kjVpmMMzybb5wUy+isNLR8vseQi+Ym+zPes3IF2jHWj7KaBWVlb+YOY
	99C3IryrUzAsw1WpU5VWh1ZprzY6T47ih5ETqisO2/Iwiyxp8Q87czFzJjZtkiB8Cj8u
	MpQadYXvRVyVgxsRpMojhuK7aHWgbFWC/lWcEX8d8ipv5YNV1h45NtqYfCbbeR+g8orB
	XIGjEbuGJhkuGSCC9XI93OJ/mWqQjuORJo/m7qTdmiDFdhOsXobXrAmzN9FOjhXgC8na
	tIY/IroNUrB8irEVbKFdY3fVAP3Bcr9nWKii/f4dt5gEaLb/fBGTu9Uno+OPVCb+i01b
	u0Ew==
X-Gm-Message-State: AA+aEWYwrfaqMj5whXSQU5DZYiu/Hf0egC2oTDuKDdDUYDhuR/YmZl5Q
	yXHwT8ik9OH64j+UBGib6KTy/fBKkOgsj8GxSms=
X-Google-Smtp-Source: AFSGD/WFGbQyPWdGwl77swNxv21GurhTH4dL8wcyPhtNM1+/CjPX1UYNpa+nOpZ3+ZXiLhQqyJtBgpQ/yMfOW8PbO2Q=
X-Received: by 2002:a24:3609:: with SMTP id l9mr29831311itl.142.1546438762900; 
	Wed, 02 Jan 2019 06:19:22 -0800 (PST)
MIME-Version: 1.0
References: <20181221135803.9583-1-npes87184@gmail.com>
	<20190102104659.GG24009@stefanha-x1.localdomain>
In-Reply-To: <20190102104659.GG24009@stefanha-x1.localdomain>
From: Julio Faracco <jcfaracco@gmail.com>
Date: Wed, 2 Jan 2019 12:19:12 -0200
Message-ID: <CAENf94JObEbH6tm53itn8zMZsJak3JUD9TkkSqzgeEwnjRDQUw@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: yuchenlin <npes87184@gmail.com>, qemu-trivial@nongnu.org, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000021342b057e7a5512"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::144
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH] dmg: fix binary search
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
X-List-Received-Date: Wed, 02 Jan 2019 14:19:28 -0000

--00000000000021342b057e7a5512
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

I created a simple DMG file from MacOS to reproduce the problem:
https://bugs.launchpad.net/qemu/+bug/1809304

Em qua, 2 de jan de 2019 =C3=A0s 08:47, Stefan Hajnoczi <stefanha@redhat.co=
m>
escreveu:

> On Fri, Dec 21, 2018 at 09:58:03PM +0800, yuchenlin wrote:
> > There is a possible hang in original binary searsh implemtation. That i=
s
> > if chunk1 =3D 4, chunk2 =3D 5, chunk3 =3D 4, and we go else case.
> >
> > The chunk1 will be still 4, and so on.
> >
> > Signed-off-by: yuchenlin <npes87184@gmail.com>
> > ---
> >  block/dmg.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
>
> Do you have an example dmg file that triggers this bug?
>
> > diff --git a/block/dmg.c b/block/dmg.c
> > index 50e91aef6d..0e05702f5d 100644
> > --- a/block/dmg.c
> > +++ b/block/dmg.c
> > @@ -572,14 +572,14 @@ static inline uint32_t search_chunk(BDRVDMGState
> *s, uint64_t sector_num)
> >  {
> >      /* binary search */
> >      uint32_t chunk1 =3D 0, chunk2 =3D s->n_chunks, chunk3;
> > -    while (chunk1 !=3D chunk2) {
> > +    while (chunk1 <=3D chunk2) {
> >          chunk3 =3D (chunk1 + chunk2) / 2;
> >          if (s->sectors[chunk3] > sector_num) {
> > -            chunk2 =3D chunk3;
> > +            chunk2 =3D chunk3 - 1;
>
> What if chunk1 =3D 0 and chunk2 =3D 1?  chunk3 =3D 0 and the new chunk2 v=
alue
> would be 0xffffffff so the loop continues with out-of-bounds sectors[]
> accesses!
>

--00000000000021342b057e7a5512
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div><div class=3D"gmail=
_signature">Hi Stefan,</div></div><div class=3D"gmail_signature"><br></div>=
<div class=3D"gmail_signature">I created a simple DMG file from MacOS to re=
produce the problem:<br><a href=3D"https://bugs.launchpad.net/qemu/+bug/180=
9304">https://bugs.launchpad.net/qemu/+bug/1809304</a><br></div></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr">Em qua, 2 de jan de 2019 =
=C3=A0s 08:47, Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com">s=
tefanha@redhat.com</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Fri, Dec 21, 2018 at 09:58:03PM +0800, yuchenlin wr=
ote:<br>
&gt; There is a possible hang in original binary searsh implemtation. That =
is<br>
&gt; if chunk1 =3D 4, chunk2 =3D 5, chunk3 =3D 4, and we go else case.<br>
&gt; <br>
&gt; The chunk1 will be still 4, and so on.<br>
&gt; <br>
&gt; Signed-off-by: yuchenlin &lt;<a href=3D"mailto:npes87184@gmail.com" ta=
rget=3D"_blank">npes87184@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 block/dmg.c | 6 +++---<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
Do you have an example dmg file that triggers this bug?<br>
<br>
&gt; diff --git a/block/dmg.c b/block/dmg.c<br>
&gt; index 50e91aef6d..0e05702f5d 100644<br>
&gt; --- a/block/dmg.c<br>
&gt; +++ b/block/dmg.c<br>
&gt; @@ -572,14 +572,14 @@ static inline uint32_t search_chunk(BDRVDMGState=
 *s, uint64_t sector_num)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* binary search */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint32_t chunk1 =3D 0, chunk2 =3D s-&gt;n_chunks, =
chunk3;<br>
&gt; -=C2=A0 =C2=A0 while (chunk1 !=3D chunk2) {<br>
&gt; +=C2=A0 =C2=A0 while (chunk1 &lt;=3D chunk2) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chunk3 =3D (chunk1 + chunk2) / 2;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;sectors[chunk3] &gt; secto=
r_num) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chunk2 =3D chunk3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chunk2 =3D chunk3 - 1;<br>
<br>
What if chunk1 =3D 0 and chunk2 =3D 1?=C2=A0 chunk3 =3D 0 and the new chunk=
2 value<br>
would be 0xffffffff so the loop continues with out-of-bounds sectors[]<br>
accesses!<br>
</blockquote></div></div>

--00000000000021342b057e7a5512--

