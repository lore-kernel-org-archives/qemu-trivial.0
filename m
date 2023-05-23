Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q1TGg-0008Vk-Kn
	for mharc-qemu-trivial@gnu.org; Tue, 23 May 2023 10:45:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1TGO-0008Sg-IQ
 for qemu-trivial@nongnu.org; Tue, 23 May 2023 10:45:25 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1TGM-0008Rs-Fk
 for qemu-trivial@nongnu.org; Tue, 23 May 2023 10:45:24 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-25394160fd3so2897080a91.3
 for <qemu-trivial@nongnu.org>; Tue, 23 May 2023 07:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684853120; x=1687445120;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JFNp4xd579Hp5IAVfTBbHz1vK60Rg41sE8HnfvKdrTA=;
 b=Ebw2ZcJ29EBO6vMyZx1Y8PrZQ7jg4/N3SsAFWa4Pa/knYVaROMtgP9iIfvu1B9Kx/v
 QulJWmI4knByM+KnJS1h+K0t5gwpmxr0pnMNOZOQ/vh7DZ/VRImBHRqSIIbH+bkAIAgx
 hJZGUmrO0DYJ6imbhlKtuMHd2xYR/8Z6cik7wFWntbpvLad+x/UYBtvKz8RLwrvSsTn/
 eYRfk/cEwE17zY8Ua0jHi18UC40b4Gmh5GWBNu87ijesfjEpLBdtTSsGUaSJRfcpKN+D
 c4IhAdoFiitV+GaDSVsorlTwdgvoEjnVrmjTxg8euTDmZZ3OI9qsnuodW/4EqwgtAd1X
 bRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684853120; x=1687445120;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JFNp4xd579Hp5IAVfTBbHz1vK60Rg41sE8HnfvKdrTA=;
 b=AzH/wfZH0EEQ0/kVpJV4PKX7kfPRLlnp808noQBcvqUVTo8KGqX9Y8K3/Kxs3oR89f
 s2RLbsRO5OLNUuidQ5zk34grgSYBk0IK94HFMpe1eV5vSAaaRDoFmNLMWf4+yrzEvJ+9
 ETLY64mBGSOEP59MKDLk/TRALJQ/atDQPFNJU1jbl3gnzB6Zu6puYovQ6z1umWD6tOQn
 v/u+wqXE2LqFt9Ko4nJ3tn/OWkPiy//8tWmr02pO/F3Z86nWzPl1tSZG2abYFT+V0SwY
 8whsBZQIzAuifKFgzwfTXVfCDaNW5LUTf9ZmA4uazXRVAcDeFkQmnE8QbUdiu27Hqi7F
 5mHw==
X-Gm-Message-State: AC+VfDxplLBS5x9xzQ63ojasa5GPIENOjBC3aZcSPodwV1safmNSg2lH
 OY9xlfjS4+Eie+52wPp0JJuu1A==
X-Google-Smtp-Source: ACHHUZ6apRlMjgtcJX3oA/KQrWR1d0MmkvymN03996JN5QrlIcvKQyeWY+7c9ZzQSCjDDMdqvFbHMw==
X-Received: by 2002:a17:90a:d384:b0:255:54ce:c3a9 with SMTP id
 q4-20020a17090ad38400b0025554cec3a9mr7974915pju.24.1684853119881; 
 Tue, 23 May 2023 07:45:19 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:c13a:d73:4f88:3654?
 ([2602:ae:1598:4c01:c13a:d73:4f88:3654])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a17090ad90e00b00247601ce2aesm7609404pjv.20.2023.05.23.07.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 07:45:19 -0700 (PDT)
Message-ID: <959c1456-0a4c-6fc4-b878-e856fbf52927@linaro.org>
Date: Tue, 23 May 2023 07:45:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] hw/ppc/openpic: Do not open-code ROUND_UP() macro
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-trivial@nongnu.org
References: <20230523061546.49031-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230523061546.49031-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Tue, 23 May 2023 14:45:26 -0000

On 5/22/23 23:15, Philippe Mathieu-Daudé wrote:
> While reviewing, the ROUND_UP() macro is easier to figure out.
> Besides, the comment confirms we want to round up here.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/ppc/openpic.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

