Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rT36Y-0005zi-E1
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jan 2024 12:01:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rT36S-0005uZ-Ar
 for qemu-trivial@nongnu.org; Thu, 25 Jan 2024 12:01:25 -0500
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rT36Q-0003Ae-I6
 for qemu-trivial@nongnu.org; Thu, 25 Jan 2024 12:01:24 -0500
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2cf3ea86423so6864711fa.1
 for <qemu-trivial@nongnu.org>; Thu, 25 Jan 2024 09:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706202081; x=1706806881; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9CK4t70doxfJPBUBKGbJxqyjDutJr+2UWcMQoXHlIjo=;
 b=HuCwDm0z34ETCQet7+KwU2u6WRHd4YQuQKl24yPoQR+C0JoqDZT7COjf4EtH64ekxs
 Qb0dsjd+y0f79VdnNVB/top3KoGewo9WepagQoTa7IyLJ5YNUzUkLQf/DKkoPvyKZ82R
 XO8+3b94a7osXWCSHgA03lJSgx9cgckfbQntbxvZGG3ZXeF1qJb4TygnauWkbfumH8TR
 hFRHFtWQQA043DhE6W8BhsLmak/jvevrCNBEtqJi9Ixx9hPFg8kR6aF+fS1ow9gBWkhV
 jThA6WWlaPpYv+YTXxoYLFfSpW6I1fXafyrP4Qc8IuClj6yaRvJ2jEhUUB7nuNHl6+uf
 sTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706202081; x=1706806881;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9CK4t70doxfJPBUBKGbJxqyjDutJr+2UWcMQoXHlIjo=;
 b=mAqz/XLnVSHGTlDlm9lFgdNTOM3buM9oqGbygV2hSOCk5k2WDMUECWuR6EiKd/5PIv
 sxZeQ81kEtC86CQckfsmru3ANYeKNmAYXSG9iPmvEGp9KgW+zJAMm/iSFnDLrtqBnYdb
 FxkmeQJR6aCmX6YO9bf9Tzn0za7B6nv9vt6aMg5gRbfRZ6/HWKuDe69fi05nfm2xhbi9
 1Scaj/2EHt6QVfVj+uqrPAyIY3eoBfpvWLcpZVXGkjEyvoH6GOz7S+1ktOqqQwAnF3IQ
 /jjl47rTqTbAC4sqkRYIAgg//vHesLfYJDmiGkr4JF99OCXIOnez4x5qhhVs6M0v/IjB
 lVIw==
X-Gm-Message-State: AOJu0YyAf173lUfUhm1NK++IGjV2xBiw24SV+g33K2L065snnsAEPGQa
 zttDY4wb+/+ockVEUOClzuHkImRZ35xINFm/j/1gQ+cSTMPQXaCDCrUPTztwmHg=
X-Google-Smtp-Source: AGHT+IECyn34TCA5175CZoHRV6hNP1aWMo1z67LcJ2kUM6yGfipnnX++RPGPVjfP7SK7WEfktbpRSQ==
X-Received: by 2002:a2e:8858:0:b0:2cc:de09:ee92 with SMTP id
 z24-20020a2e8858000000b002ccde09ee92mr700759ljj.27.1706202080552; 
 Thu, 25 Jan 2024 09:01:20 -0800 (PST)
Received: from [192.168.69.100] (lec62-h02-176-184-19-125.dsl.sta.abo.bbox.fr.
 [176.184.19.125]) by smtp.gmail.com with ESMTPSA id
 l8-20020a5d5608000000b003392bcd6c48sm12913879wrv.79.2024.01.25.09.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 09:01:20 -0800 (PST)
Message-ID: <9b55e2aa-69c7-4d4e-908a-94c0488f2716@linaro.org>
Date: Thu, 25 Jan 2024 18:01:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] acpi: Clean up includes
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20240125163408.1595135-1-peter.maydell@linaro.org>
 <20240125163408.1595135-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240125163408.1595135-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x236.google.com
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
X-List-Received-Date: Thu, 25 Jan 2024 17:01:28 -0000

On 25/1/24 17:34, Peter Maydell wrote:
> This commit was created with scripts/clean-includes:
>   ./scripts/clean-includes --git acpi include/hw/*/*acpi.h hw/*/*acpi.c
> 
> All .c should include qemu/osdep.h first.  The script performs three
> related cleanups:
> 
> * Ensure .c files include qemu/osdep.h first.
> * Including it in a .h is redundant, since the .c  already includes
>    it.  Drop such inclusions.
> * Likewise, including headers qemu/osdep.h includes is redundant.
>    Drop these, too.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/nvram/fw_cfg_acpi.h  | 1 -
>   include/hw/virtio/virtio-acpi.h | 1 -
>   hw/nvram/fw_cfg-acpi.c          | 1 +
>   hw/virtio/virtio-acpi.c         | 1 +
>   4 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


