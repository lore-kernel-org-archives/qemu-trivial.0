Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rZR3n-00047P-Tj
	for mharc-qemu-trivial@gnu.org; Mon, 12 Feb 2024 02:49:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZR3l-00047B-VF
 for qemu-trivial@nongnu.org; Mon, 12 Feb 2024 02:49:02 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZR3k-0004q6-FN
 for qemu-trivial@nongnu.org; Mon, 12 Feb 2024 02:49:01 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-55f279dca99so4124348a12.3
 for <qemu-trivial@nongnu.org>; Sun, 11 Feb 2024 23:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707724138; x=1708328938; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wQDKhwTfEXGghPsjlGwrqJ58pnK88T+nOwAAHbKGaU8=;
 b=ggyNTO8rWqmjTq8yATxRMl4N9EVzfKZkpCqBfApLMSUnI+2qFjAT/6c+mHM2qcMNoW
 z0sEH/dCj4ncO7JhXRxFhnZoJ69YQE/O/C7YGy/Rr5GWquOBMPz43N+mHnUYXv5cdHzS
 gTiGAt1JSEH67WBpUZekS8ozhXclqcVgO2kaOjDw3goh+szV9TbO1FBqFZOrT0rEZ4Ah
 La3aDWZs3qAjyhFALE/wP+o8AyiqYiyYr3BaIhEtpkKR4XraexS2ub2bHslhyTSnY2ZA
 YG9rACFZbqKgYP/LKO8JxrqyNxIl7RrU/QSFuEOgl052OWNcqyikWg77U7k9YbyUK7qq
 dP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707724138; x=1708328938;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wQDKhwTfEXGghPsjlGwrqJ58pnK88T+nOwAAHbKGaU8=;
 b=LPyVBTmaJfO30E4LQybZTFtKmzOVt9Lr+HJ78cV/gQH55RZhuY1FfoMDrWpgd6jWU7
 MQVXeL5jZXojgmsDG9wLKhI1q4ArlLgRTeTyoQ+AeJ6BTQfaigDENKwp5yqBzaihbWK1
 RXFeFHmNi+PY3R4xvB52bOyFXPw+XxD9s8ZGWdGzzBRAc11nZigYObrAjmKkFZpqpKU7
 GGwNQqFmq3b/GKcTnbh45cAxEHoVGfiA+EqFdSICkGfsCNW1KVSWmJY+xltazpEOifCD
 HybwUQtvcAgZz8brK8XPzZ5EPsQihVgpzPLN0nMJBtIQzpi3VmDAsfjNOgIw0OM+INyR
 ddow==
X-Gm-Message-State: AOJu0Yy+IQ29kgRlBCKgVaSRQvHtwp2aSpt+/hobqEeIV0AdSKNOD1cx
 JHs13dvXacv/VsgSTLc7hiZmjsPGEOtw2CeSJLdtUFNG0uROAIy4cl7FetrihKU=
X-Google-Smtp-Source: AGHT+IFY2nG9mdmQn311CCtFcaEeYtAodptyeR9YEHZHADLZLK9Xu4PNdDHBs0BxVo0l6NrTiX1HmA==
X-Received: by 2002:a17:906:1b03:b0:a3c:87e4:f021 with SMTP id
 o3-20020a1709061b0300b00a3c87e4f021mr1796248ejg.58.1707724138105; 
 Sun, 11 Feb 2024 23:48:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVFQ0w8dmNTSZcI5dbZTwgF7ce2jimiGngod2Xslzb/+M1wxEpVPv6de2t4bKYu/xwDuKjayQk3QU/1Bn3emn4EUscZJhOZX3HJ+XJlKek3vL9dJMT5S4yX4kLNE3SZIiilaHtmfShGQ44xJpWFfzFAiLvEIru4jROc4iBeQ2OZYBBOO+UWwcixhDRLy1TYPPVx5oVpf4VDO3DjkeMG6AF3/W58JXhKE58fw0aGH+c1AobbuRyimTKnbbr13Vk+5292iWQaZC7um8zpBS5cCbjGw35NO3c=
Received: from [192.168.69.100] (vau06-h02-176-184-43-97.dsl.sta.abo.bbox.fr.
 [176.184.43.97]) by smtp.gmail.com with ESMTPSA id
 hw13-20020a170907a0cd00b00a3820ec721csm3591960ejc.8.2024.02.11.23.48.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Feb 2024 23:48:57 -0800 (PST)
Message-ID: <319c11de-6e4b-4775-92ee-78c30daff12e@linaro.org>
Date: Mon, 12 Feb 2024 08:48:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/i386/kvm/ioapic: Replace magic '24' value by proper
 definition
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
References: <20240209190110.27413-1-philmd@linaro.org>
 <97f46e08-de06-42fc-9031-07e5eff4fbfb@tls.msk.ru>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <97f46e08-de06-42fc-9031-07e5eff4fbfb@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x531.google.com
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
X-List-Received-Date: Mon, 12 Feb 2024 07:49:02 -0000

On 10/2/24 09:54, Michael Tokarev wrote:
> 09.02.2024 22:01, Philippe Mathieu-Daudé:
>> Replace '24' -> KVM_IOAPIC_NUM_PINS.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/i386/kvm/ioapic.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/i386/kvm/ioapic.c b/hw/i386/kvm/ioapic.c
>> index 409d0c8c76..b96fe84eed 100644
>> --- a/hw/i386/kvm/ioapic.c
>> +++ b/hw/i386/kvm/ioapic.c
>> @@ -35,7 +35,7 @@ void kvm_pc_setup_irq_routing(bool pci_enabled)
>>           kvm_irqchip_add_irq_route(s, i, KVM_IRQCHIP_PIC_SLAVE, i - 8);
>>       }
>>       if (pci_enabled) {
>> -        for (i = 0; i < 24; ++i) {
>> +        for (i = 0; i < KVM_IOAPIC_NUM_PINS; ++i) {
>>               if (i == 0) {
>>                   kvm_irqchip_add_irq_route(s, i, KVM_IRQCHIP_IOAPIC, 2);
>>               } else if (i != 2) {
> 
> There seems to be some confusion here about
> KVM_IOAPIC_NUM_PINS vs IOAPIC_NUM_PINS (and
> vs ICH9_LPC_IOAPIC_NUM_PINS).

Well this is what I'm trying to clear, isn't it?

KVM irqchip has a hard limit. ICH9_LPC_IOAPIC_NUM_PINS is
specified in the ICH9 datasheet. It is unclear to me what
IOAPIC_NUM_PINS represents, I suppose it emerged from the
evolution of the Frankenstein PC machine to Q35.


