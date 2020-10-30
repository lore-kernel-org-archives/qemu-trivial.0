Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kYNJb-0000YY-O3
	for mharc-qemu-trivial@gnu.org; Fri, 30 Oct 2020 01:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kYNJb-0000YN-1l
 for qemu-trivial@nongnu.org; Fri, 30 Oct 2020 01:51:07 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:43236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kYNJW-0002Y4-Ud
 for qemu-trivial@nongnu.org; Fri, 30 Oct 2020 01:51:06 -0400
Received: by mail-pf1-x442.google.com with SMTP id a200so4305055pfa.10
 for <qemu-trivial@nongnu.org>; Thu, 29 Oct 2020 22:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O7acSnAlvapnus1R91XjuiTGjEbPamfaAD1/OSk1Q9I=;
 b=TRa/SZrP90DcoxkI/qxIFj1hoTGe6lC5M4rKmDPI6+cD+haiqGt9F/zftL/RUl0aTz
 gCjdkaWsVzK8bNrBPN2BlcPH06wHuWYn1vbMqYBIzfa3ENdn901qJ6SAej1DnBBsYoQQ
 dGYcfpoH7evMyQaRkIeAKzvGPk+ufmcsWoFvlCP3+3JA+Pcx8Erp0je9Kq5CiP8VcH0m
 V0KSRaYegdzW0e5VIyHXVcgo/IG9c9ulQCCtxikuShfnfIeTN1BoFIAKPAsuSWuDvYc3
 at7lPdZ3VW2TLMmNyj+sMJpv4qu60SAcgvkaiw2k9vjvq7m1Ogf7Mpk889v4QjMrSElz
 Fp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O7acSnAlvapnus1R91XjuiTGjEbPamfaAD1/OSk1Q9I=;
 b=tGKP5vvd4ohoAms+5X7rnKAhuhdYqIxf8wYuJ2rcwVn4fajoWTqASFG6i4UejS4bDS
 Eyx2DJBy0AyntD6cXpl0qlPMw0TS09un9Kr4Sp34SWic9quvGtc/HzuLZzyz18frJR5g
 T+ui/M9aJbkY5iA96l/0+Ksd3ov2fwzxWDdySfEBtCKtagwEN6+JrmFs+EiJAaIvpYaW
 En2oklcasJ0ufNh746d7vJGY3YicmVBgfduPsuaqDCc6yKnCoCWj+OuUTy+3cHoAA6xd
 gPEtj9Sl6BashUP4aG5NV+89ASF6GoaqWgVMJPgP2H/wynjNI1sXYiQSjf6ZEFYIKxS8
 CZkA==
X-Gm-Message-State: AOAM5305dD4p6DF/PmHrSL2UzBS+5y742ZXDAtVdWehGlNowwEBnbcau
 HMBug6L/ExV7rz4bceypmcTV1w==
X-Google-Smtp-Source: ABdhPJymNL8adJGANOnn96YyLpPChvi5Bn1qdNhgZvT3GjqqChJcMqbAMxmiZ7iDyQ8x6GHSIoYs1Q==
X-Received: by 2002:a65:52cb:: with SMTP id z11mr782893pgp.368.1604037061261; 
 Thu, 29 Oct 2020 22:51:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 11sm4353133pgd.24.2020.10.29.22.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 22:51:00 -0700 (PDT)
Subject: Re: [PATCH v2 3/8] accel/tcg/user-exec: silence the compiler warnings
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: zhang.zhanghailiang@huawei.com, ganqixin@huawei.com,
 Euler Robot <euler.robot@huawei.com>, Thomas Huth <thuth@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>, Paolo Bonzini <pbonzini@redhat.com>
References: <20201030004046.2191790-1-kuhn.chenqun@huawei.com>
 <20201030004046.2191790-4-kuhn.chenqun@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <84c34163-d177-be21-ef7d-85f5428e3c0e@linaro.org>
Date: Thu, 29 Oct 2020 22:50:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201030004046.2191790-4-kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.261,
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
X-List-Received-Date: Fri, 30 Oct 2020 05:51:07 -0000

On 10/29/20 5:40 PM, Chen Qun wrote:
> When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed warning:
> ../accel/tcg/user-exec.c: In function ‘handle_cpu_signal’:
> ../accel/tcg/user-exec.c:169:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
>   169 |             cpu_exit_tb_from_sighandler(cpu, old_set);
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../accel/tcg/user-exec.c:172:9: note: here
>   172 |         default:
> 
> Mark the cpu_exit_tb_from_sighandler() function with QEMU_NORETURN to fix it.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> v1->v2: Add QEMU_NORETURN to cpu_exit_tb_from_sighandler() function
> to avoid the compiler warnings(Base on Thomas's and Richard's comments).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

