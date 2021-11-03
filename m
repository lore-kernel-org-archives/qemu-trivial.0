Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi6zg-0002lS-Uc
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 23:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi6zf-0002l1-7j
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 23:31:19 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:34550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi6zc-0004pq-SB
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 23:31:18 -0400
Received: by mail-qk1-x72d.google.com with SMTP id bq14so1100068qkb.1
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 20:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tnayhmX2nj4EY9ISbUqUmzqLGa7Zie1h+gMbaiHG+h0=;
 b=QQ1UsGEHmKVLij2OijYV2Ro8eeO0sVAPb/3gq/sU0DvzG+97pEum2O4z8+RpaGuapG
 s6Dw4teTVjKWpzNA1dcbFlSuemvxmS4ZuigNMotoaOco0WBeqloG5qZoF5iMSn3QJf+0
 1ECIYoYam+hKkcAKguvpNU+CEb9XXulDaaGs6olcdBHLaJqtPSITZYtfpwfpCGhM3F7x
 ZarLnpsQLMzkz+Mg8FKH8rGPQ+cyK00Q42rYpkzMbx4cwrFhaDTUFmmv2qF+5hFBYs5V
 ElMhetVXC8sYM1P8kU7hvuRil7AEKk5LDu4gnvOG/6uW8sKXnT00QRaHgGTaNHrEdHm1
 7FFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tnayhmX2nj4EY9ISbUqUmzqLGa7Zie1h+gMbaiHG+h0=;
 b=ytrLCY9LY/RSB1aHbzecahn8EBQ9UXW45/S2j351KIt1VASZq3wCz4IhEdXlWHSP/S
 L8G3RlcKPpq+1XK6FGngxw3nCLONfQK3AeYSusBHnh2oXRfkxiswYfmnCQh8Ls3sSFs3
 6g/tbxnurow02+cnIGebaQtG47F2K6/lkk+xtg0rkaqZvW5Jbx5IHLRlb3mS/j/kuzDk
 HN5ia2RnTR7E/rCq/j6afKJI7xjYuGU9C9VHgVnZgWHzQwyleKi6saYzvJrSf3+GlrXQ
 6uLdr5BwlMb+T49YDNrlM6toPinpFNl43cODgEVjqqYwyhmRHSIdCJuszB7aiXFxiJMm
 PDbQ==
X-Gm-Message-State: AOAM530dfYj7c8Y/HFT6Oednj++gSpQ+LD/ros+GN/ViqViwWFClh2eU
 MBmr5t8NqYJYvhg7M48bMl6ASw==
X-Google-Smtp-Source: ABdhPJwuYgSx9B775Q8xb01XmsupUfTEAXvSAvfhG0pW04Y4A1LKB3X76DvlQ677rzpHlDNZJMTxfw==
X-Received: by 2002:a05:620a:1381:: with SMTP id
 k1mr32523625qki.99.1635910275628; 
 Tue, 02 Nov 2021 20:31:15 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id d7sm662057qkn.28.2021.11.02.20.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 20:31:15 -0700 (PDT)
Subject: Re: [PATCH v2 14/30] bsd-user/arm/target_arch_thread.h: Routines to
 create and switch to a thread
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Kyle Evans <kevans@freebsd.org>,
 Laurent Vivier <laurent@vivier.eu>, Stacey Son <sson@FreeBSD.org>
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-15-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1e865859-b1bc-6e80-816f-da4858a8f2cd@linaro.org>
Date: Tue, 2 Nov 2021 23:31:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102225248.52999-15-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
X-List-Received-Date: Wed, 03 Nov 2021 03:31:19 -0000

On 11/2/21 6:52 PM, Warner Losh wrote:
> +    /*
> +     * Thumb mode is encoded by the low bit in the entry point (since ARM can't
> +     * execute at odd addresses). When it's set, set the Thumb bit (T) in the
> +     * CPSR.
> +     */
> +    if (entry & 0x1) {
> +        cpsr_write(env, cpsr_read(env) | CPSR_T, CPSR_T, CPSRWriteByInstr);
> +    }

This should be

   cpsr_write(env, (entry & 1) * CPSR_T, CPSR_T, CPSRWriteByInstr);

because you need to clear T for arm mode as well.

> +    /* FIXME - what to for failure of get_user()? */
> +    get_user_ual(regs->ARM_r2, stack + 8); /* envp */
> +    get_user_ual(regs->ARM_r1, stack + 4); /* envp */

Surely these values are present in image_info anyway?


r~

