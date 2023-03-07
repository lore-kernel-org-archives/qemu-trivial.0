Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZfrf-0001bz-8J
	for mharc-qemu-trivial@gnu.org; Tue, 07 Mar 2023 17:32:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZfrc-0001XN-No
 for qemu-trivial@nongnu.org; Tue, 07 Mar 2023 17:32:56 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZfrb-0004go-0d
 for qemu-trivial@nongnu.org; Tue, 07 Mar 2023 17:32:56 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so84563wmi.3
 for <qemu-trivial@nongnu.org>; Tue, 07 Mar 2023 14:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678228373;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=itKmIdMy2tZcdGbpUdRIzfe7UoKn1pusD6G6eBCYa2Q=;
 b=ka6Awu4lzIHdSFCScW9niSY1mz5zNUEw7yiZxApDgfZdYSg26IMCGZ0B2PI0/l5xgj
 YHxtuEXgLWhsFUsq40vwJHVOoHJ6O6leYB19vUL0mdw2OSRmsBHFbwgGjRUPHbqRGKbA
 mSUa+1W4eKyjXtylqQXYIV3IO/bCh/JLOdj8PbK3s5nsA8yZoHV2/d3MLSDWcmAJ4+Yb
 SJCWiQHj92qjkHcJHimi7nXr5RC1AwgP5r9uTwpOB2tju5K1LBIBhjXCX40R4u/6mwga
 ryxGR/M6C+NghlS++RtMJrmfdqpnCIG4yUircOmQFz16Phreqyswok/4WPIEcs5NyoyH
 zrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678228373;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=itKmIdMy2tZcdGbpUdRIzfe7UoKn1pusD6G6eBCYa2Q=;
 b=S/bot8XBPkdCjBuWPwUHdO0AD/wjAmaDERCOh0GQPGyIG2iaWZV/7bfAQ9s27fyuae
 Ydvrl/bv+BoCThTQ2E/SdXVWst9Y4cz2ycm+8JnL/EhuZg7yPqkngKhwmt6rZxxO/ZpS
 svWhJI+TqplsBMrziLTstvqD7xZmTjC+PlWsMylh974W+U2O0VOqZXqm4tGY+SGAKVs2
 Mt+5PKEo9tb8JwmLkkhy6h4A96Jwfm3rSZiWMoAhEzM8WIEK/aqkzWZsvVknn4YSRmeK
 nM0pSkLTr/5qfmmYsh5BaQxginkbctytKbfYsygLNfIVSaNc+trGh6lypPydgGZw4EhB
 pYSg==
X-Gm-Message-State: AO0yUKU6QVt9R8+A1cDYQjffsgnv5huZ8+UZV9YzBIi+dnWccmTIUhPY
 FBFbAjM/KqRFg6AeLrQ9T3fLrA==
X-Google-Smtp-Source: AK7set/oR23izRF6j8PX85nqhDryJMEi0aDTKM/DBooZFpJK9Wmqdf2r8vM6aKWNhJ2J5ofRA+QIHg==
X-Received: by 2002:a05:600c:c0d:b0:3df:f124:f997 with SMTP id
 fm13-20020a05600c0c0d00b003dff124f997mr14126700wmb.19.1678228372825; 
 Tue, 07 Mar 2023 14:32:52 -0800 (PST)
Received: from [192.168.1.115] (52.red-88-28-28.dynamicip.rima-tde.net.
 [88.28.28.52]) by smtp.gmail.com with ESMTPSA id
 j40-20020a05600c1c2800b003dd1bd0b915sm19647059wms.22.2023.03.07.14.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 14:32:51 -0800 (PST)
Message-ID: <4ef9dedc-ce1c-b0f1-281f-e0c49b4e04d7@linaro.org>
Date: Tue, 7 Mar 2023 23:32:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/9] hw/pci-host/i440fx: Inline sysbus_add_io()
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
 <20230213162004.2797-2-shentey@gmail.com>
 <f865212d-6a08-8f9e-5ddd-6fe037fc5fa9@linaro.org>
 <3ABCEE15-F73D-498F-8D95-F17B78795E14@gmail.com>
 <EA2E3787-179C-4A50-9305-969404D09702@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <EA2E3787-179C-4A50-9305-969404D09702@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-List-Received-Date: Tue, 07 Mar 2023 22:32:57 -0000

On 6/3/23 07:57, Bernhard Beschow wrote:
> 
> 
> Am 22. Februar 2023 18:05:51 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>>
>>
>> Am 22. Februar 2023 10:58:08 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>>> On 13/2/23 17:19, Bernhard Beschow wrote:
>>>> sysbus_add_io() just wraps memory_region_add_subregion() while also
>>>> obscuring where the memory is attached. So use
>>>> memory_region_add_subregion() directly and attach it to the existing
>>>> memory region s->bus->address_space_io which is set as an alias to
>>>> get_system_io() by the pc machine.
>>>>
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>    hw/pci-host/i440fx.c | 5 +++--
>>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
>>>> index 262f82c303..9c6882d3fc 100644
>>>> --- a/hw/pci-host/i440fx.c
>>>> +++ b/hw/pci-host/i440fx.c
>>>> @@ -27,6 +27,7 @@
>>>>    #include "qemu/range.h"
>>>>    #include "hw/i386/pc.h"
>>>>    #include "hw/pci/pci.h"
>>>> +#include "hw/pci/pci_bus.h"
>>>>    #include "hw/pci/pci_host.h"
>>>>    #include "hw/pci-host/i440fx.h"
>>>>    #include "hw/qdev-properties.h"
>>>> @@ -217,10 +218,10 @@ static void i440fx_pcihost_realize(DeviceState *dev, Error **errp)
>>>>        PCIHostState *s = PCI_HOST_BRIDGE(dev);
>>>>        SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>>>>    -    sysbus_add_io(sbd, 0xcf8, &s->conf_mem);
>>>> +    memory_region_add_subregion(s->bus->address_space_io, 0xcf8, &s->conf_mem);
>>>
>>> To avoid accessing internal fields we should stick to the PCI API:
>>>
>>>     memory_region_add_subregion(pci_address_space_io(PCI_DEVICE(dev)),
>>>                                 0xcf8, &s->conf_mem);
>>
>> dev is of type PCIHostState which derives from SysBusDevice, not PCIDevice. AFAICS there is no getter implemented on PCIBus.

You are right, there is no getter for PCIBus::address_space_io,
it is accessed directly:

   MemoryRegion *pci_address_space_io(PCIDevice *dev)
   {
       return pci_get_bus(dev)->address_space_io;
   }

If it is considered a property, probably no need for getter.

So:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> 
>>
>>>
>>>>        sysbus_init_ioports(sbd, 0xcf8, 4);
>>>>    -    sysbus_add_io(sbd, 0xcfc, &s->data_mem);
>>>> +    memory_region_add_subregion(s->bus->address_space_io, 0xcfc, &s->data_mem);
>>>>        sysbus_init_ioports(sbd, 0xcfc, 4);
>>>
>>> Now all classes implementing PCI_HOST_BRIDGE register conf/data in I/O
>>> space, so this could be a pattern justifying reworking a bit the
>>> PCIHostBridgeClass or adding an helper in "hw/pci/pci_host.h" to do
>>> that generically.

(this comment is besides the scope of this patch)

>> What do you mean exactly? There are PCI hosts spawning two PCI buses and therefore have two such spaces.

I haven't checked but IIRC each PCI host exposing I/O registers
to access buses via ISA I/O open-code it. Even if it exposes
multiple buses, the same pattern is used (1 time per bus).

Anyway, no need to worry about that now...

