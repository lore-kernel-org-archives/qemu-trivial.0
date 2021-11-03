Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi72M-0006GI-QI
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 23:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi72L-0006Ec-HA
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 23:34:05 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:39821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi72K-0006bW-35
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 23:34:05 -0400
Received: by mail-qk1-x729.google.com with SMTP id bk22so1079802qkb.6
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 20:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UlN3wmW3ATJyufAG+pglFq+NXiV4lMV5IucOlkJQx/E=;
 b=zS2KsyQGpzPafo6Rtkkd4L/Z++JeOSRNF0/IShXQaxSZWJpInEYO9igbhSUb4b/2Oo
 XQFSjEbjPUYFbv/WUgxXniVBTs0pvv7q0CLLaidtLngT4rXzGFxlYalZ29+aas6/+Fmo
 06N7XUBjwU5Ua1Et+ehG9rS6XsStrPadlK8bS2Jz/FJ6qhJWyHNrMVJQ+iCyTFFiAqvn
 UAx6tYpLTAF4krIfpltb112LGVeeAsBGeAVCcTyE78nzEuJC/RuPwXI/AXt41MFFwFri
 /48otjLldvolBKWIqUfhOfKinVHKgwrgNspbUw/CoznFbP5eT7E/T6Tq3CZDkbTn3QIz
 rEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UlN3wmW3ATJyufAG+pglFq+NXiV4lMV5IucOlkJQx/E=;
 b=mNUliIKOF4JcE/9RAK7iGC0HOAyI2ws6KcwXtLtgAythv662wxpmSEcCVxYCC+HlcY
 K2BINN1oSSvkYiIWtzq4kvo4E69S/hWHRAy3X4MQgNT1qRRN9Om4YN7AGFj5ZawsQIuG
 a3z0tlxjiBGG5Fe08JJrTbk9loBySDMGeX5f8R+0JwyTJdEiUd3PgkXU0utK6oGkJoc0
 PiHzO0hVfMSVcNEhsOT23uqM9JH1UN1vyPPJiJ+FonZkCkfweqYwFxZ2mrr+jawPBPai
 98HXul3dInSozUlpOJ1WIFZVz2gdNS3NldKhOx30BLKe1rclCgXpQ3Ju02g0enS0bjLI
 Vf6g==
X-Gm-Message-State: AOAM533yq1CIMmCQzEspViOOxrClHIBldG+k//2zEDHVGBeAdfPdtFW1
 Rz9zsjOFKOwliCwQ4nB1n8cS4pJXrUgl9g==
X-Google-Smtp-Source: ABdhPJz4FfByGj1+sS/S4FtZwiyOrUDEaQ9B6M5DmF8WEo93fM2O7j9IRlVvk87lHRHkO7R/tXIoBQ==
X-Received: by 2002:a05:620a:9d3:: with SMTP id
 y19mr33258509qky.412.1635910442744; 
 Tue, 02 Nov 2021 20:34:02 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t22sm758982qta.36.2021.11.02.20.34.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 20:34:02 -0700 (PDT)
Subject: Re: [PATCH v2 21/30] bsd-user/arm/target_arch_signal.h: arm user
 context and trapframe for signals
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Kyle Evans <kevans@freebsd.org>,
 Laurent Vivier <laurent@vivier.eu>, Stacey Son <sson@FreeBSD.org>
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-22-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8e05eb58-20ed-2dfb-a35b-e98aa7606b37@linaro.org>
Date: Tue, 2 Nov 2021 23:34:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102225248.52999-22-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 03 Nov 2021 03:34:05 -0000

On 11/2/21 6:52 PM, Warner Losh wrote:
> Arm specific user context structures for signal handling and the closely
> related trap frame.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_signal.h | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

