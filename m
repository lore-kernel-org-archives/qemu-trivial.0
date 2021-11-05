Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mj2Lc-0004CL-2z
	for mharc-qemu-trivial@gnu.org; Fri, 05 Nov 2021 12:45:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mj2LY-00042A-8T
 for qemu-trivial@nongnu.org; Fri, 05 Nov 2021 12:45:45 -0400
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b]:39830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mj2LW-0005FB-7Z
 for qemu-trivial@nongnu.org; Fri, 05 Nov 2021 12:45:43 -0400
Received: by mail-vk1-xa2b.google.com with SMTP id 84so3043029vkc.6
 for <qemu-trivial@nongnu.org>; Fri, 05 Nov 2021 09:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q/8rp2LoRZI5gkb8UlHjAdxZirsReviL7L2OAE09s5Y=;
 b=QCskA7eZ89qVJOA+T4Y31DqvpzwGHUyC3fBq5AhDXxzDJIdO5JxRH8RiiK/SfHj8C3
 Q3w2qivuPcVP76/aOqJu/2kttFAYwdE3If9l0d5Vc81XhheBHYR71EzoxSaclIjppnzP
 AxfowRMa/qE+X+SXuFuR/2G4LHX7brEQNKeroHElCLvzjHYryI3NRS5UvgEcTBdllns/
 MjU/txBTAeXhBGu4Nik4kp3nqm0zlAiqNzWzxMzyTKd48uF0l92ygbg+c/2PYUKtm0Mu
 /V88SakdLV2n+bwU40wm95J714aYRI7YnF9BKh/zvw6pHGiDb3jrXrIEouVlE7ySZFmr
 Mspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q/8rp2LoRZI5gkb8UlHjAdxZirsReviL7L2OAE09s5Y=;
 b=eFS65MA2g8R6+x2Huar49R6IQziB9kOLErWc1zUTAwX0g8hpKLDEV7wGBSJVS71xF+
 Ly9yw8/k4sQbHP8EFcb5WaDb+Omhac1ngffnhzdjXCpwbiVhGAicYDSpMm3vXgMiVv/f
 FqZ/hzDsuwoDsV90Pz96D+SAT/acnoNoOQEy9GkT9cc0f973A8EaE3Clt289q5X0d2Lp
 WJ7x3UVj8CFLOYkuaA6Sa6TV198iUlMSNtQFSA4C1fypjW/2casbrycH1A0QirCQWydk
 +JzJCFur3AH7kZXu97EjXaD/pixuDJt+ziMUu1r+COPos3exQfsN44D3Gbwfd82HZTX8
 HLRg==
X-Gm-Message-State: AOAM531VFtAlj3ECTcl053AKkeQnK44fQbMCweO10i1hWA99berCzUzy
 x/b0+zMwUbYEI2G9/uoM06HUWWf1AtvWXbGy7ntglQ==
X-Google-Smtp-Source: ABdhPJzqYkWplerq5RT2qYkgpbyH50RDHSHfJs8hR3gTmZdj7MSgVISUi2jzibu7k+zVvpgJYLdhHeaya7C9Wgss9no=
X-Received: by 2002:a05:6122:2092:: with SMTP id
 i18mr2371650vkd.18.1636130740475; 
 Fri, 05 Nov 2021 09:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211105031917.87837-1-imp@bsdimp.com>
 <20211105031917.87837-8-imp@bsdimp.com>
 <ba0e1487-ec74-1d8b-b371-c33ea9ca0d74@linaro.org>
In-Reply-To: <ba0e1487-ec74-1d8b-b371-c33ea9ca0d74@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 5 Nov 2021 10:45:29 -0600
Message-ID: <CANCZdfpwYPRb9mt7G3Oojx5BkfNHjtMFDZHeckzs0qhAepaJFw@mail.gmail.com>
Subject: Re: [PATCH v4 07/36] bsd-user/i386: Move the inlines into signal.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Laurent Vivier <laurent@vivier.eu>, 
 Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="00000000000097ab4c05d00d5fcd"
Received-SPF: none client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 05 Nov 2021 16:45:45 -0000

--00000000000097ab4c05d00d5fcd
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 5, 2021 at 10:21 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 11/4/21 11:18 PM, Warner Losh wrote:
> > +abi_long set_sigtramp_args(CPUX86State *env, int sig,
> > +                           struct target_sigframe *frame,
> > +                           abi_ulong frame_addr,
> > +                           struct target_sigaction *ka);
> > +abi_long get_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int
> flags);
> > +abi_long set_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int
> srflag);
> > +abi_long get_ucontext_sigreturn(CPUX86State *regs, abi_ulong target_sf,
> > +                                abi_ulong *target_uc);
> >
> >   #endif /* TARGET_ARCH_SIGNAL_H */
>
> You should use the CPUArchState typedef, instead of CPUX86State directly,
> and place these
> declarations in a shared header.
>

Will do! Thanks!


> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>

--00000000000097ab4c05d00d5fcd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 5, 2021 at 10:21 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 11/4/21 11:18 PM, Warner Losh wrote:<br>
&gt; +abi_long set_sigtramp_args(CPUX86State *env, int sig,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct target_sigframe *frame,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0abi_ulong frame_addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct target_sigaction *ka);<br>
&gt; +abi_long get_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int =
flags);<br>
&gt; +abi_long set_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int =
srflag);<br>
&gt; +abi_long get_ucontext_sigreturn(CPUX86State *regs, abi_ulong target_s=
f,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abi_ulong *target_uc);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#endif /* TARGET_ARCH_SIGNAL_H */<br>
<br>
You should use the CPUArchState typedef, instead of CPUX86State directly, a=
nd place these <br>
declarations in a shared header.<br></blockquote><div><br></div><div>Will d=
o! Thanks!</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
Otherwise,<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
</blockquote></div></div>

--00000000000097ab4c05d00d5fcd--

