Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kYNKh-0001I0-46
	for mharc-qemu-trivial@gnu.org; Fri, 30 Oct 2020 01:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kYNKf-0001F5-FG
 for qemu-trivial@nongnu.org; Fri, 30 Oct 2020 01:52:13 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:42008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kYNKd-0002t9-65
 for qemu-trivial@nongnu.org; Fri, 30 Oct 2020 01:52:13 -0400
Received: by mail-pf1-x441.google.com with SMTP id x13so4309915pfa.9
 for <qemu-trivial@nongnu.org>; Thu, 29 Oct 2020 22:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B8x86jQLto9ZaiLzn2gA8Fr09/O/hz+bdD8j1E3/TUg=;
 b=T+sFNrsKRoamyZrcPk5n+4i0+f5ZBkuC5AM6Lha/m6iQ8lfE0EA8h/W5dizXhVdFZk
 J1GdYkwnEW5UQDyYQXumoDlQEgK1MoXh1GatZbtiLByOd4511e4C7d25YUemomjgFA7v
 HXLwKQgFnys1V/1nbAQxTSYmfE4wAHE+MTyOzMn9i8pPHt2lID+N9SUNASMw0/ecCFzi
 y6uR3QZF56wo1uR3nJR5a82CHnkWcwtnqGrOV18Ox5/1O7+Yl5swn1gq9RZwSyankSHg
 bZu4LuR0e9Q0riZsgbUYjjSaSq8gWtXpJpT9YqHpXqfZ/usdtk5zOKl2OfhgSM6Ba997
 u9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B8x86jQLto9ZaiLzn2gA8Fr09/O/hz+bdD8j1E3/TUg=;
 b=Z0Ily/rjImdZynZVtAbaHLJSAKGPd5RHlZthRLFSj5mI3uEEBotZVWMt7yrKAPQr9P
 aGgLXMqDt4BKHx3Eoj1G12KGnviLGtKnUWM7/s/aa+M0Vp6xJryO/xqTMwnGre/AUxXL
 fv8EOcZgPQVYzOUP3aZqCmXYk4reaDjQcteL0wwLSWJkaTMPcdAh44CwvAmP75oZDXKT
 S96ZInmwZZ8buLGDSugBbjgomOo80tbGGc8Nq8gOaE5TWgDzYuf7OxAzNoOAVp4RLzwq
 CGhQHqPf3PXySFi5gMbaNOgY88Hfrn2+4JQaCl6vR9bid7zzYJUxoNat4A355z8Uxkuj
 Zslw==
X-Gm-Message-State: AOAM531XSYdPUVXn95GM+3MjapISBao6iV1hhfH9Eio8Hcpjul8CIrhS
 ZE6S3/K8c8pRO0klfjG9Lgym/A==
X-Google-Smtp-Source: ABdhPJwbJ9PeE9fW/VgHLLR61LuFizF9bH++rW36Sdr4onO7q3u+nsvLMcYuGDMxLQ6WvJ2/qFh0Vw==
X-Received: by 2002:a17:90b:34f:: with SMTP id
 fh15mr925333pjb.66.1604037128837; 
 Thu, 29 Oct 2020 22:52:08 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 15sm4663167pfj.179.2020.10.29.22.52.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 22:52:08 -0700 (PDT)
Subject: Re: [PATCH v2 6/8] target/sparc/win_helper: silence the compiler
 warnings
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: zhang.zhanghailiang@huawei.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 ganqixin@huawei.com, Euler Robot <euler.robot@huawei.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20201030004046.2191790-1-kuhn.chenqun@huawei.com>
 <20201030004046.2191790-7-kuhn.chenqun@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <80bfd7b7-e4ed-07e1-57a1-2c191644b9af@linaro.org>
Date: Thu, 29 Oct 2020 22:52:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201030004046.2191790-7-kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.261,
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
X-List-Received-Date: Fri, 30 Oct 2020 05:52:13 -0000

On 10/29/20 5:40 PM, Chen Qun wrote:
> When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed warning:
> target/sparc/win_helper.c: In function ‘get_gregset’:
> target/sparc/win_helper.c:304:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
>   304 |         trace_win_helper_gregset_error(pstate);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> target/sparc/win_helper.c:306:5: note: here
>   306 |     case 0:
>       |     ^~~~
> 
> Add the corresponding "fall through" comment to fix it.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> Reviewed-by: Artyom Tarasenko <atar4qemu@gmail.com>
> ---
> v1->v2: Combine the /* fall through */ to the preceding comments
> (Base on Philippe's comments).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


