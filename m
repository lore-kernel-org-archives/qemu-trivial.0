Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B86CD98E4
	for <qemu-trivial@archiver.kernel.org>; Sat, 20 Jun 2026 20:23:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wb2Dp-00075U-Oj; Sat, 20 Jun 2026 16:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wb2Dn-000752-CR
 for qemu-trivial@nongnu.org; Sat, 20 Jun 2026 16:23:19 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wb2Dl-0005pM-05
 for qemu-trivial@nongnu.org; Sat, 20 Jun 2026 16:23:19 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-6626cd98209so2895798d50.3
 for <qemu-trivial@nongnu.org>; Sat, 20 Jun 2026 13:23:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781986995; cv=none;
 d=google.com; s=arc-20240605;
 b=CAVZt9npBGz6LHe3fIxAoPgdRhS/KFMIYBTvdN4mcNBVmGBOSqu3eKLhsQqDwAtcUk
 XGcBqLNDfzs0W9CseV5G6YDApJk0xEO54ADX7UOye0Sq++wsHnHVcBuYbCzdrcCxvvss
 XeHMMhWiawsDCgHL1uc2oBATU4mxFbVaw0Y6+tVKfWg45NGdc8D0dQh7BE9+/s5IzFfB
 P9HO98Ukow+qoQSEveJDlvHf9i5WqrovZMI7cHrrgEs+aG+K/lUperrJ1aPlZA+LLyqC
 3xNRGhdTzdYV6l/X30ltNs4iSl4o/SxDUqYLDiw7iAOKwXwFKNrf1aWmCvQNuk/WtyP+
 g53Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=RUSAOhG+fFA5GklYlsz/KwE9hrrVDZgPAZwdexY6uk0=;
 fh=xTnnjOYUhlmAcYNqH6uPZ4J9+8YY6hum3Nf9qlz+StI=;
 b=I3gc0Rccj8tHBiYA2lKUJ/JxujFotojk76dB9kQDQ67ZKyEHcqSQAN1u5OChuD4ixR
 833WOoql5Yan8RFEcohAGpZhoCM0r6BxLrDzh0b+o4fuRQsfxyXt7J3Ti016cS76v6+U
 E8rgPbfhb4oFg+nKOk8MjWbXxKUV5V6zv53E0ngA0bURX5OW9N+BN3N40SxdRxv/5KYU
 WQlx8Oa13vfj6wvCd3LPWj7ZjZ/y2cnljl/aqN1jhck+Y/B0pRzL0Fpvbg2TNiOPm64t
 x0hUeOxvJk9dmAcMtYWfS6jwnRlR/afvOzf5B/tBu2/im84kDnT4uBvx2LEj/a0Wm5n7
 3yIA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781986995; x=1782591795; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RUSAOhG+fFA5GklYlsz/KwE9hrrVDZgPAZwdexY6uk0=;
 b=gcAWaOTHtraGckuxP5jipY1epN+KMyWuNb5P/OR+4V36pLjjD536Id3fwTJhsKuhk8
 kvLw2dhmi7SntSf0qu+Z/StWrBGhmfKB1s0oKeau6VWA4H0InCqrGkiT9YdMwn1RL/tU
 RVfdk2uHBa2km9m040gxr5pi0Cc5RNyw+DT55Y0qaMjo7/x0PrkwYO0oE7UGuX+nBguQ
 JHWqw7ABtcuXOTaDDg8+4KmMnrOa2yxP0yMmVX8zoYnQWxBloGqIYeErKimJGxADYADf
 6xQBrbRE0gKt60XVeqWBlUgZ95YE7BbBhDs2lGWVd/O7Y7GoaQ1HhORWS6wtFq7vleiN
 chtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781986995; x=1782591795;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RUSAOhG+fFA5GklYlsz/KwE9hrrVDZgPAZwdexY6uk0=;
 b=IrnuY0bBFm1619mhnIEv8eQE+isUmAJZp7uHMpDE1quld1LKPjhJc21Fwfqll/5Tpf
 KOXaFndlx9gZVmREPP55ZKIjjjZSWPoYSGZXSbX9xTpQAxGnNH3VZBKfFNmIuFaK0F1m
 AE4N7nGbI0KJr3fDCwOY5DWzLj5LPRz5yvECRHf6q7tpi3VbjhX2Z3VO/PNut+ZQPOWS
 rU+RDMSnI+8mrQJwiBR8+wKM1GD1f5H4cUaRqAhemogD2141jmunDoXcL1JJ12dPyzF6
 bnFwNA4kve3VrgdlU8UJkbzei05+RRzY19dv/sdypawcFeGmeR79mY1664swZVa8RsGw
 KTGw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpqfDSJY5BzGHP8U+183LylYR1RjGJlWTGekt9mraWbTMVnEFQGmYz5g+H/1BEZUFqivwWX6rczYXLbBL8=@nongnu.org
X-Gm-Message-State: AOJu0YxtlOrIPccfZA6LhiohEiBOhsNS3AObbRIL3lJMZFNfjK/DB/IB
 Dtib+h53zwyXOL2DcxsKfzRoZccsu16rDgd1O+tjwF1U0+jmUjHQDLgkOkOhE0H8L/a0+fk+NHd
 k3ZzBfs7jx3tUytgmB8nS+sb3YN36h/dtuBDM6VCxAQ==
X-Gm-Gg: AfdE7cnPBsCeqnqDNtaZUCgK1qKwf6VP68bXDBvts1hn1ONzM3/qnFL20J2pdD/UTE6
 5gOC5zpyXm9ix8rnmwMrkUstKWaOdBrP+8IiP3QIMmb/AJ9Mv37B6xXvgKCWUPvxVZTRxO90N2R
 NN1PyHxPWEbWMnHXI8xT8sLbM2ar4+9EIa/P5jhIc1hkOhUPJNVIqtlVl942O68gVkK0XxGSsdi
 ahWG2dQkASKPLi+kjnXSXVb1WUyyMcHCMcynWIrqzpZj7iR7xmJ+nti5LjXW7wotL7qtt0j4zK0
 5AWz1HYE9YF+iBT4xTgbSFXgyJeApUXvf9qnY09C0SU5HLf2sTvHVXBm
X-Received: by 2002:a05:690e:d48:b0:651:8d82:acc2 with SMTP id
 956f58d0204a3-662ffed7444mr7242271d50.63.1781986995038; Sat, 20 Jun 2026
 13:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260620171318.24189-1-randomjack94dev@gmail.com>
In-Reply-To: <20260620171318.24189-1-randomjack94dev@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 20 Jun 2026 21:23:03 +0100
X-Gm-Features: AVVi8Cc8sp4L0ipNZktBvLI74cn0aLYEOH3giG6BOSHJebxbeHlYKFkD1W2wcw0
Message-ID: <CAFEAcA9_Cy1x46YQSawzmF_fc4GVq_77vyRF7TWwruBND9eCGg@mail.gmail.com>
Subject: Re: [PATCH] hw/dma/soc_dma: Replace if-else chain with array lookup
To: Evgeny Kolmakov <randomjack94dev@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Sat, 20 Jun 2026 at 18:20, Evgeny Kolmakov <randomjack94dev@gmail.com> wrote:
>
> Refactor transfer_fn assignment in soc_dma_ch_update()
> via array lookup as suggested by the TODO comment.
>
> Signed-off-by: Evgeny Kolmakov <randomjack94dev@gmail.com>

Any particular reason why you're looking at this ancient
code? It's used only by the omap SoC -- if we care enough
to do anything to it then converting it to qdev is fairly
high up the list...

thanks
-- PMM

