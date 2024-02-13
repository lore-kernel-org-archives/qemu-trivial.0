Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rZvCz-0000rM-CU
	for mharc-qemu-trivial@gnu.org; Tue, 13 Feb 2024 11:00:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZvCy-0000rE-FW
 for qemu-trivial@nongnu.org; Tue, 13 Feb 2024 11:00:32 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZvCw-0007Ry-Td
 for qemu-trivial@nongnu.org; Tue, 13 Feb 2024 11:00:32 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-411c93e1cd8so3670815e9.0
 for <qemu-trivial@nongnu.org>; Tue, 13 Feb 2024 08:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707840029; x=1708444829; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mu8vViIWUEygbMRgzg14BREK+eY/1nfzwFYTeAU/TNs=;
 b=HyNsfbGtll/NoxDIPCl+yBRu17csw6Px3VseaZOCbRuyB7Gj30L1GDh7plqAfdMGm/
 G5s9eXCcP2YkvH/F6GRZqq+hBPkRekQEErNnWKuQJ4lN0zOwyMnPP9KtxZmJ3OOUIMaG
 RttAaknYPJqkl7PQLwTpWXKPnUP2Pzbq+xZaroATqV/OXjZiCyytZCBBtsjK53/6T7Ul
 vJsrCtgVP4FzIY9YNw0ZMeEP/p5H7ijnJc5QFLUR9cGJApvRBObAU9U0LfkBa/bj5LgR
 o66uYNqlb8BeZKL4YIav+eKFTYNtrjVqgJmEqr4hvj7W1k3y1yD6Avi5JgBw+FAq+J+z
 gLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707840029; x=1708444829;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mu8vViIWUEygbMRgzg14BREK+eY/1nfzwFYTeAU/TNs=;
 b=QKtFpCD3PNMCR/1ebXWttj3U6vgZmIRkoBavZS9OzjhZSYL+uUvv7j5pGJjDN9ozDO
 421Ni07f/x5n5Gtf6kYTDZybJcfmyi776x4xX70a3SJNhY2bXoeEdgPsTjpfmbZ5YIAA
 /XHcvcduY/Zz+a9GqptNdrb+tJj71uU3sXf/jJ+6reWDtF6Rgp2UV8wP8knJMfZ4a4C4
 BK7+ooJQh21q/yj/SwnHDGA05wIeGYYcCEgbvqEgTyFtLQxxFm7M2MB8IqFZYPaTqZVS
 Do5nc6HL8EmM5NfhEB9Xi3yYPXU1YuGjQu+MF7S7RS6b00HwT1hZceT/YSy9DiiHSZ+a
 yw8g==
X-Gm-Message-State: AOJu0Yw0sOzOE/oQc5gA+qhhgrqRkSp1QzSrycsN6Mmlm9My1X+fSoXk
 WyiXpL16i6pzud6n94pD8LPRAg0/lEqSibEJIRZITsTV23P4NHUdZSFg6w9+dMk=
X-Google-Smtp-Source: AGHT+IGgT4E5/llJB1Kb2gyIaJJIKeiRUFIGQfh58Z4QxeFxaXa5+yq2txpwQ8+RkeYZGrRirro64Q==
X-Received: by 2002:a05:600c:1d1f:b0:410:e91d:fa6c with SMTP id
 l31-20020a05600c1d1f00b00410e91dfa6cmr2834277wms.2.1707840029225; 
 Tue, 13 Feb 2024 08:00:29 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVtcxhjGmbu6jtenvm7ZjEnJvxBW1x5Cjhjnl109YBkRfF4hTMOuCO7EPWKfaOtvKMJMTzvnIYkylDGvLx0/+82Gu4rHv2ix20MMKY1BgRLMiLJDot7y4UhyD6Gtzbit7YMHBKeIDCwnodyD+9Rctea090IybCUJAyyVvQ6Gre+Mmi0xL9OHgYex57kSQPjjlu9hx/R80VdlatA1Q2GT6ry6AO6lMy4p+Z4KYvX3W6V6XftuPJkPCNTkSEEt9KEa/h06HlXzGNjNOIhyVFySeULwfyeUDbrkjkjvfHijUFnO5lAY0a1skRb
Received: from [192.168.69.100] ([176.176.128.243])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a05600c4f0400b0040ecdd672fasm12217819wmq.13.2024.02.13.08.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 08:00:28 -0800 (PST)
Message-ID: <5e872a94-d4ab-4fe4-afe1-ffc952be8116@linaro.org>
Date: Tue, 13 Feb 2024 17:00:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] hw/i386: Cleanups around 'hw/i386/pc.h'
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-trivial@nongnu.org
References: <20240213120153.90930-1-philmd@linaro.org>
 <20240213105455-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240213105455-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-List-Received-Date: Tue, 13 Feb 2024 16:00:32 -0000

On 13/2/24 16:55, Michael S. Tsirkin wrote:
> On Tue, Feb 13, 2024 at 01:01:45PM +0100, Philippe Mathieu-Daudé wrote:
>> Trivial patches removing uses of "hw/i386/pc.h".
> 
> How did you test that it's indeed unused?

I put and #error in hw/i386/pc.h and built :)
(I'm trying to remove the PC dependency on generic devices.)

The few generic devices left are not as trivial.

>> Philippe Mathieu-Daudé (7):
>>    target/i386/monitor: Remove unused 'hw/i386/pc.h' header
>>    hw/timer: Move HPET_INTCAP definition to "hpet.h"
>>    hw/isa/lpc_ich9: Remove unused 'hw/i386/pc.h'
>>    hw/i386/acpi: Declare pc_madt_cpu_entry() in 'acpi-common.h'
>>    hw/i386/port92: Add missing 'hw/isa/isa.h' header
>>    hw/acpi/cpu_hotplug: Include 'pci_device.h' instead of 'pci.h'
>>    hw/acpi/cpu_hotplug: Include 'x86.h' instead of 'pc.h'
>>
>>   hw/i386/acpi-common.h   | 3 +++
>>   include/hw/i386/pc.h    | 6 ------
>>   include/hw/timer/hpet.h | 2 ++
>>   hw/acpi/cpu_hotplug.c   | 4 ++--
>>   hw/i386/acpi-common.c   | 1 -
>>   hw/i386/port92.c        | 1 +
>>   hw/isa/lpc_ich9.c       | 1 -
>>   hw/timer/hpet.c         | 1 -
>>   target/i386/monitor.c   | 1 -
>>   9 files changed, 8 insertions(+), 12 deletions(-)
>>
>> -- 
>> 2.41.0
> 


