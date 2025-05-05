Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5649CD6E49
	for <qemu-trivial@archiver.kernel.org>; Sat, 30 May 2026 15:25:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wTLYP-0004Ne-4l; Sat, 30 May 2026 11:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wTLY4-0004If-6C
 for qemu-trivial@nongnu.org; Sat, 30 May 2026 11:24:29 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wTLY1-0004xl-Eo
 for qemu-trivial@nongnu.org; Sat, 30 May 2026 11:24:27 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4904c1ce4c1so93223345e9.3
 for <qemu-trivial@nongnu.org>; Sat, 30 May 2026 08:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780154655; x=1780759455; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5lfSFK16M75PShE4mPiUfY0e9E1CdMU/HALcfKSeksU=;
 b=gtCqIdwhIAWDuzJvT2Ootk7dUob+mMfHFt+ZJE3aeruF68hI5ddh7zjlAWuaXCdkC6
 LhvHxddKdp3vbMLgmkfEpi4PHi/o2cQyC4QI8p6UoC01IUX4M+pMhjL7RlXypn8JH1X/
 u5YWxOnwM7kjgmwXBzYxmN834iWbJc5YDZ85T+vGqJqeiIBLLDsXPv9B4L8TVl1OgIDC
 yDHFYJIHJlZOz2NktWCt31phzJLsop5NL/hEgxmcuoX0KkChvsqbymRKayD7kig1C1x0
 AzHSWNAiuSzvzfJmLrSHTpEoWoaXMyVUQlmTzL3oWCTNGbSrXLNNRir78o7s07xccaN1
 Y+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780154655; x=1780759455;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5lfSFK16M75PShE4mPiUfY0e9E1CdMU/HALcfKSeksU=;
 b=aVfMIIMZw5SlnufGtbVJEME0kKNlSAyblVNGkIV9B2bdjAHNEBvSefgKys3cIndo2o
 EVj5L1hE1A6U/22HaqlqVwUj1ORnt6vxZBSxUs17Xix+rt21tUZGUsEIp0BQIKsb/Gd+
 NEV4w+DI5qIQXQzeyllZKfA/VeWrJG4w0Z9N41INoVbK9hUsUNIjx/bkWsz+bQbagAQh
 v7QIN++5BgCbYvU19yEu4wyLuJggs7SFosDyOdWDB4Yq46S86XqQYoStc5Xie3z7rdwK
 hlLo2FXHyD6H/uqV/QWUHxoajvOJ9auFvd1DLWzXtFAfUveM+hSLKCTeYfPGWAuqqyLV
 agSA==
X-Gm-Message-State: AOJu0YyDEzwrWzkn26lBbavlmjW3xuRnVJMU0W6mA7UPBEUb+ZErDr5u
 Omy1mXQQuaMuuQPqzv2amt6dUiq19VDWIfgrn4ltnOO+9Mi2wBij9SyVYQ5PBORFa7s=
X-Gm-Gg: Acq92OFPM3B0AKEi0SLEp77iNOF1vHe7b9s7tV8qrPzXC55S6pfnpFcxDxLHIDKEGo6
 o6C86ouT4LEr/bqfoq2makMZ+oT+7dhdYo702DmYfmszuhTD/H9bQX9CB98f5UnJ//PHxtqJoYf
 sluGWKvkRnbqTU4kv/q06BgVpSP4vmV2Jv+MXhCCUBFG1CE+GihnFOs5sHKgo4/+5aDyKWhgtaN
 wow2elmLK/gXErU/CmIUspcBJO/rRbs8tKdT89P76qzypqA/+9iZtP9TwgjYNGW0aWoBZK3vheN
 lqJPZ9xIuMqpQtWSvM1Hm6L0QEg+cnqL2x4O9xj18Ci7U39NNOPkFcvMqcRxPFjfPktS/X3suCR
 j9pnJbow5zx8VZr0N0KU6+ypBerQnUYWp7zCzx08bhRAGRlLsS8Np24ClydI0cA6QZP+F/b4+yJ
 lulVrpTWRkAuTxn9eRZ1Ehe8hmyewzRrd7Jkz2d/pg+OwYjYo7tqpdKKgFkzwRelhS5+062zTXu
 N8D
X-Received: by 2002:a05:600c:8582:b0:488:b187:3c with SMTP id
 5b1f17b1804b1-490a29399fcmr55008995e9.14.1780154654892; 
 Sat, 30 May 2026 08:24:14 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34b47eesm12638888f8f.9.2026.05.30.08.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 May 2026 08:24:13 -0700 (PDT)
Message-ID: <b304853d-b5e8-47ee-b1c5-cbe466b97abb@linaro.org>
Date: Mon, 5 May 2025 08:48:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/acpi/pcihp: Fix typo in function name
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, alex.bennee@linaro.org
References: <20250504215639.54860-10-gustavo.romero@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250504215639.54860-10-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 4/5/25 23:56, Gustavo Romero wrote:
> Fix typo in QEMU's ACPI PCI hotplug API function name that checks
> whether a given bus is hotplug-capable.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   hw/acpi/acpi-pci-hotplug-stub.c | 2 +-
>   hw/acpi/ich9.c                  | 2 +-
>   hw/acpi/pcihp.c                 | 2 +-
>   hw/acpi/piix4.c                 | 2 +-
>   include/hw/acpi/pcihp.h         | 2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


