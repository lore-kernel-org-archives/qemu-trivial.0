Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cfLpr-00021B-Q3
	for mharc-qemu-trivial@gnu.org; Sun, 19 Feb 2017 02:23:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chadjoan@gmail.com>) id 1cfLpn-00020x-GA
	for qemu-trivial@nongnu.org; Sun, 19 Feb 2017 02:23:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chadjoan@gmail.com>) id 1cfLpm-0008SY-5B
	for qemu-trivial@nongnu.org; Sun, 19 Feb 2017 02:23:03 -0500
Received: from mail-qk0-x22a.google.com ([2607:f8b0:400d:c09::22a]:35715)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <chadjoan@gmail.com>)
	id 1cfLpl-0008SM-V3; Sun, 19 Feb 2017 02:23:02 -0500
Received: by mail-qk0-x22a.google.com with SMTP id u25so74232259qki.2;
	Sat, 18 Feb 2017 23:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9iFy50rY4V3pfv7sbZ64zI1NHYCGRPFqfjFmJdkhxn4=;
	b=LpKyZ+xRKRvDGnEdZMhUTr0jgqn7u8keCMYCqWrZQ5q/iZPXselnIx/j+dKE2obNIq
	RCfcC5A6dubiXOx7rcxP3TR8SW4OMRlOdYFjUWCSBH7u1YJkIWr4yqU++w75m3XT4nU2
	bs92Gys5ZBknxgnXEI50BmNRNqk+CFS9cOdlYSM74vEKdM3PuhR6sctfb0YLanwt2vJM
	+aaw4cC0RFQoGL6lnf+EHNsmyqyTgSnNPAlWts/08oRGeteqNFsnVDvBE+oiT9141Io5
	0pGnpEMnoUewggenVu7QTv447rcs5Ifktjd+3bqwCr8e7f/Kzp0UqkbKTjscLyT4ew/s
	BGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9iFy50rY4V3pfv7sbZ64zI1NHYCGRPFqfjFmJdkhxn4=;
	b=cWHzd++6pb+yOt6yNvqeXJkVe3OAaH3Tqg2BdZkF/pN7rOAhTQ0B4omR8I/lgFm1ZC
	8twiRGFTGxFb9NL7MK/0j5b18tQTYxnIpFSvvlqIdzxgq3HQ1E4Yli4Ljruz8CZcUIEi
	wri0a44M6X9slY5Xbb2h1lRjpeLc+9f4UeS+QT8fCkmzir37Xui1kymTjTWEQJ6HyWHe
	rDT6a6r1fAgExrlzACjvR+4MRDZiEN9acuxUgZmPTrvbkSn3uCq8J52RZHdWkvAw2FOr
	glRXSPbtM/lfJRU3GkcSlgcR1nMIIkklDijusoeNcakglQADH3sBgIxaOrJduG/I19WF
	j8/Q==
X-Gm-Message-State: AMke39knANXQOYcm0WVPgZnz86RBixlo5wjz26QY/WmGCLqa4xmAgJC/0xukRzKmXOqHY+/w8LxiCsixRbjjVg==
X-Received: by 10.55.87.198 with SMTP id l189mr14450148qkb.106.1487488981450; 
	Sat, 18 Feb 2017 23:23:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.149.146 with HTTP; Sat, 18 Feb 2017 23:22:41 -0800 (PST)
In-Reply-To: <CAFEAcA_N1j9tpxEBROG6D1per9vDMPZeuRyM93BRzNT5ZK3q0Q@mail.gmail.com>
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
	<1933406e-2576-e687-3545-a72f3b999310@redhat.com>
	<bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
	<CABHMSTUsZy0u4b1b84YC5CgafKvD-Zms5dCQ=31+XnQphUQxLA@mail.gmail.com>
	<20170217064327.GB21716@lemon.lan>
	<CAFEAcA8_f8SVX+rirAFBJ76ZiXaKUwh9uO0AeBFoR7G_q8pGDg@mail.gmail.com>
	<6ab86cf8-4780-ca76-f648-ac0ce211e27b@redhat.com>
	<CABHMSTWN2KdAXDjEEbyWio6rNM2FuDk_NUj40mFW0HdyZFu68g@mail.gmail.com>
	<CAFEAcA_N1j9tpxEBROG6D1per9vDMPZeuRyM93BRzNT5ZK3q0Q@mail.gmail.com>
From: Chad Joan <chadjoan@gmail.com>
Date: Sun, 19 Feb 2017 02:22:41 -0500
Message-ID: <CABHMSTUJEEwbo76-4cqRq01Lpv76Y0KMdjAvgcgmuVARZGudEw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Eric Blake <eblake@redhat.com>, Fam Zheng <famz@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary=001a114dbb7858c7eb0548dd0421
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::22a
Subject: Re: [Qemu-trivial] [Qemu-devel] Fix build break during
 configuration on musl-libc based Linux systems.
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
X-List-Received-Date: Sun, 19 Feb 2017 07:23:06 -0000

--001a114dbb7858c7eb0548dd0421
Content-Type: text/plain; charset=UTF-8

This is kinda depressing to read :(

But thanks for explaining.

I got a good laugh when it mentioned of Lotus Notes, "Run away from it."

Would it be reasonable to stick a link to that article in the submit a
patch document?  Something like, "If you can't use 'git send-email' for any
reason, then please review [link]this article[/link] to understand which
clients are capable of sending acceptable patches and how to configure
them."

I suspect I'm going to encounter this problem again as I try to make small
fixes for more projects, so it might be worth it for me to spend a small
amount of time at some point setting up a mail client that I can send git
patches with.  Or perhaps I can just move the patch(es) onto another
machine (ex: my personal laptop) and send it with 'git send-email' from
there, instead of needing to install a mail client that is outside of my
normal workflow.  I am not comfortable with putting smtp login information
onto the server that I am using for this work.  If anyone has any advice on
how to handle this situation, I'd appreciate it.  That kernel doc that
Peter linked is already pretty helpful, at least.

Thanks!

On Fri, Feb 17, 2017 at 12:15 PM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 17 February 2017 at 16:54, Chad Joan <chadjoan@gmail.com> wrote:
> > so if we can test and
> > approve even /some/ of the more popular mail clients (ex: gmail,
> > thunderbird, outlook, etc) for use, it would help newbies A LOT.
>
> Pretty sure we've seen mangled emails from all of those.
> The problem is that most email clients will automatically
> wrap long lines, which is fine for text but breaks an
> inline patch. Changing trailing whitespace in patches is
> also a common issue.
>
> The documentation in "git help format-patch" has a section
> "MUA-SPECIFIC HINTS" which says that gmail's web interface
> is definitely no good, and Thunderbird defaults to the wrong
> thing and requires a bunch of config changes which you'd then
> have to switch back to your preferences for normal mail when
> you're done sending patches. Outlook is so hopeless for
> patch mail it isn't even listed :-)
>
> The kernel docs have a longer list of mail clients with
> notes about suitability:
> https://kernel.org/doc/html/latest/process/email-clients.html
> but the set of "just works" clients is very small.
>
> thanks
> -- PMM
>

--001a114dbb7858c7eb0548dd0421
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This is kinda depressing to read :(<br><br>But thanks=
 for explaining.<br><br></div><div>I got a good laugh when it mentioned of =
Lotus Notes, &quot;Run away from it.&quot;<br><br></div><div>Would it be re=
asonable to stick a link to that article in the submit a patch document?=C2=
=A0 Something like, &quot;If you can&#39;t use &#39;git send-email&#39; for=
 any reason, then please review [link]this article[/link] to understand whi=
ch clients are capable of sending acceptable patches and how to configure t=
hem.&quot;<br><br></div><div>I suspect I&#39;m going to encounter this prob=
lem again as I try to make small fixes for more projects, so it might be wo=
rth it for me to spend a small amount of time at some point setting up a ma=
il client that I can send git patches with.=C2=A0 Or perhaps I can just mov=
e the patch(es) onto another machine=20
(ex: my personal laptop) and send it with &#39;git send-email&#39; from the=
re,=20
instead of needing to install a mail client that is outside of my normal
 workflow.=C2=A0 I am not comfortable with putting smtp login information o=
nto the server that I am using for this work.=C2=A0 If anyone has any advic=
e on how to handle this situation, I&#39;d appreciate it.=C2=A0 That kernel=
 doc that Peter linked is already pretty helpful, at least.<br><br></div><d=
iv>Thanks!<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Fri, Feb 17, 2017 at 12:15 PM, Peter Maydell <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@l=
inaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><span class=3D"gmail-">On 17 February 2017 at 16:54, Chad Joan &=
lt;<a href=3D"mailto:chadjoan@gmail.com">chadjoan@gmail.com</a>&gt; wrote:<=
br>
</span><span class=3D"gmail-">&gt; so if we can test and<br>
&gt; approve even /some/ of the more popular mail clients (ex: gmail,<br>
&gt; thunderbird, outlook, etc) for use, it would help newbies A LOT.<br>
<br>
</span>Pretty sure we&#39;ve seen mangled emails from all of those.<br>
The problem is that most email clients will automatically<br>
wrap long lines, which is fine for text but breaks an<br>
inline patch. Changing trailing whitespace in patches is<br>
also a common issue.<br>
<br>
The documentation in &quot;git help format-patch&quot; has a section<br>
&quot;MUA-SPECIFIC HINTS&quot; which says that gmail&#39;s web interface<br=
>
is definitely no good, and Thunderbird defaults to the wrong<br>
thing and requires a bunch of config changes which you&#39;d then<br>
have to switch back to your preferences for normal mail when<br>
you&#39;re done sending patches. Outlook is so hopeless for<br>
patch mail it isn&#39;t even listed :-)<br>
<br>
The kernel docs have a longer list of mail clients with<br>
notes about suitability:<br>
<a href=3D"https://kernel.org/doc/html/latest/process/email-clients.html" r=
el=3D"noreferrer" target=3D"_blank">https://kernel.org/doc/html/<wbr>latest=
/process/email-clients.<wbr>html</a><br>
but the set of &quot;just works&quot; clients is very small.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br></div></div>

--001a114dbb7858c7eb0548dd0421--

