Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rYXhq-0004wm-PF
	for mharc-qemu-trivial@gnu.org; Fri, 09 Feb 2024 15:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rYXhi-0004se-GB
 for qemu-trivial@nongnu.org; Fri, 09 Feb 2024 15:42:36 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rYXhg-0000Zt-Bz
 for qemu-trivial@nongnu.org; Fri, 09 Feb 2024 15:42:34 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40fe03cd1caso12588315e9.0
 for <qemu-trivial@nongnu.org>; Fri, 09 Feb 2024 12:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707511350; x=1708116150; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ItMis1CaqxmZp54x6Pd4rzKoT4YnPaqMBT6RmV6U6NE=;
 b=EANBwJeE1TnQdK+cWc7xaDGmwMLykP/LGS03tLFMIiRc/rzWfztSNLeULz97eL65bt
 lrXYQ/tUYM37Moviwr9Np0zBoV8/zBFEzViH90EiZOAZxGRIRXv9QawBFAI/wU/iwZV8
 JLZa3i4HrbDg78+hUBuP6x9JENSl/v9A51GsMpQ8gxe/8E3/yumAs5UuboQGJaHiq6Eh
 CJadmOpkm9P5J5Ejw2E0hj7geGBejGV28h4RIOIu03PJMcDRdul33pE+2pDhT1UgewcC
 yhy38IQxn1S31gczmZBmgM434Mh+V/8BsSdn3D6NcUcrYBZYv6QxGyIfbyJ4JjIUh2PJ
 0SLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707511350; x=1708116150;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ItMis1CaqxmZp54x6Pd4rzKoT4YnPaqMBT6RmV6U6NE=;
 b=AXrvD5+7HKMmaKmMsrpJVfatQStswYvkVgz8sDNriBMa6SghK1xrG2kq23kZJ7eaeG
 VTa/sJcwVryMC7nizjdVclAILFuIRL9SiwsNfl2xH/l/cUim7wIFr68m56IQ5E5SEFf9
 Mc26Obz5LTKIFUyuXi3urcOQQS9LxAujLELTjEKk0oY1+4VCUTdqOylTCg19GDMnofnB
 GPKPDX6usdn6oIVajPkwRoCEbULUn4TP0p9n0MhTxjbecxQjnJvmEN1xRUiyrDZBlGAk
 L7a2H/04x+bLOCwVPxj8ErrACDjI+H0cx/CcMXXgqKBMYepxRvXIv9ZzlSZ2v5dctL2f
 ZPEA==
X-Gm-Message-State: AOJu0Yz57YwidAAlnykQq80u0Lwbur02Cc1wqVt/M3e3fC+PeQ3Pa3m8
 NYNcBOHx9Zq+RAJ1vbd2Rmi+r0sTr7dp4T1EoAJEbj9WhIhYCeP+N/WXUEBYgb8=
X-Google-Smtp-Source: AGHT+IGhjtiVFCkBQ3Og4tdSfg9v8Eyt0Gxs4kEJAE7co6Bb0FA+3PAVtJve2wDNoeraW588drLnvA==
X-Received: by 2002:a05:600c:1c24:b0:410:5a48:c3ac with SMTP id
 j36-20020a05600c1c2400b004105a48c3acmr273752wms.0.1707511349676; 
 Fri, 09 Feb 2024 12:42:29 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWGlbN4iWX+HbjhlHdo5zvJn7inig99qoTBruVaKLcePm2tWCTol3IWE64D/UTGy2q79LToaVQRZRCZPek/GgmxlgMp8eA4KwkU+N0botgy1ev07PP3G3Niz3L0DAs+lLWEToxaSy63Vq+kQFhu69DPh7F7rlIBlGY7ShmCOeXDqoERm6DLppJZqbsAXoMvGuYG0L9YsyjVnsdMWlpS6BXE7ZAv0JogDoKdO2zfUPgl1HAcMaFYJ/SW
Received: from [192.168.69.100] ([176.176.147.207])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a05600c219a00b004107ab91f96sm1627256wme.8.2024.02.09.12.42.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Feb 2024 12:42:29 -0800 (PST)
Message-ID: <65fd4e10-c973-4f5a-b8dc-fb92a658732c@linaro.org>
Date: Fri, 9 Feb 2024 21:42:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/hppa/Kconfig: Fix building with "configure
 --without-default-devices"
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, Helge Deller <deller@gmx.de>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-stable@nongnu.org,
 qemu-trivial@nongnu.org
References: <20240209185506.248001-1-thuth@redhat.com>
 <41399ad8-006d-4480-919e-d64395c5cfe9@gmx.de>
 <e92171bc-1677-6132-abcb-d0699e6267b6@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <e92171bc-1677-6132-abcb-d0699e6267b6@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 09 Feb 2024 20:42:36 -0000

On 9/2/24 20:46, BALATON Zoltan wrote:
> On Fri, 9 Feb 2024, Helge Deller wrote:
>> On 2/9/24 19:55, Thomas Huth wrote:
>>> When running "configure" with "--without-default-devices", building
>>> of qemu-system-hppa currently fails with:
>>>
>>>   /usr/bin/ld: libqemu-hppa-softmmu.fa.p/hw_hppa_machine.c.o: in 
>>> function `machine_HP_common_init_tail':
>>>   hw/hppa/machine.c:399: undefined reference to `usb_bus_find'
>>>   /usr/bin/ld: hw/hppa/machine.c:399: undefined reference to 
>>> `usb_create_simple'
>>>   /usr/bin/ld: hw/hppa/machine.c:400: undefined reference to 
>>> `usb_bus_find'
>>>   /usr/bin/ld: hw/hppa/machine.c:400: undefined reference to 
>>> `usb_create_simple'
>>>   collect2: error: ld returned 1 exit status
>>>   ninja: build stopped: subcommand failed.
>>>   make: *** [Makefile:162: run-ninja] Error 1
>>>
>>> And after fixing this, the qemu-system-hppa binary refuses to run
>>> due to the missing 'pci-ohci' and 'pci-serial' devices. Let's add
>>> the right config switches to fix these problems.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   hw/hppa/Kconfig | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/hppa/Kconfig b/hw/hppa/Kconfig
>>> index ff8528aaa8..124d5e9e47 100644
>>> --- a/hw/hppa/Kconfig
>>> +++ b/hw/hppa/Kconfig
>>> @@ -6,7 +6,7 @@ config HPPA_B160L
>>>       select ASTRO
>>>       select DINO
>>>       select LASI
>>> -    select SERIAL
>>> +    select SERIAL_PCI
>>
>> I think the "SERIAL" is needed too for the B160L machine.
> 
> SERIAL_PCI selects SERIAL so I think it should be pulled in without 
> listing it separately but not sure what's the policy for these configs.

We prefer explicit dependencies.

SERIAL is for Lasi/Dino serial_mm_init().

Although pulling in SERIAL, SERIAL_PCI is for pci-serial*.

> Regards,
> BALATON Zoltan
> 
>> Other than that,
>>
>> Acked-by: Helge Deller <deller@gmx.de>
>>
>> Thank you!
>> Helge
>>
>>>       select ISA_BUS
>>>       select I8259
>>>       select IDE_CMD646
>>> @@ -16,3 +16,4 @@ config HPPA_B160L
>>>       select LASIPS2
>>>       select PARALLEL
>>>       select ARTIST
>>> +    select USB_OHCI_PCI
>>
>>
>>
> 


