Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1myNY7-0008Kr-17
	for mharc-qemu-trivial@gnu.org; Fri, 17 Dec 2021 19:26:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myNY5-0008HJ-87
 for qemu-trivial@nongnu.org; Fri, 17 Dec 2021 19:26:05 -0500
Received: from [2607:f8b0:4864:20::1033] (port=46048
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myNY2-0001sE-Fa
 for qemu-trivial@nongnu.org; Fri, 17 Dec 2021 19:26:04 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 f18-20020a17090aa79200b001ad9cb23022so4311833pjq.4
 for <qemu-trivial@nongnu.org>; Fri, 17 Dec 2021 16:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9XaoY57Bakazh3mpFDlmbbKBlyth54Ta68NudjCioSA=;
 b=Cxful1nfSPkvs4xoidQ5CynvOyDx/Ri8ZjsJRhAhWDkkr+fsTao1/PTzR1+BhnyuS8
 lruHMitLzDGHD41QRfE7yPSVdVx4jWEYlBuF4ErApBg2E7CFOmKEHCN2lWzNS2tqoIVt
 r0bfZRTHA0fv4kYhy78zTAKJbuGtHYAWLEScUO4j2vgV62ToH4O4ZOy+ty3847eEztXX
 HWn8W5+ASSymDcEXfzWM27YLfooQPI1BI0yNVujJkJ0VygEHwv/YehH5W+FHvSiox5+V
 fcEHwgDpY3KkfdCAfnWGyHqaHkgSaw+g08JzzlUBGBi+sZEmu+VztY/MiIHVN5uKgRfa
 khIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9XaoY57Bakazh3mpFDlmbbKBlyth54Ta68NudjCioSA=;
 b=L7rVHczFYxoXyXXjff9xSe/8bwCG0nYiWZ2Do/d8G195KFyq3qPHxN9lxjyUfbsKK9
 aZlmqIlWYAkL9atblpyD9Qxwn1MmE740hrblkcNUHAIZJEXFxpSdqiRnnDO9ENhLnvah
 hNz6Lc0WVlRx3/4sH8WY5EHSb8UhXYSWCZVDgaLIY+eh5p4LKT1+xkPkP5Jv54SWz3O0
 6rEDdDUmhMMGqvrnXIuZ4sO+mMocVCfnJgyV67ehyhPUcIGuaBsWHR8i25yQyOQeXqj1
 qKAV+IjVtPsZtOZuSkuvKSMNXktblLtHylOit5ZQygd3A860NIzmV8StVKazBuLrWvs4
 mPTg==
X-Gm-Message-State: AOAM531eiENJqabMu+PUc+GC65shDC/pbHv3Z+E8DPd7GBiGG0VpUP1p
 juS4BlBJ8ZKNDfUaeHVZUEKDAw==
X-Google-Smtp-Source: ABdhPJwU9RtrXJElV7oiTkHT1fzpXO0sa9I3PYtdtF2eLmaKjKMmaKioKQ+/BRn3NdukiM+OFstRJA==
X-Received: by 2002:a17:903:2445:b0:148:a2f7:9d54 with SMTP id
 l5-20020a170903244500b00148a2f79d54mr5770489pls.115.1639787160953; 
 Fri, 17 Dec 2021 16:26:00 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id l13sm3982210pfc.1.2021.12.17.16.26.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 16:26:00 -0800 (PST)
Subject: Re: [PATCH-for-7.0] hw/net/rocker: Remove unused definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>
References: <20211116193915.2792721-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <751a7c63-e942-76bd-8213-ee44bebfa2f9@linaro.org>
Date: Fri, 17 Dec 2021 16:25:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211116193915.2792721-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sat, 18 Dec 2021 00:26:05 -0000

On 11/16/21 11:39 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/net/rocker/rocker.h | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/hw/net/rocker/rocker.h b/hw/net/rocker/rocker.h
> index 412fa44d017..d22bbd2bf80 100644
> --- a/hw/net/rocker/rocker.h
> +++ b/hw/net/rocker/rocker.h
> @@ -36,13 +36,8 @@ static inline GCC_FMT_ATTR(1, 2) int DPRINTF(const char *fmt, ...)
>   }
>   #endif
>   
> -#define __le16 uint16_t
> -#define __le32 uint32_t
> -#define __le64 uint64_t
> -
>   #define __be16 uint16_t
>   #define __be32 uint32_t
> -#define __be64 uint64_t

Surely the __beN defines should go away as well.
If they're still used, that seems like a bug itself.


r~

