Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E328C71130
	for <qemu-trivial@archiver.kernel.org>; Mon,  7 Jul 2025 16:33:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1uYomD-0008Uk-Oj; Mon, 07 Jul 2025 12:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uYom8-0008Sx-4M
 for qemu-trivial@nongnu.org; Mon, 07 Jul 2025 12:33:04 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uYom6-0004vO-Gy
 for qemu-trivial@nongnu.org; Mon, 07 Jul 2025 12:33:03 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a588da60dfso2244583f8f.1
 for <qemu-trivial@nongnu.org>; Mon, 07 Jul 2025 09:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751905980; x=1752510780; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P84JBEneExTFpF5YWTkcLBi9etN/U4Q1iAkPi1MIWik=;
 b=EHuEMqC2Ahb7AojKm0ziXYgKr+xXCewx+w5P6pBUIeB2dfVVMuH5WKvwEfF5fFjpkG
 cHlXjnCYhyWtfwmF7ghfaeJjbO6uWXPchX/I/8psJls6Q8b5Ar+n/lHRtdWGKR4/2VuK
 zxpB6dkeWniJ13rlNORB9AOk6wLBlQBsZmbIY0M7ptX76MMhMSm4sn/Cn0VUkFZgJvWb
 k0T8PZI7BuMF+3Q7/BLVLyFslFIno08uojiTCN5Bl1M10MfLhWdUmnCG2KeoYI3NawvD
 Bv4aF0IHJPhtdVZyL/QrN0Dpw9oh2t/Z6WqyshKApGB8N6loHZ4R6D7GgTa9b9bNjUoD
 CENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751905980; x=1752510780;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P84JBEneExTFpF5YWTkcLBi9etN/U4Q1iAkPi1MIWik=;
 b=oooKpWTyXXEFxc8NyvopZoltES604/396VN465A/mh/lazpXHDQYcv/zp77BAnP7Tt
 y2VScr2fRx4cCtCtv2zPkaLVIminhoqhHmxpJfrRBqd8Yk7qzHKWss0vyA60BcSv0Asm
 OTlPkSedovvK5biPwv/AyaXrqd8FhiQcq6t1pS2As8NFWKbSEecZNFF4VzEy43o/PhZH
 wpVQ+x2INQ8K6T905rKZhtbRQYSaDE0eloV2BudEC3TBjkZZ0D5JKggF/aC1+kwMPw3V
 zbFMRy+BansWPt2zQfFUDgHxVFHqoJ4TD9K/iKPifZr+oP7noOaD7KgmNMe0VFjYcCgc
 lmsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0kmFZ9ivtJwmcx/M9hHUoK+Lh78vr2fDLbmgpWD6Mvr8gZ5jFcYRpGqNYl9n6msa/cjKQFg7b3duMtCg=@nongnu.org
X-Gm-Message-State: AOJu0Yxbn1AZd4DPcHHWa/bZ++b69Dp9mSejvrPorCUYnOQQZOlgxI/J
 wEPWGz5muh0vPxZP2Ayj+lDy6rjfT9IOidnEOTDbOKeY4umXtJx04VqhfOGe7SVAxTk=
X-Gm-Gg: ASbGncty75jbOjgBVGzQBvaIq6AMrwI4A3XrmAR48eefimFYJ981MWJ1xNZZN+Ql1tx
 MjVOS4hDUZTTw1/qR/oFULpK+kHriztKZJwAPUKV811L/gJcRJjan998XckV/r/7+2Q4gJGpQiB
 780EbjIo47p1tn7qEmA4UB8MvevsSMMSSBgUBEDs8Kw32RvQ2bRO70c0Zj2MuD4mA/bG0KL5acV
 mqPG4EXPSLw19aQJ0SigvMG9QeXnns+HizZcGCRFJaLku6dcFI8pYbbw/IiC3tWcwyQxMpTh8sF
 kOVEPwImn87wAMLYURu1MCNkXFhoJKXs3J3z2o76ach24LCzkQocN7gOYpEslPfFeQNbMuDBc+K
 YrjiJInlTWqh379SqG7vMVDtEoOkiNg==
X-Google-Smtp-Source: AGHT+IG5AMfCbEX4TAdoDVTKjrpgzg6MjO0r9JRv/6/x3VxfdC0R4uZQiSgfBZwEdOYA4r6sn3Nftw==
X-Received: by 2002:a5d:5f8b:0:b0:3a4:e193:e707 with SMTP id
 ffacd0b85a97d-3b4964e52c0mr10445692f8f.41.1751905980492; 
 Mon, 07 Jul 2025 09:33:00 -0700 (PDT)
Received: from [192.168.69.242] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b4708d0beesm10838782f8f.36.2025.07.07.09.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 09:32:58 -0700 (PDT)
Message-ID: <e146d57b-4430-42a2-9914-9eed94e2668b@linaro.org>
Date: Mon, 7 Jul 2025 18:32:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/uefi: Create and use trace.h wrapper header
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
References: <20250707142412.558561-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250707142412.558561-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 7/7/25 16:24, Peter Maydell wrote:
> The documentation of the trace subsystem (docs/devel/tracing.rst)
> says that each subdirectory which uses trace events should create a
> wrapper trace.h file which includes the trace/trace-foo.h generated
> header, and that .c files then #include "trace.h".
> 
> We didn't follow this pattern in hw/uefi/.  Correct this by creating
> and using the trace.h wrapper header.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/uefi/trace.h              | 2 ++
>   hw/uefi/var-service-core.c   | 2 +-
>   hw/uefi/var-service-policy.c | 2 +-
>   hw/uefi/var-service-utils.c  | 2 +-
>   hw/uefi/var-service-vars.c   | 2 +-
>   5 files changed, 6 insertions(+), 4 deletions(-)
>   create mode 100644 hw/uefi/trace.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


