Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1miKzN-0001mc-L9
	for mharc-qemu-trivial@gnu.org; Wed, 03 Nov 2021 14:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1miKzL-0001lr-Gd
 for qemu-trivial@nongnu.org; Wed, 03 Nov 2021 14:27:55 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a]:33297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1miKzH-0004JF-6X
 for qemu-trivial@nongnu.org; Wed, 03 Nov 2021 14:27:53 -0400
Received: by mail-ua1-x92a.google.com with SMTP id b17so6292365uas.0
 for <qemu-trivial@nongnu.org>; Wed, 03 Nov 2021 11:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FhK8RbzEFufb1iq23r34WkDiA3ShkcQ+NWfPmmVrVXU=;
 b=YPk8rg4v1YBDgnetEi5QPwdZgcCg6/J1+1Fy5bXzmafafAJGY4A9vn0Q99JXJ+auuN
 6Jg9DoNBvhgvm3HRgPpZ0utl91G+D20FPOXTAFzqEBTpJgiljWxhhWf+c2OA9TcgKQyP
 3eqOhWyi5a/dvdUpKc5QLJd3H9Iz8hIw1YEUOTOPBMAubAzImlviVDkksSSnUcCH/jRH
 gIvBKhbpk5ffOrR45UdrXpoPqNl3GbbnTPu/cU+jPuvNssl6lFNDHGRq5M2fQmnfCu12
 kKeO12GRvlbtyslACWlLgk/7DJ+ZuzuaObrkiUYvhdV+D2ri3yDgjwVfZ9H1mD7ENDu2
 eEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FhK8RbzEFufb1iq23r34WkDiA3ShkcQ+NWfPmmVrVXU=;
 b=nlJKmMzZOPfAD+6mikUfLewDpTKeWCbceipOa8YgmtIkPdJoQMaqlnxcGvd+rfaxIM
 oBRP1WIzTUbj2FhH2HQoR0hKQG2XsuDWK6GmYZZla9wLYQUJ7VuL8xEJcJ2ooClpgTQB
 lekno/0N1mLpxqF8z/cHsfqe1jl4fKhc5UeVkUwU4kzHsk8OMXpUdBeHCVGeLfzXXbwt
 EU8QUBq92XJqQsR6mZ1xSSGuaUn3FUfITrARBg1a/2dVIo8vMCdu88ZnUGk1HVNaNPsz
 oatPjGWAgAma8vDTn17x7PLshMXPsrrRe+eRVcnP9tNl03NJT9a3X4+8EjF6UsFzH+Jw
 c5wg==
X-Gm-Message-State: AOAM530TPFcwKWg7T1rxGvz6vr9l5Ws2mOsND8PZIGF8DH0N+4zE1vp6
 thDNEnxIRbsGg7pBImRnqAu9nQvragYmU4hZFwglDQ==
X-Google-Smtp-Source: ABdhPJzJr4VKaZ6fUPmMjzvjy4dYPA9aicNSAbcb/S/zKks/wi2e7Sa6eRwgo1FFccyZiELw0Lh/FVI+KnbD45HqDNA=
X-Received: by 2002:a05:6102:10c7:: with SMTP id
 t7mr38820201vsr.44.1635964069759; 
 Wed, 03 Nov 2021 11:27:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-15-imp@bsdimp.com>
 <1e865859-b1bc-6e80-816f-da4858a8f2cd@linaro.org>
In-Reply-To: <1e865859-b1bc-6e80-816f-da4858a8f2cd@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 3 Nov 2021 12:27:38 -0600
Message-ID: <CANCZdfpF4Fq9f_0PHfC89dCokSmKw1=w3n3wQuZYEpEeDxJZCw@mail.gmail.com>
Subject: Re: [PATCH v2 14/30] bsd-user/arm/target_arch_thread.h: Routines to
 create and switch to a thread
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>, 
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, 
 Kyle Evans <kevans@freebsd.org>, Laurent Vivier <laurent@vivier.eu>,
 Stacey Son <sson@freebsd.org>, Olivier Houchard <cognet@ci0.org>
Content-Type: multipart/alternative; boundary="0000000000003e643805cfe69148"
Received-SPF: none client-ip=2607:f8b0:4864:20::92a;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92a.google.com
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
X-List-Received-Date: Wed, 03 Nov 2021 18:27:55 -0000

--0000000000003e643805cfe69148
Content-Type: text/plain; charset="UTF-8"

[[ Adding Olivier Houchard to confirm my reading of the ARM init twisty
maze of code ]]
On Tue, Nov 2, 2021 at 9:31 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 11/2/21 6:52 PM, Warner Losh wrote:
> > +    /*
> > +     * Thumb mode is encoded by the low bit in the entry point (since
> ARM can't
> > +     * execute at odd addresses). When it's set, set the Thumb bit (T)
> in the
> > +     * CPSR.
> > +     */
> > +    if (entry & 0x1) {
> > +        cpsr_write(env, cpsr_read(env) | CPSR_T, CPSR_T,
> CPSRWriteByInstr);
> > +    }
>
> This should be
>
>    cpsr_write(env, (entry & 1) * CPSR_T, CPSR_T, CPSRWriteByInstr);
>
> because you need to clear T for arm mode as well.
>

Ah. Right. I'd intended to fix this, but it slipped my mind (along with the
other T bit thing you told me about).


> > +    /* FIXME - what to for failure of get_user()? */
> > +    get_user_ual(regs->ARM_r2, stack + 8); /* envp */
> > +    get_user_ual(regs->ARM_r1, stack + 4); /* envp */
>
> Surely these values are present in image_info anyway?
>

The host versions are in image_info, but the target versions are not.
Linux-user does a similar
thing without the #define sugar form ARM_rX. I didn't see where the current
bsd-user squirrels
this information away (it's computed and stored in local variables), nor
did my much more
brief look at linux-user.

Looking at the FreeBSD kernel, though, we don't set r1 or r2. r0 and r1 are
set to 0 explicitly,
and r2 is set to 0 because the first user registers are all cleared. In the
static case, they
are ignored (since r0 = ps_strings, r1 = obj_main (unused) and r2 = cleanup
(also
unused in the static case). If we're entering via the dynamic loader, it
saves r0 and generates
r1 (though it's ultimately unused) and r2 (which rtld sets to its cleanup
routine). r0 is the ps
strings that ps displays, so isn't relevant to emulation.

tl;dr: I'll add a comment to that effect and make it simpler (assuming my
analysis survives)

Warner

--0000000000003e643805cfe69148
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div>[[ Adding Olivier Houchard to c=
onfirm my reading of the ARM init twisty maze of code ]]<br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 2, 2021 at 9:=
31 PM Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org"=
>richard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On 11/2/21 6:52 PM, Warner Losh wrote:<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Thumb mode is encoded by the low bit in the ent=
ry point (since ARM can&#39;t<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* execute at odd addresses). When it&#39;s set, s=
et the Thumb bit (T) in the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* CPSR.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if (entry &amp; 0x1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpsr_write(env, cpsr_read(env) | CPSR_T, =
CPSR_T, CPSRWriteByInstr);<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
This should be<br>
<br>
=C2=A0 =C2=A0cpsr_write(env, (entry &amp; 1) * CPSR_T, CPSR_T, CPSRWriteByI=
nstr);<br>
<br>
because you need to clear T for arm mode as well.<br></blockquote><div><br>=
</div><div>Ah. Right. I&#39;d intended to fix this, but it slipped my mind =
(along with the other T bit thing you told me about).</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 /* FIXME - what to for failure of get_user()? */<br>
&gt; +=C2=A0 =C2=A0 get_user_ual(regs-&gt;ARM_r2, stack + 8); /* envp */<br=
>
&gt; +=C2=A0 =C2=A0 get_user_ual(regs-&gt;ARM_r1, stack + 4); /* envp */<br=
>
<br>
Surely these values are present in image_info anyway?<br></blockquote><div>=
<br></div><div>The host versions are in image_info, but the target versions=
 are not.=C2=A0 Linux-user does a similar</div><div>thing without the #defi=
ne sugar form ARM_rX. I didn&#39;t see where the current bsd-user squirrels=
</div><div>this information away (it&#39;s computed and stored in local var=
iables), nor did my much more</div><div>brief look at linux-user.=C2=A0</di=
v><div><br></div><div>Looking at the FreeBSD kernel, though, we don&#39;t s=
et r1 or r2. r0 and r1 are set to 0 explicitly,</div><div>and r2 is set to =
0 because the first user registers are all cleared. In the static case, the=
y</div><div>are ignored (since r0 =3D ps_strings, r1 =3D obj_main (unused) =
and r2 =3D cleanup (also</div><div>unused in the static case). If we&#39;re=
 entering via the dynamic loader, it saves r0 and generates</div><div>r1 (t=
hough it&#39;s ultimately unused) and r2 (which rtld sets to its cleanup ro=
utine). r0 is the ps</div><div>strings that ps displays, so isn&#39;t relev=
ant to emulation.</div><div><br></div><div>tl;dr: I&#39;ll add a comment to=
 that effect and make it simpler (assuming my analysis survives)</div><div>=
<br></div><div>Warner<br></div></div></div>

--0000000000003e643805cfe69148--

