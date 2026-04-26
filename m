Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90106FF885D
	for <qemu-trivial@archiver.kernel.org>; Sun, 26 Apr 2026 12:58:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wGz4C-0007Cq-JC; Sun, 26 Apr 2026 08:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wGz48-0007CN-TK
 for qemu-trivial@nongnu.org; Sun, 26 Apr 2026 08:58:28 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wGz45-0006ki-0I
 for qemu-trivial@nongnu.org; Sun, 26 Apr 2026 08:58:27 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-6501d242e3fso8849733d50.0
 for <qemu-trivial@nongnu.org>; Sun, 26 Apr 2026 05:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777208303; cv=none;
 d=google.com; s=arc-20240605;
 b=VsfagHxLPcKaegB7paZAOp7WMqvJurAIKrGlKOJvHdbI0OhB4GtP23Vwd/q8CMJmtf
 BsBQVWKqGauYVOZoI6h7a7hoA5AqvrYTQQo27t+VwSFfqlAoYgpglEdTG4fnZNQsM4s5
 UiT6iP7Z5sjw47eW+890+B9f491+89pgzl0/+xGylO5vasveeNqB3z0Ant1qdTiW/ssG
 Pej2SpCkRkFQsCNOehA4Q4GI4Gckx6GBMA6bvzWrS1D5f7d6r1Dg04j9PDQGc8FIxbLv
 qQAAC2hhdO1kkwSGmRfdKMALXr6JQCeHvRSmkJM5NTdhXx3cZmQXa5CzvwysD3wW9tJq
 0K6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=0UHWkSpJ/NIGgjibfTym2Ka0RKxid94udmKYvdVB17M=;
 fh=QXyTRQ0k9wVGE/JWrZBxlnEXpHfOfZuUPPgOPHUL4HM=;
 b=Dcyz0NSZLB9xxd5gJoqSMA/Fae/L/V8Z9jMoTRWbLs4EBt3QUCTX2RFzZqCdDmBtGh
 w62JbWw1aoEixh4OJIZETudwsoPeIuuCVJTDwcLsvocJFHR9AgEtgVKomr42tQD5jf0i
 mc56Ctlbh8lg1NwU+4XNd+doLyzRlOCAp9JMEKGPxL/53z05VFqZX9Mcg63SX451ch3h
 ZwQBLkdYbXxATLO3BAqug0i2s/Cv0ilHHlpBkluFTLBRwMn7rzfCaoGYUEjc/j+IZOEZ
 6Va9KZcOahVKHKXElDNkYTZVyjYzaI/r4txJQoxSCbOL9UPXyK9/4+GUphqEM/WTzkhq
 tY/w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777208303; x=1777813103; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0UHWkSpJ/NIGgjibfTym2Ka0RKxid94udmKYvdVB17M=;
 b=hiiC2uD6nEIhRKFrBuLkIkV2OOdIjr6Q49UOys1pILSaOjz9wTUZKm+nRnXXe72C+b
 DPZ4gzTJA2DIO2kewryxDuCIlJLbty+aJO13bl7o95GhDMe6HfAK08pU+scN5bi/cx3d
 lUJKkyR7DEZjJsN/bsPggkQuF6BznCw4pAB5SG6vfjotcX8sTWwukZLeXEMNLV/5fbbe
 +rvNhNW2LIDa0PAxirysb4ucPHTF4uYln6aG0wpdQBE71oYedYX5uc+H/XP6Gn15tARi
 bZ7EdZhop1IrOnjTmlYNtzjfMQgisSAcrh24ZXXtqsw3yajfNRw4BN1tYtoIZ+IvQYgH
 8bHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777208303; x=1777813103;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0UHWkSpJ/NIGgjibfTym2Ka0RKxid94udmKYvdVB17M=;
 b=o4GVOdylW72tqu4sWL9KADSZuODQXdNyX01xtU6Tw9rIA+94JLHbj6oln3MARbHw7M
 2LfGDf+m5egjU8ZCHvUiwSTTu21DSfBWE3X0nfpUigh7kuKysKpIMPPexvwEYMaE7ncY
 sJdrP/zPzqjIB3NlwI29pQryfemghoUrUAcv44MBLruAZ+09oAlYnpHMWwI3EMpGLOAa
 0d3oJ6Z8xOJmXFnSsd3Y06el+c8uEWNG0YY2oYZuIgPgCbMwJxjgjVlp/8x0VGHloI1Q
 QI+Ndg4Cc2r12P8Ek8wGYYY9ZSS3ONieUnLdoAG0vmRq6egiMK3HYoWRwCcT+H2wbfq5
 YUmg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8QpXD/LmBic2vZlmbnkT6gtYj90xNmjcqDOC5von/SJAvH10U9K1xltM3SKuI6jH07wPP7SeC4Xs+nzk8=@nongnu.org
X-Gm-Message-State: AOJu0Ywr7FgqLrzRsFRtNMBrgA8JQ8zqeahzRXA+JJ+Yqzrpo2+DFqI3
 1YLuDEeKlcUTlmF1pqBZhQJWLsIvB5PMQrwH8guvxRzIUqbqbisSb1d5zdnrogYvOT22LyXGmCh
 gNR47rO36AlwQ9SVQXgnA3fBFJ9kP8jKFAJthfFaQNw==
X-Gm-Gg: AeBDietLhIII+ndg4fF+iF9mZpJumkMbFSdrbYuOiRszoijH8n5cKt7mTfwGTmnZsRu
 uFqloVYDuEn9Ei2tN8fyaUJc6Hfkqav+iRw7xJNGIs3zrFuwusdC1GMEGYgSJEIptznMjjstjEG
 53ki9hLQ7ErdctGue9WNqBQx9d4AfvZ6mgnnqCSK6c6LvBMh7cUaUiqgtSF5JHhYjPgoMcdQMjj
 K2SAsDSaW1lnRLjMUeR0rkaxF2J6B+zbnFJOrD6Fnsi1+dA86cV6P0HesaMXBDwoey/994PEKqo
 xixRcXTyIVMwwV5iU8VlT3p6PzOhbIO6i5Q3Iav2CSVgXJPX0QcpBV/jkYKE7AjkfkeQCCvVx1p
 FLw==
X-Received: by 2002:a05:690e:418e:b0:651:c268:479 with SMTP id
 956f58d0204a3-65310acca30mr28600423d50.57.1777208303303; Sun, 26 Apr 2026
 05:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260421082935.85995-1-thuth@redhat.com>
 <c04615d4-2842-49ae-b8e4-8d1475832ab0@tls.msk.ru>
In-Reply-To: <c04615d4-2842-49ae-b8e4-8d1475832ab0@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 26 Apr 2026 13:58:10 +0100
X-Gm-Features: AQROBzBP730PUuXnXiHi5NzGXmLACGtDko0tduD0dOf3hEA5HNbFtkrNDfwIy6E
Message-ID: <CAFEAcA8-TEcFd1bf+AmJL_zcmHmuE6=UxW5mndZK3kZ4orVJpg@mail.gmail.com>
Subject: Re: [PATCH] hw/misc: Fix the valid access size to the avr-power device
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, 
 Michael Rolnik <mrolnik@gmail.com>, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Sun, 26 Apr 2026 at 12:50, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> On 21.04.2026 11:29, Thomas Huth wrote:
> > From: Thomas Huth <thuth@redhat.com>
> >
> > Accessing the device with in non-single byte mode currently causes
> > QEMU to abort:
> >
> >   $ echo "writew 0x800064 0x4142" | \
> >     ./qemu-system-avr -M mega2560 -display none -qtest stdio -accel qtest
> >   [I 0.000000] OPENED
> >   [R +0.001784] writew 0x800064 0x4142
> >   qemu-system-avr: ../../devel/qemu/hw/misc/avr_power.c:58: avr_mask_write:
> >    Assertion `offset == 0' failed.
> >   Aborted                    (core dumped)
> >
> > Set the valid max access size to 1 to fix the problem.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3393
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
>
> This looks like a minor issue, yet it feels like this change is a good
> candidate for the current stable releases.  Please let me know if it isn't.

Yes, this is fine for stable.

-- PMM

