Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eLxax-0007Cd-8Q
	for mharc-qemu-trivial@gnu.org; Mon, 04 Dec 2017 15:44:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39510)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shravan2x@utexas.edu>) id 1eLxav-0007CO-1v
	for qemu-trivial@nongnu.org; Mon, 04 Dec 2017 15:44:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shravan2x@utexas.edu>) id 1eLxat-0005fL-QB
	for qemu-trivial@nongnu.org; Mon, 04 Dec 2017 15:44:05 -0500
Received: from mail-qt0-x22b.google.com ([2607:f8b0:400d:c0d::22b]:38207)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shravan2x@utexas.edu>)
	id 1eLxat-0005ez-K9
	for qemu-trivial@nongnu.org; Mon, 04 Dec 2017 15:44:03 -0500
Received: by mail-qt0-x22b.google.com with SMTP id d4so24193649qtj.5
	for <qemu-trivial@nongnu.org>; Mon, 04 Dec 2017 12:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=utexas-edu.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8Se8SVz8rnhYtkyDXZPrNH6Q7cSU8tfwonkFJftfweI=;
	b=fd2HvqNIG7pPguLfN4OZwH+LxPnHigsM1LTMaNoDAZMT2h1dItRIR2FPZoUMHBPinZ
	RnVxsxk+LSUwRIXKOoCp2hL0OSaZd6SsyUnYcl0IWdtwynRFDGOU1ebUD2ibVR/iKcZI
	onbpL1PMvGiLlXOum7GeSCY9wUM6FWDK/xTx1ewyVROb6i58DbEZAQVkVvqqPOtLNZWb
	eg9njGc15vB/haFIalhwkPhZOpnQRjj5cN+ycjREt+KwBUOIdAHIbkQm66CTM5eIyDjh
	frstvXWLiOSsKNJqDQsPzCmJfTewoWoFFCrkcEIXBThmPqqhQ7N9ia0nB1bpckU791sM
	FGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8Se8SVz8rnhYtkyDXZPrNH6Q7cSU8tfwonkFJftfweI=;
	b=ge+5tf6VPAa8GO9Ffi+yVFrVPXVZ/oxhod4+IV15wvxC7wzlGwXPy/KHpIMnY1kmVR
	ZzwbaB1X7M7B09tRj/gG4OC5o2TpegnDNIrD+JLFRKkoY7nAsOcCN/FCf0vLTUQpoOyD
	yyrZbjV05gisehdcqs/K0TdFgbTajPEiW02IONEe732lWs//t/oPQSHyFcE8SEfK8WOC
	Z9u+qpOsMNTvSdXk2CX0Aytd+GpOPfzhmQqrzI2z7+CeSAVf3KH00SAfnf1Sd0sE5j4U
	ZRT9y1H+dSIS6ACKdHTivUecIq1zPpbEn+DrmnbPgahqIBwOPMtSAzV7CptEfb8J6p5i
	+pzg==
X-Gm-Message-State: AKGB3mLJSfXQqLxJPjBgp4XwJV/3lwCule/YZSEIWqrCGfhC5IOdzlh5
	CRKv97+tCGc3lhhAoQhefzH92hmXGOfRwyDaQfb8jQ==
X-Google-Smtp-Source: AGs4zMZD8Kg/5DUlDAhW/dUviElFAhwI0YVeXR/w4Wz7LIhHr1mgc7IW3UDf5QiGmo23i+ByU9UJFXdvQKzoeyzEhYI=
X-Received: by 10.200.43.119 with SMTP id 52mr133381qtv.143.1512420242317;
	Mon, 04 Dec 2017 12:44:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.158.130 with HTTP; Mon, 4 Dec 2017 12:44:01 -0800 (PST)
In-Reply-To: <CAFEAcA-kO_cJKUs5sPkL5ynLd+nNrKac4dgUT-=1QmBC=e7qkg@mail.gmail.com>
References: <1512254273-7567-1-git-send-email-shravan2x@utexas.edu>
	<fa45711a-9203-423f-b9a9-e2006847f6f4@redhat.com>
	<CAFEAcA-kO_cJKUs5sPkL5ynLd+nNrKac4dgUT-=1QmBC=e7qkg@mail.gmail.com>
From: Shravan Rajinikanth <shravan2x@utexas.edu>
Date: Mon, 4 Dec 2017 14:44:01 -0600
Message-ID: <CACxwqYOedsh0rHn=xba350o1SehQJwCa9Er5W0b2daef+XQbzw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Max Reitz <mreitz@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Content-Type: multipart/alternative; boundary="001a113a8bee4b7f1b055f89c7f6"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22b
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-img: Fixed grammatical
 error in dump_human_image_check
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
X-List-Received-Date: Mon, 04 Dec 2017 20:44:06 -0000

--001a113a8bee4b7f1b055f89c7f6
Content-Type: text/plain; charset="UTF-8"

> To me both versions seem fine, could you explain the grammatical error in
the
> old message?

My opinion aligns with Peter's, in that "This means" followed by "waste of"
is a break in the sentence to a reader. Adding an "a" to change it to "This
means a waste of" also seemed like a possible fix, but I made a call to
change it "This means disk space is wasted" instead. This is mainly because
the first sentence says leaked clusters "were found", which following the
same tense in the next sentence should rather be "is wasted" (since the
scan was only run once in the past, but disk space continues to be wasted
even after the message is displayed).

I'm no expert in the English language myself, so perhaps I was wrong in
calling it a grammatical error. However, I do find the changed version more
natural to read.

Regards,
Shravan

On Mon, Dec 4, 2017 at 9:57 AM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 4 December 2017 at 15:51, Max Reitz <mreitz@redhat.com> wrote:
> > On 2017-12-02 23:37, Shravan Rajinikanth wrote:
> >> Signed-off-by: Shravan Rajinikanth <shravan2x@utexas.edu>
> >> ---
> >>  qemu-img.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/qemu-img.c b/qemu-img.c
> >> index 68b375f..bea9268 100644
> >> --- a/qemu-img.c
> >> +++ b/qemu-img.c
> >> @@ -580,7 +580,7 @@ static void dump_human_image_check(ImageCheck
> *check, bool quiet)
> >>          if (check->leaks) {
> >>              qprintf(quiet,
> >>                      "\n%" PRId64 " leaked clusters were found on the
> image.\n"
> >> -                    "This means waste of disk space, but no harm to
> data.\n",
> >> +                    "This means disk space is wasted, but data is
> safe.\n",
> >>                      check->leaks);
> >>          }
> >
> > How exactly is this a grammatical error?  (I'm not a native English
> > speaker, but it always seemed perfectly OK to me)
>
> I think "This means" more naturally takes a verb phrase, not a noun phrase.
> I don't know that I'd go so far as to say that the current text is
> ungrammatical, but I do think the proposed change sounds more natural to
> me.
>
> thanks
> -- PMM
>

--001a113a8bee4b7f1b055f89c7f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;=C2=A0<span style=3D"font-size:12.8px">To me both vers=
ions seem fine, could you explain the grammatical error in the</span><br st=
yle=3D"font-size:12.8px"><span style=3D"font-size:12.8px">&gt; old message?=
</span><div><span style=3D"font-size:12.8px"><br></span></div><div><span st=
yle=3D"font-size:12.8px">My opinion aligns with Peter&#39;s, in that=C2=A0<=
/span>&quot;This means&quot; followed by=C2=A0&quot;waste of&quot; is a bre=
ak in the sentence to a reader. Adding an &quot;a&quot; to change it to=C2=
=A0&quot;This means a waste of&quot; also seemed like a possible fix, but I=
 made a call to change it<span style=3D"color:rgb(80,0,80);font-size:12.8px=
">=C2=A0</span>&quot;This means disk space is wasted&quot; instead. This is=
 mainly because the first sentence says leaked clusters &quot;were found&qu=
ot;, which following the same tense in the next sentence should rather be &=
quot;is wasted&quot; (since the scan was only run once in the past, but dis=
k space continues to be wasted even after the message is displayed).</div><=
div><br></div><div>I&#39;m no expert in the English language myself, so per=
haps I was wrong in calling it a grammatical error. However, I do find the =
changed version more natural to read.</div><div><br></div><div>Regards,</di=
v><div>Shravan</div></div><div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote">On Mon, Dec 4, 2017 at 9:57 AM, Peter Maydell <span dir=3D"ltr">&l=
t;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.mayde=
ll@linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span=
 class=3D"">On 4 December 2017 at 15:51, Max Reitz &lt;<a href=3D"mailto:mr=
eitz@redhat.com">mreitz@redhat.com</a>&gt; wrote:<br>
&gt; On 2017-12-02 23:37, Shravan Rajinikanth wrote:<br>
&gt;&gt; Signed-off-by: Shravan Rajinikanth &lt;<a href=3D"mailto:shravan2x=
@utexas.edu">shravan2x@utexas.edu</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 qemu-img.c | 2 +-<br>
&gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/qemu-img.c b/qemu-img.c<br>
&gt;&gt; index 68b375f..bea9268 100644<br>
&gt;&gt; --- a/qemu-img.c<br>
&gt;&gt; +++ b/qemu-img.c<br>
&gt;&gt; @@ -580,7 +580,7 @@ static void dump_human_image_check(<wbr>ImageC=
heck *check, bool quiet)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (check-&gt;leaks) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qprintf(quiet,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;\n%&quot; PRId64 &quot; leaked clusters were found on the =
image.\n&quot;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;This means waste of disk space, but no harm to data.\n&quot;,<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;This means disk space is wasted, but data is safe.\n&quot;,<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 check-&gt;leaks);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt; How exactly is this a grammatical error?=C2=A0 (I&#39;m not a native E=
nglish<br>
&gt; speaker, but it always seemed perfectly OK to me)<br>
<br>
</span>I think &quot;This means&quot; more naturally takes a verb phrase, n=
ot a noun phrase.<br>
I don&#39;t know that I&#39;d go so far as to say that the current text is<=
br>
ungrammatical, but I do think the proposed change sounds more natural to me=
.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br></div>

--001a113a8bee4b7f1b055f89c7f6--

