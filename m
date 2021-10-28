Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mg7YR-0001fa-Pv
	for mharc-qemu-trivial@gnu.org; Thu, 28 Oct 2021 11:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7YP-0001eR-Q1
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 11:42:57 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:45821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7YO-0001yU-0m
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 11:42:57 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so5053041pjb.4
 for <qemu-trivial@nongnu.org>; Thu, 28 Oct 2021 08:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/iKrijP/Dam47Pl/JdkW06cvkbWsVQHH29yiJoGQ1vo=;
 b=EhRs55D9ninLl9rHmrL599jaxIwcAT+kRJvTeHizg3iQAsOVlhzFbs6eZTFMPTQur4
 rCKI1ShOQLBg4S8C2r0HOHuaXPMRMzMf8r2689pTYyxk1wfhzHni7PbUUOp/yB2cfz22
 ltuExdNKH6dsbg+0wniaiHYz2Vb8OxfnkedV+1hO6dK7zu/PdM70jn0XsEFVc7zkAxa8
 qke4hpjfT434L6WDgBPau55tF5I8/ATWAMOGMrmwY0Ld+Ef9/aHik28/MbRdS0GFCMyJ
 8bNh6M5hr9YCDaBSzQleVT5DcoF4+20Ud+FPcoudT0z+sshTIvzhmkKMlA+PqTNljkh4
 KVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/iKrijP/Dam47Pl/JdkW06cvkbWsVQHH29yiJoGQ1vo=;
 b=OE99Cwmz/hgCU2SuIRpYO3DpM9SzOdYDCMYFw60kfN6UWAaqWf8K8ZdoTKIeKUpIyM
 CaMh949RBQn2H3uniM5+DjBs4CsrwxQirsz0QG8if5jlK6sDZsCtpDcLRXaM0mKyWD3J
 Q6GB8nXqr1Q0rAdnmUv45Rq+Ufbnr4rwvCW6DmHnk+JN3eIgre3Xw+fJp5cYiEB/dInC
 fw5PIpiff0UKkvZl2ZqMkDqY9+xMc5UnyIkksfywDdUARWK56D9jMxY44+ZosggzvqWK
 9T2G+TxRCnPBHqDz1OZVukWMw+RxtAnOLhm9gt33iGJBZ31WgqAVlukPFDlgw0KFXNFW
 u2BQ==
X-Gm-Message-State: AOAM531b+d9BC9gN7w1RUHtFQ55OO1Iyomem5reQDJ/yreJPn2T2MkrJ
 v27COGCDjaHVya4I96xnkZL8CA==
X-Google-Smtp-Source: ABdhPJyWJGISn4V82YD5B4XBEx90E4B4njnfLU8z7P8GYWEhb1zq1VrojnR8Nb4m8WFsJQacVhCD6w==
X-Received: by 2002:a17:902:dac5:b0:140:3b56:c7e4 with SMTP id
 q5-20020a170902dac500b001403b56c7e4mr4676558plx.78.1635435774268; 
 Thu, 28 Oct 2021 08:42:54 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id t4sm3925329pfj.166.2021.10.28.08.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 08:42:53 -0700 (PDT)
Subject: Re: [PATCH 12/24] bsd-user/arm/target_arch_sigtramp.h: Signal
 Trampoline for arm
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-13-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <264949a3-4bc2-e4a1-8a4f-61ee43008c91@linaro.org>
Date: Thu, 28 Oct 2021 08:42:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-13-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 28 Oct 2021 15:42:58 -0000

On 10/19/21 9:44 AM, Warner Losh wrote:
> +    /*
> +     * The code has to load r7 manually rather than using
> +     * "ldr r7, =SYS_return to make sure the size of the
> +     * code is correct.
> +     */

This comment was applicable to the original freebsd asm source; it has no bearing on the 
hex instructions below.

> +    uint32_t sigtramp_code[] = {
> +    /* 1 */ 0xE1A0000D,                  /* mov r0, sp */
> +    /* 2 */ 0xE2800000 + sigf_uc,        /* add r0, r0, #SIGF_UC */

I guess this was a bit of thumb1 source that accidentally became ABI?
Otherwise I can't think why you wouldn't squish the mov into the add.

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

