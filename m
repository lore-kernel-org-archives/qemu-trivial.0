Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W01ol-0007A6-Vg
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jan 2014 23:29:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1W01oj-00076H-CU
	for qemu-trivial@nongnu.org; Sun, 05 Jan 2014 23:29:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1W01oi-00054U-Cv
	for qemu-trivial@nongnu.org; Sun, 05 Jan 2014 23:29:33 -0500
Received: from mail-wg0-x22b.google.com ([2a00:1450:400c:c00::22b]:45531)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>)
	id 1W01og-000543-Aa; Sun, 05 Jan 2014 23:29:30 -0500
Received: by mail-wg0-f43.google.com with SMTP id k14so15432372wgh.22
	for <multiple recipients>; Sun, 05 Jan 2014 20:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ytndf4qmSZKCsd/mB8iTwtP/n9tM/oFMPKv3Cfbp6SU=;
	b=TXjKGsMImXurG+04MIaWSNZxE7m4fwWuvJ0rx9nFnnowSe4DDypsaLLKkDAgEniyP6
	p3uBnNI0Ufz1a4h5MUwVAzAhlTbQ9HiAKJNuDgyof+U8JycgK7DpR0T4hbrqRdZO6HAp
	USrIpYVXjaoWp7RXU4Kf2HWgcx7O+WhmdvE0goAVvsQn+JtQo+QbX1O78HqoY1f2UJ3I
	yWjve43CkYEntw9CA23IqE4uOOXo+XHrzuBj8TUt4Sw/92Lfb3I10cJwvuGc9ZiNWztT
	5OoLY/j05x3KoPyIwNourah2eOH8Z1SD52cvUrT1/SNit5O5B+tHBtS+3Q6EWznZTZtZ
	3V5g==
X-Received: by 10.194.235.230 with SMTP id up6mr69946434wjc.30.1388982569384; 
	Sun, 05 Jan 2014 20:29:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.108.74 with HTTP; Sun, 5 Jan 2014 20:29:09 -0800 (PST)
In-Reply-To: <52C6822D.7090707@redhat.com>
References: <1388464944-26911-1-git-send-email-keweihk@gmail.com>
	<52C5203F.1030408@redhat.com> <52C57BA5.101@suse.de>
	<52C6822D.7090707@redhat.com>
From: Kewei Yu <keweihk@gmail.com>
Date: Mon, 6 Jan 2014 12:29:09 +0800
Message-ID: <CAJBZ5eOQfAQ=iFQaY70OzzS6FFGHKuk8QXwkY10twN7G2ZW8cQ@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary=047d7bd915daa5bf3504ef45b4cf
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22b
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v2 1/1] qtest: Fix the bug about
 disabling vnc causes "make check" hang
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
X-List-Received-Date: Mon, 06 Jan 2014 04:29:34 -0000

--047d7bd915daa5bf3504ef45b4cf
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2014/1/3 Paolo Bonzini <pbonzini@redhat.com>

> Il 02/01/2014 15:45, Andreas F=E4rber ha scritto:
> >>> >>  v2: Consolidate VNC macro's #ifdef'ery to one central point
> (tests/libqtest.c).
> >> >
> >> > What happens if qtest instead uses "-display none"?
> > It does use that, since the commit I pointed to in v1. :)
>
> And why do you need at all "-vnc none" if it also uses "-display none"?

Yeah, if "-display none", the vnc_display will be NULL in vl.c:4313, So the
vnc is not initialized.
So, the "-vnc none" is excrescent.

>
> Paolo
>
Kewei

--047d7bd915daa5bf3504ef45b4cf
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
2014/1/3 Paolo Bonzini <span dir=3D"ltr">&lt;<a href=3D"mailto:pbonzini@red=
hat.com" target=3D"_blank">pbonzini@redhat.com</a>&gt;</span><br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-lef=
t:1ex">


Il 02/01/2014 15:45, Andreas F=E4rber ha scritto:<br>
<div>&gt;&gt;&gt; &gt;&gt; =A0v2: Consolidate VNC macro&#39;s #ifdef&#39;er=
y to one central point (tests/libqtest.c).<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; What happens if qtest instead uses &quot;-display none&quot;?=
<br>
&gt; It does use that, since the commit I pointed to in v1. :)<br>
<br>
</div>And why do you need at all &quot;-vnc none&quot; if it also uses &quo=
t;-display none&quot;?</blockquote><div>Yeah, if &quot;-display none&quot;,=
 the vnc_display will be NULL in vl.c:4313, So the vnc is not initialized.<=
/div>


<div>So, the &quot;-vnc none&quot; is excrescent.</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><sp=
an><font color=3D"#888888"><br>



Paolo<br></font></span></blockquote><div>Kewei=A0</div></div><br></div></di=
v>

--047d7bd915daa5bf3504ef45b4cf--

