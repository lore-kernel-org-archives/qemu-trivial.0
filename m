Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mg7Qq-0001js-K8
	for mharc-qemu-trivial@gnu.org; Thu, 28 Oct 2021 11:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7Qp-0001jc-7l
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 11:35:07 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:40670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7Qm-00038C-9W
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 11:35:06 -0400
Received: by mail-pf1-x431.google.com with SMTP id x7so1325275pfh.7
 for <qemu-trivial@nongnu.org>; Thu, 28 Oct 2021 08:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pbzpAyqEqEU6lw6rIowAcMbDEVJa5p6g6GIFcPtXGaA=;
 b=dgWmsMbsyBLQyzI8UV9kx5CsBqHi5a6Fz9817M78IshB9z6WF4N3z9dJzI8hWiyo6h
 FSK17bzVGt/mjovhqe9V6+Hw5hQTwxulC9Wd2wZ4vdEaozT0GZv9z9HKr+NL1s1NLZCk
 zcDMzFwSa2sASciFlCusSER1rVXgSX8Rpx0LzsrcJY7ie4cpvU+4fn7mXVwCxzdCpjfw
 NTplsDOx8siZYC+eikoobOfc4Q0m2PJk9PBI/BSCCwLpjgJUHOc4DEXbCQYnm5jKGncb
 jmiFqCIp9QzN9fJ1dVrhbQsdwq/T74s5cnV/84jSWSwoST57fn23Pc96J4/Hj6PW6wI4
 fTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pbzpAyqEqEU6lw6rIowAcMbDEVJa5p6g6GIFcPtXGaA=;
 b=UQzgck29oNyVaA0UEDI/WI60NOdzNQm2Vk02QqqfOI0auPGqS2XIgetopgeHIWjykN
 i9nSeEuEsIy/6O8ZVyWM3aWMVw+KG+WNtdmiqN/kbx+qB5RnAXuEHUYeCtd8uVJmeTnY
 VkN08sx00R0+dgcMX9yJ22ygrg87WvnRbnIU5s01DrfDkbpN49tGKmka2bUI+MIkwqgP
 eNVIVmsHIJ9mjxR/qh4quEIKuEbsC+Unp5905Y6NnSpjEfOo+k97bbLYuWe6cW7UywYg
 sFG+TBKdls+w7Ikbn+mAUARAc5qs+ut291YRZ57YRTgfASifT4zBzX3/y9lS87RNR5Yr
 iuKw==
X-Gm-Message-State: AOAM532PoKwAum371HmPA3YE5IRCz9rKb5g2ZhRZTUqrrTWNKlFFMWN9
 Xi2fUjqATDhzHBYlmRrvX+87+w==
X-Google-Smtp-Source: ABdhPJxOSidAlZcNsZKd/WBmWQkO0KzO53yqevLujbsPpjJVW2xcmor85xl6Y8ykj2Rx2+D+m5rOpw==
X-Received: by 2002:a63:fe03:: with SMTP id p3mr3737262pgh.289.1635435302710; 
 Thu, 28 Oct 2021 08:35:02 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id d12sm2704229pfl.141.2021.10.28.08.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 08:35:02 -0700 (PDT)
Subject: Re: [PATCH 09/24] bsd-user/arm/target_arch_cpu.h: Implement system
 call dispatch
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Klye Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-10-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <152e8afa-fc89-5666-e234-a2af6bca6acb@linaro.org>
Date: Thu, 28 Oct 2021 08:35:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-10-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
X-List-Received-Date: Thu, 28 Oct 2021 15:35:07 -0000

On 10/19/21 9:44 AM, Warner Losh wrote:
> +                env->eabi = 1; /* FreeBSD is eabi only now */

Surely this should be set target_cpu_init.  Even then it'd be just for completeness.  This 
is the kind of thing that shouldn't have escaped linux-user, as it's otherwise unused.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

