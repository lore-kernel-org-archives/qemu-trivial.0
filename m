Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPK6y-0000EC-KG
	for mharc-qemu-trivial@gnu.org; Tue, 07 Feb 2023 04:18:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPK6x-0000Cx-3s
 for qemu-trivial@nongnu.org; Tue, 07 Feb 2023 04:17:59 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPK6p-0001q9-Gj
 for qemu-trivial@nongnu.org; Tue, 07 Feb 2023 04:17:58 -0500
Received: by mail-wr1-x429.google.com with SMTP id h3so5009180wrp.10
 for <qemu-trivial@nongnu.org>; Tue, 07 Feb 2023 01:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3PnTxwqNIfVtraojykkcjTM5MN5ZOZ1HhhlrmFp/Kso=;
 b=UD/qUS0sJQWb60dtE9S72NfBxLklH3oyBqYIiSXwO7Fy5RmuK0U06up6mooz8gcVLq
 SVdpsjT/jMBhiEWhAT02k+HbCVYV0Rg/Jo7TfS/ShCqZAVbwCrGaPmSoNMXh8VNZTGcK
 lWX4ZzH2jakDFG1MywozkJPFTunk21GeQLl4NY0aC+MKkLKrbZexkjBx20KfInsY2CxF
 TIYp/QtXXYLFP/u68oxg/ClQv9ZKVzJPymNBZiD2tAnlceJwIsNR0i1APCSMjTo/VToL
 0FIFXFn82gX4PJiC130BNIWe7D00XbceHQL9X1s8SjxfMivJXfarMCvnB/4wtfgwG+o2
 cGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3PnTxwqNIfVtraojykkcjTM5MN5ZOZ1HhhlrmFp/Kso=;
 b=Na1+aA3KPkO6w1Vh5izAeZIyu0QWVCJzK4d0mfb33UR2hz0Q6DXpN//6AwUXVdhib5
 fP6D35PBwflyM2odKV4gpEa8TbJYtWnolewrGsq7sf45LnwtagOvYUtV+7xBy1uNiJTy
 yq6gHpcjDZCx5v9xs1Edl/Nh7EPyvc/DSYRRhgddGkwHdnrgCarKjS9b5kJb4Q2IphQ0
 R2mUFka1qnTYku5O5QeeUvTnQmTwAHHr13HRvvNoyQ8Y0eiyz3XGQvc8Da+cux4tYIzX
 muDkwMLYXz850dOcN0XPRvZDaz1pegynls6VchEaVJlviMuRbW7ta944nLiRd4tilmk4
 7nFw==
X-Gm-Message-State: AO0yUKXuE4q0MPRtoHFGlcFQlh7T/rn7m/AbMBgKAGmafg7551HA1KDJ
 a/nfa+IFqTk7SLP5OndZ7L3CAg==
X-Google-Smtp-Source: AK7set9msYVTlJg661Q4zQIFBT6xIjwaH0skLYTRor7mWl/1lDyFqXDOj7T4Ty6iR0DluOUjpJRmhA==
X-Received: by 2002:adf:ec0d:0:b0:2bf:9474:b6b3 with SMTP id
 x13-20020adfec0d000000b002bf9474b6b3mr2114228wrn.14.1675761455564; 
 Tue, 07 Feb 2023 01:17:35 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f17-20020a5d4dd1000000b002bfad438811sm10733436wru.74.2023.02.07.01.17.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 01:17:34 -0800 (PST)
Message-ID: <f8a83363-ce88-e424-4db5-2fead70e4ec4@linaro.org>
Date: Tue, 7 Feb 2023 10:17:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 0/4] hw: QOM housekeeping around IOTHREAD / IRQ types
Content-Language: en-US
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-trivial@nongnu.org, Alistair Francis <alistair@alistair23.me>
References: <20230113200138.52869-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230113200138.52869-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-List-Received-Date: Tue, 07 Feb 2023 09:17:59 -0000

Hi Peter,

On 13/1/23 21:01, Philippe Mathieu-Daudé wrote:
> - remove unused code
> - use recent QOM macros
> - use CamelCase typedef
> 
> Philippe Mathieu-Daudé (4):
>    iothread: Remove unused IOThreadClass / IOTHREAD_CLASS
>    hw/irq: Declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()
>    hw/or-irq: Declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()
>    hw: Replace qemu_or_irq typedef by OrIRQState
> 
>   hw/arm/exynos4210.c                  |  4 ++--
>   hw/arm/mps2-tz.c                     |  2 +-
>   hw/core/irq.c                        |  9 ++++-----
>   hw/core/or-irq.c                     | 18 +++++++++---------
>   hw/pci-host/raven.c                  |  2 +-
>   include/hw/arm/armsse.h              |  6 +++---
>   include/hw/arm/bcm2835_peripherals.h |  2 +-
>   include/hw/arm/exynos4210.h          |  4 ++--
>   include/hw/arm/stm32f205_soc.h       |  2 +-
>   include/hw/arm/stm32f405_soc.h       |  2 +-
>   include/hw/arm/xlnx-versal.h         |  6 +++---
>   include/hw/arm/xlnx-zynqmp.h         |  2 +-
>   include/hw/or-irq.h                  |  5 +----
>   iothread.c                           |  4 ----
>   14 files changed, 30 insertions(+), 38 deletions(-)

Since most changes concern ARM machines, can this (reviewed)
series go via your tree?

Thanks,

Phil.


