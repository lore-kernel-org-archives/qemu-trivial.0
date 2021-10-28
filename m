Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mg8pe-0004Ct-UR
	for mharc-qemu-trivial@gnu.org; Thu, 28 Oct 2021 13:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg8pe-0004CH-Bj
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 13:04:50 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:39863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg8pa-0001ez-BO
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 13:04:50 -0400
Received: by mail-pg1-x534.google.com with SMTP id g184so7001965pgc.6
 for <qemu-trivial@nongnu.org>; Thu, 28 Oct 2021 10:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TAuk+/GbNk+S4DEOjrJKC85QSxOjo5xs5z+Xa0FHo04=;
 b=dBvy/cSrYyyYWVQB0XRHcVbZq/VMQm3JhX8uH/Ib4VGyrCatlWIclgBuIDSkf+FaSK
 6MVVWOt1FsRe1dccBLAJvRSPFDTbKBZp0kE6r7sWU0csJOEeRJ9wV1oIa+P0oOLO9Qst
 rYOI6BmjgXB0y/VIQ/J/CxjLBmH3II2QmAkDtD2l1OR608ZLatkYgmVGbAEwn3V+BFBJ
 2mXATWyWknOjTaxEFeDxcdQr7YUL/P17ndMsgPBZjXgAtEuB0bq/nnlSIqXyEs2aiQUy
 EjIkJ02Yhmmsiv26mFaYa5qCFGW9O/MdBviN4ZFB+5NuKmA1R5ioVcSmRmXrr1OzHsm4
 yIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TAuk+/GbNk+S4DEOjrJKC85QSxOjo5xs5z+Xa0FHo04=;
 b=nt3uP+f5LfM+n+Bu91j2nu+7RmrJeMal4TSajk+M5MY0P1yuggKwW6iaj/fLol9wd/
 GqaEKYX23JpaAF2mXBPklLTY4nQ2jR2jFdLcnUAvpTTmGWOANA9KGAmtsmjnT55MXSwe
 6ONVNJn90UAZHj8k2pI9sWRb3m2lZVWtZnh7GQStGP65lesbLCUKsWo+dMQ++yu6sg83
 wknD8PHH5yIBtb5gT9jeItyKIUXpS+YmL0UKH/xoW5M9AiJQUfpfBD03czFpaYqJP8/e
 qd019QJLSRfKVWg9IT7WNq7xU8bXivPpsvcbpPBeTsqrCnx4Vvi5HUWNSAEYaQLSZ8yj
 7sfQ==
X-Gm-Message-State: AOAM5338itzBSPMipKNQxGrkL+QE0xlTDUlx4To5QLh1Jdwy86nlbMl2
 CkxWG5j6AiybJ39DrNvDPJchBA==
X-Google-Smtp-Source: ABdhPJyRE+hJmufbJHk09WXJQGD94TWywaCts+zcHNAUMNVhzgO/lR8Z2Hn3WSWzcwyPiUgrrLlNAw==
X-Received: by 2002:a63:2cf:: with SMTP id 198mr4136728pgc.274.1635440683750; 
 Thu, 28 Oct 2021 10:04:43 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id z7sm3118220pgo.11.2021.10.28.10.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 10:04:43 -0700 (PDT)
Subject: Re: [PATCH 18/24] bsd-user/arm/target_arch_signal.h: arm machine
 context for signals
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Klye Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-19-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c1e69181-4c2e-7578-e50d-7813cfaaf0b2@linaro.org>
Date: Thu, 28 Oct 2021 10:04:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-19-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
X-List-Received-Date: Thu, 28 Oct 2021 17:04:50 -0000

On 10/19/21 9:44 AM, Warner Losh wrote:
> +/* arm/arm/machdep.c */
> +struct target_sigcontext {
> +    target_sigset_t sc_mask;    /* signal mask to retstore */
> +    int32_t     sc_onstack;     /* sigstack state to restore */
> +    abi_long    sc_pc;          /* pc at time of signal */
> +    abi_long    sc_reg[32];     /* processor regs 0 to 31 */
> +    abi_long    mullo, mulhi;   /* mullo and mulhi registers */
> +    int32_t     sc_fpused;      /* fp has been used */
> +    abi_long    sc_fpregs[33];  /* fp regs 0 to 31 & csr */
> +    abi_long    sc_fpc_eir;     /* fp exception instr reg */
> +    /* int32_t reserved[8]; */
> +};

 From the set of registers, this seems to be copied from mips.

The contents of sys/arm/include/signal.h are

struct sigcontext {
         int _dummy;
};

so I'm not sure what you're doing here.


r~

