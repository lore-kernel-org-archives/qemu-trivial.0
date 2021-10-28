Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mg7SM-0003sa-6W
	for mharc-qemu-trivial@gnu.org; Thu, 28 Oct 2021 11:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7SK-0003oK-Pi
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 11:36:40 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7SJ-0003Sr-5f
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 11:36:40 -0400
Received: by mail-pl1-x62f.google.com with SMTP id n18so4709932plc.2
 for <qemu-trivial@nongnu.org>; Thu, 28 Oct 2021 08:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CNwwVDPT3qWpGG8s/oTdYFHMqmFnWNbIvTQkUCzmu6M=;
 b=aXE/pVYO6TSoP2UEPkaFP4kYXc71XoBKsWUA5d7YDTLITtp4wGxjIiuxwny4ftY69E
 h9Nk+CiQEGU3iSYgYM/715iSNyyJGwV1WwHO6DZoisv6dCpVr9lYJsXT+o/G96uNzQgn
 HZ7coaQCmN++KeN3x4bXqhL5nZdj6YPpRqBiVkdbWVftL3bHuAOLJJmsJCpReTDsaeAe
 z7bAgXfLH+uB94URAkm+f5tBkpl2mBtpYv/+Q3E67FzJm1wRAe+oKXDaYuPb1KU1FQut
 AEXQF2Jd2fKqjZ34bqUcyYoHNPEK+Ku4NgCwkUl9FEoc7VhbVvDabbJuOtBzF1LG8Uzv
 1L4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CNwwVDPT3qWpGG8s/oTdYFHMqmFnWNbIvTQkUCzmu6M=;
 b=sSEWBcX6ipGJTABwisG2avTay9alSYjbHPiVdwPl7B9pzdTpzbyqFtsPMsgYSdpmlN
 nxvXXAQb9yj7vQFeNK65PIiuq6UIy2moDj0dBJCif3zkn9E2/k7CWmjAqkXAd7/VLlYV
 szmJ3cgtxx1mEucrQYFlSl+39abZZ65hnQsCi90mNFIvRynk05ZhTvgVsQfBueAFnTC3
 aXEIOrkq7qPfVxkEsXdhIYilZ0ZvhmjAouHrS58Lu0hlMcMwmheee2mEijBHSd3N2r9+
 HZg0ietxKGbbitkv9WmD1+Cet+aUVP8PxjSQD2VQQOzPnoagpR7ucNIXT4ioZjTC5RA5
 kaAA==
X-Gm-Message-State: AOAM532fuAwKugcAhijMqVCyW3u/GAtSc8g41/MjL0DxpsVV6ioXwtEV
 YSRWW9Oom7afpDCAdVn3KcY0hA==
X-Google-Smtp-Source: ABdhPJwm4+eDJ8/AyayoK3taGuD5dVQk9gvPEP4V5leN15YnDIcuCquBkmvqgRxLZ+1OhS0sOWhj/A==
X-Received: by 2002:a17:90a:2904:: with SMTP id
 g4mr5308356pjd.122.1635435397779; 
 Thu, 28 Oct 2021 08:36:37 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y6sm4101635pfi.154.2021.10.28.08.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 08:36:37 -0700 (PDT)
Subject: Re: [PATCH 10/24] bsd-user/arm/target_arch_reg.h: Implement core dump
 register copying
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-11-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bb661e52-c7a4-d906-beeb-8e27a18d2133@linaro.org>
Date: Thu, 28 Oct 2021 08:36:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-11-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Oct 2021 15:36:41 -0000

On 10/19/21 9:44 AM, Warner Losh wrote:
> Implement the register copying routines to extract registers from the
> cpu for core dump generation.
> 
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +static inline void target_copy_regs(target_reg_t *regs, const CPUARMState *env)
> +{
> +    int i;
> +
> +    for (i = 0; i < 13; i++) {
> +        regs->r[i] = tswapreg(env->regs[i + 1]);
> +    }
> +    regs->r_sp = tswapreg(env->regs[13]);
> +    regs->r_lr = tswapreg(env->regs[14]);
> +    regs->r_pc = tswapreg(env->regs[15]);
> +    regs->r_cpsr = tswapreg(cpsr_read((CPUARMState *)env));

I guess we could do with a bit of const-ification in target/arm/...


r~

