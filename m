Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e06dz-0003t7-Co
	for mharc-qemu-trivial@gnu.org; Thu, 05 Oct 2017 09:56:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <malbarbo@gmail.com>) id 1e06dw-0003qs-S5
	for qemu-trivial@nongnu.org; Thu, 05 Oct 2017 09:56:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <malbarbo@gmail.com>) id 1e06dv-0004uk-JT
	for qemu-trivial@nongnu.org; Thu, 05 Oct 2017 09:56:52 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:33871)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <malbarbo@gmail.com>) id 1e06dv-0004t6-63
	for qemu-trivial@nongnu.org; Thu, 05 Oct 2017 09:56:51 -0400
Received: by mail-lf0-x242.google.com with SMTP id h80so5752513lfe.1
	for <qemu-trivial@nongnu.org>; Thu, 05 Oct 2017 06:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Pfg9GGO59nyAX28zSvOv/BGP5YNPFCo08H0u64MS11I=;
	b=H9UXJmNfEug1Vf1Wga32IgQRRRENDLaZAFrdrRIyFkfoqUlQ8XlCGK4n4mMZC2PYVq
	fkoj4/WUH5zPvxD7RGpKuP5N921c/PLrQuJRvMXd7+7MI+KZ6sHzmiN4Fg3egeG/+CMS
	SSEX5gAiVGHps74JtxZu6Xr+McV04zScfLDZJ6lbVBO12gcmN5QKJzAdLqdOZJQ4J7T1
	9DewdpeJ8zmK3ZQP+teK/Oy6QssfNK0eOh5tJxdkhCIuFb2WcAcsyiBqE1kKFXBV+EKh
	Pig3wgNSQswCZ8wJM6ts+5jEsahAUvhjvVaPVMtt76ljiuRdUq7K2wgaNrYDhJK3vzOv
	/iJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Pfg9GGO59nyAX28zSvOv/BGP5YNPFCo08H0u64MS11I=;
	b=bzZKyusMfLdpVPb9vqysiReqzRkZz3mAsXjE3Nku3bRAocFN7gmLtFdx2ZULQAcrIq
	O7028Quc+3O3cl14P/P2y2NSU9UBqKLjh27pmBnVILQlMYuM1GEoeEQCgj3y9ZuHDm8p
	K4pQZUsuYhBnoMMSslUBk9/DRQhcjaMHJgb0D+goiIYr/ao31otgEpUZ/ZgcW022Z+A0
	wnYxmcM7ZYOYg/E5s3QRKz8+kZRCLCUWT8+CC7lohe5J0mJzmA/PhKHkJRFFpK1jZWHW
	l6RUDYYr+vZGZzWGCVVZXPl5NdCzxggblmlKe/5mpCSKQYwONmawA+N0E2hKhkFcGjxO
	Tmig==
X-Gm-Message-State: AHPjjUh2uyL3F37U6z+Fvhs7o5ndPeBFU8rdVSDFvtXwrCfhqacd9ALO
	x+tWaSMShmH2jcb/VhXQqCr2S4sPtMpmA/ujfI8=
X-Google-Smtp-Source: AOwi7QBu9MwAU9MoJmiW/tgD0dokP5rpsNmnD1KGcpnziH4BhghpKIhVJLsVB5e2/XCZQqjJYMhvN3qBBwazfQ5v+ZM=
X-Received: by 10.46.75.18 with SMTP id y18mr11819763lja.113.1507211809700;
	Thu, 05 Oct 2017 06:56:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.40.193 with HTTP; Thu, 5 Oct 2017 06:56:48 -0700 (PDT)
In-Reply-To: <f9178990-3656-c2ec-b4d6-aae161b7959b@redhat.com>
References: <20171005110425.25522-1-malbarbo@gmail.com>
	<f9178990-3656-c2ec-b4d6-aae161b7959b@redhat.com>
From: Marco A L Barbosa <malbarbo@gmail.com>
Date: Thu, 5 Oct 2017 10:56:48 -0300
Message-ID: <CAHpsRN-t3iruAWYcH7D6_Eu0RcprbqzU52jkfWE2Rg0ncnvv7Q@mail.gmail.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="f403045ea76084c01d055acd181d"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-trivial] [PATCH] linux-user: Add RNDGETENTCNT ioctl
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
X-List-Received-Date: Thu, 05 Oct 2017 13:56:54 -0000

--f403045ea76084c01d055acd181d
Content-Type: text/plain; charset="UTF-8"

Ok, I sent another patch. Thanks.

On Thu, Oct 5, 2017 at 10:38 AM, Laurent Vivier <lvivier@redhat.com> wrote:

> On 05/10/2017 13:04, Marco A L Barbosa wrote:
> > I'm using qemu with this patch (and another one) to run android ndk
> > applications.
> >
> > Signed-off-by: Marco A L Barbosa <malbarbo@gmail.com>
> > ---
> >  linux-user/ioctls.h       | 2 ++
> >  linux-user/syscall.c      | 1 +
> >  linux-user/syscall_defs.h | 4 ++++
> >  3 files changed, 7 insertions(+)
> >
> > diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
> > index e6997ff230..18127288cc 100644
> > --- a/linux-user/ioctls.h
> > +++ b/linux-user/ioctls.h
> > @@ -173,6 +173,8 @@
> >    IOCTL(SIOCGSTAMP, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timeval)))
> >    IOCTL(SIOCGSTAMPNS, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timespec)))
> >
> > +  IOCTL(RNDGETENTCNT, IOC_R, MK_PTR(TYPE_INT))
> > +
> >    IOCTL(CDROMPAUSE, 0, TYPE_NULL)
> >    IOCTL(CDROMSTART, 0, TYPE_NULL)
> >    IOCTL(CDROMSTOP, 0, TYPE_NULL)
> > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> > index 9b6364a266..d4c21a557c 100644
> > --- a/linux-user/syscall.c
> > +++ b/linux-user/syscall.c
> > @@ -59,6 +59,7 @@ int __clone2(int (*fn)(void *), void *child_stack_base,
> >  #include <linux/icmp.h>
> >  #include <linux/icmpv6.h>
> >  #include <linux/errqueue.h>
> > +#include <linux/random.h>
> >  #include "qemu-common.h"
> >  #ifdef CONFIG_TIMERFD
> >  #include <sys/timerfd.h>
> > diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> > index 40c5027e93..2b27786dae 100644
> > --- a/linux-user/syscall_defs.h
> > +++ b/linux-user/syscall_defs.h
> > @@ -1060,6 +1060,10 @@ struct target_pollfd {
> >
> >  #define TARGET_SIOCGIWNAME     0x8B01          /* get name == wireless
> protocol */
> >
> > +/* From <linux/random.h> */
> > +
> > +#define TARGET_RNDGETENTCNT    TARGET_IOR('R', 0x00, int)
> > +
> >  /* From <linux/fs.h> */
> >
> >  #define TARGET_BLKROSET   TARGET_IO(0x12,93) /* set device read-only (0
> = read-write) */
> >
>
> It would be better to keep RNDADDTOENTCNT, RNDZAPENTCNT and RNDCLEARPOOL
> as the changes are trivial too.
>
> Anyway:
>
> Reviewed-by: Laurent Vivier <lvivier@redhat.com>
>
>


-- 
Marco A L Barbosa
http://malbarbo.pro.br
--

--f403045ea76084c01d055acd181d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok, I sent another patch. Thanks.<br></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On Thu, Oct 5, 2017 at 10:38 AM,=
 Laurent Vivier <span dir=3D"ltr">&lt;<a href=3D"mailto:lvivier@redhat.com"=
 target=3D"_blank">lvivier@redhat.com</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On 05/10/2017 13=
:04, Marco A L Barbosa wrote:<br>
&gt; I&#39;m using qemu with this patch (and another one) to run android nd=
k<br>
&gt; applications.<br>
&gt;<br>
&gt; Signed-off-by: Marco A L Barbosa &lt;<a href=3D"mailto:malbarbo@gmail.=
com">malbarbo@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 linux-user/ioctls.h=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
&gt;=C2=A0 linux-user/syscall.c=C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 linux-user/syscall_defs.h | 4 ++++<br>
&gt;=C2=A0 3 files changed, 7 insertions(+)<br>
&gt;<br>
&gt; diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h<br>
&gt; index e6997ff230..18127288cc 100644<br>
&gt; --- a/linux-user/ioctls.h<br>
&gt; +++ b/linux-user/ioctls.h<br>
&gt; @@ -173,6 +173,8 @@<br>
&gt;=C2=A0 =C2=A0 IOCTL(SIOCGSTAMP, IOC_R, MK_PTR(MK_STRUCT(STRUCT_<wbr>tim=
eval)))<br>
&gt;=C2=A0 =C2=A0 IOCTL(SIOCGSTAMPNS, IOC_R, MK_PTR(MK_STRUCT(STRUCT_<wbr>t=
imespec)))<br>
&gt;<br>
&gt; +=C2=A0 IOCTL(RNDGETENTCNT, IOC_R, MK_PTR(TYPE_INT))<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 IOCTL(CDROMPAUSE, 0, TYPE_NULL)<br>
&gt;=C2=A0 =C2=A0 IOCTL(CDROMSTART, 0, TYPE_NULL)<br>
&gt;=C2=A0 =C2=A0 IOCTL(CDROMSTOP, 0, TYPE_NULL)<br>
&gt; diff --git a/linux-user/syscall.c b/linux-user/syscall.c<br>
&gt; index 9b6364a266..d4c21a557c 100644<br>
&gt; --- a/linux-user/syscall.c<br>
&gt; +++ b/linux-user/syscall.c<br>
&gt; @@ -59,6 +59,7 @@ int __clone2(int (*fn)(void *), void *child_stack_ba=
se,<br>
&gt;=C2=A0 #include &lt;linux/icmp.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/icmpv6.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/errqueue.h&gt;<br>
&gt; +#include &lt;linux/random.h&gt;<br>
&gt;=C2=A0 #include &quot;qemu-common.h&quot;<br>
&gt;=C2=A0 #ifdef CONFIG_TIMERFD<br>
&gt;=C2=A0 #include &lt;sys/timerfd.h&gt;<br>
&gt; diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h<br>
&gt; index 40c5027e93..2b27786dae 100644<br>
&gt; --- a/linux-user/syscall_defs.h<br>
&gt; +++ b/linux-user/syscall_defs.h<br>
&gt; @@ -1060,6 +1060,10 @@ struct target_pollfd {<br>
&gt;<br>
&gt;=C2=A0 #define TARGET_SIOCGIWNAME=C2=A0 =C2=A0 =C2=A00x8B01=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* get name =3D=3D wireless protocol */<br>
&gt;<br>
&gt; +/* From &lt;linux/random.h&gt; */<br>
&gt; +<br>
&gt; +#define TARGET_RNDGETENTCNT=C2=A0 =C2=A0 TARGET_IOR(&#39;R&#39;, 0x00=
, int)<br>
&gt; +<br>
&gt;=C2=A0 /* From &lt;linux/fs.h&gt; */<br>
&gt;<br>
&gt;=C2=A0 #define TARGET_BLKROSET=C2=A0 =C2=A0TARGET_IO(0x12,93) /* set de=
vice read-only (0 =3D read-write) */<br>
&gt;<br>
<br>
</div></div>It would be better to keep RNDADDTOENTCNT, RNDZAPENTCNT and RND=
CLEARPOOL<br>
as the changes are trivial too.<br>
<br>
Anyway:<br>
<br>
Reviewed-by: Laurent Vivier &lt;<a href=3D"mailto:lvivier@redhat.com">lvivi=
er@redhat.com</a>&gt;<br>
<br>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature">Marco A L Barbosa<br><a href=3D"=
http://malbarbo.pro.br" target=3D"_blank">http://malbarbo.pro.br</a><br>--<=
/div>
</div>

--f403045ea76084c01d055acd181d--

