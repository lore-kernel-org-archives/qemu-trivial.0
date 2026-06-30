Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A0FC43458
	for <qemu-trivial@archiver.kernel.org>; Tue, 30 Jun 2026 09:43:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1weV09-0007Cx-35; Tue, 30 Jun 2026 05:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1weV05-0007Bg-RR
 for qemu-trivial@nongnu.org; Tue, 30 Jun 2026 05:43:31 -0400
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1weV04-0003iC-4C
 for qemu-trivial@nongnu.org; Tue, 30 Jun 2026 05:43:29 -0400
Received: by mail-dy1-x1330.google.com with SMTP id
 5a478bee46e88-30c965eab27so137185eec.0
 for <qemu-trivial@nongnu.org>; Tue, 30 Jun 2026 02:43:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782812606; cv=none;
 d=google.com; s=arc-20260327;
 b=bGPS3GPHuSsi1FaeNwtZeiOigDPckOZn9gAq6vrsdKAYkrPX2ze93+8F88GLqHTJL4
 ug43HvR4fwJFlrKdBJ+8Cu8skaxoI1/uJoAzek33To7+MJWIvJEQFhAG0AvrI2QQ2sdB
 htvl0SbV8v1dkQNOKzq8YuqbarQzbmfPGSHB7XHFWBEutnB5BMCaSQ+eXCQaqOkPsHDB
 A2z2ZWUo6y2cIxIMwaKYVSIUOwIqNkOPV/+cU1FSm3R07mGTky+Px2Bv/n5xMCvezDnN
 M23/iIPZs4DqXPbsevSQrQ+ZZEmQwI7UBkZ8grJow49CYCrmBE43fqhf7h5s6Lf9cBN3
 L5Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=FFDeTaWq9gb9YQZ3DE+5IyVJ3b1N4Ny9ykkllIKbndA=;
 fh=Wtei/Sq1arBY9tpc6e1PiWHtR0IQfDEifqUGFk8vpg0=;
 b=V0oZm+5daRTIKZEj6u4+SiuPk0IYx9zsto+UIdoND6wnRTYZ961gZAuV/zcs4grrnI
 +7DTbhXIxpdiFjvuctDo0LzhaZ+zMEocyrizHA5iISWg/vD9FyKlX60JQHwp/Ukr3GM1
 PlfkgQe1zMTZxkO+lQAa2VwsYmrts3pHu4gyRnO77wVJF5dyuMKEvKQ/eWaptzDvsoAz
 5Yz+mA73ILqjKHwv752ioUoQOU6Wwof4xc4kdsV09j8Fv/gufaA2MrTKGIbTma6LKfnf
 jSSkadHWb5JqAbfElwSfersObUKfYtgW9iyqDVTx5PikG2cvijlzLX0Mkh9EWJwuKNg2
 IcsA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1782812606; x=1783417406; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FFDeTaWq9gb9YQZ3DE+5IyVJ3b1N4Ny9ykkllIKbndA=;
 b=kolZwVgH8Vp33Hxqy35OCe0tnfrRIqgrqCtaFTzCzEr6HsrZENnonRDSSR6+ysG4pR
 wEdVZf2AzBvpP7Rkm1W4IErixefRFT3gfsVGg0JX2mYfMwPafRxUqmijoLOPdYDlHsh9
 Mzk4GTP3doL0Wtj2poQfpcExV997qQhlxBQgWMicWdFr0ZbEqTGQNKkqKsbNtSjE8Gt2
 uXMD9ATga0hVP8xHZpTZR1Ibq+75w1cm+8zy5GS7h1TtMdqLX1Z04TS4HvnKuBoRVQTd
 C7xiPM6aW3JXnTFC3KLeYYazn0/+cSRcBadHECXPmcZoEMS77I0xtePVSnV6UP+MTSon
 707A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782812606; x=1783417406;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FFDeTaWq9gb9YQZ3DE+5IyVJ3b1N4Ny9ykkllIKbndA=;
 b=LK3LRkW6QKelV7ZX8yvKS2aBmL/4WdPIkwX4ABlV1rLdIt0XNdVREj3cZnGYduvnvu
 HN9pUZ9bY5H9V9dJe6GFKQD6yFvhCNCwP0BYxjFKt0wVrrBkkcFhRRt1TX2WmhOGzEfE
 4ukO91UVosS2tOeb9NGwODgMExTNg2i/pkqK2jyrIKz1U6frIJc33IdbOV12EcA1ChXk
 HssIkfX7BaHD4HYlPk0dqNiPpg9RpxnLWapIhZQjX2infSkwdhYaYmxFdjzs8UkkpvZ+
 GlessihvVpy8mLu7Yot26J8YpFmnlZ5JVPlhBpmfLE3x4CangNyVRPFGgZI8lqIgwSW7
 ypXQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp6G/uz7DgzTABxx6B2tCtyQxYmzb8v3KWfU4bKzUSAQYAIKbMM2n/NXmJUgubMxZZzk35bEL1/sAxyBwU=@nongnu.org
X-Gm-Message-State: AOJu0YxqcyMdIBZq/5zNm+xHUq2Y0ydA+U8YCpDu9mGA3763dHUcYHIS
 jtQiT+DohA3Ebcd5qcFEk2EsbsXEUesebaiUiMEN/b7j8StMHBygQQQMxh44S1VOrXrXUsOw47k
 74xMw2pH8aqvzEzcfL6YjkgVmafdp1Ifs/TntfVs=
X-Gm-Gg: AfdE7cmF/nsVeX2xc5UiYkBzNJwRjgCCyjsf5CTz1dW4iMSIuqpwEAcGMZ6ATWnQRU0
 3UIVCdx+2SerZvaPT+a2z7NFYzdPTcO3krR+GfVoKu9bJz4ZhvsLrOEY483LR932/atBcSW4y1g
 eiGfb/wGFS/J8s5YY8ck3WkshLY+K8ss4/rMG96loJwggISn8Nel1BVJDKMKyrwMe25J0Ue4/TG
 U068UvZQDdrSMjhKGyu1GM0LZ1phnU828b+OWCQjn7MwXOQaxolB3NwCM3lMcxoK8ZgY0OfXRdm
 o6xmX07ixQ6ynHt4bNstB3eWqpvj
X-Received: by 2002:a05:7300:430f:b0:30c:9f31:b631 with SMTP id
 5a478bee46e88-30ee13a1086mr2309432eec.33.1782812606231; Tue, 30 Jun 2026
 02:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260630093302.688700-1-frolov@swemel.ru>
In-Reply-To: <20260630093302.688700-1-frolov@swemel.ru>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 30 Jun 2026 13:43:13 +0400
X-Gm-Features: AVVi8CclDxxyWWrgA6bDAIzL7TOpEnEIL2_KjB-Zl2MNH1KMEicOteusmWkiADg
Message-ID: <CAJ+F1C+cS7c=Mc2GAn-WQ-XmCPU-hQM4JuDFsEkS87q0yTdrNg@mail.gmail.com>
Subject: Re: [PATCH] utils/module: fix memleak in module_load()
To: Dmitry Frolov <frolov@swemel.ru>
Cc: sdl.qemu@linuxtesting.org, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1330;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-dy1-x1330.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi

On Tue, Jun 30, 2026 at 1:35=E2=80=AFPM Dmitry Frolov <frolov@swemel.ru> wr=
ote:
>
> Memmory for version_dir, allocated by g_strdup, is not freed
>

memory

> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Signed-off-by: Dmitry Frolov <frolov@swemel.ru>
> ---
>  util/module.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/util/module.c b/util/module.c
> index 09dc43f51e..dbca6bc8be 100644
> --- a/util/module.c
> +++ b/util/module.c
> @@ -243,6 +243,7 @@ int module_load(const char *prefix, const char *name,=
 Error **errp)
>                               G_CSET_A_2_Z G_CSET_a_2_z G_CSET_DIGITS "+-=
.~",
>                               '_');
>      dirs[n_dirs++] =3D g_strdup_printf("/var/run/qemu/%s", version_dir);
> +    g_free(version_dir);

Or declare the variable with g_autofree?

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

>  #endif
>      assert(n_dirs <=3D ARRAY_SIZE(dirs));
>
> --
> 2.34.1
>
>

