Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kYZNB-0006W2-N1
	for mharc-qemu-trivial@gnu.org; Fri, 30 Oct 2020 14:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kYZMz-0006Tx-Tx
 for qemu-trivial@nongnu.org; Fri, 30 Oct 2020 14:43:26 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:33950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kYZMt-0001BX-Q8
 for qemu-trivial@nongnu.org; Fri, 30 Oct 2020 14:43:25 -0400
Received: by mail-pg1-x543.google.com with SMTP id t14so5979124pgg.1
 for <qemu-trivial@nongnu.org>; Fri, 30 Oct 2020 11:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/fASQS/vg4+7sSwz9Ev+iuGWJBOfUnQURoJcpEt3nsQ=;
 b=RBg1+aqoYs8Tq8GgHzgdMfLYExHuxM9EvNnW6hEvVi//iYGge73JFv29MB4OxJC8cc
 +hs9NGnZ5/2ySSJKEGZ8UZNlSOqotqmooLaFUKySgnQvstjzdKXGKgYDxiZt0x5rxWM0
 sw4c94YX9VNYSL0PcW2JjzO3ir92wmszLAwOTX5LLzq8Slt3SctpMwc7qgz+V7Bud++J
 Np561XHluooNXFjlD3QmoemR1q2RtYoVJ9IygLMnhO9lDvZnFwZw7OLGVR9YMcI7HQ3P
 kpNYfG2WgfR+A3MK6CWRYCaXUilsI4oRa0VIUyPiCvjrPMOfRrUGWRDes5E6jSXG9mUL
 RLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/fASQS/vg4+7sSwz9Ev+iuGWJBOfUnQURoJcpEt3nsQ=;
 b=E0QeWqr2KJnfp9HIbw4gGiBJm5m1IFVfkmWUp3mXMEVtInQIl/gPpoaKtWu1M+ELwU
 7E3yRedz14f6chu8Lt6g749vyb7kMQlsCPlaAV+yB1CE9nLYchi1RfRK2CKv7k30vb4+
 p86SP+WAXWsFNYJHRflwM4fz0N1/1sCLLDzfkQcThZuq7tqDuEkq/OJgGvT6HLIgbtUx
 Jjy/ZGIa1B/5FpQMXlxsMCOGt2/7WRNMbapMgnQxQxYF9/gohO4sAw3pn2OcIgSdX6TH
 4Cj3xZV3dZonnI2/q5e+mYvftyfsY/r+zxpow74ZQE48ZaluIRbbTjA1BcRg1rx3NC4z
 7ZXQ==
X-Gm-Message-State: AOAM531pmcTBMuOxwwUqIla/X2jvaR6NyqyGJKrDXib4Uktq82hHTF/K
 sYt0fZwnwpwwYqOOj5NYRf/8wT7uTLhP4w==
X-Google-Smtp-Source: ABdhPJyInc+ULnwdbAzI/w5i+iPjoAPbFvY5/CvBP8kZYT1w+rg59Kvs+2iACap5v3i0t5JO9fmoPQ==
X-Received: by 2002:a17:90a:de5:: with SMTP id
 92mr4366744pjv.179.1604083396168; 
 Fri, 30 Oct 2020 11:43:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id z6sm6717683pfj.48.2020.10.30.11.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2020 11:43:14 -0700 (PDT)
Subject: Re: [PATCH] target/unicore32/translate: Add missing fallthrough
 annotations
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Guan Xuetao <gxt@mprc.pku.edu.cn>
Cc: qemu-trivial@nongnu.org
References: <20201030093157.11795-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7c109ad0-c1a8-d60a-839a-b70e988f3059@linaro.org>
Date: Fri, 30 Oct 2020 11:43:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201030093157.11795-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.253,
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
X-List-Received-Date: Fri, 30 Oct 2020 18:43:30 -0000

On 10/30/20 2:31 AM, Thomas Huth wrote:
> Looking at the way the code is formatted here (there is an empty
> line after break statements, but none where the break is missing),
> the fallthrough is very likely intended here. So add a fallthrough
> comment to make the it compilable with -Werror=implicit-fallthrough.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  target/unicore32/translate.c | 2 ++
>  1 file changed, 2 insertions(+)

We don't need to guess based on blank lines.
This matches with the instruction set overview at

https://en.wikipedia.org/wiki/Unicore

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

