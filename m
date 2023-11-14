Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r2zt7-00018g-CF
	for mharc-qemu-trivial@gnu.org; Tue, 14 Nov 2023 15:19:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r2zt6-00018O-GT
 for qemu-trivial@nongnu.org; Tue, 14 Nov 2023 15:19:56 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r2zt3-00005m-Nw
 for qemu-trivial@nongnu.org; Tue, 14 Nov 2023 15:19:56 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2800bdf888dso134685a91.1
 for <qemu-trivial@nongnu.org>; Tue, 14 Nov 2023 12:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699993192; x=1700597992; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wuodMRTovns5cgScuTLT59A3m8goA7mx88XzV7j9bgQ=;
 b=yVSzLJNmXtn2qVYVyY2SpTdSJRF5mFggPivkHMpvDLAwAU1WuitKp6QyH3i0FBLDdi
 uhzllP+mcB9gSDXLQh5E9UaopTWsynM0OCmhGINfMzuxYWAXZp5wZzjDhTe54zJE25Tl
 8zTdTrpGCgWoX1CrdmuMqSqgQ/mUnP4SrdseqDOWXNQZdbs4u0jU0Sa6QYd8AWM8lcZw
 Stl5v+kWEwTd8RHVOQT1SjeBjpoPpNZXcyh7fpnuRGXnBTh5s1J5zkkWJwSd1dgBvcw8
 jkJsfhu6wRvYstzU4DjRDeeD06oTkCZ+fXayOUnBUW6Gy3rCmo13AH+nz5QoND9tYGGt
 zW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699993192; x=1700597992;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wuodMRTovns5cgScuTLT59A3m8goA7mx88XzV7j9bgQ=;
 b=XOSG9Zfue5we8tdvjuXUQsuovvEGsTn0GceTM+I88BTcM/KhSYNMDCSUWcBN6PjgWj
 35Z+HZfOJA0xtoNYaG+XgCukMdGo5Rt3a2vnTVIO5xWEYuySbWLj55ots8G/3mWxLBk3
 oueZAtQK3kmko61RDIlAV98d+sCoUx0za9quVtAk2ZHnxRYlFrfp+aD/I7eYMMMtrspx
 S5ODtnQ4dmHuYHp6dn6ZJWFwiGdM9HvEpYTy6AcbB5w7LbAQ00ULbS0cdb43ZJ8cfYbu
 UpXog8j80KlpVc5odyCVffGdBc/rq6W3nqqs8dwZt3Z6glgkF+NEfqUdve2WYqIm/tJt
 J6QA==
X-Gm-Message-State: AOJu0YwkdCsDCB+p8yA8XX//Wl0S0J52X/xLXjdjKIkMjNX3FmW2DFPK
 Z6Thml/qbHeOzt7K4dNVra/7sQ==
X-Google-Smtp-Source: AGHT+IGGUHJjg9wB5KW6ul4xJ7VPfHNNzyy6/1uz9tD1kQo64LqwQ+vZe0kZEaSlopZzPkNzOAdbRw==
X-Received: by 2002:a17:90a:d408:b0:283:7e0:2e51 with SMTP id
 r8-20020a17090ad40800b0028307e02e51mr5077346pju.0.1699993191920; 
 Tue, 14 Nov 2023 12:19:51 -0800 (PST)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 lx7-20020a17090b4b0700b00280c6f35546sm5553617pjb.49.2023.11.14.12.19.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 12:19:51 -0800 (PST)
Message-ID: <e35a6148-1494-480b-9d2b-166e757e0f36@linaro.org>
Date: Tue, 14 Nov 2023 12:19:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH trivial 08/21] target/arm/tcg: spelling fixes: alse,
 addreses
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20231114165834.2949011-1-mjt@tls.msk.ru>
 <20231114165834.2949011-9-mjt@tls.msk.ru>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231114165834.2949011-9-mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 14 Nov 2023 20:19:56 -0000

On 11/14/23 08:58, Michael Tokarev wrote:
> Fixes: 179e9a3baccc "target/arm: Define new TB flag for ATA0"
> Fixes: 5d7b37b5f675 "target/arm: Implement the CPY* instructions"
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   target/arm/tcg/helper-a64.c | 2 +-
>   target/arm/tcg/hflags.c     | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

