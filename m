Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi7GC-0001EH-0K
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 23:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7GA-0001Ai-3Y
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 23:48:22 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:42579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7G8-0005K0-9M
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 23:48:21 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id b17so1440576qvl.9
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 20:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J1JY9PvER/rJlBn8al3nAN0VOcjQ6O3/FSLUyYKLW3k=;
 b=xEZkasiOJwfYEyi697FonPEVp68cN82Tzs/vQY8VNP2MoeFDgDVHgcuORKcdUCvqPg
 RnKB9TJiskSl5jumAEGLQXUZRzzCK4wgzTMD2APCVlDzPeqLLEgAru+PvnfuU//uSyEF
 3+JEhAxs1PuTyZB0MBT008zDPNe/ZJQ6gXbCZXHIOWKqtawDk++choFojiLMKc2eE67R
 6tb+mRRkx1e0+pJ7ITz9W6RFoqgcQulTr5dJUhyk7dkjKNhQNK+aGeBBr9Bs2TK6wWs6
 kz5u6BnD/5A5jVqAptwObO7jXiBhn+5ojqD1jytUJ3C0AMp8bi1cGW5s+ViPe2wwBGH0
 g1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J1JY9PvER/rJlBn8al3nAN0VOcjQ6O3/FSLUyYKLW3k=;
 b=YueASWG6NvGOgQ6SvwwUi65f3c4kKcttcg2M8oUDlhLoleB2iGovaIf7DZAyHI2ElU
 JII/Vf3lK/WxfzSEGODksV7OrcwHvaydGkZiRwlhYfAY4pxldxDFc7Mu7WEin8FhMJFW
 FbWbldwop2AvWaCd1q94LWzLk6dhuePaQlicc7RYRahFyhcowie/GOtCTF0b6jpiPPHY
 EK8q0+MQcAK2zl1qcVf9OgJSkcw5c7iVS684XUe5LPCq2JFwPBJeO58ZUAQwAPpKVKi1
 CpFnNqIhlr1CZrobZcnqpygHB9VUORu9Ai6St18NuI6hc8v3j2L/VCrisyxgosLML2tt
 qCng==
X-Gm-Message-State: AOAM5325JnLZIMSVTwAgz//ldKpv9rPWwqYGmLKMnAMrp2PRaCXtJAw7
 D20h1R1u29xCyOwBPxy44lrK6A==
X-Google-Smtp-Source: ABdhPJzf4/6FRiFjtSKVEcQBehnlTYgfBRHJ0zTaoYLzqbpKRr7MVVw/rrbqE+ocsdW5ppbnNxCtwQ==
X-Received: by 2002:a05:6214:96e:: with SMTP id
 do14mr33200378qvb.39.1635911299513; 
 Tue, 02 Nov 2021 20:48:19 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id a15sm740547qtb.85.2021.11.02.20.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 20:48:19 -0700 (PDT)
Subject: Re: [PATCH v2 27/30] bsd-user/i386/target_arch_signal.h: Remove
 target_sigcontext
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Kyle Evans <kevans@freebsd.org>,
 Laurent Vivier <laurent@vivier.eu>
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-28-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <31eda88d-bff7-fcf9-62d3-528ce16076e3@linaro.org>
Date: Tue, 2 Nov 2021 23:48:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102225248.52999-28-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
X-List-Received-Date: Wed, 03 Nov 2021 03:48:22 -0000

On 11/2/21 6:52 PM, Warner Losh wrote:
> In FreeBSD, sigcontext was retired in favor of ucontext/mcontext.
> Remove vestigial target_sigcontext.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/i386/target_arch_signal.h | 4 ----
>   1 file changed, 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

