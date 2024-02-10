Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rYpvS-0006cf-6D
	for mharc-qemu-trivial@gnu.org; Sat, 10 Feb 2024 11:09:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rYpvQ-0006c1-Ls
 for qemu-trivial@nongnu.org; Sat, 10 Feb 2024 11:09:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rYpvO-0008Lg-VL
 for qemu-trivial@nongnu.org; Sat, 10 Feb 2024 11:09:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707581393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/+S1kXbhP3jg4RlPaLzanW5bFCzpiWVAgBo6WUduKwQ=;
 b=M7DLC9WAjDYI3Zi3WQqudLy9j04AYzuyXyiOJVa76o1Gb0HEGllFLDwaGA7m22H46bGhf9
 hbwg+U45SDG5m4cpPSBmDdTv/pssTd8QpKughS75+auF2DwZGAX+Hz+fYU6MDsXo0LiV9w
 hzNFn8NpHCu03YsDgdlarpqkbnfV/P8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-i6_yhDlaPQKP2y7C9Tr5cA-1; Sat, 10 Feb 2024 11:09:51 -0500
X-MC-Unique: i6_yhDlaPQKP2y7C9Tr5cA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a3bdd99a243so145827866b.0
 for <qemu-trivial@nongnu.org>; Sat, 10 Feb 2024 08:09:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707581390; x=1708186190;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/+S1kXbhP3jg4RlPaLzanW5bFCzpiWVAgBo6WUduKwQ=;
 b=WDZlrCWtVG42bGB+grhYsn6Qcl0fnopMQ+EWZidy5bcPzAqsU/NWrPG4pczgJbXuxf
 2KG+wLkZaD+G48iHhrIx/B+kSzTZLebx7Af1Ssot4dZMgZg7GimKw5eNDCtaIfwJdrg+
 sv0E/JtccZhatlXNT8hNjVervwaOXYPoBG6cR9KAc3Ify59hYT7icBawfCr6iJmBA5X4
 iqAr3LW9bu6aqzPo0YYlR0bwhj7vPWdLeYfE6EIEczxscM24nd6JKY2gPCKd6VeVMvTE
 3yicqS6RcDQoLCU0tCIW+keF2bI17aaogIods9b7/d9iy0BmaTDiIzMR+MTj1UH3rBlK
 MuZQ==
X-Gm-Message-State: AOJu0YxNQfAL3TBhLqUuW8Afh1hAI0Qd2ama3Ba1Za3tHhbuguI7e37X
 gLf4L6th3qY4jEWwqc3HV2dNorFB+iri1ww6pVg5s66fpNbJfKEcoAUzP1o+NsNn9NYgYxw9s6N
 i2Y3M44dE7OFoSHc4sxqkyoAIXqLhUN7JEOJG/u5TlZyxdlpCSTRYGN8=
X-Received: by 2002:a17:906:1689:b0:a3b:fe65:741f with SMTP id
 s9-20020a170906168900b00a3bfe65741fmr2009733ejd.31.1707581390442; 
 Sat, 10 Feb 2024 08:09:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkqFWoGNkL/PsE4Eci03116Vinr9QJpWYFoVNZLSuDUKPJjJqrzsXl4onJPwwnkWdva+FHEA==
X-Received: by 2002:a17:906:1689:b0:a3b:fe65:741f with SMTP id
 s9-20020a170906168900b00a3bfe65741fmr2009717ejd.31.1707581390045; 
 Sat, 10 Feb 2024 08:09:50 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWDFruK2uU9iOTuWoXU5tnwA4DeVtysDTpAa69urE4XzdBUmzs5LlTT81UsvkQ+t7Zy5yhGavEKDP3u+0mdH3gSlXDapkXbXPJuRaV/Y+waVPEchjkkijPtk/dwP/p4CuMKaVHNboOA5UuSdtHPrAdNBVi9A3C4+O1DxH0lXsx85K0h68c8d2fYbRqpGu1AYd3LbF9Zo4UtR0/WIwTlBoI/yTRmMMfK6Xkg7yq3TJcwAtHqODHO
Received: from [192.168.0.9] (ip-109-43-177-145.web.vodafone.de.
 [109.43.177.145]) by smtp.gmail.com with ESMTPSA id
 e17-20020a170906081100b00a3c465661ecsm426460ejd.27.2024.02.10.08.09.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Feb 2024 08:09:49 -0800 (PST)
Message-ID: <3f12377d-31ed-48cb-9a8d-c0625057cf63@redhat.com>
Date: Sat, 10 Feb 2024 17:09:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/hppa/Kconfig: Fix building with "configure
 --without-default-devices"
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Helge Deller <deller@gmx.de>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-stable@nongnu.org,
 qemu-trivial@nongnu.org
References: <20240209185506.248001-1-thuth@redhat.com>
 <41399ad8-006d-4480-919e-d64395c5cfe9@gmx.de>
 <e92171bc-1677-6132-abcb-d0699e6267b6@eik.bme.hu>
 <65fd4e10-c973-4f5a-b8dc-fb92a658732c@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <65fd4e10-c973-4f5a-b8dc-fb92a658732c@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.451,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Sat, 10 Feb 2024 16:09:56 -0000

On 09/02/2024 21.42, Philippe Mathieu-Daudé wrote:
> On 9/2/24 20:46, BALATON Zoltan wrote:
>> On Fri, 9 Feb 2024, Helge Deller wrote:
>>> On 2/9/24 19:55, Thomas Huth wrote:
>>>> When running "configure" with "--without-default-devices", building
>>>> of qemu-system-hppa currently fails with:
>>>>
>>>>   /usr/bin/ld: libqemu-hppa-softmmu.fa.p/hw_hppa_machine.c.o: in 
>>>> function `machine_HP_common_init_tail':
>>>>   hw/hppa/machine.c:399: undefined reference to `usb_bus_find'
>>>>   /usr/bin/ld: hw/hppa/machine.c:399: undefined reference to 
>>>> `usb_create_simple'
>>>>   /usr/bin/ld: hw/hppa/machine.c:400: undefined reference to `usb_bus_find'
>>>>   /usr/bin/ld: hw/hppa/machine.c:400: undefined reference to 
>>>> `usb_create_simple'
>>>>   collect2: error: ld returned 1 exit status
>>>>   ninja: build stopped: subcommand failed.
>>>>   make: *** [Makefile:162: run-ninja] Error 1
>>>>
>>>> And after fixing this, the qemu-system-hppa binary refuses to run
>>>> due to the missing 'pci-ohci' and 'pci-serial' devices. Let's add
>>>> the right config switches to fix these problems.
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>   hw/hppa/Kconfig | 3 ++-
>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/hppa/Kconfig b/hw/hppa/Kconfig
>>>> index ff8528aaa8..124d5e9e47 100644
>>>> --- a/hw/hppa/Kconfig
>>>> +++ b/hw/hppa/Kconfig
>>>> @@ -6,7 +6,7 @@ config HPPA_B160L
>>>>       select ASTRO
>>>>       select DINO
>>>>       select LASI
>>>> -    select SERIAL
>>>> +    select SERIAL_PCI
>>>
>>> I think the "SERIAL" is needed too for the B160L machine.
>>
>> SERIAL_PCI selects SERIAL so I think it should be pulled in without 
>> listing it separately 

Yes, that was my thinking when I replaced it.

> We prefer explicit dependencies.
> 
> SERIAL is for Lasi/Dino serial_mm_init().
> 
> Although pulling in SERIAL, SERIAL_PCI is for pci-serial*.

Ok, I can respin the patch to add SERIAL_PCI in addition instead of 
replacing SERIAL.

  Thomas


>> Regards,
>> BALATON Zoltan
>>
>>> Other than that,
>>>
>>> Acked-by: Helge Deller <deller@gmx.de>
>>>
>>> Thank you!
>>> Helge
>>>
>>>>       select ISA_BUS
>>>>       select I8259
>>>>       select IDE_CMD646
>>>> @@ -16,3 +16,4 @@ config HPPA_B160L
>>>>       select LASIPS2
>>>>       select PARALLEL
>>>>       select ARTIST
>>>> +    select USB_OHCI_PCI
>>>
>>>
>>>
>>
> 


