Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dJLy5-0003O1-C9
	for mharc-qemu-trivial@gnu.org; Fri, 09 Jun 2017 11:36:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dJLy2-0003Lv-JI
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 11:36:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dJLy1-0005lD-NC
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 11:36:54 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:33394)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1dJLxy-0005kF-Qt; Fri, 09 Jun 2017 11:36:51 -0400
Received: by mail-lf0-x242.google.com with SMTP id u62so5392631lfg.0;
	Fri, 09 Jun 2017 08:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eWgpp6FfQHAJdznnBQ4Y6kCUxTFs02RRmLFTjrUBcxo=;
	b=hkDbTktRPB9pxdr1XhYl20C+/SPxKXsbcEtk5O4Eu+KkffaIFgFwcC+FcObJVF1Rjn
	lbRYJitF2JDnY4U6urzH1U2Z760tm9qlbHiJc+MJUDFdZEkl5mpJBHq0EJUx7THCvbEX
	p17HGb5xwPnK1vQAkFz3sF6CmUk0dL5jHrj05+zxWloGwjSjoczQKdSZKaeIPhY96EO1
	Rz5aiLKO/1AcpV4Eh1Rpcz5Y2T5oqa1bNrZaJT8r+aNQLV4t7M54W5SEREi8zJiFSlTs
	jP5snjR9/sFxSyGLCZOiAQAxjnuU9K6Uk7mlkDEXlzA83gz7qOKN2e+otmA7lDbEsB8B
	g+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eWgpp6FfQHAJdznnBQ4Y6kCUxTFs02RRmLFTjrUBcxo=;
	b=UEIMleMn2hniYYA6tHS6mGZfJhnUboftGwH5bFrSE++Ueq0kkDoaL92qk6ci5WS5IP
	Le0pICXdlq+uYmW84CiTNZVFPFWG5WmVLKzZQYWGTwPuxVBfZ1ViB0M8b6S0D1mR5NIR
	wG39RCaAn/vS/3hdnqY+STRJ/8Z/6u4/qtDQYeM8cYhoQjJW/ElajcVl3/SgUtcqLZsn
	BDwZfPSDMCK8M0UxTb8a7UTbt8lhl3wmvuiAWjkvQ9DPU5aLLn9nNj0ED1ibx9cfRTqS
	f6oqLmL7kBy+WZdG0wOFgTYhX3zTnKW0NbJYoTRsG9NY7xULqkom+VjD6M0stXQI0nqu
	KgFQ==
X-Gm-Message-State: AODbwcBOSjQ2DbsdBLgsDDCXY6BUa2sEt5KJPYNsOkHpzZRYg/HqbhHP
	FQqM/6O1JyYZu4swcmNN1v06CSYCAQ==
X-Received: by 10.46.69.214 with SMTP id s205mr5770954lja.136.1497022609383;
	Fri, 09 Jun 2017 08:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20170609152017.7286-1-eblake@redhat.com>
	<20170609152017.7286-2-eblake@redhat.com>
	<CAJ+F1CJL04MkrYmnhM3rLaSAuEXYo7JsZwyDLeXA35bV6dvqqA@mail.gmail.com>
	<b3e66ce9-d503-bf6f-cd93-511097418480@redhat.com>
In-Reply-To: <b3e66ce9-d503-bf6f-cd93-511097418480@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 09 Jun 2017 15:36:38 +0000
Message-ID: <CAJ+F1CJTTjU_yLXabC5MaVktbmz6drZ6AwusdvEy15XAu_f7yg@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Content-Type: multipart/alternative; boundary="001a114b0a26da65ba055188bc41"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] qobject: Update
 coccinelle script to catch Q{INC, DEC}REF
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
X-List-Received-Date: Fri, 09 Jun 2017 15:36:55 -0000

--001a114b0a26da65ba055188bc41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 9, 2017 at 7:33 PM Eric Blake <eblake@redhat.com> wrote:

> On 06/09/2017 10:28 AM, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Fri, Jun 9, 2017 at 7:20 PM Eric Blake <eblake@redhat.com> wrote:
> >
> >> A recent patch submission was about to use qobject_decref(QOBJECT(E)),
> >> even though we already have QDECREF(E) for that purpose.  While our
> >> tree is currently free from the longhand form, we might as well update
> >>
> >
> > Oh?
> >
> >  $ git grep 'object_unref(OBJECT('  | wc -l
> > 152
>
> Quit mixing QOM and QObject ;)
>
> $ git grep qobject_'..cref(QOBJECT'
> include/qapi/qmp/qobject.h:    qobject_incref(QOBJECT(obj))
> scripts/coccinelle/qobject.cocci:- qobject_incref(QOBJECT(E));
> scripts/coccinelle/qobject.cocci:- qobject_decref(QOBJECT(E));
>
>
>
Yeah, I got mixed by your comments, my patch doesn't do
qobject_decref(QOBJECT(E)) but object_unref(OBJECT(E)), which doesn't have
macro helper afaik.


> Yes, we may want to add a script to clean QOM abuses, but that's a
> different project for a different day.
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266 <+1%20919-301-3266>
> Virtualization:  qemu.org | libvirt.org
>
> --
Marc-Andr=C3=A9 Lureau

--001a114b0a26da65ba055188bc41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri=
, Jun 9, 2017 at 7:33 PM Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com=
">eblake@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
On 06/09/2017 10:28 AM, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt;<br>
&gt; On Fri, Jun 9, 2017 at 7:20 PM Eric Blake &lt;<a href=3D"mailto:eblake=
@redhat.com" target=3D"_blank">eblake@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; A recent patch submission was about to use qobject_decref(QOBJECT(=
E)),<br>
&gt;&gt; even though we already have QDECREF(E) for that purpose.=C2=A0 Whi=
le our<br>
&gt;&gt; tree is currently free from the longhand form, we might as well up=
date<br>
&gt;&gt;<br>
&gt;<br>
&gt; Oh?<br>
&gt;<br>
&gt;=C2=A0 $ git grep &#39;object_unref(OBJECT(&#39;=C2=A0 | wc -l<br>
&gt; 152<br>
<br>
Quit mixing QOM and QObject ;)<br>
<br>
$ git grep qobject_&#39;..cref(QOBJECT&#39;<br>
include/qapi/qmp/qobject.h:=C2=A0 =C2=A0 qobject_incref(QOBJECT(obj))<br>
scripts/coccinelle/qobject.cocci:- qobject_incref(QOBJECT(E));<br>
scripts/coccinelle/qobject.cocci:- qobject_decref(QOBJECT(E));<br><br><br><=
/blockquote><div>=C2=A0<br>Yeah, I got mixed by your comments, my patch doe=
sn&#39;t do qobject_decref(QOBJECT(E)) but object_unref(OBJECT(E)), which d=
oesn&#39;t have macro helper afaik.<br></div><div><br> </div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
<br>
Yes, we may want to add a script to clean QOM abuses, but that&#39;s a<br>
different project for a different day.<br>
<br>
--<br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"tel:+1%209=
19-301-3266" value=3D"+19193013266" target=3D"_blank">+1-919-301-3266</a><b=
r>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer" target=
=3D"_blank">qemu.org</a> | <a href=3D"http://libvirt.org" rel=3D"noreferrer=
" target=3D"_blank">libvirt.org</a><br>
<br>
</blockquote></div></div><div dir=3D"ltr">-- <br></div><div data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div></div=
>

--001a114b0a26da65ba055188bc41--

