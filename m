Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1s6TxM-0004xj-Bc
	for mharc-qemu-trivial@gnu.org; Mon, 13 May 2024 07:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s6TxL-0004wt-5g
 for qemu-trivial@nongnu.org; Mon, 13 May 2024 07:34:59 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s6TxH-0001CQ-NZ
 for qemu-trivial@nongnu.org; Mon, 13 May 2024 07:34:58 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-420180b59b7so4555385e9.0
 for <qemu-trivial@nongnu.org>; Mon, 13 May 2024 04:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715600094; x=1716204894; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BOCXMR+sUnm584+BeT6hLb+0XVs7wIrrfxrIxNK5p8E=;
 b=T0Rn1ihtZBkru0HnKR2e3S1hMJ7zoVvpH6ItmHTzAf62nCfbWJtHuUOWTUzv6b+lq4
 GG8xZyx9gfItD3bi+bvGib1KZK6BtcfvpMYGnBTpk/5ZhthHjXecgQfgGTULuwQXM6BQ
 lXjH3yrp7Q9Z6BCIw5QbXtqc0XG8Ijc9kNPyuUvANaWWJo8F2eOPZK07RWas0TwXpKat
 55NIva+gkY5axOw4AeUMyageNHmZuPsV4tFMzF7un/bU/NYJGrMmovq7Wh27N4Ty3Ja3
 XOnkTP1vZNbAhqLC3p0miIrhVMdyLVfW1RhJbukj5c5BjR134ucgaV5KZCPlO5N66Nk8
 agGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715600094; x=1716204894;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BOCXMR+sUnm584+BeT6hLb+0XVs7wIrrfxrIxNK5p8E=;
 b=FaDCuUr9YOHWDSdMK1Lv42ji8HM9sTPXoDts5L8/mFPHVMkbnFowqyHoIap51sYNav
 WjlpEPEC93vnCj3mDTib8fyZ1vDcXUGRsf/lqIX/byZBsua7nSRk0SXe+97GvQUZvqjm
 bdCjvnOnBro4ablJH11gOUSj7Gwyu2u+Lf2hlhD1JEHs0VMtf7xNS3XcFZl6jXQya/Vy
 wDvKLPzrgD71q/InQT23Q7NroSAgSVEnL05BAnOl87dM/vUQWcW8xc/zGQiCakHEOuQF
 qRX93wpuu44sO8vRClC5ysIfmaO/KAiBwtw7GMbFXUoOKhuhX0xl95T7qrXsXR/LzbsU
 xxoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWstboj8U9+iJWrjIyRa+ZjVCgtaqq+UWIVhiXGFubvE+Ay6M4dSLwg6/dEiiMAIoUL+qybETI1SRQxrNUNUrrnXCaJO7J0Ww==
X-Gm-Message-State: AOJu0Yy9/HSOv6S60EtMwg8qk5yapCKjXMkpBHlE0+yl1tlypXGGQ4BB
 7Y5G411QFtUHvawqD5XKHrdvI3zP+Nv7888rAWE1IQkpqsdAEYUeAIwEKYiVOis=
X-Google-Smtp-Source: AGHT+IGO3rt9cn5nAoLhskFs68xGslGfcmRGI0g7uakJhqfwwG4qvuviv9morgjNyFYpGO4QrHhIwQ==
X-Received: by 2002:a05:600c:1d13:b0:41e:1bc1:36de with SMTP id
 5b1f17b1804b1-41feac59cb4mr72622325e9.26.1715600093896; 
 Mon, 13 May 2024 04:34:53 -0700 (PDT)
Received: from [10.1.2.72] ([149.14.240.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502bbbbe43sm10856350f8f.99.2024.05.13.04.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 May 2024 04:34:53 -0700 (PDT)
Message-ID: <55a9cc05-7f64-4ebe-b552-aae3c67e1f5d@linaro.org>
Date: Mon, 13 May 2024 13:34:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] hw/watchdog/wdt_imx2: Remove redundant assignment
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Cc: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev
 <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org
References: <20240513101108.5237-1-shentey@gmail.com>
 <20240513101108.5237-4-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240513101108.5237-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-List-Received-Date: Mon, 13 May 2024 11:34:59 -0000

On 13/5/24 12:11, Bernhard Beschow wrote:
> The same statement is executed unconditionally right before the if statement.
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> 
> ---
> 
> The duplicate line may indicate a bug. I'm not familiar with the code, so this
> patch may go into the wrong direction. Please check!

The bug might be in imx2_wdt_write() where the WRSR register is
overwritten, shouldn't we OR the SFTW bit, keeping other (such
TOUT) set?

     if (!(value & IMX2_WDT_WCR_SRS)) {
         s->wrsr = IMX2_WDT_WRSR_SFTW;
     }

> ---
>   hw/watchdog/wdt_imx2.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/watchdog/wdt_imx2.c b/hw/watchdog/wdt_imx2.c
> index 6452fc4721..f9a7ea287f 100644
> --- a/hw/watchdog/wdt_imx2.c
> +++ b/hw/watchdog/wdt_imx2.c
> @@ -39,7 +39,6 @@ static void imx2_wdt_expired(void *opaque)
>   
>       /* Perform watchdog action if watchdog is enabled */
>       if (s->wcr & IMX2_WDT_WCR_WDE) {
> -        s->wrsr = IMX2_WDT_WRSR_TOUT;
>           watchdog_perform_action();
>       }
>   }


