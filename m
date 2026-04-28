Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3BCFF886D
	for <qemu-trivial@archiver.kernel.org>; Tue, 28 Apr 2026 17:58:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wHmhQ-0001gC-7k; Tue, 28 Apr 2026 13:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHmhM-0001fX-74
 for qemu-trivial@nongnu.org; Tue, 28 Apr 2026 13:58:17 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHmhI-0005aP-Od
 for qemu-trivial@nongnu.org; Tue, 28 Apr 2026 13:58:14 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43d73352cf2so9856327f8f.1
 for <qemu-trivial@nongnu.org>; Tue, 28 Apr 2026 10:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777399091; x=1778003891; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3Aq2Gil1AMXyD/F9EJ4y46TV8rTmmGtXbXlr2sBHriQ=;
 b=PvQ52J+2I1VPjV+rC4vwcwqIcQYEA9JpBeekkOH/KzdAJ9+dRW5kByHCQAddsP2Yk1
 s/uEbLh34+bw8o0b1omAmAphuxA17haSowh5zv34o35ZtlY/XvhRFR9A7g1vba3bN67s
 7qyukaEbM4FBH98mR+PLi30ltOpK+7KmRLFyCEwrBFsVwG2uFuMTGwkkf9afmXnCJx1d
 +ifhWqr3mIZzLuDV8j6SDMX3H+NPhgXq94WT2Cxt1GM4FQ+C6ZZBT3vma/dtDWRRU43f
 wdzA6e9uyFcC9FInIlTeSUyawinxl3XKeWAi8rqE7RiJWPYqoW0Fc7p5Z7KjJIdFixGC
 VPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777399091; x=1778003891;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Aq2Gil1AMXyD/F9EJ4y46TV8rTmmGtXbXlr2sBHriQ=;
 b=l7nA5kefNVDGBfOweSWox+Nqg09j6nQA5/Jik2zG7VWaUYOAltxHxwu5eDUb8I6m+X
 qpPfnzbHKuFQGBj1RTDa7AmtjkRZRISwnRIqMFavV2b2WNVgvUO2/bRKz2kZ6c69IDve
 d7oXti2zjf5iQ90/AU4/NdHaXUC6YqorbNGsdTs+8EDMG3y9oV/32KdO3krHUxy14Uej
 S1S0CXsK190iqxrRx35dmpoqezeZ09IqWSeLFmFKFR/jA9X75euSIUOZCuglY80dOBOb
 QN+TBAq5dG7n+WTN3sf5eNnoiL7ODMO4zY+tqvIj8ubBA9kdcpZjYabYsHoS7GVlxlD+
 OZKw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9hHkVcB0vPlNLEEvL7YDnPYIvAcJ3oblWFNfjMQYPkSaKuGPq9+o8a5fwQ0/jfaqj8adI0y3RWurUVttE=@nongnu.org
X-Gm-Message-State: AOJu0Yy46aPuQZ85VS8f2LBspU3qNIRb48mmmm/nGaczLXs72F5puXQ5
 F+xjfao7MUOlAqJOff8Tzz72eMuOB+cUcc1NryTJb6Z2Y0xxROyw/0QgzQI+z0xy0+M=
X-Gm-Gg: AeBDiet/sJLYJqAeQ7GvNFuPC/Lr89gnWzQAhqMXb0o1fmSUQ6sRfquBxck8LGL/Ig3
 NK07wHuK5MN3NczCg8fpqIQNvITxU4jezPabL4W18ehe9RMeUTzRlwZ/yYG1LDchZF3tnufmIx9
 rMBiNo3KXrCSFBEoXaleH1Pem8804QUVzdNqZS34j5M2u4sLtolw/YPnxjw2OP/t+uRx2a/YkUZ
 qRYJqBPXrI4MVZ3hzmEOsnXhNNJZZSXEbqrVzNCQgFJ0mSUycJcytT2Hlh02AdRRGtVKkdUHS/L
 o0gkBfGFBhsS5CSLwkhG794S8Iub+At5y0woyDvAqbU9ap9V+SHYK/HshxIrobRP5DH3FgyRfYi
 u+HoyGTTYMHWSlCWuAn4Eh1Dz/lsIAysUtelVLHnD+Rr1ljBIqtS72bXRBgLaGCEv86mSVoIudU
 7f1MrZ4pOQVIsOpTXTI8MphNGs4fe9e4LkpuAwDfO2vP5XIIZ2tZ8jgtAch9fcdCYS4wbzUrZ8q
 7S6
X-Received: by 2002:a05:6000:250f:b0:43f:e41d:85f2 with SMTP id
 ffacd0b85a97d-4464839c9bcmr7788263f8f.2.1777399091141; 
 Tue, 28 Apr 2026 10:58:11 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4463f4c07a2sm8261041f8f.20.2026.04.28.10.58.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Apr 2026 10:58:10 -0700 (PDT)
Message-ID: <e991f3fc-9a82-4383-bf11-13e39e2995e2@linaro.org>
Date: Tue, 28 Apr 2026 19:58:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/vfio: Drop superfluous inclusion of hw-error.h
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex@shazbot.org>, Tomita Moeko <tomitamoeko@gmail.com>, 
 qemu-trivial@nongnu.org
References: <20260428163702.3224323-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260428163702.3224323-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 28/4/26 18:37, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> None of these files use the hw_error() function, so there is no
> need to include hw-error.h here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/vfio/device.c      | 1 -
>   hw/vfio/helpers.c     | 1 -
>   hw/vfio/igd.c         | 1 -
>   hw/vfio/kvm-helpers.c | 1 -
>   4 files changed, 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

