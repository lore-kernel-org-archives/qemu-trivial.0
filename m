Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBwfA-0001dp-RY
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2025 10:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uBwf7-0001dU-CW
 for qemu-trivial@nongnu.org; Mon, 05 May 2025 10:19:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uBwf3-0000nE-Ug
 for qemu-trivial@nongnu.org; Mon, 05 May 2025 10:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746454749;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4uu0qpdVjEJLYHkdpL6Cd88hqPozAxAQGV8BMWT+hIg=;
 b=FBj7jsKWJimL6uw3ri8Bfazddz8NxWhzv6l2c20F637M4c/mrNFBZIxD4W5Qa3F/MfybSu
 BzyCJHk06uBd5Yy9bX1V95wWIntMj0RcQCI7MYRBTt4tokdoLkYXiMGCHjR3ecyUVJXqav
 pOvzqjRGRcnX9pTnGZfMt5n231Y3h5Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-tdmDL6GGN8uzphCB0qmy3g-1; Mon, 05 May 2025 10:19:08 -0400
X-MC-Unique: tdmDL6GGN8uzphCB0qmy3g-1
X-Mimecast-MFC-AGG-ID: tdmDL6GGN8uzphCB0qmy3g_1746454747
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-441c96c1977so9112905e9.0
 for <qemu-trivial@nongnu.org>; Mon, 05 May 2025 07:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746454747; x=1747059547;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4uu0qpdVjEJLYHkdpL6Cd88hqPozAxAQGV8BMWT+hIg=;
 b=QI0bca5EPN5u91HzllvvVJtxRBTnmFFIKlFXLm63oA5Gp7wfv1JwkhmZtf87hVG+rG
 4i6XEwuzfh0fdVHswPtdF8rmvKopxfmfNBuECqhXEclwYfZIdC6x7MRWEbVTXZSxDu4p
 cxIB9jMudBfQDA7f61wudLZMXSWTt9qvgYdGQFjjwoGaeVexF9F+Cto6kVWZ8TNcZDbk
 V3D6ZucIvxCFkobwnvMifMb69JTg0zkak0dpq+5Koe7NW9Zt227WeRE2/yl87oH+qJ15
 5RRAbFGyzILkpT7sC7KGhy3i/XI8Hh0TegmvPoHA+t5ZszxXNF/W7wNTOEOL8nGeAJAs
 sVLQ==
X-Gm-Message-State: AOJu0Yx4wOV1gwJ2tmja9WFtEK+dSMELDHexYv7YkbHUJG/r4ruRlPXY
 zYBvzknzCxYukoTc1xT51DGoTvfLqO9FTqUND4bUqSAr5COjDern9AcldZV0aZocrNRVB0yNIml
 GNn5iMhgVW0OnJrVFwc5Jn+n8OiLkXl0MtfegJt/v+j7Tyf+0sWlEVUQ=
X-Gm-Gg: ASbGncu4ibOYFBy2L5pNJ1fix/XQkhVvhcfsVkT7NMu/xerFA6i1yjclCumYWsOf7YX
 yTmI/mmof9tyRkqxkMB50D+Sd+jC/uHGoVXP1TvRVgbpuxPupZ0NIGJhN+Wv9XxYDD2WJNH2kgw
 p7SQe5/Pdl/8fm1iQ1Q05v1vo846c4Z1VWgOF0PQzalJIoimkHNSduYfj6/emVyMbokBBMA45wZ
 aolDedPk47xtwgPprcomeGV6b9yBi5oUs1I0SVIwHn/9IcU4My14vK6Dsx5nyOhYUfCe97t7C1h
 q3C0oEP5focXdJHpomF42tBkdTEE+KDYVOsg2ajtSRN9FNGGGJ19neZzsuc=
X-Received: by 2002:a05:600c:1ca3:b0:43c:f969:13c0 with SMTP id
 5b1f17b1804b1-441cf5f650dmr1854785e9.29.1746454747263; 
 Mon, 05 May 2025 07:19:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4mjKibs+CFD2oZDhP1XAqbJIN77EpNUrrM/5e55fEdldptj+2OZW+0FyJaTS3WNTJC3nzVg==
X-Received: by 2002:a05:600c:1ca3:b0:43c:f969:13c0 with SMTP id
 5b1f17b1804b1-441cf5f650dmr1854585e9.29.1746454746842; 
 Mon, 05 May 2025 07:19:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b89ee39esm134307495e9.21.2025.05.05.07.19.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 07:19:05 -0700 (PDT)
Message-ID: <c66f47ae-ccb9-47b2-9bbe-fb1386958e6f@redhat.com>
Date: Mon, 5 May 2025 16:19:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH] hw/acpi/pcihp: Fix typo in function name
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-trivial@nongnu.org, philmd@linaro.org
References: <20250504215639.54860-10-gustavo.romero@linaro.org>
 <b0faa0cf-8c68-4385-923c-e761b6582cc0@redhat.com>
 <6523849b-b44c-4176-ba5f-78a606621eb6@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <6523849b-b44c-4176-ba5f-78a606621eb6@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gnIpQu4pY_gwovhf2traCCHcTJ5Ek7VtPOMQydWOxMA_1746454747
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.414,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 05 May 2025 14:19:19 -0000

Hi Gustavo,

On 5/5/25 2:29 PM, Gustavo Romero wrote:
> Hi Eric,
>
> On 5/5/25 04:13, Eric Auger wrote:
>>
>>
>> On 5/4/25 11:56 PM, Gustavo Romero wrote:
>>> Fix typo in QEMU's ACPI PCI hotplug API function name that checks
>>> whether a given bus is hotplug-capable.
>>>
>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>>
>> For awareness, there is a similar typo in pci-port.
>> see
>> https://lore.kernel.org/all/20250428102628.378046-2-eric.auger@redhat.com/
>>
>
> hmm it's unfortunate that I was about to publish a series to exactly
> enable the APCI PCI hotplug on ARM. Next time I should try to sync better
> with Red Hat folks on the work fronts...
Sorry to hear that. That's always a frustrating situation :-(
>
> I've skimmed through your RFC and it seems to be doing mostly of what I
> was doing for my series, so I'll reviewed it formally today, it should
> be quick.
I guess we may need to add some additional qtests for hotplug (just as
they have on x86). Maybe we can collaborate on this or you already have
some stuff under work.

Thanks

Eric
>
> Anyways, thanks for the heads up.
>
>
> Cheers,
> Gustavo
>
>> another trivial indentation fix in generic_event_device.c
>> https://lore.kernel.org/all/20250428102628.378046-3-eric.auger@redhat.com/
>>
>>
>> Eric
>>
>>
>>
>>
>>> ---
>>>   hw/acpi/acpi-pci-hotplug-stub.c | 2 +-
>>>   hw/acpi/ich9.c                  | 2 +-
>>>   hw/acpi/pcihp.c                 | 2 +-
>>>   hw/acpi/piix4.c                 | 2 +-
>>>   include/hw/acpi/pcihp.h         | 2 +-
>>>   5 files changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/acpi/acpi-pci-hotplug-stub.c
>>> b/hw/acpi/acpi-pci-hotplug-stub.c
>>> index b67b4a92da..b7bc6e40a1 100644
>>> --- a/hw/acpi/acpi-pci-hotplug-stub.c
>>> +++ b/hw/acpi/acpi-pci-hotplug-stub.c
>>> @@ -34,7 +34,7 @@ void acpi_pcihp_reset(AcpiPciHpState *s)
>>>   {
>>>   }
>>>   -bool acpi_pcihp_is_hotpluggbale_bus(AcpiPciHpState *s, BusState
>>> *bus)
>>> +bool acpi_pcihp_is_hotpluggable_bus(AcpiPciHpState *s, BusState *bus)
>>>   {
>>>       return true;
>>>   }
>>> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
>>> index c7a735bf64..a07c9d115b 100644
>>> --- a/hw/acpi/ich9.c
>>> +++ b/hw/acpi/ich9.c
>>> @@ -570,7 +570,7 @@ void ich9_pm_device_unplug_cb(HotplugHandler
>>> *hotplug_dev, DeviceState *dev,
>>>   bool ich9_pm_is_hotpluggable_bus(HotplugHandler *hotplug_dev,
>>> BusState *bus)
>>>   {
>>>       ICH9LPCState *lpc = ICH9_LPC_DEVICE(hotplug_dev);
>>> -    return
>>> acpi_pcihp_is_hotpluggbale_bus(&lpc->pm.acpi_pci_hotplug, bus);
>>> +    return
>>> acpi_pcihp_is_hotpluggable_bus(&lpc->pm.acpi_pci_hotplug, bus);
>>>   }
>>>     void ich9_pm_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList
>>> ***list)
>>> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
>>> index 5f79c9016b..aac90013d4 100644
>>> --- a/hw/acpi/pcihp.c
>>> +++ b/hw/acpi/pcihp.c
>>> @@ -371,7 +371,7 @@ void
>>> acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>>>       acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
>>>   }
>>>   -bool acpi_pcihp_is_hotpluggbale_bus(AcpiPciHpState *s, BusState
>>> *bus)
>>> +bool acpi_pcihp_is_hotpluggable_bus(AcpiPciHpState *s, BusState *bus)
>>>   {
>>>       Object *o = OBJECT(bus->parent);
>>>   diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
>>> index b16d45f03e..d98b80df6d 100644
>>> --- a/hw/acpi/piix4.c
>>> +++ b/hw/acpi/piix4.c
>>> @@ -406,7 +406,7 @@ static bool
>>> piix4_is_hotpluggable_bus(HotplugHandler *hotplug_dev,
>>>                                         BusState *bus)
>>>   {
>>>       PIIX4PMState *s = PIIX4_PM(hotplug_dev);
>>> -    return acpi_pcihp_is_hotpluggbale_bus(&s->acpi_pci_hotplug, bus);
>>> +    return acpi_pcihp_is_hotpluggable_bus(&s->acpi_pci_hotplug, bus);
>>>   }
>>>     static void piix4_pm_machine_ready(Notifier *n, void *opaque)
>>> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
>>> index ac21a95913..a97904bada 100644
>>> --- a/include/hw/acpi/pcihp.h
>>> +++ b/include/hw/acpi/pcihp.h
>>> @@ -58,7 +58,7 @@ typedef struct AcpiPciHpState {
>>>   void acpi_pcihp_init(Object *owner, AcpiPciHpState *, PCIBus *root,
>>>                        MemoryRegion *io, uint16_t io_base);
>>>   -bool acpi_pcihp_is_hotpluggbale_bus(AcpiPciHpState *s, BusState
>>> *bus);
>>> +bool acpi_pcihp_is_hotpluggable_bus(AcpiPciHpState *s, BusState *bus);
>>>   void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>>>                                      DeviceState *dev, Error **errp);
>>>   void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev,
>>> AcpiPciHpState *s,
>>
>


