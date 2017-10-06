Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0aHt-0001Ue-LO
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 17:36:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <malbarbo@gmail.com>) id 1e0aHr-0001UR-4W
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 17:36:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <malbarbo@gmail.com>) id 1e0aHp-0005oR-O1
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 17:36:03 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:55240)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <malbarbo@gmail.com>) id 1e0aHp-0005my-B5
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 17:36:01 -0400
Received: by mail-lf0-x243.google.com with SMTP id d10so19414303lfg.11
	for <qemu-trivial@nongnu.org>; Fri, 06 Oct 2017 14:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PZfBz8U10p4q3e8ffyXMFKna7XxAnfi0NCVM0pGcmpg=;
	b=b0JmuSCQyTGVPVYSJc5qpkZCWQiixvzQek98470eyb8p1cE432bcjyzT8XBl7SNTPX
	VS7cov5ird95wy57+HGlAWtls+blO2qRQC1a7Zv9vCHWvt1usJ2g4CWza2pkFhTTg+6F
	Tatf3XnwdnozubPRY59+Mc8ncVOFHdHHy2rq1uNO2IOD6LpfIiywPPwZ1FN79E91FZS5
	AoEyTVk33wJKQ/kPP9dcsasatXmVygXv/Oj896UX3j62LzeCEEck01bKt1yUAoSAS33G
	Q6LFga1z3io64tbOQPlRmkerUmIGmbqWUweVnnnR+ecW7N2EJHHmH+i5sG9Ye3pXQ7UI
	hENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PZfBz8U10p4q3e8ffyXMFKna7XxAnfi0NCVM0pGcmpg=;
	b=Nv8iIzoD/zMnMzXOXf0b1Mpvxq8LS8Rl3B9aqtcDaLSkyppx4PjAdpRKJxxM0bHdpD
	h2zqmSFJAqugGOQeIYFLvYAY7fVZ/3HXmRQE/lojltiOP5Db2TMao8R5sDGKm6REHVnG
	j8zAJYv8dAqmq1rRPbFrL4Y1IfixN7SfhdzZhSiV7mBAtFLhwGfBztXsxKirFt8ZKb+K
	ioJ4E04w8brb+oiZOP2bbPthWXawr738vLzuNBF6Pt8YXc9x6ThFqsCk6FU8rclzgV3s
	dyPQV4LR9U8ZmEkEMnvpe5XOMXk8c3GMteXKD8PfBsbvBzdx7zX5GcDBQrNbNivSXKHz
	dVdA==
X-Gm-Message-State: AMCzsaW0ft2skm2grExj3dCVUop44nbIlxIetvFFD+6G4uelOmS1CgOd
	8V1BO2dA8CMmLR6oF3DhaxfH3yJPX9lOIrt+wb8=
X-Google-Smtp-Source: AOwi7QBGs1XOgEehcpb7v80qwd/INiv0BsH8cqqAPAFtb3P4h9bnNJag9pCQNpjjrRpSxsGRBKeTpTd+2CKDDrJw5C0=
X-Received: by 10.25.125.67 with SMTP id y64mr870457lfc.44.1507325759563; Fri,
	06 Oct 2017 14:35:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.40.193 with HTTP; Fri, 6 Oct 2017 14:35:58 -0700 (PDT)
In-Reply-To: <498b5456-1a96-fbd9-6202-0a1301e3a8c5@redhat.com>
References: <20171005135530.837-1-malbarbo@gmail.com>
	<498b5456-1a96-fbd9-6202-0a1301e3a8c5@redhat.com>
From: Marco A L Barbosa <malbarbo@gmail.com>
Date: Fri, 6 Oct 2017 18:35:58 -0300
Message-ID: <CAHpsRN-qFgp-QzjX-QdDUYgUA-DbWinp=hsk-V8L4WxXFDti8A@mail.gmail.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="001a114a575c75ad68055ae7a0d2"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-trivial] [PATCH] linux-user: Add some random ioctls
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
X-List-Received-Date: Fri, 06 Oct 2017 21:36:04 -0000

--001a114a575c75ad68055ae7a0d2
Content-Type: text/plain; charset="UTF-8"

Thanks again for the advice.

This and the other patch should be resubmitted following those instructions
or it is not necessary?

On Fri, Oct 6, 2017 at 4:32 AM, Laurent Vivier <lvivier@redhat.com> wrote:

> On 05/10/2017 15:55, Marco A L Barbosa wrote:
> > Signed-off-by: Marco A L Barbosa <malbarbo@gmail.com>
> > ---
> >  linux-user/ioctls.h       | 5 +++++
> >  linux-user/syscall.c      | 1 +
> >  linux-user/syscall_defs.h | 7 +++++++
> >  3 files changed, 13 insertions(+)
> >
> > diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
> > index e6997ff230..35cad6f944 100644
> > --- a/linux-user/ioctls.h
> > +++ b/linux-user/ioctls.h
> > @@ -173,6 +173,11 @@
> >    IOCTL(SIOCGSTAMP, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timeval)))
> >    IOCTL(SIOCGSTAMPNS, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timespec)))
> >
> > +  IOCTL(RNDGETENTCNT, IOC_R, MK_PTR(TYPE_INT))
> > +  IOCTL(RNDADDTOENTCNT, IOC_W, MK_PTR(TYPE_INT))
> > +  IOCTL(RNDZAPENTCNT, 0, TYPE_NULL)
> > +  IOCTL(RNDCLEARPOOL, 0, TYPE_NULL)
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
> > index 40c5027e93..b3d55e35ac 100644
> > --- a/linux-user/syscall_defs.h
> > +++ b/linux-user/syscall_defs.h
> > @@ -1060,6 +1060,13 @@ struct target_pollfd {
> >
> >  #define TARGET_SIOCGIWNAME     0x8B01          /* get name == wireless
> protocol */
> >
> > +/* From <linux/random.h> */
> > +
> > +#define TARGET_RNDGETENTCNT    TARGET_IOR('R', 0x00, int)
> > +#define TARGET_RNDADDTOENTCNT  TARGET_IOW('R', 0x01, int)
> > +#define TARGET_RNDZAPENTCNT    TARGET_IO('R', 0x04)
> > +#define TARGET_RNDCLEARPOOL    TARGET_IO('R', 0x06)
> > +
> >  /* From <linux/fs.h> */
> >
> >  #define TARGET_BLKROSET   TARGET_IO(0x12,93) /* set device read-only (0
> = read-write) */
> >
>
> Reviewed-by: Laurent Vivier <lvivier@redhat.com>
>
> Please, add a tag version and include history when you resend a series.
>
> Read https://wiki.qemu.org/Contribute/SubmitAPatch
>
> Thanks,
> Laurent
>



-- 
Marco A L Barbosa
http://malbarbo.pro.br
--

--001a114a575c75ad68055ae7a0d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks again for the advice.<br><br>This and the other pat=
ch should be resubmitted following those instructions or it is not necessar=
y?<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fr=
i, Oct 6, 2017 at 4:32 AM, Laurent Vivier <span dir=3D"ltr">&lt;<a href=3D"=
mailto:lvivier@redhat.com" target=3D"_blank">lvivier@redhat.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div cla=
ss=3D"h5">On 05/10/2017 15:55, Marco A L Barbosa wrote:<br>
&gt; Signed-off-by: Marco A L Barbosa &lt;<a href=3D"mailto:malbarbo@gmail.=
com">malbarbo@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 linux-user/ioctls.h=C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 +++++<br>
&gt;=C2=A0 linux-user/syscall.c=C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 linux-user/syscall_defs.h | 7 +++++++<br>
&gt;=C2=A0 3 files changed, 13 insertions(+)<br>
&gt;<br>
&gt; diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h<br>
&gt; index e6997ff230..35cad6f944 100644<br>
&gt; --- a/linux-user/ioctls.h<br>
&gt; +++ b/linux-user/ioctls.h<br>
&gt; @@ -173,6 +173,11 @@<br>
&gt;=C2=A0 =C2=A0 IOCTL(SIOCGSTAMP, IOC_R, MK_PTR(MK_STRUCT(STRUCT_<wbr>tim=
eval)))<br>
&gt;=C2=A0 =C2=A0 IOCTL(SIOCGSTAMPNS, IOC_R, MK_PTR(MK_STRUCT(STRUCT_<wbr>t=
imespec)))<br>
&gt;<br>
&gt; +=C2=A0 IOCTL(RNDGETENTCNT, IOC_R, MK_PTR(TYPE_INT))<br>
&gt; +=C2=A0 IOCTL(RNDADDTOENTCNT, IOC_W, MK_PTR(TYPE_INT))<br>
&gt; +=C2=A0 IOCTL(RNDZAPENTCNT, 0, TYPE_NULL)<br>
&gt; +=C2=A0 IOCTL(RNDCLEARPOOL, 0, TYPE_NULL)<br>
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
&gt; index 40c5027e93..b3d55e35ac 100644<br>
&gt; --- a/linux-user/syscall_defs.h<br>
&gt; +++ b/linux-user/syscall_defs.h<br>
&gt; @@ -1060,6 +1060,13 @@ struct target_pollfd {<br>
&gt;<br>
&gt;=C2=A0 #define TARGET_SIOCGIWNAME=C2=A0 =C2=A0 =C2=A00x8B01=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* get name =3D=3D wireless protocol */<br>
&gt;<br>
&gt; +/* From &lt;linux/random.h&gt; */<br>
&gt; +<br>
&gt; +#define TARGET_RNDGETENTCNT=C2=A0 =C2=A0 TARGET_IOR(&#39;R&#39;, 0x00=
, int)<br>
&gt; +#define TARGET_RNDADDTOENTCNT=C2=A0 TARGET_IOW(&#39;R&#39;, 0x01, int=
)<br>
&gt; +#define TARGET_RNDZAPENTCNT=C2=A0 =C2=A0 TARGET_IO(&#39;R&#39;, 0x04)=
<br>
&gt; +#define TARGET_RNDCLEARPOOL=C2=A0 =C2=A0 TARGET_IO(&#39;R&#39;, 0x06)=
<br>
&gt; +<br>
&gt;=C2=A0 /* From &lt;linux/fs.h&gt; */<br>
&gt;<br>
&gt;=C2=A0 #define TARGET_BLKROSET=C2=A0 =C2=A0TARGET_IO(0x12,93) /* set de=
vice read-only (0 =3D read-write) */<br>
&gt;<br>
<br>
</div></div>Reviewed-by: Laurent Vivier &lt;<a href=3D"mailto:lvivier@redha=
t.com">lvivier@redhat.com</a>&gt;<br>
<br>
Please, add a tag version and include history when you resend a series.<br>
<br>
Read <a href=3D"https://wiki.qemu.org/Contribute/SubmitAPatch" rel=3D"noref=
errer" target=3D"_blank">https://wiki.qemu.org/<wbr>Contribute/SubmitAPatch=
</a><br>
<br>
Thanks,<br>
Laurent<br>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature">Marco A L Barbosa<br><a href=3D"=
http://malbarbo.pro.br" target=3D"_blank">http://malbarbo.pro.br</a><br>--<=
/div>
</div>

--001a114a575c75ad68055ae7a0d2--

