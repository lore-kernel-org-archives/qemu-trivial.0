Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4ECDCD6E4A
	for <qemu-trivial@archiver.kernel.org>; Thu,  4 Jun 2026 15:47:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wVAHy-0004N4-Fr; Thu, 04 Jun 2026 11:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.fast2004@gmail.com>)
 id 1wVAHx-0004M8-9u
 for qemu-trivial@nongnu.org; Thu, 04 Jun 2026 11:47:21 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luc.fast2004@gmail.com>)
 id 1wVAHp-0003IK-FT
 for qemu-trivial@nongnu.org; Thu, 04 Jun 2026 11:47:15 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-66061993294so1033982d50.3
 for <qemu-trivial@nongnu.org>; Thu, 04 Jun 2026 08:47:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780588032; cv=none;
 d=google.com; s=arc-20240605;
 b=f9tTNhuOxqyEL28mlODwlevf1uNrY9P9dmVLHhMaGnRFjGP4bgH9M9u/fKtIOlMw+q
 G/KzRC9ozWjwHFECSSp5MBjQZ+swXqWxrmHRm9PTDsySXIVnue0gwYKou/bhWeIfBC3y
 xfgMoYASk9STuir4SwG/kB9PMRUT/TAhfGawnds88cOsxbX85/EVz3zSU776HKZy0hPY
 jMXJL/PP4J2wF0m0i2Vi2uEuDyY7SwVGDZKBP/okZHuPdhRXQPn9yhgpiFmuXsYFHEUS
 xdv3uasHF/6MWgB6vDexr7p+NhcCT5A3hCdPshoyrxDPdh/lnq/WcICmRJoxS+eG7gAl
 w+Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=YsUQLLfTQRZYB6LU/S8rFKZGD9R5vNNMZy8rHiaJRto=;
 fh=i0lpdaeIHzK4if3NI1OjOCs0wiSwNZ1Cgk06giRZHqU=;
 b=b7/HI3wkjGB/lgfckGTJuEuoO9UhHy8wHyggVLuK/ZrOMgjyFL3rFISWN87fPvwL9E
 lXWVD1nuSGkjvdzEiRsEqLpO3UDQIQDPiSLG7xbsixVSKaxuZtCjJiajLfMWzihToC/5
 FLptjn/Jho03wV8JTpw+nlnenxxGKqzCc4IZh4gkLDdC7dptV0LaKbk4OewPJOjFRB2c
 XrWJ/uM1zxOr4rv3N5K/3S2y8cqnvTsliq5ZUYzTlceW0pc0GzWnm9vY7gohX5+NMtDI
 JPYWKzAsIe3JSTFVayKTc8Wi4srbhcjsgCYoFWoY2Ij0PHV4/VEExqqkHe+03Bcw3AEo
 uy3w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780588032; x=1781192832; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YsUQLLfTQRZYB6LU/S8rFKZGD9R5vNNMZy8rHiaJRto=;
 b=lt0oqvZ7yw5NYiiYyKZ9WU2p2QcbwyCKNWxDhAHLRteSyRD1pz6ex0ixrCk9/xUOaU
 r9q34acq94p9izLSb5zyxG43MGMhsIdURZRT/FYpGjqLf49qszeZJccj3hrA3d4I5pFd
 yhQ/XHcV/ChUvqoTS2QrrAASMJokCbIZpqTfXlQR81XHZfiiSRSKByDW5sOpeQnagv8J
 hc9S09djHVVZTIfEoVVHHk6SITdWEQ3E2JRwRXhj+OZ10Y+niOtWZatA5LElRd+CJ3VG
 2/Lq/ZZ4v6a3xq7rFI0AJrswCLg7RUp1LhRB5cE+LiREnfPdm0jMXmvuSCEeIkfolelz
 IAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780588032; x=1781192832;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YsUQLLfTQRZYB6LU/S8rFKZGD9R5vNNMZy8rHiaJRto=;
 b=J43bBNH4RZdxPdF28RbLoCf1QCJ4E/TrfudZkBZpXV/hdQxdg1eSZDEVnp3i0UBETn
 WU4FMkeDhymG4755pXcAT2pmQO+N9PaUITOtPIPFVllHsCMPb+ZRfMqBlJTA0C6AmWsF
 magKXjOgIXv0yy8z47M+C2XOUbm+4+Hf+7XFIN+cBsEPpZWiU2vXmrySwbk7LhG1b1wr
 DNx5LQucqrPcGLw66l4oEOVubpayt9TBerKwBQpf9As/FQXT5SFnbSTfl+v0r5n/0Boi
 ix6jHKn3SzBlpwV2ZjP4iFUNtDmg6zAs1oviwBVMdEe7Fax7V3T+qwV/7mbjWmYKPEy3
 0FXA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8zarT51aDX2l+XBKT1f0gfxH8DLG6yZw5G/3YeahEccBouOjI21XPMRjoXOWGLRGuuh9dNVcq1SA5Auc4=@nongnu.org
X-Gm-Message-State: AOJu0Yy5+BNJ+I4fwdHtSJMO/cnRFHc8/yHAleDIXHkdy+DfGfAIL6C5
 PJxt2cxHJT243TdLpNDf7cmyGfWgRt9J8ZTXnZo0go3HkSH4CHl2fo0ipZRdZpcW0wDF+I6Ix3U
 PuOK5/lkDXAIgQurmKcNv12/wq8qgTnc=
X-Gm-Gg: Acq92OEK8JfLYKRIO+zjcYfdrFCrF3ahzrPBgwLGptoV9VyDwnjL377snz9XL8evmJO
 V5ThZsqJVMirAEOEvaHzgmTZQc9pe5Siu/uJ3E5JTGLhhbFCCcpnIdNAOB+HKid2EkBAB9HbMLm
 9++6wQiPq3EVSjJg9dEN36U0neNSvC3A9lc4h93CtmPaTbYl6/L9O8n3XQDTc10b7CbReealC1K
 6mQuoUmob7jH6hlAhvP9UeB7zCTOzjUDu9CkA1BvH0b5cXbqa++aVL4ZJBqEp11s+fL4KpKwtBv
 EkXPiZ3gnsZ2AtvRiAC43UD67vvQX+r6OBPA/ndqWa7aLoP/wvg=
X-Received: by 2002:a05:690e:418b:b0:660:6497:f891 with SMTP id
 956f58d0204a3-660dc6050c2mr7294940d50.58.1780588031551; Thu, 04 Jun 2026
 08:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260428162048.2995097-1-luc.fast2004@gmail.com>
In-Reply-To: <20260428162048.2995097-1-luc.fast2004@gmail.com>
From: Lucas Cardoso <luc.fast2004@gmail.com>
Date: Thu, 4 Jun 2026 12:47:00 -0300
X-Gm-Features: AVHnY4KpBb3l15pxonrPRi2mR0aCUWF7eBQTn8qL1wfjHrkzKPQqOeJUVtoSmhk
Message-ID: <CAHMzB=hF7QRWSTOa_O8G=61mJ+Hq7+JgjO6h+M-Y+i4b0PS3kA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/audio/fmopl.c: Convert malloc, free to g_malloc0,
 g_new and g_free
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, qemu-trivial@nongnu.org, marcandre.lureau@redhat.com
Content-Type: multipart/alternative; boundary="0000000000001caaf006536f75da"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=luc.fast2004@gmail.com; helo=mail-yx1-xb135.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

--0000000000001caaf006536f75da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping!
Just following up on this patch. Let me know if there's anything else
needed from my side to get it merged. If not, I could move onto patching
'm68k.c' which would close the gitlab issue

<https://gitlab.com/qemu-project/qemu/-/work_items/1798>
Thanks,
Lucas Cardoso

Em ter., 28 de abr. de 2026 =C3=A0s 13:21, Lucas Cardoso <luc.fast2004@gmai=
l.com>
escreveu:

> In accordance with QEMU's coding style guidelines, replace raw memory
> allocation functions (malloc/free) with their GLib equivalents
> (g_new/g_malloc0/g_free/g_clear_pointer).
>
> Also removes the old generic error-handling code from
> OPLOpenTable(), since the Glib functions abort the program automatically
> if memory is exhausted.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/1798
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Lucas Cardoso <luc.fast2004@gmail.com>
> ---
> v2:
> - After some studying, I decided to follow Marc-Andr=C3=A9's feedback to =
use
> g_clear_pointer() instead of g_free(), on the OPLCloseTable function.
>  hw/audio/fmopl.c | 43 ++++++++++++-------------------------------
>  1 file changed, 12 insertions(+), 31 deletions(-)
>
> diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
> index a63ad0f04d..91fe806fd6 100644
> --- a/hw/audio/fmopl.c
> +++ b/hw/audio/fmopl.c
> @@ -607,26 +607,10 @@ static int OPLOpenTable( void )
>         double pom;
>
>         /* allocate dynamic tables */
> -       if( (TL_TABLE =3D malloc(TL_MAX*2*sizeof(int32_t))) =3D=3D NULL)
> -               return 0;
> -       if( (SIN_TABLE =3D malloc(SIN_ENT*4 *sizeof(int32_t *))) =3D=3D N=
ULL)
> -       {
> -               free(TL_TABLE);
> -               return 0;
> -       }
> -       if( (AMS_TABLE =3D malloc(AMS_ENT*2 *sizeof(int32_t))) =3D=3D NUL=
L)
> -       {
> -               free(TL_TABLE);
> -               free(SIN_TABLE);
> -               return 0;
> -       }
> -       if( (VIB_TABLE =3D malloc(VIB_ENT*2 *sizeof(int32_t))) =3D=3D NUL=
L)
> -       {
> -               free(TL_TABLE);
> -               free(SIN_TABLE);
> -               free(AMS_TABLE);
> -               return 0;
> -       }
> +    TL_TABLE =3D g_new(int32_t, TL_MAX * 2);
> +    SIN_TABLE =3D g_new(int32_t *, SIN_ENT * 4);
> +    AMS_TABLE =3D g_new(int32_t, AMS_ENT * 2);
> +    VIB_TABLE =3D g_new(int32_t, VIB_ENT * 2);
>      ENV_CURVE =3D g_new(int32_t, 2 * EG_ENT + 1);
>         /* make total level table */
>         for (t =3D 0;t < EG_ENT-1 ;t++){
> @@ -695,11 +679,11 @@ static int OPLOpenTable( void )
>
>  static void OPLCloseTable( void )
>  {
> -    g_free(ENV_CURVE);
> -       free(TL_TABLE);
> -       free(SIN_TABLE);
> -       free(AMS_TABLE);
> -       free(VIB_TABLE);
> +    g_clear_pointer(&ENV_CURVE, g_free);
> +    g_clear_pointer(&TL_TABLE, g_free);
> +    g_clear_pointer(&SIN_TABLE, g_free);
> +    g_clear_pointer(&AMS_TABLE, g_free);
> +    g_clear_pointer(&VIB_TABLE, g_free);
>  }
>
>  /* CSM Key Control */
> @@ -1081,11 +1065,8 @@ FM_OPL *OPLCreate(int clock, int rate)
>         /* allocate OPL state space */
>         state_size  =3D sizeof(FM_OPL);
>         state_size +=3D sizeof(OPL_CH)*max_ch;
> -       /* allocate memory block */
> -       ptr =3D malloc(state_size);
> -       if(ptr=3D=3DNULL) return NULL;
> -       /* clear */
> -       memset(ptr,0,state_size);
> +    /* allocate memory block and zero-initialize */
> +    ptr =3D g_malloc0(state_size);
>         OPL        =3D (FM_OPL *)ptr; ptr+=3Dsizeof(FM_OPL);
>         OPL->P_CH  =3D (OPL_CH *)ptr; ptr+=3Dsizeof(OPL_CH)*max_ch;
>         /* set channel state pointer */
> @@ -1128,7 +1109,7 @@ void OPLDestroy(FM_OPL *OPL)
>         }
>  #endif
>         OPL_UnLockTable();
> -       free(OPL);
> +    g_free(OPL);
>  }
>
>  /* ----------  Option handlers ----------       */
> --
> 2.51.0
>
>

--0000000000001caaf006536f75da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Ping!</div>Just following up on this=
 patch. Let me know if there&#39;s anything else needed from my side to get=
 it merged. If not, I could move onto patching &#39;m68k.c&#39; which would=
 close the <a href=3D"https://gitlab.com/qemu-project/qemu/-/work_items/179=
8">gitlab issue<br><br></a></div><div>Thanks,<br></div><div>Lucas Cardoso</=
div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Em ter., 28 de abr. de 2026 =C3=A0s 13:21, Lucas Cardos=
o &lt;<a href=3D"mailto:luc.fast2004@gmail.com">luc.fast2004@gmail.com</a>&=
gt; escreveu:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">In=
 accordance with QEMU&#39;s coding style guidelines, replace raw memory<br>
allocation functions (malloc/free) with their GLib equivalents<br>
(g_new/g_malloc0/g_free/g_clear_pointer).<br>
<br>
Also removes the old generic error-handling code from<br>
OPLOpenTable(), since the Glib functions abort the program automatically<br=
>
if memory is exhausted.<br>
<br>
Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/work_items/1798=
" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu=
/-/work_items/1798</a><br>
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
Signed-off-by: Lucas Cardoso &lt;<a href=3D"mailto:luc.fast2004@gmail.com" =
target=3D"_blank">luc.fast2004@gmail.com</a>&gt;<br>
---<br>
v2: <br>
- After some studying, I decided to follow Marc-Andr=C3=A9&#39;s feedback t=
o use g_clear_pointer() instead of g_free(), on the OPLCloseTable function.=
<br>
=C2=A0hw/audio/fmopl.c | 43 ++++++++++++-------------------------------<br>
=C2=A01 file changed, 12 insertions(+), 31 deletions(-)<br>
<br>
diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c<br>
index a63ad0f04d..91fe806fd6 100644<br>
--- a/hw/audio/fmopl.c<br>
+++ b/hw/audio/fmopl.c<br>
@@ -607,26 +607,10 @@ static int OPLOpenTable( void )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 double pom;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* allocate dynamic tables */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if( (TL_TABLE =3D malloc(TL_MAX*2*sizeof(int32_=
t))) =3D=3D NULL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if( (SIN_TABLE =3D malloc(SIN_ENT*4 *sizeof(int=
32_t *))) =3D=3D NULL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(TL_TABLE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if( (AMS_TABLE =3D malloc(AMS_ENT*2 *sizeof(int=
32_t))) =3D=3D NULL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(TL_TABLE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(SIN_TABLE);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if( (VIB_TABLE =3D malloc(VIB_ENT*2 *sizeof(int=
32_t))) =3D=3D NULL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(TL_TABLE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(SIN_TABLE);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(AMS_TABLE);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 TL_TABLE =3D g_new(int32_t, TL_MAX * 2);<br>
+=C2=A0 =C2=A0 SIN_TABLE =3D g_new(int32_t *, SIN_ENT * 4);<br>
+=C2=A0 =C2=A0 AMS_TABLE =3D g_new(int32_t, AMS_ENT * 2);<br>
+=C2=A0 =C2=A0 VIB_TABLE =3D g_new(int32_t, VIB_ENT * 2);<br>
=C2=A0 =C2=A0 =C2=A0ENV_CURVE =3D g_new(int32_t, 2 * EG_ENT + 1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* make total level table */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (t =3D 0;t &lt; EG_ENT-1 ;t++){<br>
@@ -695,11 +679,11 @@ static int OPLOpenTable( void )<br>
<br>
=C2=A0static void OPLCloseTable( void )<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 g_free(ENV_CURVE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0free(TL_TABLE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0free(SIN_TABLE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0free(AMS_TABLE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0free(VIB_TABLE);<br>
+=C2=A0 =C2=A0 g_clear_pointer(&amp;ENV_CURVE, g_free);<br>
+=C2=A0 =C2=A0 g_clear_pointer(&amp;TL_TABLE, g_free);<br>
+=C2=A0 =C2=A0 g_clear_pointer(&amp;SIN_TABLE, g_free);<br>
+=C2=A0 =C2=A0 g_clear_pointer(&amp;AMS_TABLE, g_free);<br>
+=C2=A0 =C2=A0 g_clear_pointer(&amp;VIB_TABLE, g_free);<br>
=C2=A0}<br>
<br>
=C2=A0/* CSM Key Control */<br>
@@ -1081,11 +1065,8 @@ FM_OPL *OPLCreate(int clock, int rate)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* allocate OPL state space */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 state_size=C2=A0 =3D sizeof(FM_OPL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 state_size +=3D sizeof(OPL_CH)*max_ch;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* allocate memory block */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D malloc(state_size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if(ptr=3D=3DNULL) return NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* clear */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(ptr,0,state_size);<br>
+=C2=A0 =C2=A0 /* allocate memory block and zero-initialize */<br>
+=C2=A0 =C2=A0 ptr =3D g_malloc0(state_size);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 OPL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D (FM_OPL *)pt=
r; ptr+=3Dsizeof(FM_OPL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 OPL-&gt;P_CH=C2=A0 =3D (OPL_CH *)ptr; ptr+=3Dsi=
zeof(OPL_CH)*max_ch;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* set channel state pointer */<br>
@@ -1128,7 +1109,7 @@ void OPLDestroy(FM_OPL *OPL)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 OPL_UnLockTable();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0free(OPL);<br>
+=C2=A0 =C2=A0 g_free(OPL);<br>
=C2=A0}<br>
<br>
=C2=A0/* ----------=C2=A0 Option handlers ----------=C2=A0 =C2=A0 =C2=A0 =
=C2=A0*/<br>
-- <br>
2.51.0<br>
<br>
</blockquote></div></div>

--0000000000001caaf006536f75da--

