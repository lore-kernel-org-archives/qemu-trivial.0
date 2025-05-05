Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBux8-0001oF-AD
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2025 08:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uBux6-0001nn-F7
 for qemu-trivial@nongnu.org; Mon, 05 May 2025 08:29:45 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uBux4-0001bw-5d
 for qemu-trivial@nongnu.org; Mon, 05 May 2025 08:29:44 -0400
Received: by mail-pf1-x442.google.com with SMTP id
 d2e1a72fcca58-736e52948ebso5540242b3a.1
 for <qemu-trivial@nongnu.org>; Mon, 05 May 2025 05:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746448180; x=1747052980; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TRdOlQiVHaiwUYAV1edB+DxcKZbO8etBkyN+zT5IlZY=;
 b=lZQCFBU4EKFVUmlmhb2w7RncQhLocB+0zIdcBB38Ef3zO3JqcdHJCaxqI+MQaQT87M
 d2FYzi5Nzhk57M6umm4/O/j+7jgwCxmKZmXLdOPs9l9QVM+inOpTUxfJXgeI+z5awJW9
 gm2Ev49OLt1SE+H6Xzc/qtiTL7xycpngyUZ3KhLfmZP1Vv1oi0qt/ds3QZfYaM3thRQC
 eNjdD0FqHxR+scucxZ5WY8Bx349+PMUZgHci6FM/S5Gi0gYJxqIe/nPZQ1IlArCm9qNS
 Ti8WKfhGXdpZ62FFfk5RKXtl/vYiEUJBgRH1gCkWqz4BlSAakz2VNgll10xgtNljO1V1
 ZgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746448180; x=1747052980;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TRdOlQiVHaiwUYAV1edB+DxcKZbO8etBkyN+zT5IlZY=;
 b=NFNfpHMkEy/zyC2zCYrpH5jRoJdzTANIHxlXPEe+dwEVgWE5jQOXZJ2vR1YHEgP2XL
 lPA2JOonTlnUjunhSw+WQP+A8tX8ytnROHK5KUI7quJrFaiORRWgngy93C2rbRQ81C6S
 OYVR4FKCtoK6iGvEAYcsxXMm0oh+WwZl72JZsm3ehXA7N1eK7e1XLHpCdHLD9V2cszzg
 n4OYHfAL2cIZ/BdEjHxi3OPjzeJ2/atWhlawXHyBKl9iKYpGWhhLVq/kWFuQvjoeVR8Q
 Ta6byWBN5KbO35LGUTeciAGAIYEhmsilYNC3yF3leeATw00wTwN5N44tFtz/zDzjs2ku
 MTIA==
X-Gm-Message-State: AOJu0YwEYrEI9aLTkeyYuqElRVRMZIdokfriZO4o0BZOxjVsbahxjMQV
 WPfOqaps5Lj+FqKqndL1AlkmUGC8zag+L+esO7qM9G7LGvoson4aFyYc4r5+KdU=
X-Gm-Gg: ASbGncsDLuOxLgny43J1Ahv/3wjP496LS88HUDlaZwJDbUXQ/RrZF6DY/O9mlqI29pF
 s6vbto4sn5isGVtT55pfHg3ylKqKCYLunMDy5BV1KKJXWF9wHCpX7n9C8TS4WNapBvDG3FPoaOt
 wyB+iHWKkkjeWBinkHY3odyMYrmaUaTcfaHd13kiFBIGy3uSLNsS0/eWL591GmX6skZ+1qCvAU7
 zsidY8u+DdgMRlAsKRHRzGHy9dgmy1je9lV5tPB5pNiF3moAhRKbg89qPz6nsRtjDvjWx87FQ09
 odxzuxiCXluccU9wPhCWpoPxqJfqziJVDB7vtEdL0xCuTRlTuz+cg6KjuzRnkTjYUT/LhNealaO
 NIQxq1QOnzMoU9hAdYTc=
X-Google-Smtp-Source: AGHT+IHc3Z3O0hTQrEXnjphhgDXAr0SqxcxJ7DQOJKbO06UPKn9yBeA6LAglX8tAVy1f8tQlD1iVAg==
X-Received: by 2002:a05:6a00:8f0c:b0:736:5b85:a911 with SMTP id
 d2e1a72fcca58-7406f0bd9c7mr10908215b3a.8.1746448180316; 
 Mon, 05 May 2025 05:29:40 -0700 (PDT)
Received: from ?IPV6:2804:7f0:b400:8604:7950:93ed:53e9:9290?
 ([2804:7f0:b400:8604:7950:93ed:53e9:9290])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74058d7ad7asm6882301b3a.11.2025.05.05.05.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 05:29:39 -0700 (PDT)
Message-ID: <6523849b-b44c-4176-ba5f-78a606621eb6@linaro.org>
Date: Mon, 5 May 2025 09:29:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/acpi/pcihp: Fix typo in function name
To: eric.auger@redhat.com, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-trivial@nongnu.org, philmd@linaro.org
References: <20250504215639.54860-10-gustavo.romero@linaro.org>
 <b0faa0cf-8c68-4385-923c-e761b6582cc0@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <b0faa0cf-8c68-4385-923c-e761b6582cc0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pf1-x442.google.com
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
X-List-Received-Date: Mon, 05 May 2025 12:29:45 -0000

Hi Eric,

On 5/5/25 04:13, Eric Auger wrote:
> 
> 
> On 5/4/25 11:56 PM, Gustavo Romero wrote:
>> Fix typo in QEMU's ACPI PCI hotplug API function name that checks
>> whether a given bus is hotplug-capable.
>>
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> 
> For awareness, there is a similar typo in pci-port.
> see
> https://lore.kernel.org/all/20250428102628.378046-2-eric.auger@redhat.com/

hmm it's unfortunate that I was about to publish a series to exactly
enable the APCI PCI hotplug on ARM. Next time I should try to sync better
with Red Hat folks on the work fronts...

I've skimmed through your RFC and it seems to be doing mostly of what I
was doing for my series, so I'll reviewed it formally today, it should be quick.

Anyways, thanks for the heads up.


Cheers,
Gustavo

> another trivial indentation fix in generic_event_device.c
> https://lore.kernel.org/all/20250428102628.378046-3-eric.auger@redhat.com/
> 
> Eric
> 
> 
> 
> 
>> ---
>>   hw/acpi/acpi-pci-hotplug-stub.c | 2 +-
>>   hw/acpi/ich9.c                  | 2 +-
>>   hw/acpi/pcihp.c                 | 2 +-
>>   hw/acpi/piix4.c                 | 2 +-
>>   include/hw/acpi/pcihp.h         | 2 +-
>>   5 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/acpi/acpi-pci-hotplug-stub.c b/hw/acpi/acpi-pci-hotplug-stub.c
>> index b67b4a92da..b7bc6e40a1 100644
>> --- a/hw/acpi/acpi-pci-hotplug-stub.c
>> +++ b/hw/acpi/acpi-pci-hotplug-stub.c
>> @@ -34,7 +34,7 @@ void acpi_pcihp_reset(AcpiPciHpState *s)
>>   {
>>   }
>>   
>> -bool acpi_pcihp_is_hotpluggbale_bus(AcpiPciHpState *s, BusState *bus)
>> +bool acpi_pcihp_is_hotpluggable_bus(AcpiPciHpState *s, BusState *bus)
>>   {
>>       return true;
>>   }
>> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
>> index c7a735bf64..a07c9d115b 100644
>> --- a/hw/acpi/ich9.c
>> +++ b/hw/acpi/ich9.c
>> @@ -570,7 +570,7 @@ void ich9_pm_device_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
>>   bool ich9_pm_is_hotpluggable_bus(HotplugHandler *hotplug_dev, BusState *bus)
>>   {
>>       ICH9LPCState *lpc = ICH9_LPC_DEVICE(hotplug_dev);
>> -    return acpi_pcihp_is_hotpluggbale_bus(&lpc->pm.acpi_pci_hotplug, bus);
>> +    return acpi_pcihp_is_hotpluggable_bus(&lpc->pm.acpi_pci_hotplug, bus);
>>   }
>>   
>>   void ich9_pm_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list)
>> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
>> index 5f79c9016b..aac90013d4 100644
>> --- a/hw/acpi/pcihp.c
>> +++ b/hw/acpi/pcihp.c
>> @@ -371,7 +371,7 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>>       acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
>>   }
>>   
>> -bool acpi_pcihp_is_hotpluggbale_bus(AcpiPciHpState *s, BusState *bus)
>> +bool acpi_pcihp_is_hotpluggable_bus(AcpiPciHpState *s, BusState *bus)
>>   {
>>       Object *o = OBJECT(bus->parent);
>>   
>> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
>> index b16d45f03e..d98b80df6d 100644
>> --- a/hw/acpi/piix4.c
>> +++ b/hw/acpi/piix4.c
>> @@ -406,7 +406,7 @@ static bool piix4_is_hotpluggable_bus(HotplugHandler *hotplug_dev,
>>                                         BusState *bus)
>>   {
>>       PIIX4PMState *s = PIIX4_PM(hotplug_dev);
>> -    return acpi_pcihp_is_hotpluggbale_bus(&s->acpi_pci_hotplug, bus);
>> +    return acpi_pcihp_is_hotpluggable_bus(&s->acpi_pci_hotplug, bus);
>>   }
>>   
>>   static void piix4_pm_machine_ready(Notifier *n, void *opaque)
>> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
>> index ac21a95913..a97904bada 100644
>> --- a/include/hw/acpi/pcihp.h
>> +++ b/include/hw/acpi/pcihp.h
>> @@ -58,7 +58,7 @@ typedef struct AcpiPciHpState {
>>   void acpi_pcihp_init(Object *owner, AcpiPciHpState *, PCIBus *root,
>>                        MemoryRegion *io, uint16_t io_base);
>>   
>> -bool acpi_pcihp_is_hotpluggbale_bus(AcpiPciHpState *s, BusState *bus);
>> +bool acpi_pcihp_is_hotpluggable_bus(AcpiPciHpState *s, BusState *bus);
>>   void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>>                                      DeviceState *dev, Error **errp);
>>   void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
> 


