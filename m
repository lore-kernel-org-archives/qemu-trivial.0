Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rSOFZ-0008VH-7I
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jan 2024 16:24:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rSOFN-0008UH-Ml
 for qemu-trivial@nongnu.org; Tue, 23 Jan 2024 16:23:54 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rSOFI-0006hw-Ao
 for qemu-trivial@nongnu.org; Tue, 23 Jan 2024 16:23:52 -0500
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6dbb003be79so4169866b3a.0
 for <qemu-trivial@nongnu.org>; Tue, 23 Jan 2024 13:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706045027; x=1706649827; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LKS8HF1IzMzN3IpYc7t40qCt+rc8/FF/9zQ1oVgE2IA=;
 b=SwinIda5s8rC16zi7wOsos8i6Ovtuoia4IKhRNGs9DYATUQIdxJOPeMYDecd93XnZg
 1sve77LFp8pfAJyJFKGQjCbjUdST9aCSbBGfAaPiN3pL02Rye+EBteAVT2pT16tvkhu2
 wB+jRFYsocuZP43bbc+ND2TvoYJtJ5XAd2sj2p0xvpRWULNaDw4c3y4gJFIrI7qktZeQ
 WXGCE3kPFBviON0sCOjyEQk9jPrRNGk+PURj0Z+67Towh36P8rWBbBbypR9VuqYdZJ60
 Xh95M3w5NYe1+cvW/fTXVjcvaeHLjgScgh83zOZ0gwoEvRUECy6aI4AVxHKPvCWOyp1o
 d0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706045027; x=1706649827;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LKS8HF1IzMzN3IpYc7t40qCt+rc8/FF/9zQ1oVgE2IA=;
 b=eVgKjr1qw5htQSx/BtGgMI+6ppbWOAO21wG7nC/YbRL0bll907PpLjRSlPtlI+OYTW
 LXQMSspHL8REl2UYkJkZVhiBi//4QHNHZmJJDYaYjDfWAfDldsk108W3G+MWEdMtPALL
 SpBKqzgZyAmz2loHTT3sp0+kbyltohINDDLec9uJyGeiXYEgnDcEaQZKEq23if5YTS4R
 aiPg9fKL1b6CnuzO65L+HK0pB9fRGWr5wy3J7N4uhcUbO9L6QLp5JqViKMH8rD6YCXqK
 XRaTfgSju7dJEMnyNaD2n9HBfEXmVYELAzFpJdYvZt6O9GKCv0QWmdGbdB/RVzWoevbU
 v3Dw==
X-Gm-Message-State: AOJu0YzJntaFy4D0ystal84MCHOTpRZe3g2LozudlThHikWCUBLEZLkj
 OICX3Npj2RzfInyC9Dh5LlVOCr8ht1SFABev/RmFP1l5qU9jFstrWEAnbpNW7I0=
X-Google-Smtp-Source: AGHT+IHRpx2kfw3LdTM25czFKiI2D+s+k/dVh32cWNDu47aUhvl+YXx+YCT5hXbr0OloOfujVmlgOQ==
X-Received: by 2002:a05:6a20:9f4f:b0:19b:46c7:c986 with SMTP id
 ml15-20020a056a209f4f00b0019b46c7c986mr304935pzb.16.1706045026709; 
 Tue, 23 Jan 2024 13:23:46 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:dd1:291f:3c3c:2485?
 (2001-44b8-2176-c800-0dd1-291f-3c3c-2485.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:dd1:291f:3c3c:2485])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a63cd0f000000b005ce6b79ab6asm10655125pgg.82.2024.01.23.13.23.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 13:23:46 -0800 (PST)
Message-ID: <1ba077ad-6959-4edd-b08a-24c5145c1c54@linaro.org>
Date: Wed, 24 Jan 2024 07:23:39 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] util/uri: Simplify the code, remove unused
 functions
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org,
 qemu-block@nongnu.org
References: <20240123182247.432642-1-thuth@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240123182247.432642-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
X-List-Received-Date: Tue, 23 Jan 2024 21:23:56 -0000

On 1/24/24 04:22, Thomas Huth wrote:
> Thomas Huth (4):
>    util/uri: Remove uri_string_unescape()
>    util/uri: Remove unused functions uri_resolve() and
>      uri_resolve_relative()
>    util/uri: Remove the uri_string_escape() function
>    util/uri: Remove unused macros ISA_RESERVED() and ISA_GEN_DELIM()

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

