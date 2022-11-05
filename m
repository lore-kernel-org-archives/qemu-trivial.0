Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1orRIT-0005vN-RS
	for mharc-qemu-trivial@gnu.org; Sat, 05 Nov 2022 18:05:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orRIP-0005mO-PR
 for qemu-trivial@nongnu.org; Sat, 05 Nov 2022 18:05:46 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orRIO-00052l-7t
 for qemu-trivial@nongnu.org; Sat, 05 Nov 2022 18:05:45 -0400
Received: by mail-il1-x130.google.com with SMTP id o13so4231189ilc.7
 for <qemu-trivial@nongnu.org>; Sat, 05 Nov 2022 15:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=maDre7JlP+47x0u3UeMty3N52EW/Dey5/c0OMJhSD20=;
 b=TVFordx7Vtm6fZbAWxWFYYBsRFKf4OL1ZiZ0xpyw4j/yOZ0UMMMn4xBm7PI9HY/FGL
 itU0iAT8sTsWy9dw+aYT7N/AYfemJVOeYuqU+P2+UQiJN1mJU9Qu9ceYvrDW8HloGZI/
 lnjqctDoEf7v5YLvTsg35bA776SYmjoo1ipaJPEsgeAqBK7QQrhEdqh80/KKkTja43fc
 XoT8udS/rI7XOihvF5wIGdLx31pzHu+wPk7XNJtVm4Z6wcqOb/wGXol0wn6UjElCPTXt
 avDIwCkPmR64M5ZU4MyOlRbI6pehtZbyGX7GQ/jeCV6XyTsLmTJ7XuIVt1hN2mHzkYGn
 32nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=maDre7JlP+47x0u3UeMty3N52EW/Dey5/c0OMJhSD20=;
 b=LPKOYPPfJsJ8ISj/auLJjTSDrqkxN+UgjDcpzkth1LlgCJjoN+z+W+HUda0bxZQ6k+
 QQh24iJKTaw1K0SmzE2kCUvMVuV78I5B5ZPaDo3X7MtWszxnd3taNrnmH1c2QbZOr69G
 do8qwHRqO7rnJFd3/l/QKmmrg+JmivVMrek2EMBypvMkDAtY7W5g00zbJjRJpo7WCm6J
 bAdUTBIDqn/54TZpFvBxW7ObARMwUSlmwj2kropRQCAiJRGJCclI3eYnbbVlUnz6lU/O
 PGLGwS5GNbkF336LFgVc8SIZs3Ecw6xld4putCGH0HyTwQ+V1vRMp6estv3+bCGIPGie
 Ls8g==
X-Gm-Message-State: ACrzQf3cgIPoDWN1zUBVj3tHvS5WdbQwejIfj46VuezPoG+GWclehyij
 ZJbECbopWCgHq3X5JE9vS1/QsA==
X-Google-Smtp-Source: AMsMyM6MI8F7H3fmCBksBH+KuPFe52jpTmf7vUPyQOamrI1rGq7zfOTKCVTn0S5Jj4M1J7WAONzqPQ==
X-Received: by 2002:a92:dac2:0:b0:300:c4e1:8b76 with SMTP id
 o2-20020a92dac2000000b00300c4e18b76mr14137242ilq.319.1667685942030; 
 Sat, 05 Nov 2022 15:05:42 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.160.8])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a05660226cb00b006bcd45fe42bsm1254469ioo.29.2022.11.05.15.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Nov 2022 15:05:41 -0700 (PDT)
Message-ID: <8fdb76d5-1035-0f35-d2bf-4bdee653d67a@linaro.org>
Date: Sun, 6 Nov 2022 09:05:29 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH for-7.2] accel/tcg: Suppress compiler warning with flag
 -Wclobbered
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
References: <20221105114424.622563-1-sw@weilnetz.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221105114424.622563-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x130.google.com
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
X-List-Received-Date: Sat, 05 Nov 2022 22:05:47 -0000

On 11/5/22 22:44, Stefan Weil wrote:
> At least some versions of gcc show a warning when compiler flag -Wclobbered
> is used (tested with gcc on Debian bookworm i386 and with cross gcc for
> Windows on Debian bullseye).
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>   accel/tcg/translate-all.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 921944a5ab..90191d97ec 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -743,6 +743,8 @@ void page_collection_unlock(struct page_collection *set)
>   #endif /* !CONFIG_USER_ONLY */
>   
>   /* Called with mmap_lock held for user mode emulation.  */
> +#pragma GCC diagnostic push
> +#pragma GCC diagnostic ignored "-Wclobbered"
>   TranslationBlock *tb_gen_code(CPUState *cpu,
>                                 target_ulong pc, target_ulong cs_base,
>                                 uint32_t flags, int cflags)
> @@ -1020,6 +1022,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>       }
>       return tb;
>   }
> +#pragma GCC diagnostic pop

No, I think this is a real setjmp problem.
I'll send a patch for this and a similar error in disas/nanomips.c.


r~


