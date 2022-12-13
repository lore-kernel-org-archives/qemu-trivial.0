Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p52Hu-0004W0-PW
	for mharc-qemu-trivial@gnu.org; Tue, 13 Dec 2022 05:13:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p52Hs-0004Uv-09
 for qemu-trivial@nongnu.org; Tue, 13 Dec 2022 05:13:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p52Hq-0006DC-B9
 for qemu-trivial@nongnu.org; Tue, 13 Dec 2022 05:13:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670926401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FHWEHwVVw7Pw9jmJYkf6Kr42QN3O0j3WL0+9ASu8Srk=;
 b=anxqdEWEmAjQjxAmPsMZlBKWcEF8NfEbIcQYd+x8hHzRXL2I2+LV3WpXY1KPOwYbTUO3Gq
 rjn4fMGakFZdCh81led6qlPvD+REc5A/vd+/5+FGVXAMMS3l2/na1jG4SJFQGR9A+RfHYN
 lCIpd31ayh4jFJevU6ww1imlq0yBO2A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-194-uS9m1c4lOhWnl_CDubcZxQ-1; Tue, 13 Dec 2022 05:13:20 -0500
X-MC-Unique: uS9m1c4lOhWnl_CDubcZxQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 o34-20020a05600c512200b003d07ee4a667so506747wms.0
 for <qemu-trivial@nongnu.org>; Tue, 13 Dec 2022 02:13:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FHWEHwVVw7Pw9jmJYkf6Kr42QN3O0j3WL0+9ASu8Srk=;
 b=SlunSoUGbaQR+XMtFN7HJS/J9O++qy95zcpNqcstoCvQHvCy+98B0sqA1ygKlzE0g0
 jMNIgOX/It34mI00RW8xZcDQO3CBPOjSODdj1kqg3ZcVu+cBGcAWd658k/RdFgxILELg
 mAd2afgo65sG7TKuVS9massgQz6mEejF9WpFBS45wY+XwGNXf3Q9T0+OwebRCTMe9JeV
 fMrgIdK/JxcFXW0gCUCEq5LXzx0yhZZw9Hj134Wn5p09pW2IlJAVMt5GKT1OOrvogrEu
 Omz/z/iyay6oj7YYTxqsXqt9JNxQsZWsGDk/zAs49PknzpsIpknB0YvNuCxBPi807gnp
 IV0w==
X-Gm-Message-State: ANoB5pnnJYu7uDppSTrMsBxD9Ioq4CkxXtccw1+IzpuD5/C+ibJLaSWb
 elS92R1CUjO4l4rhvAaXg7z4Jzl2mr3Sbp13anSbPELONx0yI24f9T7w4h4SBGIRCdFSdexBClr
 nuZpfqbxLkqsVXarZVQ==
X-Received: by 2002:a05:600c:4f85:b0:3c6:f732:bf6f with SMTP id
 n5-20020a05600c4f8500b003c6f732bf6fmr15543316wmq.13.1670926398929; 
 Tue, 13 Dec 2022 02:13:18 -0800 (PST)
X-Google-Smtp-Source: AA0mqf62NFfQ9f/82zDd72BcAX1Pki6B+mdXssYkvIbW0YCU+3R/GIcPZsunzZHBNd5SFGBkE79GrA==
X-Received: by 2002:a05:600c:4f85:b0:3c6:f732:bf6f with SMTP id
 n5-20020a05600c4f8500b003c6f732bf6fmr15543288wmq.13.1670926398554; 
 Tue, 13 Dec 2022 02:13:18 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-131.web.vodafone.de.
 [109.43.178.131]) by smtp.gmail.com with ESMTPSA id
 n22-20020a05600c3b9600b003cfd0bd8c0asm13513694wms.30.2022.12.13.02.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 02:13:18 -0800 (PST)
Message-ID: <ccaea070-db7f-c25d-96ec-6a2471536a32@redhat.com>
Date: Tue, 13 Dec 2022 11:13:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20221213095144.42355-1-thuth@redhat.com>
 <59a252ed-6cea-1966-97be-85e13a6e582f@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] hw: Include the VMWare devices only in the x86 targets
In-Reply-To: <59a252ed-6cea-1966-97be-85e13a6e582f@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Tue, 13 Dec 2022 10:13:24 -0000

On 13/12/2022 11.01, Philippe Mathieu-Daudé wrote:
> On 13/12/22 10:51, Thomas Huth wrote:
>> It seems a little bit weird that the para-virtualized x86 VMWare
>> devices "vmware-svga" and "vmxnet3" also show up in non-x86 targets.
>> They are likely pretty useless there (since the guest OSes likely
>> do not have any drivers for those enabled), so let's change this and
>> only enable those devices by default for the classical x86 targets.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   ...ate-Pseudo-encoding.txt => vnc-ledstate-pseudo-encoding.rst} | 0
>>   rename docs/interop/{vnc-ledstate-Pseudo-encoding.txt => 
>> vnc-ledstate-pseudo-encoding.rst} (100%)
>>
>> diff --git a/docs/interop/vnc-ledstate-Pseudo-encoding.txt 
>> b/docs/interop/vnc-ledstate-pseudo-encoding.rst
>> similarity index 100%
>> rename from docs/interop/vnc-ledstate-Pseudo-encoding.txt
>> rename to docs/interop/vnc-ledstate-pseudo-encoding.rst
> 
> Unrelated change ;)

Yeah, sorry, just noticed it after sending the patch ... please ignore that 
part.

>> diff --git a/hw/display/Kconfig b/hw/display/Kconfig
>> index a1b159becd..7b3da68d1c 100644
>> --- a/hw/display/Kconfig
>> +++ b/hw/display/Kconfig
>> @@ -55,7 +55,7 @@ config VGA_MMIO
>>   config VMWARE_VGA
>>       bool
>> -    default y if PCI_DEVICES
>> +    default y if PCI_DEVICES && PC_PCI
>>       depends on PCI
>>       select VGA
>> diff --git a/hw/net/Kconfig b/hw/net/Kconfig
>> index 6d795ec752..1cc1c5775e 100644
>> --- a/hw/net/Kconfig
>> +++ b/hw/net/Kconfig
>> @@ -51,7 +51,7 @@ config RTL8139_PCI
>>   config VMXNET3_PCI
>>       bool
>> -    default y if PCI_DEVICES
>> +    default y if PCI_DEVICES && PC_PCI
>>       depends on PCI
> 
> I'm not sure what PC_PCI is for, it seems inherited from the
> first Makefile conversion.
> 
> Are you sure you want to build this by default if the PC
> machine is selected? An user could select it an non-X86 arch.
> 
> Maybe we want:
> 
> -       depends on PCI
> +       depends on PCI && (I386 || X86_64)
> 
> ?

It does not seem to be a hard dependency - apparently the devices compile 
fine for non-x86 and I can also run:

  qemu-system-ppc64 -device vmware-vga -device vmxnet3

and the guest sees these two PCI devices - it just can't use them since it 
has no drivers.

So for the unlikely case that someone still wants to use these devices on 
non-x86 machines, I think it's better to add the test to the "default y" 
line instead of the "depends on" line, so that users still have a chance to 
enable it in their config file before compiling.

  Thomas


