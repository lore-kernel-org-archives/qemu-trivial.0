Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mj3E9-0003ea-Iw
	for mharc-qemu-trivial@gnu.org; Fri, 05 Nov 2021 13:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mj3E7-0003cw-Jw
 for qemu-trivial@nongnu.org; Fri, 05 Nov 2021 13:42:07 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936]:43726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mj3E5-00036H-JI
 for qemu-trivial@nongnu.org; Fri, 05 Nov 2021 13:42:07 -0400
Received: by mail-ua1-x936.google.com with SMTP id v3so18445268uam.10
 for <qemu-trivial@nongnu.org>; Fri, 05 Nov 2021 10:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tz9sADjW5Cx4noWIH/cQaSJzFVTbqmrE932QTIxCyuE=;
 b=aJicsuj7dVOrErJZOWkmyHj253OooLNmSbv0h1fKDeEuNy4jHnRDsbKmOvu5uVII5L
 7uhoSWltDJbb0DLKSqxexYipXDVRqiAVbY0B9wL6GQ2Pl1F9dnRl1XM5S/UEnQYSlh50
 RxWGa1KDmGDT2dhMS2FYev5w2herExL7AIOWcOJCtHMSl+kCxK1XMtyVWVVnP5UY3lUV
 j/HzEIcBanspgquTXezIfVLqeINozmjWd898FP9NMpdskc2xi4o65a/ximUzqn+ekrbJ
 ayP9eRyVrZrrncv2QbLsgXpU6s5K8HXoE3YoZw0t8NqDo+J4/YSVriwHALivbuoKjq5S
 0sxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tz9sADjW5Cx4noWIH/cQaSJzFVTbqmrE932QTIxCyuE=;
 b=j/T0LhRSVEgjGAX5Lrsv6ztPMVoVbR92b5XDg6zTlB/Fefu6TjLg0VJDbAwUVJ+OwV
 LWIXyVNsV/om3ixl5gbTWq/m8hVVI8UeCKDjbRSUNbx2kE7kg/Dab9vWrBZpRCyN5SnJ
 ftAa0/Yd0d7VHLkEfwipBkJPVAW8ffqtABjGw+jLif/3iFjhZNHD2mzSbsSv4KjEaaho
 DC5TOpS8PD4HwwvXniasRzi1KxVRXXpAVMcTFNlLe/2XHeMi7ASN7Sw3DuVo6ZQSdOBm
 ZBMGdTPgMDK1XIsxNzzLjJv5oK04ZG8ZRRR4fFnwA0/Kk9m8dQccXyFfiV/KQvpy9/6V
 KhvQ==
X-Gm-Message-State: AOAM531BOudmZYrBOXPT3XEvvwRAfta+ATKuqg1yd/9xwPbVsvgFxJ5s
 d/lEz90uX1qWF0tMmt8UubRt+j3/HZHRH8+wyHR1DQ==
X-Google-Smtp-Source: ABdhPJzqyNYy58j4kzdWfqLEhS8iUME7nez15p1XA/uwmF3sw4/0Y1IEH1JZRhBnOnciLPToQwRzZR4CsEXxvb0svRA=
X-Received: by 2002:a67:fdc3:: with SMTP id l3mr12179417vsq.42.1636134123788; 
 Fri, 05 Nov 2021 10:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211105031917.87837-1-imp@bsdimp.com>
 <20211105031917.87837-34-imp@bsdimp.com>
 <1fd1396f-56d6-1a60-6786-797623827dd9@linaro.org>
In-Reply-To: <1fd1396f-56d6-1a60-6786-797623827dd9@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 5 Nov 2021 11:41:52 -0600
Message-ID: <CANCZdfp2a1pf4RNK+uLTUOrDWsJGY9FymPCR5dmntq+K_2WHRg@mail.gmail.com>
Subject: Re: [PATCH v4 33/36] bsd-user/arm/target_arch_signal.c: arm
 set_mcontext
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Laurent Vivier <laurent@vivier.eu>, 
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@freebsd.org>
Content-Type: multipart/alternative; boundary="00000000000041033d05d00e2905"
Received-SPF: none client-ip=2607:f8b0:4864:20::936;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x936.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Nov 2021 17:42:08 -0000

--00000000000041033d05d00e2905
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 5, 2021 at 10:44 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 11/4/21 11:19 PM, Warner Losh wrote:
> > +/* Compare to arm/arm/exec_machdep.c set_mcontext() */
> > +abi_long set_mcontext(CPUARMState *env, target_mcontext_t *mcp, int
> srflag)
> > +{
> > +    int err = 0;
> > +    const uint32_t *gr = mcp->__gregs;
> > +    uint32_t cpsr, ccpsr = cpsr_read(env);
> > +    uint32_t fpscr, mask;
> > +
> > +    cpsr = tswap32(gr[TARGET_REG_CPSR]);
> > +    /*
> > +     * Only allow certain bits to change, reject attempted changes to
> non-user
> > +     * bits. In addition, make sure we're headed for user mode and none
> of the
> > +     * interrupt bits are set.
> > +     */
> > +    if ((ccpsr & ~CPSR_USER) != (cpsr & ~CPSR_USER)) {
> > +        return -TARGET_EINVAL;
> > +    }
> > +    if ((cpsr & CPSR_M) != ARM_CPU_MODE_USR ||
> > +        (cpsr & (CPSR_I | CPSR_F)) != 0) {
> > +        return -TARGET_EINVAL;
> > +    }
> > +    mask = cpsr & CPSR_T ? 0x1 : 0x3;
>
> Should add a sentence or so here, pointing to the exception return
> instruction used by the
> freebsd kernel, which does this masking.
>

Will do.


> > +    /*
> > +     * Make sure T mode matches the PC's notion of thumb mode, although
> > +     * FreeBSD lets the processor sort this out, so we may need remove
> > +     * this check, or generate a signal...
> > +     */
> > +    if (!!(tswap32(gr[TARGET_REG_PC]) & 1) != !!(cpsr & CPSR_T)) {
> > +        return -TARGET_EINVAL;
> > +    }
>
> Remove this.
>

Gone.


> > +    env->regs[15] = tswap32(gr[TARGET_REG_PC] & mask);
>
> You wanted ~mask.
>

Doh! Fixed.

Warner


>
> r~
>

--00000000000041033d05d00e2905
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 5, 2021 at 10:44 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 11/4/21 11:19 PM, Warner Losh wrote:<br>
&gt; +/* Compare to arm/arm/exec_machdep.c set_mcontext() */<br>
&gt; +abi_long set_mcontext(CPUARMState *env, target_mcontext_t *mcp, int s=
rflag)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int err =3D 0;<br>
&gt; +=C2=A0 =C2=A0 const uint32_t *gr =3D mcp-&gt;__gregs;<br>
&gt; +=C2=A0 =C2=A0 uint32_t cpsr, ccpsr =3D cpsr_read(env);<br>
&gt; +=C2=A0 =C2=A0 uint32_t fpscr, mask;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 cpsr =3D tswap32(gr[TARGET_REG_CPSR]);<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Only allow certain bits to change, reject attem=
pted changes to non-user<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* bits. In addition, make sure we&#39;re headed f=
or user mode and none of the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* interrupt bits are set.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if ((ccpsr &amp; ~CPSR_USER) !=3D (cpsr &amp; ~CPSR_USE=
R)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_EINVAL;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 if ((cpsr &amp; CPSR_M) !=3D ARM_CPU_MODE_USR ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (cpsr &amp; (CPSR_I | CPSR_F)) !=3D 0) {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_EINVAL;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 mask =3D cpsr &amp; CPSR_T ? 0x1 : 0x3;<br>
<br>
Should add a sentence or so here, pointing to the exception return instruct=
ion used by the <br>
freebsd kernel, which does this masking.<br></blockquote><div><br></div><di=
v>Will do.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Make sure T mode matches the PC&#39;s notion of=
 thumb mode, although<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* FreeBSD lets the processor sort this out, so we=
 may need remove<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* this check, or generate a signal...<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if (!!(tswap32(gr[TARGET_REG_PC]) &amp; 1) !=3D !!(cpsr=
 &amp; CPSR_T)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_EINVAL;<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
Remove this.<br></blockquote><div><br></div><div>Gone.</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 env-&gt;regs[15] =3D tswap32(gr[TARGET_REG_PC] &amp; ma=
sk);<br>
<br>
You wanted ~mask.<br></blockquote><div><br></div><div>Doh! Fixed.</div><div=
><br></div><div>Warner</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
r~<br>
</blockquote></div></div>

--00000000000041033d05d00e2905--

