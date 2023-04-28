Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1psjU8-0002x9-34
	for mharc-qemu-trivial@gnu.org; Sat, 29 Apr 2023 08:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psjU1-0002vX-2F
 for qemu-trivial@nongnu.org; Sat, 29 Apr 2023 08:15:21 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psjTp-0004Ql-To
 for qemu-trivial@nongnu.org; Sat, 29 Apr 2023 08:15:20 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f1950f5676so6667125e9.3
 for <qemu-trivial@nongnu.org>; Sat, 29 Apr 2023 05:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682770508; x=1685362508;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nlT1ljjJB8LGWdP0GxfksUDvVBSxenIPVUR0meqd4C8=;
 b=cfM36Ls7TbOTK6+gPK76b4xJHNNGaEJIQO29c0576s1CoGgTAYz0GQNf2dlVleYnMF
 Xzs3oOA3+xMVRVrE7zCtlsMfDA+TArnvPJbpKm230LrgWd7sKr69FBPI9J0oIiygImma
 Nv2rz9K4pwtZ3YlT2FI/vShiiK2syw9ViTrwL0pYlONMNgqmVs2dpYpHALZ472p7CeXe
 0V8qHQ2uDdkjGymkDC8vEWOtZDuB1Iz2hwFYkIkwRlyDB+TEt6+kmH9/zeVYFIMyy4J2
 EMzxws0cx+0PTq7wBwpMDM5FbTM46yikQwAnkm8wYTnIA49Sv/3ZItDFbqPH1W9Hrn3F
 TF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682770508; x=1685362508;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nlT1ljjJB8LGWdP0GxfksUDvVBSxenIPVUR0meqd4C8=;
 b=SXGxKSrJ5/6qL8bsnTpnqdvyROZYwgeeskoLKKaR8zIrNNc1qygUg8MbsZFtZ0GKur
 f9O9PA40hpJHSY2mXw82J8Y+YRu3sKM33wNMMx7hgkithG1jCDqMfePzcqB1ENHRSicB
 kuaDeHnuXQamJcKbQFWhllOd95EG6MfmkvQm7tAi0K+YEyuIFI69hQlPZhtr7fvoq/fj
 Ut6ukYFRWZAvJmn8Bky8WUfgxsNihkINi9+fAC1gtsRHx1xAu3umGDNVRQHXvSVb3k79
 TQMWSqI/asFfO2XkgpMAGVe4oRRmjqDtM7DFw5UEOBgrQ2XRL8BVnd1L5DQk6u0t/JoN
 4JGQ==
X-Gm-Message-State: AC+VfDwEXRz9EGua+Anm5JPexe6fzK8kXe2vqrOubqi4hZtMO4Q8kw8R
 CvAw2dyCiE43qD7rV0NZbMthZw==
X-Google-Smtp-Source: ACHHUZ7PCcrF5x1816q3pIPR3rkjBpWnlL4iPzvomJG1rGadbJ9VEh3u1Vn34kCrw0U/sZBQbhxnfw==
X-Received: by 2002:a05:600c:364f:b0:3f3:1cb7:b2a6 with SMTP id
 y15-20020a05600c364f00b003f31cb7b2a6mr5141365wmq.6.1682770508571; 
 Sat, 29 Apr 2023 05:15:08 -0700 (PDT)
Received: from [192.168.212.175] (7.red-88-29-166.dynamicip.rima-tde.net.
 [88.29.166.7]) by smtp.gmail.com with ESMTPSA id
 ip29-20020a05600ca69d00b003f1712b1402sm30430249wmb.30.2023.04.29.05.15.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Apr 2023 05:15:08 -0700 (PDT)
Message-ID: <e2952421-d46e-d6f8-e502-c7fb9af9649d@linaro.org>
Date: Sat, 29 Apr 2023 00:12:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] hw/remote: Fix vfu_cfg trace offset format
Content-Language: en-US
To: Mattias Nissler <mnissler@rivosinc.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20230426093518.966397-1-mnissler@rivosinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230426093518.966397-1-mnissler@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-List-Received-Date: Sat, 29 Apr 2023 12:15:21 -0000

On 26/4/23 11:35, Mattias Nissler wrote:
> The printed offset value is prefixed with 0x, but was actually printed
> in decimal. To spare others the confusion, adjust the format specifier
> to hexadecimal.
> 
> Signed-off-by: Mattias Nissler <mnissler@rivosinc.com>
> ---
>   hw/remote/trace-events | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


