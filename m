Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF2FCCD1A7
	for <qemu-trivial@archiver.kernel.org>; Tue, 21 Oct 2025 15:59:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vBEk4-0002QU-6Z; Tue, 21 Oct 2025 11:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBEjz-0002H1-N6
 for qemu-trivial@nongnu.org; Tue, 21 Oct 2025 11:57:40 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBEjx-0007um-PF
 for qemu-trivial@nongnu.org; Tue, 21 Oct 2025 11:57:39 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-46e6a6a5e42so31687025e9.0
 for <qemu-trivial@nongnu.org>; Tue, 21 Oct 2025 08:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761062254; x=1761667054; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EmsKfQPb+phFt2HKZnH8E/xSwMnb6ZMpj9GAaYtCOVo=;
 b=RlegZid1LrGl1NGudUsc+c8cPv2OW+BZ3sEySX63+OBjgXqMG6QdjACZN2uE3NUlYj
 vg6B1zDwhiTMPqlnZ2JfAJz58DhV8EV5QR5hr9OPFjluD2zHExAWVdV6hJPCS17eZrnZ
 BJhOdaCzQuZtnaoSiwjC/ixjZgpLOb5g/HTO8fV+M/M2/de3sem1M5zZlE/kNfH9M5k1
 VMcbVEtJRQx8/4tWpmE6aP5M4F7jfVDzKe3BWK6hl2uSq+dQYn7N/zY1ZnCNfa4cHYNk
 0l9lC32zF0OR2tZmeWVdkjRWryXUpru49raSHZ1qnLq0Nt98AMbsHXd3FrMSPhl8A8/U
 t4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761062254; x=1761667054;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EmsKfQPb+phFt2HKZnH8E/xSwMnb6ZMpj9GAaYtCOVo=;
 b=cD7JTJkKyo56EeSf90o1Ngg+wJM1RNAQCq7WG1A875e2lLmjzxeqGxBekp+lsy4xPF
 E/3jv5QEq5GRLEa2hs8XUlbH1RCQJcvCtWnuC62Jj8ZGC14zA7B1hIUApuNIvd4n8YaP
 IMENFLZkiooS8z8yYFOfZ7qoCuxTOV19yI3vrmcu8FAe/EQF5EMpmftfTuxoJ91W/h7j
 6PbnwpX295WGMDgpYWtt4Gjnwd1fQANbkAdzPFoekz4ML80fhWeraNoYuJtuBZfXHRlM
 noOJf6Ji/wPpNER1zQYPUl8Z6qoVXmic25xZH3lHjGvKBB0ZraZS66wdil2Jy4mh4nnu
 Dnvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbGzhfykhUcm+/+88S9SyGQ2fTGcb3hHxRDTrwE0JUez+GKz7E58S1TuXo6LDIn6YdCsCHjX72Jve1TRs=@nongnu.org
X-Gm-Message-State: AOJu0YxvlIDZnPnybgJXLA7cwGnpfDl47KPi7oL9iujmc7njORmWPW+k
 JtikyaXwXV7J1QgOWOtNeKeDRA+Eldax/jNVUWEqdYrKV5zvCTrv/I4gKREW52G10cM=
X-Gm-Gg: ASbGnctPtXQBCxiFuYj8ckXJQ6/ptb+RQXBbEwTMvMMQTQx6a9TjsdlUx12AlVaIHl1
 ARlkzR6bad1ivLnnhC8M1AIfigZqjH68seQLvc9wosVwQ/TKnQjl6YAf+4KIdRo1F2YotdTRPen
 1iNlb/VIFQyPTLadUgpQuyr7ZwOz/ZEs4amZZyTSZyJurWitgLcqsgjzbQr9Fj3/DsoaCv6mGgf
 cbZYTHGIffQoXFDGAnmDESCA2S/HpqZlW2Mog0dmMgyVdKWClfwVNHgcsXgLyQHvIujFU9tW4Ka
 2GQVq0yO2ZCftI8QHQ2IUKyaNohhuykY49C45vZZpBt9zV6VTeYd0NmlAzeuGpco4YDSMfIOTY/
 KyoSEkryhgQjJPvj3qFjiR/ZfRMT5ZM67p7nA+jLsSDn+yVf/Q5dlCnAlPODkpdNUaf6fN6eh5A
 RT0gzwklk/003Z9Nf5tZpc++1AQoDUs7VcdljNiu+ZZbKGiQlA775/zA==
X-Google-Smtp-Source: AGHT+IF1MmWzJKWbkzi17y79YgTkCd9mQLumlvX/g6V6H92HE0rBKfrbkoNhjBpfHnwGz+8efMIeKg==
X-Received: by 2002:a05:600c:458b:b0:471:1702:f41a with SMTP id
 5b1f17b1804b1-47117919f1bmr138586925e9.33.1761062254190; 
 Tue, 21 Oct 2025 08:57:34 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47154d3843csm201798655e9.11.2025.10.21.08.57.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 08:57:33 -0700 (PDT)
Message-ID: <04c7e205-80f3-4f24-aa78-a68c63d2af7a@linaro.org>
Date: Tue, 21 Oct 2025 17:57:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] hw/i386/apic: Prefer APICCommonState over
 DeviceState
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Zhao Liu <zhao1.liu@intel.com>,
 kvm@vger.kernel.org, Michael Tokarev <mjt@tls.msk.ru>,
 Cameron Esfahani <dirty@apple.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Phil Dennis-Jordan
 <phil@philjordan.eu>, John Snow <jsnow@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>
References: <20251019210303.104718-1-shentey@gmail.com>
 <20251019210303.104718-8-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251019210303.104718-8-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On 19/10/25 23:03, Bernhard Beschow wrote:
> Makes the APIC API more type-safe by resolving quite a few APIC_COMMON
> downcasts.

Nice!

> Like PICCommonState, the APICCommonState is now a public typedef while staying
> an abstract datatype.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/i386/apic.h           | 33 +++++------
>   include/hw/i386/apic_internal.h  |  7 +--
>   target/i386/cpu.h                |  4 +-
>   target/i386/kvm/kvm_i386.h       |  2 +-
>   target/i386/whpx/whpx-internal.h |  2 +-
>   hw/i386/kvm/apic.c               |  3 +-
>   hw/i386/vapic.c                  |  2 +-
>   hw/i386/x86-cpu.c                |  2 +-
>   hw/intc/apic.c                   | 97 +++++++++++++-------------------
>   hw/intc/apic_common.c            | 56 +++++++-----------
>   target/i386/cpu-apic.c           | 18 +++---
>   target/i386/cpu-dump.c           |  2 +-
>   target/i386/cpu.c                |  2 +-
>   target/i386/kvm/kvm.c            |  2 +-
>   target/i386/whpx/whpx-apic.c     |  3 +-
>   15 files changed, 95 insertions(+), 140 deletions(-)


> -int apic_get_highest_priority_irr(DeviceState *dev)
> +int apic_get_highest_priority_irr(APICCommonState *s)
>   {
> -    APICCommonState *s;
> -
> -    if (!dev) {
> +    if (!s) {
>           /* no interrupts */

Pre-existing dubious check.

>           return -1;
>       }
> -    s = APIC_COMMON(dev);
>       return get_highest_priority_int(s->irr);
>   }

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


