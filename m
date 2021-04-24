Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1laQzr-0004WA-Ex
	for mharc-qemu-trivial@gnu.org; Sat, 24 Apr 2021 18:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1laQzp-0004ST-PH
 for qemu-trivial@nongnu.org; Sat, 24 Apr 2021 18:43:29 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:43758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1laQzl-0002Sg-EK
 for qemu-trivial@nongnu.org; Sat, 24 Apr 2021 18:43:29 -0400
Received: by mail-qk1-x72e.google.com with SMTP id u20so20997425qku.10
 for <qemu-trivial@nongnu.org>; Sat, 24 Apr 2021 15:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lGKEH25oXZhV/wB7tTCMsqzbq40wd9v4aa9d7Z6HulE=;
 b=C2yLjdFKwDLAbE/+0tY9lJn2cIodcZusgnzrwgYqAxXtToFaQ1viueFfNc1OwTwidK
 UUo0Vl/UGuOYzhsIKQ8avdVZKemvYfCGRZ3o3g4/Az0EbZWlvG7Rz/YEG+iMB4K7L7l+
 +RPA/q2DgAN5e4iPdmKwGWYI229VMX7hfQEOJ3/sySAYpu2oiPdWmG4/SkMtWSsMf8yO
 ksMwa7ze4IPxqLGLdYWrLjLY7fnYlseUKRvfYLqOivG7driDXv8rc7ah428c6IyQ36nt
 rlPe4n6vuKb+LUsv4LvZckMxNV0Lgu5kQXqQ8ZwLpIbqSCMvGBvCZZv6ugwU70NazUgc
 nynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lGKEH25oXZhV/wB7tTCMsqzbq40wd9v4aa9d7Z6HulE=;
 b=JBFq74DeJ9tJQx8KoByu9Ax+J3QiAreO+gKRhjM9ygg0vqsROlfex2mxWOxrLez8Oo
 4Mli8LCqvpnwIZ3KqiZDLg49VWPz3mKpFHgFx/nm4KKmlouF7V+lPADIglG6Q6GDSQpr
 dHLZJ0kUf07YZ7ycHxjVNynITD7jOusje+TWqimqSDC5gSzzrGmpnADDfLuRui3SeRBP
 9tjkegGc0+OJdXnV66823UH/JrvwoR1RoR53M7wj4tDSE5sLEcZ9AOJ7oCgT1g19clMn
 jxshPvUY4J1f4qv9vLKdb7xfdSx4Jddfs+hG7U8WA69Tfy+jMgVDBPyZ1r2ApdClyExX
 UuUw==
X-Gm-Message-State: AOAM530wEIxT+yxE9hT9ptpsHR+QhuB1PdpvPi7vkSbdAajIyA0jodwE
 ziLIYNJusmNFvrSU0B3j7ejcM730ASHEbRowVh0vnw==
X-Google-Smtp-Source: ABdhPJw21XODWSX8YuejIrdwmNdhWmyYI5Cwo0RBURxUc0q8rh1+ksWx57DYztG6Pf3fmy3b8Zcb+AGWYkGMiMm05ho=
X-Received: by 2002:a05:620a:242:: with SMTP id
 q2mr10195929qkn.206.1619304203838; 
 Sat, 24 Apr 2021 15:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210424222057.3434459-1-f4bug@amsat.org>
 <20210424222057.3434459-2-f4bug@amsat.org>
In-Reply-To: <20210424222057.3434459-2-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 24 Apr 2021 16:43:13 -0600
Message-ID: <CANCZdfqOpg4yGseP72MtsgpcMNQ8G_BVzEpBAdmww2NK4vFz9A@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/arm/pxa2xx: Declare PCMCIA bus with Kconfig
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm@nongnu.org, 
 Miroslav Rezanina <mrezanin@redhat.com>, John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000da79b705c0bfa39f"
Received-SPF: none client-ip=2607:f8b0:4864:20::72e;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x72e.google.com
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
X-List-Received-Date: Sat, 24 Apr 2021 22:43:30 -0000

--000000000000da79b705c0bfa39f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 24, 2021 at 4:22 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> The Intel XScale PXA chipsets provide a PCMCIA controller,
> which expose a PCMCIA (IDE) bus. Express this dependency using
> the Kconfig 'select' expression.
>

I'd consider dropping the (IDE) in the description of the PCMCIA
bus since I think it's more confusing than helpful...

Reviewed-by: Warner Losh <imp@bsdimp.com>


> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 8c37cf00da7..b887f6a5b17 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -142,6 +142,7 @@ config PXA2XX
>      select SD
>      select SSI
>      select USB_OHCI
> +    select PCMCIA
>
>  config GUMSTIX
>      bool
> --
> 2.26.3
>
>
>

--000000000000da79b705c0bfa39f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Sat, Apr 24, 2021 at 4:22 PM Philippe Mathieu-=
Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The Intel =
XScale PXA chipsets provide a PCMCIA controller,<br>
which expose a PCMCIA (IDE) bus. Express this dependency using<br>
the Kconfig &#39;select&#39; expression.<br></blockquote><div><br></div><di=
v>I&#39;d consider dropping the (IDE) in the description of the PCMCIA</div=
><div>bus since I think it&#39;s more confusing than helpful...</div><div><=
br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com=
">imp@bsdimp.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0hw/arm/Kconfig | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig<br>
index 8c37cf00da7..b887f6a5b17 100644<br>
--- a/hw/arm/Kconfig<br>
+++ b/hw/arm/Kconfig<br>
@@ -142,6 +142,7 @@ config PXA2XX<br>
=C2=A0 =C2=A0 =C2=A0select SD<br>
=C2=A0 =C2=A0 =C2=A0select SSI<br>
=C2=A0 =C2=A0 =C2=A0select USB_OHCI<br>
+=C2=A0 =C2=A0 select PCMCIA<br>
<br>
=C2=A0config GUMSTIX<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
-- <br>
2.26.3<br>
<br>
<br>
</blockquote></div></div>

--000000000000da79b705c0bfa39f--

