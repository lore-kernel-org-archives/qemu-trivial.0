Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgeM8-0000GS-6w
	for mharc-qemu-trivial@gnu.org; Fri, 29 Oct 2021 22:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mgeM6-0000Fw-JU
 for qemu-trivial@nongnu.org; Fri, 29 Oct 2021 22:44:26 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f]:40933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mgeM4-0005E6-LA
 for qemu-trivial@nongnu.org; Fri, 29 Oct 2021 22:44:26 -0400
Received: by mail-ua1-x92f.google.com with SMTP id e2so21591834uax.7
 for <qemu-trivial@nongnu.org>; Fri, 29 Oct 2021 19:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rIWUbNrSRh0faMEOi4eyWw7ZoapG7Kq0BUhVe36kaRE=;
 b=1qdyfd6rlJooH7K63+LQiHTfayNZbU/Rs4vFCWMqJG90LjYbrdOvjUn3AeqX3D7052
 fNG+kAJhr1Sd/2nftQAhD8Tm9gm7tauEmO0ixU9ZPOtT3KFCAQeELsgQrmZp4ZpqtoVe
 PsFLXkMnVLmo9HtvPbKCcN+SZHX5c7G4tohJw/y2jpUt+GZaSfP+RsHH/L3W71yR5XKm
 2Hzt37oiqTaVNgPNrdx1QaooVvZCQ8EpuLUY58/T7bEj6NbykqFs0ahBszFu+iiZSkf6
 nx7YGU9aeV1DhQYI8eRbWamGXfFytE4H0OB34Sgj1eL+RJvaHB2i2bygvcR/II2qrli1
 bu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rIWUbNrSRh0faMEOi4eyWw7ZoapG7Kq0BUhVe36kaRE=;
 b=uebjeTtr3kXkP2KmhEY/K0q1iG3VfLdY+r5Ap4AY9zICb/8jAmPZAMpM5OTed94pPP
 jzYe1B2RgK6ly0eCFzqg1jgt4Tb5WnhnJFb9/mVubejczQcmJusa8hXCzL287m9m3vdo
 RbELz2pnfaCv3I6Z9+/69utfyW7ia6disAJ2/wAYcDZjbPTfN2pa8J5rd++ztE1zSj1g
 esjr3PAj1rbMHnmdLZdGdNbNjEfa2RurZus15ijf82H5X4LMaoWj5popDhRlxn+9mucY
 L6LLTR34+p72GztJa3KCeZm1dVXOzEYaPmd/8YKX0NkZa8e6Iu2uUGplWH4xH2zmN/kK
 Ir0A==
X-Gm-Message-State: AOAM532L/yO/+yDPUe3a2xdJKpTils9ZCyC4LVuL7xKR7Aux9+7xO/0d
 dCTBC6qsmJTpvCOIjK5I7bXV9nEOaJ+HFjmYXIFUcg==
X-Google-Smtp-Source: ABdhPJx9Hdl5BWzDKbf3GVtfoHuHzS6GVTeqfKfGWSCYtiU89CZv4d2mxVeAQASwA43AkKpw/QJsaejmghVMuGOCmm8=
X-Received: by 2002:ab0:271a:: with SMTP id s26mr16503455uao.77.1635561862871; 
 Fri, 29 Oct 2021 19:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-20-imp@bsdimp.com>
 <63da2085-b7f7-52ac-6673-b91c211b4c62@linaro.org>
In-Reply-To: <63da2085-b7f7-52ac-6673-b91c211b4c62@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 29 Oct 2021 20:44:14 -0600
Message-ID: <CANCZdfp8=oTggTcZBx72e6ajm_bdfgrdeJgSeRpz5G3Ua8Fkog@mail.gmail.com>
Subject: Re: [PATCH 19/24] bsd-user/arm/target_arch_signal.h: arm user context
 and trapframe for signals
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Stacey Son <sson@freebsd.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Kyle Evans <kevans@freebsd.org>, 
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="000000000000d84c0a05cf88ebea"
Received-SPF: none client-ip=2607:f8b0:4864:20::92f;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 30 Oct 2021 02:44:26 -0000

--000000000000d84c0a05cf88ebea
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 28, 2021 at 11:22 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 10/19/21 9:44 AM, Warner Losh wrote:
> > Arm specific user context structures for signal handling and the closely
> > related trap frame.
> >
> > Signed-off-by: Stacey Son <sson@FreeBSD.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   bsd-user/arm/target_arch_signal.h | 38 +++++++++++++++++++++++++++++++
> >   1 file changed, 38 insertions(+)
> >
> > diff --git a/bsd-user/arm/target_arch_signal.h
> b/bsd-user/arm/target_arch_signal.h
> > index 9fee58ca9c..67355ff28f 100644
> > --- a/bsd-user/arm/target_arch_signal.h
> > +++ b/bsd-user/arm/target_arch_signal.h
> > @@ -90,4 +90,42 @@ typedef struct target_mcontext {
> >       } __fpu;
> >   } target_mcontext_t;
> >
> > +typedef struct target_ucontext {
> > +    target_sigset_t     uc_sigmask;
> > +    target_mcontext_t   uc_mcontext;
> > +    abi_ulong           uc_link;
> > +    target_stack_t      uc_stack;
> > +    int32_t             uc_flags;
> > +    int32_t             __spare__[4];
> > +} target_ucontext_t;
>
> This is from the common <sys/_ucontext.h>.  Is there any way we can share
> that here in
> qemu as well?
>

That's a good idea.


> > +struct target_sigframe {
> > +    target_siginfo_t    sf_si;  /* saved siginfo */
> > +    target_ucontext_t   sf_uc;  /* saved ucontext */
> > +};
>
> You're missing the storage for
>    mcontext_vfp_t  sf_vfp
>
the address of which goes in mcontext_t.mc_vfp_ptr


Added.


> (which isn't in the version of
> mcontext_t from patch 18).
>

Added to my revised patch 18.


> > +/* compare to sys/arm/include/frame.h */
> > +struct target_trapframe {
> > +    abi_ulong tf_spsr; /* Zero on arm26 */
> > +    abi_ulong tf_r0;
> > +    abi_ulong tf_r1;
> > +    abi_ulong tf_r2;
> > +    abi_ulong tf_r3;
> > +    abi_ulong tf_r4;
> > +    abi_ulong tf_r5;
> > +    abi_ulong tf_r6;
> > +    abi_ulong tf_r7;
> > +    abi_ulong tf_r8;
> > +    abi_ulong tf_r9;
> > +    abi_ulong tf_r10;
> > +    abi_ulong tf_r11;
> > +    abi_ulong tf_r12;
> > +    abi_ulong tf_usr_sp;
> > +    abi_ulong tf_usr_lr;
> > +    abi_ulong tf_svc_sp; /* Not used on arm26 */
> > +    abi_ulong tf_svc_lr; /* Not used on arm26 */
> > +    abi_ulong tf_pc;
> > +};
>
> This is not used by the user abi for signals.  It is a kernel structure
> for its own
> internal trap handling.  Why are you including it?
>

This code pre-dates my time... But I think it was included because the code
in target_arch_thread.h in patch 13 took its size.  But it turns out that's
bogus too. It
accidentally gets things aligned correctly, but should just be removed with
this struct as well. The kernel doesn't use it.

What's worse, ppc, aarch64 and riscv all copied this bogus trope :(. At
least I'll have a chance to fix it before you see it...

I've updated x86 that's upstream in my patch series as well... I'll send it
out Monday or maybe over the weekend.

Warner

--000000000000d84c0a05cf88ebea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 28, 2021 at 11:22 AM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org" target=3D=
"_blank">richard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On 10/19/21 9:44 AM, Warner Losh wrote=
:<br>
&gt; Arm specific user context structures for signal handling and the close=
ly<br>
&gt; related trap frame.<br>
&gt; <br>
&gt; Signed-off-by: Stacey Son &lt;sson@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/arm/target_arch_signal.h | 38 +++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 38 insertions(+)<br>
&gt; <br>
&gt; diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_a=
rch_signal.h<br>
&gt; index 9fee58ca9c..67355ff28f 100644<br>
&gt; --- a/bsd-user/arm/target_arch_signal.h<br>
&gt; +++ b/bsd-user/arm/target_arch_signal.h<br>
&gt; @@ -90,4 +90,42 @@ typedef struct target_mcontext {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} __fpu;<br>
&gt;=C2=A0 =C2=A0} target_mcontext_t;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +typedef struct target_ucontext {<br>
&gt; +=C2=A0 =C2=A0 target_sigset_t=C2=A0 =C2=A0 =C2=A0uc_sigmask;<br>
&gt; +=C2=A0 =C2=A0 target_mcontext_t=C2=A0 =C2=A0uc_mcontext;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uc_li=
nk;<br>
&gt; +=C2=A0 =C2=A0 target_stack_t=C2=A0 =C2=A0 =C2=A0 uc_stack;<br>
&gt; +=C2=A0 =C2=A0 int32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
uc_flags;<br>
&gt; +=C2=A0 =C2=A0 int32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
__spare__[4];<br>
&gt; +} target_ucontext_t;<br>
<br>
This is from the common &lt;sys/_ucontext.h&gt;.=C2=A0 Is there any way we =
can share that here in <br>
qemu as well?<br></blockquote><div><br></div><div>That&#39;s a good idea.</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +struct target_sigframe {<br>
&gt; +=C2=A0 =C2=A0 target_siginfo_t=C2=A0 =C2=A0 sf_si;=C2=A0 /* saved sig=
info */<br>
&gt; +=C2=A0 =C2=A0 target_ucontext_t=C2=A0 =C2=A0sf_uc;=C2=A0 /* saved uco=
ntext */<br>
&gt; +};<br>
<br>
You&#39;re missing the storage for<br>
=C2=A0 =C2=A0mcontext_vfp_t=C2=A0 sf_vfp<br></blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">the address of which goes in mcontext_t.mc=
_vfp_ptr</blockquote><div><br></div><div>Added.</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">(which isn&#39;t in the versio=
n of <br>
mcontext_t from patch 18).<br></blockquote><div><br></div><div>Added to my =
revised patch 18.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
&gt; +/* compare to sys/arm/include/frame.h */<br>
&gt; +struct target_trapframe {<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_spsr; /* Zero on arm26 */<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r0;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r1;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r2;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r3;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r4;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r5;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r6;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r7;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r8;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r9;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r10;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r11;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_r12;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_usr_sp;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_usr_lr;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_svc_sp; /* Not used on arm26 */<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_svc_lr; /* Not used on arm26 */<br>
&gt; +=C2=A0 =C2=A0 abi_ulong tf_pc;<br>
&gt; +};<br>
<br>
This is not used by the user abi for signals.=C2=A0 It is a kernel structur=
e for its own <br>
internal trap handling.=C2=A0 Why are you including it?<br></blockquote><di=
v><br></div><div>This code pre-dates my time... But I think it was included=
 because the code</div><div>in target_arch_thread.h in patch 13 took its si=
ze.=C2=A0 But it turns out that&#39;s bogus too. It</div><div>accidentally =
gets things aligned correctly, but should just be removed with</div><div>th=
is struct as well. The kernel doesn&#39;t use it.</div><div><br></div><div>=
What&#39;s worse, ppc, aarch64 and riscv=C2=A0all copied this bogus trope :=
(. At</div><div>least I&#39;ll have a chance to fix it before you see it...=
</div><div><br></div><div>I&#39;ve updated x86 that&#39;s upstream in my pa=
tch series as well... I&#39;ll send it</div><div>out Monday or maybe over t=
he weekend.<br></div><div><br></div><div>Warner</div></div></div>

--000000000000d84c0a05cf88ebea--

