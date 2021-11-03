Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1miLqg-0002wW-C2
	for mharc-qemu-trivial@gnu.org; Wed, 03 Nov 2021 15:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1miLqf-0002uz-Kq
 for qemu-trivial@nongnu.org; Wed, 03 Nov 2021 15:23:01 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e]:42936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1miLqV-00065L-Ea
 for qemu-trivial@nongnu.org; Wed, 03 Nov 2021 15:23:01 -0400
Received: by mail-ua1-x92e.google.com with SMTP id v20so6398677uaj.9
 for <qemu-trivial@nongnu.org>; Wed, 03 Nov 2021 12:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KWR6cUhD5tvp8iBgoP7hUN6nEfFYm1R7MPe+ONKOQ9Q=;
 b=ybmsjw5lThWkaBE7p0I/JOAoD45Gqo7NzcEWI99z+pigY+vchEx7Q30x1/0PBcndkR
 Ui2cHby+wLtyaOcJN/dg4x6hdgzyUA7A30LW0g04rSktStMBsi7SlS4Kytr3VX5ZnOsb
 LUHRmzQxs3F0ZTtaSgyA7OABSrjfDM5oMo7wqilxklGfjQ4usOpVpPHMlHzdCFR2/6Pd
 rrgLpse5gDigkpxXgdMW4IAmiYV5AphVhmeFv/gmnygxUlKKV3uFYYTB7qMJpOq//TYA
 MSLnVWUtX7Qt9MK5JCMRRrukU6HEyl1Z5EAv01qvBOURfluvntjIwKRsYQHt01YQGX6T
 fuiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KWR6cUhD5tvp8iBgoP7hUN6nEfFYm1R7MPe+ONKOQ9Q=;
 b=wHKFdXStBCkp3wlcXhHFME9EQEQPzJ+LbJPV+QaqME09znYqCoJknl/NH1Wu6zrIBT
 pQ325zio5FQCwvwwNWsWHWwINfBLOVz1a/dhMQzCpyXXjpKeGj0fjcagvaLSm2GYpSWI
 f43V91BhfsbE+zEIUr4wd+zYIqScGdO2JFHCcqlCPtjaeId+61+4753uWOTlYKfgfRw/
 vH/N8gNjqZ6VKmrq5ub6TrtZoPW+k+fOvvjg08vmPJ3ANaborr1LenIgelSmY0T8g8mn
 cbMwc+dcXACD/dWUAbRW3ike0F5nbUvlsxQJ/3MbiSOeN5UqB94MYU8x6+T//D9tO0q/
 vTvg==
X-Gm-Message-State: AOAM530iTTkuPofj5FgrmjxpR6SYlYRiX38PDHjO/t4nBsATs7H08ebj
 5WnUYHIEJjvzmJ9TyxpzaQfhWAOMjcMACQU1Mp/W2g==
X-Google-Smtp-Source: ABdhPJz4SwbBH9XdattJXBEc3yJ/R/Ae35fw2PgycP27pTPZzy4kl29cmDIcDs1eFSfgIgOZrJubFPS9tolaIWxzidw=
X-Received: by 2002:a67:ab48:: with SMTP id k8mr54303857vsh.30.1635967370240; 
 Wed, 03 Nov 2021 12:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-27-imp@bsdimp.com>
 <fc347f04-cf78-0b30-b0c4-911e3281e6d1@linaro.org>
In-Reply-To: <fc347f04-cf78-0b30-b0c4-911e3281e6d1@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 3 Nov 2021 13:22:39 -0600
Message-ID: <CANCZdfr1VteFw0giYW5poc4v3-3L0zd_MtQok8d8De60B79v=g@mail.gmail.com>
Subject: Re: [PATCH v2 26/30] bsd-user: add arm target build
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>, 
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, 
 Kyle Evans <kevans@freebsd.org>, Laurent Vivier <laurent@vivier.eu>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f7bc6a05cfe755b6"
Received-SPF: none client-ip=2607:f8b0:4864:20::92e;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92e.google.com
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
X-List-Received-Date: Wed, 03 Nov 2021 19:23:02 -0000

--000000000000f7bc6a05cfe755b6
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 2, 2021 at 9:47 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 11/2/21 6:52 PM, Warner Losh wrote:
> > CC: Paolo Bonzini <pbonzini@redhat.com>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > Acked-by: Kyle Evans <kevans@FreeBSD.org>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >   configs/targets/arm-bsd-user.mak | 2 ++
> >   1 file changed, 2 insertions(+)
> >   create mode 100644 configs/targets/arm-bsd-user.mak
> >
> > diff --git a/configs/targets/arm-bsd-user.mak
> b/configs/targets/arm-bsd-user.mak
> > new file mode 100644
> > index 0000000000..90b6533195
> > --- /dev/null
> > +++ b/configs/targets/arm-bsd-user.mak
> > @@ -0,0 +1,2 @@
> > +TARGET_ARCH=arm
> > +TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml
> gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml
> gdb-xml/arm-m-profile.xml
> >
>
> Note that we just added one more xml file for m-profile mve.
>

Added. Will include in next update. Thanks!

Warner

--000000000000f7bc6a05cfe755b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 2, 2021 at 9:47 PM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 11/2/21 6:52 PM, Warner Losh wrote:<br>
&gt; CC: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D=
"_blank">pbonzini@redhat.com</a>&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; Acked-by: Kyle Evans &lt;kevans@FreeBSD.org&gt;<br>
&gt; Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson=
@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0configs/targets/arm-bsd-user.mak | 2 ++<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 configs/targets/arm-bsd-user.mak<br>
&gt; <br>
&gt; diff --git a/configs/targets/arm-bsd-user.mak b/configs/targets/arm-bs=
d-user.mak<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..90b6533195<br>
&gt; --- /dev/null<br>
&gt; +++ b/configs/targets/arm-bsd-user.mak<br>
&gt; @@ -0,0 +1,2 @@<br>
&gt; +TARGET_ARCH=3Darm<br>
&gt; +TARGET_XML_FILES=3D gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/=
arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m=
-profile.xml<br>
&gt; <br>
<br>
Note that we just added one more xml file for m-profile mve.<br></blockquot=
e><div><br></div><div>Added. Will include in next update. Thanks!</div><div=
><br></div><div>Warner=C2=A0</div></div></div>

--000000000000f7bc6a05cfe755b6--

