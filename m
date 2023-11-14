Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r2ztM-0001Ci-0X
	for mharc-qemu-trivial@gnu.org; Tue, 14 Nov 2023 15:20:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r2ztH-0001BH-6N
 for qemu-trivial@nongnu.org; Tue, 14 Nov 2023 15:20:07 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r2ztF-0000Ja-Lj
 for qemu-trivial@nongnu.org; Tue, 14 Nov 2023 15:20:06 -0500
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5b9a456798eso3777580a12.3
 for <qemu-trivial@nongnu.org>; Tue, 14 Nov 2023 12:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699993204; x=1700598004; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dWdSE+EPttDsx81pQ4rF5FdCssb5o8jnwkSp+kJTGso=;
 b=FRpOi730/1iYTi/GEkoszFb74Huz6+/RoLfeZiImP0ZTjzokJ+i8JQnSFf56FsnczC
 nBpb03IlIYi3HPEsF7u5Uj5wXNJHPsfAMzSeMeS1jbLVqXDcPHD+k4sagh9tDidxjL1E
 lHGmPufzFFypNXRaffxZkGJCXi+tVeAgt6fKUkis8Xua98DoOacsm2TiAh458rFdnfCn
 Qua2K7cZTvVSzbYu3Z/Zlha1tx2DYuNkvtVbxKoPivSrT86BD/qC/FC5Rhz+JXY7W+Bb
 rbxeqqRQcc64wnDm6V6bXLthYJ8fJfO7yCr16t72mo0oX0qHhEpT7bKG/XngoCNUykh/
 +Hxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699993204; x=1700598004;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dWdSE+EPttDsx81pQ4rF5FdCssb5o8jnwkSp+kJTGso=;
 b=teSlnS4yC073JXXEE2TyKNFJzQTodSF0Xmu8a3M9CFHOOA3oswUbWjFV65jM8sOd6I
 lZK/HytePgi68dIM2bwqVWmVa8OUbuEIOpddAevtc+yu32SDlR+eEH17o692ttB42cuj
 tL3lup7Fu5q2M6hTaZTGYYSJrwb89hadbvXumAhlCktyKSfirOSkhLSLHLWFjRG5E8+j
 NJSs+vp7zLWwmCOIH/kmfj219ov/ey306FTS/2juu9CZpX3pE11ofBW7PEtzTcGGzKgT
 we++AO12K2HIX3udkROEhIGWbFpbCzCXxwJs42fre6zb6dV0oxTM2dDqV/HvULedlxvC
 vZcg==
X-Gm-Message-State: AOJu0YzuvAXjarnu7LTXewgxtDJvRXDhwVmYCUXpjfWZbQ3ZoxkHr58C
 0e4cSQG5VO/RYei7tN4LZM3M2zMhOP6ZEd4/afQ=
X-Google-Smtp-Source: AGHT+IEioEap6KnJcD8q8jK7FhXRGZZRGEYYutLwlbTz476EFJR7P0V07W7U2ben77tNBTdMeeh71w==
X-Received: by 2002:a17:90a:d515:b0:280:23ef:b7fd with SMTP id
 t21-20020a17090ad51500b0028023efb7fdmr8519076pju.19.1699993204146; 
 Tue, 14 Nov 2023 12:20:04 -0800 (PST)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 lx7-20020a17090b4b0700b00280c6f35546sm5553617pjb.49.2023.11.14.12.20.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 12:20:03 -0800 (PST)
Message-ID: <1fb1fa09-6e50-4ab1-b7ae-b8d7a9ddb0f0@linaro.org>
Date: Tue, 14 Nov 2023 12:20:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH trivial 09/21] target/hppa: spelling fixes: Indicies,
 Truely
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20231114165834.2949011-1-mjt@tls.msk.ru>
 <20231114165834.2949011-10-mjt@tls.msk.ru>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231114165834.2949011-10-mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 14 Nov 2023 20:20:07 -0000

On 11/14/23 08:58, Michael Tokarev wrote:
> Fixes: bb67ec32a0bb "target/hppa: Include PSW_P in tb flags and mmu index"
> Fixes: d7553f3591bb "target/hppa: Populate an interval tree with valid tlb entries"
> Cc: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/hppa/cpu.h     | 2 +-
>   target/hppa/machine.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
> index cecec59700..80177c0df8 100644
> --- a/target/hppa/cpu.h
> +++ b/target/hppa/cpu.h
> @@ -54,7 +54,7 @@
>            1 << MMU_PL2_IDX    | 1 << MMU_PL2_P_IDX    |  \
>            1 << MMU_USER_IDX   | 1 << MMU_USER_P_IDX)
>   
> -/* Indicies to flush for access_id changes. */
> +/* Indices to flush for access_id changes. */
>   #define HPPA_MMU_FLUSH_P_MASK \
>           (1 << MMU_KERNEL_P_IDX | 1 << MMU_PL1_P_IDX  |  \
>            1 << MMU_PL2_P_IDX    | 1 << MMU_USER_P_IDX)
> diff --git a/target/hppa/machine.c b/target/hppa/machine.c
> index 2f8e8cc5a1..15cbc5e6d0 100644
> --- a/target/hppa/machine.c
> +++ b/target/hppa/machine.c
> @@ -129,7 +129,7 @@ static int tlb_post_load(void *opaque, int version_id)
>   
>       /*
>        * Re-create the interval tree from the valid entries.
> -     * Truely invalid entries should have start == end == 0.
> +     * Truly invalid entries should have start == end == 0.
>        * Otherwise it should be the in-flight tlb_partial entry.
>        */
>       for (uint32_t i = 0; i < ARRAY_SIZE(env->tlb); ++i) {

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

