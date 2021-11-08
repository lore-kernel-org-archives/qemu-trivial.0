Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mk6tJ-0008H0-Fd
	for mharc-qemu-trivial@gnu.org; Mon, 08 Nov 2021 10:49:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mk6tH-0008Gf-R2
 for qemu-trivial@nongnu.org; Mon, 08 Nov 2021 10:48:59 -0500
Received: from [2a00:1450:4864:20::435] (port=36725
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mk6tG-0008Gv-0r
 for qemu-trivial@nongnu.org; Mon, 08 Nov 2021 10:48:59 -0500
Received: by mail-wr1-x435.google.com with SMTP id s13so27710520wrb.3
 for <qemu-trivial@nongnu.org>; Mon, 08 Nov 2021 07:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hMTDcW0D7yNFGXUXrpduCEnVS95gV9fWvJu34D4Ey+U=;
 b=tkJq04geNdZFbYMF0tqZLgokWyRa/RYFfKo4hS0xtXNcbKM2G2Z3+X+SjZdyBOICwl
 QaXsPqhKmxkNNxH6V21qwA364BVA8zDkJHEpDonrEQPfLASN0wOkcejZqmfjpBlOTZHo
 dGg4LdpNtJ92tyefiN1BiIKYjPnUq+T8YWFM/cNc9c9E63n4AsRn/1ukdtx9f5UeKgYy
 Zf5MNQOfFWj95EX78z3JCGPnmK3+xSgTsM412e3wOsUt2X75Z3/9OMvxkqDnNK+5ON2a
 TwTbgxEw3mqWQbPXo7MZSyFNJAW2EUm/glUhsBe33iL2tPJ0HuOo0yxGXJrx5RnJgMnI
 bJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hMTDcW0D7yNFGXUXrpduCEnVS95gV9fWvJu34D4Ey+U=;
 b=Y/NQUwzy6wcs5f6jVAjc0c4JS0Ka8IPADSp4cGS05MT9dB1gKad6vnCyEYLsnQ1bSv
 nd8rkVkzaai7cXRWSQBI26fa8tOgY3+VhSyFF0j5BhyawOL9aSVXVq9udsK83KWSnJSY
 QivmcnphVvFA0O859TR8Ip2m0lgN2W4F4QjovUlcYlLVcZW6/VRTDbYQeAKxqG1I4kdy
 wGljQbu5jYr0isPsNuSMPJQq1w7DI8lv83hNQtEBUNlZr10PtJ4KXDgRUY9XBVRtIOV/
 lNSdAtQmkX9saOfP9blDDB11PWg94/YKYzd3+qyIGwXoaNXlFTvJLi5o+uSJhOVaaB4y
 M7/g==
X-Gm-Message-State: AOAM533TFcFJSwtcacSwM3nLBEBOuVUVqbj7LrhWPzIYJ1BY3OXLxaGU
 BSp970ThHsxXccGx17OthyVIy92UKvFKMszEC58=
X-Google-Smtp-Source: ABdhPJy3wAKt0KGqJSMotuKPBXK42F0Kd/dtaPckGERavtdQPfDjnJnz3EyS1HiEsyL3GeqvL+tO9g==
X-Received: by 2002:a05:6000:1c2:: with SMTP id
 t2mr107089wrx.378.1636386169467; 
 Mon, 08 Nov 2021 07:42:49 -0800 (PST)
Received: from [192.168.8.106] (173.red-95-126-185.staticip.rima-tde.net.
 [95.126.185.173])
 by smtp.gmail.com with ESMTPSA id a4sm15434385wmg.10.2021.11.08.07.42.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 07:42:49 -0800 (PST)
Subject: Re: [PATCH v5 34/37] bsd-user/arm/signal.c: arm set_mcontext
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Kyle Evans <kevans@freebsd.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, qemu-trivial@nongnu.org,
 Stacey Son <sson@FreeBSD.org>
References: <20211108035136.43687-1-imp@bsdimp.com>
 <20211108035136.43687-35-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f7c85323-ac00-f67f-f1d5-c02733ec8ad6@linaro.org>
Date: Mon, 8 Nov 2021 16:42:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211108035136.43687-35-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.06,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 08 Nov 2021 15:49:00 -0000

On 11/8/21 4:51 AM, Warner Losh wrote:
> +    env->regs[15] = tswap32(gr[TARGET_REG_PC] & ~mask);

Oops, one more buglet: the mask should be outside the tswap.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

