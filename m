Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1laR2C-0006i5-1p
	for mharc-qemu-trivial@gnu.org; Sat, 24 Apr 2021 18:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1laR2A-0006h3-Ad
 for qemu-trivial@nongnu.org; Sat, 24 Apr 2021 18:45:54 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:45009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1laR28-00041y-CN
 for qemu-trivial@nongnu.org; Sat, 24 Apr 2021 18:45:54 -0400
Received: by mail-qt1-x82c.google.com with SMTP id y12so39022027qtx.11
 for <qemu-trivial@nongnu.org>; Sat, 24 Apr 2021 15:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U5cNZbB+ER3qv7WswsRcjI+rSC/1DqR3eFpI95g9OAE=;
 b=FBN5U9Ja/zBTcY/XpVrDTmG5u+/1in4AlrhJFPML9LePS+ctEJDzaz2aVa68WivUIR
 EBEEumAvBenciTdBvOf1HGmziOangh/f7ez5DS+TT5WRwCCTAeEOzArK145yR7/iDWcZ
 YUeF5+fJv10cddXL7D8isR8QRw4VI8g6KB6ddwCbZXyMURQ2RlLCaRd/uDbnqQHTWA/W
 yn7eNC8FQjz+k1gICe9UOls0WtP4raHYGOXDWufMMv+Y+JZHLPs029azigtTNq+zmXwu
 dL77xzeeBXPZS7lmFXJcCAo9hnQuMZ6ZFYeRtSKydmZ3c0zWL4/xxXef7DGGFz3ho2Yu
 2SRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U5cNZbB+ER3qv7WswsRcjI+rSC/1DqR3eFpI95g9OAE=;
 b=NY4VjdLNDky1JXCSJMp4z+G2EoybT1Jc8z0RWpeM91WybVTSeXHVnr6+tBzsGs8JgR
 g7xtk5dZJZ1gK2TbUWgc2Kt/N7Ym2F1/eu16JFwdDv/QDHBO0sqbi8qX4ltYfAITyIio
 NRq5Ko2gMk8S/NTfZXWpFAqRlY5IyW/pNWuSIR3VitPPKFJW40scb74IbwZmujasrfx3
 eTxZAvR4acqPLKnaFrKO8jOUVxHNcKBodxDDKjoBRZt6JrultX93netbh1+XX0ULNmLk
 SpYPPvQIjQL/HAsAopF4jL9Zi+OkKoxtLGyXQQQ0o0F5YwODY5xBg8Q0D8mQ2ZtC71qK
 T4fQ==
X-Gm-Message-State: AOAM530jHzMQooU72hmFGVd4EErNNdnSONz9jcFN/yO3PD5erFnixZX1
 ewWyFey4DYdJxTRKuh+63tdEzbCgoyl3XJe+LlEEow==
X-Google-Smtp-Source: ABdhPJyHrceGJ/+HZQAGkRLGiNyv9VBeR+aL15ASOfxerV9UnzXUHvb2cUhavV33rk2k1IhHepij5I+47thrLzCxs0o=
X-Received: by 2002:a05:622a:3c8:: with SMTP id
 k8mr9805643qtx.101.1619304351178; 
 Sat, 24 Apr 2021 15:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210424222057.3434459-1-f4bug@amsat.org>
 <20210424222057.3434459-3-f4bug@amsat.org>
In-Reply-To: <20210424222057.3434459-3-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 24 Apr 2021 16:45:40 -0600
Message-ID: <CANCZdfrjnOj=sLe9ivMAcqonQVKTacyct3C9ffazJsWAYBx_NQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/ide: Add Kconfig dependency MICRODRIVE -> PCMCIA
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm@nongnu.org, 
 Miroslav Rezanina <mrezanin@redhat.com>, John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a2b19505c0bfacd3"
Received-SPF: none client-ip=2607:f8b0:4864:20::82c;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x82c.google.com
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
X-List-Received-Date: Sat, 24 Apr 2021 22:45:54 -0000

--000000000000a2b19505c0bfacd3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 24, 2021 at 4:24 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> The Microdrive Compact Flash can be plugged on a PCMCIA bus.
> Express the dependency using the 'depends on' Kconfig expression.
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/ide/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
> index 5d9106b1ac2..8e2c8934549 100644
> --- a/hw/ide/Kconfig
> +++ b/hw/ide/Kconfig
> @@ -41,6 +41,7 @@ config IDE_VIA
>  config MICRODRIVE
>      bool
>      select IDE_QDEV
> +    depends on PCMCIA
>
>  config AHCI
>      bool
> --
> 2.26.3
>
>
>

--000000000000a2b19505c0bfacd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Apr 24, 2021 at 4:24 PM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">The Microdrive Compact Flash can be plugged on a PCMCIA bus.<br>
Express the dependency using the &#39;depends on&#39; Kconfig expression.<b=
r></blockquote><div><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"=
mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt;</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0hw/ide/Kconfig | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig<br>
index 5d9106b1ac2..8e2c8934549 100644<br>
--- a/hw/ide/Kconfig<br>
+++ b/hw/ide/Kconfig<br>
@@ -41,6 +41,7 @@ config IDE_VIA<br>
=C2=A0config MICRODRIVE<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0select IDE_QDEV<br>
+=C2=A0 =C2=A0 depends on PCMCIA<br>
<br>
=C2=A0config AHCI<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
-- <br>
2.26.3<br>
<br>
<br>
</blockquote></div></div>

--000000000000a2b19505c0bfacd3--

