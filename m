Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rYTn3-0005cs-Ut
	for mharc-qemu-trivial@gnu.org; Fri, 09 Feb 2024 11:31:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rYTn2-0005cZ-Gj
 for qemu-trivial@nongnu.org; Fri, 09 Feb 2024 11:31:48 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rYTn0-0004Nz-Uw
 for qemu-trivial@nongnu.org; Fri, 09 Feb 2024 11:31:48 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-410489e1a63so9605825e9.3
 for <qemu-trivial@nongnu.org>; Fri, 09 Feb 2024 08:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707496305; x=1708101105; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CcOcXq/WM7lnYX2SnxhIY5A52vsg0Yfq3GzXmJ1TkLA=;
 b=QUD7lC9WJewhSgJcya+8opp8TNOrorcWYxq3sOuU9t88/T+9G7cPHse4TW5rpwLlrV
 Ul9k3b/zGwu4od4Crxx11dFtzLFpvZgqSZ7AmVIaWHQ7UjPCWE57FrmmqShpr4EnBWn6
 ZLZcgr/tHuB/l32qKlcjDswJd/zAA4FJz+nbm80AnbkRyLPqqqXM2TTVj+9kNOscq0d4
 frnNxFli5Cee41IzkyZ90Mln17ma6tk4PkExZjf/pn+NSkfsvxxxXgxdvJjBk0pPvb5A
 ZIgzwtcWTWpQN6goODYoMGM0QAvGhFrslWKOwgJrVrBG9npXqm5w64NYQUTgVYk/O7Is
 qEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707496305; x=1708101105;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CcOcXq/WM7lnYX2SnxhIY5A52vsg0Yfq3GzXmJ1TkLA=;
 b=IimW3eU5Db+gBaGMjqpgaHDggMWaUnZfgs/rhzV2bfnF3UUDgkVVeQQECqGRxlvFXD
 Cyh6pn/8AL099n/feF+g2/MPLnYgEeBk0SD4ng5TigsA2D4GjIkGxdTFOJKNhrzdm+ou
 AodVoJPBDVo+qUj/vB9t/TtDCWPaX9jEWjT8VTMArj9kPeyIch5IogQh1WwsEMn0YkKg
 b/cODS0KCe2rzLrMrwCZfc24xK0MTfPvk2b1h8gPrMY+nKlTIGkV43wb22PFqq+/5KNr
 jWqSutIcjrXq6FZ9RT6ECTpf7igmim63T0Js555DyGjmvl6ECw0kClzbgI3pWbadW0qs
 u2Rw==
X-Gm-Message-State: AOJu0YzEL6VrG0yqVw49PxQKVtirL69JCcAdIkbilEXpg1qxB82TLMCQ
 3WMmV9RRXg/eiNXlOhHjcvAhfTjl4ZCxk77CAF/BHATeWH6ETuybcqxU6bDfvcM=
X-Google-Smtp-Source: AGHT+IEFkpcY93yzEoAjdgBIvQI6/gEdD42oofaREwLASChZ8LpbQaX68XOvSmnjoAKFqZ3rECBL9g==
X-Received: by 2002:a05:600c:3ba6:b0:410:7635:4087 with SMTP id
 n38-20020a05600c3ba600b0041076354087mr1483779wms.6.1707496304854; 
 Fri, 09 Feb 2024 08:31:44 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWL0ajCgO5Hr4K+JcTXSilEBtthsf0Lj28KtJ0p+rrOAeqc/tUIpEqab3VeRRrBBRjdCL26vkG9idfp2ydbvLmBZcUBHY9uIrLAcVvdFRdEJE1fv//TTWpRqoLSn32K4zCJLAloChkJGQh2DdfglX/3kT1ouRiXa9uLvEKNdtO3btWQ6RR74I3NcXV3APggkYPA34H3ENtbG4tFYGkCwxr6aoPw4NGXCzPRTqQcYJ0fZGbdYE81VTfnBq2Qio/xi8XS5wgA+UF+DVze7X3hzCkoTOzUIg==
Received: from [192.168.69.100] ([176.176.147.207])
 by smtp.gmail.com with ESMTPSA id
 jr6-20020a05600c560600b0041079d336c7sm1078728wmb.39.2024.02.09.08.31.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Feb 2024 08:31:44 -0800 (PST)
Message-ID: <2e670901-685e-4ecb-80f7-fdaf18749b10@linaro.org>
Date: Fri, 9 Feb 2024 17:31:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] cpu-target: Include missing 'exec/memory.h' header
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-trivial@nongnu.org, "Dr. David Alan Gilbert" <dave@treblig.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@redhat.com>
References: <20240209150039.22211-1-philmd@linaro.org>
 <20240209150039.22211-2-philmd@linaro.org>
 <CAFEAcA82_L4tJTFB2OP795Yad1bTzgK0MzQNY41nGz5LEbkC6g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA82_L4tJTFB2OP795Yad1bTzgK0MzQNY41nGz5LEbkC6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-List-Received-Date: Fri, 09 Feb 2024 16:31:48 -0000

On 9/2/24 17:01, Peter Maydell wrote:
> On Fri, 9 Feb 2024 at 15:01, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Include "exec/memory.h" in order to avoid:
>>
>>    cpu-target.c:201:50: error: use of undeclared identifier 'TYPE_MEMORY_REGION'
>>        DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
>>                                                     ^
> 
> Given that we don't actually see this error, presumably
> we're implicitly dragging it in via some other include?

It is pulled in by the exec/cpu-all.h header which I'm trying to
sanitize (along with others). I'll add a note about this.

> Anyway, better to be explicit than implicit, so
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks!


