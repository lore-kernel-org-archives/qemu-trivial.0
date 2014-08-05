Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XEek4-0002pl-9G
	for mharc-qemu-trivial@gnu.org; Tue, 05 Aug 2014 09:25:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1XEejs-0002XO-Ia
	for qemu-trivial@nongnu.org; Tue, 05 Aug 2014 09:25:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1XEejk-0008Pd-1H
	for qemu-trivial@nongnu.org; Tue, 05 Aug 2014 09:25:16 -0400
Received: from mail-qa0-f42.google.com ([209.85.216.42]:49612)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1XEejj-0008PA-LN
	for qemu-trivial@nongnu.org; Tue, 05 Aug 2014 09:25:07 -0400
Received: by mail-qa0-f42.google.com with SMTP id j15so908666qaq.29
	for <qemu-trivial@nongnu.org>; Tue, 05 Aug 2014 06:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=ZzqAtUZLfQadRW6+hEKKjEOIW4X4uyUV4oKRBqKkOzw=;
	b=NSAAuoV8smjw24If/UgXlnFE/vlrGAcB5TXYS5gHPS+goUCgra4XdeN9XvGoUEiHlr
	KKli9ul455BMk8CvrUVZTlRn3CBhAY8aBqwjLw5/ct8dDvVBWfWvuWgqknjm6vsC1Eix
	k1UtZdWOV4Kt3ELD/RuGKnhMv1OMRfovliexP/sNVrZjxoe7HtMl6OIYSABeNzQGF5jd
	HBLgYKSe8gRSiOI96E2e0nF5coiyal1OplNe2SEwd9l+XDcAldWdF8XcevC2/QCoYSN1
	euTpw0fUwMdqWK29siloO875EF3cAZiTWFgArJDRqr8weGMt6ReUsgRABDcpxOyIPvcO
	G9+A==
X-Gm-Message-State: ALoCoQmk4/dBmh4BiCD/qj0cbxPbhuIrU+oK5fi/qFFKIvhQxN/XJIqgw8rSleMfiBIwsc2ZIb5/
MIME-Version: 1.0
X-Received: by 10.140.102.117 with SMTP id v108mr5140596qge.93.1407245106561; 
	Tue, 05 Aug 2014 06:25:06 -0700 (PDT)
Received: by 10.140.36.106 with HTTP; Tue, 5 Aug 2014 06:25:06 -0700 (PDT)
Received: by 10.140.36.106 with HTTP; Tue, 5 Aug 2014 06:25:06 -0700 (PDT)
In-Reply-To: <87y4v3mfxq.fsf@blackfin.pond.sub.org>
References: <53DE5538.1020701@gmail.com> <53DF3D74.9070503@msgid.tls.msk.ru>
	<87d2cguupa.fsf@blackfin.pond.sub.org> <53E06083.7080909@gmail.com>
	<53E082EF.9090007@msgid.tls.msk.ru>
	<87y4v3mfxq.fsf@blackfin.pond.sub.org>
Date: Tue, 5 Aug 2014 06:25:06 -0700
Message-ID: <CA+aC4kushQWyeTzWur586EVfds=CgmJX-jivAqWPsg+nm9KaTg@mail.gmail.com>
From: Anthony Liguori <anthony@codemonkey.ws>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary=001a11c16ec4b05ce404ffe1c80a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.42
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	Chen Gang <gang.chen.5i5j@gmail.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] Cc'ing emails [
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
X-List-Received-Date: Tue, 05 Aug 2014 13:25:24 -0000

--001a11c16ec4b05ce404ffe1c80a
Content-Type: text/plain; charset=UTF-8

On Aug 5, 2014 2:42 AM, "Markus Armbruster" <armbru@redhat.com> wrote:
>
> Michael Tokarev <mjt@tls.msk.ru> writes:
>
> > 05.08.2014 08:41, Chen Gang wrote:
> >>
> >> Every members have their own tastes, and one working flow may be not
> >> suitable for all members. I can understand, and hope other members
> >> understand too.
> >>
> >> At least for me, next, I shall send patch to the members which I can
get
> >> from 'get_maintainers.pl' and only Cc to qemu-devel. And shall skip
> >> qemu-trivial and Michael Tokarev.
> >
> > Why skip both?  It's your call, but I'm curious.
> >
> > What I _think_ wrong is that get_maintainers.pl lists many random
> > "patchers" for a given file by default.
> >
> > Besides, we should probably review role of Anthony Ligory, because
> > he is returned as a sole contact for manu files, but apparently he
> > does not reply to emails anymore.
> >
> > []
> >>>> I'm not sure how people treat these cases or deal with them.
> >>>> We are subscribed to, in particular, qemu-devel@, and active
> >>>> maintainers look there too, so receive more than one copy of
> >>>> many emails.
> >>>
> >>> I believe fighting the established convention to copy is futile.  I
> >>> embrace it instead, and make it help me prioritize my reading.  Copy
me,
> >>> and I'll at least skim cover letters and other thread-starters to
> >>> determine whether I need to follow this thread.  Don't copy me, and
I'll
> >>> at best glance at the subject in passing.
> >
> > We created some separate mailinglists - for example -trivial@ -
especially
> > to get such attention.  This is what I'm talking about, in most part,
> > because main qemu mailinglist traffic become quite a bit high to follow
> > it closely, and it is a good idea indeed to Cc someone when sending mail
> > to qemu-devel@.  But even there, Cc'ing random "patchers" as
get_maintainer.pl
> > often suggests is _not_ a good idea.  I think.
>
> I don't disagree with you there.  I take get_maintainer.pl as advice,
> not gospel.
>
> Note that because --git is *off* by default, you get "random patchers"
> only when MAINTAINERS comes up empty.  Which it does far too often,
> because its coverage is lousy: some 1300 out of >3600 files.
>
> We could default --git-fallback to off to suppress "random patchers"
> unless you ask for them.
>
> >>> Automatic filing into folders and marking copies so I don't have to
mark
> >>> them read twice helps.
> >>>
> >>> The additional traffic is a drop in a bucket.
> >
> > Which traffic you refer to as "additional"?  The personal emails?
>
> The personal copies compared to the full list traffic.
>
> I count some 1200 messages to qemu-devel for the past week.  32 contain
> the string "mjt@tls", which I take as a crude upper bound for you
> getting a copy.  I don't mean to say that's not annoying or a drain on
> your time (who am I to judge?), just that the additional network traffic
> over full qemu-devel delivery is negligible.
>
> > At least in my case it is quite significant because of qemu, and qemu
> > is _far_ from a single project where I actively contributed.  For
example,
> > I contributed many things to postfix, but I don't have to worry about
> > it in any way, and I don't receive random personal emails - if something
> > is being Cc'ed to me it really is something important.  Ditto for linux
> > kernel and other areas.
>
> I recommend to set up filters to file away list traffic and copies of
> list traffic separately from your private e-mail.
>
> > In case of qemu, see -- for example, Anthony, who apparently stepped
> > out from qemu.  Almost every email on qemu-devel@ is being Cc'ed to
> > him nowadays, so he receives _whole_ qemu-devel@ in his personal
> > mailbox.
>
> I'd be surprised if he received copies in his personal inbox.  I expect
> him to file them smartly.
>
> >           Is it also a drop in (his) bucket?
>
> I guess it is: 125 of last week's messages contain "aliguori@".

Good email clients can filter with complex rules.  Just filter
to:your@mail.com and to:qemu-devel into a separate folder.

And yes, 15 emails a day is a drop in the bucket...

--001a11c16ec4b05ce404ffe1c80a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Aug 5, 2014 2:42 AM, &quot;Markus Armbruster&quot; &lt;<a href=3D"mailto=
:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Michael Tokarev &lt;<a href=3D"mailto:mjt@tls.msk.ru">mjt@tls.msk.ru</=
a>&gt; writes:<br>
&gt;<br>
&gt; &gt; 05.08.2014 08:41, Chen Gang wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Every members have their own tastes, and one working flow may=
 be not<br>
&gt; &gt;&gt; suitable for all members. I can understand, and hope other me=
mbers<br>
&gt; &gt;&gt; understand too.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; At least for me, next, I shall send patch to the members whic=
h I can get<br>
&gt; &gt;&gt; from &#39;<a href=3D"http://get_maintainers.pl">get_maintaine=
rs.pl</a>&#39; and only Cc to qemu-devel. And shall skip<br>
&gt; &gt;&gt; qemu-trivial and Michael Tokarev.<br>
&gt; &gt;<br>
&gt; &gt; Why skip both? =C2=A0It&#39;s your call, but I&#39;m curious.<br>
&gt; &gt;<br>
&gt; &gt; What I _think_ wrong is that <a href=3D"http://get_maintainers.pl=
">get_maintainers.pl</a> lists many random<br>
&gt; &gt; &quot;patchers&quot; for a given file by default.<br>
&gt; &gt;<br>
&gt; &gt; Besides, we should probably review role of Anthony Ligory, becaus=
e<br>
&gt; &gt; he is returned as a sole contact for manu files, but apparently h=
e<br>
&gt; &gt; does not reply to emails anymore.<br>
&gt; &gt;<br>
&gt; &gt; []<br>
&gt; &gt;&gt;&gt;&gt; I&#39;m not sure how people treat these cases or deal=
 with them.<br>
&gt; &gt;&gt;&gt;&gt; We are subscribed to, in particular, qemu-devel@, and=
 active<br>
&gt; &gt;&gt;&gt;&gt; maintainers look there too, so receive more than one =
copy of<br>
&gt; &gt;&gt;&gt;&gt; many emails.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; I believe fighting the established convention to copy is =
futile. =C2=A0I<br>
&gt; &gt;&gt;&gt; embrace it instead, and make it help me prioritize my rea=
ding. =C2=A0Copy me,<br>
&gt; &gt;&gt;&gt; and I&#39;ll at least skim cover letters and other thread=
-starters to<br>
&gt; &gt;&gt;&gt; determine whether I need to follow this thread. =C2=A0Don=
&#39;t copy me, and I&#39;ll<br>
&gt; &gt;&gt;&gt; at best glance at the subject in passing.<br>
&gt; &gt;<br>
&gt; &gt; We created some separate mailinglists - for example -trivial@ - e=
specially<br>
&gt; &gt; to get such attention. =C2=A0This is what I&#39;m talking about, =
in most part,<br>
&gt; &gt; because main qemu mailinglist traffic become quite a bit high to =
follow<br>
&gt; &gt; it closely, and it is a good idea indeed to Cc someone when sendi=
ng mail<br>
&gt; &gt; to qemu-devel@. =C2=A0But even there, Cc&#39;ing random &quot;pat=
chers&quot; as <a href=3D"http://get_maintainer.pl">get_maintainer.pl</a><b=
r>
&gt; &gt; often suggests is _not_ a good idea. =C2=A0I think.<br>
&gt;<br>
&gt; I don&#39;t disagree with you there. =C2=A0I take <a href=3D"http://ge=
t_maintainer.pl">get_maintainer.pl</a> as advice,<br>
&gt; not gospel.<br>
&gt;<br>
&gt; Note that because --git is *off* by default, you get &quot;random patc=
hers&quot;<br>
&gt; only when MAINTAINERS comes up empty. =C2=A0Which it does far too ofte=
n,<br>
&gt; because its coverage is lousy: some 1300 out of &gt;3600 files.<br>
&gt;<br>
&gt; We could default --git-fallback to off to suppress &quot;random patche=
rs&quot;<br>
&gt; unless you ask for them.<br>
&gt;<br>
&gt; &gt;&gt;&gt; Automatic filing into folders and marking copies so I don=
&#39;t have to mark<br>
&gt; &gt;&gt;&gt; them read twice helps.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; The additional traffic is a drop in a bucket.<br>
&gt; &gt;<br>
&gt; &gt; Which traffic you refer to as &quot;additional&quot;? =C2=A0The p=
ersonal emails?<br>
&gt;<br>
&gt; The personal copies compared to the full list traffic.<br>
&gt;<br>
&gt; I count some 1200 messages to qemu-devel for the past week. =C2=A032 c=
ontain<br>
&gt; the string &quot;mjt@tls&quot;, which I take as a crude upper bound fo=
r you<br>
&gt; getting a copy. =C2=A0I don&#39;t mean to say that&#39;s not annoying =
or a drain on<br>
&gt; your time (who am I to judge?), just that the additional network traff=
ic<br>
&gt; over full qemu-devel delivery is negligible.<br>
&gt;<br>
&gt; &gt; At least in my case it is quite significant because of qemu, and =
qemu<br>
&gt; &gt; is _far_ from a single project where I actively contributed. =C2=
=A0For example,<br>
&gt; &gt; I contributed many things to postfix, but I don&#39;t have to wor=
ry about<br>
&gt; &gt; it in any way, and I don&#39;t receive random personal emails - i=
f something<br>
&gt; &gt; is being Cc&#39;ed to me it really is something important. =C2=A0=
Ditto for linux<br>
&gt; &gt; kernel and other areas.<br>
&gt;<br>
&gt; I recommend to set up filters to file away list traffic and copies of<=
br>
&gt; list traffic separately from your private e-mail.<br>
&gt;<br>
&gt; &gt; In case of qemu, see -- for example, Anthony, who apparently step=
ped<br>
&gt; &gt; out from qemu. =C2=A0Almost every email on qemu-devel@ is being C=
c&#39;ed to<br>
&gt; &gt; him nowadays, so he receives _whole_ qemu-devel@ in his personal<=
br>
&gt; &gt; mailbox.<br>
&gt;<br>
&gt; I&#39;d be surprised if he received copies in his personal inbox. =C2=
=A0I expect<br>
&gt; him to file them smartly.<br>
&gt;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Is it also a drop in (his) buc=
ket?<br>
&gt;<br>
&gt; I guess it is: 125 of last week&#39;s messages contain &quot;aliguori@=
&quot;.</p>
<p dir=3D"ltr">Good email clients can filter with complex rules.=C2=A0 Just=
 filter <a href=3D"mailto:to%3Ayour@mail.com">to:your@mail.com</a> and to:q=
emu-devel into a separate folder.</p>
<p dir=3D"ltr">And yes, 15 emails a day is a drop in the bucket...</p>

--001a11c16ec4b05ce404ffe1c80a--

