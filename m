Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kK8Gc-0004J1-Cu
	for mharc-qemu-trivial@gnu.org; Sun, 20 Sep 2020 18:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kK8Gb-0004HU-1p
 for qemu-trivial@nongnu.org; Sun, 20 Sep 2020 18:57:09 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:55261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kK8GZ-00045M-IZ
 for qemu-trivial@nongnu.org; Sun, 20 Sep 2020 18:57:08 -0400
Received: by mail-pj1-x1042.google.com with SMTP id mm21so6340842pjb.4
 for <qemu-trivial@nongnu.org>; Sun, 20 Sep 2020 15:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WPhv/+y1lMebbLO/INKHNsFXw0HSeKO2ZoFERWZb5GE=;
 b=Y+p9A659m9Jpku7QPPxBxVXKd4j+HDzjhqDC7hDeNJApk/6QLrSpGEV90xcqbgiuDm
 Q11/7wx7K6Mu1NVgsCqXvMb6H5C+YdHOvgkh9n7tfitR/SqJGZXcMBiInyRYIQiZVUgi
 zFpoBi9L+N0cohjawnbPrs9KNRzvFJYzmwQlwLVOwL9QtWTGjafZQr9CVrq5SBlG4MiQ
 dexpQttPPjk2Aykw4Xdw57+9oqffGu611qWolTW34Q/vYCo23jEykqN1OvTaGIpnRotr
 eJxW5FZWOZm/1RCxD9xRQjhAiKqkpyagX8ib7unJlrO9qGa1hkNWN4V58KvqCDK2Eia4
 m4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WPhv/+y1lMebbLO/INKHNsFXw0HSeKO2ZoFERWZb5GE=;
 b=N3fU3XXB7ir9DzgHRK5//yZ/IJSiYHu697Fdatq85cQIN2zwDvkSlzbCD2sFoS4nmy
 JlbJpbbvCbJ76Bz/+oDs/Owx5C02ze95qGlcSOv2XVh55TB7X6A4vk3sfTHO3DZ49dN8
 JjKxFzYMS8he44Lldmbw7t3qs4mSeGznFTUpCF9TKLgWaGzw05CMfsZGJb/jDMa+kgI2
 uAxRRnY8tBFsbBaBH9UU0l7ocekfZg3tozGL2IQEOOcg7Z1R0G8ajYiuoX1f5DYAqqiT
 kkPTNvimH5FJBwIZwf4TFoC9lhyEw0pg5OX/oCRPBLQH9fDhJUH3lSquOotNZ7m5hoOV
 YzYA==
X-Gm-Message-State: AOAM531gsUAx6q5sRp0473SZKTrw9/WQSaC6v+dvrg1nu2BTApoRVrF+
 e2m4hQ5fq7w8X1xzC3+BgOOjsQ==
X-Google-Smtp-Source: ABdhPJxgzIfYvxBUvFmvrV5FJ8wAZf1G+kCg36/wEVrCbVuPo8m4JpWwM67uIgTsjfY+2e7k4X4/Ng==
X-Received: by 2002:a17:90a:4005:: with SMTP id
 u5mr21422357pjc.7.1600642626211; 
 Sun, 20 Sep 2020 15:57:06 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id g23sm10086252pfh.133.2020.09.20.15.57.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Sep 2020 15:57:05 -0700 (PDT)
Subject: Re: [PATCH] timer: Fix timer_mod_anticipate() documentation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20200920155042.400737-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <41b6f742-ff73-65bd-f480-d32599316228@linaro.org>
Date: Sun, 20 Sep 2020 15:57:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200920155042.400737-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sun, 20 Sep 2020 22:57:09 -0000

On 9/20/20 8:50 AM, Philippe Mathieu-Daudé wrote:
> timer_mod_anticipate() will be scaled to the timer unit,
> which is not always nanosecond. Fix the documentation.
> 
> Fixes: add40e9777d ("timer: add timer_mod_anticipate*")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/qemu/timer.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


