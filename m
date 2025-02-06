Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tfyQz-00071M-7U
	for mharc-qemu-trivial@gnu.org; Thu, 06 Feb 2025 04:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfyQx-000712-No
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2025 04:44:31 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfyQv-0002RR-Si
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2025 04:44:31 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-437a92d7b96so6557885e9.2
 for <qemu-trivial@nongnu.org>; Thu, 06 Feb 2025 01:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738835068; x=1739439868; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ejjTpZkkDDyalI24yhhci7fWdVMkcXjM8JpFoc7Ffv4=;
 b=uxukW0eKdQT+rSn1SvWOUB4X85keQrC1qxFA52fvFYG5E5rLGeS77w0lz8BMBQTOTB
 XBtpsfr0ZfRG76D1Q0TFXgK2XLPifVzPoFX3DLoqmGofeqSCfS5JxzrJTE/PZ6VYTetb
 RtHsDFiFGz26xyJQNpWBiDjBsdoxk1S1Ys4Q/dr1yA77oMH/0LNyzwLwI+h2vw+eFRrk
 QYu/7NLpDqTo5G3l1uN7wo763HQbtdxDUm928RLilBMY4NiC+jRjkrjkwfeZx9Pb+Bu3
 rhF8FDvCO4Fsva5zTuVJftm6tqU/aCFh0CLSmdQWSQabp3aWTsu6TsdjT2imFKfgxoBL
 27kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738835068; x=1739439868;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ejjTpZkkDDyalI24yhhci7fWdVMkcXjM8JpFoc7Ffv4=;
 b=r1875Pm7DYfGUGz4Q6sWvM3DBCJiAVXqObyNXe6akKO9nRMr//awDd6yjFChA2LLW2
 MOMKddu5IhWYQEWaiSvwmY62OR4eFcXXTKvdfDDAvWdKbA3xwXg9+98drMBXiUCNdZWP
 x9jFIocX8u52+7s5tT+NOxWA8B5nc5Jjj2ZkjlemI3UO7H3mMK4lgwkKEDNGrKC/uXHk
 v+EYsU5ANTHffWwhtMl2YHTM2dD0pU2lEKbAQDvXiqn4yh1TSpizPvltKgdc697/K5Pa
 QfjjJVyahWuXGiQKZzLGppl2uh4S1ZsK+rNNFxI1XGlpymEyWEuukG4rOm3G+V7Zj81g
 qUqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbEuZb2wvm6b6o4ZaSgcF8liZyliAyxXOgiN36DM0guw5VaVQpgnzFvAVDgOGU2sQIdJODqCmCQG3htn4=@nongnu.org
X-Gm-Message-State: AOJu0Yx53vhOAz2SnqgTNFEYURFVLSOOV8LFgyJXL250AaJSaq6D9d7U
 iZMoT3bQDhuij1xttr2NAjY/5bvWw5nAYsVNL7UKnqfGflHg6Su5XbrNWBatQyg=
X-Gm-Gg: ASbGncukXl/vKb1EYTAYuv54KvgBD9dII1gtOjjgnvXBsoCgF+rWkw+O+EPpwi1DxhL
 um898tT8NGD/M6tbKn6apmRTQyGGZnOhfRdnQf840q2S25xG2yX0BOQguGRSKdBEJXizLXGMCag
 gmMiguwpxNzEd2wFENxdCfy+8ZNm/fxvIeHC3GjyFvrIM30WVK+HTqqqm9cfnpoje5H8jQRT02F
 I/DeVkAKpw2FXY7IzTQl3joqUYKasZuXaS5TvwzA0fxP1VDpelqNjEitUWjNnAMpnowrYKhRaHo
 p19HbweCbXjtK5I8v9EB460qcdIlpyHLtKtAZxDC+kQe6jefUSDnZLlAGR0=
X-Google-Smtp-Source: AGHT+IGwclZZzUYlTjZVWZOpP10wHXZjfgFg0sg38e6APL57R8lQfwAV97Cs+coO/1wmdcOiLegN5g==
X-Received: by 2002:a05:600c:5492:b0:431:5632:448b with SMTP id
 5b1f17b1804b1-4390d56c048mr39157475e9.25.1738835067858; 
 Thu, 06 Feb 2025 01:44:27 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc3a10fffsm184222f8f.12.2025.02.06.01.44.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 01:44:27 -0800 (PST)
Message-ID: <2a7400fe-36f0-4377-a1f2-abeca8290616@linaro.org>
Date: Thu, 6 Feb 2025 10:44:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] qemu/timer: Clarify QEMUTimer new/free API
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
References: <20250125182425.59708-1-philmd@linaro.org>
 <0e30640c-1dcc-4b83-b69f-305821714151@linaro.org>
Content-Language: en-US
In-Reply-To: <0e30640c-1dcc-4b83-b69f-305821714151@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-List-Received-Date: Thu, 06 Feb 2025 09:44:32 -0000

Cc'ing more developers.

On 4/2/25 22:44, Philippe Mathieu-Daudé wrote:
> ping?
> 
> On 25/1/25 19:24, Philippe Mathieu-Daudé wrote:
>> Update few QEMUTimer docstring and add a
>> sanity check during timer initialization.
>>
>> Noticed trying to understand leaks in QDev
>> Realize -> Unrealize -> Realize transition.
>>
>> Philippe Mathieu-Daudé (2):
>>    qemu/timer: Clarify timer_new*() must be freed with timer_free()
>>    qemu/timer: Sanity check timer_list in timer_init_full()
>>
>>   include/qemu/timer.h | 12 +++++++++++-
>>   util/qemu-timer.c    |  1 +
>>   2 files changed, 12 insertions(+), 1 deletion(-)
>>
> 


