Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6ghv-0008VQ-Sd
	for mharc-qemu-trivial@gnu.org; Sat, 17 Dec 2022 18:35:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6ght-0008TU-P5
 for qemu-trivial@nongnu.org; Sat, 17 Dec 2022 18:35:05 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6ghr-0004fK-AW
 for qemu-trivial@nongnu.org; Sat, 17 Dec 2022 18:35:05 -0500
Received: by mail-ed1-x529.google.com with SMTP id c17so8287097edj.13
 for <qemu-trivial@nongnu.org>; Sat, 17 Dec 2022 15:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LqzmVIIc4YKlU7tInzQP7/UdZFgVONo15o0dEn9+NfM=;
 b=XuJDYt2SXHalP01VO3DjGYcR78Y6ae77vVY1h6qOpOtFgkUotKsBdkWZpdKiIvFDAc
 sZ+4FClL6MtWk18INbBUsg8Mnwxt2+Zs5rG73+FLsh+L+efDp1J7N7Hw09U5LRVCBz5g
 FKTLSmZS+Ir/63JV+yI/D/GgOl8rquRHind7d7uzHXF39a8IKwlFkuKoJSqxhT0COC9D
 Y2dAYTYIzzw7qsjbjTUUlwwaD6XqGdQn+m6z3j/WHUSvk8V52GRN74PMJO3qcG3JG79b
 iwHpcoSkI8RQUhSVSC0+QkI7OtE2CJsA+eEjkWlJG+BY2wSUp5Q2qc/g8Ci+4IyLm3c+
 S7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LqzmVIIc4YKlU7tInzQP7/UdZFgVONo15o0dEn9+NfM=;
 b=R6vLDMnmcfjelThhMiZ2qWVCu1R1+9mMAqm0GbyRNJjH+HvnasSj1iMme7E5BOMZmN
 AKHzcSPoRuVJVumNhixgT9ZND7RxFL734tcz5NBBcFJI2879frn2LaHyaWCkUQQiKL5W
 1OPjKTPIammd+XBt6HVxgM79CJwZP9oHvvVzE47grWiHr2aRJK1RIndGJ++T+lWMrjQZ
 wO+cPonP7RzUSNVdKlmwnbh6wH52tbpdlTApivNHLTYwS7585sua9CEdSF3HVWOhXrdK
 zSbtA5ZN2hAppS40H9xBdNXS0Hi0YrN9tnt1XTiOOVU8KhLM5YqypQXWPFPRWz5FdBKy
 vwhQ==
X-Gm-Message-State: ANoB5plufjLcHsetwo5M4cBSp+NhDO4luZIt1BXJXQ3RQAkInQayuh6Q
 1JQDin1hn57KlMcBdm1QoGfLQw==
X-Google-Smtp-Source: AA0mqf6XOWcFgAY2hTRR/7iyffHtlN4Uxfb3o6mGgpLj3PbfZJpsWJw5OAOWpaetvdJcx2sMadyASg==
X-Received: by 2002:a05:6402:3982:b0:461:9578:f904 with SMTP id
 fk2-20020a056402398200b004619578f904mr33928236edb.23.1671320101783; 
 Sat, 17 Dec 2022 15:35:01 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q9-20020aa7d449000000b004677b1b1a70sm2465927edr.61.2022.12.17.15.34.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 15:35:00 -0800 (PST)
Message-ID: <d4fab8e5-03d6-ccfd-dc51-2e93c84a28cc@linaro.org>
Date: Sun, 18 Dec 2022 00:34:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 6/7] i386, mips: Resolve redundant ACPI and APM
 dependencies
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20221216130355.41667-1-shentey@gmail.com>
 <20221216130355.41667-7-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221216130355.41667-7-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sat, 17 Dec 2022 23:35:06 -0000

On 16/12/22 14:03, Bernhard Beschow wrote:
> Now that all ACPI controllers select the ACPI and APM dependencies
> themselves, these explicit dependencies became redundant. Remove them.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   configs/devices/mips-softmmu/common.mak | 3 ---
>   hw/i386/Kconfig                         | 2 --
>   2 files changed, 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


