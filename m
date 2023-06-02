Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q516C-00020M-K4
	for mharc-qemu-trivial@gnu.org; Fri, 02 Jun 2023 05:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q516A-0001zR-1U
 for qemu-trivial@nongnu.org; Fri, 02 Jun 2023 05:29:30 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q5167-0005ec-Lr
 for qemu-trivial@nongnu.org; Fri, 02 Jun 2023 05:29:29 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f6d01d390bso18499245e9.2
 for <qemu-trivial@nongnu.org>; Fri, 02 Jun 2023 02:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685698166; x=1688290166;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zmiwOYn0i0/iKvf4fkVFlGDNR18MRHPNVR1RQ9Mxh2g=;
 b=G35OsOhRty8cyGuBFOd5TyKxyQZYuw8PyGo/JFRO9FK689vtV33YM4RG3+Qdh6Yvnb
 YsJ0Pw/hAFAcIhRT3ujDgOb3YlwOBinuFe/m8AdmxJIP6iXHiZhi7yF9OX4aK9559Gvj
 +b/P12hjCU/x7BPGTb1sxvewAzrfeBKPQVEwT5tERCjCNhTkk4JrfalpE6dvYs81Gbo6
 nBeSa+dhd2hdUZlJ3EEP2K9Go0hYxmqNzO5diBud62egX0KNXN0MoRG2mhmqnrB77LJ6
 /TVlPJNETPqDwuN5wOn69MSoWKWlTCEPuB0HUNt6B7H/Y+xFPW+2QSybe1ioC12H5eCZ
 TjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685698166; x=1688290166;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zmiwOYn0i0/iKvf4fkVFlGDNR18MRHPNVR1RQ9Mxh2g=;
 b=kHQWGQmY9o/KZgRP4x/bFbMLy5iiaFefczGOqBf5xgbmzi1ZSfg0h51FffapVu7j9d
 +p6+XWQchQjoeJujrvWh1koNKMZzHFbwXFGbttf4267FESjjn+DRBFyPmNtEa0wyZU5/
 Spf6Wwf9+kscV/ezJ313SqIaS+4Cc0vTAMJ9OYVSWCa+YOVL+CobvzVpfoqjNo7vhID/
 kp5YO0BK4hJ3ENdL98Wc/r7IYOd/6xkIRbeh/DfzNjLaYJdU69b+8M/TBO5rBWvggHc6
 ucUHFyaJIMynlKsOJklVOwMFTpwYJVBPETRRmO62GrTzFP9dzkdYbbwgCyphOGsOz2l+
 qu2w==
X-Gm-Message-State: AC+VfDx9FB5qStDKygngBE7qYvpzgMJjjIkNUbbTMmVLHLYdRMBkEyCo
 2pYB2J0Q2OAbft+lJ5i+XHAjaqNRFZDqcw3Dkxk=
X-Google-Smtp-Source: ACHHUZ7cB5AMq6c9+EOpkH8Q1qqVe95ig65/6Fxz2JFlOF7Ahp8uFhZtyBuNdc54QinibQTBZ+wr/g==
X-Received: by 2002:a05:600c:ad8:b0:3f6:e6e3:3da7 with SMTP id
 c24-20020a05600c0ad800b003f6e6e33da7mr1586080wmr.24.1685698165847; 
 Fri, 02 Jun 2023 02:29:25 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.218.254])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003f60101074dsm4960934wmc.33.2023.06.02.02.29.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 02:29:25 -0700 (PDT)
Message-ID: <5abf2227-36b5-9792-ea3d-ec4e3a75b86d@linaro.org>
Date: Fri, 2 Jun 2023 11:29:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH] hw/ppc/openpic: Do not open-code ROUND_UP() macro
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-trivial@nongnu.org, qemu-ppc <qemu-ppc@nongnu.org>
References: <20230523061546.49031-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230523061546.49031-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.1,
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
X-List-Received-Date: Fri, 02 Jun 2023 09:29:30 -0000

There is no generic PPC section in MAINTAINERS covering include/hw/ppc/,
so Cc'ing qemu-ppc@ manually.

Daniel, can you take this (reviewed) patch?

Thanks,

Phil.

On 23/5/23 08:15, Philippe Mathieu-Daudé wrote:
> While reviewing, the ROUND_UP() macro is easier to figure out.
> Besides, the comment confirms we want to round up here.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/ppc/openpic.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/ppc/openpic.h b/include/hw/ppc/openpic.h
> index ebdaf8a493..bae8dafe16 100644
> --- a/include/hw/ppc/openpic.h
> +++ b/include/hw/ppc/openpic.h
> @@ -55,7 +55,7 @@ typedef enum IRQType {
>    * Round up to the nearest 64 IRQs so that the queue length
>    * won't change when moving between 32 and 64 bit hosts.
>    */
> -#define IRQQUEUE_SIZE_BITS ((OPENPIC_MAX_IRQ + 63) & ~63)
> +#define IRQQUEUE_SIZE_BITS ROUND_UP(OPENPIC_MAX_IRQ, 64)
>   
>   typedef struct IRQQueue {
>       unsigned long *queue;


