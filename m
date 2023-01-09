Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pEueP-0007oQ-9n
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jan 2023 11:05:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEudy-0007gP-DI
 for qemu-trivial@nongnu.org; Mon, 09 Jan 2023 11:05:19 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEudv-0007aZ-Ea
 for qemu-trivial@nongnu.org; Mon, 09 Jan 2023 11:05:00 -0500
Received: by mail-pj1-x1032.google.com with SMTP id o13so5712962pjg.2
 for <qemu-trivial@nongnu.org>; Mon, 09 Jan 2023 08:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K8GhjQFjPnNzSCtaTubPnA/pMiRXT2J3GTIJ4LQAXIY=;
 b=GNMshD/U/RuLJMjgNGn5yl1hNABy194MBvDAUm1fuOq/zyCiAjNGCn+ps/N9npkr9A
 GmOP2IeQAdXJZaKqfXTkbGJ7Tdws/yaWdLSveCF3twQiJdZipu2CwyiSC+icnyOd80Ma
 ua/tjOw+5hr0YlHIldHf65P3a6G9S5C8gEW5GRC42pKYqMM/1LYQJeTyKTXSMXCyTlBp
 GV4edIl1eZvdncJhYKWg5Zs7nbZoqHgcHYz6HeouFkR79RHCcBEM3J+FWvMBadaaWkrZ
 RMpku5oOIOb9eHDomA49sZ6jjVqvwRlO7UnEyu/b+LaJa47nWc0U6qoR0UX+DfosOH/8
 5dZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K8GhjQFjPnNzSCtaTubPnA/pMiRXT2J3GTIJ4LQAXIY=;
 b=esc6AvqSSok62yCkjHI+dZ6CmmX0gEmPlUCE823ayN3FZVaC8n6HHySoWet6NSQ6zd
 xTPi/E34ZZmBSR3KNfuY1/iGDOHsNlU630b4EmUy3I1YV2vUs1XqC+FBc+CtX0+MVfzd
 rQ1lz1sqyoZNsr3Jw1fxIAdPpdvGuptxMplu31uLy274D1D2V7t39eBwSXZ32/xQwMWA
 7upn9P5GqMJbv0acrmVL4fFS4/XEwdTDWypKr+Ld+fMuoxJulifSDX1V9d0k8LMro4hh
 TOgguqpJ4BeD433ciynohQRG7MD2G91P54yTsLKDkK/935Y6S8wAGH37NOpnhe1DO/rZ
 FM2w==
X-Gm-Message-State: AFqh2kpEmdZn9kXmiDd7jKJMaTTdOVoa3Qaxox/dgKS92v7Np4se/ZcH
 ysH3qCY169ve9WugSN/vxpDXxQ==
X-Google-Smtp-Source: AMrXdXumH/sfgvFJfuKDgIhH+Yl8P3TJcDBbeYA9JKf/5iHGrdGi7iR5Cq3OEUdRpaiY9Z2ydCOaOw==
X-Received: by 2002:a17:90b:428e:b0:226:d023:26e3 with SMTP id
 ik14-20020a17090b428e00b00226d02326e3mr14692250pjb.16.1673280297890; 
 Mon, 09 Jan 2023 08:04:57 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a632048000000b0045ff216a0casm5302751pgm.3.2023.01.09.08.04.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 08:04:57 -0800 (PST)
Message-ID: <a446d67b-ebf1-a95f-0c09-221fede05e80@linaro.org>
Date: Mon, 9 Jan 2023 08:04:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/5] hw/i2c/bitbang_i2c: Define TYPE_GPIO_I2C in public
 header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>
References: <20230109084121.72138-1-philmd@linaro.org>
 <20230109084121.72138-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109084121.72138-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 09 Jan 2023 16:05:26 -0000

On 1/9/23 00:41, Philippe Mathieu-Daudé wrote:
> Define TYPE_GPIO_I2C in the public "hw/i2c/bitbang_i2c.h"
> header and use it in hw/arm/musicpal.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/musicpal.c            | 3 ++-
>   hw/i2c/bitbang_i2c.c         | 1 -
>   include/hw/i2c/bitbang_i2c.h | 2 ++
>   3 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

