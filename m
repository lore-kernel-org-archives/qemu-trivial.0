Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPK19-0006xA-4x
	for mharc-qemu-trivial@gnu.org; Tue, 07 Feb 2023 04:11:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPK17-0006wd-HN
 for qemu-trivial@nongnu.org; Tue, 07 Feb 2023 04:11:57 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPK15-0000uz-VD
 for qemu-trivial@nongnu.org; Tue, 07 Feb 2023 04:11:57 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so12656415wma.1
 for <qemu-trivial@nongnu.org>; Tue, 07 Feb 2023 01:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nGS5IgUxdZ+ZK0wLP1tUg0c5mn3IDfjEE74WQcgUCOc=;
 b=yT8KxsI/RYFrmgMI/3gJ5w7QW3LJvuB4R4LtY9sdNwJvN+B/xbiOscF6zz/Rou83vf
 Zxcb3HgORALmMoml7Jhpvs/wUbbj2HSSErnoRpv7gNCTTf4gy0gBPyXNmbdulsOGkZq6
 7z0tK28dVTOGL7umU+9hylDGELVXxoV9fbyiTgsEImMlA/3qPeVsWWrxL3bETbQ067uX
 LGUq5nIj2cXinQM87NTlC0gea+fj718yZz3e/cv7dYW6dDe+sBcv8ZipisqPxfLsWf0U
 dAiSHSLMQTnGn4OWYNkj85CDcWhht6iKIqZI7dzhDkS7xBP7nY/MXuVRixFgisDnfCSv
 6R2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nGS5IgUxdZ+ZK0wLP1tUg0c5mn3IDfjEE74WQcgUCOc=;
 b=amLZjs9UP2B0hBGPCqeuxRKkxPVt/ilElSFobub3tkA68RjyYrLCMrEdEhxc0wWs0g
 7YmEbr6Y2CHuppg/FGY5qtD9JTFBiZ/vAAcnHR/7qZ2ORA0az5PI+r5Tkf7aKdNA9wQR
 YHOWRQNwGaF5ovARykthiMaphyK3VkKf8/Os0UIAMllb8fqnA7qHM5+m56BmgqOC90ur
 cOtEDQTFOOO8X41nrxIF7MeGVlGnDxgYr08WE0Thr4R/vMz3DkWlnYd/WSMg646Esfeu
 n+RAib3CFR4UjvggrP6JUasgQ2AaBPLgaA++TemOsumwMsFkohUM8F3mdmR5hW2gZCL/
 R7nw==
X-Gm-Message-State: AO0yUKUHh+/Bd0++5X62KHKhkl126pZFAy1xcd9olU8RsyPYzgYdZmQt
 JdyfNTW41rqecoxjajYCXw/e4w==
X-Google-Smtp-Source: AK7set8v0yYJmCgj9w292W2s6ZvaP9TC9HE+582rk562pnjI/4ZQBFYsuAoV017FiGkSCtFjGCFlFg==
X-Received: by 2002:a05:600c:706:b0:3dc:5ad1:583d with SMTP id
 i6-20020a05600c070600b003dc5ad1583dmr2340350wmn.18.1675761114234; 
 Tue, 07 Feb 2023 01:11:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r3-20020a05600c434300b003dc59081603sm12623771wme.48.2023.02.07.01.11.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 01:11:53 -0800 (PST)
Message-ID: <120f942f-a460-cc69-545e-f99fd033501e@linaro.org>
Date: Tue, 7 Feb 2023 10:11:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] MAINTAINERS: Cover RCU documentation
Content-Language: en-US
To: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-trivial@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
References: <20230119102620.5669-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119102620.5669-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-List-Received-Date: Tue, 07 Feb 2023 09:11:57 -0000

Ping?

On 19/1/23 11:26, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0fe50d01e3..73e9cb33f5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2812,6 +2812,8 @@ F: qapi/run-state.json
>   Read, Copy, Update (RCU)
>   M: Paolo Bonzini <pbonzini@redhat.com>
>   S: Maintained
> +F: docs/devel/lockcnt.txt
> +F: docs/devel/rcu.txt
>   F: include/qemu/rcu*.h
>   F: tests/unit/rcutorture.c
>   F: tests/unit/test-rcu-*.c


