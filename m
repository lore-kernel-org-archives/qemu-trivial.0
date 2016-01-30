Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aPYYl-0000ir-PS
	for mharc-qemu-trivial@gnu.org; Sat, 30 Jan 2016 11:39:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nutaro@gmail.com>) id 1aPWGW-0002Lq-7A
	for qemu-trivial@nongnu.org; Sat, 30 Jan 2016 09:12:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nutaro@gmail.com>) id 1aPWGV-0000OQ-0v
	for qemu-trivial@nongnu.org; Sat, 30 Jan 2016 09:12:40 -0500
Received: from mail-ig0-x232.google.com ([2607:f8b0:4001:c05::232]:33198)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nutaro@gmail.com>) id 1aPWGU-0000O4-PH
	for qemu-trivial@nongnu.org; Sat, 30 Jan 2016 09:12:38 -0500
Received: by mail-ig0-x232.google.com with SMTP id z14so8676362igp.0
	for <qemu-trivial@nongnu.org>; Sat, 30 Jan 2016 06:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=NNjHSwDrvWrUgZQCaji2VQUjoqtx7a8uAtjM3teWq9g=;
	b=VKd4OVzp8k2HvpCzMlOk5/gEFy+3Bwxn3AVhjyjeTh9h2NG/rnw6wsR4vuFAGTEVA0
	XhjcBggzSsPHID8/HiR/Tfp7l/m36gQu0WPlW8kJvmzsyX4gLcjcsNi7Ng4R2hjmMr/9
	giuAjDBmo9K5VF8fVX2lXOZvYQi9M6ylnzoGHnUj+U2p4bXAkHxcxqB+HfXvEfoPQBjT
	wwPr+hUoguaLspGW+UZwXcZ/xJB/bhWDLeLOBk+3WCVd6Kwa3Gpkd6iwFQ0tzkt7fEZE
	9DpPkHcYtuzG8sW1mNt/xt0IVXVbGjxjbEVSr7D4lBtEvbOl+G/i5waH9L3Xnb7UzUsb
	+59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=NNjHSwDrvWrUgZQCaji2VQUjoqtx7a8uAtjM3teWq9g=;
	b=bqjx7mywg69EBm/lBGUTzuQhAk+jv19PVETcRPEq6iodJXtFYjjvnFJJ7pPRptJL0T
	+/vRRuwJVx5MdIXcZauD3kyufIADEV7+zm9O2YxVDA62KwqexMilwq4NcNY23U818+Iv
	BMQ7cJxuDvxSOP6b8OBnMZdEpTsSSgK/XFEXIXTkligXnDF2SJlUt51dtnx7/dCQRepc
	u3e1Jqg7h4N5aV2LvVA3XecGFluhoSaO/utDp/RUBKsAthXDh498SXCcsQk6L0QFQD5O
	4/VWszo0jooV1sNbDUNvXUkUtOaBrUV7T32uFIrklhE2T7DhywqXPoZMKPbzytyRHiyq
	x2cg==
X-Gm-Message-State: AG10YOSybQUt1BZmS8q/0oyr4Rr2kTtXXiBwgKVNJevKtMJNoHs4lh0xstPh2agqyvkfPXdDkE3lOTb0yPMybA==
MIME-Version: 1.0
X-Received: by 10.50.36.35 with SMTP id n3mr2259215igj.73.1454163158093; Sat,
	30 Jan 2016 06:12:38 -0800 (PST)
Received: by 10.36.200.8 with HTTP; Sat, 30 Jan 2016 06:12:38 -0800 (PST)
In-Reply-To: <56AC831D.2080809@msgid.tls.msk.ru>
References: <CANVkX9HFRVH1n4WpHbZ23EGH6UFtrTCrh2r_CDHMPNtmU3w5_A@mail.gmail.com>
	<56AC831D.2080809@msgid.tls.msk.ru>
Date: Sat, 30 Jan 2016 09:12:38 -0500
Message-ID: <CANVkX9EcRppcyH59NKj5Lr3cRCX9-980qQhSc8+C1JHsDfHLgQ@mail.gmail.com>
From: James Nutaro <nutaro@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: multipart/alternative; boundary=089e011609747bd9e1052a8dbed4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c05::232
X-Mailman-Approved-At: Sat, 30 Jan 2016 11:39:38 -0500
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Added code for synchronzing the internal
 simulation clock with an external simulation clock
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
X-List-Received-Date: Sat, 30 Jan 2016 14:12:41 -0000

--089e011609747bd9e1052a8dbed4
Content-Type: text/plain; charset=UTF-8

Will do. It seemed small and simple enough to be trivial 8--).

Thanks

On Sat, Jan 30, 2016 at 4:32 AM, Michael Tokarev <mjt@tls.msk.ru> wrote:

> 13.01.2016 18:35, James Nutaro wrote:
> >
> > This patch adds an interface via UNIX shared memory for pacing the
> execution of QEMU to match an external simulation clock. The aim is to
> allow QEMU to be used as a module inside of a larger simulation system.
> >
> > The body of the patch is below.
> >
> [...]
> > ---
> >  Makefile.target          |   2 +-
> >  cpus.c                   |   9 ++++-
> >  include/qemu/thread.h    |   8 ++++
> >  qqq.c                    | 101
> +++++++++++++++++++++++++++++++++++++++++++++++
> >  qqq.h                    |  67 +++++++++++++++++++++++++++++++
> >  util/qemu-thread-posix.c |  14 +++++++
> >  vl.c                     |   5 +++
> >  7 files changed, 204 insertions(+), 2 deletions(-)
> >  create mode 100644 qqq.c
> >  create mode 100644 qqq.h
>
> Now I wonder what it has to do with -trivial and why it hasn't
> been sent to -devel.  It's a new subsystem, so to say... :)
>
> Please post it to qemu-devel mailinglist at least.
>
> Thanks,
>
> /mjt
>

--089e011609747bd9e1052a8dbed4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Will do. It seemed small and simple enough to be triv=
ial 8--).<br><br></div>Thanks<br></div><div class=3D"gmail_extra"><br><div =
class=3D"gmail_quote">On Sat, Jan 30, 2016 at 4:32 AM, Michael Tokarev <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:mjt@tls.msk.ru" target=3D"_blank">mjt@t=
ls.msk.ru</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">13.01.2016 18:35, James Nutaro wrote:<br>
&gt;<br>
&gt; This patch adds an interface via UNIX shared memory for pacing the exe=
cution of QEMU to match an external simulation clock. The aim is to allow Q=
EMU to be used as a module inside of a larger simulation system.<br>
&gt;<br>
&gt; The body of the patch is below.<br>
&gt;<br>
</span>[...]<br>
<span class=3D"">&gt; ---<br>
&gt;=C2=A0 Makefile.target=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
2 +-<br>
&gt;=C2=A0 cpus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A09 ++++-<br>
&gt;=C2=A0 include/qemu/thread.h=C2=A0 =C2=A0 |=C2=A0 =C2=A08 ++++<br>
&gt;=C2=A0 qqq.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 101 +++++++++++++++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 qqq.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 67 +++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 util/qemu-thread-posix.c |=C2=A0 14 +++++++<br>
&gt;=C2=A0 vl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +++<br>
&gt;=C2=A0 7 files changed, 204 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 create mode 100644 qqq.c<br>
&gt;=C2=A0 create mode 100644 qqq.h<br>
<br>
</span>Now I wonder what it has to do with -trivial and why it hasn&#39;t<b=
r>
been sent to -devel.=C2=A0 It&#39;s a new subsystem, so to say... :)<br>
<br>
Please post it to qemu-devel mailinglist at least.<br>
<br>
Thanks,<br>
<br>
/mjt<br>
</blockquote></div><br></div>

--089e011609747bd9e1052a8dbed4--

