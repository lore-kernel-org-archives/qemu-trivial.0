Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881F8E65268
	for <qemu-trivial@archiver.kernel.org>; Sun,  1 Feb 2026 14:18:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vmYGt-000323-PC; Sun, 01 Feb 2026 09:17:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vmYGs-000315-CI
 for qemu-trivial@nongnu.org; Sun, 01 Feb 2026 09:17:50 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vmYGq-0003Bd-KU
 for qemu-trivial@nongnu.org; Sun, 01 Feb 2026 09:17:50 -0500
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so39334925e9.2
 for <qemu-trivial@nongnu.org>; Sun, 01 Feb 2026 06:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769955466; x=1770560266; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1ByKVHzSQ9zHFazuT6oztAMja4HE91ec5VQ+otD7rQM=;
 b=HCCF+qD83Cp8ycUJaaxY5C9kaPCuCHVMIWXW52WpEio596Q9ka9oblaU0VR74Bmysv
 /qe9EA7uaO/K2LDpK+g7K3cfGAU2qt7DOuD113fcIzldiDFB8wuerdVKANLItq0YZdgc
 B9X0uHgg1IXphxPT+Rr6POS7+jj9daaoyEKpgThRDAZqohhbX92Q9quXb2YzbqLJTrKu
 yxPf2zkBiH/Dy0FMZGs3Y01poFmPzSEW8Ui0YMDmwvzXrD/Qb5dq98v09aVyRFpVdQ9g
 lco9s5T1/qt5ZEUkBVoBIlxsemBEzVTIHh/qUhjswaL+AEIeOKQA12W1p4ttq9RXISk+
 u0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769955466; x=1770560266;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1ByKVHzSQ9zHFazuT6oztAMja4HE91ec5VQ+otD7rQM=;
 b=NmwDXwX9twE4KUJu9GwmcadfcyjgVbG7yLAsl1W6uOKblEvfm8DBEbkUV/alCT6Esf
 DdvmtGFMZKkDP9qVKVW1giZh8o4HzCwwt21sivMaGO4XP1eGDXZJy4EaZhVXTQyvgoB9
 wCUQoq5vEnciiYj0avNUbTB0eX2BM8DR/DPZtG+PxUT1SLbP67KQ4dda7xlhs2m9mzEo
 LYaWCBKvT4Yrq4PDwHEY0lsvvego870yNRhvLG7sUxAOGDxmw8t+8yVR7EeVEWv3c3oQ
 fxLvYdOvAjIonksIn/YXZ1WI2KoapCe1M4nd3zEQ3b9A1z4rDIAyIix4+zIsnb+APZ+S
 T6BQ==
X-Gm-Message-State: AOJu0YxVntV6mTf95gUZF7p7axptICey0yEUktd0VMKAdqXkHcdskaMF
 xlDobz5GApg6bYYucAyKH111JOSLWYKxa9E/ZhNI/IesMXyEmLNFS2Es4R7R99W+WDo=
X-Gm-Gg: AZuq6aIL/uirju6I+JfaxUChKqCO/IIhDnykvBjDmSE9MzyBQZMLIryZRwfYGwcwcVs
 tkI3FIGaK0jJhTNnDLUBVMN/XElvAvXWd84pW8iGYFaf9Ue7YhFB2a0pEEvBwjNFNonCNcZee0o
 LvDVsT06NKyd59AmY5I/hgkgKRsZXUS8R7nH72X5gEpwIzT/oMqm7QRdtW13QoK10b7YGmLieyh
 6u3px7w35wB0hKSX9JBrqS+0XS9uI7xPjfhAj+b774jzz0IFFKSrYPbUjTAeAmQz41r1YhyZ0zH
 kRuYiVUtz+BQpp/vjDzYAvkG0yMI1bPAydTAynyX7JaepjYbT3bwb52bEOkZHVvCu8ETV+mQ7sb
 3Gu/1lYpkj6w6heHvGW4Wc37Wu0ImB+NeGgi7343mGReIAowfeoS60ZjQPS5lr+yFSa8v6iu0RP
 X+PiwXpo4lAicV8j1/1SkpDMxTGWATaWLobb9cZJNPf3YrBrk2Z2rEvA==
X-Received: by 2002:a05:600c:8b61:b0:477:a36f:1a57 with SMTP id
 5b1f17b1804b1-482db456a60mr114746505e9.3.1769955466056; 
 Sun, 01 Feb 2026 06:17:46 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131ce70sm38253704f8f.27.2026.02.01.06.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Feb 2026 06:17:45 -0800 (PST)
Message-ID: <c2a851eb-1164-403f-a1b1-c03edb4cfc8f@linaro.org>
Date: Sun, 1 Feb 2026 15:17:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/ide, scsi-disk: Fix typo on the rotation_rate
 documentation
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 John Snow <jsnow@redhat.com>
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20260128102548.224237-1-berto@igalia.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <20260128102548.224237-1-berto@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x341.google.com
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

On 28/1/26 11:25, Alberto Garcia wrote:
> Correct values according to the Medium Rotation Rate field from the
> Block Device Characteristics VPD page (B1h) of the SCSI specification.
> 
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>   hw/scsi/scsi-disk.c      | 2 +-
>   include/hw/ide/ide-dev.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

