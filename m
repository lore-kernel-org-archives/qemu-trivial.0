Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUmud-0004un-6c
	for mharc-qemu-trivial@gnu.org; Wed, 22 Feb 2023 06:03:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUmuX-0004u8-Rj
 for qemu-trivial@nongnu.org; Wed, 22 Feb 2023 06:03:45 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUmuU-0006VW-TY
 for qemu-trivial@nongnu.org; Wed, 22 Feb 2023 06:03:45 -0500
Received: by mail-wr1-x434.google.com with SMTP id r7so7149705wrz.6
 for <qemu-trivial@nongnu.org>; Wed, 22 Feb 2023 03:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zSqbD1vCGG1cLRfDz2eQbVx1XeXdaWKM9P4oNFgGsJU=;
 b=SFXvAsuNrQ9RLTqVJY2efbLfqGsbCQSU9RSXm6PcdbMGjVY3egEzAYpp9LU+cRswqW
 fgKN2koYAAq/2zbXHqFFgNptTm+wMBFIH8E9hj9b+dkLpkFBYuOBT39Fe9VwPQ69gcec
 H0HBQRdw0uzSGzQfGDRlLHKmYbOfxWe3wRcNoi/u6O+esPZ6S9GE/EjxkQBkZyiS53It
 MvVUJxNcJkHb7dQq2SvJIgEbGOH8E4HIGENZkA/UHAsaWluVmyUp3n3R5/dF00ig0qjx
 kYQY3S2aNpxm5XVMyrIaaloUeKgIhbIUA2KSlK9WcodHuUx+BIxQdGppMx82NzhAv1Xz
 usZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zSqbD1vCGG1cLRfDz2eQbVx1XeXdaWKM9P4oNFgGsJU=;
 b=dgvlsK4ziuuAZnZ6B/Fuk2Gubzvgvnr9cwZlzlQlEAhmTX9i9tfvIdD9Q61vKl9Egz
 R/CI8kB/7FoxSOzZxefPBb058aS9kXztnqopmmgapD9xt5KVOjncW1YwFFiYWDdReeZ3
 ErYTxJQOfseerrCL2dODJubLGuOnCH/YTHUTqe1psPPTfnplygzVpcDvuv7G9fFPWIcc
 ltf1sYekFYhANCZgTSoRLPJX1Y446Kz4UMoSnTOrXHhHF6Yo3Gkx6l00ADaIFqxi5IcS
 GlZVzmK/bceTwfnyKtHo8v6VkgyaSImuiJ7b7a0h4OQlCFonWMQ1ajB7Cml6Mt11gxaU
 f2PA==
X-Gm-Message-State: AO0yUKXPHNGJh+m9JRf6bTIkwkVBmFhZGr9OMzCPbw0NhxDyz5AUz/46
 jALK7FLMBjv7sXBUpo62/oH7Lg==
X-Google-Smtp-Source: AK7set/eODvoeRbxba4y666mMx434dGR1Z+R7XLfgvc4yxHKlqfLG3qU5XhQRxK9I2AkiufnxYvh5g==
X-Received: by 2002:a5d:4b81:0:b0:2c5:4de1:ba23 with SMTP id
 b1-20020a5d4b81000000b002c54de1ba23mr6763511wrt.19.1677063821162; 
 Wed, 22 Feb 2023 03:03:41 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d4536000000b002c5a07e940csm7083448wra.33.2023.02.22.03.03.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 03:03:40 -0800 (PST)
Message-ID: <9f80bb33-40e7-fc57-1515-c3764f57da46@linaro.org>
Date: Wed, 22 Feb 2023 12:03:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 3/9] hw/i386/pc_q35: Reuse machine parameter
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230213162004.2797-1-shentey@gmail.com>
 <20230213162004.2797-4-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213162004.2797-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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
X-List-Received-Date: Wed, 22 Feb 2023 11:03:46 -0000

On 13/2/23 17:19, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/i386/pc_q35.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 66cd718b70..dee2b38474 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -218,7 +218,7 @@ static void pc_q35_init(MachineState *machine)
>       pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
>                      pci_hole64_size);
>   
> -    object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
> +    object_property_add_child(OBJECT(machine), "q35", OBJECT(q35_host));
>       object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
>                                OBJECT(ram_memory), NULL);
>       object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_PCI_MEM,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Long term we should duplicate/extract Q35MachineState from
PCMachineState and add a Q35PCIHost field, then use 
object_initialize_child; removing this object_property_add_child()
call.

