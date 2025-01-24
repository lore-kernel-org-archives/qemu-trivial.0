Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tbMQv-000569-J1
	for mharc-qemu-trivial@gnu.org; Fri, 24 Jan 2025 11:21:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tbMQs-00050h-Mu
 for qemu-trivial@nongnu.org; Fri, 24 Jan 2025 11:21:23 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tbMQr-0004dt-0I
 for qemu-trivial@nongnu.org; Fri, 24 Jan 2025 11:21:22 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-436a03197b2so15807345e9.2
 for <qemu-trivial@nongnu.org>; Fri, 24 Jan 2025 08:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737735679; x=1738340479; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=J8L9e8RjJX6AUipajI0Gu0rivtd/9VW5/OrxI9Ba11s=;
 b=tCHp+YTaXNeoAAJCfVo605kCh7PdPuotVAWkMU460iSRGBcL1AbS+VkjNtEWB3Ywv6
 FGm9+RCZHoX6TYVhyvayWxq9DmMxbIXZImbxO2vOQ4YZorteid0O9/J5e4fybHVX7W7z
 SFfkoCP6MA3EI+BJf9/KqJiZmOraNoXvvnkKHeGiZ28KkMX9B1qSePdT6DZ6G7/7Weyt
 eHH76BhE/yAhWasXDupzLN1fsC1X6ZrLnj95i/Qwa4HO0gL6e3b3R3ym5cPRv9UkpB3y
 IyUrk4v7zrLLXzmhKF4QUpgrQDE6QoVPmCPtgmp9Lk/SRa8RwCKouk9eKfajal3B6X0j
 fAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737735679; x=1738340479;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J8L9e8RjJX6AUipajI0Gu0rivtd/9VW5/OrxI9Ba11s=;
 b=MI5d+EYmTEmBJ0uY701PPQBTzadvxcksO/jqU4ABfV98NOeo/8jErK1CArMV+jsPuN
 dhY/6Lh307KU5SQB9GHHlxeh8HYor2szsEq4lcM2YxDAYz8db786iqC9P6w/i8Lc99rp
 w3Tit81HZ+LRNSyC0yZRyIsdkEDGnEN0CA54dquFDxa1x9jyQrFea7iJzNGpe8cY2ruH
 ra4gb67YSl2PXfdfwJheW8XXv9+hvAeWyCh4ofrFPyHdZ2pbgTNS8EqnjTL1mQ9BuMei
 adgvipfWu6lJzIPh6dhagcKgrE8w9rw5eYIY+bMZ27nZYvU6FwPYMbI2vm3/840S3raF
 piVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGgZbWMfExKelmewQedQ/UwTeWc3yxk2sfd5/ouT3clEZgRZDh7zZhhQGH3CoCguTN9Qh1knFe9hOPjNs=@nongnu.org
X-Gm-Message-State: AOJu0YxVTZDGv4cxtY7LrIH20+j9VCCy2e/fzjVV3DSpLibgr5R6p1Q8
 MYDS9kcONs3tOBKbw3/UlfrgLiscQrYN8sXkfVQQDFxBoRtJMymdaICZhQKPCqI=
X-Gm-Gg: ASbGnctWnHdKRTSylFhIOuLArdZYHilu4MkZ/0aBYQvwhejxUf7u9mnE/tWvlaHFIRK
 94uT0E6qJB2piOXRSohNk4UN7ZRqVQWoxtWV4YA9vAf4MW4cVcPQt7V3JY7u60y55pBcGvc0MCt
 9ZBiwJpGvr9s5CQ4lq3B9eiS4iFG0zAV94OEPJ50R6ys6RXG4yQpa5IGfNDnD4CVRkics7guk30
 E0G45VEesQoZi52YI8Smo0j1F/WEsvj6Y9niJ5siNmbkpERrxsM0vyd/1CbvI1D2IRU/hQjqa/t
 wDj6EP+Sx91CHORkRHPNiBnYzRV4yWkKDpIwXJe+ypFRdEIpksO64DEo63U=
X-Google-Smtp-Source: AGHT+IGyVC9FLT40iF6gLFUBaCR2/EJz7t2UZTjgJwiiTjIrcvcsn5mOFuQFo/rKqHxjcJ2rlFMLrw==
X-Received: by 2002:a5d:5986:0:b0:38a:a083:9200 with SMTP id
 ffacd0b85a97d-38bf59eb93dmr32850349f8f.44.1737735678723; 
 Fri, 24 Jan 2025 08:21:18 -0800 (PST)
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bb040sm3126357f8f.67.2025.01.24.08.21.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 08:21:18 -0800 (PST)
Message-ID: <ae127f4d-e244-42e2-8103-95cd1eea2efe@linaro.org>
Date: Fri, 24 Jan 2025 17:21:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hw/usb/hcd-ehci: Fix debug printf format string
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20250124124713.64F8C4E6031@zero.eik.bme.hu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250124124713.64F8C4E6031@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 24 Jan 2025 16:21:23 -0000

On 24/1/25 13:47, BALATON Zoltan wrote:
> The variable is uint64_t so needs %PRIu64 instead of %d.
> 
> Fixes: 3ae7eb88c47 ("ehci: fix overflow in frame timer code")
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v3: Fixed commit message to match what the patch actually does
> 
>   hw/usb/hcd-ehci.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

and queued, thanks!



