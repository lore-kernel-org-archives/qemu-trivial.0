Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h0oHn-0006Fw-NE
	for mharc-qemu-trivial@gnu.org; Mon, 04 Mar 2019 09:09:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <davidkiarie4@gmail.com>) id 1h0m3w-0003dK-H4
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2019 06:47:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <davidkiarie4@gmail.com>) id 1h0m3v-0006x3-Cs
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2019 06:47:16 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:37569)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <davidkiarie4@gmail.com>)
	id 1h0m3s-0006vH-Hb; Mon, 04 Mar 2019 06:47:12 -0500
Received: by mail-ot1-x332.google.com with SMTP id b3so3957070otp.4;
	Mon, 04 Mar 2019 03:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/63pi0kKB+Ap6W8BNWdBAFfT7cV9XohEf2lTD519Kds=;
	b=pDrIRLMFTQvxkquNXPF/J7aQIH25wBA5yFsdT240Yjgnrqhoo8UU7Uq4HKxhzoxNRZ
	H9jB5FwiVRGH/txv6p3ql6YwQi25agT/EO2JgsmR15duKU6lwuwktR6SgMmS9LZ2ohcL
	nI1G1B57tMNkNjr8LYON42J4xWo8mLMyfspsvcMR3ZTg4bzrHsoNgmg20I+WMXwBPoS9
	3m53jH9YxN8q8Z5+fLSzO8u7g+I4J9UuR/MtvzIrIpw1Kl/p/nlqCxqm83FH55GLq9ij
	jpxVYeFVvyLiQI27vPZmcXJ05AaRDiso12xoGq68y8Ey11RCs7zgk03OCtMiR3AnE723
	Wpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/63pi0kKB+Ap6W8BNWdBAFfT7cV9XohEf2lTD519Kds=;
	b=tsdpbmBEK9cqNMMsUKmLG2ibvHRdIYJeR83X4Xk01Ip3XkwoUnRd9A+l2rdRuVbbY9
	RZI/7SUx/Af8Ts/yCoVkkyheEVq2TKa+KEXQ1jQfp5xfl7xAykc/0bXg27JNhfVgkG7q
	HiKcTsnmDt79vH0gbwVRoPhqBOVPCatQk2JQUdRq7kNg62CU0BLdvtCrSZ+4jfwaYDZs
	ZBPtSZh8gYpzXt2Y6GS2LnMQZX7Ii2+7gj65oizwKIP0N8l7cxQBVphGUNK+g4/0WpW4
	642CbZXbote1qMLowAKmQR/skyHQSaBR+lOoQDE/e7SsMavCxlgqQ0lod5nHz8rQeKOS
	gPUQ==
X-Gm-Message-State: APjAAAUmDm/Xnq3GvfawEVqpAwzms1GPBO4/D9OARXeHqwHeVfny1mN3
	12DJb6ogVUN1R3wmplHWqmR69CAA1J1tKXD3eDk=
X-Google-Smtp-Source: APXvYqwwXapvm+GOI7Ha2z2VSNsvruyDvTq37hmb0zrVR4nUViw/V4uMbwvt1pIxqvm9IXmYCVEeKRE4LMrcBtDS0A4=
X-Received: by 2002:a9d:6d94:: with SMTP id x20mr11811557otp.78.1551700031590; 
	Mon, 04 Mar 2019 03:47:11 -0800 (PST)
MIME-Version: 1.0
References: <20190223105421.1290-1-davidkiarie4@gmail.com>
	<20190223105421.1290-2-davidkiarie4@gmail.com>
	<20190225103856.GE29260@redhat.com>
	<CABdVeAA0f9ra1RnJDQfvuecSwmYLKiTNoMTSLEfkysV+KjedTw@mail.gmail.com>
	<fb6d8090-baa3-cb78-c975-2c5383874e19@redhat.com>
In-Reply-To: <fb6d8090-baa3-cb78-c975-2c5383874e19@redhat.com>
From: David Kiarie <davidkiarie4@gmail.com>
Date: Mon, 4 Mar 2019 14:46:23 +0300
Message-ID: <CABdVeADcw9s8_ux9zQtG1LAp_0jFQXrY0EqCET8d-Xcj1J+zVw@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>,
	Peter Xu <peterx@redhat.com>, 
	=?UTF-8?Q?Alexandro_S=C3=A1nchez_Bach?= <alexaltea123@gmail.com>, 
	Richard Henderson <rth@twiddle.net>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000002e57390583435185"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::332
X-Mailman-Approved-At: Mon, 04 Mar 2019 09:09:42 -0500
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/1] hw/i386: update
 copyright notice
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
X-List-Received-Date: Mon, 04 Mar 2019 11:47:17 -0000

--0000000000002e57390583435185
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2019 at 2:45 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 04/03/19 12:22, David Kiarie wrote:
> >
> >
> >
> > On Mon, Feb 25, 2019 at 1:39 PM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com
> > <mailto:berrange@redhat.com>> wrote:
> >
> >     On Sat, Feb 23, 2019 at 01:54:21PM +0300, David Kiarie wrote:
> >     > Signed-off-by: David Kiarie <davidkiarie4@gmail.com
> >     <mailto:davidkiarie4@gmail.com>>
> >     > ---
> >     >  hw/i386/amd_iommu.c | 2 +-
> >     >  hw/i386/amd_iommu.h | 2 +-
> >     >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> >     Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com
> >     <mailto:berrange@redhat.com>>
> >
> >
> > hello,
> >
> > i expected this really simple patch to probably get merged right away.
>
> Patches are usually bundled by maintainers, they do not get merged right
> away unless they fix a broken build.
>

i see.


>
> In any case I've queued the patch now.


thanks.


>
>
Paolo
>
> > i don't have time to follow up on old issues and not in the mood to be
> > losing any of my work to sluggishness.
>
>

--0000000000002e57390583435185
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 4, 2019 at 2:45 PM Paolo =
Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 04=
/03/19 12:22, David Kiarie wrote:<br>&gt; <br>&gt; <br>&gt; <br>&gt; On Mon=
, Feb 25, 2019 at 1:39 PM Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:ber=
range@redhat.com" target=3D"_blank">berrange@redhat.com</a><br>&gt; &lt;mai=
lto:<a href=3D"mailto:berrange@redhat.com" target=3D"_blank">berrange@redha=
t.com</a>&gt;&gt; wrote:<br>&gt; <br>&gt;=C2=A0 =C2=A0 =C2=A0On Sat, Feb 23=
, 2019 at 01:54:21PM +0300, David Kiarie wrote:<br>&gt;=C2=A0 =C2=A0 =C2=A0=
&gt; Signed-off-by: David Kiarie &lt;<a href=3D"mailto:davidkiarie4@gmail.c=
om" target=3D"_blank">davidkiarie4@gmail.com</a><br>&gt;=C2=A0 =C2=A0 =C2=
=A0&lt;mailto:<a href=3D"mailto:davidkiarie4@gmail.com" target=3D"_blank">d=
avidkiarie4@gmail.com</a>&gt;&gt;<br>&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>&g=
t;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 hw/i386/amd_iommu.c | 2 +-<br>&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 hw/i386/amd_iommu.h | 2 +-<br>&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>&gt; <br>=
&gt;=C2=A0 =C2=A0 =C2=A0Reviewed-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D=
"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a><br>&=
gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:berrange@redhat.com" ta=
rget=3D"_blank">berrange@redhat.com</a>&gt;&gt;<br>&gt; <br>&gt; <br>&gt; h=
ello,=C2=A0<br>&gt; <br>&gt; i expected this really simple patch to probabl=
y get merged right away.<br>
<br>Patches are usually bundled by maintainers, they do not get merged righ=
t<br>away unless they fix a broken build.<br></blockquote><div><br></div><d=
iv>i see.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>In any case I&#39;ve queued the patch now.=C2=A0</blockquote><div><br><=
/div><div>thanks.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">=C2=A0<br></blockquote><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Paolo<br>
<br>&gt; i don&#39;t have time to follow up on old issues and not in the mo=
od to be<br>&gt; losing any of my=C2=A0work to sluggishness.=C2=A0<br>
<br>
</blockquote></div></div>

--0000000000002e57390583435185--

