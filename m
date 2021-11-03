Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi78q-0006H1-NH
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 23:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi78o-0006FI-N5
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 23:40:46 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:41923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi78i-0001LK-Vs
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 23:40:42 -0400
Received: by mail-qv1-xf32.google.com with SMTP id gh1so1421230qvb.8
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 20:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GbcXgax21uIToPanZooyhjKp/J4OykhPPKyraM0P2sM=;
 b=KgrZ0vXx08ML4IfpIbAqTmaXYPJQqyWtfDgY7fLhtexVOreKNZLlQeRbKrYXWnUQZj
 Tdiif2CHLuvRSzk/z2wAw6e9hivnRaPTuYgXCgXA4iXr/xg442hmgFGPqJlsuNb2t3zL
 DebASP6gWzPfRTNKVbpc8/k8A8bCfZ57mkme8cwVsaJ2eU0eYAK7F+Ibhtt04Rn4mOe+
 m4ChutPwkJDdnZuGwUUigL1FhqlZN4nOsT++y2TuI7gxH7SzLgSVPHYWEXf7ffVdRlbK
 nC5LvqkUwyoRMw4LDRTKzHNPGxbWGY2NHThh4PUjGZA6SgEn6Wn+XwqZq0JeAF53FU2i
 lPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GbcXgax21uIToPanZooyhjKp/J4OykhPPKyraM0P2sM=;
 b=spYIFBMpvDRWA0f7QbNbW349OQIqNObr+x83UzK0cl4MMaqhA/K7xGIG2pRuJSW3Uv
 bhHjlkGbogHp+SQxWJLacKU/k82HREXdia0Sso84lDLlIM2Ug+MDQHEIheEhMJHVmGIb
 MkxAZrbSounNjWNAEswdPdMHjkvazzzzMPkv3NzMOiRKeNtJUgWSoLds1KyZbfbGVlu7
 WeHSAmNFD8cVvD/fi0dFno105uS8z63u/SDVFn0TegJo+fcPYTHhxz0D8a69DPaxi0e+
 KIDCM5A7FyTqrAarBoBwkqcqdoYjhNf7MZ6Of0E1LnaycBIsd0lGtVlQDdt1QlKD5Nz4
 ZhZQ==
X-Gm-Message-State: AOAM533QAaYcYgZHQspTw0z293/UMwkqJxe0K7Jqo0M7eON/4si7bGWC
 MmCsYYp6dhPD81kHN+i2n5Rs5A==
X-Google-Smtp-Source: ABdhPJwlX2WnQJ9KjMllE9tWx29AVlWmLcGxKomYd3x8rbd716KJBWpuVLFVgvaIQR5NHlIDfiPpdg==
X-Received: by 2002:a05:622a:346:: with SMTP id
 r6mr43215249qtw.0.1635910839956; 
 Tue, 02 Nov 2021 20:40:39 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id f7sm681365qkp.107.2021.11.02.20.40.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 20:40:39 -0700 (PDT)
Subject: Re: [PATCH v2 24/30] bsd-user/arm/target_arch_signal.h: arm
 set_mcontext
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Kyle Evans <kevans@freebsd.org>,
 Laurent Vivier <laurent@vivier.eu>, Stacey Son <sson@FreeBSD.org>
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-25-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d4673836-df0b-064d-50e5-2f301a7bf1f1@linaro.org>
Date: Tue, 2 Nov 2021 23:40:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102225248.52999-25-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf32.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
X-List-Received-Date: Wed, 03 Nov 2021 03:40:46 -0000

On 11/2/21 6:52 PM, Warner Losh wrote:
> +    env->regs[15] = tswap32(gr[TARGET_REG_PC]);

This will be able to crash qemu with an odd pc in thumb mode.
You'd have to artificially create this mcontext of course.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

