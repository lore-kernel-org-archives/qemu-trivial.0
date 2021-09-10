Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOfeO-00052W-0B
	for mharc-qemu-trivial@gnu.org; Fri, 10 Sep 2021 08:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mOfeM-0004z0-7l
 for qemu-trivial@nongnu.org; Fri, 10 Sep 2021 08:28:58 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:35517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mOfcR-00040H-3y
 for qemu-trivial@nongnu.org; Fri, 10 Sep 2021 08:28:58 -0400
Received: by mail-wr1-x42c.google.com with SMTP id i23so2396748wrb.2
 for <qemu-trivial@nongnu.org>; Fri, 10 Sep 2021 05:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QHZNMUbqaI7z38U63M9bCLV3uukNmXmqkLmOEuX7MWc=;
 b=VZuQcJYFH72s/ldTjifr8x5mWavzBgjMFw5px8WR+XsC7c9tTrgEITiDT8eTbxSqYK
 ZYT3mskw1PZGmGJD9fIwYqjbcX8cGmQa5UQ/inHI+eO3q1duudstLtr/7ARYOlju+Hv6
 iuo9VmxPGBfUnnFFInULTy60m+Wfnm0KeiiLZqXJLPV55f7Hicg+pRREmfK1t4Xq64DR
 prOVXSKvyeh71m2JTZTj4tqYiFWJA38+uc+/f13rTtQIzr4j21ht/RYJWHOYDD5lVIWm
 JH3BRCt/D1NvjkdZntsBxzALEif9xftNlKwBUU5YxTbJHCqpuKBfdRSvQAztQvKIyuIY
 RKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QHZNMUbqaI7z38U63M9bCLV3uukNmXmqkLmOEuX7MWc=;
 b=lzaOKjO/pn8apw1znFizgCABxvpyrA9WN6TNU+3IQOdKZifKJy4BFVu19AjDOGfN3y
 fPI5qKJs6hteOYsItK4PAOXz2BWuBPJvp+pGSZFq71kDwcr9OtrVS9pQxTyO9Kno5k+o
 cPrlkF7Jzw0BdPslaRS5HyTkQsQdkj4RT5uYBCDhfE18LhUE9MqL5uIUygmj8hln0whP
 cpVhpoBMD3MGTzsbpvklf8vB9oxabGDRDxmo9YzzYjRs45FfjABULCu09x/Qs5Q9FJ+M
 rdECGh7ZssZFEkOOFqp2Bt5N38ryQ/RRMq2XA8Gyv/yx/q9CVbzOibaELibmw9FpUe1C
 9g2Q==
X-Gm-Message-State: AOAM530jC/JK5WFM6SPAnSfW6fjuPeJkt7swX5FnE+4Ksz4tc6Wen1Uj
 tgd8xebpGhYhkiV4muLzqymNWx7PwyCvloBa
X-Google-Smtp-Source: ABdhPJwoMq7pDy46OvHOSJF1sd8bpi8ppOtqA8rKHObRtotHy/O7flrUziSJ/F1uJEuYJ42skq+fPg==
X-Received: by 2002:adf:9d4b:: with SMTP id o11mr9448560wre.29.1631276816462; 
 Fri, 10 Sep 2021 05:26:56 -0700 (PDT)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id o7sm4012716wmc.46.2021.09.10.05.26.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 05:26:56 -0700 (PDT)
Subject: Re: [PATCH] tcg/arm: Fix tcg_out_vec_op function signature
To: "Jose R. Ziviani" <jziviani@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-trivial@nongnu.org
References: <20210908185338.7927-1-jziviani@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <244b78cb-10dc-330c-467d-bea655deb727@linaro.org>
Date: Fri, 10 Sep 2021 14:26:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210908185338.7927-1-jziviani@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.349,
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
X-List-Received-Date: Fri, 10 Sep 2021 12:28:58 -0000

On 9/8/21 8:53 PM, Jose R. Ziviani wrote:
> Commit 5e8892db93 fixed several function signatures but tcg_out_vec_op
> for arm is missing. It causes a build error on armv6 and armv7:
> 
> tcg-target.c.inc:2718:42: error: argument 5 of type 'const TCGArg *'
> {aka 'const unsigned int *'} declared as a pointer [-Werror=array-parameter=]
>     const TCGArg *args, const int *const_args)
>    ~~~~~~~~~~~~~~^~~~
> ../tcg/tcg.c:120:41: note: previously declared as an array 'const TCGArg[16]'
> {aka 'const unsigned int[16]'}
>     const TCGArg args[TCG_MAX_OP_ARGS],
>    ~~~~~~~~~~~~~~^~~~
> 
> Signed-off-by: Jose R. Ziviani<jziviani@suse.de>
> ---
>   tcg/arm/tcg-target.c.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Queued, thanks.


r~

