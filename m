Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E438FF886F
	for <qemu-trivial@archiver.kernel.org>; Thu, 30 Apr 2026 09:51:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wIO2h-00055C-NN; Thu, 30 Apr 2026 05:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wIO2d-00054B-PU
 for qemu-trivial@nongnu.org; Thu, 30 Apr 2026 05:50:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wIO2S-0007hY-MX
 for qemu-trivial@nongnu.org; Thu, 30 Apr 2026 05:50:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1777542627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MDnV0AY4VlGUr+gAszDJ3VsPdCUUQsGfr2dowpSPiYo=;
 b=chKQP5EJW3L24cQ8I8Had3O1ugpKhxvKxjABK7+ICE17V7TBzbNfiuscykaWAX2IkXYBwx
 3TQ83U5Sn2dG7esmRua9h8+50qwfTDG4kU5145kNptC1q3sCsP4DBg0raHXKGuB66WeWHI
 RdjR0c8gttPRYE+gdkf2otqUQzIm6j0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-RgqiCnHMPySfmMj0RS3VDw-1; Thu, 30 Apr 2026 05:50:25 -0400
X-MC-Unique: RgqiCnHMPySfmMj0RS3VDw-1
X-Mimecast-MFC-AGG-ID: RgqiCnHMPySfmMj0RS3VDw_1777542625
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8a5f6110c1cso18742426d6.0
 for <qemu-trivial@nongnu.org>; Thu, 30 Apr 2026 02:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777542624; x=1778147424;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MDnV0AY4VlGUr+gAszDJ3VsPdCUUQsGfr2dowpSPiYo=;
 b=RlixL3w12Wmho2VMBU1e6inCrymq/hjWI5yj3hwXQ1UNan4n+SyAZ1aqWQ8jUqfLwM
 g4d1blx6Ph6RSDsRl8+gdFwX5DmoyOwZTexW5blyahYM3RVN9fcoZCNGTTJePOvqpWO4
 eVVMmxE/PchTgycKU1B8zQTfmxYeIdQ8vw4Y7fm9QS8zAUVa5Szx67YxF5RusuRUGuHS
 b1wQvpUFRVCbhDi4lfC3R7kBOW1d5q4sCsaEEkxomGFQGTEsMK3GZgJ2sOXIeavEVHJe
 sQ1mWvn/Y9/PGBTNaB5akurp3j0VIEU5VRu5yYlSiEQl5bOXQNmGZ0o1JaHyBmpzUKxw
 uffA==
X-Forwarded-Encrypted: i=1;
 AFNElJ98OinsB6k0WIcPzJpW+GtZ3j1XvxdK62fPhCvJsHYcYHwRY5YHMwtM3xk7UyOWz/s83AgI1Lu9mNyyb04=@nongnu.org
X-Gm-Message-State: AOJu0Yyt5MhAn1xlYPPZkIgnfA3gpcG7nxT1/YoaBh6mNxfa825RuHOj
 yO6eCTXTs3lKHRj0Rnw1DGNkw+EZbeOpJiiZjrq5zg69AmP78eeONbatoatnw6lliHE+JrTGif9
 joEHNaHOeQO4jtpW+pw0P/DYVyBbCpfG5SJUHeYU+0il92Sh3Jk4cxpJwBrk=
X-Gm-Gg: AeBDieu1ZsszSsRA1EnwvNK7RpcxghzvbJuCbmpNeXGsTfs3FRWT3iSvrLI8hIkXCfb
 CXjASIwRX+M2vcs7kjAm8lfA989324FYh2I7OE57t56vrqA529QT36szDWo3zwiIzTIgWWTQ9x7
 g9ZGOqZW75XPcp5QPwPYcZT6qc/LdWOLNWj1pmsoGKT6dLV61vEOKNdxE8oq0FzmNNo9qY01cWz
 fiDGCoO7RJ0PI/jy9I4qtSardY95Wy9uVukdhID1WDbQa4HSDwksyFSOOo56xlmLVlyNnppamEH
 OGfCxhxnYYI5zZDH/1YXniuuipSl6AVLQfrzEsA+rZxVB/a1f20zuhQtbLfRLqmvX7gfU4WYSb8
 OrkVAWG9eNrb7tdkP0+rmw6+zJ1m1Qq7UU8fuoXAQRU/QBYJg0h8ZB5cXXQ==
X-Received: by 2002:a05:6214:3d0b:b0:89c:5110:751a with SMTP id
 6a1803df08f44-8b3fecf1fbdmr29745616d6.44.1777542624627; 
 Thu, 30 Apr 2026 02:50:24 -0700 (PDT)
X-Received: by 2002:a05:6214:3d0b:b0:89c:5110:751a with SMTP id
 6a1803df08f44-8b3fecf1fbdmr29745066d6.44.1777542624093; 
 Thu, 30 Apr 2026 02:50:24 -0700 (PDT)
Received: from [10.33.192.176] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b3ff32ee6asm13743456d6.19.2026.04.30.02.50.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2026 02:50:23 -0700 (PDT)
Message-ID: <00c4ab4b-a58b-4de4-8e41-566b2cb7f920@redhat.com>
Date: Thu, 30 Apr 2026 11:50:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/sparc64/sun4u: Mark unusable PCI busses as full to
 ease device plugging
From: Thomas Huth <thuth@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Cc: Artyom Tarasenko <atar4qemu@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20260309181452.83702-1-thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260309181452.83702-1-thuth@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: D1jmCqZv5NQV3ESSZ9hlT-FJTAwuRQ3rCicFacnnVxQ_1777542625
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On 09/03/2026 19.14, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> When trying to plug a PCI device to a Sparc64 machine, you currently
> have to specify the right bus ("bus=pciB"), otherwise you get this error:
> 
>   $ qemu-system-sparc64 -device virtio-scsi-pci
>   qemu-system-sparc64: -device virtio-scsi-pci: PCI: no slot/function
>   available for virtio-scsi-pci, all in use or reserved
> 
> This is quite annoying for the unexperienced users, and it also breaks
> e.g. the iotests ("make check-block") when running with qemu-system-sparc64.
> 
> Mark the non-usable PCI busses as full now, so that QEMU can automatically
> plug new PCI devices to the right "pciB" bus.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   v2: Do the change in the machine code, not in the sabre device
> 
>   hw/sparc64/sun4u.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> index b8bda1eb816..37539535c6c 100644
> --- a/hw/sparc64/sun4u.c
> +++ b/hw/sparc64/sun4u.c
> @@ -723,6 +723,13 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
>       fw_cfg_add_i16(fw_cfg, FW_CFG_SPARC64_DEPTH, graphic_depth);
>   
>       qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
> +
> +    /*
> +     * Mark internal PCI busses as full so that the plugging of additional
> +     * PCI devices happens on the right bus that still has free slots:
> +     */
> +    qbus_mark_full(&pci_bus->qbus);
> +    qbus_mark_full(&pci_busA->qbus);
>   }
>   
>   enum {

Friendly ping!

  Thomas


