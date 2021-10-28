Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgBLP-00074W-17
	for mharc-qemu-trivial@gnu.org; Thu, 28 Oct 2021 15:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mgBLN-00074D-1S
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 15:45:45 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929]:33752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mgBLK-0002iA-FS
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 15:45:44 -0400
Received: by mail-ua1-x929.google.com with SMTP id b17so3637156uas.0
 for <qemu-trivial@nongnu.org>; Thu, 28 Oct 2021 12:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3+pL1XmQgmhUFeruTvarPhQQa3yjl2yV/lnlAjVn+wI=;
 b=dYaTuOkwBASxKHxc0WN/O0vDwLpqYiCAqs3sVkOuetXBExy34v2NsINl5M0h5nqDZf
 ZHbJOUTXRH7Y69t/FyShrWifDQil2+CRHFmgK+zhz6rlWUTVF1qYRWdb87/I7TleR5IL
 I64ATAxVaSak61d7Q09tZ7aIWveNjkPAqa4gDl+UzZxxBbXoIvkay796rF16XN10mPS4
 YKukpo47qAWb6OqB+zWTnsD26O+xr/KmwSRb8aWA80HNQV0VAKAILqcWeUqjiVzrY/Wz
 LoFIjeLmxXM8bN0cH0qlMJ9970EepIJG1aqj29G76xNo+Qqqqdj+7hw2obYDzzZsiuKU
 iTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3+pL1XmQgmhUFeruTvarPhQQa3yjl2yV/lnlAjVn+wI=;
 b=SK5vsYd3F3lT1UbymamH4KkJBU2JkosOQLSjJdZ6ti+mzpYnGSghnIxIe/MNweAKax
 qIpbuzmOtw7GD6rHQkUBjBr5upXHzXvlq45CIj7H+ddMkVBaawBPstl+rm7DgviZ6a3U
 itG3qReT0/gv0Lgbd599OlQUZiuEJBrhoTA41npD13nkujxOGVdZZtRaaK4mCwSttpvA
 jNZ/zD/KecAnJL+79wyoTARP/gnsoBaFLeUbWONgapMSo24iwEZ1RbxcFWs6CwNnfXXx
 4RhkFHbe6oaeLlt5dQj4dR+GlchhioH0JtnaaUjRNMbcoPXw6R8WRxCX0/obdXBseNPg
 ssEA==
X-Gm-Message-State: AOAM5333w0YpgqhM4PB1r5GX6TyhN27h9x0JpTcqeJfJ074FoZxAwsG/
 0CpDT2+wOG6kJAmGfwPnNEbWMDsWgNbEI/w0dKGsuA==
X-Google-Smtp-Source: ABdhPJyI0m6vMcpMFfAc0bq5d9QyFvxV3X3Dqpv8VKf9Ivajg+M4T0Ryi0zWAwmiVbWna978+uFLkd4MAElG1dJ6syQ=
X-Received: by 2002:ab0:6f4b:: with SMTP id r11mr6862005uat.39.1635450340323; 
 Thu, 28 Oct 2021 12:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-14-imp@bsdimp.com>
 <a7bd5ecc-8949-c7ae-6af7-9494eace94e0@linaro.org>
In-Reply-To: <a7bd5ecc-8949-c7ae-6af7-9494eace94e0@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 28 Oct 2021 13:45:29 -0600
Message-ID: <CANCZdfqmiH0V+TLzNY0tL4_DHUXkYLJwOn-UtNvHdjrZcWarBA@mail.gmail.com>
Subject: Re: [PATCH 13/24] bsd-user/arm/target_arch_thread.h: Routines to
 create and switch to a thread
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Stacey Son <sson@freebsd.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Klye Evans <kevans@freebsd.org>, 
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="00000000000095418705cf6ef45b"
Received-SPF: none client-ip=2607:f8b0:4864:20::929;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x929.google.com
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
X-List-Received-Date: Thu, 28 Oct 2021 19:45:45 -0000

--00000000000095418705cf6ef45b
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 28, 2021 at 9:57 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 10/19/21 9:44 AM, Warner Losh wrote:
> > +    regs->spsr = ARM_CPU_MODE_USR;
> > +    if (entry & 0x1) {
> > +        regs->spsr |= CPSR_T;
> > +    }
>
> (1) Why are you setting SPSR not CPSR?
>

I think dyslexia is the best answer... I think I added that based on a
recent
FreeBSD kernel change and I'm not sure what happened....


> (2) Changes to CPSR cannot be made manually; you need cpsr_write.
>

So would

+        cpsr_write(env, cpsr_read(env) | CPSR_T, CPSR_T, CPSRWriteByInstr);

cover what's needed here?

Warner

r~
>

--00000000000095418705cf6ef45b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 28, 2021 at 9:57 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 10/19/21 9:44 AM, Warner Losh wrote:<br>
&gt; +=C2=A0 =C2=A0 regs-&gt;spsr =3D ARM_CPU_MODE_USR;<br>
&gt; +=C2=A0 =C2=A0 if (entry &amp; 0x1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 regs-&gt;spsr |=3D CPSR_T;<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
(1) Why are you setting SPSR not CPSR?<br></blockquote><div><br></div><div>=
I think dyslexia is the best answer... I think=C2=A0I added that based on a=
 recent</div><div>FreeBSD kernel change and I&#39;m not sure what happened.=
...</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
(2) Changes to CPSR cannot be made manually; you need cpsr_write.<br></bloc=
kquote><div><br></div><div>So would=C2=A0</div><div><br></div><div>+ =C2=A0=
 =C2=A0 =C2=A0 =C2=A0cpsr_write(env, cpsr_read(env) | CPSR_T, CPSR_T, CPSRW=
riteByInstr);<br></div><div><br></div><div>cover what&#39;s needed here?</d=
iv><div><br></div><div>Warner=C2=A0</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
r~<br>
</blockquote></div></div>

--00000000000095418705cf6ef45b--

