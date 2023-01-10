Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pF9xp-0005u7-7G
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jan 2023 03:26:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF9xo-0005tj-8k
 for qemu-trivial@nongnu.org; Tue, 10 Jan 2023 03:26:32 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF9xm-0005VZ-RM
 for qemu-trivial@nongnu.org; Tue, 10 Jan 2023 03:26:31 -0500
Received: by mail-wm1-x330.google.com with SMTP id m3so8195050wmq.0
 for <qemu-trivial@nongnu.org>; Tue, 10 Jan 2023 00:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CH4/JUFRuN1OZ3VEbfdDXHEUg2sOsswoI97hy4Nbam8=;
 b=gCLNBsMohpDEMSDfSrukag26or3zZMCVX7DxgrYt/tz4kk8KLhK75fLg+D0weoqnlA
 0ok5n8UHczy5mUi5ZX4LpX2ALriV7SufTMVyWKhu06oc72d7FuLEXh5TSgfM6DZe50ZF
 w6gHvSVY0RLh8N4j//I7SyNTHwuvJZPnncjuNVrZtpUgXBG4842mlVuLYkxwNgIWasBG
 xUVK3Uk/Pa6SYrkgworYH9hI+w9nWMoy3mWDClXi5JpsxoBGJdsJkgySScn9ASs3ryng
 7TXTzDZLdBVkUvLB2AKZiR8xe6DTe66G3BxTTB/U9fDXj+cwS1ijlAjceXa9rnGJ4xK9
 cb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CH4/JUFRuN1OZ3VEbfdDXHEUg2sOsswoI97hy4Nbam8=;
 b=fzyc3Br59pD4VirCsqbh4TjrEQ4ef6XuD3eIzR/qIjX+1LnnZV6dwY/QWU7F9rOgJw
 qJWFGmskdTgBOLXKZNY748euNC3tUCmRymaolV/tPI4qJtRktxWmsZJiXKZa2JG8BoU/
 CJY4vIDB1owg2EAd/vyB+Vt50/9z7VNRLU2Hq/BrapDNuTkSAa/920iTyTa6a3hG17xu
 53TPwH/E6dBEAteidFgxbTr8wy2QSATVkypvIMx3oLe1yxfMeCSOySjrsEDSONyPPgo+
 Q2EqkorGgZ+gNwp4pEa+uDTr2jy3lu1B9aQQjmJzT9n+Qxn9H6mI+87nWCqjf/aF24xM
 /7OQ==
X-Gm-Message-State: AFqh2koRNF+/7y0IOfZLTzjFBuZTevZY+cSOU2kvBmzt92qYHUXGPiJ9
 slw6JHm6GUtrQnpd3zVP9JshEg==
X-Google-Smtp-Source: AMrXdXtuS8AOytJ/AgeFrQ1U8woF8f0iK02ZDrqFqdlc4CyFqXrHY6TLngrs4tPrktoOwsYpHSjjug==
X-Received: by 2002:a05:600c:4920:b0:3d3:39a9:e659 with SMTP id
 f32-20020a05600c492000b003d339a9e659mr51506349wmp.21.1673339189237; 
 Tue, 10 Jan 2023 00:26:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r5-20020a05600c35c500b003d98f92692fsm15395102wmq.17.2023.01.10.00.26.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 00:26:28 -0800 (PST)
Message-ID: <dd03766f-e4f0-03f6-de16-0d4f9ed8b0ed@linaro.org>
Date: Tue, 10 Jan 2023 09:26:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 4/5] hw/i2c/bitbang_i2c: Trace state changes
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>
References: <20230109084121.72138-1-philmd@linaro.org>
 <20230109084121.72138-5-philmd@linaro.org>
 <55413dee-6141-2f36-ed8f-964df43aa578@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <55413dee-6141-2f36-ed8f-964df43aa578@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Tue, 10 Jan 2023 08:26:32 -0000

On 9/1/23 17:07, Richard Henderson wrote:
> On 1/9/23 00:41, Philippe Mathieu-Daudé wrote:
>> +    NAME(WAITING_FOR_ACK),
>> +    [RECEIVING_BIT7] = "RECEIVING_BIT7 (ACK)",
>> +    NAME(RECEIVING_BIT7),
> 
> You've overwritten your special case.

Oops good catch.

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!


