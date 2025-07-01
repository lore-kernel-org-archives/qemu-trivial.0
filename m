Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uWYHA-0003jr-Km
	for mharc-qemu-trivial@gnu.org; Tue, 01 Jul 2025 06:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uWYH6-0003jU-Jr
 for qemu-trivial@nongnu.org; Tue, 01 Jul 2025 06:31:41 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uWYH0-00020l-B3
 for qemu-trivial@nongnu.org; Tue, 01 Jul 2025 06:31:40 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso5830746f8f.3
 for <qemu-trivial@nongnu.org>; Tue, 01 Jul 2025 03:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751365890; x=1751970690; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tgrSfvx56bZGA5skQAUHASaONx9nnqJrkFCGPGoosE0=;
 b=RX6OjP+hCZJN+E4gVlXS+XB3Ircjt16hpBcn974c2tRHbfTPxl4iZFx6Wd4HqDQrHp
 v2WDEUu0/xgGuwPQKykc8GLQDy29hkryE9hP/tYL0u8dCKO8malIxrV6YMOZ4BWu/fVK
 ulp5FK/gU+7KGVYEPL/zVVhJgbo7jMsDtFa+74xHtAZdgzyKNJQAxQTd0FK/aQX18k6P
 yUK/97bSmHvQAikZ41GASjOT4PGcfYvmEewlSOTw3mCYAZ91zZu0sP+LEIcBf7S8Spaw
 IzRPZULeaDtFCYPGKXsPS023EbI0aTX5Wvx4wFtmE2Z/estxaX3Q9UwkvUp3scdwiyty
 lYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751365890; x=1751970690;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tgrSfvx56bZGA5skQAUHASaONx9nnqJrkFCGPGoosE0=;
 b=WY+gCY05HywuWpKSTs+wIzPKtx6A3dEDardR0GwXnSeA7SPpYo8H2D6DBEon5uTVT5
 jOhSm59anG9TF9LztqJsZBCXNpZvfIZhmLWOya0BGUoEuGH/p2jlb4i2t6QiW49yToI/
 CSPGn4EmAK2A0vEQzEM2vHlxAaOeRYmkGa5KF35GHIXnn2vdxS9Cpk3+hTx1PTFqK2cL
 deat15vjVKsuFwerSsSZUKPipEKOqKEIoJYljW/dmAMrhmw80iIt1rYr3Iyi7SKSABCl
 KGBSpDHuOyIfDD6fbW2L4RfTUlEacws7gV4ox2f3/cwXHH+iJNgx4QkgKERauowG+xA0
 0lhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW25hAl9hIYO5zxp61pUwpiC8UlxqRDv73gLmdIwo5uq6JajyePJmHSGYg+JjxR8X0L05gfGFHx2RiXDIE=@nongnu.org
X-Gm-Message-State: AOJu0YzRLLBQGI2dMoMV6Z5LvV77Ao+g5gEoK/7Y5tX0GWroyFWtA8zD
 7+LlUdfz/unwdeKBwfWGi3lwy/c4M+sLmylw9YlqUgohv4AXdra58Psiix23lZWlEo8=
X-Gm-Gg: ASbGncsHIKi79dtN6/a1HgAJ89FVMIIi8VxhWjyMUy2ljIx1JE1eRtxhGuifgrc2+Uz
 bmvw+SUrIZ/DDoKf3BNMbhTr2/ilvk9NLrOcCOXx8rcuSrsZb9RM4eta7CXjh5nw1sKoLi07HUK
 IRJWFs3brdg+rTSXq44/+0YBcmfdfKHCmc2x9NgzKBoK185o7rRWbnFDnWpZrpxv8m3EwJJGPFB
 kKef5HmA2JGCau4QRinfEE+vUPxG/qizE1ul37kjd/fH7PuTbyFqD/IeHpLKc2sQiSlL+zLq82h
 Fchl28ylFSa3Uij6AtmlS2Ibe/oaQwH2NaxBoJENLDpd9HQgXmgp9jS2VEalQiBjpM6NDgFh2lx
 haobrV9rfvcIqDUI/5kBiH/EYoE2lOWC1UnFSWMKK
X-Google-Smtp-Source: AGHT+IFsuPOO4ZQkbQocEzBcdPX/WR94zJ9rlgRpleB+R0Pf412nURn+DsNRInwdp97CIdhJVjsXHA==
X-Received: by 2002:a5d:634f:0:b0:3a4:f7af:db9c with SMTP id
 ffacd0b85a97d-3a91893b647mr13065635f8f.59.1751365890416; 
 Tue, 01 Jul 2025 03:31:30 -0700 (PDT)
Received: from [192.168.69.166] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a3fdfa6sm164810595e9.22.2025.07.01.03.31.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 03:31:29 -0700 (PDT)
Message-ID: <69d5a017-0ca0-4673-a31f-8d385a60d4cc@linaro.org>
Date: Tue, 1 Jul 2025 12:31:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 22/24] hw/misc/stm32_rcc: Fix stm32_rcc_write() arguments
 order
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Philippe Michaud-Boudreault
 <philmb3487@proton.me>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20250610125633.24411-1-philmd@linaro.org>
 <20250610125633.24411-23-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250610125633.24411-23-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
X-List-Received-Date: Tue, 01 Jul 2025 10:31:42 -0000

On 10/6/25 14:56, Philippe Mathieu-Daudé wrote:
> From: Philippe Michaud-Boudreault <philmb3487@proton.me>
> 
> The tracing function for the write case incorrectly has
> parameters switched around. So order them in the correct way.
> 
> Signed-off-by: Philippe Michaud-Boudreault <philmb3487@proton.me>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Message-Id: <HnyjTNqwrfGusE44bnM7kuLuj13Di1VgXN-dXVHMOSnfgCUhoipOVIoVS1WQaKrJxmEDy9XJGdlQj6zVTIdJE0QVlfBhfbcckFFWRRP56uY=@proton.me>

FTR, since qemu-trivial@ isn't archived on LORE, the original patch is:
https://lists.gnu.org/archive/html/qemu-trivial/2025-06/msg00002.html

> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/misc/stm32_rcc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/stm32_rcc.c b/hw/misc/stm32_rcc.c
> index 94e8dae441c..5815b3efa54 100644
> --- a/hw/misc/stm32_rcc.c
> +++ b/hw/misc/stm32_rcc.c
> @@ -60,7 +60,7 @@ static void stm32_rcc_write(void *opaque, hwaddr addr,
>       uint32_t value = val64;
>       uint32_t prev_value, new_value, irq_offset;
>   
> -    trace_stm32_rcc_write(value, addr);
> +    trace_stm32_rcc_write(addr, value);
>   
>       if (addr > STM32_RCC_DCKCFGR2) {
>           qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"HWADDR_PRIx"\n",


