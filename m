Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mg71X-00033e-BI
	for mharc-qemu-trivial@gnu.org; Thu, 28 Oct 2021 11:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg71V-0002z9-Ji
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 11:08:57 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:42534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg71Q-0007aD-Og
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 11:08:57 -0400
Received: by mail-pl1-x62c.google.com with SMTP id v16so4614050ple.9
 for <qemu-trivial@nongnu.org>; Thu, 28 Oct 2021 08:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oIoB+D3E9e5LyA5rlnMcwDdAR5jEed+Uqnx+sMb9dwI=;
 b=s8swklLsN/arBzNUtAlfaVo8N+y3EOcjKgxXo3m1lArVHPW3/SeyfDyfa40rSAG77S
 1QPoz8CwQx3S1mXFAps7lNqILvnxopEnC45i7LBEAWrN+U+9Xkl6YPSIh3dgiR+6Y+OS
 jeXLYeVB1gsPcbORlq9E0g1velinL+ZUsS9m6D8JDTu/2+vOwE1YcVMkjqtfD+idSm3K
 jw0EOxtqEuMNEf0M7mmOeVuDUz3l0dllhVfWoWHxJjS3wL2zKUSIYYundlkBlypqfZ50
 nAK67GDLsulVQ4h4j1jfT9QsElSz6ZROi6YiLTdmErRSJb5eFj316B0pqDQ68QVyyyuc
 YFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oIoB+D3E9e5LyA5rlnMcwDdAR5jEed+Uqnx+sMb9dwI=;
 b=JOpivOAtLs7z/m++H/Db8kHUyg9nh4ucfRKWoNMcbm9mPMf9rTKSC8EDzEJzw96OW0
 lWGGLDNBZSNRNtfMtD0Zie9qFMX+2VWmwNemO9NRTojBVavn3IWZcUkyDKq++Dmg/hC8
 EXfkqHssMo3aGKKeHy2v/uh/nrX/oJcQcuEZidrru7Qv2PMdM2uOIDdaRHIbsPytXYNd
 2XWK0zsXVt+2JLOSY785prQJbZf/2aYQVD0ArkJI0baosgm49b5Gf++GYwjERlngrdCl
 lzsQetDZeYKTxQ+sWNnFzMczgv4cZaotg9uupP+z6TDd8gJBCWz+o1VHi77lfgssrggV
 lpAw==
X-Gm-Message-State: AOAM531wFoqYybH7kOJbJWfe+51mpxkri60npZpyRUHq6AgF6MEIAM1Z
 vvLVVwV7w7L07g/HowTudII1Ub/8n8v1uA==
X-Google-Smtp-Source: ABdhPJx/dtaIBAAzi3auri9UBVW6xe4HuzwBZC/FtLmGxjzRcpqyCCxMSKxMvVWKhbhxDGASPcjepw==
X-Received: by 2002:a17:90b:3b86:: with SMTP id
 pc6mr13248805pjb.143.1635433730072; 
 Thu, 28 Oct 2021 08:08:50 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id h1sm4073376pfi.168.2021.10.28.08.08.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 08:08:49 -0700 (PDT)
Subject: Re: [PATCH 02/24] bsd-user/arm/target_syscall.h: Add copyright and
 update name
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-3-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <67457140-e129-3b96-a033-b2d4cb07087c@linaro.org>
Date: Thu, 28 Oct 2021 08:08:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-3-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 28 Oct 2021 15:08:58 -0000

On 10/19/21 9:44 AM, Warner Losh wrote:
> The preferred name for the 32-bit arm is now armv7. Update the name to
> reflect that. In addition, add Stacey's copyright to this file and
> update the include guards to the new convention.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_syscall.h | 27 +++++++++++++++++++++++----
>   1 file changed, 23 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

