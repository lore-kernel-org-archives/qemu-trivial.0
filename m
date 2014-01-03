Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vyv1q-00084S-3L
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jan 2014 22:02:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1Vyv1o-00082Q-08
	for qemu-trivial@nongnu.org; Thu, 02 Jan 2014 22:02:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1Vyv1n-0002LH-24
	for qemu-trivial@nongnu.org; Thu, 02 Jan 2014 22:02:27 -0500
Received: from mail-wg0-x22f.google.com ([2a00:1450:400c:c00::22f]:33826)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>)
	id 1Vyv1h-0002HF-Kj; Thu, 02 Jan 2014 22:02:21 -0500
Received: by mail-wg0-f47.google.com with SMTP id n12so12906456wgh.2
	for <multiple recipients>; Thu, 02 Jan 2014 19:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/XmHgAk3qu/lqf7Ah7o5fQcETt1QKfJr9ZJ2PpaAaq4=;
	b=CuhOTRabrEY4JYBlLiVhpNkxJT4amOnvo8+UVPqYgdn5WxyqkmzUZxMe/0WZwRgDYE
	hV9N03MKlmaaOq+Jlr+8IovDMh4tJUUwz735nmbwXzEdDTS/Z+xho1s8bQwYIH2ny1e+
	PlHrA+KjRRAioANM9XvQfKWPHmdmSvvG8X6IP7I0qinjVkf205Z1DSFt1sT5vv8IKtOG
	/tJLgDUfXprt7RXxidG+ElvfUKkstM3mIPTa9srxk/JvjyJNzq2z9Gi4FdkagRYNwe2a
	IoVSFItUDYmXea24iiW1OiJFdkCPwaUL6VSCfD9BqbCGuH6Xzxa1RhVa4Ft1l23wdAsN
	qszw==
X-Received: by 10.180.20.100 with SMTP id m4mr154495wie.32.1388718139774; Thu,
	02 Jan 2014 19:02:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.108.74 with HTTP; Thu, 2 Jan 2014 19:01:59 -0800 (PST)
In-Reply-To: <52C57D63.4080809@suse.de>
References: <1388464944-26911-1-git-send-email-keweihk@gmail.com>
	<CAEgOgz54Zj9w8gQaMNBvVCiFQX5raPFXLGODy97PrD-TmYSBvw@mail.gmail.com>
	<CAJBZ5eP8tRvaQf6qW-zzUs_WQ2WcwTyo0i5Xz3ak8SSprU9vmQ@mail.gmail.com>
	<CAEgOgz5_cT3B38fEUChB7+w7KTsZL5bbTQYiAvp6_i47nNvFMw@mail.gmail.com>
	<52C57D63.4080809@suse.de>
From: Kewei Yu <keweihk@gmail.com>
Date: Fri, 3 Jan 2014 11:01:59 +0800
Message-ID: <CAJBZ5eNOxuBnatFgQUEhPUwK9HJoddND=ov1DrXnSE31yGS_zQ@mail.gmail.com>
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Content-Type: multipart/alternative; boundary=bcaec53f2e2d6a1cf204ef0823f0
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22f
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 1/1] qtest: Fix the bug
 about disabling vnc causes "make check" hang
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
X-List-Received-Date: Fri, 03 Jan 2014 03:02:29 -0000

--bcaec53f2e2d6a1cf204ef0823f0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2014/1/2 Andreas F=E4rber <afaerber@suse.de>

> Am 01.01.2014 05:40, schrieb Peter Crosthwaite:
> > On Tue, Dec 31, 2013 at 11:29 PM, Kewei Yu <keweihk@gmail.com> wrote:
> >> 2013/12/31 Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> >>> On Tue, Dec 31, 2013 at 2:42 PM, Kewei Yu <keweihk@gmail.com> wrote:
> >>>> When we disabling vnc from "./configure", the qemu can't use the vnc
> >>>> option.
> [...]
> >>>> So qtest can't use the "vnc -none ", otherwise "make check" will han=
g.
> >>>
> >>> Curious, why exactly does make check hang? Shouldn't it just fail wit=
h
> >>> an error result in this case?
> >>
> >> Yeah, there is an error result "VNC support is disabled".
> >
> > I think its just terminology then. s/hangs/fails.
>
> Actually no. When qtest gets an unsupported command line argument, so
> that QEMU exits right away, then qtest hangs, waiting for the process.
> This was easily reproducible by mistyping machine names in my qom-test.
> That's a separate issue though.
>
Yeah, It actually waits for the a handler and doesn't exit from "make
check".
Maybe I didn't show a detailed description.
So, Should I submit the patch v4?

>
> Regards,
> Andreas
>
> --
> SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg
>

--bcaec53f2e2d6a1cf204ef0823f0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
2014/1/2 Andreas F=E4rber <span dir=3D"ltr">&lt;<a href=3D"mailto:afaerber@=
suse.de" target=3D"_blank">afaerber@suse.de</a>&gt;</span><br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">

Am 01.01.2014 05:40, schrieb Peter Crosthwaite:<br>
<div class=3D"im">&gt; On Tue, Dec 31, 2013 at 11:29 PM, Kewei Yu &lt;<a hr=
ef=3D"mailto:keweihk@gmail.com">keweihk@gmail.com</a>&gt; wrote:<br>
&gt;&gt; 2013/12/31 Peter Crosthwaite &lt;<a href=3D"mailto:peter.crosthwai=
te@xilinx.com">peter.crosthwaite@xilinx.com</a>&gt;<br>
&gt;&gt;&gt; On Tue, Dec 31, 2013 at 2:42 PM, Kewei Yu &lt;<a href=3D"mailt=
o:keweihk@gmail.com">keweihk@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt; When we disabling vnc from &quot;./configure&quot;, the qe=
mu can&#39;t use the vnc<br>
&gt;&gt;&gt;&gt; option.<br>
</div>[...]<br>
<div class=3D"im">&gt;&gt;&gt;&gt; So qtest can&#39;t use the &quot;vnc -no=
ne &quot;, otherwise &quot;make check&quot; will hang.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Curious, why exactly does make check hang? Shouldn&#39;t it ju=
st fail with<br>
&gt;&gt;&gt; an error result in this case?<br>
&gt;&gt;<br>
&gt;&gt; Yeah, there is an error result &quot;VNC support is disabled&quot;=
.<br>
&gt;<br>
&gt; I think its just terminology then. s/hangs/fails.<br>
<br>
</div>Actually no. When qtest gets an unsupported command line argument, so=
<br>
that QEMU exits right away, then qtest hangs, waiting for the process.<br>
This was easily reproducible by mistyping machine names in my qom-test.<br>
That&#39;s a separate issue though.<br></blockquote><div>Yeah, It actually =
waits for the a handler and doesn&#39;t exit from &quot;make check&quot;.</=
div><div>Maybe I didn&#39;t show a detailed description.</div><div>So, Shou=
ld I submit the patch v4?</div>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Regards,<br>
<div class=3D"HOEnZb"><div class=3D"h5">Andreas<br>
<br>
--<br>
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany<br>
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnberg=
<br>
</div></div></blockquote></div><br></div></div>

--bcaec53f2e2d6a1cf204ef0823f0--

