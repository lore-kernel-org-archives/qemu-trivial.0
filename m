Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZtepI-0000Ls-CO
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2015 11:52:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33920)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <julio@farjump.io>) id 1ZtepB-0000CX-IZ
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 11:52:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <julio@farjump.io>) id 1Ztep7-0006Nm-Ei
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 11:52:45 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:48425)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <julio@farjump.io>)
	id 1Zteop-0006D1-6j; Tue, 03 Nov 2015 11:52:23 -0500
Received: from mfilter15-d.gandi.net (mfilter15-d.gandi.net [217.70.178.143])
	by relay2-d.mail.gandi.net (Postfix) with ESMTP id 95210C5A4E;
	Tue,  3 Nov 2015 17:52:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mfilter15-d.gandi.net
Received: from relay2-d.mail.gandi.net ([IPv6:::ffff:217.70.183.194])
	by mfilter15-d.gandi.net (mfilter15-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id dZEIwTdPbjsh; Tue,  3 Nov 2015 17:52:20 +0100 (CET)
X-Originating-IP: 209.85.215.47
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47]) (Authenticated sender: julio@farjump.io)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id D373EC5A98;
	Tue,  3 Nov 2015 17:52:19 +0100 (CET)
Received: by lfbf136 with SMTP id f136so25068575lfb.0;
	Tue, 03 Nov 2015 08:52:19 -0800 (PST)
X-Received: by 10.112.181.164 with SMTP id dx4mr13702939lbc.29.1446569539201; 
	Tue, 03 Nov 2015 08:52:19 -0800 (PST)
MIME-Version: 1.0
References: <1444844599-33161-1-git-send-email-julio@farjump.io>
	<CAFAwnGNwFft-tH+3mhspok2gz2UKiHeiuqi_ARdB4=6k4wq4uQ@mail.gmail.com>
	<5638A5AF.9000709@msgid.tls.msk.ru> <5638B6BC.50000@ilande.co.uk>
In-Reply-To: <5638B6BC.50000@ilande.co.uk>
From: Julio Guerra <julio@farjump.io>
Date: Tue, 03 Nov 2015 16:52:09 +0000
Message-ID: <CAFAwnGNv1ohpBQdMPV5vS-W2o7uqW-5d8QB=Ngsn4V5BFzbt8Q@mail.gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org, 
	qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary=001a11c3690c86f2a70523a5b758
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 217.70.183.194
Cc: christophe@farjump.io, Alexander Graf <agraf@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] taget-ppc: Fix read
 access to IBAT registers higher than IBAT3
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
X-List-Received-Date: Tue, 03 Nov 2015 16:52:50 -0000

--001a11c3690c86f2a70523a5b758
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le mar. 3 nov. 2015 =C3=A0 14:33, Mark Cave-Ayland <mark.cave-ayland@ilande=
.co.uk>
a =C3=A9crit :

> On 03/11/15 12:16, Michael Tokarev wrote:
>
> > 03.11.2015 11:00, Julio Guerra wrote:
> >> Ping :)
> >
> > Well, I'm not sure what can I do with this.  I've no idea what is IBAT
> to start
> > with, so while technically the patch is a one-liner, I've no idea what
> it does
> > and how trivial it is :)
> >
> > Maybe you can include some context which teaches me what it is all
> about, and in
> > that case it becomes really trivial, or.. I dunno :)
>
> FWIW PPC has a set of IBAT and DBAT registers on chip, each of which
> indicates a large continuous physical/virtual memory mapping for
> Instruction and Data memory respectively. The idea is that the OS can
> use these to provide "fast" virtual to physical lookups instead of
> invoking a time-consuming hash lookup to provide the translation.
>
> From casual observation comparing with spr_write_ibatu_h() in the same
> file (which already includes the +4 offset that the patch is adding to
> spr_read_ibat_h()), it does look like a genuine bug. However it really
> needs someone who understands PPC architecture a bit more to give a RB
> to ensure this is doing the right thing.
>
>
I would add the reason the bug never appeared is probably due to the fact
BATs are not likely to be read by kernels, they simply write to them to
program a large memory mapping. In our case, we saw the bug when fully
saving/restoring the CPU context since we were in fact reading at BAT0-3
instead of BAT4-7 and then restoring BAT these values in BAT4-7... And the
result can be very perverse...

Linux PPC, which I think is how Alexander Graf tests qemu-ppc, probably
does not use these higher BAT registers, they are CPU-specific.

--001a11c3690c86f2a70523a5b758
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">Le=C2=A0mar. 3=
 nov. 2015 =C3=A0=C2=A014:33, Mark Cave-Ayland &lt;<a href=3D"mailto:mark.c=
ave-ayland@ilande.co.uk">mark.cave-ayland@ilande.co.uk</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">On 03/11/15 12:16, Michael =
Tokarev wrote:<br>
<br>
&gt; 03.11.2015 11:00, Julio Guerra wrote:<br>
&gt;&gt; Ping :)<br>
&gt;<br>
&gt; Well, I&#39;m not sure what can I do with this.=C2=A0 I&#39;ve no idea=
 what is IBAT to start<br>
&gt; with, so while technically the patch is a one-liner, I&#39;ve no idea =
what it does<br>
&gt; and how trivial it is :)<br>
&gt;<br>
&gt; Maybe you can include some context which teaches me what it is all abo=
ut, and in<br>
&gt; that case it becomes really trivial, or.. I dunno :)<br>
<br>
FWIW PPC has a set of IBAT and DBAT registers on chip, each of which<br>
indicates a large continuous physical/virtual memory mapping for<br>
Instruction and Data memory respectively. The idea is that the OS can<br>
use these to provide &quot;fast&quot; virtual to physical lookups instead o=
f<br>
invoking a time-consuming hash lookup to provide the translation.<br>
<br>
From casual observation comparing with spr_write_ibatu_h() in the same<br>
file (which already includes the +4 offset that the patch is adding to<br>
spr_read_ibat_h()), it does look like a genuine bug. However it really<br>
needs someone who understands PPC architecture a bit more to give a RB<br>
to ensure this is doing the right thing.<br><br></blockquote><div><br></div=
><div>I would add the reason the bug never appeared is probably due to the =
fact BATs are not likely to be read by kernels, they simply write to them t=
o program a large memory mapping. In our case, we saw the bug when fully sa=
ving/restoring the CPU context since we were in fact reading at BAT0-3 inst=
ead of BAT4-7 and then restoring BAT these values in BAT4-7... And the resu=
lt can be very perverse...</div><div><br></div><div>Linux PPC, which I thin=
k is how Alexander Graf tests qemu-ppc, probably does not use these higher =
BAT registers, they are CPU-specific.</div></div></div>

--001a11c3690c86f2a70523a5b758--

