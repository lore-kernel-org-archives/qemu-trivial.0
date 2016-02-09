Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTA0L-0006cn-Lk
	for mharc-qemu-trivial@gnu.org; Tue, 09 Feb 2016 10:15:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <raghavanil4m@gmail.com>) id 1aTA0J-0006cH-FY
	for qemu-trivial@nongnu.org; Tue, 09 Feb 2016 10:15:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <raghavanil4m@gmail.com>) id 1aTA0I-0002Je-8u
	for qemu-trivial@nongnu.org; Tue, 09 Feb 2016 10:14:59 -0500
Received: from mail-lf0-x233.google.com ([2a00:1450:4010:c07::233]:34792)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <raghavanil4m@gmail.com>)
	id 1aTA0F-0002Hw-DM; Tue, 09 Feb 2016 10:14:55 -0500
Received: by mail-lf0-x233.google.com with SMTP id j78so117376440lfb.1;
	Tue, 09 Feb 2016 07:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=LEB2kAVZvNCO2WZY2WwjvjAJgeJ8w6Y5fhI1AuoQMII=;
	b=mb1f9tYIiH6DzlzKAZdRuBvIophHXM7a7rd68Utg1FfZPES4C6qzRiAh194vfb8dor
	4X2aM6BTyZm1JfQyxWj1DTdGpaWvjCpUVEkBnJ+egU+0Bt28hxUuo/Dtz4Q84Qz2z0g+
	KddsHXvVtvTx+nfCpfdRgmB5CQgQnn5vZ9rZLm+DKewEvszq+/UeOVJ6HnqPaluIBzHE
	Pc/munrb7qlq03uPqM2ecBzlxRUD6LoZbCt8UFNIQNaSym9w8fw1aBK0W9rFN9N1Exm+
	zVKfjKR9JAjtQq1RwZMMaYGk8l0t6sxeDiKqrQQEuMM0ZL1QB1ouqp+lM8k9DEQez/it
	B4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=LEB2kAVZvNCO2WZY2WwjvjAJgeJ8w6Y5fhI1AuoQMII=;
	b=bfJy182xXTh9BOufVyRBp5bJ0iH8Hl/CflaVmRikr3OD86Hpg24qiWYlfGp/wscenX
	yIVUWAlpw2Hdfn/k/jhIAdstibR6LTBol0d15iEBbx1Q3/JtCaG09FQIG8da5nQJa5cq
	fb0NAyngYNPLbX/FR6ivROKqGKMu3iM705qio8DNkfkI1LBz6N62u1519cvzj+q56FHt
	Yp1RXnw5eWMrifmB5+Y0NSaMKOWxMMA0I2l68tTdwMzxY8mf44H65lhDYdfvXyPCCx02
	ZOC4yoSh0iZlEDsBDj4LYrbxNubsTbbIEqMmVKnLINXplbnTruDONXnD3oNHFHkB9GXh
	9Qsw==
X-Gm-Message-State: AG10YOSDK0GcXQpnqqHVTuweT2CmlX+D3cZNmsqGf52SM+zLUcRrc3fPgV3sYWU+9sVkizdQfYTqPldWmrVXNg==
MIME-Version: 1.0
X-Received: by 10.25.210.196 with SMTP id j187mr7618558lfg.75.1455030894520;
	Tue, 09 Feb 2016 07:14:54 -0800 (PST)
Received: by 10.112.78.4 with HTTP; Tue, 9 Feb 2016 07:14:54 -0800 (PST)
In-Reply-To: <CAKWsRc2MyUByd3tjyZMx_q_3+Oy=D5kUtw7MLU6HP7h9xVAy6A@mail.gmail.com>
References: <CAKWsRc2MyUByd3tjyZMx_q_3+Oy=D5kUtw7MLU6HP7h9xVAy6A@mail.gmail.com>
Date: Tue, 9 Feb 2016 07:14:54 -0800
Message-ID: <CAKWsRc2NX_Pz5_P6kEhU26=JWK4UemBuGUO7suHvMiuJph48KQ@mail.gmail.com>
From: Raghavan Santhanam <raghavanil4m@gmail.com>
To: qemu-stable@nongnu.org, qemu-trivial@nongnu.org, qemu-discuss@nongnu.org
Content-Type: multipart/alternative; boundary=001a114128b29af2b7052b57c7e3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::233
Cc: Raghavan Santhanam <raghavanil4m@gmail.com>
Subject: Re: [Qemu-trivial] Regarding Intel IGD passthru support for QEMU/KVM
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Feb 2016 15:15:00 -0000

--001a114128b29af2b7052b57c7e3
Content-Type: text/plain; charset=UTF-8

Hi All,

I am glad to share my successful Intel IGD passthru with QEMU/KVM, here as
well
in addition to my previous report on qemu-devel mailing list so that
interested ones
can have a look at my demos.

Here are some of the popular platforms running smoothly with my successful
Intel IGD passthru + QEMU/KVM setup on Ubuntu 14.04 LTS 64-bit host running
on my
Lenovo touchscreen-enabled laptop.

*First success :* Android-x86 5.1 Lollipop -
https://www.youtube.com/watch?v=PBN1DmarJ7k
*Second success :* Windows 10 LTSB 64-bit -
https://www.youtube.com/watch?v=WmKzRGT2cjI
*Third success :* Ubuntu 15.10 64-bit -
https://www.youtube.com/watch?v=1_VXTDgqnHg

And I take this opportunity to appreicate the years of work on QEMU + KVM +
XEN. Good work, developers!

Best,
Raghavan








On Sun, Jan 17, 2016 at 6:23 PM, Raghavan Santhanam <raghavanil4m@gmail.com>
wrote:

> Hi,
>
> Based on the Intel IGD passthru support that has been added to Qemu/Xen
> code base,
> is there any way to use/reuse the same logic currently to have a
> successful passthru of an Intel
> IGD with Qemu/KVM on a Linux host(Ubuntu x86_64) or will that require some
> more
> work in addition to what Xen code based already has for the IGD passthru?
>
> Best,
> Raghavan
>
>

--001a114128b29af2b7052b57c7e3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>I am glad to share my successfu=
l Intel IGD passthru with QEMU/KVM, here as well</div><div>in addition to m=
y previous report on qemu-devel mailing list so that interested ones</div><=
div>can have a look at my demos.</div><div><br></div><div>Here are some of =
the popular platforms running smoothly with my successful</div><div>Intel I=
GD passthru + QEMU/KVM setup on Ubuntu 14.04 LTS 64-bit host running on my<=
/div><div>Lenovo touchscreen-enabled laptop.</div><div><br></div><div><b>Fi=
rst success :</b> Android-x86 5.1 Lollipop -=C2=A0<a href=3D"https://www.yo=
utube.com/watch?v=3DPBN1DmarJ7k">https://www.youtube.com/watch?v=3DPBN1Dmar=
J7k</a></div><div><b>Second success :</b> Windows 10 LTSB 64-bit -=C2=A0<a =
href=3D"https://www.youtube.com/watch?v=3DWmKzRGT2cjI">https://www.youtube.=
com/watch?v=3DWmKzRGT2cjI</a></div><div><b>Third success :</b> Ubuntu 15.10=
 64-bit -=C2=A0<a href=3D"https://www.youtube.com/watch?v=3D1_VXTDgqnHg">ht=
tps://www.youtube.com/watch?v=3D1_VXTDgqnHg</a></div><div><br></div><div>An=
d I take this opportunity to appreicate the years of work on QEMU + KVM + X=
EN. Good work, developers!</div><div><br></div><div>Best,</div><div>Raghava=
n</div><div><br></div><div><br></div><div><br></div><div><br></div><div><br=
></div><div><br></div><div><br></div></div><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote">On Sun, Jan 17, 2016 at 6:23 PM, Raghavan Santhan=
am <span dir=3D"ltr">&lt;<a href=3D"mailto:raghavanil4m@gmail.com" target=
=3D"_blank">raghavanil4m@gmail.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex"><div dir=3D"ltr"><span style=3D"font-size:12.8px">Hi,</span=
><div style=3D"font-size:12.8px"><br></div><div style=3D"font-size:12.8px">=
Based on the Intel IGD passthru support that has been added to Qemu/Xen cod=
e base,</div><div style=3D"font-size:12.8px">is there any way to use/reuse =
the same logic currently to have a successful passthru of an Intel</div><di=
v style=3D"font-size:12.8px">IGD with Qemu/KVM on a Linux host(Ubuntu x86_6=
4) or will that require some more</div><div style=3D"font-size:12.8px">work=
 in addition to what Xen code based already has for the IGD passthru?</div>=
<div style=3D"font-size:12.8px"><br></div><div style=3D"font-size:12.8px">B=
est,</div><div style=3D"font-size:12.8px">Raghavan</div><div style=3D"font-=
size:12.8px"><br></div></div>
</blockquote></div><br></div>

--001a114128b29af2b7052b57c7e3--

