Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8iTk-0006ZS-Kp
	for mharc-qemu-trivial@gnu.org; Tue, 26 Mar 2019 05:34:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h8iTi-0006Y7-G1
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2019 05:34:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h8iTh-0004TH-00
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2019 05:34:42 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:44768)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h8iTd-0004Qh-7R; Tue, 26 Mar 2019 05:34:37 -0400
Received: by mail-yw1-f66.google.com with SMTP id c4so9227130ywa.11;
	Tue, 26 Mar 2019 02:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iqCGO/Cp/6TNO0anG9AdT9GoSgYoBUjPTffQE4Q/K9Y=;
	b=M4bQvA9iaSdiL6dcDHtR4C7MqXyvzP2J/53T+VIHnV3dpH4ar0hGYu+URWGFu8izD0
	p6+gYiY7TtYCwwGyx1UE0clOAj54TCxYGANNM9rL9VzLC5VGn8QkO2VRpK7kH8cRBVtX
	QhWgkEALpqIBctnKatJ282p7c+Z8Hmj7AD3XyJF+rPAM1DF11Uejto9oDLJCeNrSpVVx
	DhCmEZp3SXoc1Rj9TMefOJgH5jL51ht0zlDzJ/6hsWmMYr+mFse91zIPY6ecCvPlZDWW
	wr+Jd4jjCq4Ucbcee71Z8cFAET68ocWBVjA8gPZYukwN3kvDua+G1YF8op6FVWnqTBBP
	1fEw==
X-Gm-Message-State: APjAAAVzSKQ+4wGJopKj5pujpo+i870Fxv6A7okT+6zvo71FjhS7DO7j
	Qs1wnZr2Mt5+8jSIw7g7GSDFTgJooS4C3Rj4WJQ=
X-Google-Smtp-Source: APXvYqziQj9PCsxcNHtEcHqytMKK2ObQVbXeg6RLx9gKCTI1ubzzjBaNlqS6MZGLZNdChFdQZRPtrJovMRXc1Zrkf+E=
X-Received: by 2002:a25:388:: with SMTP id 130mr23207757ybd.128.1553592876288; 
	Tue, 26 Mar 2019 02:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190321094012.36541-1-sgarzare@redhat.com>
	<7c89c032-7160-32d6-90ad-f5dafbdb211d@redhat.com>
	<CAAdtpL75dz-2ZSBJWwN_HA28-p8GxuV_HqRC7_QYaQp-yzRSpw@mail.gmail.com>
	<20190326075524.qvlakskoee3phywp@steredhat>
	<20190326091354.GC7075@localhost.localdomain>
In-Reply-To: <20190326091354.GC7075@localhost.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 26 Mar 2019 10:34:25 +0100
Message-ID: <CAAdtpL7kJfUaR-RjrEycbZ+yH_2PDuA28hdhfrJqXJjxOtGDug@mail.gmail.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, John Snow <jsnow@redhat.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-trivial@nongnu.org, qemu-block@nongnu.org, 
	Max Reitz <mreitz@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000084514e0584fc07f1"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-block] [PATCH] block/vhdx:
 Use IEC binary prefixes from "qemu/units.h"
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
X-List-Received-Date: Tue, 26 Mar 2019 09:34:44 -0000

--00000000000084514e0584fc07f1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 26 mars 2019 10:14, Kevin Wolf <kwolf@redhat.com> a =C3=A9crit :

> Am 26.03.2019 um 08:55 hat Stefano Garzarella geschrieben:
> > On Mon, Mar 25, 2019 at 10:56:57PM +0100, Philippe Mathieu-Daud=C3=A9 w=
rote:
> > > Le lun. 25 mars 2019 21:53, John Snow <jsnow@redhat.com> a =C3=A9crit=
 :
> > > > On 3/21/19 5:40 AM, Stefano Garzarella wrote:
> > > > > IEC binary prefixes are defined in "qemu/units.h", so we
> > > > > can remove redundant definitions in "block/vhdx.h".
> > > > >
> > > > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > > > ---
> > > > >  block/vhdx-log.c | 1 +
> > > > >  block/vhdx.c     | 4 +++-
> > > > >  block/vhdx.h     | 5 -----
> > > > >  3 files changed, 4 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git a/block/vhdx-log.c b/block/vhdx-log.c
> > > > > index 3149ff08d8..ad9905eb6d 100644
> > > > > --- a/block/vhdx-log.c
> > > > > +++ b/block/vhdx-log.c
> > > > > @@ -18,6 +18,7 @@
> > > > >   *
> > > > >   */
> > > > >  #include "qemu/osdep.h"
> > > > > +#include "qemu/units.h"
> > > > >  #include "qapi/error.h"
> > > > >  #include "qemu-common.h"
> > > > >  #include "block/block_int.h"
> > > > > diff --git a/block/vhdx.c b/block/vhdx.c
> > > > > index b785aef4b7..e9b16c5ef6 100644
> > > > > --- a/block/vhdx.c
> > > > > +++ b/block/vhdx.c
> > > > > @@ -16,6 +16,7 @@
> > > > >   */
> > > > >
> > > > >  #include "qemu/osdep.h"
> > > > > +#include "qemu/units.h"
> > > > >  #include "qapi/error.h"
> > > > >  #include "block/block_int.h"
> > > > >  #include "block/qdict.h"
> > > > > @@ -1889,7 +1890,8 @@ static int coroutine_fn
> > > > vhdx_co_create(BlockdevCreateOptions *opts,
> > > > >          return -EINVAL;
> > > > >      }
> > > > >      if (block_size > VHDX_BLOCK_SIZE_MAX) {
> > > > > -        error_setg(errp, "Block size must not exceed %d",
> > > > VHDX_BLOCK_SIZE_MAX);
> > > > > +        error_setg(errp, "Block size must not exceed %" PRId64,
> > > > > +                   VHDX_BLOCK_SIZE_MAX);
> > > >
> > > > Oh, changing the constants changes the inferred type of this
> constant,
> > > > correct?
> > > >
> > >
> >
> > Yes, in "units.h" all the constants are int64_t.
> >
> > > Yes.
> > >
> > >
> > > > >          return -EINVAL;
> > > > >      }
> > > > >
> > > > > diff --git a/block/vhdx.h b/block/vhdx.h
> > > > > index 1bfb4e4f73..deb6e362ad 100644
> > > > > --- a/block/vhdx.h
> > > > > +++ b/block/vhdx.h
> > > > > @@ -18,11 +18,6 @@
> > > > >  #ifndef BLOCK_VHDX_H
> > > > >  #define BLOCK_VHDX_H
> > > > >
> > > > > -#define KiB              (1 * 1024)
> > > > > -#define MiB            (KiB * 1024)
> > > > > -#define GiB            (MiB * 1024)
> > > > > -#define TiB ((uint64_t) GiB * 1024)
> > > > > -
> > > >
> > > > I'd include units.h here because there are other references to
> > > > KiB/MiB/GiB and so on throughout the rest of this header file.
> > > >
> > > > I think it's bad form to have a header that cannot be included unle=
ss
> > > > you include other headers manually alongside it.
> > > >
> > >
> > > Agreed.
> >
> > Okay, I'll include units.h here.
> >
> > >
> > >
> > > > >  #define DEFAULT_LOG_SIZE 1048576 /* 1MiB */
> > > >
> > >
> > > Can we also update this definition?
> > >
> >
> > Sure, I'll update it in v2.
>
> This is used in vhdx_create_opts:
>
>     .def_value_str =3D stringify(DEFAULT_LOG_SIZE),
>
> You want the default size to be a number, not an expression, so you'd
> have to change the default string to retain the number. Probably better
> to just leave the #define alone.
>

Oops I guess remember we had the same discussion 1 year ago...


> We could, however, put a comment next to the define lik vdi.c has:
>
>     /* Note: can't use 1 * MiB, because it's passed to stringify() */
>
> Kevin
>

--00000000000084514e0584fc07f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">Le m=
ar. 26 mars 2019 10:14, Kevin Wolf &lt;<a href=3D"mailto:kwolf@redhat.com">=
kwolf@redhat.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">Am 26.03.2019 um 08:55 hat Stefano Garzarella geschrieben:<br>
&gt; On Mon, Mar 25, 2019 at 10:56:57PM +0100, Philippe Mathieu-Daud=C3=A9 =
wrote:<br>
&gt; &gt; Le lun. 25 mars 2019 21:53, John Snow &lt;<a href=3D"mailto:jsnow=
@redhat.com" target=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt; =
a =C3=A9crit :<br>
&gt; &gt; &gt; On 3/21/19 5:40 AM, Stefano Garzarella wrote:<br>
&gt; &gt; &gt; &gt; IEC binary prefixes are defined in &quot;qemu/units.h&q=
uot;, so we<br>
&gt; &gt; &gt; &gt; can remove redundant definitions in &quot;block/vhdx.h&=
quot;.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Stefano Garzarella &lt;<a href=3D"mailto=
:sgarzare@redhat.com" target=3D"_blank" rel=3D"noreferrer">sgarzare@redhat.=
com</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 block/vhdx-log.c | 1 +<br>
&gt; &gt; &gt; &gt;=C2=A0 block/vhdx.c=C2=A0 =C2=A0 =C2=A0| 4 +++-<br>
&gt; &gt; &gt; &gt;=C2=A0 block/vhdx.h=C2=A0 =C2=A0 =C2=A0| 5 -----<br>
&gt; &gt; &gt; &gt;=C2=A0 3 files changed, 4 insertions(+), 6 deletions(-)<=
br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/block/vhdx-log.c b/block/vhdx-log.c<br>
&gt; &gt; &gt; &gt; index 3149ff08d8..ad9905eb6d 100644<br>
&gt; &gt; &gt; &gt; --- a/block/vhdx-log.c<br>
&gt; &gt; &gt; &gt; +++ b/block/vhdx-log.c<br>
&gt; &gt; &gt; &gt; @@ -18,6 +18,7 @@<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0*<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0*/<br>
&gt; &gt; &gt; &gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt; &gt; &gt; &gt; +#include &quot;qemu/units.h&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 #include &quot;qapi/error.h&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 #include &quot;qemu-common.h&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 #include &quot;block/block_int.h&quot;<br>
&gt; &gt; &gt; &gt; diff --git a/block/vhdx.c b/block/vhdx.c<br>
&gt; &gt; &gt; &gt; index b785aef4b7..e9b16c5ef6 100644<br>
&gt; &gt; &gt; &gt; --- a/block/vhdx.c<br>
&gt; &gt; &gt; &gt; +++ b/block/vhdx.c<br>
&gt; &gt; &gt; &gt; @@ -16,6 +16,7 @@<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0*/<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt; &gt; &gt; &gt; +#include &quot;qemu/units.h&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 #include &quot;qapi/error.h&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 #include &quot;block/block_int.h&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 #include &quot;block/qdict.h&quot;<br>
&gt; &gt; &gt; &gt; @@ -1889,7 +1890,8 @@ static int coroutine_fn<br>
&gt; &gt; &gt; vhdx_co_create(BlockdevCreateOptions *opts,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (block_size &gt; VHDX_BLOCK_SIZE=
_MAX) {<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Blo=
ck size must not exceed %d&quot;,<br>
&gt; &gt; &gt; VHDX_BLOCK_SIZE_MAX);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Blo=
ck size must not exceed %&quot; PRId64,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0VHDX_BLOCK_SIZE_MAX);<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Oh, changing the constants changes the inferred type of this=
 constant,<br>
&gt; &gt; &gt; correct?<br>
&gt; &gt; &gt;<br>
&gt; &gt; <br>
&gt; <br>
&gt; Yes, in &quot;units.h&quot; all the constants are int64_t.<br>
&gt; <br>
&gt; &gt; Yes.<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/block/vhdx.h b/block/vhdx.h<br>
&gt; &gt; &gt; &gt; index 1bfb4e4f73..deb6e362ad 100644<br>
&gt; &gt; &gt; &gt; --- a/block/vhdx.h<br>
&gt; &gt; &gt; &gt; +++ b/block/vhdx.h<br>
&gt; &gt; &gt; &gt; @@ -18,11 +18,6 @@<br>
&gt; &gt; &gt; &gt;=C2=A0 #ifndef BLOCK_VHDX_H<br>
&gt; &gt; &gt; &gt;=C2=A0 #define BLOCK_VHDX_H<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -#define KiB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (1 * 1024)<br>
&gt; &gt; &gt; &gt; -#define MiB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (=
KiB * 1024)<br>
&gt; &gt; &gt; &gt; -#define GiB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (=
MiB * 1024)<br>
&gt; &gt; &gt; &gt; -#define TiB ((uint64_t) GiB * 1024)<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;d include units.h here because there are other referen=
ces to<br>
&gt; &gt; &gt; KiB/MiB/GiB and so on throughout the rest of this header fil=
e.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I think it&#39;s bad form to have a header that cannot be in=
cluded unless<br>
&gt; &gt; &gt; you include other headers manually alongside it.<br>
&gt; &gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt; Agreed.<br>
&gt; <br>
&gt; Okay, I&#39;ll include units.h here.<br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt;=C2=A0 #define DEFAULT_LOG_SIZE 1048576 /* 1MiB */<br>
&gt; &gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt; Can we also update this definition?<br>
&gt; &gt; <br>
&gt; <br>
&gt; Sure, I&#39;ll update it in v2.<br>
<br>
This is used in vhdx_create_opts:<br>
<br>
=C2=A0 =C2=A0 .def_value_str =3D stringify(DEFAULT_LOG_SIZE),<br>
<br>
You want the default size to be a number, not an expression, so you&#39;d<b=
r>
have to change the default string to retain the number. Probably better<br>
to just leave the #define alone.<br></blockquote></div></div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Oops I guess remember we had the same discu=
ssion 1 year ago...</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
We could, however, put a comment next to the define lik vdi.c has:<br>
<br>
=C2=A0 =C2=A0 /* Note: can&#39;t use 1 * MiB, because it&#39;s passed to st=
ringify() */<br>
<br>
Kevin<br>
</blockquote></div></div></div>

--00000000000084514e0584fc07f1--

