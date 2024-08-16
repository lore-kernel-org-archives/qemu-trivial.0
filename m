Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1seq7l-0002qE-VH
	for mharc-qemu-trivial@gnu.org; Fri, 16 Aug 2024 02:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1seq7g-0002nW-Vk
 for qemu-trivial@nongnu.org; Fri, 16 Aug 2024 02:07:41 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1seq7e-0002P2-Ln
 for qemu-trivial@nongnu.org; Fri, 16 Aug 2024 02:07:40 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5a156557026so1990197a12.2
 for <qemu-trivial@nongnu.org>; Thu, 15 Aug 2024 23:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723788457; x=1724393257; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ia6EoS/pQWC1dw280eGmttTlgXgRCOdoLo4NpzA3JYc=;
 b=k/5ZGQkZcImrpk1+4Y52A/38qNCiijRPYW5+ejfNb8zmoRQDTpFZmCDige2RrZ6qRE
 LonYsQOVCB8e3igOt+d/PReEEQy7htWjpjgHuTWsFs+E99Qm7Ttw7RswR1B6hOTiAYfX
 7NsPbc6uzPY+VnNcRmoqTLOHpTGP3RSHA2Mr4l1+0KxBzY/pJKgWyEUzu8NSPsSLdzex
 wznHn4HsRUtR33RKIRLalRb7gOn93cBF+veUgSj8YUzQwGorsFLVf2CuQP0Wkpca3Cn9
 21fg6EP+f4KAbXZFMIm07+LQ8Wg1FmJVdeeYXrBbqmBpsA5zlRjLxJ60dDwQJ8l6klw1
 Yl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723788457; x=1724393257;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ia6EoS/pQWC1dw280eGmttTlgXgRCOdoLo4NpzA3JYc=;
 b=SXRD1WY2YyW+uafAB/UaVPPVJMJOv93BkINvrxz2R73HEm2j2i2YRdkZaYGs9MsOq/
 8N6XxnEoD1gg1oBRaEGDYIwZp71BKtA1MrqD45ETWHTmpFjDbh8ZVYF1sS0rxB4s9aFs
 +DHuRGZWL9AhWfG2qRtPy7deGqsUvRFBanipeSUE60ZYgDcvkbWhIP1PhOCF5N9FCey4
 T8VVz+Dhf30f0nUY/Mv5HE7+4zcXnnkF+KGnJ4qy65Z6+EGOl+mKCfX3Gt742xsKYlZI
 4gbm+NzPxSFgwgw73P7TMYAN3OIDpXlyokgL8wei2c0DIPiMywbJ1jZQGoMFTNIXkV6p
 q6dg==
X-Gm-Message-State: AOJu0YzNezY9mAMbdAPxX0VeEt3k7N5Eh4bPhBrJnnI+XQpyAhRpGgBb
 B3maml3e+dnWEg0HaHu72r9Ap+7qLTQfNmwgIx4TdrgtJ37MnW1f3Zb8cjJQvtc=
X-Google-Smtp-Source: AGHT+IEqe2GCJDxHfY7CimAibElgcKjANogxf7tJsHiZQgN4+Ki9XqEDMIQQuK+H4X75bxaABcQytQ==
X-Received: by 2002:a17:907:944d:b0:a80:7c30:a836 with SMTP id
 a640c23a62f3a-a8392a4103amr121655966b.56.1723788456504; 
 Thu, 15 Aug 2024 23:07:36 -0700 (PDT)
Received: from [192.168.69.100] (cor91-h02-176-184-30-185.dsl.sta.abo.bbox.fr.
 [176.184.30.185]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a838396d5b3sm203495966b.215.2024.08.15.23.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 23:07:36 -0700 (PDT)
Message-ID: <db09223b-fba4-485e-953c-73f050273c5b@linaro.org>
Date: Fri, 16 Aug 2024 08:07:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1] hw/i386/pc: Warn about unsatisfied vmport deps
To: =?UTF-8?Q?Kamil_Szcz=C4=99k?= <kamil@szczek.dev>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Joelle van Dyne <j@getutm.app>, Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <vsm1ly2eX009LRKgURcMp6qTYHWw1bZd3zg2GUbd4M90T91QvJRdKxiRS3rPl8PR96y2r890Am3Ajf4kQrwihn7-7hKBU9VicRPPtIRv_GI=@szczek.dev>
 <e7c17260-41d7-4749-aca9-da344517c772@linaro.org>
 <ghPjnPAU8FvuVvcKbO9wNpQPgm4ZwkjL1j5Vh-voSnVI8EE4tCUKDqmBj7LGXv2cc7Yt7IWlMvnbvA-I6QxR7iS6xDyfIwvpuKtEMVbxHIo=@szczek.dev>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <ghPjnPAU8FvuVvcKbO9wNpQPgm4ZwkjL1j5Vh-voSnVI8EE4tCUKDqmBj7LGXv2cc7Yt7IWlMvnbvA-I6QxR7iS6xDyfIwvpuKtEMVbxHIo=@szczek.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x535.google.com
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
X-List-Received-Date: Fri, 16 Aug 2024 06:07:41 -0000

On 15/8/24 20:22, Kamil Szczęk wrote:
> Hi Philippe and sorry for the delay!
> 
> On Wednesday, August 14th, 2024 at 16:02, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> 
>>
>>
>> Hi Kamil,
>>
>> On 14/8/24 13:10, Kamil Szczęk wrote:
>>
>>> Since commit 4ccd5fe22feb95137d325f422016a6473541fe9f ('pc: add option
>>> to disable PS/2 mouse/keyboard'), the vmport will not be created unless
>>> the i8042 PS/2 controller is enabled. To not confuse users, let's add a
>>> warning if vmport was explicitly requested, but the i8042 controller is
>>> disabled. This also changes the behavior of vmport=auto to take i8042
>>> controller availability into account.
>>>
>>> Signed-off-by: Kamil Szczęk kamil@szczek.dev
>>> ---
>>> hw/i386/pc.c | 4 ++++
>>> hw/i386/pc_piix.c | 3 ++-
>>> hw/i386/pc_q35.c | 2 +-
>>> qemu-options.hx | 4 ++--
>>> 4 files changed, 9 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>>> index c74931d577..5bd8dd0350 100644
>>> --- a/hw/i386/pc.c
>>> +++ b/hw/i386/pc.c
>>> @@ -1100,6 +1100,10 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
>>> }
>>>
>>> if (!create_i8042) {
>>> + if (!no_vmport) {
>>> + warn_report("vmport requires the i8042 controller to be enabled");
>>
>>
>> Should we fail instead?
> 
> I think failing would be preferrable over a warning, but I opted for the latter to maintain backward compatibility in this specific configuration.
> 
> But now that I think about it, this explicit configuration (vmport=on,i8042=off) is probably very rare in the real world, if it is exercised at all. So failing may not be as big of a breaking change as I first thought.
> 
> If you're fine with introducing this "breaking" change, then I'm down for it too. Let me know if I should post v2.

Better fail early on incoherent config options rather than keep
going with a broken machine IMHO, so I'd rather a v2.


