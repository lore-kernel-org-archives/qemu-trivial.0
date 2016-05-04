Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axkMj-0001Ix-OP
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 20:08:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axkMc-000170-B2
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 20:08:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axkMQ-0005Ry-HY
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 20:08:20 -0400
Received: from mail-oi0-x234.google.com ([2607:f8b0:4003:c06::234]:36745)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>)
	id 1axkMP-0005JS-9M; Tue, 03 May 2016 20:08:14 -0400
Received: by mail-oi0-x234.google.com with SMTP id x201so46890101oif.3;
	Tue, 03 May 2016 17:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=MKcM893cTZkLz86cquNORvaU6kpWa9j2qvC6DK6sMrc=;
	b=ihdoF50EmYjdpXTtaUIQNO9/+RIn+gGo7CbFjbabBDoUuoYMf7tgcOeiRktbliXQeu
	zNX23yKa0V3F+pTn9J3v+TrF+1GZdkkBzaDZKgbrdXfaOQatQpfzkmFnqjifASKMNOlh
	wywj2w16Lgq0MleRW4Z1BG86pSvxrqzYXtzJf3agxuTLpW/ItGk2+dZd4kKdB5W3dE4e
	/S2bH8odI/VUUvG0os199V2OcQ4N5MGOhU4/xgS6AVRQ4c89tRhWi1Hoztzen/+1i58k
	OqnJiBbPOMjgB2J9SAskD0KJ0T007rarOgY2nMQ6tnH6GflksuZ1+9K0zpeUImSDxtsS
	mXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=MKcM893cTZkLz86cquNORvaU6kpWa9j2qvC6DK6sMrc=;
	b=StTPtQqJcRlF6namAC6v4/wM3uaHldowF5XFMgU8/pjp1pDSPpRooN7+GIq6mVuK0U
	mD9KV1mrTfKu1t1jKTRpSu8GXHT8QpIKFl5IbHsnPoARYb91HihmB3/0IZ587KcBHYy5
	wHxfbpiRA19hLJjakga3OPYAvX+5IV03zCxKF2Qo3VhYQLwwmgFovkf2KNoS7xrOWz8m
	Zk7CoWdlbR1B0rWGPAE9Q4JiCo70IImC2BwqJ/vYeDAw0fwjzCMmkePiWPcXcTGyi5gj
	waSAJldO5tTcdicz8pfbybWlXi6PVy5jWlwUnASuiRgGzLCZOFoWJiX0K2rWmq9/2e53
	+faw==
X-Gm-Message-State: AOPr4FU163AV0wFhRE3pttRiK+T2+BRzeNWfhjxhj434qcg7XcVjkKfjcVecn0jg0i5ZXP/LU8kM3JKqcnty0Q==
MIME-Version: 1.0
X-Received: by 10.202.82.209 with SMTP id g200mr2781064oib.31.1462320461614;
	Tue, 03 May 2016 17:07:41 -0700 (PDT)
Received: by 10.157.4.120 with HTTP; Tue, 3 May 2016 17:07:40 -0700 (PDT)
Received: by 10.157.4.120 with HTTP; Tue, 3 May 2016 17:07:40 -0700 (PDT)
In-Reply-To: <CAF4BF-T44ixRn6EVqLvPC7pktEcCO8qQDJJd1UgN8WX6T=Dwcw@mail.gmail.com>
References: <1462237852-61856-1-git-send-email-chrisfriedt@gmail.com>
	<0b165339-9dde-57f8-959d-22122390ca0b@twiddle.net>
	<CAF4BF-T44ixRn6EVqLvPC7pktEcCO8qQDJJd1UgN8WX6T=Dwcw@mail.gmail.com>
Date: Tue, 3 May 2016 20:07:40 -0400
Message-ID: <CAF4BF-Re+siJV4KTOvUwsDS3ckt_HfPpCQkB7rPPmJZ=OS8tSw@mail.gmail.com>
From: Christopher Friedt <chrisfriedt@gmail.com>
To: Richard Henderson <rth@twiddle.net>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, famz@redhat.com, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary=001a113de920a9962c0531f90339
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::234
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2v2] [RESENT-INLINE] Use
 libtool instead of ar to create static libraries on Darwin.
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
X-List-Received-Date: Wed, 04 May 2016 00:08:32 -0000

--001a113de920a9962c0531f90339
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On May 3, 2016 9:50 AM, "Christopher Friedt" <chrisfriedt@gmail.com> wrote:
>
> On Tue, May 3, 2016 at 3:06 AM, Richard Henderson <rth@twiddle.net> wrote=
:
> > On 05/02/2016 03:10 PM, Christopher Friedt wrote:
> >>
> >>  %.a:
> >> +ifdef CONFIG_DARWIN
> >> +       $(call quiet-command,rm -f $@ && libtool -static -o $@ $^,"
> >> libtool    $(TARGET_DIR)$@")
> >> +else
> >>         $(call quiet-command,rm -f $@ && $(AR) rcs $@ $^,"  AR
> >> $(TARGET_DIR)$@")
> >> +endif
> >>
> >
> > Does it work to use libtool -static everywhere?

One possibility for future-proofing the link stage that applies to most
(all?) platforms that Qemu runs on would be to switch to libtool for all
arch's and just adjust the "libtool flags" as necessary.

Would require checking for libtool.

Fallback to ar?

=C2=A9

Sent from my Android

--001a113de920a9962c0531f90339
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On May 3, 2016 9:50 AM, &quot;Christopher Friedt&quot; &lt;<a href=3D"mailt=
o:chrisfriedt@gmail.com">chrisfriedt@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, May 3, 2016 at 3:06 AM, Richard Henderson &lt;<a href=3D"mailt=
o:rth@twiddle.net">rth@twiddle.net</a>&gt; wrote:<br>
&gt; &gt; On 05/02/2016 03:10 PM, Christopher Friedt wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 %.a:<br>
&gt; &gt;&gt; +ifdef CONFIG_DARWIN<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call quiet-command,rm -f $@ &am=
p;&amp; libtool -static -o $@ $^,&quot;<br>
&gt; &gt;&gt; libtool=C2=A0 =C2=A0 $(TARGET_DIR)$@&quot;)<br>
&gt; &gt;&gt; +else<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(call quiet-command,rm -f $=
@ &amp;&amp; $(AR) rcs $@ $^,&quot;=C2=A0 AR<br>
&gt; &gt;&gt; $(TARGET_DIR)$@&quot;)<br>
&gt; &gt;&gt; +endif<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; Does it work to use libtool -static everywhere?</p>
<p dir=3D"ltr">One possibility for future-proofing the link stage that appl=
ies to most (all?) platforms that Qemu runs on would be to switch to libtoo=
l for all arch&#39;s and just adjust the &quot;libtool flags&quot; as neces=
sary.</p>
<p dir=3D"ltr">Would require checking for libtool.</p>
<p dir=3D"ltr">Fallback to ar?</p>
<p dir=3D"ltr">=C2=A9</p>
<p dir=3D"ltr">Sent from my Android</p>

--001a113de920a9962c0531f90339--

