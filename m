Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9F5z-0001Lc-4I
	for mharc-qemu-trivial@gnu.org; Wed, 27 Mar 2019 16:24:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h9F5w-0001F0-9j
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2019 16:24:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h9F5u-0005fv-Dg
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2019 16:24:20 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:43659)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h9F0v-0003Ct-0a; Wed, 27 Mar 2019 16:19:09 -0400
Received: by mail-yw1-f65.google.com with SMTP id j66so13502141ywc.10;
	Wed, 27 Mar 2019 13:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IiHm6pY0jtkCWKMxHQC4KPp0gVqBgtfasd1seac0u7s=;
	b=emLJ8FmHHMFS+O6+UGx8P5lwO8qk9Pft0Lbl1xcmPC8pvVZRhmkHGEaYyGBL3MgMhx
	5YZ0jIPuaCV8KI+lBZ4rIJgEIRilfIPsOO40TD5zVycJo8lxiG+uWJUnoFrvMqJ8Bc/G
	IacxPnvhUIuDc13isST4zPbqZQ64UvccMRKl+s3jzW9rx7utp2BW95w62FLFjcuhi1zx
	e3ozYPHLcva0zZ0X7soyp+UKPW0U+cN82FGsooKWfA+z/l9FiE4aSJ3Y0g/BUrNHFDLv
	/K9MBHF3yfqWaMCFPJAGV6+sMVUuwchjvaG0n+Yl7jsTg3KOYIgB4r1Gv0eJXPNXFvPC
	bN4Q==
X-Gm-Message-State: APjAAAVydtV5PXOABeDBkn6cCGG9E2MFAY0dbajqD63QfF90PvNLpwC+
	7WxlFzMZHhOjTeFTzRS3XATr0gl3cv3uZE/+WhE=
X-Google-Smtp-Source: APXvYqxo23J1NIOZtTP8vQ3BStgMncvEdOzb9NfV7J7t6HQw638qRFaulAUct7YViyeQI3X0kMSJuA6hjAZ58WmVyS8=
X-Received: by 2002:a81:5ec5:: with SMTP id
	s188mr22553982ywb.381.1553717944939; 
	Wed, 27 Mar 2019 13:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190327095634.53038-1-sgarzare@redhat.com>
	<20190327095634.53038-2-sgarzare@redhat.com>
	<517394f7-5a9e-2d3e-9f92-8dcd5c0363f6@redhat.com>
In-Reply-To: <517394f7-5a9e-2d3e-9f92-8dcd5c0363f6@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 27 Mar 2019 21:16:34 +0100
Message-ID: <CAAdtpL49voaLba555vxGvy+_83WXjhpHUjiAWvCG95nQopMiTg@mail.gmail.com>
To: John Snow <jsnow@redhat.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, 
	qemu-trivial@nongnu.org, Max Reitz <mreitz@redhat.com>, 
	Jeff Cody <codyprime@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000003079f40585192611"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.65
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 1/2] block/vhdx: Remove
 redundant IEC binary prefixes definition
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
X-List-Received-Date: Wed, 27 Mar 2019 20:24:21 -0000

--0000000000003079f40585192611
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 27 mars 2019 18:18, John Snow <jsnow@redhat.com> a =C3=A9crit :

>
>
> On 3/27/19 5:56 AM, Stefano Garzarella wrote:
> > IEC binary prefixes are already defined in "qemu/units.h",
> > so we can remove redundant definitions in "block/vhdx.h".
> >
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > ---
> >  block/vhdx.c | 3 ++-
> >  block/vhdx.h | 6 +-----
> >  2 files changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/block/vhdx.c b/block/vhdx.c
> > index b785aef4b7..7cd1fc3731 100644
> > --- a/block/vhdx.c
> > +++ b/block/vhdx.c
> > @@ -1889,7 +1889,8 @@ static int coroutine_fn
> vhdx_co_create(BlockdevCreateOptions *opts,
> >          return -EINVAL;
> >      }
> >      if (block_size > VHDX_BLOCK_SIZE_MAX) {
> > -        error_setg(errp, "Block size must not exceed %d",
> VHDX_BLOCK_SIZE_MAX);
> > +        error_setg(errp, "Block size must not exceed %" PRId64,
> > +                   VHDX_BLOCK_SIZE_MAX);
> >          return -EINVAL;
> >      }
> >
> > diff --git a/block/vhdx.h b/block/vhdx.h
> > index 1bfb4e4f73..bf72090c8f 100644
> > --- a/block/vhdx.h
> > +++ b/block/vhdx.h
> > @@ -17,11 +17,7 @@
> >
> >  #ifndef BLOCK_VHDX_H
> >  #define BLOCK_VHDX_H
> > -
> > -#define KiB              (1 * 1024)
> > -#define MiB            (KiB * 1024)
> > -#define GiB            (MiB * 1024)
> > -#define TiB ((uint64_t) GiB * 1024)
> > +#include "qemu/units.h"
> >
> >  #define DEFAULT_LOG_SIZE 1048576 /* 1MiB */
> >  /* Structures and fields present in the VHDX file */
> >
>
> Looks good. By the way, you may want to consider adding to your git
> config rules that put the .h file diff changes above the .c file.
>
> Look at qemu/scripts/git.orderfile
>
> (I know I'm one to talk, I still haven't set mine up...)
>

=3D)


> Reviewed-by: John Snow <jsnow@redhat.com>
>
>

--0000000000003079f40585192611
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
Le mer. 27 mars 2019 18:18, John Snow &lt;<a href=3D"mailto:jsnow@redhat.co=
m">jsnow@redhat.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
<br>
On 3/27/19 5:56 AM, Stefano Garzarella wrote:<br>
&gt; IEC binary prefixes are already defined in &quot;qemu/units.h&quot;,<b=
r>
&gt; so we can remove redundant definitions in &quot;block/vhdx.h&quot;.<br=
>
&gt; <br>
&gt; Signed-off-by: Stefano Garzarella &lt;<a href=3D"mailto:sgarzare@redha=
t.com" target=3D"_blank" rel=3D"noreferrer">sgarzare@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 block/vhdx.c | 3 ++-<br>
&gt;=C2=A0 block/vhdx.h | 6 +-----<br>
&gt;=C2=A0 2 files changed, 3 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/block/vhdx.c b/block/vhdx.c<br>
&gt; index b785aef4b7..7cd1fc3731 100644<br>
&gt; --- a/block/vhdx.c<br>
&gt; +++ b/block/vhdx.c<br>
&gt; @@ -1889,7 +1889,8 @@ static int coroutine_fn vhdx_co_create(BlockdevC=
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
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; diff --git a/block/vhdx.h b/block/vhdx.h<br>
&gt; index 1bfb4e4f73..bf72090c8f 100644<br>
&gt; --- a/block/vhdx.h<br>
&gt; +++ b/block/vhdx.h<br>
&gt; @@ -17,11 +17,7 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #ifndef BLOCK_VHDX_H<br>
&gt;=C2=A0 #define BLOCK_VHDX_H<br>
&gt; -<br>
&gt; -#define KiB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 * 1024=
)<br>
&gt; -#define MiB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (KiB * 1024)<br>
&gt; -#define GiB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (MiB * 1024)<br>
&gt; -#define TiB ((uint64_t) GiB * 1024)<br>
&gt; +#include &quot;qemu/units.h&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #define DEFAULT_LOG_SIZE 1048576 /* 1MiB */<br>
&gt;=C2=A0 /* Structures and fields present in the VHDX file */<br>
&gt; <br>
<br>
Looks good. By the way, you may want to consider adding to your git<br>
config rules that put the .h file diff changes above the .c file.<br>
<br>
Look at qemu/scripts/git.orderfile<br>
<br>
(I know I&#39;m one to talk, I still haven&#39;t set mine up...)<br></block=
quote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">=3D)</div><=
div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">
<br>
Reviewed-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_b=
lank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
<br>
</blockquote></div></div></div>

--0000000000003079f40585192611--

