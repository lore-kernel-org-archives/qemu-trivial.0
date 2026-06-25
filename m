Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E42CDB479
	for <qemu-trivial@archiver.kernel.org>; Thu, 25 Jun 2026 14:57:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wclVg-0000g6-3X; Thu, 25 Jun 2026 10:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wclVe-0000eb-Hz
 for qemu-trivial@nongnu.org; Thu, 25 Jun 2026 10:56:54 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wclVc-0003FA-6G
 for qemu-trivial@nongnu.org; Thu, 25 Jun 2026 10:56:54 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-80af6f707b5so5279507b3.3
 for <qemu-trivial@nongnu.org>; Thu, 25 Jun 2026 07:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782399411; cv=none;
 d=google.com; s=arc-20260327;
 b=UtCZ3uuzr6Auuje0PPC+DtWxtDcY5c89lu3mkxMDJAgmgHspCLTvavY7hzIIBvTE7F
 8pVE1HPeHBF3XCyOLoSfoDzVqCuqkD7ln3u7F4TPZrMsJdQpjP9NS2aBMcsyfYLWEl6q
 zf2CztUl+qwtKf6qXbJ3e3TELWEqymQW7XUFqpo1EP7MWEYDzgU1nDVnY6pE3YWdnAPZ
 mApGsZ9dD2HQVo0G+Vjd594zYUMt4huw66ctsBkxxtJ6PG6nWDh/Yb3PTkcn+NULK5bS
 O44a/RQIDO6VPFUGVfyLctKWMnh11LZPrxDmOXlCBX1KMWzqOwq0jeYACvqUOVr13c8b
 rXGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=i/zCXl+P6RPAZgR9hjF7z+0cuHq30SL+nR/NueNuT6E=;
 fh=6QHwVNXtMgkABxyuG68y54qVVKFIiD03hsuIxF8koCg=;
 b=jkTBgxYPHpERDTxJOri6zDHeG5fHYWEtHHXXsUy2seBs11DysObHNtE3UaAOA0KE9n
 QfOZMzf3ZUeIimaEcFJj3zewL2G9mrKIZ3rZv4u07IQrLWPKDvpDymcbFmg/tDCoGcqg
 kqJwJYGsCd9SMRGenm09Azd840dIqcBweGgvf0uWlOOvNBbFfvT2RSm5RMV5bC1GMngQ
 k1aHXDJzTDhuSt5bPhLVPezpZG7r4aPY5LqOw1bL1OyFm8ZjNH7nNHP5iwuc3XVNfkQ/
 cRaWmLjAQi8ijz03pme3DFLveqo1dmznYpn0fcyXRyXBbmsWzPwi0VhZkAQhlbHcx48B
 VYUQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782399411; x=1783004211; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i/zCXl+P6RPAZgR9hjF7z+0cuHq30SL+nR/NueNuT6E=;
 b=pK/gQQN8fDxAhZyyPkVEF2JQboL2qad1F2wtlFq8STeoXW5FLOo7Pl1q9UWc/ziy2Z
 g0LGSrfZtheai5yGEhRUqwhDuTG3cQKIYxs+J1gV0CXAb+huKMs4hbNIToVIF0ag3TOp
 YJp9e51XQAgY/H84PE8n0NBGOnHz0nC/v0G/YQ21Rsi0siRPRAdtU8cstvgWNde6uveJ
 q4xsBBF+4UVVVdEuEQjCeH2WmH4FILNkW3MLPvHobOvmgU8JTTrQcWToZgFlZZz8TGgl
 PVYIFJsNt/joRK1dN10et8i7oVaJcczgmebR/ot5aG9qSkI+SLfKZSq64fy8r5AolbFO
 kOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782399411; x=1783004211;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/zCXl+P6RPAZgR9hjF7z+0cuHq30SL+nR/NueNuT6E=;
 b=JgxeCpDfWHd7rIKf50IiRRbkN6RfCH59kiR2MPGpOvGuKroQ8vxHi6OzICr+rS99dd
 wfLNnupm6VcQCCIbWtc1NbTgoC1/eYMVTfFMbJQfO5vW9zD4SdgD7woP6arua+1pGUAp
 bftXjigH+gzyN5xWBKijK3dNv3OIZECuyXBq8wyz3O6iYKrqgMpK0pl1OkdvJDQFPfzc
 moathEkoHkbrNCZqccGqSEjQOU6WM8DsfcAfVj80m+2vQWTtYEfiz1cJ8D6x/EfgH+1O
 sfyzp0GU3YLuTqfcJnJXr74qp2G8Z7F2he6WdoO7sRksgAY2y1Zk6riXW/v14Q+mm/Js
 qx+g==
X-Forwarded-Encrypted: i=1;
 AHgh+RofJQa3ZcF4RJRFoPQc7gMmukbd4fZbzsKyiYzS7T6L4jlfSdcUyOz5GEYlc+zGRPoztSzjDEMQLKFydvk=@nongnu.org
X-Gm-Message-State: AOJu0YxKMYuB/WYYiIRIHMVvdEEThXXI2AbFZGBnR2Az+ex0/imoWrKW
 mhQZEYN2zw6NAUtXbt+LTf5P2aLVK2MsZn8Y6hxKSP5hFdrFwPSXJlVCLWZApjoPEy8hUyN/gCS
 SsHkL7roslycKor1yrt5hDXBJjrhzl8w1j+bxB7U7XA==
X-Gm-Gg: AfdE7cnwp9keuILxoCaxf2EOZpfp8jfotWiVT6l49rw9GsIqjsPr6gwrQQSY0Z58xAk
 5TLz07jZ+MY7c/rOMZwo39BNk6PUP/4vmRbLU1bglCaJJx/NTgaCuRCSvg8V/KJjkIuTqBQAwBh
 Xpl9EoYnnsBznXVO6Luz8M/2TRo3ChZMgJuVnXSm6QGi4k7IlOXKPY/GIXUJU63IsjVkhr9IJT2
 LqE+Hs/iDFG/e+X9hW/yIcdO+ysSmprSf6tkG8M1O3YBFuKze+RgODm9qqY0oa3gJu5Nsk+3uGM
 PJ4avTt1orj7wDrWED1qnVIDhR5ivBh/TuM4KvO4O6BxYjYW4Hycp52k
X-Received: by 2002:a05:690e:bc6:b0:662:cf48:c1b2 with SMTP id
 956f58d0204a3-66487dd13ccmr2185702d50.36.1782399410875; Thu, 25 Jun 2026
 07:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260623170354.43981-1-163wangjack@gmail.com>
 <20260623170354.43981-2-163wangjack@gmail.com>
In-Reply-To: <20260623170354.43981-2-163wangjack@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2026 15:56:39 +0100
X-Gm-Features: AVVi8Cf0SnjwXIQ1CTkOCAcv4qg3CRrPYKhZ3pvioTVadpdCugm7dlv0EnTdG9g
Message-ID: <CAFEAcA9fS9v-=BTSVM+BJg8V3hbFf7q9xaP3MMVFC04cFJ7HVw@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/misc/imx_ccm: Replace DPRINTF with trace events
To: jack wang <163wangjack@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 "open list:i.MX31 (kzm)" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Tue, 23 Jun 2026 at 18:04, jack wang <163wangjack@gmail.com> wrote:
>
> ---
>  hw/misc/imx_ccm.c    | 18 +++---------------
>  hw/misc/trace-events |  4 ++++
>  2 files changed, 7 insertions(+), 15 deletions(-)

>  uint32_t imx_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
> @@ -37,7 +26,7 @@ uint32_t imx_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
>          freq = klass->get_clock_frequency(dev, clock);
>      }
>
> -    DPRINTF("(clock = %d) = %u\n", clock, freq);
> +    trace_imx_ccm_get_clock_frequency(clock,freq);

Our coding style wants a space after this comma.
(Running your patches through scripts/checkpatch.pl can
catch this kind of style nit, though it sometimes has
false positives.)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

