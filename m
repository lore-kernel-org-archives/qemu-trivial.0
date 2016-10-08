Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsprk-0001Nq-Og
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 07:32:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anand.indukala@gmail.com>) id 1bsprh-0001LP-QD
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 07:32:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anand.indukala@gmail.com>) id 1bsprf-0000JU-1W
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 07:32:28 -0400
Received: from mail-io0-x244.google.com ([2607:f8b0:4001:c06::244]:34036)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anand.indukala@gmail.com>)
	id 1bspra-0000Fo-HQ; Sat, 08 Oct 2016 07:32:22 -0400
Received: by mail-io0-x244.google.com with SMTP id i202so4207714ioi.1;
	Sat, 08 Oct 2016 04:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rCGZ69AKzO9g1WET10QC9Iu590ZR56G4i8JlMidDw1k=;
	b=YaYMvD3GhaRMBiZ0+ROpNpG4G0BkCIZpA2MrALG+l7v4qhlqBV7kGaA1Zrt3kZ6O49
	5gbLGRMf1ZBuCHfZGTT66d5YcPBB4NEHrHiOw7a571VNgZ1jAWiuyCB5OtYGn/oAATR6
	dokJ00qmw/ZHO56FVOsa7abJqi3q0bPdATaEyBpe0AeVhV6sd7WX1X2Qjkvjt1ugtR/s
	a/oiWUnbeB42GfC43Y5EhZdGtfNkp7Chc5dkbP7irgGSZPHFqCFJOODa9EBIyeNRfmK2
	7P/xwviVyrosn7H+Q2dYCnWxSnYKTIsMfW17Oo4dzwFDGb3Jqtg6GazAUZJRU8rAVYuD
	VCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rCGZ69AKzO9g1WET10QC9Iu590ZR56G4i8JlMidDw1k=;
	b=TUA/3XJHiQgA2OsrxXO/U7CvArcY+TRV6fiIUSd/OSJQvZt/2ELEGGvkkVMKpOsIKc
	kfRGazORe6eNxKIACC6y6j767TezlrrnuAvuRSftxa4wIhm2rC24SmWBgShh6SK/9iCs
	7LC19cjg6Ymsj9JTBzjih6wIR+sJDDQFYIKmTs9yBvbLS0LcrSZSssWylfrnwlIO7qy3
	jOVxcnDFOpa1f193bN0emPQyUvzeF6KXhCdXQHbptO3Rzx0FxS/V2FeM+efu71dPC0tb
	nqqGclSfp8H3pb8iZ2UYrEe0p69NLmNEQeq654wvhwA75aT/MdvcH3c3dGg3g3N8bVjC
	8dKg==
X-Gm-Message-State: AA6/9RmhkFbncQPIS9eNR8wsjzMAgfSsXmM7OK7Tqc+QgPV7Z2U5cpoAFqbCujqmekaHAxuoooRITK73DoB6/Q==
X-Received: by 10.107.195.4 with SMTP id t4mr1620727iof.221.1475926341727;
	Sat, 08 Oct 2016 04:32:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.159.8 with HTTP; Sat, 8 Oct 2016 04:32:21 -0700 (PDT)
In-Reply-To: <290de67f-8505-fbd7-c2fa-6fbe7ca604eb@redhat.com>
References: <1475829975-17413-1-git-send-email-anand.indukala@gmail.com>
	<290de67f-8505-fbd7-c2fa-6fbe7ca604eb@redhat.com>
From: Anand J <anand.indukala@gmail.com>
Date: Sat, 8 Oct 2016 17:02:21 +0530
Message-ID: <CANDALvkty9Q+TR9S=U0jsy1PqEgfwt=vrq7HVE-JA+ymPcXRBw@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary=94eb2c1885de503cfa053e58e1ba
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] clean-up: removed duplicate
 #includes
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
X-List-Received-Date: Sat, 08 Oct 2016 11:32:31 -0000

--94eb2c1885de503cfa053e58e1ba
Content-Type: text/plain; charset=UTF-8

I have replied for the questions inline. Also I'll make changes to the
patch as per the review and send the updated one.

Thanks,
Anand

On Fri, Oct 7, 2016 at 8:01 PM, Eric Blake <eblake@redhat.com> wrote:

> On 10/07/2016 03:46 AM, Anand J wrote:
> > Some files contain multiple #includes of the same header file.
> > Removed most of those unnecessary duplicate entries.
>
> How did you find these? Is it a repeatable formula for rerunning a year
> from now to find new culprits?  If so, listing it in the commit message
> would be worthwhile.  Is it something we should add to
> scripts/clean-includes?
>
I executed the following bash script to get multiple occurrences of
#includes and manually checked each and every file from the output.

grep -r --exclude-dir=bin/ "#include" | sort | uniq -c | awk '{if ($1 > 1)
print $2}'

But there are lot of noise in the output of this command. Most of the
multiple #includes were not genuine issue. @Eric Do you want me to add this
in the comment?



>
> >
> > Signed-off-by: Anand J <anand.indukala@gmail.com>
> > ---
>
> > +++ b/disas/libvixl/vixl/globals.h
> > @@ -46,7 +46,6 @@
> >  #include <assert.h>
> >  #include <stdarg.h>
> >  #include <stdio.h>
> > -#include <stdint.h>
> >  #include <stdlib.h>
> >  #include <stddef.h>
> >  #include "vixl/platform.h"
>
> scripts/clean-includes intentionally ignores disas/libvixl because that
> source is copied from elsewhere with minimal changes; are you sure this
> hunk is appropriate?
>

stdint.h is already included as the first #include in this file. But since
this is a thrid-party file as per Peter, I'll remove this change.


> > +++ b/hw/pci-bridge/pci_expander_bridge.c
> > @@ -13,7 +13,6 @@
> >  #include "qemu/osdep.h"
> >  #include "qapi/error.h"
> >  #include "hw/pci/pci.h"
> > -#include "hw/pci/pci_bus.h"
> >  #include "hw/pci/pci_host.h"
> >  #include "hw/pci/pci_bus.h"
>
> Changes like this are obviously correct...
>
> >  #include "hw/pci/pci_bridge.h"
> > diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> > index 4b2f07a..d01798f 100644
> > --- a/hw/ppc/ppc405_boards.c
> > +++ b/hw/ppc/ppc405_boards.c
> > @@ -37,7 +37,6 @@
> >  #include "qemu/log.h"
> >  #include "qemu/error-report.h"
> >  #include "hw/loader.h"
> > -#include "sysemu/block-backend.h"
> >  #include "sysemu/blockdev.h"
> >  #include "exec/address-spaces.h"
>
> ...while changes like this require looking at context. But the nice part
> of this patch is that if it compiles, it is correct...
>
> > +++ b/hw/usb/dev-mtp.c
> > @@ -17,7 +17,6 @@
> >  #include <sys/statvfs.h>
> >  #ifdef CONFIG_INOTIFY1
> >  #include <sys/inotify.h>
> > -#include "qapi/error.h"
> >  #include "qemu/main-loop.h"
> >  #endif
>
> ...well, ones like this are a little trickier (if CONFIG_INOTIFY1 is not
> defined, a completed compilation is no indication of success - but
> reading context shows it is correct, and the duplicate include was just
> outside of the diff context).
>
> --
> Eric Blake   eblake redhat com    +1-919-301-3266
> Libvirt virtualization library http://libvirt.org
>
>

--94eb2c1885de503cfa053e58e1ba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have replied for the questions inline. Also I&#39;ll mak=
e changes to the patch as per the review and send the updated one.<div><br>=
</div><div>Thanks,</div><div>Anand</div><div><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On Fri, Oct 7, 2016 at 8:01 PM, Eric Blake <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:eblake@redhat.com" target=3D"_blank">eb=
lake@redhat.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><span class=3D"gmail-">On 10/07/2016 03:46 AM, Anand J wrot=
e:<br>
&gt; Some files contain multiple #includes of the same header file.<br>
&gt; Removed most of those unnecessary duplicate entries.<br>
<br>
</span>How did you find these? Is it a repeatable formula for rerunning a y=
ear<br>
from now to find new culprits?=C2=A0 If so, listing it in the commit messag=
e<br>
would be worthwhile.=C2=A0 Is it something we should add to<br>
scripts/clean-includes?<br></blockquote><div>I executed the following bash =
script to get multiple occurrences of #includes and manually checked each a=
nd every file from the output.</div><div><br></div><div>grep -r --exclude-d=
ir=3Dbin/ &quot;#include&quot; | sort | uniq -c | awk &#39;{if ($1 &gt; 1) =
print $2}&#39;</div><div><br></div><div>But there are lot of noise in the o=
utput of this command. Most of the multiple #includes were not genuine issu=
e. @Eric Do you want me to add this in the comment?</div><div><br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<span class=3D"gmail-"><br>
&gt;<br>
&gt; Signed-off-by: Anand J &lt;<a href=3D"mailto:anand.indukala@gmail.com"=
>anand.indukala@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
</span><span class=3D"gmail-">&gt; +++ b/disas/libvixl/vixl/globals.h<br>
&gt; @@ -46,7 +46,6 @@<br>
&gt;=C2=A0 #include &lt;assert.h&gt;<br>
&gt;=C2=A0 #include &lt;stdarg.h&gt;<br>
&gt;=C2=A0 #include &lt;stdio.h&gt;<br>
&gt; -#include &lt;stdint.h&gt;<br>
&gt;=C2=A0 #include &lt;stdlib.h&gt;<br>
&gt;=C2=A0 #include &lt;stddef.h&gt;<br>
&gt;=C2=A0 #include &quot;vixl/platform.h&quot;<br>
<br>
</span>scripts/clean-includes intentionally ignores disas/libvixl because t=
hat<br>
source is copied from elsewhere with minimal changes; are you sure this<br>
hunk is appropriate?<br></blockquote><div><br></div><div>stdint.h is alread=
y included as the first #include in this file. But since this is a thrid-pa=
rty file as per Peter, I&#39;ll remove this change.</div><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<span class=3D"gmail-"><br>
&gt; +++ b/hw/pci-bridge/pci_expander_<wbr>bridge.c<br>
&gt; @@ -13,7 +13,6 @@<br>
&gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt;=C2=A0 #include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/pci/pci.h&quot;<br>
&gt; -#include &quot;hw/pci/pci_bus.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/pci/pci_host.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/pci/pci_bus.h&quot;<br>
<br>
</span>Changes like this are obviously correct...<br>
<span class=3D"gmail-"><br>
&gt;=C2=A0 #include &quot;hw/pci/pci_bridge.h&quot;<br>
&gt; diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c<br>
&gt; index 4b2f07a..d01798f 100644<br>
&gt; --- a/hw/ppc/ppc405_boards.c<br>
&gt; +++ b/hw/ppc/ppc405_boards.c<br>
&gt; @@ -37,7 +37,6 @@<br>
&gt;=C2=A0 #include &quot;qemu/log.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/error-report.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/loader.h&quot;<br>
&gt; -#include &quot;sysemu/block-backend.h&quot;<br>
&gt;=C2=A0 #include &quot;sysemu/blockdev.h&quot;<br>
&gt;=C2=A0 #include &quot;exec/address-spaces.h&quot;<br>
<br>
</span>...while changes like this require looking at context. But the nice =
part<br>
of this patch is that if it compiles, it is correct...<br>
<span class=3D"gmail-"><br>
&gt; +++ b/hw/usb/dev-mtp.c<br>
&gt; @@ -17,7 +17,6 @@<br>
&gt;=C2=A0 #include &lt;sys/statvfs.h&gt;<br>
&gt;=C2=A0 #ifdef CONFIG_INOTIFY1<br>
&gt;=C2=A0 #include &lt;sys/inotify.h&gt;<br>
&gt; -#include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/main-loop.h&quot;<br>
&gt;=C2=A0 #endif<br>
<br>
</span>...well, ones like this are a little trickier (if CONFIG_INOTIFY1 is=
 not<br>
defined, a completed compilation is no indication of success - but<br>
reading context shows it is correct, and the duplicate include was just<br>
outside of the diff context).<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
--<br>
Eric Blake=C2=A0 =C2=A0eblake redhat com=C2=A0 =C2=A0 +1-919-301-3266<br>
Libvirt virtualization library <a href=3D"http://libvirt.org" rel=3D"norefe=
rrer" target=3D"_blank">http://libvirt.org</a><br>
<br>
</font></span></blockquote></div><br></div></div></div>

--94eb2c1885de503cfa053e58e1ba--

