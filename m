Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgDnh-0000sp-15
	for mharc-qemu-trivial@gnu.org; Thu, 28 Oct 2021 18:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mgDne-0000q3-8V
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 18:23:07 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936]:44887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mgDnc-0006rX-MK
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 18:23:06 -0400
Received: by mail-ua1-x936.google.com with SMTP id e5so14412546uam.11
 for <qemu-trivial@nongnu.org>; Thu, 28 Oct 2021 15:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QnOE0dZ9XP4k5qtjrAhDoxkDYkgNQ1pnZpuVm1RstEo=;
 b=IuO9fgzWsxVGzX98+tlqpoRjDAWRVU538G5MZ6Fln0xHvvsSItAP83P8Vgrdql+66g
 FzBMPGMkSB72DNeA4Y0/5bVzwcvP6B8fs1cKuWXebEw+/0hV+N8Det2OV6iubxlN1oaU
 o1tWfU2Sf/jF88VCRcM7+t3YmmgxkYThKGMk1CvRrEg8Rfdjch0HikRM5NNl5IH4vswf
 WU5FllWsYHzj0uKHSGGsmdWScbq5zDFvu8ZYYJAwThP9e5sBEPqtwYHDw7pkp7qIxS0d
 hXj28C7/GLnqBa7D3H2e4bFvgw5x5aUX5GvMjlL/pp8QLMjGnwnSL/N/OuEr7t3L6u0l
 k6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QnOE0dZ9XP4k5qtjrAhDoxkDYkgNQ1pnZpuVm1RstEo=;
 b=Rhckm4WOXkP1x+bl15VAfWJjjE3C0tUuAPR4mFWh37o/hhyb1xZImKlPIK2aDtsO8q
 h3HIYFaiFKwvOkgWbBJES5DJK6jTNaEfqaGAs43AiZmqZ8zlXowAdfmndmXlTQYuSbUC
 TMH9ii4CFI9xtjii3lCBKI8XKjxr9/y7f3YCfMP/TM6iVxJP5eq9rc6XherFT1FBN5qt
 sZrNdX9V+MGQ1vQaO9bed+c//wlLPF1ar2jsxXJI1GiyFJs/QehlDhB4AffiAhuCd2kQ
 Cfc5tHsIkuS5KQxBXHugasdjTNUQzy92weCiR22SjN1mD4d3ku5j7PfxnzJphdv70L1s
 9HAA==
X-Gm-Message-State: AOAM531jQk/Cg6Z5fQgxdZ+jHyGcbSAHO7eF0puTd4gIxzp5lCBSY9C8
 TthkcvcSWDw178oUU/tvQMTW+70Q+QF3RMtSyQ+i9A==
X-Google-Smtp-Source: ABdhPJx2eDbAXCbLv2fUuyof1f1L3N5MvYkddi7fShYSJpLRXIGi5tUWxxBlZC2sHjHfxumgMsx8lkfYOwubbBLSn1M=
X-Received: by 2002:a05:6102:5494:: with SMTP id
 bk20mr8633685vsb.6.1635459783380; 
 Thu, 28 Oct 2021 15:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-21-imp@bsdimp.com>
 <446e589d-7c49-f5fc-3891-195ba5a37c0f@linaro.org>
 <CACNAnaFr1Mg5OTivWMLhN=fNy8MB284aRRGBub9vA=-1bHbFeQ@mail.gmail.com>
In-Reply-To: <CACNAnaFr1Mg5OTivWMLhN=fNy8MB284aRRGBub9vA=-1bHbFeQ@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 28 Oct 2021 16:22:52 -0600
Message-ID: <CANCZdfq7BovMCbQ6c2kQ3j2P7Aacj-tJjxayPrggMD00i4Xhcw@mail.gmail.com>
Subject: Re: [PATCH 20/24] bsd-user/arm/target_arch_signal.h: arm
 set_sigtramp_args
To: Kyle Evans <kevans@freebsd.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Stacey Son <sson@freebsd.org>, QEMU Trivial <qemu-trivial@nongnu.org>, 
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="0000000000006ee70d05cf712797"
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
X-List-Received-Date: Thu, 28 Oct 2021 22:23:07 -0000

--0000000000006ee70d05cf712797
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 28, 2021 at 11:35 AM Kyle Evans <kevans@freebsd.org> wrote:

> On Thu, Oct 28, 2021 at 12:25 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 10/19/21 9:44 AM, Warner Losh wrote:
> > > +    regs->regs[TARGET_REG_PC] = ka->_sa_handler;
> >
> > Surely there should be some handling of thumb addresses here.
> >
>
> Honestly, this wouldn't surprise me- we're kind of a thumb landmine.
> The other thumb-ish support is relatively recent as we hit something
> that had an entry point on a thumb instruction; but we don't typically
> build/run binaries including thumb instructions.
>

Yes. We don't have good, extensive test cases for this. We likely should.

Warner

--0000000000006ee70d05cf712797
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 28, 2021 at 11:35 AM Kyle=
 Evans &lt;<a href=3D"mailto:kevans@freebsd.org">kevans@freebsd.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, =
Oct 28, 2021 at 12:25 PM Richard Henderson<br>
&lt;<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank">richa=
rd.henderson@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On 10/19/21 9:44 AM, Warner Losh wrote:<br>
&gt; &gt; +=C2=A0 =C2=A0 regs-&gt;regs[TARGET_REG_PC] =3D ka-&gt;_sa_handle=
r;<br>
&gt;<br>
&gt; Surely there should be some handling of thumb addresses here.<br>
&gt;<br>
<br>
Honestly, this wouldn&#39;t surprise me- we&#39;re kind of a thumb landmine=
.<br>
The other thumb-ish support is relatively recent as we hit something<br>
that had an entry point on a thumb instruction; but we don&#39;t typically<=
br>
build/run binaries including thumb instructions.<br></blockquote><div><br><=
/div><div>Yes. We don&#39;t have good, extensive test cases for this. We li=
kely should.</div><div><br></div><div>Warner</div></div></div>

--0000000000006ee70d05cf712797--

