Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mg9h4-0006xq-5D
	for mharc-qemu-trivial@gnu.org; Thu, 28 Oct 2021 14:00:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg9h3-0006x4-0D
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 14:00:01 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:37692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg9h0-0003kM-Ve
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 14:00:00 -0400
Received: by mail-pf1-x432.google.com with SMTP id v193so6718951pfc.4
 for <qemu-trivial@nongnu.org>; Thu, 28 Oct 2021 10:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vzru+Ul7oQKPRnL9dRhiftIZ4OdXGapraNifo8F/Qrg=;
 b=Zgh/6rHhDdqwChZY7htGz8Wpp5zcS5n28MQyrAA4BxUaMQcKje0TZXnxsF3cG939K5
 fZMrM16bWTeoM9oov89ZZTSZ8vSnkMK81WEd83JNIdO4FXDEU7v6bDghNOpLgYv99ZXy
 IZHNevEfaDd/pn6ZNH4Vn/0mkbRiRs9T6eT/2rR6vRViW1bOu5PsahxvJTIA0+Hvpx0M
 AsaEyNWaaUJmMsih0WAJf1ONXegdwPl4lQGFv6ngbtnr+fR6090mO/eMJHy7d2K5A/uW
 4sukrZ7fPKRVxdVJQ7HTlbYvFOz72GmHM/LdqRyU09PU6nPEKc09SVm05G4GWrOze/P3
 CiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vzru+Ul7oQKPRnL9dRhiftIZ4OdXGapraNifo8F/Qrg=;
 b=bKZ+F5hIMH8bpBXTkluwCbS+JHDSRbiSbp9SbjXexVH2BpnKr4Da5EkYa7ZBDgAosv
 bl2VhTEsZJNJ4Zyx+fzDQpsioTIWZfxLFt1v//uH18uI4tPiRT2wOAyg7rnMQ/9EcWFL
 kbdSuG4dWLKETTsPE051cDqidTkVgf8eWXWQHXb50/8PeZyDOiVNIMZ/x3nXCRuGD6Nt
 aEAbidl6KN6AT/Nd+H0o/OZSZ+/j0SqTmxKvJMryogVGHOKA1LFBHT+nlm/mM8jzM6Ft
 dlu5YFpNp0Axg45C0Fc1upzZdQy4UdayXpKTrhDCVLeMAkcfmL3jWFL65cBO37GdWdtg
 t0TQ==
X-Gm-Message-State: AOAM531qnytcwQ8ncYBASDXdmq6rOp0w4BmX3e9G+n2acGisz4508jRo
 aQe2dI70COTaZDH64ZJ3fZtKQQ==
X-Google-Smtp-Source: ABdhPJwWn2aqZ5gpLSa3yMxRl2eT88iBSRwRIQBRq5JMfMLqwRvcOAy4HPnmYCSEusgawSQ4UDEMWw==
X-Received: by 2002:aa7:924d:0:b0:47b:d390:da8d with SMTP id
 13-20020aa7924d000000b0047bd390da8dmr5851588pfp.15.1635443997462; 
 Thu, 28 Oct 2021 10:59:57 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id x5sm4654105pfh.153.2021.10.28.10.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 10:59:56 -0700 (PDT)
Subject: Re: [PATCH 23/24] bsd-user/arm/target_arch_signal.h: arm
 get_ucontext_sigreturn
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-24-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2cd05217-d8c8-329e-ec4f-bbec1c5174f5@linaro.org>
Date: Thu, 28 Oct 2021 10:59:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-24-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
X-List-Received-Date: Thu, 28 Oct 2021 18:00:01 -0000

On 10/19/21 9:44 AM, Warner Losh wrote:
> +/* Compare to arm/arm/machdep.c sys_sigreturn() */
> +static inline abi_long get_ucontext_sigreturn(CPUARMState *regs,
> +        abi_ulong target_sf, abi_ulong *target_uc)
> +{
> +    uint32_t cpsr = cpsr_read(regs);
> +
> +    *target_uc = 0;
> +
> +    if ((cpsr & CPSR_M) != ARM_CPU_MODE_USR ||
> +            (cpsr & (CPSR_I | CPSR_F)) != 0) {
> +        return -TARGET_EINVAL;
> +    }
> +
> +    *target_uc = target_sf;
> +
> +    return 0;
> +}

Since you've not yet filled in signal.c, I can't opine too much, but I'll note that the 
kernel has this check in set_mcontext, and sys_sigreturn defers to that for the validation.

So I think this can just be the final assignment.


r~

