Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qJryP-00028i-4V
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jul 2023 04:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qJryD-0001pe-Pm
 for qemu-trivial@nongnu.org; Thu, 13 Jul 2023 04:46:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qJryA-0007SM-Ns
 for qemu-trivial@nongnu.org; Thu, 13 Jul 2023 04:46:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689237996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bnCCMdXWeCOaJxIEFILAG/h1MBXKiwDAk51I/1JzPzs=;
 b=FicakqHGtPtnzmvqKlPqFDuWIJfVSqQARTF3FDnSfDScepOvFZQ2CTN6Htvgh9K5N9o6tu
 /Z1xgRY4dRClueXFnt/t8uGSqXL5w9+TnPyopeMt8golGLHLwt8P2Y5YmMH5IT5dogNzPv
 4Juut8PSt25nUmpYYnO9myDqOJaYlpo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-KXqIxDtqNF2bsZ4VGRCs7g-1; Thu, 13 Jul 2023 04:46:35 -0400
X-MC-Unique: KXqIxDtqNF2bsZ4VGRCs7g-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-767cf9caaa9so112093685a.0
 for <qemu-trivial@nongnu.org>; Thu, 13 Jul 2023 01:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689237995; x=1691829995;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bnCCMdXWeCOaJxIEFILAG/h1MBXKiwDAk51I/1JzPzs=;
 b=UVmSkbVtBFC4AinmXWUc1VwujtrH7xY4sVBJyuuCX+cLinkGm6hOr/A/ibhX9/bOA2
 3pNKz0w2CWVBOQDYUaiQ7k/XX0dBwNQKUHtu1Hl6rVcJ0SEKRdgkn3VuzYKBSa9mgIVl
 SsxgfItEcWMjDM4R7IxJ8wcrfx37IjMRiXujHSws5raWacS4WyzMusuxrStJFYzf7HIB
 FJVwlkaZegP6Nbi1PCgB1ou8Q0atG/vCo96YFiA4XNgrKolYY/OPs4Dq1Q9mjwwYzdcx
 dalL2DluK52r+iUPlQuy8Bob1Cqa2W+SfFINZkbUYRyXFSXjEWfC7dtwl7u8kfNzHXEW
 QuCQ==
X-Gm-Message-State: ABy/qLatncRljNImWO7hXNrO0TsqRNUEtfejO8lN7NaGZ/U9kKPBcab/
 Kr+MjOvUDqYkDR9hOuu7phVxgcRLF+G/kwMMZQB4OCwpxtSrRWFaDVi4t6GlujANXVRp4pjH2u8
 aluovRNggb2vEioeyjQ==
X-Received: by 2002:a05:620a:4710:b0:765:467e:133a with SMTP id
 bs16-20020a05620a471000b00765467e133amr1211896qkb.23.1689237995173; 
 Thu, 13 Jul 2023 01:46:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE3tgo1QtLgC3pvqwWZ/QTQgFawEk4ZxRMgIHGyMkG83hP381UKEptXSeq7T/qH/3/7aB/B6g==
X-Received: by 2002:a05:620a:4710:b0:765:467e:133a with SMTP id
 bs16-20020a05620a471000b00765467e133amr1211884qkb.23.1689237994953; 
 Thu, 13 Jul 2023 01:46:34 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a37e305000000b00766fce8f840sm2725485qki.120.2023.07.13.01.46.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 01:46:34 -0700 (PDT)
Message-ID: <0effafc0-4de8-7554-006a-78be3e84d043@redhat.com>
Date: Thu, 13 Jul 2023 10:46:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] hw/mips: Improve the default USB settings in the
 loongson3-virt machine
From: Thomas Huth <thuth@redhat.com>
To: Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230621074134.82781-1-thuth@redhat.com>
In-Reply-To: <20230621074134.82781-1-thuth@redhat.com>
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
 NICE_REPLY_A=-0.11, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 13 Jul 2023 08:46:43 -0000

On 21/06/2023 09.41, Thomas Huth wrote:
> It's possible to compile QEMU without the USB devices (e.g. when using
> "--without-default-devices" as option for the "configure" script).
> To be still able to run the loongson3-virt machine in default mode with
> such a QEMU binary, we have to check here for the availability of the
> USB devices first before instantiating them.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   v2: Use #ifdef instead of runtime check
> 
>   hw/mips/loongson3_virt.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
> index 216812f660..3094413eea 100644
> --- a/hw/mips/loongson3_virt.c
> +++ b/hw/mips/loongson3_virt.c
> @@ -51,6 +51,7 @@
>   #include "sysemu/reset.h"
>   #include "sysemu/runstate.h"
>   #include "qemu/error-report.h"
> +#include CONFIG_DEVICES
>   
>   #define PM_CNTL_MODE          0x10
>   
> @@ -447,11 +448,13 @@ static inline void loongson3_virt_devices_init(MachineState *machine,
>   
>       pci_vga_init(pci_bus);
>   
> +#ifdef CONFIG_USB_OHCI_PCI
>       if (defaults_enabled()) {
>           pci_create_simple(pci_bus, -1, "pci-ohci");
>           usb_create_simple(usb_bus_find(-1), "usb-kbd");
>           usb_create_simple(usb_bus_find(-1), "usb-tablet");
>       }
> +#endif
>   
>       for (i = 0; i < nb_nics; i++) {
>           NICInfo *nd = &nd_table[i];

Ping?

  Thomas


