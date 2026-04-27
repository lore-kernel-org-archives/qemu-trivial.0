Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95918FF885E
	for <qemu-trivial@archiver.kernel.org>; Mon, 27 Apr 2026 12:10:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wHKmi-00033B-BA; Mon, 27 Apr 2026 08:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1wHKmQ-000310-2L
 for qemu-trivial@nongnu.org; Mon, 27 Apr 2026 08:09:42 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1wHKmJ-0007OQ-VU
 for qemu-trivial@nongnu.org; Mon, 27 Apr 2026 08:09:36 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4852b81c73aso84836185e9.3
 for <qemu-trivial@nongnu.org>; Mon, 27 Apr 2026 05:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777291770; x=1777896570; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L2SW+jti4hwBr2oYpxyk8XaAWDPBfuVkiI5ZxMxXYk0=;
 b=s+5sGb0x2cvoqH5YI9frwefX8ylAJyF62jpv1BvtmnufCB/u9j75Z3MLsdnsdLWE4s
 XqAWrXpkF9mAtpPde1EXGXh+tQMRfrjBUtZIDp6d0gnstk2+n9i9abCCm4IkKLplzA/R
 jwEN0kKfRgFiXjVxg+IAHFgkHJbyOu1vu9ZjJQ2kiPqM13+W+WFYnhKqVVYNMu1GwD0m
 EYj9DOeMpquKdqThGxni5qR5+Zqux55LTE+iTp1x/O/ACfhfMC66sH52BDDE6Wt8Bgvq
 HVuNDxuNuYtrcBTcaYH1SYpuBcTx9lUPSErRvvg5iIMYR6pTaOUM9LsdEs/m0kabs3ny
 981g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777291770; x=1777896570;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=L2SW+jti4hwBr2oYpxyk8XaAWDPBfuVkiI5ZxMxXYk0=;
 b=fk85NJA96Ek9db3TnLpMfxtCrZyUzF4wlpEHV+HesGvevMYjtwhrOyB2c5SGrlsl9f
 lWdWHUgoHQ4SxWSDKHzrY3YAZxxZg0pfl3XDnOey2Xnx77WBmLzQlDpv5SDUEbFhHyBu
 IPHtfMup8UnXqgpYFl/6CZlj946pf2YeQEVufoQoGAf2sDQ/t/QnC63issSUhOVxQKQe
 RJjNeh/9fflHGSX5TM87IrUYKnSdPhhoh5FIBBfoO7qcXEfhNpWPhxYy5GtbyW1SxFNg
 wkFGjegZrO5HWPmnEY9LO1PO1QhXsKt8ZAe1ZJ48FIKbS99i4XagfazEGOAuKvVoENZN
 KFGQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8E/FL6/XdXn6ZNf/TDl0tIbOiJAOCUB6xgmoPhxLnlG9nCq25Ce5YyINXXtSsMjjg5k1Na5lz5ttHSQv0=@nongnu.org
X-Gm-Message-State: AOJu0YyJOKbCzw8Ip0/zzW5F9r8TpjMmR25nQchPASYlTvMNcw8nYsGm
 Vw6ezDlAXJxsskL6q35CXsWGUuSlH3NynQxCsOBDRhWsKq2W11tN52iS
X-Gm-Gg: AeBDievQvZDNPxiLiVF03+USex6IAkDfgqa5BWkiQQlxSZWivKYEldWy9t9zL6I1EXh
 nL++xBxgxRiAB47i9d7QGMzNiNB75qTeXPPJLWeLX9bGqgd6taogNJejyKx9up03+aWewXDoghA
 /Ni60L5wcWkF/vZaaZ6ep0zwsp/POzTI/AJGdNZ3BFPkcxm+P3MmA8Go08rH+XDSFvuMRXrURB3
 PWNu6KHkFxcckH7kg4v7SmWcuGFUb1u+EXg4Q7v2sy9kyxsRFw3BsBriTDGS7obIUET0pSzQfiP
 Mf6w8kNhPxM235rHvkupqPQ+tm3AyzuLtarRhmBgnf5uMXfFcWPc/YAI+nYZteGUSzGmbOeqT6D
 oCmEA+TmpdVMNtxpP2ZtJJWv3r7RWStP5r1pZvQeSFDAwj0K7CcGeyQGPtXhnmbyXgJIpl0YK1q
 i2prQ7FApTaPu/jQ+ONTwde4QGGg2MTpfQk/BCF+x4
X-Received: by 2002:a05:600c:1389:b0:485:9a50:338d with SMTP id
 5b1f17b1804b1-488fb739d3amr571794975e9.3.1777291769839; 
 Mon, 27 Apr 2026 05:09:29 -0700 (PDT)
Received: from ehlo.thunderbird.net ([90.187.110.129])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891cca5743sm567808705e9.9.2026.04.27.05.09.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 05:09:29 -0700 (PDT)
Date: Mon, 27 Apr 2026 10:29:14 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Subject: Re: [PATCH 2/5] hw/arm/fsl-imx8mp: Fix parent of ocram memory region
In-Reply-To: <CAFEAcA9cfiDB3+=K+MsHptujVhcPexwaf+1y8kHaV692ORAdgQ@mail.gmail.com>
References: <20260308203516.160103-1-shentey@gmail.com>
 <20260308203516.160103-3-shentey@gmail.com>
 <CAFEAcA9cfiDB3+=K+MsHptujVhcPexwaf+1y8kHaV692ORAdgQ@mail.gmail.com>
Message-ID: <A91F1062-BD9E-45B4-B0C2-12354C356A71@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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



Am 10=2E M=C3=A4rz 2026 10:00:31 UTC schrieb Peter Maydell <peter=2Emaydel=
l@linaro=2Eorg>:
>On Sun, 8 Mar 2026 at 20:35, Bernhard Beschow <shentey@gmail=2Ecom> wrote=
:
>>
>> Rather than having a NULL parent, let the containing SoC object be the
>> parent=2E This cleans up the QOM composition tree a bit=2E
>>
>> Fixes:  ("hw/arm/fsl-imx8mp: Add on-chip RAM")
>> cc: Gaurav Sharma <gaurav=2Esharma_7@nxp=2Ecom>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>  hw/arm/fsl-imx8mp=2Ec | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/fsl-imx8mp=2Ec b/hw/arm/fsl-imx8mp=2Ec
>> index 0119a18416=2E=2E839c925e4a 100644
>> --- a/hw/arm/fsl-imx8mp=2Ec
>> +++ b/hw/arm/fsl-imx8mp=2Ec
>> @@ -671,7 +671,7 @@ static void fsl_imx8mp_realize(DeviceState *dev, Er=
ror **errp)
>>                      fsl_imx8mp_memmap[FSL_IMX8MP_PCIE_PHY1]=2Eaddr);
>>
>>      /* On-Chip RAM */
>> -    if (!memory_region_init_ram(&s->ocram, NULL, "imx8mp=2Eocram",
>> +    if (!memory_region_init_ram(&s->ocram, OBJECT(dev), "imx8mp=2Eocra=
m",
>>                                  fsl_imx8mp_memmap[FSL_IMX8MP_OCRAM]=2E=
size,
>>                                  errp)) {
>>          return;
>
>
>This is a migration break, because qemu_ram_set_idstr()
>includes the qdev path of the owning device when it
>creates the name of the ramblock for migrating it=2E
>But since we haven't released anything with this change in
>it and this board isn't versioned either, that's not a problem=2E

Do we still need to catch that? If so, how?

>
>-- PMM

