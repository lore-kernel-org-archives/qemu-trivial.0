Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE6ACD98F0
	for <qemu-trivial@archiver.kernel.org>; Sun, 21 Jun 2026 13:49:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wbIXy-0006Ka-Cr; Sun, 21 Jun 2026 09:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wbIXw-0006KG-Kt
 for qemu-trivial@nongnu.org; Sun, 21 Jun 2026 09:49:12 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wbIXv-0003uo-8K
 for qemu-trivial@nongnu.org; Sun, 21 Jun 2026 09:49:12 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-66319257aa1so1003506d50.2
 for <qemu-trivial@nongnu.org>; Sun, 21 Jun 2026 06:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782049750; cv=none;
 d=google.com; s=arc-20240605;
 b=Y4OLIm+BaMLlFcR4afOJEaaSD8+T6kb1aMXdlRrFg7+VfYu9MGtUlOQICsxWHXafiT
 OLkESXUTyigc8JmqePMX/V8WFSfOx+AERKRB02mZrdW4TGKblTh+r5mMkuneLDdUWbA8
 Cc34SzBAP2m66rYxGuB9E+IoNqCur1Na26Sf89MfScKowwv/F+Mot7UtKN/9Q6/MFvKP
 W3tAkdHD0xUEhois4eyRL25GGSMGXQbDwlqxfEnsetvY+aQ6tzZyo/N9sTQd364XE04F
 GXhKdaWsAWVRjq983ol1kGF292lBbpASN5Pyd74EilnnuvGJ2J81hwulap80UqO6yJIZ
 uAmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=/jQarkWKu6AgSWJrVhOLVRSLvpVVrUGu9tmXqpmNEOY=;
 fh=AbvihsZSG5z9r95PVMPunLmswU3XZRyrhnpbbTkv86Y=;
 b=ZPOkO4cXWshfOYT4h+H9vTEyh+4njvBSshweLuc++d0f5Bfv/6gpu5DPBN8LtudXX7
 2k66TKPZnX9Fc98C6cEpKTE5xuT+rOJnA3m6WWGJ7CsPg3PCYvycDJbR/AQaCTaVOjyh
 erPHVTVcVEbCVGapyu22icYwb90DNayPoevGMK0c+bBTYaoXyDQR95Qk/FxPBNyrxOrM
 Mf+P6Z+BC4RN1Ec9SPy4Z2EqfOuxmXXe8rKx597djn3EGdIrOsN3CAgOTF/1dYZIShXW
 eLKhAp86X+C5oSC1sUWIay9BwYNK0wnaD758O7U9hrvH31+4JcfU6zmk1l7ca8hDigc5
 k5dQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782049750; x=1782654550; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/jQarkWKu6AgSWJrVhOLVRSLvpVVrUGu9tmXqpmNEOY=;
 b=GAhDgLktYUAXE/Jdc9EvJ7b/rzcm2RzJwAQJV2/OQDhOXa10IxxvfqxsAIjjK19qoZ
 koOYUlZIKAoGOT0YKKEEPKKmNs5QEqtBCamoGzxPpVNUOhK+MFEHmhagc3/H1T+BWhCa
 gqgF0LpFXQYX6gzqi6JHxNlALEijlSEapAAgJfPC9Pu5WG1hvCtfxP8N4pPWHmR+FjQP
 xpBCamY8JspB7gkxwChfQ6HxsGNt0sv7aNvkaSBIuRk19UTVid6NCwbALsg4oBZC3Ee5
 l863Qe3EJ3YrVKjjxbrwEpWUYrKzlimWjQU1BnDMwbTyWRvYJB34ukULfo7E7ARkUShL
 fdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782049750; x=1782654550;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/jQarkWKu6AgSWJrVhOLVRSLvpVVrUGu9tmXqpmNEOY=;
 b=N7P2SBBIU3q1SD3R1nzLvXskj8WiYoknK7cyg8DY/yng5EzvDDfpIWm0dykMsKM/hU
 /0YymP6mCSnKP1hClMx4gWd5/wznbz+trfwehB6BJIIHHbiAjITii4dLHd5SveXpR+10
 fZufz2ZfBPsuwM+PB5WLsBMyqW0KxZgJDSEycWQyhf8+PzM8e6znEWJZuqhTz4Q85TsI
 ktsaVYOcB/Rn4eYJiLiVG4Z6eizvsg6q1xJPsW/7JH3eMpzAu/N1cKxzH+etLd2bBkGB
 4gbT1ww2wJ+IbZ8QrO3kg4Ls/IJlT6WRmpjMHweP/d8WSNbVffI42rIcHHaPXYtxQyul
 AU2A==
X-Forwarded-Encrypted: i=1;
 AHgh+RpIohLPZiei1qBJQQ0aDoS8ZlXw7MHvjL92zqo5nnboZvtovIGHmdfRUor/4Hsr6MAD1opO+t26ZnPvKT4=@nongnu.org
X-Gm-Message-State: AOJu0YyrwIc6Ujh7xB2HNh/mYqUuaTDvK73KnDiKAZb3bjjMZaTeEGmb
 kF3SU69z9G+CPOfTDYmBrmC8CRi9HzIqpacAI132Czq+/9Nywp4bIlzLFhQ5yTEggNOnxVEirN5
 D8/osWHIXKYB6tO8quFnsnz5VBU7VvwgUPpQRWACWZ1/ozPX/Al8L
X-Gm-Gg: AfdE7cng5WYsTbQKVML9HMRu22TDWg6gCkaFsNzC5QB5T4ZX/lRp155MrPg87bH3F6f
 PbuSyc5DoNJ2RB5RCDGZ3ZLMt6L6NdjhafGLANzPzkYShnpfykyb3PDwZ4Ajsd2EGN/o+Xl6ito
 GUJiz6Mfnqy5YIcTmxA3YXQrkg9u3EJKGPoCWqo4nDxx4vDmcs3di7BvmFwqOVWRUu6VfyfaeIm
 yiyN4NPVp6+a5RbrK7ieuuT+XtK1O2Kp9NNwOJ1AiRLlfaYH5joiOBTlxpHiwaOk8fOabaQLoeu
 eU8PqU9FFAZywwPYNo2ozqyYSTCpwGrSg2MJHAVErk60A+0+4blQilzt
X-Received: by 2002:a53:ac9d:0:b0:662:cea4:dd6a with SMTP id
 956f58d0204a3-662fcb8bf01mr11642109d50.48.1782049749681; Sun, 21 Jun 2026
 06:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260620171318.24189-1-randomjack94dev@gmail.com>
 <CAFEAcA9_Cy1x46YQSawzmF_fc4GVq_77vyRF7TWwruBND9eCGg@mail.gmail.com>
 <CAFvcSaQ4R7oQ9KMrEb81mZOaqZaR5XqCLn8-DJn-OX7GQuSSCQ@mail.gmail.com>
In-Reply-To: <CAFvcSaQ4R7oQ9KMrEb81mZOaqZaR5XqCLn8-DJn-OX7GQuSSCQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 21 Jun 2026 14:48:58 +0100
X-Gm-Features: AVVi8CcYec0Ui2IlhvJVnOzC_3k_Dgfl4-8V7qY5YCmHiDn_LXEnAynzk_4BIOw
Message-ID: <CAFEAcA_MYAnYqea-1ZW8vu-c=j0s=Eb-jwc5d8VjKXiOMV=-vg@mail.gmail.com>
Subject: Re: [PATCH] hw/dma/soc_dma: Replace if-else chain with array lookup
To: Evgeny <randomjack94dev@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
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

On Sat, 20 Jun 2026 at 21:33, Evgeny <randomjack94dev@gmail.com> wrote:
>
> Dear Peter,
>
> No particular reason.
>
> Just found a small refactor-like TODO comment.
> Did not think about this code being ancient.
> Feel free to discard the patch then.

No worries. Unfortunately QEMU has a fair bit of
old code, so TODO comments are often a bit misleading
about how worthwhile making some change is. Some of
them effectively degrade into "we could do this but
it isn't worth the time" :-/

-- PMM

