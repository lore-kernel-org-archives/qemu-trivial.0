Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mg9Bw-00054i-5A
	for mharc-qemu-trivial@gnu.org; Thu, 28 Oct 2021 13:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg9Bv-00053a-8u
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 13:27:51 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg9Bl-0001f3-Iu
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 13:27:49 -0400
Received: by mail-pl1-x634.google.com with SMTP id v20so4918948plo.7
 for <qemu-trivial@nongnu.org>; Thu, 28 Oct 2021 10:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zaxOI3+H40eAC7dnjgsV7KO/Wb8rgkRdkeL+42IcGRY=;
 b=EMyIqWzNABwEMl/R2MXJD6lDPiMfZZh9oLVTDO7WHDBfkhWSQiRZksLx4NtEUQ3eQQ
 l8OPErjeqJ2pfO1iohzJfBlUXlareyd10Xy6NrLI+bq111qn07u6JJHvzTXhgGV5zinW
 C8/Gvx21Hr+iKQe6a0z6pF0K+zqt9KV/vBw4cdWkYmB+U7va5gLL4gktEDuiM+vS5m0V
 HoP9kR09eJcuiL6SpGXp3qg79aRzBXi7vAjpAoCWKHopWGFC+ehLSxjn8Jn6aDtn7gNf
 uHi55d99ys8Ub895tzCBUQODNSLuDW+JPQkl3onS9iOMFkDoG/336wh9RUtK0GLwOW93
 vj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zaxOI3+H40eAC7dnjgsV7KO/Wb8rgkRdkeL+42IcGRY=;
 b=SQKxozQDizfqoqZaG6Sz2aEAd0TwgP3f1HyL1ySRLnaurmzyIjg3+C4JWTi9rtBN6q
 GTIWTNR0+lW3hHRnb0obNCMq5bEXH7bBAf2HjC7+vm2+EtPFN8synaPo6nCUP9rpC130
 DwvHtWcmEEOoHyq39JIbuAh+QZxzTM92eb7IkcJwyOdOQcrZcbcZIembAmOuF59XDrLl
 vFhw1Ve7nRiA/uaGhZaSh4MFgiGGVWFO/eFVJbNRLg6+vRwGg7uZdhdgcJcZrWma8TRI
 uhrAXam/ygkOcR+6IXFxyPjlvCHABwwJR7zLmXhh5MylC2XAwfauaxi+zKHdeyt6Pc7W
 7Cxw==
X-Gm-Message-State: AOAM5317vlQHHTPKGVvKg9avIhYX1aO6wL4vt7sD2zvAi30+FV9CIvyY
 dcmUcKaTvJd8ET7JM0F9oVZ/yA==
X-Google-Smtp-Source: ABdhPJxUXBn4lHGCVE4ctD3+Q2xW6+H/dd31UohenQaAO+F83USUlaWiAHbw7hcpr5J6/JbOyFOEnQ==
X-Received: by 2002:a17:90a:4801:: with SMTP id
 a1mr14177768pjh.156.1635442057876; 
 Thu, 28 Oct 2021 10:27:37 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id t7sm3887161pfj.217.2021.10.28.10.27.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 10:27:37 -0700 (PDT)
Subject: Re: [PATCH 21/24] bsd-user/arm/target_arch_signal.h: arm get_mcontext
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Klye Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-22-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <264dc9d1-70ad-34eb-e51e-8473d12f9cfd@linaro.org>
Date: Thu, 28 Oct 2021 10:27:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-22-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-List-Received-Date: Thu, 28 Oct 2021 17:27:51 -0000

On 10/19/21 9:44 AM, Warner Losh wrote:
> Get the machine context from the CPU state.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Klye Evans<kevans@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_signal.h | 38 +++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

