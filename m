Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AD8E9A779
	for <qemu-trivial@archiver.kernel.org>; Tue, 24 Mar 2026 12:04:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1w50UU-0004gb-PR; Tue, 24 Mar 2026 08:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w50UQ-0004ft-1O
 for qemu-trivial@nongnu.org; Tue, 24 Mar 2026 08:04:09 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w50UM-0003x7-DN
 for qemu-trivial@nongnu.org; Tue, 24 Mar 2026 08:04:04 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-79ab50ee951so12622587b3.2
 for <qemu-trivial@nongnu.org>; Tue, 24 Mar 2026 05:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774353839; cv=none;
 d=google.com; s=arc-20240605;
 b=RgVI3GVaWToRujzTh7JuzKCNv5fL8as52FlMdQfTe9T91cErPnjRF62i986EaeeP4t
 rGsYTTC3Y9Uxo2bKabIr6tfCxAVDRxWRhdQAEBp/AN5+pqD0ika+JBkIpCrS6QcfN2qf
 k7PibLnWjnJMbiWcDD2/DB4xL+DZtlwrAoaLlNdsLndUW0wfjsQ4V3LW2wFhT2p7isHA
 ZrKwoCxYkS69gPd6kAliXJom4jQb3b6JqCYhhn14nvWkE+FLXbEF8oQwljtOjX7xvzxp
 RhOkTMmFO3ngYW1OjJIbrmSVmQSlj1WvSy07hfSb2q+JEsmqprtoSbmJvxwbrGuAmuiU
 9hYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=r7gq6yBnpG0O8tu5vXuylAbnJyVvKxBGP+f8Ge6CaOc=;
 fh=aOKVlMjWqflxt+q8VXDJei7LML4LJ1LiCg1m3EBuaqs=;
 b=F5llvjden2+rJgpp/Fa36ZTGAq2z96pyHgqjwU2Zfzovd9AAufXiNk/4RcrRY4B9Cz
 x95SQHqeFctMqzJ4bOSl6rljci0jo8EFKxpRLylTNLWU+MxtGGRHPXpLpdzgpNlOvjI1
 ykVbZCE8ROkIKJoG52rZ0YrvhLtzDzO9iAPBvAZgV2U9mSnEg/k530PApONtC9cOClDu
 0knhzKhGTE/Q3fkWxQDpXrn/27hL/DA6jYIAuRuThezRRUQQ7ozPck13f3d1vORtCHJG
 89rLXJts/jlCKva/IDUDmsCK5x59G53Iun7eJh1yyBGbATcbqojnQIg0OnCP0sC21Jpi
 gM1w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774353839; x=1774958639; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r7gq6yBnpG0O8tu5vXuylAbnJyVvKxBGP+f8Ge6CaOc=;
 b=xsobDZ9vHoze+Uf17qQmmH66tC6WDmfthHoFVOw3iwq2e8MzgoQ1NMMx3uPsD7i8n7
 +mSUFaCF2ikV6qosc3KW6CCRju76otLFdaoo7gyUbFn9vjeaZGvjCQzS5u1vDLwzpaFH
 UJ5L6+1zL57NGMnObDItLOZ4EZzBFxd9uy5VMH/99RgJLvEbfjeXKA6P6EXMuagPwN4n
 V9fWsTaokjMT62sF1yLmijShG1YC1bOYRFGAoTTBDY+hSOaxPbHBdQLnQbmAnH0an1F/
 bdRJytSKik6mhI6zb9Do13zmqZcnbtTAsxAtJXyBwm9qMH/0i5wrllNBeAdST8Zzb+3q
 0+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774353839; x=1774958639;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r7gq6yBnpG0O8tu5vXuylAbnJyVvKxBGP+f8Ge6CaOc=;
 b=J86A247DMQx2Qai3YcT2pWAtQKOvotJXWnjP7prQMoL3/NWiFOcBVpbT7x1mSj1QnX
 cAdwCt8gPiCpwlXlsT7h0ZRZH3rsp+IdrsUISo36XoOATq69EXXyQu8YXMx4378JVQXO
 9ja3yKKdfT5nb/+uPlL4/nRQd3JHl3nnkQinF8mV0jEUhza+vcPDYQklQIa5UccXgfup
 v+8radEuX+6jqnNafF882z0ozVUJZjCT2MevAdEVA4UIVf+EWtIhO7XbtS6esektKQwa
 PXy+hTE8uh+hPaH4uVVTm/neUx4EgUtpGSyYaegqxS377al265IjWJxpNxiWGfdJwIwO
 1tFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ4kwrlcT5w45EeDTqbNYQpOxbkDmJRN5UE6VqtyBoYk99eu01xWnVeCtQOQkx5Z5BuUhhfjnKS5b4gEo=@nongnu.org
X-Gm-Message-State: AOJu0YxLpil7zifvzOIMQ8oNj/9EbgyfxXjtHR882OXZf/eX9939mtNm
 6rKXOjjPZd1vnpZJOslsGnvlD2lM100rgUonlSSICTvMp15w+esBznoL8yvc/I9Tg6FdVfy5TAr
 UJdMoQTXyCBAW2KnTnvCnsARTqorPnDwd1G6V2F/hVA==
X-Gm-Gg: ATEYQzz7uP9xVqjyKCxk4W/ceuvOL4I9/RKNkeUI4vIK2rCJuM2Mht0GjoTJp5paRAu
 uS0nbyiHLsmEo8n9pgBxSKFkBeqbq71mgyqHuFK9zTxWOGpAaZg4/ZkY8NlGLo4EJuBV2nJwJIQ
 /iSqQgo7VZk7bKgzny+MFehx8qq/DS/y9wArnxOAgY8zEJsSHfSf7MoYHeuCBzzXO5qvRbpunqG
 /wUlMrn18geHzO6xdmGsHBMliiPkMlRSLgqkOyfhQ4KxqczeNISONsKg/wvB2y8JfzocfUN8xIX
 P/t0LGBqLLhIl3l6Awe8cEqfvCYT5D9xoV+CXhT37vrPh2MgSiL/9y0kI5tg53/GXRA=
X-Received: by 2002:a05:690c:e72c:b0:79a:5384:cb52 with SMTP id
 00721157ae682-79a90c19cafmr125422487b3.48.1774353839083; Tue, 24 Mar 2026
 05:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260323165736.386677-1-mjt@tls.msk.ru>
In-Reply-To: <20260323165736.386677-1-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Mar 2026 12:03:47 +0000
X-Gm-Features: AaiRm52atFp1oFeyE9BUGIMrK7S2CX7fx3BgaxuvPZO8wWw5I71JLfQz8UXUQBA
Message-ID: <CAFEAcA_RTauRjGo0vBQ38w6eTQ3MasR3xurTaTfp8zVk8TC=Dg@mail.gmail.com>
Subject: Re: [PULL v2 0/4] Trivial patches for 2026-03-23
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Mon, 23 Mar 2026 at 16:58, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> The following changes since commit eb153d8fd3be325a5aa7e1a6a73be8854eeaaf27:
>
>   Merge tag 'pull-target-arm-20260323' of https://gitlab.com/pm215/qemu into staging (2026-03-23 10:55:20 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/mjt0k/qemu.git tags/pull-trivial-patches
>
> for you to fetch changes up to b7ae542de40364cccb683a67e5f891d3ef69818f:
>
>   Fix several typos in documentation (found by codespell) (2026-03-23 19:55:24 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2026-03-23
>
> minor u2f tweaks ny Stefan, and small docs/comments updates
>
> v2: fix email address of Stefan.
>     (not resending the series)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/11.0
for any user-visible changes.

-- PMM

