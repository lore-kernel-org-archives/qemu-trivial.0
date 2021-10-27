Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfky9-0000CU-8J
	for mharc-qemu-trivial@gnu.org; Wed, 27 Oct 2021 11:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mfky3-00005f-Tu
 for qemu-trivial@nongnu.org; Wed, 27 Oct 2021 11:35:55 -0400
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f]:41550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mfkxw-0007VF-CC
 for qemu-trivial@nongnu.org; Wed, 27 Oct 2021 11:35:55 -0400
Received: by mail-vk1-xa2f.google.com with SMTP id 20so1539227vkc.8
 for <qemu-trivial@nongnu.org>; Wed, 27 Oct 2021 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KEqOPD63ohc+18MOP9CqgBMIqiebgcvfB8HxXeIL/jA=;
 b=xnhJ9NmmpyRB8VJ7Szs7Jv++AmQ90bKF3kYbFbUyfFW3qX/BXtm0A3LdK0Cb9TYfA5
 5yESE4ZD5FzkGVtUsuIkHbcbSNh4DVwCZmdteC7cmfBzRMMqMrZEN5uiNyL0Ayw/DyDW
 FAfhEN1ZbK3QGHe1pO5T+x/fQW5rYdveLkc1GzZyaQOHZnrKpwWjv7skNBBiEleKW9ii
 PHBGPmpsUCA2mQ2MUi177IGLtWVFDmlAtSQTH9hZGU/JPTo1nXFahAIZq3PkWy6rwLx6
 1S68ofGzCTnHS1cKRdfbHd/E5roy8PMhyBh1t08ZrwBoaZLoVi1Oa/HA0zTLZOTnf/lp
 m36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KEqOPD63ohc+18MOP9CqgBMIqiebgcvfB8HxXeIL/jA=;
 b=UIbk8Abn5ldp8T/6i9RKvy/zOJBKEfYNo1DcrPfvU6fw8rFH0RtKLUDsdwZoR3+/Tk
 15FTdBFmYmFZL5l2mCqJFmt9LKr/Fp6f8yVFABVP2DyPFGECNHn/Fj22IZQWKNN8VJaF
 zUnyNZJWs4vs+zCfiuNG7K3tFxWl4Hwzg9Xiv7UEFupLPTtj1GiR4VmWTv6j1JnCq1Y6
 Zj6AemQTKhbXmHqtss5RHazjchBkGTUsQFXbUpd5MnOd1xDZRx7UzyYA30ZeZ8yEaZNS
 LZynQxRBfXeYauvQhwgNHkNgzpwPx75RXjSJ4xX8YBg0VteboC5BALYUX1yoZZElFTBc
 fKrw==
X-Gm-Message-State: AOAM531lhGTyyepXu7HGnSLk+hOxCSG+/r5cgcBoBSYOCybIh1Vz61Xj
 XXpt2O/P9ZHNN/rjO3fZAvAN5mDEHPkGJMqOIQRwrw==
X-Google-Smtp-Source: ABdhPJyZuy3Aedl/vVzTIGixtqP3PE2GWldY9WUZLfNImZXCWDVRFJI9+a6D1eQvUdpJOzVJLEmP2XSVF2DISOUoQZ0=
X-Received: by 2002:a1f:6416:: with SMTP id y22mr20664698vkb.18.1635348944411; 
 Wed, 27 Oct 2021 08:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-14-imp@bsdimp.com>
 <CACNAnaHUq==anp0uQhxk3o=MuLeyaii+MsMPZc3_pBnuS-wCag@mail.gmail.com>
 <CACNAnaH-=mFx-tPd4nVVv+Y=oRe6Vj4Um51rr0u1GBFGk0P=tQ@mail.gmail.com>
In-Reply-To: <CACNAnaH-=mFx-tPd4nVVv+Y=oRe6Vj4Um51rr0u1GBFGk0P=tQ@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 27 Oct 2021 09:35:33 -0600
Message-ID: <CANCZdfo8ZXYozgzWSqzkhxrH=BYD6RjG3_MbcZNHidVwmTMZWw@mail.gmail.com>
Subject: Re: [PATCH 13/24] bsd-user/arm/target_arch_thread.h: Routines to
 create and switch to a thread
To: Kyle Evans <kevans@freebsd.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Stacey Son <sson@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000ea70d805cf57580b"
Received-SPF: none client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Oct 2021 15:35:56 -0000

--000000000000ea70d805cf57580b
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 26, 2021 at 12:11 AM Kyle Evans <kevans@freebsd.org> wrote:

> On Tue, Oct 26, 2021 at 1:01 AM Kyle Evans <kevans@freebsd.org> wrote:
> >
> > On Tue, Oct 19, 2021 at 11:45 AM Warner Losh <imp@bsdimp.com> wrote:
> > >
> > > Implement target_thread_init (to create a thread) and target_set_upcall
> > > (to switch to a thread) for arm.
> > >
> > > Signed-off-by: Stacey Son <sson@FreeBSD.org>
> > > Signed-off-by: Klye Evans <kevans@FreeBSD.org>
> > > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > > ---
> > >  bsd-user/arm/target_arch_thread.h | 71 +++++++++++++++++++++++++++++++
> > >  1 file changed, 71 insertions(+)
> > >  create mode 100644 bsd-user/arm/target_arch_thread.h
> > >
> > > diff --git a/bsd-user/arm/target_arch_thread.h
> b/bsd-user/arm/target_arch_thread.h
> > > new file mode 100644
> > > index 0000000000..317364bb84
> > > --- /dev/null
> > > +++ b/bsd-user/arm/target_arch_thread.h
> > > @@ -0,0 +1,71 @@
> > > +/*
> > > + *  arm thread support
> > > + *
> > > + *  Copyright (c) 2013 Stacey D. Son
> > > + *
> > > + *  This program is free software; you can redistribute it and/or
> modify
> > > + *  it under the terms of the GNU General Public License as published
> by
> > > + *  the Free Software Foundation; either version 2 of the License, or
> > > + *  (at your option) any later version.
> > > + *
> > > + *  This program is distributed in the hope that it will be useful,
> > > + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > > + *  GNU General Public License for more details.
> > > + *
> > > + *  You should have received a copy of the GNU General Public License
> > > + *  along with this program; if not, see <
> http://www.gnu.org/licenses/>.
> > > + */
> > > +#ifndef _TARGET_ARCH_THREAD_H_
> > > +#define _TARGET_ARCH_THREAD_H_
> > > +
> > > +/* Compare to arm/arm/vm_machdep.c cpu_set_upcall_kse() */
> > > +static inline void target_thread_set_upcall(CPUARMState *regs,
> abi_ulong entry,
> > > +    abi_ulong arg, abi_ulong stack_base, abi_ulong stack_size)
> > > +{
> > > +    abi_ulong sp;
> > > +
> > > +    /*
> > > +     * Make sure the stack is properly aligned.
> > > +     * arm/include/param.h (STACKLIGN() macro)
> > > +     */
> > > +    sp = (u_int)((stack_base + stack_size) -
> > > +        sizeof(struct target_trapframe)) & ~0x7;
> > > +
> > > +    /* sp = stack base */
> > > +    regs->regs[13] = sp;
> > > +    /* pc = start function entry */
> > > +    regs->regs[15] = entry & 0xfffffffe;
> > > +    /* r0 = arg */
> > > +    regs->regs[0] = arg;
> > > +    regs->spsr = ARM_CPU_MODE_USR;
> > > +    if (entry & 0x1) {
> > > +        regs->spsr |= CPSR_T;
> > > +    }
> > > +}
> > > +
> > > +static inline void target_thread_init(struct target_pt_regs *regs,
> > > +        struct image_info *infop)
> > > +{
> > > +    abi_long stack = infop->start_stack;
> > > +    memset(regs, 0, sizeof(*regs));
> > > +    regs->ARM_cpsr = 0x10;
> > > +    if (infop->entry & 1) {
> > > +        regs->ARM_cpsr |= CPSR_T;
> > > +    }
> > > +    regs->ARM_pc = infop->entry & 0xfffffffe;
> > > +    regs->ARM_sp = infop->start_stack;
> > > +    if (bsd_type == target_freebsd) {
> > > +        regs->ARM_lr = infop->entry & 0xfffffffe;
> > > +    }
> > > +    /* FIXME - what to for failure of get_user()? */
> > > +    get_user_ual(regs->ARM_r2, stack + 8); /* envp */
> > > +    get_user_ual(regs->ARM_r1, stack + 4); /* envp */
> > > +    /* XXX: it seems that r0 is zeroed after ! */
> > > +    regs->ARM_r0 = 0;
> > > +    /* For uClinux PIC binaries.  */
> > > +    /* XXX: Linux does this only on ARM with no MMU (do we care ?) */
> > > +    regs->ARM_r10 = infop->start_data;
> > > +}
> > > +
> > > +#endif /* !_TARGET_ARCH_THREAD_H_ */
> > > --
> > > 2.32.0
> > >
> >
> > I think it's obvious enough to folks already familiar with ARM, but I
> > wonder if we shouldn't add in some basic commentary about the thumb
> > bits above. Something like:
> >
> > /*
> >  * The low bit in an entry point indicates a thumb instruction; the
> entry point
> >  * can't actually exist at this address because it must be 16- or 32-
> > bit aligned.
> >  * The low bit gets masked off and the T bit in CSPR is twiddled to
> > indicate thumb.
> >  */
>
> s/CSPR/CPSR/
>

Does

    /*
     * Thumb mode is encoded by the low bit in the entry point (since ARM
can't
     * execute at odd addresses). When it's set, set the Thumb bit (T) in
the
     * CPSR.
     */

 Look good to you?

Warner

--000000000000ea70d805cf57580b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 26, 2021 at 12:11 AM Kyle=
 Evans &lt;<a href=3D"mailto:kevans@freebsd.org">kevans@freebsd.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, =
Oct 26, 2021 at 1:01 AM Kyle Evans &lt;<a href=3D"mailto:kevans@freebsd.org=
" target=3D"_blank">kevans@freebsd.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, Oct 19, 2021 at 11:45 AM Warner Losh &lt;<a href=3D"mailto:imp=
@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Implement target_thread_init (to create a thread) and target_set_=
upcall<br>
&gt; &gt; (to switch to a thread) for arm.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Stacey Son &lt;sson@FreeBSD.org&gt;<br>
&gt; &gt; Signed-off-by: Klye Evans &lt;kevans@FreeBSD.org&gt;<br>
&gt; &gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" =
target=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 bsd-user/arm/target_arch_thread.h | 71 ++++++++++++++++++++=
+++++++++++<br>
&gt; &gt;=C2=A0 1 file changed, 71 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 bsd-user/arm/target_arch_thread.h<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/bsd-user/arm/target_arch_thread.h b/bsd-user/arm/tar=
get_arch_thread.h<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..317364bb84<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/bsd-user/arm/target_arch_thread.h<br>
&gt; &gt; @@ -0,0 +1,71 @@<br>
&gt; &gt; +/*<br>
&gt; &gt; + *=C2=A0 arm thread support<br>
&gt; &gt; + *<br>
&gt; &gt; + *=C2=A0 Copyright (c) 2013 Stacey D. Son<br>
&gt; &gt; + *<br>
&gt; &gt; + *=C2=A0 This program is free software; you can redistribute it =
and/or modify<br>
&gt; &gt; + *=C2=A0 it under the terms of the GNU General Public License as=
 published by<br>
&gt; &gt; + *=C2=A0 the Free Software Foundation; either version 2 of the L=
icense, or<br>
&gt; &gt; + *=C2=A0 (at your option) any later version.<br>
&gt; &gt; + *<br>
&gt; &gt; + *=C2=A0 This program is distributed in the hope that it will be=
 useful,<br>
&gt; &gt; + *=C2=A0 but WITHOUT ANY WARRANTY; without even the implied warr=
anty of<br>
&gt; &gt; + *=C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=
=A0 See the<br>
&gt; &gt; + *=C2=A0 GNU General Public License for more details.<br>
&gt; &gt; + *<br>
&gt; &gt; + *=C2=A0 You should have received a copy of the GNU General Publ=
ic License<br>
&gt; &gt; + *=C2=A0 along with this program; if not, see &lt;<a href=3D"htt=
p://www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.=
gnu.org/licenses/</a>&gt;.<br>
&gt; &gt; + */<br>
&gt; &gt; +#ifndef _TARGET_ARCH_THREAD_H_<br>
&gt; &gt; +#define _TARGET_ARCH_THREAD_H_<br>
&gt; &gt; +<br>
&gt; &gt; +/* Compare to arm/arm/vm_machdep.c cpu_set_upcall_kse() */<br>
&gt; &gt; +static inline void target_thread_set_upcall(CPUARMState *regs, a=
bi_ulong entry,<br>
&gt; &gt; +=C2=A0 =C2=A0 abi_ulong arg, abi_ulong stack_base, abi_ulong sta=
ck_size)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 abi_ulong sp;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 /*<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0* Make sure the stack is properly aligned.<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0* arm/include/param.h (STACKLIGN() macro)<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt; +=C2=A0 =C2=A0 sp =3D (u_int)((stack_base + stack_size) -<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(struct target_trapframe)) &am=
p; ~0x7;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 /* sp =3D stack base */<br>
&gt; &gt; +=C2=A0 =C2=A0 regs-&gt;regs[13] =3D sp;<br>
&gt; &gt; +=C2=A0 =C2=A0 /* pc =3D start function entry */<br>
&gt; &gt; +=C2=A0 =C2=A0 regs-&gt;regs[15] =3D entry &amp; 0xfffffffe;<br>
&gt; &gt; +=C2=A0 =C2=A0 /* r0 =3D arg */<br>
&gt; &gt; +=C2=A0 =C2=A0 regs-&gt;regs[0] =3D arg;<br>
&gt; &gt; +=C2=A0 =C2=A0 regs-&gt;spsr =3D ARM_CPU_MODE_USR;<br>
&gt; &gt; +=C2=A0 =C2=A0 if (entry &amp; 0x1) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 regs-&gt;spsr |=3D CPSR_T;<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static inline void target_thread_init(struct target_pt_regs *reg=
s,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct image_info *infop)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 abi_long stack =3D infop-&gt;start_stack;<br>
&gt; &gt; +=C2=A0 =C2=A0 memset(regs, 0, sizeof(*regs));<br>
&gt; &gt; +=C2=A0 =C2=A0 regs-&gt;ARM_cpsr =3D 0x10;<br>
&gt; &gt; +=C2=A0 =C2=A0 if (infop-&gt;entry &amp; 1) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 regs-&gt;ARM_cpsr |=3D CPSR_T;<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 regs-&gt;ARM_pc =3D infop-&gt;entry &amp; 0xffffff=
fe;<br>
&gt; &gt; +=C2=A0 =C2=A0 regs-&gt;ARM_sp =3D infop-&gt;start_stack;<br>
&gt; &gt; +=C2=A0 =C2=A0 if (bsd_type =3D=3D target_freebsd) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 regs-&gt;ARM_lr =3D infop-&gt;entry =
&amp; 0xfffffffe;<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 /* FIXME - what to for failure of get_user()? */<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 get_user_ual(regs-&gt;ARM_r2, stack + 8); /* envp =
*/<br>
&gt; &gt; +=C2=A0 =C2=A0 get_user_ual(regs-&gt;ARM_r1, stack + 4); /* envp =
*/<br>
&gt; &gt; +=C2=A0 =C2=A0 /* XXX: it seems that r0 is zeroed after ! */<br>
&gt; &gt; +=C2=A0 =C2=A0 regs-&gt;ARM_r0 =3D 0;<br>
&gt; &gt; +=C2=A0 =C2=A0 /* For uClinux PIC binaries.=C2=A0 */<br>
&gt; &gt; +=C2=A0 =C2=A0 /* XXX: Linux does this only on ARM with no MMU (d=
o we care ?) */<br>
&gt; &gt; +=C2=A0 =C2=A0 regs-&gt;ARM_r10 =3D infop-&gt;start_data;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +#endif /* !_TARGET_ARCH_THREAD_H_ */<br>
&gt; &gt; --<br>
&gt; &gt; 2.32.0<br>
&gt; &gt;<br>
&gt;<br>
&gt; I think it&#39;s obvious enough to folks already familiar with ARM, bu=
t I<br>
&gt; wonder if we shouldn&#39;t add in some basic commentary about the thum=
b<br>
&gt; bits above. Something like:<br>
&gt;<br>
&gt; /*<br>
&gt;=C2=A0 * The low bit in an entry point indicates a thumb instruction; t=
he entry point<br>
&gt;=C2=A0 * can&#39;t actually exist at this address because it must be 16=
- or 32-<br>
&gt; bit aligned.<br>
&gt;=C2=A0 * The low bit gets masked off and the T bit in CSPR is twiddled =
to<br>
&gt; indicate thumb.<br>
&gt;=C2=A0 */<br>
<br>
s/CSPR/CPSR/<br></blockquote><div><br></div><div>Does</div><div>=C2=A0</div=
>=C2=A0 =C2=A0 /*<br>=C2=A0 =C2=A0 =C2=A0* Thumb mode is encoded by the low=
 bit in the entry point (since ARM can&#39;t<br>=C2=A0 =C2=A0 =C2=A0* execu=
te at odd addresses). When it&#39;s set, set the Thumb bit (T) in the<br>=
=C2=A0 =C2=A0 =C2=A0* CPSR.<br><div>=C2=A0 =C2=A0 =C2=A0*/</div><div><br></=
div><div>=C2=A0Look good to you?</div><div><br></div><div>Warner</div></div=
></div>

--000000000000ea70d805cf57580b--

