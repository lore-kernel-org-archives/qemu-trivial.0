Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC216F327C9
	for <qemu-trivial@archiver.kernel.org>; Tue, 21 Apr 2026 08:42:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wF6gM-0006Ij-BS; Tue, 21 Apr 2026 04:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wF6gK-0006Hy-Fx
 for qemu-trivial@nongnu.org; Tue, 21 Apr 2026 04:42:08 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wF6gI-00038Z-TX
 for qemu-trivial@nongnu.org; Tue, 21 Apr 2026 04:42:08 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-650789b22e3so4473266d50.1
 for <qemu-trivial@nongnu.org>; Tue, 21 Apr 2026 01:42:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776760925; cv=none;
 d=google.com; s=arc-20240605;
 b=IPb/Empv5367tqC+zPk5F/L4JKtWz4kE/kcP2KoZ/syinz4l9uKRDsRfvooH+nCq7S
 1+pzEqIno3NVGCttT49zVP1OQwQx/NdX5+1tEEjn4U+qbxiZmRfNrkm58d74UyYq34hH
 9Yl3VsGDwPRmZdLl8+PWGo5hC2w7Gpq0zla0saHOLsoYm0CgghF/tTiLyqc9qvCG2RGu
 0yL3XqaUR+QHofeIiWPU8fLcPvv1IRQMMhU6KW1XUc4E2TRItNu4fVajmQbk31kcLnK7
 go5QQpVskAANDf3zRJ1SUlOrmIEzWVuu+0zDLmv3HZwEHz69vaE4O4rGhk6YD6a4U2ha
 BPgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=pkN1JBmanUEOKiq6af58ThegBRjT5yctGC3q3GS1kYU=;
 fh=3sR8HFbOMl6VSvD5F80MyBA3jGmQCNekhVXHJuJTWCY=;
 b=gi+Qxyz3aan3MavX2J0E8GkiulWoxrp8wM5BbU3X6IRMW3jAL86S5Y2lJ93cR0fvqC
 FIeSgzPM9WQRp5gts3bMCLE3gsP1PDtp3KOM+7iT+NMKjovz7QMKSkZjw1uD/dUaQPL7
 phPN9RBHg4dPKTuJ6QTzDONkaT/ce89xQFx9rc4jBbVdWLiRvtqm3lPJ1A2PrU0rj7hq
 A2Gukg7XLa1oG72n4dof1ULRmUhiqK8rvd49ElCZdW/NJnwpXmTAX2f0nNb9wyhWYP0b
 xjeG5CrX0vaoIMrSYKxVXUWhIriUCo+SvTQMUgf4A7qj/py+CvXiqIje0LiCGo5JrK5P
 QVIQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776760925; x=1777365725; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pkN1JBmanUEOKiq6af58ThegBRjT5yctGC3q3GS1kYU=;
 b=rLlgR/DP4+Dpsnb1k3AXajrWpRNTHSZWpFe/QhLsdZAPcIkkaYk9DswaasRcuBBMnK
 TZLmniPUNco0OBiPyOArPyXbs/576x8fA/SSQa/NuNeL2+rbAA3f0OwVbNVkbaN1A5ub
 fhnURtcEPV/ds1yS96Rn2gl/pWMTJywoNZzv/1onCNPASST1qXkuLVawab3DaTNPL9V9
 TolTH63QVXZ1Vkstj9q/ZAs+jtvX3C+Rhoob76q01wvxN2DvVBXpGzKFc2uw02c3Jk9m
 z4YFfEzRM0TRrrzUZdt7aF79Yj8RKQ3h2wJ3afUzI9Z32lS5EfYjj2AtmZ3mmigLcRl7
 2++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776760925; x=1777365725;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pkN1JBmanUEOKiq6af58ThegBRjT5yctGC3q3GS1kYU=;
 b=oZmoACK6VEn9vA09+JkiW1noEJs3vrzZQihGI9PulcMvp4ZlzpYKaluft0mhnJ2SZU
 5w1Oudi15owAHk2qdePSINscM+iJTlslVtHiS1yAlnhOj3cYiVthWqhSIRthyfnk6yzd
 qO5f+u0E/7zbO31o+7XDkbZCEu4C1sCPUSzrg4WOlrFwTAe6faJstAKOiPDEgEQkfDVT
 Xdrty/JhdNsgdLTWKU51dDha+PzqNVJ9N/E/sS/sIpvZMyh8q9fHwWpueGvadpHrCie/
 rught3fSmGqI+tjZg+4mtTHvVmjjFpBj1gg39lvHKf1yb4PByaruvdluL0wuDc7E3XEQ
 3D4Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+z0jozn8IziXw6imj5Fvu9SdjlMt0AAM1thF254V+EkiyU4MDlCUnf1mi1HC9knLPV+PYBZo+y9tC4cRM=@nongnu.org
X-Gm-Message-State: AOJu0YyVsWAVct/XqdyWf/jzwUKS0+ZEeXR6WiGfN3AT3biZnhkx9c6f
 +s+W+VLXIzuj3BmUKUAnqRBqAh5rsqCFxeLxnp0vjN/YT2CdGfEhh+tulylZv9drzl1hYmj6bOL
 zp/Su4Ru4xIbEn9L+oyXWnR8TGMOQqHWTbuEZQhlXEg==
X-Gm-Gg: AeBDievm2/1x6N09Ffkpu/eUlz0GuAIWGlNMGeG1K6BdfFfmUs5G5nxtVTd/m1I1D00
 ykatvVmDJzC3nMt/NsBPEgZ+4qVLROQbuzwMBf4M/Xnia4qSo6hA2z5XBdzLDc+85X/ch9dixZT
 KVu6oofBYKd0uaiiWu8dgC18CBTNS6M6WcENdUk0zHGzKNOP280RbUVrMBZL96lpw3ZiR7i17Du
 c8J5HUn7fPM4Rgq5u5lfLyCYjeODD1qx99BSi7YP4LThwu0aZ69wBf50pq+rwljBQ5Bd59sw0kB
 yVtJKg0MHPtmxoWo8LF8913qKHNYkjmiDwlo/wCpDwQWPoDeCwXuSGf3imtCSBTRlo+9qPV1wjf
 5GA==
X-Received: by 2002:a05:690e:130e:b0:651:bc3b:75c7 with SMTP id
 956f58d0204a3-65310804a7bmr16086869d50.11.1776760925553; Tue, 21 Apr 2026
 01:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260421082935.85995-1-thuth@redhat.com>
In-Reply-To: <20260421082935.85995-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Apr 2026 09:41:54 +0100
X-Gm-Features: AQROBzBjzkjg82Uxm_550fvWhUsgz7_cl9OzZbdv5DNaq_GFpL9-x8n_64U9vOM
Message-ID: <CAFEAcA9Yx_kSc0KYbJW1aJcuCpnhQ=1v4-cebq-Y7XO_+Y+=Rw@mail.gmail.com>
Subject: Re: [PATCH] hw/misc: Fix the valid access size to the avr-power device
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Tue, 21 Apr 2026 at 09:29, Thomas Huth <thuth@redhat.com> wrote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> Accessing the device with in non-single byte mode currently causes
> QEMU to abort:
>
>  $ echo "writew 0x800064 0x4142" | \
>    ./qemu-system-avr -M mega2560 -display none -qtest stdio -accel qtest
>  [I 0.000000] OPENED
>  [R +0.001784] writew 0x800064 0x4142
>  qemu-system-avr: ../../devel/qemu/hw/misc/avr_power.c:58: avr_mask_write:
>   Assertion `offset == 0' failed.
>  Aborted                    (core dumped)
>
> Set the valid max access size to 1 to fix the problem.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3393
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/misc/avr_power.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/misc/avr_power.c b/hw/misc/avr_power.c
> index f42cf4fd906..42be2656911 100644
> --- a/hw/misc/avr_power.c
> +++ b/hw/misc/avr_power.c
> @@ -73,6 +73,9 @@ static const MemoryRegionOps avr_mask_ops = {
>      .impl = {
>          .max_access_size = 1,
>      },
> +    .valid = {
> +        .max_access_size = 1,
> +    },
>  };

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

