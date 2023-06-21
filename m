Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qBsCa-0007O8-Kv
	for mharc-qemu-trivial@gnu.org; Wed, 21 Jun 2023 03:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qBsCX-0007Lo-RG
 for qemu-trivial@nongnu.org; Wed, 21 Jun 2023 03:24:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qBsCW-0005Ja-8T
 for qemu-trivial@nongnu.org; Wed, 21 Jun 2023 03:24:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687332263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xw5oVW0ioyxua/KLQz7cxNYsMkJmpVvqA39iPvp9m+E=;
 b=f5l7zR4hTjNOToMh1U5w355vFUHQ5X1JvP0/Bqom6er/nPzuaLATAT8A308xCWUq7CX9Bz
 /rqd7KBgYSAb2IzfkR60L5uS8jkHwY8jjomQoLL5U48G4iCzJtqgQn8S9serVXczoOyDza
 rctGstaqNcYCg4SsIhsYszZJp2ToOiQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-sJLe2l1kPF2LgeD3olenXA-1; Wed, 21 Jun 2023 03:24:19 -0400
X-MC-Unique: sJLe2l1kPF2LgeD3olenXA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f81dda24d3so101329125e9.1
 for <qemu-trivial@nongnu.org>; Wed, 21 Jun 2023 00:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687332258; x=1689924258;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xw5oVW0ioyxua/KLQz7cxNYsMkJmpVvqA39iPvp9m+E=;
 b=bvoTVDqYvHh/gmMGcN/cq16TxhLp2qfyyTUkrFbBLFYitJg2+B047YcGdRwXpzJR/e
 8VWoI2nNN/GkAtunMZQiX9fbX8fVd6y4BB270XpUPmE5w3Sbt288pAhAwbTSXs+qsk21
 ueKnTlQnry4xMZXWSmJlNsS+RlfDcao2ShfrUlpHafEQA1YUfHDXVTtlVWhdb80NdbOe
 PWDdr2wAnF7hnnnM5bOgVzdZA3BX2Igti539bmrSsGPTkNFtTVNsLYkUkLbZsdZZLmMM
 a5v5jGvtG7C7lnnhXVm51IL5xImnGwucwUSciqjjiHYc2cf8aL81lkSrT9qhffeLdDqS
 6mvQ==
X-Gm-Message-State: AC+VfDw9pruPlqnpEQW+YcpRXWegKdoI/5sdiYeZsMQu945vAoa0oZ0U
 1axpbGURS1Q3CiSXniFF/lxIBMGJytMgFBzOwY3a7abibmmMyAou2btACyL3AsWghlXtghwZsJ8
 SqcTah4esUXuXkIjeuw==
X-Received: by 2002:a05:600c:218d:b0:3f9:b8d0:1bfd with SMTP id
 e13-20020a05600c218d00b003f9b8d01bfdmr4257141wme.4.1687332258526; 
 Wed, 21 Jun 2023 00:24:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5WDbputscjvt79vGTPlMEwO+vGpk29NAtDsI2Z3qA5wtg0M9SnVKWIqaOPgvWDQxhT+gimJg==
X-Received: by 2002:a05:600c:218d:b0:3f9:b8d0:1bfd with SMTP id
 e13-20020a05600c218d00b003f9b8d01bfdmr4257132wme.4.1687332258221; 
 Wed, 21 Jun 2023 00:24:18 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a1cf70f000000b003f8d770e935sm15467560wmh.0.2023.06.21.00.24.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 00:24:17 -0700 (PDT)
Message-ID: <5e440af9-e0c6-ed13-c17a-ae069939ed67@redhat.com>
Date: Wed, 21 Jun 2023 09:24:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] hw/mips: Improve the default USB settings in the
 loongson3-virt machine
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230525064731.1854107-1-thuth@redhat.com>
 <5795da20-a2f6-e606-27bd-a23fc72346fc@redhat.com>
 <10ef6b88-0770-65bb-b6dd-217a5f731d14@tls.msk.ru>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <10ef6b88-0770-65bb-b6dd-217a5f731d14@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 21 Jun 2023 07:24:26 -0000

On 08/06/2023 20.31, Michael Tokarev wrote:
> 07.06.2023 13:26, Thomas Huth wrote:
>> On 25/05/2023 08.47, Thomas Huth wrote:
>>> It's possible to compile QEMU without the USB devices (e.g. when using
>>> "--without-default-devices" as option for the "configure" script).
>>> To be still able to run the loongson3-virt machine in default mode with
>>> such a QEMU binary, we have to check here for the availability of the
>>> devices first before instantiating them.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   The alternative would be to use a "#ifdef CONFIG_USB_OHCI_PCI" etc.
>>>   ... not sure what is nicer ... what do you think?
>>>
>>>   hw/mips/loongson3_virt.c | 10 +++++++---
>>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
>>> index 216812f660..a0afb17030 100644
>>> --- a/hw/mips/loongson3_virt.c
>>> +++ b/hw/mips/loongson3_virt.c
>>> @@ -447,10 +447,14 @@ static inline void 
>>> loongson3_virt_devices_init(MachineState *machine,
>>>       pci_vga_init(pci_bus);
>>> -    if (defaults_enabled()) {
>>> +    if (defaults_enabled() && module_object_class_by_name("pci-ohci")) {
>>>           pci_create_simple(pci_bus, -1, "pci-ohci");
>>> -        usb_create_simple(usb_bus_find(-1), "usb-kbd");
>>> -        usb_create_simple(usb_bus_find(-1), "usb-tablet");
>>> +        if (module_object_class_by_name("usb-kbd")) {
>>> +            usb_create_simple(usb_bus_find(-1), "usb-kbd");
>>> +        }
>>> +        if (module_object_class_by_name("usb-tablet")) {
>>> +            usb_create_simple(usb_bus_find(-1), "usb-tablet");
>>> +        }
> 
> It looks like kbd/tablet don't need to have an if around, because
> hw/usb/usb-hid.c is always compiled when CONFIG_USB is enabled,
> and enabling CONFIG_USB_OHCI automatically selects CONFIG_USB.

Oh, right! So this can be simplified, indeed.

> I guess this whole code can be guarded by #if CONFIG_USB_OHCI..#endif,
> instead of using runtime checking of device availability.

Yes, that's the alternative ... I'll respin the patch with that to see how 
it looks like.

> Notes:
> 
> Other places don't check if ohci or other usb controllers are available.

Those likely use "select" instead of "imply" in their Kconfig, so the OHCI 
controller is always included.

> We have TYPE_PCI_OHCI #define which isn't used in places where pci-ohci
> is requested, - probably need to move it to a common header (it is
> defined in hw/usb/hcd-ohci-pci.c now).

Yes, sounds like a cleanup that could be done in an additional patch.

> roms/config.seabios-128k turns USB_OHCI off.

That's the config of the seabios ROM - not (directly) related to the config 
of the QEMU binaries.

  Thomas


