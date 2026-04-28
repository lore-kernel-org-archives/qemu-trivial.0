Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D27FF885A
	for <qemu-trivial@archiver.kernel.org>; Tue, 28 Apr 2026 06:16:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wHbk5-0006uL-00; Tue, 28 Apr 2026 02:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1wHbk1-0006sG-PO
 for qemu-trivial@nongnu.org; Tue, 28 Apr 2026 02:16:18 -0400
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1wHbjz-000137-VT
 for qemu-trivial@nongnu.org; Tue, 28 Apr 2026 02:16:17 -0400
Received: by mail-dy1-x1336.google.com with SMTP id
 5a478bee46e88-2de831d2b20so2707287eec.1
 for <qemu-trivial@nongnu.org>; Mon, 27 Apr 2026 23:16:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777356974; cv=none;
 d=google.com; s=arc-20240605;
 b=R+CYQUQAiP6/uce6bN4V7YhtbCzu++QPfE/ZM12xzny4JpfpJsNlwODS5aynxVoXtF
 tmseSi16DIJ2NYr2vHyp87lQtxjlMeC6UnPQsmYqxqeYr//8bqmz4g93ACLDxBuB7VFW
 5bklfJ0+kCJZZG7OegwaTTKmZeQI6QMpmLofoy1jr+IEsbTEqWXUKmOe1Nyfuh0ZeGil
 CKdcm3yOIGlsTlmGeCcHuHXKshqo+EX+CNJPfMwqqMk4mmHszJhwIxIU98w0Ey7asuam
 lrTRoxKwTV2zTG20bYvZRZbOHeMMmLf/hHz0vzP2uHCnpnN+AfpnXTR1iFeTeHhCURPb
 9sNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=2dOBHRaGvuQxnPccomI7bJCXmVZwYQ5QB2PSNIreMPs=;
 fh=arWGMe56beezxtjEYqNB9+7U0DR9dYGkp0puhsAbKtY=;
 b=kScJ0G5cPMv5JtgzL/jWWt4kOMBY3YWBHwgfIUMlGJ1qWD2kwE7XxCiz5joeMbXiN3
 aiEO8hUXgUGq73YThlFv97OtJl1NbmY4qa8DFmXRWGpReygJut4AEx30dZoSJWDCfXhu
 GMFpceontYQ0slNb4THl4jd3OZgnyvlne1ByB+RrUs5XVwh212HMAqqRCpL+3ZwF2BJP
 i0v9saB99pWnEROTlaqBRZmDOrSG7ZSEec2DQX78arrvJbrLotEwnT13GFtu+wx5B+YI
 uAR8TKvSXSbzIFhLu/WEhDNE9JIBy6c3DtKPxF9kuOvvyl538R3s4lchcbe+YHVTZkww
 NuyA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777356974; x=1777961774; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2dOBHRaGvuQxnPccomI7bJCXmVZwYQ5QB2PSNIreMPs=;
 b=MSxu2RqyQfVOLcay9dwhSThDYk7ikWfkYn4TYWigVwxjYJ6YIZW0sO6oNObUWc9Mre
 zVVieJHj2X7qt1b55PUlHJIMP+DI6FZGcjxsh+zbLVMxvHoHnnkHVZZuvp55Bhq1lrNH
 US8rpC/5Osez+uDwNvwZMNxMjLlZnMYk8fxpYYQrB9Rr1HX6Sem4H37ifiPtrnzWFIKs
 iRTw0OIlXEgZkdDt9NDR1rryXTviQHYnGEHDS+0dSNhNjuzrnurLVckaQPrR1F2yFasH
 wgZOV6Lx5wvk/vtZEDgZfiBO1/LTcl4WlQO0FePfXJ/vzxra67Bnx2QE/8giQEeaExT0
 2Zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777356974; x=1777961774;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2dOBHRaGvuQxnPccomI7bJCXmVZwYQ5QB2PSNIreMPs=;
 b=T5g492ZHt1lJsIVbd8LkJ29T+EL0pLFhopTjkBXbckP7RGMxEg58dxAmb1pRUPADcO
 Bhm6yTL0nB26v+wAB8e3Dv4TO3xfrsK1uCjHYqjl8kcphkCzYcKi2Vp2DynSCLKzagnH
 2C8gnEq4rRlKE5bpniSc82b22EHzkuWsmGnCGRC6+ShMwiDw0IYtcqTnpd0R96bA/qD0
 Zfth8TkeD2GihocJ9EA3B3tVSAGQROEMDGu4njqDHtOTW5SNob9L/0NnpoII9uzC/yZ6
 B9+Unyv87/XRD1WN4KoFsz+7bgGD9MexU92FndRKNHpGBaVLh4O9mxhrQznbaB8qTxuT
 Yw9Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+eGwsCDE6nUReE5ESiTO+OiAHDV44uTwpP92uUX0DJI4v3j34J+9JYsbxc+EWXapOI2IEzfM/ZFTP6GJk=@nongnu.org
X-Gm-Message-State: AOJu0Yw7RPuUf7KlDkY396Apcml6aRP3o79fTNL2rRct2XV/UMT6Ecch
 4hynlsumquMXNtyI/VV+Qf1CyFOz5QvnTBLJk8hF9jep1GCm5C4EvRL2GyQXRY4cqsbiaYlveTc
 4F8WGgSmqIYpJ/DMMhpFW+v3+SnaEUP4=
X-Gm-Gg: AeBDieu96EKibH+6edjMKExgrVDF+qVUSirhS8te7gQmnFae2mr7OSptktAgUJRTa3x
 InnoZ54TWayXpr3hhAQNbKPcoa+plC3B0SHIiFN0wgXxJN+ZHqdfISVWWQr0R/WwifnQauhduTZ
 FyL502W3ZRJxrH+bJWF5OggcbtAWuQi2SL4p648f3gJo6J7SsgSsDgT5C+fkz4TElasLEJyJorx
 f0cHG8mJ/X66A8MJdhQIEfljLnT7NEaHN1wTpjMzfPZ4XdePZ8LU7lAQAWk8+JOOI+UYtVMijiM
 Fu6oTAVnnsqcA94qiVybRC2uiVLq0vdShBFUnemqhgGxqH3KSvA=
X-Received: by 2002:a05:7300:73c7:b0:2e6:e504:5435 with SMTP id
 5a478bee46e88-2ed0a015a63mr879217eec.12.1777356974100; Mon, 27 Apr 2026
 23:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260427223928.2742270-1-luc.fast2004@gmail.com>
In-Reply-To: <20260427223928.2742270-1-luc.fast2004@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 28 Apr 2026 10:16:01 +0400
X-Gm-Features: AVHnY4JvwDhkzLh3hsw8skf9bQ9lbpQq6XEnVo-sr1AW0bKIGAMEek6IOmV5Nqs
Message-ID: <CAJ+F1C+fKiDfVOC1JTNeZiX2rY22+1CdaHi_t84JJaf_=tU4vA@mail.gmail.com>
Subject: Re: [PATCH] hw/audio/fmopl.c: Convert malloc, free to g_malloc0,
 g_new and g_free
To: Lucas Cardoso <luc.fast2004@gmail.com>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1336;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-dy1-x1336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Apr 28, 2026 at 3:48=E2=80=AFAM Lucas Cardoso <luc.fast2004@gmail.c=
om> wrote:
>
> In accordance with QEMU's coding style guidelines, replace raw memory
> allocation functions (malloc/free) with their GLib equivalents
> (g_new/g_malloc0/g_free).
>
> Also removes the old generic error-handling code from
> OPLOpenTable(), since the Glib functions abort the program automatically
> if memory is exhausted.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/1798
> Signed-off-by: Lucas Cardoso <luc.fast2004@gmail.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  hw/audio/fmopl.c | 41 +++++++++++------------------------------
>  1 file changed, 11 insertions(+), 30 deletions(-)
>
> diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
> index a63ad0f04d..aeefc4c9fe 100644
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
> @@ -696,10 +680,10 @@ static int OPLOpenTable( void )
>  static void OPLCloseTable( void )
>  {
>      g_free(ENV_CURVE);
> -       free(TL_TABLE);
> -       free(SIN_TABLE);
> -       free(AMS_TABLE);
> -       free(VIB_TABLE);
> +    g_free(TL_TABLE);
> +    g_free(SIN_TABLE);
> +    g_free(AMS_TABLE);
> +    g_free(VIB_TABLE);

To make this function idempotent, I would rather use
g_clear_pointer(), but that might not be necessary

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


--=20
Marc-Andr=C3=A9 Lureau

