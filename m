Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1miJ6s-0005wh-5X
	for mharc-qemu-trivial@gnu.org; Wed, 03 Nov 2021 12:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1miJ6q-0005vf-Ov
 for qemu-trivial@nongnu.org; Wed, 03 Nov 2021 12:27:32 -0400
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33]:46012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1miJ6p-0006Eu-2T
 for qemu-trivial@nongnu.org; Wed, 03 Nov 2021 12:27:32 -0400
Received: by mail-vk1-xa33.google.com with SMTP id n201so1561595vkn.12
 for <qemu-trivial@nongnu.org>; Wed, 03 Nov 2021 09:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M7oVTlu0XRsOE0lWHOyDmhq8RrB3gsvOi7Q1UiF8p0o=;
 b=cJ7vm1qGHHI4+zCaBgePf0LI4wqkO0kUDG33hEuaP94aGrXSTS+pLJx0paOxz3wJgR
 5MxZJ2tiX5/aAT325T+4G0mQ1qGYbZ2XX+U1wKgGShc8uYTZUzyhIWFKZjG8gYL6OuWr
 BiodPJUYsnKDgwEZzJ4L+kDQAJk7ATzLPty9eSHcfWAxhseIoyjndjJ+iQvIbEVAKZH3
 MJVrjPIL65jO6iDRxiKFCy88FWEnWwdB8Wk7mgL+HBZw7OVSNCtmwHti6D8mM8kxq3DN
 2nsfE3/oodFXj0BfV6n2bOE2/InAApqsBl/Bru78eHSW6INF5G3XUoe5H6a4z/3yJm+w
 2AlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M7oVTlu0XRsOE0lWHOyDmhq8RrB3gsvOi7Q1UiF8p0o=;
 b=d3Dda1OBXKFMBhiUreczCCujX0nhCZjBDThGHZoHHQHuAMo2sLZHvqfot2tO1bjhKV
 6PmBM0mPndk0I61tSEKZk+lsZkci3uUdB4lpo+4egXBqJ+FWPOwQiru79NYyjV94jiq1
 dvRyg3U1KZmOcH61Es2cIrYxhz8jrDEctvf7LBviIqZduRIKpMQ5fm80bmFCrFM8FDE7
 ZThlu3G37yR+l6u+h/0Zz68UMB8548xBVHCGmsWHABmeJMMV9q3vTeAffhoQqNb6ECAW
 n+Q/swq6OZbN/Tkjr9JN1L0154PC60B5Dqb0ep3GEgasbPjazlAea9T+js6LYg9AiWZ1
 YNNA==
X-Gm-Message-State: AOAM531ekDPXSx+ayxJMPdQ5vs4VtkCTqo585qcSdSUX3ad4fi8lvzuC
 5lcDZZy9pIsZ3upU2n6PApc6mRDTvuIYHnBZrPEaRg==
X-Google-Smtp-Source: ABdhPJytKQLhoosCDlzxxy3Az+b/WK+XLXOgN7xZY3W3grbB+DIi7KB5mo4KmXGOrcUCkCyd8bk3Ke2czshcMKH4fZo=
X-Received: by 2002:a05:6122:c92:: with SMTP id
 ba18mr19465914vkb.21.1635956849575; 
 Wed, 03 Nov 2021 09:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-9-imp@bsdimp.com>
 <17dd2e5a-3778-ccb2-7ae5-a59c18f17601@linaro.org>
In-Reply-To: <17dd2e5a-3778-ccb2-7ae5-a59c18f17601@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 3 Nov 2021 10:27:18 -0600
Message-ID: <CANCZdfo_rzFTGxrjsOh=dKB=JAVR2Ghpo3fFBowADs_Lc2J5SA@mail.gmail.com>
Subject: Re: [PATCH v2 08/30] bsd-user/arm/target_arch_cpu.h: Implement
 trivial EXCP exceptions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>, 
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, 
 Kyle Evans <kevans@freebsd.org>, Laurent Vivier <laurent@vivier.eu>,
 Stacey Son <sson@freebsd.org>, 
 =?UTF-8?Q?Mika=C3=ABl_Urankar?= <mikael.urankar@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e32ea805cfe4e231"
Received-SPF: none client-ip=2607:f8b0:4864:20::a33;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa33.google.com
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
X-List-Received-Date: Wed, 03 Nov 2021 16:27:32 -0000

--000000000000e32ea805cfe4e231
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 2, 2021 at 9:17 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 11/2/21 6:52 PM, Warner Losh wrote:
> > +        case EXCP_UDEF:
> > +            {
> > +                /* See arm/arm/undefined.c undefinedinstruction(); */
> > +                info.si_addr = env->regs[15];
> > +
> > +                /*
> > +                 * Make sure the PC is correctly aligned. (It should
> > +                 * be.)
> > +                 */
> > +                if ((info.si_addr & 3) != 0) {
> > +                    info.si_signo = TARGET_SIGILL;
> > +                    info.si_errno = 0;
> > +                    info.si_code = TARGET_ILL_ILLADR;
> > +                    queue_signal(env, info.si_signo, &info);
>
> You won't need this; unaligned pc will raise a different exception.
>

Dropped.


> > +                } else {
> > +                    int rc = 0;
> > +#ifdef NOT_YET
> > +                    uint32_t opcode;
> > +
> > +                    /*
> > +                     * Get the opcode.
> > +                     *
> > +                     * FIXME - what to do if get_user() fails?
> > +                     */
> > +                    get_user_u32(opcode, env->regs[15]);
> > +
> > +                    /* Check the opcode with CP handlers we may have. */
> > +                    rc = EmulateAll(opcode, &ts->fpa, env);
> > +#endif /* NOT_YET */
>
> Drop this til you need it.  Even then, we prefer to emulate all insns in
> the front-end.
> We can talk about what changes need to happen such that the actual CP
> registers are simply
> available at EL0.  I suspect they've already been done for linux-user
> anyway...
>

Dropped, reformatted and added a TODO comment.

Both will be in the next spin.

Thanks!

Warner

--000000000000e32ea805cfe4e231
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 2, 2021 at 9:17 PM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 11/2/21 6:52 PM, Warner Losh wrote:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case EXCP_UDEF:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* See arm/ar=
m/undefined.c undefinedinstruction(); */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.si_addr =
=3D env-&gt;regs[15];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Make =
sure the PC is correctly aligned. (It should<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* be.)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((info.si_=
addr &amp; 3) !=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 info.si_signo =3D TARGET_SIGILL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 info.si_errno =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 info.si_code =3D TARGET_ILL_ILLADR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 queue_signal(env, info.si_signo, &amp;info);<br>
<br>
You won&#39;t need this; unaligned pc will raise a different exception.<br>=
</blockquote><div><br></div><div>Dropped.</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 int rc =3D 0;<br>
&gt; +#ifdef NOT_YET<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 uint32_t opcode;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0* Get the opcode.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0* FIXME - what to do if get_user() fails?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 get_user_u32(opcode, env-&gt;regs[15]);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 /* Check the opcode with CP handlers we may have. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 rc =3D EmulateAll(opcode, &amp;ts-&gt;fpa, env);<br>
&gt; +#endif /* NOT_YET */<br>
<br>
Drop this til you need it.=C2=A0 Even then, we prefer to emulate all insns =
in the front-end. <br>
We can talk about what changes need to happen such that the actual CP regis=
ters are simply <br>
available at EL0.=C2=A0 I suspect they&#39;ve already been done for linux-u=
ser anyway...<br></blockquote><div><br></div><div>Dropped, reformatted and =
added a TODO comment.</div><div><br></div><div>Both will be in the next spi=
n.</div><div><br></div><div>Thanks!</div><div><br></div><div>Warner=C2=A0</=
div></div></div>

--000000000000e32ea805cfe4e231--

