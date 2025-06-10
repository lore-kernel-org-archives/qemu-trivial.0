Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uOt2z-000384-VV
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2025 03:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uOt2y-00034V-0r
 for qemu-trivial@nongnu.org; Tue, 10 Jun 2025 03:05:24 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uOt2w-0006yj-7q
 for qemu-trivial@nongnu.org; Tue, 10 Jun 2025 03:05:23 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so58191105e9.2
 for <qemu-trivial@nongnu.org>; Tue, 10 Jun 2025 00:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749539118; x=1750143918; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Qwi5zD90ua7r0XuvSZMui8k7d4Wo/UtozOgA/82tYJE=;
 b=nbQ0whJDC8VA7FoS9KuczekrbpLFeJeJ96porgBjPn6gjAUnKTpRgZHWb1SG1DxN3h
 B8RGK3TdAgqfkCTGD/cTjJ7mgSgzcxxWasHgkJo2Hgsa6wuVW2u8UDZZCiIKivKXJLN5
 jym1liRHZoIwK2mhbvYUaAypD/8TSuSzAKA+z8hHWE1sCZd1nqBdWXRScSZaoLjqxH4M
 YQ6S/PLj/R56V/TrJRx6Mtl3G0+SbdHNEWmOqREn0aqNHR5OAJAQBI2OUidmPZiUge48
 uCKDlW6k6DhAJ9kiJgd2tpWoGO0FkFlE4TJTYz2bUZ9bSdTsMcWgBUgj/dsuO27cLgqJ
 bbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749539118; x=1750143918;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qwi5zD90ua7r0XuvSZMui8k7d4Wo/UtozOgA/82tYJE=;
 b=Io3vgEh/e99KJOdNiXQsEiogNMJwlQRzgkL8PmKiP/SZ2Vivknm1ihbweACVpiNPXP
 nxAY0lZsgAzgTIpegEA18JQebHjSi9QsJ6b3ClnwHEs33xHLNKq8VfL8SbqDSPhPnW8D
 twK1sNjDWl6HizQW0fD/oTGkoai/l0v/R9baJf6PQ3RVjOEuhJuJ5RqUB+8qLhyC1ENf
 dlhbGumSu03IH68Y502L9HnhMWxd9Mqw7oxVVkpDtQnN+b6spJjvTnlb8VMPX40jLYcu
 umLQxX17ZQdC3sJWH4Kd4L/wZmNQmhEOXVvbUmIZ8ZtywZ8HBaPSlC333LSusfhfn+kl
 zTyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPZHi75s3wnv04O7Q82EAE6iD5i+aQJlOVxbMXS7NLEcX7eMLkfIMuQfPdBeWQemKvRFcqtsUy0h/r3HY=@nongnu.org
X-Gm-Message-State: AOJu0YzNZcNk0P9mn01lDGVpgGCOu3mYtID+z0XsO/P53ML3Dns8oLjr
 hIeIfdY2usHSSsPGniShjY6AGSLaNfQpmtCmT1T5d/MyQAaqrxb6I1WyufiqTjN2VjzDITuTp0e
 +pacWvow=
X-Gm-Gg: ASbGncvDGSKBrpXT1qun84SlEVan0vq3c8nW5McCueDo7KtE0CqTvOdXVBqmaNAmDNx
 lbswO3bjwKJNcfaLiBGvwFW7E10ubBgpsZEDUf8Rj9jyj4CTQ9Usy1QxZHb34mF6ydqX6kuffis
 eKKILza4rcrkq2IuF/ksKai34G/NdY8GNoq48DJoGxXpLk84HO4n6ppmj7a7VwdqZowNcPxuVBU
 QO4pReuPUOGesMNtnowCUp1YUJq2E34ZsZ0YoPBxaG4L7Ts+B2dy6YVsKE+/4v0y62KTBt2NnJZ
 0GuiaZLKdmwruEcDbfVDELJxPnLOJdXQcf9Lk6Os+YPMZvgn1ZzbVZbjF44sRsd1uNy3MNHncmN
 QnK+GdFjSrDGsuJOXVj5lP9GOxpLbIA==
X-Google-Smtp-Source: AGHT+IEto2qXhJyWLVDpKaTqzJhHFTQgYfsZg/8uNhXf+TxcEna0sIr9yM6QpTEl+XG7SYbO8UlaeA==
X-Received: by 2002:a05:600c:314a:b0:450:cfe1:a827 with SMTP id
 5b1f17b1804b1-4530bba5129mr79549475e9.31.1749539118591; 
 Tue, 10 Jun 2025 00:05:18 -0700 (PDT)
Received: from [192.168.69.138] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-452730c7761sm127510465e9.32.2025.06.10.00.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 00:05:18 -0700 (PDT)
Message-ID: <73e6a82d-6293-45f7-9a64-743f3601cd5d@linaro.org>
Date: Tue, 10 Jun 2025 09:05:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: trivial patch qemu
To: philmb3487 <philmb3487@proton.me>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <HnyjTNqwrfGusE44bnM7kuLuj13Di1VgXN-dXVHMOSnfgCUhoipOVIoVS1WQaKrJxmEDy9XJGdlQj6zVTIdJE0QVlfBhfbcckFFWRRP56uY=@proton.me>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <HnyjTNqwrfGusE44bnM7kuLuj13Di1VgXN-dXVHMOSnfgCUhoipOVIoVS1WQaKrJxmEDy9XJGdlQj6zVTIdJE0QVlfBhfbcckFFWRRP56uY=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 10 Jun 2025 07:05:24 -0000

On 7/6/25 08:51, philmb3487 via wrote:
> The tracing function for the write case incorrectly has parameters 
> switched around. So order them in the correct way.
> 
> Signed-off-by: Philippe Michaud-Boudreault <philmb3487@proton.me>
> 
> 
> 
> --- a/hw/misc/stm32_rcc.c
> +++ b/hw/misc/stm32_rcc.c
> @@ -60,7 +60,7 @@static void stm32_rcc_write(void *opaque, hwaddr addr,
>      uint32_t value = val64;
>      uint32_t prev_value, new_value, irq_offset;
> 
> -    trace_stm32_rcc_write(value, addr);
> +    trace_stm32_rcc_write(addr, value);

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

and queued, thanks!

