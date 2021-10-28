Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mg86u-0007od-Mk
	for mharc-qemu-trivial@gnu.org; Thu, 28 Oct 2021 12:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg86p-0007mF-5Y
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 12:18:32 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:42892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg86m-0000Pi-Ui
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 12:18:30 -0400
Received: by mail-pg1-x52c.google.com with SMTP id t7so6857643pgl.9
 for <qemu-trivial@nongnu.org>; Thu, 28 Oct 2021 09:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Bn9ZApLw5RmSOHXv+vS42sOOTg9U6Qd63aH3LyvgGT8=;
 b=z6tku0uKZNK5A5+9s139Gluk1FV9yDBTEiGkezggOXJkxpK/7HSxzelSheEVGvjiOv
 DgQnkpsJzIafeyYUPzzK4k6Wsk3/OMk7nLeW5ioupDY+ZmIMYvGQdSwAjHeCGkzEoF/e
 CXSDZ/lODyTd1UuYOei3uZ1EtpJemqjO+BDd6KoEwzZjKR8Um6N5y1hPh0LrGHEeTHsZ
 QttI/KhnRruhqIwURbD5VN354LuordvcFNpu/xPqROiiwNFLM/KGySsbX8BKA/0Jv0SQ
 5GEf5TCqDFvhXZkrmrwkJN1t5HyOPG5sgwe9ppc1VLfrnbpUcLPWteAtJUjk6V+rLmoV
 ijUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Bn9ZApLw5RmSOHXv+vS42sOOTg9U6Qd63aH3LyvgGT8=;
 b=70PHDqAM4UNqYM2uTIz7MqU07P3caeg7vYnmxSH5HzTjzsf+4nf74mpv5jLJrjRDAg
 8CdcqlVbs6w83eqJWRofHAt9Kk0TBmcMGTc9A5eeNhgqH8XB3bc7ljYETJ+FRKxOEmlG
 5NoLeqrlKHIlslfemugjkK0UNQiRxdM7DFgqKYsBFCmur9Na/0QcWr8fheT6eML7M2Nc
 TXVFML+RFW9UPPokYEzh/0r5xsv06/Su7EISNJFy9hzHSFjOfpUUx+RpJi7avlbCh5SX
 FcPlYc3R4HvpnsLCW/enuA2FayTPeEBe08TDXz06UG6zfx6Pp6qmYpHImDBOTRYRXj/5
 21GQ==
X-Gm-Message-State: AOAM532NADeFEbcj6K+hpkxpcLps9NrlzhyyiE7BSOZkVQw173hpOgpx
 byX/097et7jYkg0RQV6N33nwrQ==
X-Google-Smtp-Source: ABdhPJxOXaQUlwjvV6yR9y8+DLIBPaQ0Qq4P+KToqCqRK8W80LJj5qSN2+ZJQd25eSdr9qN6dlqHnQ==
X-Received: by 2002:a05:6a00:815:b0:44d:2193:f688 with SMTP id
 m21-20020a056a00081500b0044d2193f688mr5433133pfk.4.1635437907421; 
 Thu, 28 Oct 2021 09:18:27 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id m186sm3808081pfb.165.2021.10.28.09.18.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 09:18:26 -0700 (PDT)
Subject: Re: [PATCH 17/24] bsd-user/arm/target_arch_signal.h: arm specific
 signal registers and stack
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-18-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d1dc2f64-22bb-c29f-1fec-a9f44c0e295e@linaro.org>
Date: Thu, 28 Oct 2021 09:18:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-18-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
X-List-Received-Date: Thu, 28 Oct 2021 16:18:32 -0000

On 10/19/21 9:44 AM, Warner Losh wrote:
> +#define TARGET_INSN_SIZE    4       /* arm instruction size */

What is this for?  arm max insn size?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

