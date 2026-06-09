Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983CCCD8CAD
	for <qemu-trivial@archiver.kernel.org>; Tue,  9 Jun 2026 06:03:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wWpYB-0000IU-5w; Tue, 09 Jun 2026 02:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wWpY5-0000Hc-Js
 for qemu-trivial@nongnu.org; Tue, 09 Jun 2026 02:02:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wWpY3-00074p-Pd
 for qemu-trivial@nongnu.org; Tue, 09 Jun 2026 02:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780984970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+WsFTeva9DDVqKdZDqTnWrW1+2BsUsih7ugLigDjlKU=;
 b=dFqK2qMAWxv1g9ovJNwJbFIJP5tdNN0ZJc5wrHsN4dO2JeJule76EYV455D7JVAmKb08bw
 GVGWVPd7Zz6sWI5SiNtoIpeRWZLLoxBoAPuj2pKXGqO8+lMbH+xFDXNQTBXc1+CDPtV5rq
 VhlEHC7O43znWwjJAQsUxlj9tlQidJ4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-ztl1uiYROROZ9y35ifmNYA-1; Tue, 09 Jun 2026 02:02:48 -0400
X-MC-Unique: ztl1uiYROROZ9y35ifmNYA-1
X-Mimecast-MFC-AGG-ID: ztl1uiYROROZ9y35ifmNYA_1780984967
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-45ef5e38a18so2309697f8f.1
 for <qemu-trivial@nongnu.org>; Mon, 08 Jun 2026 23:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780984967; x=1781589767;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+WsFTeva9DDVqKdZDqTnWrW1+2BsUsih7ugLigDjlKU=;
 b=Yy30vf6goY0DRGJUBZ0QyzjKXI8gv699yFaltZ4YIUlD7E0RKs/5AOJJ9jOBtG6CH9
 qHyAUdA2jbEeykJLdYzJwPgG6Lw4shBEwguzTI6WFkFZbMkHwUvg07W+/KyDJaOqvGbv
 eXvp8tKF9kCquXJL7AMacNGL17il5keoJEliLT+eRQ2kTsT1cCCHQ3Xx//IayPL8v2o9
 Xn/IW4yo5fbXoGKN+A/ydAY4rhLNYdlKfxCJwJupPGlg4tR0ccGLWRaG7Aad6xvmcDrQ
 oNKRo0zNdheFRG1PgzyiFETtSRAp2RB6P/1yodOBMzQxUMPqSdrA7GTC8myuzzsvwzhf
 NIhg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+KoXcJOfE1NmYUynjdSehEvdhrvZ6WC72jUQOS30bgiCH8sKcoyU+9iAdoLutKFPNDWRix7mjnfcYBlxU=@nongnu.org
X-Gm-Message-State: AOJu0YyNI2iDA3t84OrPrsDEZu4fJ4ksTgzAlcUsK3Fgcx2JoeLh1kQY
 21CPbRar4cwy2+paID8YAHiTVKrBdQ0UWZ3YIJoLAb4INa6Mfaz/iuGw3C5chGhTCs/yCwocpHn
 5BQH0a/1d5MMPCWjM5L+aFZ4AsYWn5aUIUQYzFTArQLw3NBrgA6vOIZ1H9qo=
X-Gm-Gg: Acq92OFLQZUcDzxtgK1kkM81h3duIpNR2GCN2sJ0bbMu7XPLClb9FL2PU4x0ds/OQe1
 hc4fhN0ANyL0Sfd4vuP/uCK8pqxPw0h2SKjL5gYAgD2lf+emJlyGfvhuTLIeanFFF199SUduI6R
 EF02eZoB3zPAhoTHEiZgoCPKyA5B/2BtqQ379A0TkTm7CBVr//Q42A+cDBjH+VHsPHCIkTuvrdW
 GfxULB2UDMzYQ6avNj6Ap1+oIAxYv0+AZa2BBThyVoaDhYtKD2OsggMece3UczwTgZy3z2e6Th+
 JM9Ix9kv/QDXjw6LnzqHjQ6FqoErROPleDsPJJn8q7m48/Z1lobDENvXEcCA9xz/ctgX11Pa/UD
 U2YIg7gwFrYgfou2MECjVaxVGN/1Vlw==
X-Received: by 2002:a05:6000:18a5:b0:460:1967:abed with SMTP id
 ffacd0b85a97d-4603063c55dmr27690098f8f.39.1780984967024; 
 Mon, 08 Jun 2026 23:02:47 -0700 (PDT)
X-Received: by 2002:a05:6000:18a5:b0:460:1967:abed with SMTP id
 ffacd0b85a97d-4603063c55dmr27690048f8f.39.1780984966599; 
 Mon, 08 Jun 2026 23:02:46 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.113.132])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f360bd6sm63181988f8f.36.2026.06.08.23.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2026 23:02:45 -0700 (PDT)
Message-ID: <df7a091c-a8a1-416a-acf3-28a0cbd8dd2f@redhat.com>
Date: Tue, 9 Jun 2026 08:02:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/sparc64/sun4u: Mark unusable PCI busses as full to
 ease device plugging
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: Artyom Tarasenko <atar4qemu@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20260309181452.83702-1-thuth@redhat.com>
 <00c4ab4b-a58b-4de4-8e41-566b2cb7f920@redhat.com>
 <124bd918-f2ab-43e2-bd2d-fc824de62c40@tls.msk.ru>
 <fcbe3d7f-64d4-4b13-b930-a81e77db4784@ilande.co.uk>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <fcbe3d7f-64d4-4b13-b930-a81e77db4784@ilande.co.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BC1ovb3GZ46Lbaw1vGHevzHa04fgKQqpbnP_Qrn-e24_1780984967
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On 08/06/2026 23.29, Mark Cave-Ayland wrote:
> On 08/06/2026 09:26, Michael Tokarev wrote:
> 
>> On 30.04.2026 12:50, Thomas Huth wrote:
>>> On 09/03/2026 19.14, Thomas Huth wrote:
>>>> From: Thomas Huth <thuth@redhat.com>
>>>>
>>>> When trying to plug a PCI device to a Sparc64 machine, you currently
>>>> have to specify the right bus ("bus=pciB"), otherwise you get this error:
>>>>
>>>>   $ qemu-system-sparc64 -device virtio-scsi-pci
>>>>   qemu-system-sparc64: -device virtio-scsi-pci: PCI: no slot/function
>>>>   available for virtio-scsi-pci, all in use or reserved
>>>>
>>>> This is quite annoying for the unexperienced users, and it also breaks
>>>> e.g. the iotests ("make check-block") when running with qemu-system- 
>>>> sparc64.
>>>>
>>>> Mark the non-usable PCI busses as full now, so that QEMU can automatically
>>>> plug new PCI devices to the right "pciB" bus.
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>   v2: Do the change in the machine code, not in the sabre device
>>>>
>>>>   hw/sparc64/sun4u.c | 7 +++++++
>>>>   1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
>>>> index b8bda1eb816..37539535c6c 100644
>>>> --- a/hw/sparc64/sun4u.c
>>>> +++ b/hw/sparc64/sun4u.c
>>>> @@ -723,6 +723,13 @@ static void sun4uv_init(MemoryRegion 
>>>> *address_space_mem,
>>>>       fw_cfg_add_i16(fw_cfg, FW_CFG_SPARC64_DEPTH, graphic_depth);
>>>>       qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
>>>> +
>>>> +    /*
>>>> +     * Mark internal PCI busses as full so that the plugging of additional
>>>> +     * PCI devices happens on the right bus that still has free slots:
>>>> +     */
>>>> +    qbus_mark_full(&pci_bus->qbus);
>>>> +    qbus_mark_full(&pci_busA->qbus);
>>>>   }
>>>>   enum {
>>>
>>> Friendly ping!
>>
>> This, being a simple change, somehow has not been reviewed still, so
>> it's sitting in the queue...
> 
> Yes, apologies - I've been absolutely flat out recently, and I've got a note 
> to take a look at this and Peter's patch as soon as I can.
> 
> Is this fixing an urgent issue with "make check-block" or similar?

It's not urgent since this has been broken forever, but yes, it fixes "make 
check-block" for the case where sparc64 is the only available target during 
"configure --target-list=sparc64-softmmu" and thus the iotests run with 
qemu-system-sparc64.

  Thomas


