Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q6qNL-0000ko-UI
	for mharc-qemu-trivial@gnu.org; Wed, 07 Jun 2023 06:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q6qNK-0000jT-G7
 for qemu-trivial@nongnu.org; Wed, 07 Jun 2023 06:26:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q6qNI-0005CR-Ud
 for qemu-trivial@nongnu.org; Wed, 07 Jun 2023 06:26:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686133600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vZXSjQJZCdwvE7Ov53sP0iAOQVjBpO5pU6M8OkiO4UU=;
 b=cL2mJTTz6Cn5EKfp3wZ/GC4s7ulKWrKV4jmtQSzr3AzOz5+0h2n5BnJMuXr2lx9NfdYK+F
 PVfS/h7KwuAdUbsd385oX2eCiY4QqUEcLv/WDm+gWzX6Pj3hHYs6tMUzIjVSXL8vkEyXMM
 /mNoQ5sf/WoQ5xrttH1889o6UzOLyFU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-t0qkddoSMuyUmFL1fIy2gQ-1; Wed, 07 Jun 2023 06:26:39 -0400
X-MC-Unique: t0qkddoSMuyUmFL1fIy2gQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f611d31577so2225345e9.0
 for <qemu-trivial@nongnu.org>; Wed, 07 Jun 2023 03:26:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686133599; x=1688725599;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vZXSjQJZCdwvE7Ov53sP0iAOQVjBpO5pU6M8OkiO4UU=;
 b=EMomFJKB2D+rs8w9KDU7x5gBZ52povq5amauA27/X+sLyqWHHSyJJIvdg/2IdApcFt
 U21escSo5j5U1dbZVdVD3uMhJQRyGRL3zIPKIVG79IsHBLZcNw1Fr/4hoF4um+ykEVcM
 Z0gmSFKHUqQhZcSx9hoERNjpuOm1v257qWV6kSlXjEn+xXeoM+podOgIZoBsOT/fKXOC
 I5i3oDaAtRztM8kbxk11KoiO/+HUUsHu2hp8f9mufHlBx4052EfwXjEgU23kWkQXHDV9
 IAA/bEdU9yFjr2t3g1mJRMXZViEU5Ek55nPJen5dG9/PGey7QLd9wqUWg1Ts5haYpu6s
 WzdQ==
X-Gm-Message-State: AC+VfDxhq6aO92z+o7K6abEVVMeYUQsVdtR3sZX8lX6LcB/73vb/2tIp
 NmpgY7elHkVk+2obouxSeDrwsM/xUXUF4XrB2KjNOeM49j/zb33BU9MLGfkLoOBFccpvAEMmQ5h
 wEiipLF2phaVGYdymDg==
X-Received: by 2002:a05:600c:881b:b0:3f7:ec1d:21b3 with SMTP id
 gy27-20020a05600c881b00b003f7ec1d21b3mr3419790wmb.5.1686133598802; 
 Wed, 07 Jun 2023 03:26:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4hzEkSjKurccsIYpM+CFMqQHPcCPyZFvZzApbnU7nOcv8hyx+4E3cFuGAuupLNxqBjGz8EGA==
X-Received: by 2002:a05:600c:881b:b0:3f7:ec1d:21b3 with SMTP id
 gy27-20020a05600c881b00b003f7ec1d21b3mr3419779wmb.5.1686133598537; 
 Wed, 07 Jun 2023 03:26:38 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-114-92.web.vodafone.de.
 [109.42.114.92]) by smtp.gmail.com with ESMTPSA id
 n18-20020a1c7212000000b003f60482024fsm1672852wmc.30.2023.06.07.03.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 03:26:37 -0700 (PDT)
Message-ID: <5795da20-a2f6-e606-27bd-a23fc72346fc@redhat.com>
Date: Wed, 7 Jun 2023 12:26:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] hw/mips: Improve the default USB settings in the
 loongson3-virt machine
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230525064731.1854107-1-thuth@redhat.com>
In-Reply-To: <20230525064731.1854107-1-thuth@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 07 Jun 2023 10:26:46 -0000

On 25/05/2023 08.47, Thomas Huth wrote:
> It's possible to compile QEMU without the USB devices (e.g. when using
> "--without-default-devices" as option for the "configure" script).
> To be still able to run the loongson3-virt machine in default mode with
> such a QEMU binary, we have to check here for the availability of the
> devices first before instantiating them.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   The alternative would be to use a "#ifdef CONFIG_USB_OHCI_PCI" etc.
>   ... not sure what is nicer ... what do you think?
> 
>   hw/mips/loongson3_virt.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
> index 216812f660..a0afb17030 100644
> --- a/hw/mips/loongson3_virt.c
> +++ b/hw/mips/loongson3_virt.c
> @@ -447,10 +447,14 @@ static inline void loongson3_virt_devices_init(MachineState *machine,
>   
>       pci_vga_init(pci_bus);
>   
> -    if (defaults_enabled()) {
> +    if (defaults_enabled() && module_object_class_by_name("pci-ohci")) {
>           pci_create_simple(pci_bus, -1, "pci-ohci");
> -        usb_create_simple(usb_bus_find(-1), "usb-kbd");
> -        usb_create_simple(usb_bus_find(-1), "usb-tablet");
> +        if (module_object_class_by_name("usb-kbd")) {
> +            usb_create_simple(usb_bus_find(-1), "usb-kbd");
> +        }
> +        if (module_object_class_by_name("usb-tablet")) {
> +            usb_create_simple(usb_bus_find(-1), "usb-tablet");
> +        }
>       }
>   
>       for (i = 0; i < nb_nics; i++) {

Friendly ping!

  Thomas


