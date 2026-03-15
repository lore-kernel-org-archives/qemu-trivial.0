Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF44F30280
	for <qemu-trivial@archiver.kernel.org>; Sun, 15 Mar 2026 19:04:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1w1ql8-0002St-60; Sun, 15 Mar 2026 15:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w1ql6-0002SX-PH
 for qemu-trivial@nongnu.org; Sun, 15 Mar 2026 15:04:16 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w1ql2-00025k-Go
 for qemu-trivial@nongnu.org; Sun, 15 Mar 2026 15:04:16 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6634bb959a2so5160650a12.1
 for <qemu-trivial@nongnu.org>; Sun, 15 Mar 2026 12:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773601446; x=1774206246; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lwV19h00vdzeJjzm0o6XW8dCysIrmtIE3gx61x9k82w=;
 b=DzQ9WNcH8szT7X45JyudojLuSetEVeU0sP2pqKlkPTKdm6ikMJ8Kydir3KgIjRRF1V
 FnXXPP6MNmqSlzMvi1PEpFnCXK6XyyN4y/rLvTJSx0FqV44ptWHzloFsBAilorVMsrZT
 5y+tqKFhHZQUX4OSGYPy4PKjmLCTyMeuH/LBfLPKE2esYoCFaPukcam6R7hZdfVotsS0
 MbphcsOY6CWvRpca53vT2nrSKzYEyl3Ben7iJER+dyPf+AatYEbB7fcWDyhG+Pe/lJAX
 uGddUKFJ5PQq83UPvJ7vtSw+IPMzUf7Z1CwJ5bCmWqJttai0y1Rat3E8z/n7I27fTqTz
 JbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773601446; x=1774206246;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lwV19h00vdzeJjzm0o6XW8dCysIrmtIE3gx61x9k82w=;
 b=JJDeGwkwn++kRJrjQxE+stuValkumeJNUZ5zf85+//oVE6jrpUTKy/A4jdSbjBKzdD
 cnkUvl82nWSIrbXdhcw8IGbEm51pZ+w8VNeKag/RAV31kJmGLIvVPYXNTCBYZdvK0qVT
 2f2X0ELhHfpGexdi94RoiySD6ETrwF3/YnpPwjY9zyfm+wjhB1lblYyCwAUaXETOiIfV
 MwICt8m7mzY2mWU+wu4tF6pCEgvbDje0HS9O9AzJrseCbeuDWdclA7AGZxw2Y+AD6LoJ
 2ip7Wkq/d4R2w0cnF3woLg3QUAfFvTTUOnuDARMdyVQyE19ff4mr6dsAJRQGEyfg2Qrb
 +R9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQqCvuH9VDQpYeXtCUqwhikPaXpiZK8ya20UPLI5K5LFWCkxW0ojBb9DyA6bmzUd7pNdzgDrzIVPXGLmI=@nongnu.org
X-Gm-Message-State: AOJu0YwyfxSrm9ECqV774o7k4ake4bghhiKtDMfyXkhD5L2Da2MoCGIF
 gk2CpgR36xP5QYnD4dfdstUT21BqHjfSz/tlVKQlGq/qG+603mrySlgagp7bLSMajQI=
X-Gm-Gg: ATEYQzyaKPoXWgnB9eDy7p/8ZvtZf6ZwrLRY0a6I7xYtE+wwz51a9w+46CBK5bQ6aLG
 QH4RhUA7K7T0HD2ZRZVHIU8Zj09ddPZDz5fahQ0/6jKsERhmFs7Wsf+ZvMp4ONoOnR1nHy3E/9e
 tCEdkxauQ2AUWx64xFHDNe1KaCuAXUsrxGNnTJzFulB3/nriUILC7mhkeeSX2heeGq2+kmrb+zv
 n9zHT4mpLLqSN82aVLY+5QlEvRbv4X523++UXGb2l+u79oW4C4u5789hQetoJdMddqFHm4jySCp
 GnwzSopQtruXG847twPsayZCXl56gX+UGSf1fKpR1R2w5dg8KRlny5iPymfkeoVui69Swg6D4Q1
 zorQhHy77yb+TXJGDBIUhaJcGH6aDXLLY9MzNJp3yBSHw2yuTZjTVfeDqfwfqPoCIXkd9xhuVvE
 UkC3vm+8Mi5/8pfcql/sziKHg=
X-Received: by 2002:a05:6402:254c:b0:664:38f1:8ba0 with SMTP id
 4fb4d7f45d1cf-66438f1905emr5193547a12.4.1773601445822; 
 Sun, 15 Mar 2026 12:04:05 -0700 (PDT)
Received: from draig.lan ([185.124.0.237]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6634fbb9bedsm4021627a12.3.2026.03.15.12.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2026 12:04:03 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id AC5165F814;
 Sun, 15 Mar 2026 19:04:01 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: AADHYA R <aadhyar.cs24@rvce.edu.in>
Cc: kraxel@redhat.com,  qemu-trivial@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/audio/fmopl: Convert malloc/free to g_malloc/g_free
In-Reply-To: <CABHAK8Nuabpy412TgdEqtNJ0tucrqqVupwnZCYrZGmfHFtH5tw@mail.gmail.com>
 (AADHYA R.'s message of "Sun, 15 Mar 2026 00:59:29 +0530")
References: <CABHAK8Nuabpy412TgdEqtNJ0tucrqqVupwnZCYrZGmfHFtH5tw@mail.gmail.com>
User-Agent: mu4e 1.14.0-pre2; emacs 30.1
Date: Sun, 15 Mar 2026 19:04:01 +0000
Message-ID: <87qzpkkj8e.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

AADHYA R <aadhyar.cs24@rvce.edu.in> writes:

> As per the QEMU coding style guide, replace standard C malloc()
> and free() with GLib's g_malloc() and g_free().
>
> Since g_malloc() safely aborts on out-of-memory errors, the
> redundant NULL checks and their associated error-handling paths
> have been removed.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1798
>
> Signed-off-by: Aadhya-R <aadhyar.cs24@rvce.edu.in>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Although the whole file is fairly out of sync with modern QEMU
standards. Other things to consider:

  - #if 0 sections
  - replace hand-written logs in favour of tracepoints where appropriate
  - coding style clean-ups (mostly mandatory {}'s)

Unfortunately the whole file is tabbed. Usually we keep cosmetic commits
separate from logic changes.=20

It would be nice to find something that exercised the YM emulation of
the adlib card. Are you running anything in particular?

> ---
>  hw/audio/fmopl.c | 41 ++++++++++++-----------------------------
>  1 file changed, 12 insertions(+), 29 deletions(-)
>
> diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
> index a63ad0f04d..79e43d5410 100644
> --- a/hw/audio/fmopl.c
> +++ b/hw/audio/fmopl.c
> @@ -50,7 +50,6 @@ static int opl_dbg_maxchip,opl_dbg_chip;
>  /* attack/decay rate time rate */
>  #define OPL_ARRATE     141280  /* RATE 4 =3D  2826.24ms @ 3.6MHz */
>  #define OPL_DRRATE    1956000  /* RATE 4 =3D 39280.64ms @ 3.6MHz */
> -
>  #define DELTAT_MIXING_LEVEL (1) /* DELTA-T ADPCM MIXING LEVEL */
>
>  #define FREQ_BITS 24                   /* frequency turn          */
> @@ -607,26 +606,10 @@ static int OPLOpenTable( void )
>          double pom;
>
>          /* allocate dynamic tables */
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
> +    TL_TABLE =3D g_malloc(TL_MAX * 2 * sizeof(int32_t));
> +    SIN_TABLE =3D g_malloc(SIN_ENT * 4 * sizeof(int32_t *));
> +    AMS_TABLE =3D g_malloc(AMS_ENT * 2 * sizeof(int32_t));
> +    VIB_TABLE =3D g_malloc(VIB_ENT * 2 * sizeof(int32_t));
>       ENV_CURVE =3D g_new(int32_t, 2 * EG_ENT + 1);
>          /* make total level table */
>          for (t =3D 0;t < EG_ENT-1 ;t++){
> @@ -696,10 +679,10 @@ static int OPLOpenTable( void )
>  static void OPLCloseTable( void )
>  {
>       g_free(ENV_CURVE);
> -       free(TL_TABLE);
> -       free(SIN_TABLE);
> -       free(AMS_TABLE);
> -       free(VIB_TABLE);
> +    g_free(TL_TABLE);
> +    g_free(SIN_TABLE);
> +    g_free(AMS_TABLE);
> +    g_free(VIB_TABLE);
>  }
>
>  /* CSM Key Control */
> @@ -1082,9 +1065,9 @@ FM_OPL *OPLCreate(int clock, int rate)
>          state_size  =3D sizeof(FM_OPL);
>          state_size +=3D sizeof(OPL_CH)*max_ch;
>          /* allocate memory block */
> -       ptr =3D malloc(state_size);
> -       if(ptr=3D=3DNULL) return NULL;
> -       /* clear */
> +    ptr =3D g_malloc(state_size);
> +
> +    /* clear */
>          memset(ptr,0,state_size);
>          OPL        =3D (FM_OPL *)ptr; ptr+=3Dsizeof(FM_OPL);
>          OPL->P_CH  =3D (OPL_CH *)ptr; ptr+=3Dsizeof(OPL_CH)*max_ch;
> @@ -1128,7 +1111,7 @@ void OPLDestroy(FM_OPL *OPL)
>          }
>  #endif
>          OPL_UnLockTable();
> -       free(OPL);
> +    g_free(OPL);
>  }
>
>  /* ----------  Option handlers ----------       */

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

