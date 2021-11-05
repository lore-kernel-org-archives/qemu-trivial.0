Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mj1jB-0007uC-JG
	for mharc-qemu-trivial@gnu.org; Fri, 05 Nov 2021 12:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj1j9-0007sG-5K
 for qemu-trivial@nongnu.org; Fri, 05 Nov 2021 12:06:03 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:44777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj1j6-0003de-R0
 for qemu-trivial@nongnu.org; Fri, 05 Nov 2021 12:06:02 -0400
Received: by mail-qt1-x833.google.com with SMTP id d21so7552052qtw.11
 for <qemu-trivial@nongnu.org>; Fri, 05 Nov 2021 09:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qEbQS/Ouh+WEJN1wHyBYR0mrNuiPYFrTd8eQ68Uh1z8=;
 b=EjM17lIJ4gHxJMcO4cQYFblpZUBOkFvUSuORpjGRhy8E3onXiaaMfSq7mAZ7CEJ4fj
 FW2457LtHlrUOaeqDRa/WE57dYNXNwgV7TDQxgOeQu7L7ofstQzv4ePxcasBPIxt3WYw
 bH9wvsObpF/w2BJvBHa568Aug/+sLApCK8xdVtJUtzCxYykzFnlCIb9oZRp7p6xWgnhF
 mMcft5o7QcXygbSdaSHYof0bphvgjbewutpe18FvD5IaY480Twzjgs0CYlrxV06Nm6Yn
 AnFX9ekLGAQeB3s8pvJXz33PfgUUwoCj1fD9+ngw0Y2kAZnArVAWaADE+SZOFl41GIG5
 6lFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qEbQS/Ouh+WEJN1wHyBYR0mrNuiPYFrTd8eQ68Uh1z8=;
 b=049BNmOEMQtg9wU0DQIoVBwWPIMPKtDqj/C9QwQCV8Cy3LqnmrUYCSTGBjAlHlDt7L
 2bFNV5jJMgoBOJMuE4J+i0sdt+KmIGKNnQTqWd1Nrz/e22G2rW/6xC/iGVUuIZf6K3tF
 haO2QnqmU7VCvs7bKWQInUAiDBHjjjhb5NrVLrWoEM82bhzPVfbWoxqA6gi9B/LiVfaG
 vO96JPIOQik1EexNWYkrO7wXshqKQGwytZfQClNX/sbPib1GqcFoMbHZDAvURQyh1uMj
 rFKRCsy0LXkirj74IyYIieAueSqkz9PZY0cXvI2ScAw/YH7Hkcxp+gR3Cq3KNF4ue9Um
 Rs+g==
X-Gm-Message-State: AOAM533tcOsgOQHCbCuRKi9HHzdjVI0J8or6fE+vC0r6UfWlj269Mk92
 tzMl6umzCvIiW45S7Sn1eD838Q==
X-Google-Smtp-Source: ABdhPJx7uWYDyrvfA9a9saR4xkHIt8rxEHGcqwmAqn5JYHr+Vb1uGV6w3qr2tpmnOhYVh7gyOgCgIg==
X-Received: by 2002:a05:622a:589:: with SMTP id
 c9mr32821669qtb.313.1636128359649; 
 Fri, 05 Nov 2021 09:05:59 -0700 (PDT)
Received: from [10.200.5.34] ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id d19sm6200512qty.26.2021.11.05.09.05.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 09:05:59 -0700 (PDT)
Subject: Re: [PATCH v4 03/36] bsd-user: create a per-arch signal.c file
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>
References: <20211105031917.87837-1-imp@bsdimp.com>
 <20211105031917.87837-4-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <44386f8d-7bcd-9965-5a44-6e3fc60fddf9@linaro.org>
Date: Fri, 5 Nov 2021 12:05:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211105031917.87837-4-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
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
X-List-Received-Date: Fri, 05 Nov 2021 16:06:03 -0000

On 11/4/21 11:18 PM, Warner Losh wrote:
> Create a place-holder signal.c file for each of the architectures that
> are currently built. In the future, some code that's currently inlined
> in target_arch_signal.h will live here.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/i386/signal.c   | 1 +
>   bsd-user/x86_64/signal.c | 1 +
>   meson.build              | 2 +-
>   3 files changed, 3 insertions(+), 1 deletion(-)
>   create mode 100644 bsd-user/i386/signal.c
>   create mode 100644 bsd-user/x86_64/signal.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

