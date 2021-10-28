Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mg78E-0004HI-KM
	for mharc-qemu-trivial@gnu.org; Thu, 28 Oct 2021 11:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg78C-00048x-Hn
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 11:15:52 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:45615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg789-0000gD-NC
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 11:15:52 -0400
Received: by mail-pg1-x535.google.com with SMTP id f5so6653352pgc.12
 for <qemu-trivial@nongnu.org>; Thu, 28 Oct 2021 08:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zwRST2ZRmnANfCTLGADUg0tH4Oio4ixVsqvhuocNFCk=;
 b=QZe8HJ45u+XwutC8HAzmPzVFYSP+KchPvNjhhVtkeVLdoiBUQTvg+P3K7llWC6srBB
 LxLZxOJjCPY0A1Zlw+WQTntinkG75zAmEM6qiBUHMoh2D8XIB/GqvXyWagRgC1m7cGyY
 HuWIWJeAMnUkFzpdtcKcMl5PBs0+l1bj/0w1FzRw8TijgmtgsEWc5KLM8fVXhwyvtMZv
 6BTgXywLa8aSRQ9E3a9nPHJTHGmrFw3fO60S5ic9TXEiWNKlRI1kOKuREQQJ9CFyF2fz
 YzXTcz1Ar80C4rbafPZReoOskjULpKfa9HNJByEnJxQpp0kSjoE0F/6cHnLU7tPaaI0i
 zmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zwRST2ZRmnANfCTLGADUg0tH4Oio4ixVsqvhuocNFCk=;
 b=IAeqaTFlsxQnDED61nWvI6YjC3UA8TXz5he56PsQdGZeEViQwI//NrLdiws85OJRjb
 jNxySVQAkVliih4nltdob9cKb0YMiGmjxUUlLVqzPu9DUExPey21EnIpORkrgG/aglE3
 yxrTWQwpN6Auv7suHYnoK/nYuwzdRzOASXlHEbT5aDA2dy/cwapxwJxzpg4x3w7W+5uC
 /cP85nEfCXZ5YR92frEB2mWxZ08zk17OfLJjfzg5J2bTVHYHrUf2rYC7DNoOrqU5Yd2m
 qW7yHtn14SIhe2LuTbleX6ymFbWlTPMV1jffLafCtP6mCo3agjfqyM7Jk/kZxqM0yldF
 yulw==
X-Gm-Message-State: AOAM531k8Xg+jGbiVUXnkmrZ5gev2n0jyBZluYl9y9fxUN3CWLZpAScT
 bT5yuPw4A0DJ3ztnTWp3iBbmgQ==
X-Google-Smtp-Source: ABdhPJw4UwyhyEVF5cpnVFI476BMrPfwFfpYpprcovUzdPR9u9TkVIO/PM1hrXZotz6uHd9yoWZ9eA==
X-Received: by 2002:a63:cd0a:: with SMTP id i10mr2983772pgg.429.1635434147331; 
 Thu, 28 Oct 2021 08:15:47 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id me3sm8732616pjb.3.2021.10.28.08.15.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 08:15:46 -0700 (PDT)
Subject: Re: [PATCH 06/24] bsd-user/arm/target_arch_cpu.h: Dummy
 target_cpu_loop implementation
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Sean Bruno <sbruno@FreeBSD.org>
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-7-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f97a53c1-af35-2ef3-a442-0003b0df81d5@linaro.org>
Date: Thu, 28 Oct 2021 08:15:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-7-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
X-List-Received-Date: Thu, 28 Oct 2021 15:15:52 -0000

On 10/19/21 9:44 AM, Warner Losh wrote:
> Add a boiler plate CPU loop that does nothing except return an error for
> all traps.
> 
> Signed-off-by: Sean Bruno<sbruno@FreeBSD.org>
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_cpu.h | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

