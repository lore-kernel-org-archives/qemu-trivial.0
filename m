Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sHgw9-0002l6-5H
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jun 2024 05:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sHgw7-0002kc-F2
 for qemu-trivial@nongnu.org; Thu, 13 Jun 2024 05:40:03 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sHgw5-0008W5-Sf
 for qemu-trivial@nongnu.org; Thu, 13 Jun 2024 05:40:03 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52c525257feso1048080e87.1
 for <qemu-trivial@nongnu.org>; Thu, 13 Jun 2024 02:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718271600; x=1718876400; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3aOunvMosKHTQ3tcT30IqrnVLnm+2Svo2x15/onrgnI=;
 b=YZrZ0W9geiHLvEKN5KgyRSjDk9YUXa+8NB0etF1TzdGy67g5XKPAgP5B4AYxj+HhJM
 Ynj+BUctMkefNjL77aHTjQD3FRkqUWsBAB1gxKxOKYZNHPjmRgS8I4SCfn3/WvvdJyQj
 uxh28deXbel0B/mzLJxCk//NPZhUwMR0Ug5pexiC33bF8D6EqSA0wpB4959TLnvlyTJa
 xOvuErHKCxYnmpFHyr2CYQK6wnepLnWgm85x5TjlZ1lv6YyX7Nk1b4ci+oFRf+b+LQS0
 pDG4PvozA1JTlyB7dk19B3FcViBOiXE8/NcG56+S8fmVZKJzgrg6Z3YHTzfKVVznSwjf
 dL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718271600; x=1718876400;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3aOunvMosKHTQ3tcT30IqrnVLnm+2Svo2x15/onrgnI=;
 b=kE7IM+OUm7Kos6jl+Brk8BvFRaQeSF3emQXEfa5IDDG6nk3aTrxvvCtLXR1kFLP4wW
 KJGu/YjBYjk3e6mkk9aXHtRK0g/hSYHoFvlELiySG5ihypskTepmP8SCIbpmZS1kvuaS
 MNDl1vlgwmESyvYvlcv/OsJozJ1ABu9F2c7qIq2sXDAMBrjmf54+e79Yx46lfxEJ8E4+
 69jYWEMPkVPfDbkiAHx481plVsnDzz52JeSiYWqQqp37YOj1TvTtPiFRHj1xWDdha/NB
 HngwhKbmPisY66ktm101QGvQcnnuBw24vB7NEW57LOnmWRn0U5L0Ods/tlkD1zZTSl/V
 t2tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlJYiDfONiyT0Kim5jeF0S2jH0OCOjp+fIIo0zTdEGL0Akc9aSFh88mdmLH7lwB2qFWuWJfSiKRaKaMEDok6thyvOYcMaEyw==
X-Gm-Message-State: AOJu0YxRrXVEP0xU4WlmIPHXM4FFw+uI2UKALF1stC4QGYwBiJmJMVMt
 4FlEjDTMmzn83/ASm04eCIxqo5FM3OOwdX39r/pVlC3/ljzYLmWBsguX/etdXU0=
X-Google-Smtp-Source: AGHT+IFOG/8FrgqA9XZ/w2p9VIFkSxQU0Sedis4nI++qNFKsZF2ng64Ha6M2ODVcCthbioPnL41stw==
X-Received: by 2002:a05:6512:2255:b0:52c:6ff5:aecf with SMTP id
 2adb3069b0e04-52c9a3fcc83mr3578819e87.42.1718271599618; 
 Thu, 13 Jun 2024 02:39:59 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.148.226])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-360750ad216sm1161830f8f.57.2024.06.13.02.39.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 02:39:59 -0700 (PDT)
Message-ID: <0bdd0e28-8216-43c0-a415-c2148565900f@linaro.org>
Date: Thu, 13 Jun 2024 11:39:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpu: fix memleak of 'halt_cond' and 'thread'
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
 qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, pierrick.bouvier@linaro.org,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <3ad18bc590ef28e1526e8053568086b453e7ffde.1718211878.git.quic_mathbern@quicinc.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <3ad18bc590ef28e1526e8053568086b453e7ffde.1718211878.git.quic_mathbern@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x132.google.com
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
X-List-Received-Date: Thu, 13 Jun 2024 09:40:03 -0000

On 12/6/24 19:04, Matheus Tavares Bernardino wrote:
> Since a4c2735f35 (cpu: move Qemu[Thread|Cond] setup into common code,
> 2024-05-30) these fields are now allocated at cpu_common_initfn(). So
> let's make sure we also free them at cpu_common_finalize().
> 
> Furthermore, the code also frees these on round robin, but we missed
> 'halt_cond'.
> 
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>   accel/tcg/tcg-accel-ops-rr.c | 1 +
>   hw/core/cpu-common.c         | 3 +++
>   2 files changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


