Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VyBZH-0008Re-UU
	for mharc-qemu-trivial@gnu.org; Tue, 31 Dec 2013 21:29:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1VyBZF-0008OC-62
	for qemu-trivial@nongnu.org; Tue, 31 Dec 2013 21:29:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1VyBZE-0001B9-83
	for qemu-trivial@nongnu.org; Tue, 31 Dec 2013 21:29:57 -0500
Received: from mail-wg0-x22d.google.com ([2a00:1450:400c:c00::22d]:38993)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>)
	id 1VyBZ7-00019z-CA; Tue, 31 Dec 2013 21:29:49 -0500
Received: by mail-wg0-f45.google.com with SMTP id y10so11531367wgg.12
	for <multiple recipients>; Tue, 31 Dec 2013 18:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=uIrNtXwW6mrbwPTC+UY8gAuTRnc0nOWfGWgmrAQzKPs=;
	b=MYagWuzxGOhUlaYdl68LUeL5hIKpE3TOGzPxlrzuJvoDP5I0V/g+/8chunB1cT5Jk3
	G2MCMUWn1FZAvpCtYIqGyLw6rtT9IP3wFpcRf1BZoGnhgMIflErLos3VxVJMyN1ljNid
	JRWkokjowgd2yNQPMYl+olvJGCgufFixcR7e0rJsxQOZiOp00O6RW1MUibEYOiHIsPgN
	PeTcYKsEdQIERG8owtrXSEM/KgxWKGi41kNfu/O8y6p+1YSjBQdixb+jfKH0qhV4v56L
	U3kr4KS8xTDYG40azb9hGE/naQ/SK1+5dH3g7f4gkMcsy/vK6Z8nSU8HPMoT/hknfJoU
	Rj9A==
X-Received: by 10.180.126.4 with SMTP id mu4mr32659864wib.36.1388543388386;
	Tue, 31 Dec 2013 18:29:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.108.74 with HTTP; Tue, 31 Dec 2013 18:29:28 -0800 (PST)
In-Reply-To: <CAFEAcA8iVQWWYDLZLS60U=u=Hyd4WToG_nWtcG0ZHVs7-ELnwA@mail.gmail.com>
References: <1388464944-26911-1-git-send-email-keweihk@gmail.com>
	<CAEgOgz54Zj9w8gQaMNBvVCiFQX5raPFXLGODy97PrD-TmYSBvw@mail.gmail.com>
	<CAJBZ5eP8tRvaQf6qW-zzUs_WQ2WcwTyo0i5Xz3ak8SSprU9vmQ@mail.gmail.com>
	<CAFEAcA8iVQWWYDLZLS60U=u=Hyd4WToG_nWtcG0ZHVs7-ELnwA@mail.gmail.com>
From: Kewei Yu <keweihk@gmail.com>
Date: Wed, 1 Jan 2014 10:29:28 +0800
Message-ID: <CAJBZ5eOu2Xs0Z9rYSCdNexUE-qJ3FvpnxgWcNfqJdT8koBNQXA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary=e89a8f839d856b987c04eedf73d2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22d
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
X-List-Received-Date: Wed, 01 Jan 2014 02:29:58 -0000

--e89a8f839d856b987c04eedf73d2
Content-Type: text/plain; charset=ISO-8859-1

2014/1/1 Peter Maydell <peter.maydell@linaro.org>

> On 31 December 2013 13:29, Kewei Yu <keweihk@gmail.com> wrote:
> > 2013/12/31 Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> >>
> >> On Tue, Dec 31, 2013 at 2:42 PM, Kewei Yu <keweihk@gmail.com> wrote:
> >> >                                    "%s", qemu_binary, s->socket_path,
> >> >                                    s->qmp_socket_path, pid_file,
> >> > +                                  qtest_vnc_param ?: "",
> >>
> >> I do vaguely remember someone going to efforts to remove uses of "? :
> >> foo" (with the blank true value).
> >
> >  I'm not clear the sentence's meaning.
>
> Using the ternary operator "X ? Y : Z" with an empty 2nd operand
> "X ?: Y" is not standard C. It's a GCC extension. There was a
> suggestion a year or so back that we should remove the uses of
> it, but the consensus was that this was unnecessary, since in
> practice we rely on other GCC extensions. Clang also supports
> this syntax, and it's the only other compiler we care about.
>
>
Oh! Thank you, I got it.

In this case it seems reasonable, especially since the line
> immediately below this addition is using it too.
>

But,do I need to fix them to be "X ? Y : Z" and keep them consistent?

Faithfully yours
Kewei Yu

thanks
> -- PMM
>

--e89a8f839d856b987c04eedf73d2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
2014/1/1 Peter Maydell <span dir=3D"ltr">&lt;<a href=3D"mailto:peter.maydel=
l@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;</span><br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">

<div class=3D"im">On 31 December 2013 13:29, Kewei Yu &lt;<a href=3D"mailto=
:keweihk@gmail.com">keweihk@gmail.com</a>&gt; wrote:<br>
&gt; 2013/12/31 Peter Crosthwaite &lt;<a href=3D"mailto:peter.crosthwaite@x=
ilinx.com">peter.crosthwaite@xilinx.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Dec 31, 2013 at 2:42 PM, Kewei Yu &lt;<a href=3D"mailto:ke=
weihk@gmail.com">keweihk@gmail.com</a>&gt; wrote:<br>
</div><div class=3D"im">&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;%s&quot;, qemu_binary, s-&gt;socket_path,<br>
&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;qmp=
_socket_path, pid_file,<br>
&gt;&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qtest_vnc_param =
?: &quot;&quot;,<br>
&gt;&gt;<br>
&gt;&gt; I do vaguely remember someone going to efforts to remove uses of &=
quot;? :<br>
&gt;&gt; foo&quot; (with the blank true value).<br>
&gt;<br>
&gt; =C2=A0I&#39;m not clear the sentence&#39;s meaning.<br>
<br>
</div>Using the ternary operator &quot;X ? Y : Z&quot; with an empty 2nd op=
erand<br>
&quot;X ?: Y&quot; is not standard C. It&#39;s a GCC extension. There was a=
<br>
suggestion a year or so back that we should remove the uses of<br>
it, but the consensus was that this was unnecessary, since in<br>
practice we rely on other GCC extensions. Clang also supports<br>
this syntax, and it&#39;s the only other compiler we care about.<br>
<br></blockquote><div>=C2=A0</div><div>Oh! Thank you, I got it.</div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-styl=
e:solid;padding-left:1ex">


In this case it seems reasonable, especially since the line<br>
immediately below this addition is using it too.<br></blockquote><div>=C2=
=A0</div><div>But,do I need to fix them to be &quot;X ? Y : Z&quot; and kee=
p them consistent?</div><div><br></div><div><div style=3D"color:rgb(0,0,0);=
font-family:&#39;lucida Grande&#39;,Verdana;font-size:12px;line-height:18px=
">

<span style=3D"color:rgb(51,51,51);font-family:=E5=BE=AE=E8=BD=AF=E9=9B=85=
=E9=BB=91,PMingLiU,Verdana,Arial,Helvetica,sans-serif;font-size:13px;line-h=
eight:22px;background-color:rgb(250,250,250)">Faithfully yours</span></div>=
<div style=3D"color:rgb(0,0,0);font-family:&#39;lucida Grande&#39;,Verdana;=
font-size:12px;line-height:18px">

<span style=3D"color:rgb(51,51,51);font-family:=E5=BE=AE=E8=BD=AF=E9=9B=85=
=E9=BB=91,PMingLiU,Verdana,Arial,Helvetica,sans-serif;font-size:13px;line-h=
eight:22px;background-color:rgb(250,250,250)">Kewei Yu</span></div></div><d=
iv style=3D"color:rgb(0,0,0);font-family:&#39;lucida Grande&#39;,Verdana;fo=
nt-size:12px;line-height:18px">

<span style=3D"color:rgb(51,51,51);font-family:=E5=BE=AE=E8=BD=AF=E9=9B=85=
=E9=BB=91,PMingLiU,Verdana,Arial,Helvetica,sans-serif;font-size:13px;line-h=
eight:22px;background-color:rgb(250,250,250)"><br></span></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1=
px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:=
1ex">


thanks<br>
-- PMM<br></blockquote><div>=C2=A0</div></div><div style=3D"color:rgb(0,0,0=
);font-family:&#39;lucida Grande&#39;,Verdana;font-size:12px;line-height:18=
px"><br></div></div></div>

--e89a8f839d856b987c04eedf73d2--

