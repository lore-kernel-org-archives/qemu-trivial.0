Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c3p6b-0005tp-Hw
	for mharc-qemu-trivial@gnu.org; Mon, 07 Nov 2016 13:57:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1c3p6Y-0005p8-Ke
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2016 13:57:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1c3p6X-0006SF-Kt
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2016 13:57:14 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:35553)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1c3p6R-0006QR-5p; Mon, 07 Nov 2016 13:57:07 -0500
Received: by mail-lf0-x242.google.com with SMTP id p100so9623476lfg.2;
	Mon, 07 Nov 2016 10:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=I2l3Axn+8slszS80Y0OtSO80nZEhV7FlbjlNBz9tqqk=;
	b=wsKWVEH9MneE7+K91qNG+MVn+EO3uZcOV0lDYyFlQtvuTsbYTu3niOMr8hI4oITgE/
	ams6K2wnahpNuO+kEfQn0l3mzyqFHJaOVRR/KqVOjyXrYMEyZ88SMZPkwg/PoNx3gSYL
	Cl4mqklbOIUQijpVH2IgssD5iM0DRa2/eex35BFSUoj0kcrAY71HvtqSd6370s8o1bsC
	bUd/6tJsrveQOAYwCop6SXMnHXx8Godes7vcNRGfX4OqCLo9eX+Nlj0deH3Ln/Ybe5da
	4jLA80qcPttfmvY5BjUouNiA50pZMdfRDBWp1MqRcG30EKJfQsxWgKCCt6yXOXJAxGR1
	WioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=I2l3Axn+8slszS80Y0OtSO80nZEhV7FlbjlNBz9tqqk=;
	b=EDoLMaJvDjg27OJh8q5coR8E1fv5lHZS/GmDnOEjZfbM0dbUhiyH/vI72ISmyKkO29
	MHlIi4qmg3xcfpWRhoNupiwhS4OaU1SK1utF3XAdx9wAJqFQ6GrIhcFMy9GOa5z5Y5Ym
	0ft/ubuXwI18NBamUiZr6+ttn6Lgq/OWRVcZdMnRfuD7IFYEZrMFLpEKwwfPQs9m7ZiK
	LQpMXfvrBhQaAe6fxgobpIyLlZBldg7VBsk5XnLRvnq8ZbGX86PjGC4cfaMAWf6+ileT
	uwc/Trtm5R3+zJ0SgxROE6IsO5BGe/nh62kUUcMA5vWDUj32CfRbqo+sEJ/AQXay97o5
	Cd4g==
X-Gm-Message-State: ABUngvdhp9hYAm3KxvTASkZT54WVPdlTlQKxhIYCErQ8kurQjIFMTXmTzNSyQU36xJFgpdfKo2hG8tKe40WynQ==
X-Received: by 10.25.28.77 with SMTP id c74mr364448lfc.107.1478545025429; Mon,
	07 Nov 2016 10:57:05 -0800 (PST)
MIME-Version: 1.0
References: <1478494765-13233-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
	<CAJ+F1CJxcgTOroM3Oy=bSLP0PrxS=uBBD3k8iZnvZ2riJsqRJg@mail.gmail.com>
	<b701e086-c769-8055-1943-0a2b3e0bbf31@redhat.com>
In-Reply-To: <b701e086-c769-8055-1943-0a2b3e0bbf31@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 07 Nov 2016 18:56:54 +0000
Message-ID: <CAJ+F1CKVd2VMYDKg4EfCro+QYyGQmD6Gezq3R58_qnQMqtA1wQ@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>, Changlong Xie <xiecl.fnst@cn.fujitsu.com>, 
	qemu devel <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>
Content-Type: multipart/alternative; boundary=001a11401c9a067c890540ba9755
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests/.gitignore: Ignore
 test-char
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
X-List-Received-Date: Mon, 07 Nov 2016 18:57:16 -0000

--001a11401c9a067c890540ba9755
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 7, 2016 at 8:17 PM Eric Blake <eblake@redhat.com> wrote:

> On 11/07/2016 05:01 AM, Marc-Andr=C3=A9 Lureau wrote:
> > On Mon, Nov 7, 2016 at 8:52 AM Changlong Xie <xiecl.fnst@cn.fujitsu.com=
>
> > wrote:
> >
> >> Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
> >>
> >
> > Introduced in commit  ea3af47d7
> >
> > Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Marc-Andr=C3=A9, do you still want to pursue your patch that auto-generat=
ed
> tests/.gitignore, so we don't have to keep doing these cleanups?
>
>
I am sporadically working on it (and a version for the whole qemu tree). I
was waiting for some feedback from Paolo. Anyway, I think this is best left
for after 2.8.

--
> Eric Blake   eblake redhat com    +1-919-301-3266 <+1%20919-301-3266>
> Libvirt virtualization library http://libvirt.org
>
> --
Marc-Andr=C3=A9 Lureau

--001a11401c9a067c890540ba9755
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon=
, Nov 7, 2016 at 8:17 PM Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com=
">eblake@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
On 11/07/2016 05:01 AM, Marc-Andr=C3=A9 Lureau wrote:<br class=3D"gmail_msg=
">
&gt; On Mon, Nov 7, 2016 at 8:52 AM Changlong Xie &lt;<a href=3D"mailto:xie=
cl.fnst@cn.fujitsu.com" class=3D"gmail_msg" target=3D"_blank">xiecl.fnst@cn=
.fujitsu.com</a>&gt;<br class=3D"gmail_msg">
&gt; wrote:<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt;&gt; Signed-off-by: Changlong Xie &lt;<a href=3D"mailto:xiecl.fnst@cn.f=
ujitsu.com" class=3D"gmail_msg" target=3D"_blank">xiecl.fnst@cn.fujitsu.com=
</a>&gt;<br class=3D"gmail_msg">
&gt;&gt;<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; Introduced in commit=C2=A0 ea3af47d7<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com" class=3D"gmail_msg" target=3D"_blank">marcandre.lureau@red=
hat.com</a>&gt;<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Marc-Andr=C3=A9, do you still want to pursue your patch that auto-generated=
<br class=3D"gmail_msg">
tests/.gitignore, so we don&#39;t have to keep doing these cleanups?<br cla=
ss=3D"gmail_msg">
<br class=3D"gmail_msg"></blockquote><div><br></div><div>I am sporadically =
working on it (and a version for the whole qemu tree). I was waiting for so=
me feedback from Paolo. Anyway, I think this is best left for after 2.8.<br=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">
--<br class=3D"gmail_msg">
Eric Blake=C2=A0 =C2=A0eblake redhat com=C2=A0 =C2=A0 <a href=3D"tel:+1%209=
19-301-3266" value=3D"+19193013266" class=3D"gmail_msg" target=3D"_blank">+=
1-919-301-3266</a><br class=3D"gmail_msg">
Libvirt virtualization library <a href=3D"http://libvirt.org" rel=3D"norefe=
rrer" class=3D"gmail_msg" target=3D"_blank">http://libvirt.org</a><br class=
=3D"gmail_msg">
<br class=3D"gmail_msg">
</blockquote></div></div><div dir=3D"ltr">-- <br></div><div data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div></div=
>

--001a11401c9a067c890540ba9755--

