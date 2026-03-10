Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB7AEA8550
	for <qemu-trivial@archiver.kernel.org>; Tue, 10 Mar 2026 10:01:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vzttY-00068h-65; Tue, 10 Mar 2026 06:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vzttR-00067h-8C
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2026 06:00:51 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vzttO-00053b-F9
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2026 06:00:48 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-64ad019bbd4so11421909d50.0
 for <qemu-trivial@nongnu.org>; Tue, 10 Mar 2026 03:00:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773136844; cv=none;
 d=google.com; s=arc-20240605;
 b=N6VPli+MoDyM2cDJUlA/cghH+XDCplm6ad4Fwv11npz571LfAFh7Crzk+3IthgTUBg
 vpPJ6y4gvkbG+swwtJQMbBhP3b466avBFhIaBFZL3wfIbkgh+im6Q0dHxBfkeIeJ8emu
 DmSevpRQFJBxzwSEUYl5RXKPlxVZMCuL/VWTA9QKYx7XP2tgr3MBxItowIOgVtJeNNKt
 7ye/lcuFVqCR5wsPGUBzGrwtEZ9pHoXvW3ZxErHPf1W+eAx5ZC0pYPfJUpYlHIfE7iRZ
 bYO3FIQ4jzu879USO5LYnIbiCpWcFcQ1l/AN0xD0aZwrlMFyYDT2HZcmsy1Rlg6Rz5w2
 1JXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=vA538xkBYu+c5ZewwjzFctB957ziu1EwWSk+8q4qAS8=;
 fh=2l1Kaxrj1EOM8ooABiudvvYpjmsARjba+/a6zPxsBi8=;
 b=Pxx+BGcbBBYJusGPyMq4ChIAqBNV+IX5TlIVQLq6SOcwdn9MON2UXJan7nVByinD42
 aQrRu1NBVJ4UFSW8A8amJV5aU04BlHS/Z8uDNXKB8XahFUsLErnHmoxDgxSoAz+kn+H3
 4CS9wsZN5pwVVJ/G3A21hVOe4sNVKR+KENPWUD0mflmzm6XMZQU1DzotiQ3FjKRMPdtz
 VXngVfiL4QPptSHHur36TN3A/EIl1hKolbSp+HwUNksLZA4FwBsaKm6fRpzLv8E0Ef7V
 fYsITfreQnVQQyE5WNUYrQ9epBOR7Y/6X2GakD/8/yjLMElRU/TMPYFycLI8TceNpESO
 U1fg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773136844; x=1773741644; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vA538xkBYu+c5ZewwjzFctB957ziu1EwWSk+8q4qAS8=;
 b=FbDOiIlA3TbIu1f/Bq3GAGhxnMGb8sp/aoCNjH/ZelBaLLFXmTl6d4nAQuwQUs+QEr
 59V36LMiTjEnEJI1/BeZoPm11qBftCNAju4APeipebtvYYCJLKhaptGqSw+NwT6HeWl+
 M240jq6Q7fvZnnYpoL0aPgh28jEZb7+flGefdCyFvmb9GnMA/3g0FDFnBUQ2IAz03AbF
 0VsYG9ztoHtYDfDodBpYubEkBDTa1xCyu2Ng7XBeiD/Za7SAJgOecwVGRjzBidpiI+Ro
 f+NPP3lfI+HZ0Ss/4bWqSmVYofCXRpzI8s7B5vRqY4m/sCYf2tkJJ/gl5QHphH5v/X5D
 PQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773136844; x=1773741644;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vA538xkBYu+c5ZewwjzFctB957ziu1EwWSk+8q4qAS8=;
 b=qXIiQM0RoHo3ab263zLUMKXLo/Wa4kVqxkMZuF7/WLe6C5jJnjuAbVDKCSVG6o/xae
 fsOqIHFZFJNZ8rrvE94Ffw0UqaMyMKAM48chu0gqaaGIixK1lQH9uVHG2nbvMmKRtDEF
 eff40WjsskBv3/pwBE2T0z7zXBvrw/va4Mbf0NSwfrxoC+S3MZu3vslYNyaCLHf7JXp3
 QaLa6XLGgtmFCoD2Jcua925vU9kLpZBXsDFp9kaFGL7xQMDI+Nme5BXnxZNwEeXRZN2I
 7+r8nTbIcHQcFGspRuRou43/UrMHv9VHV/7rJ4RwPJWZeAlF1ljvLePCcDYmLPKZpcxb
 GNrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtRjBM/iPGCUP5NbiTrpcAhohnWqIvtTgsaquw396JjmhEZv7xnt1mi85Df9fGRrZNDpj0vQ8tutMgpzo=@nongnu.org
X-Gm-Message-State: AOJu0YyjR2cWAB34B80P7VrxkFKJyxxBFlOyELuaQaCDrGygwzBS3bZ3
 eDsyrLnqcGkdXU8Qquju2FvULo7hPrJCJG/foNeO5VchgVGEJa9be7Uub+dfMoNhd2Lw5iJmpBd
 TR14tWwdMngYTY6EiVnlF90yNwwBin5UyRx0u+n4Zow==
X-Gm-Gg: ATEYQzwGwt8X1nu0hqtz+g1e07qib5BN98v2/JvtnFbVHAwCH20FxAcxb4YJcHPI/8k
 ZMa8zES5s26SfOYsZmlpaF+Ap1dSWdpFQ4MUtRBRhuPLt8feQfZdlC05ar4QTrpB0kC8bqqOnIh
 h83qpQBP6gurUMa3GRYDE5T88VwuEmvzz5gYG6UZ/5pYVZI03Mrwvg22PRFXcayr9ElA/nx8X07
 y7ltmZkuEZsLuyRnVjqeMPClOSszG9dlnRi/FZkn5XJOFru7P2H2hFpv601NgK64lRafZiJGL26
 NcbAIetHWM5bvoDcFHhSypRkSLaBUDwvxsYs+77u0+OB1OjLdxFh60vxCmOIpLe7aFE=
X-Received: by 2002:a05:690e:4105:b0:64c:a2a4:476a with SMTP id
 956f58d0204a3-64d1414c8c6mr14466003d50.32.1773136842691; Tue, 10 Mar 2026
 03:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260308203516.160103-1-shentey@gmail.com>
 <20260308203516.160103-3-shentey@gmail.com>
In-Reply-To: <20260308203516.160103-3-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Mar 2026 10:00:31 +0000
X-Gm-Features: AaiRm521S2O4yW12FYeF5vn5OVw-337c587GtbvWBH-2aPT1g1EoBsPEuS4-f5M
Message-ID: <CAFEAcA9cfiDB3+=K+MsHptujVhcPexwaf+1y8kHaV692ORAdgQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] hw/arm/fsl-imx8mp: Fix parent of ocram memory region
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, 
 qemu-arm@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On Sun, 8 Mar 2026 at 20:35, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Rather than having a NULL parent, let the containing SoC object be the
> parent. This cleans up the QOM composition tree a bit.
>
> Fixes:  ("hw/arm/fsl-imx8mp: Add on-chip RAM")
> cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/arm/fsl-imx8mp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/fsl-imx8mp.c b/hw/arm/fsl-imx8mp.c
> index 0119a18416..839c925e4a 100644
> --- a/hw/arm/fsl-imx8mp.c
> +++ b/hw/arm/fsl-imx8mp.c
> @@ -671,7 +671,7 @@ static void fsl_imx8mp_realize(DeviceState *dev, Error **errp)
>                      fsl_imx8mp_memmap[FSL_IMX8MP_PCIE_PHY1].addr);
>
>      /* On-Chip RAM */
> -    if (!memory_region_init_ram(&s->ocram, NULL, "imx8mp.ocram",
> +    if (!memory_region_init_ram(&s->ocram, OBJECT(dev), "imx8mp.ocram",
>                                  fsl_imx8mp_memmap[FSL_IMX8MP_OCRAM].size,
>                                  errp)) {
>          return;


This is a migration break, because qemu_ram_set_idstr()
includes the qdev path of the owning device when it
creates the name of the ramblock for migrating it.
But since we haven't released anything with this change in
it and this board isn't versioned either, that's not a problem.

-- PMM

