Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qBXD7-0007WN-5U
	for mharc-qemu-trivial@gnu.org; Tue, 20 Jun 2023 04:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBXD5-0007W3-QQ
 for qemu-trivial@nongnu.org; Tue, 20 Jun 2023 04:59:35 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBXD4-00063v-A5
 for qemu-trivial@nongnu.org; Tue, 20 Jun 2023 04:59:35 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9786fc23505so539858866b.2
 for <qemu-trivial@nongnu.org>; Tue, 20 Jun 2023 01:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687251572; x=1689843572;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bk1WWc2OsWTvabacK/WESYj8WKq3rwbdQ5NWHegaIDY=;
 b=iscCA7albEx8EOQwttEgwKbjjM97wAUS8Z5fX5Fq1HJwB6VNGlyVjPcwmxUJrFS600
 WiGwoACiKr9Qv+H3ubnroQWLJtvNsnzmJsPRWLASJbyUeZUC/a84XW1qVKUqoQcHnPhe
 CCAmW5KRY0ahVRoaKRBGg9oQlHZ0y8kgHnf7ZhIvhGdB7rrFrYdgtYXw5S5oDa0D6UFZ
 z2CpYlY6eYfVvCEpHwGSZAW7kIN/NIr5sg60MRmWdueXVbYz0W2rL+F634AUCvL+wneT
 HQjhfX2GnAoXmgbNbu5UouzKrkOAZebNFNIDQ3zKVxQTkB8rYQewfoRt6lsnWKFEjUw1
 yV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687251572; x=1689843572;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bk1WWc2OsWTvabacK/WESYj8WKq3rwbdQ5NWHegaIDY=;
 b=hBLGIiXDKlnse5w55sPpJO2HFEoPrQACyiod0g378XEtF3U1Nyb+T7TWUuEmPKbHC+
 MDZ48v8iduVwIEEpIZBPY+26D+zyviMYeKWF6pTgzT7JemM5KUJ7PSuxWnMCX9sZqlMF
 gDQWND8XP9v05dsoHS3aMMIlMVqCebdJQQ9tj4W8h17xV6xPNh8HV5KqWj4WT/CLavPL
 ptrOBLQ6NKdk133h7i16V2tEUMxTyjsDA2dwxOqCdLJlEN3NFkt9kfCE7/+SKVEIyhd1
 AnRCwddLQRqUpBUBUrNt6GL90JIyKq2ReezvL2VBB+OsFAKDM0owyZaCmk3i17B3syjp
 i9Uw==
X-Gm-Message-State: AC+VfDyW8QIQ6029D4LVWEFwwyV85vu+Mkc48pe5iaXhKZEnTFlT8b3t
 oJ2XiN85ywsjaLnWR6PtzCgwdA==
X-Google-Smtp-Source: ACHHUZ62z62OcJXgkOgoSdST5Eho5Shq66LOHBtKXj3VfzVfKhiFRAea/qYRbuIh1LOErigkEkUD6g==
X-Received: by 2002:a17:906:5d0c:b0:988:71c8:9f42 with SMTP id
 g12-20020a1709065d0c00b0098871c89f42mr5852440ejt.8.1687251572334; 
 Tue, 20 Jun 2023 01:59:32 -0700 (PDT)
Received: from [192.168.69.129] ([176.176.183.29])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a1709067cc700b00988b86d6c7csm1006106ejp.132.2023.06.20.01.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 01:59:32 -0700 (PDT)
Message-ID: <28b351a9-49d2-bf5b-ab02-2f1425f0855b@linaro.org>
Date: Tue, 20 Jun 2023 10:59:29 +0200
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
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-List-Received-Date: Tue, 20 Jun 2023 08:59:36 -0000

On 6/20/23 10:39, Frédéric Pétrot wrote:
> Fix arch name in the define that prevents multiple inclusions.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> ---
>   host/include/x86_64/host/atomic128-ldst.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Whoopsie.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

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


