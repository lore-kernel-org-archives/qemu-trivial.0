Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ljOMV-0004Yy-9c
	for mharc-qemu-trivial@gnu.org; Wed, 19 May 2021 11:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljOMT-0004XD-JV
 for qemu-trivial@nongnu.org; Wed, 19 May 2021 11:43:53 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e]:43699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljOMQ-0003CC-VL
 for qemu-trivial@nongnu.org; Wed, 19 May 2021 11:43:53 -0400
Received: by mail-ua1-x92e.google.com with SMTP id f1so4563065uaj.10
 for <qemu-trivial@nongnu.org>; Wed, 19 May 2021 08:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LLJ9KvdECIehzSj3mRRExloEyAODdoBOLEiahn8l//o=;
 b=T81O0MlKCThkOisrpD3qB1AOlhux2EV53jt6lye/ICue+gUfgBLznanoewcfP6iHCR
 BygRiLFcTba22RnBj/2OGdPrk6DSfJfOxYCW8vxfTZ2woc05pW/8uGKPwQERSfhQnJr5
 ZCe++Bo60LvDURfXmcyTOTBn3pcFUStHYt/s75QjgDdc91q15EZkqYShIuMlpcFCtYlk
 G5a4PTTDNOljAToJ8LDLe248I59YtHuLOtfGhB7/u02XMwIjiHdjE2pZfFGtYZG8EUt/
 iu3FlhYjXdjqZWlwHufDFPPX/RS72uFpzcspgb7PAqAYbOr2vNQNFbJaZ/usY81Gq2Zc
 fgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LLJ9KvdECIehzSj3mRRExloEyAODdoBOLEiahn8l//o=;
 b=PVOvapilD/iPiXfQxlSffP7uxXl9kZ4tVYSk8iJExrnG7qPaTudFbQ4vC7sm8S+8l6
 0fC9VHfGQLmLbUNK+xP+wQxqi41pSkLlWPZyrgDN4q7p8QAClB4y0bEBM2SxW5+/wDHj
 xOPLBfjJFF8M+KPX9EPOGtB+SjYsvHX/vxHEv4nFE71MZUuisWVr8fyopMM5cR2fivRh
 DcOCXzWw9yHXre8bVR+zvUxLtrLMB5/jEn2/BCQLugkXD5Bo5s8a7YSG681MVL29Qjk6
 gEqEOD86Z83ld9VSEWeA38GHfa4mOHY9buBhDmcRfz3oYPoiWW6OIiKirkc5MoRMw5Wd
 IYfw==
X-Gm-Message-State: AOAM533WQIbGdMKwu9Y2rOaglzm1BCeuSi9jTn1I6Mq60zTr1JF+aUtn
 GVllGcO/1Q2UNKu/dMaaxCk8ThiKJs6xc22C
X-Google-Smtp-Source: ABdhPJwQE2horOz8UIV0uoBklnTVK7FlQe3qFGnIVwwdc+Vqt3S2dU5woIFl+10MXio2IEHW86qJfw==
X-Received: by 2002:a9f:382c:: with SMTP id p41mr16294291uad.65.1621439029815; 
 Wed, 19 May 2021 08:43:49 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id d8sm1226vka.15.2021.05.19.08.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 08:43:49 -0700 (PDT)
Subject: Re: [PATCH] target/hppa: Remove unused 'memory.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20210517101558.1040191-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f7acc5a6-fe81-0b68-75b7-951a28bab039@linaro.org>
Date: Wed, 19 May 2021 10:43:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517101558.1040191-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ua1-x92e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 19 May 2021 15:43:53 -0000

On 5/17/21 5:15 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/hppa/cpu.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
> index 61178fa6a2a..748270bfa31 100644
> --- a/target/hppa/cpu.h
> +++ b/target/hppa/cpu.h
> @@ -22,7 +22,6 @@
>   
>   #include "cpu-qom.h"
>   #include "exec/cpu-defs.h"
> -#include "exec/memory.h"
>   
>   /* PA-RISC 1.x processors have a strong memory model.  */
>   /* ??? While we do not yet implement PA-RISC 2.0, those processors have
> 
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

