Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qrDtd-0002Y9-83
	for mharc-qemu-trivial@gnu.org; Fri, 13 Oct 2023 04:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrDtV-0002LR-8e
 for qemu-trivial@nongnu.org; Fri, 13 Oct 2023 04:51:41 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrDtR-0001hV-71
 for qemu-trivial@nongnu.org; Fri, 13 Oct 2023 04:51:40 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9b2cee40de8so372120666b.1
 for <qemu-trivial@nongnu.org>; Fri, 13 Oct 2023 01:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697187095; x=1697791895; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YeEfXgsKpYdF3RMLquGoYhyEJWn3mVtkScrf5aIh5jc=;
 b=J4SxAXxbf/nSqp1/PQti+5aKX3yi7RWsiK08TKvGKJyIyJRi8OIv3KJKkbtA81Di6r
 dC8S+VMnPU02HXc2vIELqcvPJn+Sy7P/sHTTqdf6+gvNXVR30/4FJKprjqVbwN6h2ZF7
 xlYV3oHhmiE/hM33G/ZHBs7GZDgQHT/bE2s1LN1VK6+kKSpHPoAEdv5yiHsarO52wNCE
 qG0v9YkhorlL52Gzh3FhA+fHW07Vx+TIqQcGcdXp16mQJMF3lix0vKQwP1u1LI5Py/U8
 AFSCocVGFhgOGQgWsK3/0W7hY1FiZwwX9I9AMsngNlZmWGBnwWR8+FDVqN4bN9YA/LRj
 2BCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697187095; x=1697791895;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YeEfXgsKpYdF3RMLquGoYhyEJWn3mVtkScrf5aIh5jc=;
 b=olFzXlpQ9M/RpeWA46R1zAA2SpMhw22/waQwtf2/HkCEjTT3VfAOjXdWen2rIphrwc
 OhG+VIY1JQi8qg6xCdpJM4Dws75mpTCkogEscMBo8VbjZRcS5clfsSc39O42Ng69UqPT
 m1xsWCkgx7K7xnt77vIxachzASPzoPZxTsx17r7kawadkXj8vZ1fhtAeLwYbNMEkRAMt
 wSpBSdl5/Jjxt0xiVIMbaTH9gXDvPX6zlWEj7Tn5CY38Uwi8U1oV/PqJ7fpVkq5Pywi6
 xHaeVTMq26LSUDGPTyf/NQfY/cKKOzD92eXFKgqLwvVlzUM/qg6XN98eC8LUR+Q2kT5i
 YtFw==
X-Gm-Message-State: AOJu0Yz+RR9NBU4Qh8nGqR2d1IzDS5tyBSpzaF3VA2ANgf0FaotS8QbD
 5e0q7thy46nW1lAr9u5XkjKPMw==
X-Google-Smtp-Source: AGHT+IFU9CiBPtDfnpXENWsgYoDu1B8G4xiCQso0L3gQhYjyxkdn8iYVq2EgTKZN/4Lebaxgh5FE1w==
X-Received: by 2002:a17:907:6d2a:b0:9bd:bdfd:e17a with SMTP id
 sa42-20020a1709076d2a00b009bdbdfde17amr332487ejc.6.1697187095344; 
 Fri, 13 Oct 2023 01:51:35 -0700 (PDT)
Received: from [192.168.69.115] ([176.172.118.168])
 by smtp.gmail.com with ESMTPSA id
 op13-20020a170906bced00b009a13fdc139fsm12152002ejb.183.2023.10.13.01.51.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Oct 2023 01:51:34 -0700 (PDT)
Message-ID: <3e159260-f1ac-d3cf-4ba4-3ce6c1b88343@linaro.org>
Date: Fri, 13 Oct 2023 10:51:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Add the nios2 interrupt controller to the
 nios2 section
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>
References: <20231013065408.949486-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231013065408.949486-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-List-Received-Date: Fri, 13 Oct 2023 08:51:42 -0000

On 13/10/23 08:54, Thomas Huth wrote:
> These files obviously belong to the nios2 target, so they should
> be listed in the nios2 section in the MAINTAINERS file.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6eecd617e0..45eb230465 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -296,7 +296,9 @@ R: Marek Vasut <marex@denx.de>
>   S: Orphan
>   F: target/nios2/
>   F: hw/nios2/
> +F: hw/intc/nios2_vic.c
>   F: disas/nios2.c
> +F: include/hw/intc/nios2_vic.h
>   F: configs/devices/nios2-softmmu/default.mak
>   F: tests/docker/dockerfiles/debian-nios2-cross.d/build-toolchain.sh
>   F: tests/tcg/nios2/

Could we have a NiosII hardware section instead?

