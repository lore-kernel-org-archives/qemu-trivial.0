Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E20606A31D
	for <qemu-trivial@archiver.kernel.org>; Tue, 20 Oct 2026 10:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KCffqR3p
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1xJ7IF-0003fY-R5; Tue, 20 Oct 2026 06:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xJ7I7-0003eX-UP
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2026 06:42:00 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xJ7I1-0004F0-QE
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2026 06:41:58 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-8b0d63f60bcso24263087b3.3
 for <qemu-trivial@nongnu.org>; Tue, 20 Oct 2026 03:41:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792492910; cv=none;
 d=google.com; s=arc-20260327;
 b=fN2jIxWfzOkDG+3DgmfKI12QZLxujSkqzmc7czde9tX70twa8KqG/QLrCWU05IzZeY
 XSNExs0zLsSSF5Gc0Ocv21CzegAdFRRs8GJ/3RE61xzNo5BJrtbTpMPX1jkdTwAONNiu
 hxWG70vW1YsXKznA+AtduIOtBThdUTEZ+tbp4r/Ty2n9LqmdYQCvT/XnjV2VCqZptHsq
 UwXiIUa7ZVQr03lV64mjrsoLtFPo4skHN+azZsVWBXjXZimQyVEbPWBO4SiMVR5Cpboj
 qOa3eLzFGnNUU2JwZZCZCMzrGFKg4njyqqk0yVNd3v+RvGqFto54Pru0c7LNxpqFEJgC
 dBGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=/DwkCB3WLj6PmgCrTyH1rdYKvFGcb4aooHsaGPf/eH4=;
 fh=V7mH7sm9oYq2Dz0rWvKKRaBJR7mTtgj76PquiD7oLMQ=;
 b=dgq4S7Y3LdXyJxGwZwT78T00uSEiYb2kjVAng2P+bvO0Ie4b6UXCEgYf0gRe/qchHu
 vsL9ZMjeZsKkQz7tSVD5mfo4R1Eao+o2LClhffqjCEH+kJZI3iiR5EzHSv7hMvCcyi4A
 TWyHGRqYZ1Jx4bXOBNYxKgHE1k8+7DyRKzLefMJFNgs+h+SfJB4s6jZ3uwGODqlfrZ0X
 NcfUUM7sXpofEqzkJ3cMkRDTqmH1hz0QsZrcOizdWPaLSfXRuAb3VQf57umFbZaIpPMu
 Jtbx33Lep2Wp8tab5hyfFe/S7j9wxoAQbA2jnD77vlWt4uwoRUOKgKlknf0jU6pfux0I
 JS6g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792492910; x=1793097710; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=/DwkCB3WLj6PmgCrTyH1rdYKvFGcb4aooHsaGPf/eH4=;
 b=KCffqR3pPIBvw8PknyhCDM6smu3cCdiGHjPllW5cKOiu2Qlt+urn0pordOMbBdERda
 rFGjTye44lxS2vnG/Olpjk2TCCJI7lotHW9DBt1b26Ri8AfFLLW7d/JXfJWei1fFP0hU
 qlzQOYsEl9xZ6pk6FqCAOe0E1e7yAFMud0zEKtdzBsWp8uedYoD1wrShgfYNBBKnCK2X
 T7Kv3810PCAtvUAyUl/gQ3Pu7ab9XlVscmNKHcNYOWune8Jp3eCQ7O5rhE2eX9KFtXFk
 bGGUIBhRjdkEP9ThO60zvl2b90aejWxk8PbI/E1V2VtwUBKaGm77c/O4Ommq+1opeHYD
 uhEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792492910; x=1793097710;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=/DwkCB3WLj6PmgCrTyH1rdYKvFGcb4aooHsaGPf/eH4=;
 b=taV6m4f8i8oMQzUYS08yTEtfVSDBDDbV7JR1puqChjmcPsegIJYyp8cgtOLFdk33/x
 vGUPaRupBAx8+3zUWa2In4ao+zht57cji54FIEJSZMzWiAynvj9l46pNTMf/fjjeTZ3K
 QVNf+vNmjI0xTr8nIQUBN+vH56C4mNaWHR0OtpV+O12X7rFD4zERtxUzYW/Aj9CofRp7
 xuYjj33hi07tiyDDERfNElRcBe7nLis20cx5QOe1kbk6bg5xdAkBXgskVhbIrqHa2phG
 TqvEwVF244dZWqmzJNcVLEhS4KTYHfOaaYvkSFCVVezDWE/Wx9D4bznXFbdBbNyc+3Vp
 9kSg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxmaHz933xpoS6UuY9UAfXi1j/AALhj3AIbmUJC61ZYV7U9bsGc/htiule9FZzxtexlcZlgEErKBvFK/bA=@nongnu.org
X-Gm-Message-State: AFq9FYLa+DYQt6QYjyJITh4hjVZrUyDkIGmwcKqJiiJnL5zNLZ474/rR
 0yz9kO8aZuFqOb1AhaPb17vGrUMr9jUlQh1MQ5Ur6/9JJt8A9kbwrz8IkJpr2DuU2Ei8JIPKmuN
 Uqm3RJeFaGUgwSY+tDTniPo4Ez+H6M46iRksjzq7AbA==
X-Gm-Gg: AYBFou1pC8lTVzhF4WZKCXHzIhib+3mlFj2eQgSZ5wlhGubjtoiZITNEFnr6BrmaG9M
 z4jccbVn1V2HG44xSl3Moisqr284CgwvHV8my/bPyfBe3jHzdSof5qvxrBsfFw9m2BHAJOMJHkI
 wHdMOQA5JYHwnUpiiS9cBCZ3BIbX0juykdLs6dkanRaeAzVQizCzpg70bidcfxyEHnSmIKAfHs5
 H8Ur7PvczwT9Dx0CbdrxCMulCg24EHnN+HiWfbT2MXgtJdYROOI+O8ufgSG9WFKtYs0BZsKsXAK
 OsaOajhVyBs9L22WS/BV6S2XPVNGSZ7qS7wEtBY1kL9nwlLBIm/+VaY+nkuU95RGgt/2MkkojDx
 uNg6HfVMZv5Pfo0k+to/WhTnPQVzVR6Vk/b6RjDE=
X-Received: by 2002:a05:690c:f8b:b0:8a9:b50a:bafa with SMTP id
 00721157ae682-8b0f2209f73mr38995387b3.55.1792492909816; Tue, 20 Oct 2026
 03:41:49 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260428162048.2995097-1-luc.fast2004@gmail.com>
In-Reply-To: <20260428162048.2995097-1-luc.fast2004@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Oct 2026 11:41:36 +0100
X-Gm-Features: AclHuK8m1JUrP1plrHLbZbhxsLe2zgGg60noBSwo7MnCWCpeuJb3yy00MUcMocU
Message-ID: <CAFEAcA_77=_28DvN7R=ARg2ysW1UjSMnUSVYqZN8-Ge2ucY2vw@mail.gmail.com>
Subject: Re: [PATCH v2] hw/audio/fmopl.c: Convert malloc, free to g_malloc0,
 g_new and g_free
To: Lucas Cardoso <luc.fast2004@gmail.com>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, qemu-trivial@nongnu.org, 
 marcandre.lureau@redhat.com, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 28 Apr 2026 at 17:21, Lucas Cardoso <luc.fast2004@gmail.com> wrote:
>
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
use g_clear_pointer() instead of g_free(), on the OPLCloseTable function.
>  hw/audio/fmopl.c | 43 ++++++++++++-------------------------------
>  1 file changed, 12 insertions(+), 31 deletions(-)

I was just reminded by traffic on the issue tracker that we had
a discussion on this patch and some debate about different ways
to approach it, but never came to a conclusion.

My preference is to do what this patch does, i.e. replace
the mallocs with g_new(). I think it's a straightforward
obviously-correct update to a pretty unloved piece of code,
and I'd rather we do that than change to using static arrays.

(If anybody does have an interest in modernizing fmopl.c
more generally I have no objection; I'd just rather not hang
up this bit of general cross-codebase cleanup to stop using
raw malloc() that we're nearly done with.)

So:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

MJT: are you OK with picking it up for -trivial ?

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

thanks
-- PMM

