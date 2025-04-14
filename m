Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1u4NlM-0002ju-Qh
	for mharc-qemu-trivial@gnu.org; Mon, 14 Apr 2025 13:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u4NlE-0002j8-8F
 for qemu-trivial@nongnu.org; Mon, 14 Apr 2025 13:38:22 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u4Nl4-0000N5-IP
 for qemu-trivial@nongnu.org; Mon, 14 Apr 2025 13:38:16 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39c0e0bc733so3988685f8f.1
 for <qemu-trivial@nongnu.org>; Mon, 14 Apr 2025 10:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744652285; x=1745257085; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rUvpMz/wZkmDjLL+SoPmJyVaKdotCY03nMuxDIhiDKE=;
 b=IWfYiiOFXTTOwOL8HyocoAXrfFqYQbafykwcWiQXqX7VqI2twgO5bed7IF+cOWBTdp
 7jawF8+QkQduwrkvoa5UUVxj6KBS1OFnwYo7i493zCykIe54ff2RQDasv7goPfF3TR5t
 8iMJWnbJUAiSo7aewlwt6H1caSv2GvUWDzJVElkXTovqlHr+E9wqSj6hZCD6cDu0v1BG
 Tlw43ALzYM1o3IBb+a6nD5dunwNJNasRiTPN5StQUki8BwHY2UHgx0X9EJz59nbHeVl1
 MIZsxLTpjL0+IuHgJSWxifcO8mjJrJEsa3QlNgojdPiOMBKbe34rVi0ufcS77ASjROBP
 kL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744652285; x=1745257085;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rUvpMz/wZkmDjLL+SoPmJyVaKdotCY03nMuxDIhiDKE=;
 b=KqY4EuhYVHgyVXpS/TJP9Qw8RzX7cdyUuVuMaAYLiaT/MswseQC4qIkVCFzOGqBP0q
 0blIbnAmmgRwqaQadAnGDVVul91tKtbEqeLOsOzC1ItY3Nmjm1aJ93isglO8yz/kK6MY
 dc6dep5ff8D+2ep1YYSH9VWdlM9BARkkk2Np+eILX8gCM7J+Yk2WNsdFsgi8m5NIxDNu
 XtsJB3PfAQ9s1n/jfIQWT1HDisBEISHCii59M2LwPyUsnkO228iANzoCIFyEOINKLURV
 6rHYAoYMkAKqR5SpzpUeN9FQ16pIXhtdUBXis2iS7Mb1RSOADJcyWg6leGenfZdxz4eQ
 Q7fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqNN4rmBC/s9Re/rir9X43WLmGLS4z9hE8h0Kr4XoeybWfEkIyhviW7FmaycLYtAYGWTXhJ3fcalSqL6k=@nongnu.org
X-Gm-Message-State: AOJu0YyS5fK4OLvS/e76Cv6RiNiO27LsbT3rzquqPQUxTqVrmAUROCQq
 SoxtduHaCGuc7mb7hun/BJNdn2ZmFxT+qw24B/jcW4HnIaPTiIJfiBlFwD2mfoZLJdoiTZx0VyT
 u
X-Gm-Gg: ASbGncubQE+mo9MVGhN2yYAfxZIcPOApp3VqNQ1nUEGg7gFaTDz4JiUoK/AMr6fMyV7
 6h47U7ilJtGx8dZdyV0eVMbuqR3p3tPnAZeQFqpQ+ryFun+Bw0BnKFjlPc1YihfU2KuQElc6RjS
 RciNCqnqdB+MGBpR3jTxmD7gforAUjwfXQ4TMkEX9aoDz2FfIGBgpfU9gZDBUoR8Pcdh0Wz8p2K
 W2nqZ5/BtyWJ5UB0J6WFrnT8Ja+M0UwEW1ro5hiH64Nszadzbntxd1cyYjSLETr2zeeLcNt/puV
 4z+7BFmBsp5p9Og2LGOKA6acxKjx0vXCRNGaQRWxtz+vZJRQzjClzWmqQxSIMLOXrQSEo5ej53g
 Nl/mAi91u
X-Google-Smtp-Source: AGHT+IFRmTNwVO4CDBFt8mh63rPkqOxlP/YoS43YSpCGdbBBfbWqeIrHwxjpqmtRpaTXhNP+2+OIqw==
X-Received: by 2002:a5d:59a3:0:b0:390:e1e0:1300 with SMTP id
 ffacd0b85a97d-39eaaea4548mr10454339f8f.33.1744652284995; 
 Mon, 14 Apr 2025 10:38:04 -0700 (PDT)
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf43cd17sm11672174f8f.78.2025.04.14.10.38.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 10:38:04 -0700 (PDT)
Message-ID: <c566eed5-605f-4aeb-8841-dae4e591fcb3@linaro.org>
Date: Mon, 14 Apr 2025 19:38:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] target/riscv: fix endless translation loop on big
 endian systems
To: Ziqiao Kong <ziqiaokong@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, alistair.francis@wdc.com, 
 richard.henderson@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250414034626.3491489-1-ziqiaokong@gmail.com>
 <20250414034626.3491489-2-ziqiaokong@gmail.com>
 <3c9e1adc-eb4e-49f4-be32-b273a5a161b8@linaro.org>
 <CAM0BWNCVU3GNqAe-stRRYytqC2H7G2iC8Wmpe3sz0u4kkUpYDg@mail.gmail.com>
 <CAM0BWND3dr=_nZHXSoV2jzkXPXd=hViX6vM0cUMZ2Uru+TD6GQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAM0BWND3dr=_nZHXSoV2jzkXPXd=hViX6vM0cUMZ2Uru+TD6GQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-List-Received-Date: Mon, 14 Apr 2025 17:38:27 -0000

Hi,

On 14/4/25 18:59, Ziqiao Kong wrote:
> Hello Philippe,
> 
> Any further concern regarding this series? I certainly would like to investigate
> and help =).

Short term I can't keep looking because I'm busy with other stuffs and
tagged this patch for another review, because there is some endianness
code smell in get_physical_address(). I understand your change fixes
your issue, but I'm skeptical about it, in part because there are no
such use in the whole code base. My change suggestion is just a starting
point, more is needed.

> 
> Bests,
> Ziqiao
> 
> On Mon, Apr 14, 2025 at 7:17 PM Ziqiao Kong <ziqiaokong@gmail.com> wrote:
>>
>> On Mon, Apr 14, 2025 at 6:41 PM Philippe Mathieu-Daudé
>> <philmd@linaro.org> wrote:
>>>
>>> Hi,
>>>
>>> On 14/4/25 05:46, Ziqiao Kong wrote:
>>>> On big endian systems, pte and updated_pte hold big endian host data
>>>> while pte_pa points to little endian target data. This means the branch
>>>> at cpu_helper.c:1669 will be always satisfied and restart translation,
>>>> causing an endless translation loop.
>>>>
>>>
>>> Cc: qemu-stable@nongnu.org
>>> Fixes: 0c3e702aca7 ("RISC-V CPU Helpers")
>>>
>>>> Signed-off-by: Ziqiao Kong <ziqiaokong@gmail.com>
>>>> ---
>>>>    target/riscv/cpu_helper.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>>> index 6c4391d96b..bc146771c8 100644
>>>> --- a/target/riscv/cpu_helper.c
>>>> +++ b/target/riscv/cpu_helper.c
>>>> @@ -1662,9 +1662,9 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>>>>                target_ulong *pte_pa = qemu_map_ram_ptr(mr->ram_block, addr1);
>>>>                target_ulong old_pte;
>>>>                if (riscv_cpu_sxl(env) == MXL_RV32) {
>>>> -                old_pte = qatomic_cmpxchg((uint32_t *)pte_pa, pte, updated_pte);
>>>> +                old_pte = qatomic_cmpxchg((uint32_t *)pte_pa, cpu_to_le32(pte), cpu_to_le32(updated_pte));
>>>>                } else {
>>>> -                old_pte = qatomic_cmpxchg(pte_pa, pte, updated_pte);
>>>> +                old_pte = qatomic_cmpxchg(pte_pa, cpu_to_le64(pte), cpu_to_le64(updated_pte));
>>>>                }
>>>>                if (old_pte != pte) {
>>>>                    goto restart;
>>>
>>> If PTEs are always stored in LE order, maybe what we want is earlier:
>>>
>>> -- >8 --
>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>> index 619c76cc001..b6ac2800240 100644
>>> --- a/target/riscv/cpu_helper.c
>>> +++ b/target/riscv/cpu_helper.c
>>> @@ -1464,5 +1464,5 @@ static int get_physical_address(CPURISCVState
>>> *env, hwaddr *physical,
>>>            if (riscv_cpu_mxl(env) == MXL_RV32) {
>>> -            pte = address_space_ldl(cs->as, pte_addr, attrs, &res);
>>> +            pte = address_space_ldl_le(cs->as, pte_addr, attrs, &res);
>>>            } else {
>>> -            pte = address_space_ldq(cs->as, pte_addr, attrs, &res);
>>> +            pte = address_space_ldq_le(cs->as, pte_addr, attrs, &res);
>>
>> Unfortunately, this doesn't work in two ways:
>>
>> 1. Note pte is used in the following code and that means pte must hold
>> a correct value from the
>> view of host endian (in my case, big endian not little endian).
>> 2. address_space_ldq_le will dispatch to ldq_le_p, while
>> address_space_leq will dispatch to ldq_p.
>> However, on little endian targets, ldq_p is an alias of ldq_le_p so
>> making no effects.
>>
>> Per my testing, this patch doesn't have any effect indeed. To have a
>> brief view what is happening,
>> see the logs just before atomic_cmpxchg:
>>
>> pte_pa 0xf14000000000000 == pte 0x140f ? updated_pte 0x144f
>>
>>>            }
>>> ---


