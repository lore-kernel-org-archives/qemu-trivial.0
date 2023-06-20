Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qBZ5l-0002tN-10
	for mharc-qemu-trivial@gnu.org; Tue, 20 Jun 2023 07:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZ5i-0002sm-7T
 for qemu-trivial@nongnu.org; Tue, 20 Jun 2023 07:00:06 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZ5g-0001BH-I3
 for qemu-trivial@nongnu.org; Tue, 20 Jun 2023 07:00:05 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-987341238aeso541298266b.3
 for <qemu-trivial@nongnu.org>; Tue, 20 Jun 2023 04:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687258802; x=1689850802;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rPwfOjVOdCImrYsaEUnmT/xTvMWss0vrm9gkhzhzpMA=;
 b=YrgVBJ9ZjXSynGioBxS+M4jSKsldwyEG03uIx0WpAL9SU6UTI9nLxDgXNdaPSiVGtR
 kKKpCA00IOTFsD/IEWorJl1Ro5SaL3/IwBpJJZrgWAtL8yRc9uhfIOFY85EevglPR6tB
 5RVlee+qbTNnAul5ucQK7OzXtjVDEpelCeq0KnjShBjvEH4vMW+6weyyl17eHQ4EesW/
 /B7jfd9ya9eqM3iGl8XRSKTzLzKNgLCQ8fB6Fw9kIOYJOlJUxdhll4GZB6SGXTLmNVjH
 eqfpP1aHD4qYEgR4cxbrb31QkKovqvY0AbNTQbtxsOmQkf5+AunzW9MAvS+lBsMlIAe+
 F7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687258802; x=1689850802;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rPwfOjVOdCImrYsaEUnmT/xTvMWss0vrm9gkhzhzpMA=;
 b=T8zTo83Svl+Jx3QTNQmI/WIbi4b1R8i834P1pIHgRTCBKNQmf97Lors91mos0lIvkH
 JyY83iRB7qXQjrLLn6UHaHJJcS4YD20elawYK3E8iBnL1yLnX9uN30ZP5eSGSr8EE/6g
 /lXzlem1f42bGIQ/aK8h3w+7MGKqzwGPj3zKzMMuJoa3kznQzEeTWk/nlZWN/hCus15r
 5tJkUAPwDITIAmtXgh2WKtQo3az+ZPcpDruxaI/qsaq/XKZbNSR1XzVCnTMe9pYEdR2m
 Y0HCInKWS6hj9rVzKL3EmnhggwJYP3Lha111LgEiHWtDDQRoife2l/vBeCbC/SO3aeSG
 cXtw==
X-Gm-Message-State: AC+VfDzG4G7TcwCkXj47wGr5RQihw93nQK1fkfq5KSTTzm6TVFAHFXh8
 mQCfE3Xf6gX9lIBIsEtJLqcdHg==
X-Google-Smtp-Source: ACHHUZ5pmAcb7u16hmAMKluCEZtlUIGLXc5qb6VDYt7VHnVCQGjZa73DttTGN4lYKnQHjzMCJRkiEA==
X-Received: by 2002:a17:907:36c2:b0:965:fb87:4215 with SMTP id
 bj2-20020a17090736c200b00965fb874215mr11539171ejc.15.1687258802319; 
 Tue, 20 Jun 2023 04:00:02 -0700 (PDT)
Received: from [192.168.69.129] ([176.176.183.29])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a170906b31600b00982c0ac984asm1176640ejz.176.2023.06.20.04.00.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 04:00:02 -0700 (PDT)
Message-ID: <c891bb6a-7f61-78db-a28e-7240f2542784@linaro.org>
Date: Tue, 20 Jun 2023 12:59:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] x86_64/atomic128-ldst.h: fix arch include guard
Content-Language: en-US
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20230620083918.9134-1-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230620083918.9134-1-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 20 Jun 2023 11:00:07 -0000

On 6/20/23 10:39, Frédéric Pétrot wrote:
> Fix arch name in the define that prevents multiple inclusions.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> ---
>   host/include/x86_64/host/atomic128-ldst.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/host/include/x86_64/host/atomic128-ldst.h b/host/include/x86_64/host/atomic128-ldst.h
> index adc9332f91..d0240d4212 100644
> --- a/host/include/x86_64/host/atomic128-ldst.h
> +++ b/host/include/x86_64/host/atomic128-ldst.h
> @@ -8,8 +8,8 @@
>    * atomic primitive is meant to provide.
>    */
>   
> -#ifndef AARCH64_ATOMIC128_LDST_H
> -#define AARCH64_ATOMIC128_LDST_H
> +#ifndef X86_64_ATOMIC128_LDST_H
> +#define X86_64_ATOMIC128_LDST_H
>   
>   #ifdef CONFIG_INT128_TYPE
>   #include "host/cpuinfo.h"
> @@ -65,4 +65,4 @@ static inline void atomic16_set(Int128 *ptr, Int128 val)
>   #include "host/include/generic/host/atomic128-ldst.h"
>   #endif
>   
> -#endif /* AARCH64_ATOMIC128_LDST_H */
> +#endif /* X86_64_ATOMIC128_LDST_H */

Actually, I recently merged a fix for this: 8a2bd747877.


r~

