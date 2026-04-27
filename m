Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6C2FF8860
	for <qemu-trivial@archiver.kernel.org>; Mon, 27 Apr 2026 12:14:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wHKql-0004c8-2D; Mon, 27 Apr 2026 08:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHKqV-0004aE-RK
 for qemu-trivial@nongnu.org; Mon, 27 Apr 2026 08:13:52 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHKqU-0000uY-Cf
 for qemu-trivial@nongnu.org; Mon, 27 Apr 2026 08:13:51 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-6501725d888so8097000d50.0
 for <qemu-trivial@nongnu.org>; Mon, 27 Apr 2026 05:13:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777292029; cv=none;
 d=google.com; s=arc-20240605;
 b=kHpL4c3f/sLY6F/yW1OW/CrX/03L7YIFwR46CkJdL1pxmwHclVNVDnBkxgpaZu471X
 V7Vl53FRJayIAdF60Xkkw/jDDMrcfKwgv0x+iPV1fGGDwT8EiaVZo7+M1ISWRuZJkGnP
 xboOFD9auQGSuDovoWhRziynPadbQSZEV0+i4QF/aG1BFMEzVdG2uPtsrp0uaSWjymOu
 YIrO9JW/EqN+eNJbaIcssWiuy9hB2ufAkYNnycC5bPnDG20GGJN/iwTMRm7mgoJRAf0a
 LV9LCEIDcnco4t5GRmKrsKg35hdeerYi0uUluTCfK+pw5B0XU0zWaBRktyQvYJ7rUBcu
 DVMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=/mpPB4Ix5xE48TU0EQCpMqXtOuf+xSKjioAXXP4tzYY=;
 fh=eIyRc46s5ibZ2z07sDygD/TDWy2dEbJb7CshmeBcBF4=;
 b=gFZu/swlKzmEt/8YDPR4/bc7nGiRvPRDnOH/HtZX+uodldZj+IOLLgxxArjRro8wBE
 PhOgeGRKsjUH8EacpwkvzHvilaQ2fIRD28mSpMHo6rf6ybxjejxNSk5Fyyyw1eZEz3mp
 /nxQNtuJhLuzEFZUu0szZ6S7Es7Q+QgUvcnYDbkUiQI66s2S8lpDBjrtt3H1hODR3KJN
 MyxVXmWGi4cUj/FkVnEvIDrmv81MHrzrpzTQLasKiIrIp1RIA6xId5gz+TIPV0kGW8Pm
 bhEtIB8tb44rkZ7Px38PWvdLAlNeXtMiYtKqZXMUAhwaPZ/uv5aOg1Y2x7YU1h1iRfi2
 faoA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777292029; x=1777896829; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/mpPB4Ix5xE48TU0EQCpMqXtOuf+xSKjioAXXP4tzYY=;
 b=wzwRQxkiQIcXwUp6cE/mEysZalzWxVOzo2qTz0jyAHLdM6aI7xIJl8QGUfg64cntXQ
 LcjGk+xON/xk2jlvG+9NL65BqTtqgMppzKo0lxbNDarx5wh/R0OS1GMRVmD/i9r5Or63
 g6dWwV6cCr9Mjf9A8ZFQkWimAVfumIA65t+ofw+Ny8m4bYjmq7cF6fg5sDk7HJzHEji0
 +B6uLgl1vSzyeB9bSsJF8uuB1f63vzZjpmsMEUYgz2mCUICZYvURnX5ZsiB1U8AM+uyD
 03V7EbeKVKT222tcZ39IQY4zzVCtxVpTzrCyBxnNKbFRJsIgveORzVuELOQ1pb3RZuq1
 PeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777292029; x=1777896829;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/mpPB4Ix5xE48TU0EQCpMqXtOuf+xSKjioAXXP4tzYY=;
 b=Owp3LIlNfqazZuA68w9yQC6yu257NNzb5u6UKlEh9NXDffwdjYQqGEbd+7PYVi0nPy
 9qsr7x1Mo1M0JK/IiExIhS4EToridsJGCdJEAj6v5leQAIr2nBscUyF+2I/KudFcPiOS
 B40oFR7b6ycFldQfddjs/je4bgzRDLOyElIrDim5UCdvJcHDlyQEx4EeB9RtaQ/FHPvo
 0rrkLK3rO/E5yYBNjLFc30fkD/iPT25Yr609sUzZIX25l9D5EsTvSNQPfG6VTfKQCbVr
 j+eaE59Zg8LhS+4tWUnlGFpG6VUaFWCBGeGTAKBetlJZaEQLlKFlu3Z3q9TQBe78ZA/2
 Buyg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9gjakUAk212w1SmlT6mYOLlxyx0Jlf5WGVh1CYo43ek9bFS/rMJtPAQyvZVbXVG3XZE01HIILAeNkn9Zs=@nongnu.org
X-Gm-Message-State: AOJu0YwI8Hl6VGKdlGnVOyXuMWVF13SPygw6IaTwKWzU8RlQO5Bq6dLz
 dGb/5KdnGMw2voGFs4+EKeeJSc3pHM7IfTX84+UdMsFFB/gkTJe9oONZLaKPguRK878AA/eAomr
 25tephmAsByRdkbM9+EUPlqd+yufniahu5pChdKfiLA==
X-Gm-Gg: AeBDiesQhrB5e+UWMHlUXiEuRDJh2vt+2X6Y5+bNiYmpHAX0j95T+3qYqzR8sJsuJJ1
 1L5zjiiz26M6gw00/QIqqurWDK/d6u7s0T81N1WSlyoW3kfxqaHZtcu8ns873yZc+ntj1XgkuYI
 OgfH3+At+yYxTts1NO2ff7pk3MtuTQ6iqC0xWnquslYHjj/oYf6HRKb+AY/LnpmaM+9fvXpPyzc
 6hddXUynQi77kl3lSUsI2ul5Qg4pMwNuJtWD8X1AzZGt2IOZA39mr/BSg4cfYIowXAosvdH605d
 owpXV4up4rfzJUwRFzQApcJdXX7njf6fRM7rBtUek3eGAncgKgQ6KWZ1xPiGuvM/CCI+Npsi5gf
 e1g==
X-Received: by 2002:a05:690e:400d:b0:651:cc5e:b8d7 with SMTP id
 956f58d0204a3-65310859d9emr40894427d50.22.1777292028942; Mon, 27 Apr 2026
 05:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260308203516.160103-1-shentey@gmail.com>
 <20260308203516.160103-3-shentey@gmail.com>
 <CAFEAcA9cfiDB3+=K+MsHptujVhcPexwaf+1y8kHaV692ORAdgQ@mail.gmail.com>
 <A91F1062-BD9E-45B4-B0C2-12354C356A71@gmail.com>
In-Reply-To: <A91F1062-BD9E-45B4-B0C2-12354C356A71@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2026 13:13:37 +0100
X-Gm-Features: AVHnY4JyPLZckVqrXZRMRBkmijYqNWu2Tkm9CD8bMajRKFQ_NWWMKACul_02ipQ
Message-ID: <CAFEAcA92UbkBiMZTYaDUnOc__w+LEhfDw3=rWCxHRkECpLYi6g@mail.gmail.com>
Subject: Re: [PATCH 2/5] hw/arm/fsl-imx8mp: Fix parent of ocram memory region
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, 
 qemu-arm@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Mon, 27 Apr 2026 at 13:09, Bernhard Beschow <shentey@gmail.com> wrote:
>
>
>
> Am 10. M=C3=A4rz 2026 10:00:31 UTC schrieb Peter Maydell <peter.maydell@l=
inaro.org>:
> >On Sun, 8 Mar 2026 at 20:35, Bernhard Beschow <shentey@gmail.com> wrote:
> >>
> >> Rather than having a NULL parent, let the containing SoC object be the
> >> parent. This cleans up the QOM composition tree a bit.
> >>
> >> Fixes:  ("hw/arm/fsl-imx8mp: Add on-chip RAM")
> >> cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>
> >> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> >> ---
> >>  hw/arm/fsl-imx8mp.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/hw/arm/fsl-imx8mp.c b/hw/arm/fsl-imx8mp.c
> >> index 0119a18416..839c925e4a 100644
> >> --- a/hw/arm/fsl-imx8mp.c
> >> +++ b/hw/arm/fsl-imx8mp.c
> >> @@ -671,7 +671,7 @@ static void fsl_imx8mp_realize(DeviceState *dev, E=
rror **errp)
> >>                      fsl_imx8mp_memmap[FSL_IMX8MP_PCIE_PHY1].addr);
> >>
> >>      /* On-Chip RAM */
> >> -    if (!memory_region_init_ram(&s->ocram, NULL, "imx8mp.ocram",
> >> +    if (!memory_region_init_ram(&s->ocram, OBJECT(dev), "imx8mp.ocram=
",
> >>                                  fsl_imx8mp_memmap[FSL_IMX8MP_OCRAM].s=
ize,
> >>                                  errp)) {
> >>          return;
> >
> >
> >This is a migration break, because qemu_ram_set_idstr()
> >includes the qdev path of the owning device when it
> >creates the name of the ramblock for migrating it.
> >But since we haven't released anything with this change in
> >it and this board isn't versioned either, that's not a problem.
>
> Do we still need to catch that? If so, how?

The code change is fine; we just need to mention in the commit message
that it's a migration compat break but that it's OK to do that for this
board because it isn't versioned.

-- PMM

