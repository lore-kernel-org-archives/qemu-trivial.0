Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hLfk1-00021a-Rl
	for mharc-qemu-trivial@gnu.org; Tue, 30 Apr 2019 23:17:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liboxuan@connect.hku.hk>) id 1hLfjx-00021I-HT
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2019 23:17:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liboxuan@connect.hku.hk>) id 1hLfju-0000Uf-Gy
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2019 23:17:01 -0400
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:35716)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liboxuan@connect.hku.hk>)
	id 1hLfju-0000Tr-3t
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2019 23:16:58 -0400
Received: by mail-yw1-xc43.google.com with SMTP id n188so4919756ywe.2
	for <qemu-trivial@nongnu.org>; Tue, 30 Apr 2019 20:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=connect-hku-hk.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1YqRuH2R8B5aXHMnRryW3QIvT3FJY0yab9JQob5LiBU=;
	b=Js5eez6OodSVmS3ImNbqBgC49NXCteVNfpjT61/UXaSGdNp+q3uEetG1MGMVH6aVcI
	0U8nfgxtFR3dvyzIkyyuDqdKxMT1vywF0hfsVo/rIquM3e9LM5umboxsBfM+AaFrZJFW
	VbMglOxm2jLCSZoARg+nZaI2k1Yoz5hXYM0rpQCkUTvo4qQMegY1pZYy92KQ0x8IAvSo
	s5WE5HW6jtfAk/P7ufUumF4hN1Sia1k1D7byfiVefskQHN1TMOELv/FLflIQnWzPgHmV
	Z7INKpnO8VSTEQLK0yK6o2IvTo4VL74g/ucmuT8dMirjGHYB5j1qGpSOIrHJ/DFyhv2i
	TlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1YqRuH2R8B5aXHMnRryW3QIvT3FJY0yab9JQob5LiBU=;
	b=qy2F2ckV1OzabsvSWiaMbA+oJ8sN/7DeTRPDnqhAjeUalHb9GsUE1SLmWXvX4tSY3W
	YSXd5cEVcT8SOAPTw4RTe/AiCqEBjU54Y+KBlL+ns5a6GpXon0suvuG6V/32XJ7cDaOY
	CESXMluCEqCueLSFGHYLHCsrE9fPyoUNslG2CrILGbK87axRsX3m1wX7usgGZZH5bMn1
	1Vx2sRT+WjgbKd7BvZa80VGKvFhv+kYw4MX4EJfJx8WKiqkGeTVh9EqVn7obi4xbbSj6
	0qbDC7Ydq9xekb0qFQUszkDQZcIVh4XWJm1VY7Po5FhTceVmgzqcu/n51y+BgqA+JIpF
	qmgg==
X-Gm-Message-State: APjAAAXhmL9Ul9O4fPI+lOgtH18UTRlD9oyl9XguZyKq5C/yp09yTtT3
	T2DP3eCWH7fPLyTE278WWreyuMsiZNkipo3F5nF3VQ==
X-Google-Smtp-Source: APXvYqxbXCJIWRxAGOF++ZxmMlrsJVzg/4zwRCmVsk1NGO9j4j9pPGtEhpylmXR1co2ZytMhVkzB6KBr8Lzr0Nlm724=
X-Received: by 2002:a25:c694:: with SMTP id k142mr18984969ybf.67.1556680616187;
	Tue, 30 Apr 2019 20:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190428110258.86681-1-liboxuan@connect.hku.hk>
	<a683a29f-ea7b-aaf9-258f-68f4ffcd9b96@redhat.com>
	<5fe13664-cabc-6fc9-7437-285cc1452944@redhat.com>
In-Reply-To: <5fe13664-cabc-6fc9-7437-285cc1452944@redhat.com>
From: "LI, BO XUAN" <liboxuan@connect.hku.hk>
Date: Wed, 1 May 2019 11:16:20 +0800
Message-ID: <CALM0=-msXgYqraKzKcxCZgH-+VM7=MUvGLRAjP_r2im_Oj2Spw@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000282cc00587caf35e"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::c43
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtio-mmio: Always compile
 debug prints
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
X-List-Received-Date: Wed, 01 May 2019 03:17:04 -0000

--000000000000282cc00587caf35e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eric and Phil,

Thanks for your reviews. I am looking into trace events and I'll send a
patch v2 soon.

Eric Blake <eblake@redhat.com> =E6=96=BC 2019=E5=B9=B44=E6=9C=8830=E6=97=A5=
=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8811:03=E5=AF=AB=E9=81=93=EF=BC=9A

> On 4/30/19 5:15 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Hi Li,
> >
> > On 4/28/19 1:02 PM, Boxuan Li wrote:
> >> Wrap printf calls inside debug macros (DPRINTF) in `if` statement, and
> >> change output to stderr as well. This will ensure that printf function
> >> will always compile and prevent bitrot of the format strings.
> >
> > There is an effort in QEMU to replace the obsolete DPRINTF() macros by
> > trace events (which prevent format strings bitroting).
>
> Trace events are even more powerful than conditional debugs (in that you
> can turn them on or off at runtime, instead of compile time). But
> incremental improvements are still better than nothing.


> >>
> >> diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> >> index 5807aa87fe..693b3c9eb4 100644
> >> --- a/hw/virtio/virtio-mmio.c
> >> +++ b/hw/virtio/virtio-mmio.c
> >> @@ -28,15 +28,14 @@
> >>  #include "hw/virtio/virtio-bus.h"
> >>  #include "qemu/error-report.h"
> >>
> >> -/* #define DEBUG_VIRTIO_MMIO */
> >> -
> >> -#ifdef DEBUG_VIRTIO_MMIO
>
The old code let a user pass CFLAGS=3D-DDEBUG_VIRTIO_MMIO to turn things on=
...
>
> >> -
> >> -#define DPRINTF(fmt, ...) \
> >> -do { printf("virtio_mmio: " fmt , ## __VA_ARGS__); } while (0)
> >> -#else
> >> -#define DPRINTF(fmt, ...) do {} while (0)
> >> -#endif
> >> +#define DEBUG_VIRTIO_MMIO 0
>
> ...the new code requires a source code edit. This can be considered a
> step backwards in developer friendliness.  Better might be:
>
> #ifdef DEBUG_VIRTIO_MMIO
> #define DEBUG_VIRTIO_MMIO_PRINT 1
> #else
> #define DEBUG_VIRTIO_MMIO_PRINT 0
> #endif
>
> >> +
> >> +#define DPRINTF(fmt, ...)                                            =
\
> >> +    do {                                                             =
\
> >> +        if (DEBUG_VIRTIO_MMIO) {                                     =
\
>
> and the corresponding use of DEBUG_VIRTIO_MMIO_PRINT here, so that you
> preserve the ability to do a command-line CFLAGS=3D-D override, rather
> than forcing a source code edit.
>
>
Got it. Actually, I learned from
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3Dc691320faa6, which is=
 used
as an example of Bitrot prevention part in
https://wiki.qemu.org/Contribute/BiteSizedTasks. Maybe the wiki page can be
updated.


> >> +            fprintf(stderr, "virtio_mmio: " fmt , ## __VA_ARGS__);   =
\
>
> No space before ,
>
> >> +        }                                                            =
\
> >> +    } while (0)
> >>
> >>  /* QOM macros */
> >>  /* virtio-mmio-bus */
> >>
> >
> >
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3226
> Virtualization:  qemu.org | libvirt.org
>
>
Best regards,
Boxuan Li

--000000000000282cc00587caf35e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Eric and Phil,</div><div><br></div><div>Thanks for=
 your reviews. I am looking into trace events and I&#39;ll send a patch v2 =
soon.</div><div><br></div><div>Eric Blake &lt;<a href=3D"mailto:eblake@redh=
at.com">eblake@redhat.com</a>&gt; =E6=96=BC 2019=E5=B9=B44=E6=9C=8830=E6=97=
=A5=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8811:03=E5=AF=AB=E9=81=93=EF=BC=9A<br=
></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 4/30/19 5:15 AM, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt; Hi Li,<br>
&gt; <br>
&gt; On 4/28/19 1:02 PM, Boxuan Li wrote:<br>
&gt;&gt; Wrap printf calls inside debug macros (DPRINTF) in `if` statement,=
 and<br>
&gt;&gt; change output to stderr as well. This will ensure that printf func=
tion<br>
&gt;&gt; will always compile and prevent bitrot of the format strings.<br>
&gt; <br>
&gt; There is an effort in QEMU to replace the obsolete DPRINTF() macros by=
<br>
&gt; trace events (which prevent format strings bitroting).<br>
<br>
Trace events are even more powerful than conditional debugs (in that you<br=
>
can turn them on or off at runtime, instead of compile time). But<br>
incremental improvements are still better than nothing.</blockquote><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c<br>
&gt;&gt; index 5807aa87fe..693b3c9eb4 100644<br>
&gt;&gt; --- a/hw/virtio/virtio-mmio.c<br>
&gt;&gt; +++ b/hw/virtio/virtio-mmio.c<br>
&gt;&gt; @@ -28,15 +28,14 @@<br>
&gt;&gt;=C2=A0 #include &quot;hw/virtio/virtio-bus.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;qemu/error-report.h&quot;<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; -/* #define DEBUG_VIRTIO_MMIO */<br>
&gt;&gt; -<br>
&gt;&gt; -#ifdef DEBUG_VIRTIO_MMIO=C2=A0<br></blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
The old code let a user pass CFLAGS=3D-DDEBUG_VIRTIO_MMIO to turn things on=
...<br>
<br>
&gt;&gt; -<br>
&gt;&gt; -#define DPRINTF(fmt, ...) \<br>
&gt;&gt; -do { printf(&quot;virtio_mmio: &quot; fmt , ## __VA_ARGS__); } wh=
ile (0)<br>
&gt;&gt; -#else<br>
&gt;&gt; -#define DPRINTF(fmt, ...) do {} while (0)<br>
&gt;&gt; -#endif<br>
&gt;&gt; +#define DEBUG_VIRTIO_MMIO 0<br>
<br>
...the new code requires a source code edit. This can be considered a<br>
step backwards in developer friendliness.=C2=A0 Better might be:<br>
<br>
#ifdef DEBUG_VIRTIO_MMIO<br>
#define DEBUG_VIRTIO_MMIO_PRINT 1<br>
#else<br>
#define DEBUG_VIRTIO_MMIO_PRINT 0<br>
#endif<br>
<br>
&gt;&gt; +<br>
&gt;&gt; +#define DPRINTF(fmt, ...)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +=C2=A0 =C2=A0 do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (DEBUG_VIRTIO_MMIO) {=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
<br>
and the corresponding use of DEBUG_VIRTIO_MMIO_PRINT here, so that you<br>
preserve the ability to do a command-line CFLAGS=3D-D override, rather<br>
than forcing a source code edit.<br>
<br></blockquote><div><br></div><div>Got it. Actually, I learned from=C2=A0=
<a href=3D"https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3Dc691320faa=
6">https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3Dc691320faa6</a>, w=
hich is used as an example of Bitrot prevention part in=C2=A0<a href=3D"htt=
ps://wiki.qemu.org/Contribute/BiteSizedTasks">https://wiki.qemu.org/Contrib=
ute/BiteSizedTasks</a>. Maybe the wiki page can be updated.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;v=
irtio_mmio: &quot; fmt , ## __VA_ARGS__);=C2=A0 =C2=A0\<br>
<br>
No space before ,<br>
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +=C2=A0 =C2=A0 } while (0)<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 /* QOM macros */<br>
&gt;&gt;=C2=A0 /* virtio-mmio-bus */<br>
&gt;&gt;<br>
&gt; <br>
&gt; <br>
<br>
-- <br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1-919-301-3226<br>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer" target=
=3D"_blank">qemu.org</a> | <a href=3D"http://libvirt.org" rel=3D"noreferrer=
" target=3D"_blank">libvirt.org</a><br>
<br></blockquote><div><br></div><div>Best regards,</div><div>Boxuan Li=C2=
=A0</div></div></div>

--000000000000282cc00587caf35e--

