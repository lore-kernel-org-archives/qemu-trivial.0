Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8XoM-00026u-E5
	for mharc-qemu-trivial@gnu.org; Mon, 25 Mar 2019 18:11:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h8XoJ-0001jo-Il
	for qemu-trivial@nongnu.org; Mon, 25 Mar 2019 18:11:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h8Xah-0000gy-VE
	for qemu-trivial@nongnu.org; Mon, 25 Mar 2019 17:57:13 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:35941)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h8Xag-0000fB-99; Mon, 25 Mar 2019 17:57:10 -0400
Received: by mail-yw1-f66.google.com with SMTP id u197so8285241ywf.3;
	Mon, 25 Mar 2019 14:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iaZFI3GHsDSxoiiBJzMNOnmfBDCCAsGky3XY0/LEZC0=;
	b=Iq+jmtA86HsYz8H++I/k9HSnOwvwwHglKskAj3iMS8NF4kZjAXNJwbr6Wr7yBBw5Nw
	3fV3cZE37y/rktaFR1Wejyr6uPyyAFv8KzxoVDm5in92IrKP0f6k1wvOrTSQkuMNX8Fn
	had1u3C0cUZFwvxLPu1jaLfzVfb2xUrvWJUXCaGnikyz0SQ96RQF+hBhNcUGqMYnc28O
	lGlyWoEIM4m8KH4W1jJ80wtvcsaJivWpkuLtYJmznm19V5625pZIWcnssPd0ENquPGUD
	D2or+m2nemXlzaiquMF6zxtTaC1JCr97Uk1ou9ZYkRMGCYssz2JFbzizmXB8NU/rHVfk
	THEQ==
X-Gm-Message-State: APjAAAXKhwkq2ERCPGsXNtM5Xw9h7oB6nCQuLZ0FoGgwaaniiYAYSsrm
	kYscu/iOeU0DUOra/myk3VxzMQpqges/hUDdjqQ=
X-Google-Smtp-Source: APXvYqzBF0izJsI3CiIiVpwrDOUjGnduCqenSFve5wa7bstSJzSitL5zq/2dXqhKrk29BQ+pYnGBQ37jFZ6yfo4voAQ=
X-Received: by 2002:a25:bb85:: with SMTP id y5mr21889356ybg.406.1553551029271; 
	Mon, 25 Mar 2019 14:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190321094012.36541-1-sgarzare@redhat.com>
	<7c89c032-7160-32d6-90ad-f5dafbdb211d@redhat.com>
In-Reply-To: <7c89c032-7160-32d6-90ad-f5dafbdb211d@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 25 Mar 2019 22:56:57 +0100
Message-ID: <CAAdtpL75dz-2ZSBJWwN_HA28-p8GxuV_HqRC7_QYaQp-yzRSpw@mail.gmail.com>
To: John Snow <jsnow@redhat.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org, 
	qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003d84ae0584f249bb"
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
X-List-Received-Date: Mon, 25 Mar 2019 22:11:17 -0000

--0000000000003d84ae0584f249bb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 25 mars 2019 21:53, John Snow <jsnow@redhat.com> a =C3=A9crit :

>
>
> On 3/21/19 5:40 AM, Stefano Garzarella wrote:
> > IEC binary prefixes are defined in "qemu/units.h", so we
> > can remove redundant definitions in "block/vhdx.h".
> >
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > ---
> >  block/vhdx-log.c | 1 +
> >  block/vhdx.c     | 4 +++-
> >  block/vhdx.h     | 5 -----
> >  3 files changed, 4 insertions(+), 6 deletions(-)
> >
> > diff --git a/block/vhdx-log.c b/block/vhdx-log.c
> > index 3149ff08d8..ad9905eb6d 100644
> > --- a/block/vhdx-log.c
> > +++ b/block/vhdx-log.c
> > @@ -18,6 +18,7 @@
> >   *
> >   */
> >  #include "qemu/osdep.h"
> > +#include "qemu/units.h"
> >  #include "qapi/error.h"
> >  #include "qemu-common.h"
> >  #include "block/block_int.h"
> > diff --git a/block/vhdx.c b/block/vhdx.c
> > index b785aef4b7..e9b16c5ef6 100644
> > --- a/block/vhdx.c
> > +++ b/block/vhdx.c
> > @@ -16,6 +16,7 @@
> >   */
> >
> >  #include "qemu/osdep.h"
> > +#include "qemu/units.h"
> >  #include "qapi/error.h"
> >  #include "block/block_int.h"
> >  #include "block/qdict.h"
> > @@ -1889,7 +1890,8 @@ static int coroutine_fn
> vhdx_co_create(BlockdevCreateOptions *opts,
> >          return -EINVAL;
> >      }
> >      if (block_size > VHDX_BLOCK_SIZE_MAX) {
> > -        error_setg(errp, "Block size must not exceed %d",
> VHDX_BLOCK_SIZE_MAX);
> > +        error_setg(errp, "Block size must not exceed %" PRId64,
> > +                   VHDX_BLOCK_SIZE_MAX);
>
> Oh, changing the constants changes the inferred type of this constant,
> correct?
>

Yes.


> >          return -EINVAL;
> >      }
> >
> > diff --git a/block/vhdx.h b/block/vhdx.h
> > index 1bfb4e4f73..deb6e362ad 100644
> > --- a/block/vhdx.h
> > +++ b/block/vhdx.h
> > @@ -18,11 +18,6 @@
> >  #ifndef BLOCK_VHDX_H
> >  #define BLOCK_VHDX_H
> >
> > -#define KiB              (1 * 1024)
> > -#define MiB            (KiB * 1024)
> > -#define GiB            (MiB * 1024)
> > -#define TiB ((uint64_t) GiB * 1024)
> > -
>
> I'd include units.h here because there are other references to
> KiB/MiB/GiB and so on throughout the rest of this header file.
>
> I think it's bad form to have a header that cannot be included unless
> you include other headers manually alongside it.
>

Agreed.


> >  #define DEFAULT_LOG_SIZE 1048576 /* 1MiB */
>

Can we also update this definition?

>  /* Structures and fields present in the VHDX file */
> >
> >
>
>
>

--0000000000003d84ae0584f249bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">Le l=
un. 25 mars 2019 21:53, John Snow &lt;<a href=3D"mailto:jsnow@redhat.com">j=
snow@redhat.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><br>
<br>
On 3/21/19 5:40 AM, Stefano Garzarella wrote:<br>
&gt; IEC binary prefixes are defined in &quot;qemu/units.h&quot;, so we<br>
&gt; can remove redundant definitions in &quot;block/vhdx.h&quot;.<br>
&gt; <br>
&gt; Signed-off-by: Stefano Garzarella &lt;<a href=3D"mailto:sgarzare@redha=
t.com" target=3D"_blank" rel=3D"noreferrer">sgarzare@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 block/vhdx-log.c | 1 +<br>
&gt;=C2=A0 block/vhdx.c=C2=A0 =C2=A0 =C2=A0| 4 +++-<br>
&gt;=C2=A0 block/vhdx.h=C2=A0 =C2=A0 =C2=A0| 5 -----<br>
&gt;=C2=A0 3 files changed, 4 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/block/vhdx-log.c b/block/vhdx-log.c<br>
&gt; index 3149ff08d8..ad9905eb6d 100644<br>
&gt; --- a/block/vhdx-log.c<br>
&gt; +++ b/block/vhdx-log.c<br>
&gt; @@ -18,6 +18,7 @@<br>
&gt;=C2=A0 =C2=A0*<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qemu/units.h&quot;<br>
&gt;=C2=A0 #include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu-common.h&quot;<br>
&gt;=C2=A0 #include &quot;block/block_int.h&quot;<br>
&gt; diff --git a/block/vhdx.c b/block/vhdx.c<br>
&gt; index b785aef4b7..e9b16c5ef6 100644<br>
&gt; --- a/block/vhdx.c<br>
&gt; +++ b/block/vhdx.c<br>
&gt; @@ -16,6 +16,7 @@<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qemu/units.h&quot;<br>
&gt;=C2=A0 #include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 #include &quot;block/block_int.h&quot;<br>
&gt;=C2=A0 #include &quot;block/qdict.h&quot;<br>
&gt; @@ -1889,7 +1890,8 @@ static int coroutine_fn vhdx_co_create(BlockdevC=
reateOptions *opts,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (block_size &gt; VHDX_BLOCK_SIZE_MAX) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Block size must no=
t exceed %d&quot;, VHDX_BLOCK_SIZE_MAX);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Block size must no=
t exceed %&quot; PRId64,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
VHDX_BLOCK_SIZE_MAX);<br>
<br>
Oh, changing the constants changes the inferred type of this constant,<br>
correct?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Yes.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; diff --git a/block/vhdx.h b/block/vhdx.h<br>
&gt; index 1bfb4e4f73..deb6e362ad 100644<br>
&gt; --- a/block/vhdx.h<br>
&gt; +++ b/block/vhdx.h<br>
&gt; @@ -18,11 +18,6 @@<br>
&gt;=C2=A0 #ifndef BLOCK_VHDX_H<br>
&gt;=C2=A0 #define BLOCK_VHDX_H<br>
&gt;=C2=A0 <br>
&gt; -#define KiB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 * 1024=
)<br>
&gt; -#define MiB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (KiB * 1024)<br>
&gt; -#define GiB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (MiB * 1024)<br>
&gt; -#define TiB ((uint64_t) GiB * 1024)<br>
&gt; -<br>
<br>
I&#39;d include units.h here because there are other references to<br>
KiB/MiB/GiB and so on throughout the rest of this header file.<br>
<br>
I think it&#39;s bad form to have a header that cannot be included unless<b=
r>
you include other headers manually alongside it.<br></blockquote></div></di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Agreed.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
<br>
&gt;=C2=A0 #define DEFAULT_LOG_SIZE 1048576 /* 1MiB */<br></blockquote></di=
v></div><div dir=3D"auto"><br></div><div dir=3D"auto">Can we also update th=
is definition?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt;=C2=A0 /* Structures and fields present in the VHDX file */<br>
&gt;=C2=A0 <br>
&gt; <br>
<br>
<br>
</blockquote></div></div></div>

--0000000000003d84ae0584f249bb--

