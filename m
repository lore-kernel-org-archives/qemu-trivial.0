Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1swR2h-0004Ug-9u
	for mharc-qemu-trivial@gnu.org; Thu, 03 Oct 2024 14:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1swR2f-0004TW-UN
 for qemu-trivial@nongnu.org; Thu, 03 Oct 2024 14:59:14 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1swR2e-0003TJ-Gl
 for qemu-trivial@nongnu.org; Thu, 03 Oct 2024 14:59:13 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2e09ff2d890so1196937a91.0
 for <qemu-trivial@nongnu.org>; Thu, 03 Oct 2024 11:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727981950; x=1728586750; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/TvMjeS3E4TFlzpCcoVrD1vmCtyQ2aLQeiABCCCG8hI=;
 b=x3+6gPH5DHq49u2/kr4+bwjfN9yJJBYMkoNn6LjCU7BN7us49HM8lnmZLIDmzZ6YeG
 JH6TpzQXLjH7kR7J1bCzLdj1tmbGkcu9PfFqiPfldv/hUk4SxuITmkc2hpGI3zXO+lFN
 cKA8ZFUOnpP6mFD/PbQqRDnLrYBw1BwcKMbkqhbvNaNGPu7l/WHbaB3Cc4A5/ytsl0wr
 fybEbgsyMOZEWSwF/db8ieEedqrni0NC25pCoygBDadKE3BfRxhm0W2po+j7d1bZBHNy
 HqrAYnJjDpHhe/PvfmozwaibzWqEk9iTvTXJ1RaV61yHiT8bOgO6/qPbGZ7Dl0EjulWD
 j2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727981950; x=1728586750;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/TvMjeS3E4TFlzpCcoVrD1vmCtyQ2aLQeiABCCCG8hI=;
 b=COmdtFzk6XV3Z/PPyDuoeDFUHSVyvex/duZ8Ej+y21dJEMllE+Okjt+wcKgD55lCb0
 UAU9ABniEBi+H9tFuATsdITBTl3ePmsmXeW5oSjJvEJmkL6/YKp2ZUc+mAw5Jn/jXn49
 XHyTZH0CphRaGzbdEi3E8hhnYKsqjDcV75WFXEV9qv2UuepPcXtVI1msQd6H6KVDOGn6
 oN30iECpkomOOFHAWwuQW9QWYPzE6rvylHijaHj1C6LZbraQcpK2xqrIS3IVZObe5rjY
 3NuoB9zvpWGmC1dkYyQq5d4t7A1ylwLiqCCUFBnockrZZkiFUk6Ti5G0AGDCSOU0KZ1U
 r7GA==
X-Gm-Message-State: AOJu0YyF6UBExAFMijNogWU9czq+c57AvPksh6CAanRt9C7TlBCrvVbo
 xffqt6Pfy87xy5XF3TQH8ifb09AiQ6ERMwWDm+mtROxB1hitGUYC6N9cH7wsrRw=
X-Google-Smtp-Source: AGHT+IGYGFW3yFQAXiHklu6vSyeTrTYpdtlGEHAXZXwSmojdW1RIpBCP+RvrCXTQ8k6Dm4ZNu0uNhA==
X-Received: by 2002:a17:90a:39c7:b0:2e0:6c40:e389 with SMTP id
 98e67ed59e1d1-2e1e63650aamr89182a91.33.1727981950011; 
 Thu, 03 Oct 2024 11:59:10 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e18f541bbesm4196727a91.11.2024.10.03.11.59.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 11:59:09 -0700 (PDT)
Message-ID: <cc91f4b4-3d9d-42af-8c43-11b54abcaaf3@linaro.org>
Date: Thu, 3 Oct 2024 11:59:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/audio/virtio-snd: Remove unnecessary "exec/tswap.h"
 header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20240926102113.64890-1-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240926102113.64890-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 03 Oct 2024 18:59:14 -0000

On 9/26/24 03:21, Philippe Mathieu-Daudé wrote:
> We were including the "exec/tswap.h" header to get
> target_words_bigendian() declaration, but since commit a276ec8e26
> ("hw/audio/virtio-snd: Always use little endian audio format")
> removed this method call, we don't need this header anymore.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/audio/virtio-snd.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

