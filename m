Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q1WgH-0003Yl-Vx
	for mharc-qemu-trivial@gnu.org; Tue, 23 May 2023 14:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1WgF-0003V6-V8
 for qemu-trivial@nongnu.org; Tue, 23 May 2023 14:24:19 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1WgC-0003N6-Hq
 for qemu-trivial@nongnu.org; Tue, 23 May 2023 14:24:17 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-64d341bdedcso54443b3a.3
 for <qemu-trivial@nongnu.org>; Tue, 23 May 2023 11:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684866254; x=1687458254;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gEkEiwKXF87W3JueIwS9vdfESkQLyxDf/zSDK0AeXfA=;
 b=oB1YvjrnCH8XJp+754WQEbvE7btEE4Wwbt9S/u5Ghhq14gh1tI9XRiavvfG9iijXgK
 9duS/XmagwYQBGfZ0xk+BH/rmtERVWz94hdRmAHijadUKtLYjJigUQqx3yyT1NUtiiJP
 gOSCJK3tSSHP5MO0+Iz5cLtIAezwDdfp1c9aIh4vCEikx24oFcimI3ZZXntN0CQBAZYH
 NXSCoQD2xZzn7/mPYZ8VqNgt4Zz5pXediRHEVooNzXIr9MBp/21xSMnHW00CzvVp6sjQ
 aVhgHolLZ/ZS9BqLlWwDfAWsA6rVLmKt9CQ2FboWlq/NyD4a27Qy6FRtbJt/1UeHPswd
 kqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684866254; x=1687458254;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gEkEiwKXF87W3JueIwS9vdfESkQLyxDf/zSDK0AeXfA=;
 b=kOiWAtPvk8jr2Bi2C7+YXdjM1ayXa1DIM5LW+WBtiXxROJtjCIadp8OmW+qbdnOUoD
 ljoZql+g1p6hyKfoDjsvJLIttELMfKdT+ZQnFIvJe+pFpMTb67oJO8dfCNVI/jcYPYIg
 D6Wexk5pBQaAtyzW4Ofx0aU63mw/gXLa26qIcEXY+eaEDabWFpKyrj5ELrM9WMleH6xn
 /Ln6j9WgyPzVcnGKRiYXoDgMIlQuN8qRsHMLlEo7qR2SrriOqicCWWgrSgR2yPOP1Rye
 NMLmYE5oql1GMB9cRFXOJMV6r/3b8tvuPbZ5TpDD6gmdnuaIjVP5lDLq418ui/X9eWF4
 SC/A==
X-Gm-Message-State: AC+VfDz1RnbfM5hbF8uz9wIFjRunL+aN2iBvdUlK6hnEjZ2gZnIEzKKW
 3Yj6xrvppPl57vMS53y2e4QHcg==
X-Google-Smtp-Source: ACHHUZ6lc5Tw7YoIkbZeAbmMbupLpgeVMyIgZL2f2KDwSnGRaci5KvXbmh1OswC637xpdJGOW2lyNw==
X-Received: by 2002:a05:6a00:2e1a:b0:63d:641f:5048 with SMTP id
 fc26-20020a056a002e1a00b0063d641f5048mr20405103pfb.16.1684866254018; 
 Tue, 23 May 2023 11:24:14 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:c13a:d73:4f88:3654?
 ([2602:ae:1598:4c01:c13a:d73:4f88:3654])
 by smtp.gmail.com with ESMTPSA id
 d18-20020aa78152000000b0062e0c39977csm6042249pfn.139.2023.05.23.11.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 11:24:13 -0700 (PDT)
Message-ID: <955953fa-a34f-01fd-4493-9af9ea369fc2@linaro.org>
Date: Tue, 23 May 2023 11:24:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/4] hw/usb/hcd-ehci-pci: Simplify using
 DEVICE_GET_CLASS() macro
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230523061207.48818-1-philmd@linaro.org>
 <20230523061207.48818-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230523061207.48818-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-List-Received-Date: Tue, 23 May 2023 18:24:20 -0000

On 5/22/23 23:12, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/usb/hcd-ehci-pci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

