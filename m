Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42232C5516D
	for <qemu-trivial@archiver.kernel.org>; Fri, 31 Jul 2026 11:16:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wplEH-0000Ww-Cf; Fri, 31 Jul 2026 07:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wplEA-0000VM-8M
 for qemu-trivial@nongnu.org; Fri, 31 Jul 2026 07:16:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wplE8-0001G3-Fd
 for qemu-trivial@nongnu.org; Fri, 31 Jul 2026 07:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1785496589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=GdWtbUahspZk4iHO3/6745Tf8kqHgAYaLLC7wwzgq1E=;
 b=FS4rXI3lkzqORUkvkXe2Y461BVV0IRoaLPRPglWUNUan54dGeFdFkspRckq4xPuy39rjts
 Xo8VN60TcG9isjaKw/95flJ761NhWSwyNYQM2/tNbTB60QDB7okJ2+pYs2Dr4HXh4ORqZ8
 36fuxsYfxYegx5w3yTVLGpdqc77dG8Y=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-nYXpSE4xMjCJ6SXUtrEKVQ-1; Fri, 31 Jul 2026 07:16:28 -0400
X-MC-Unique: nYXpSE4xMjCJ6SXUtrEKVQ-1
X-Mimecast-MFC-AGG-ID: nYXpSE4xMjCJ6SXUtrEKVQ_1785496587
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-c15fed5653eso63022666b.2
 for <qemu-trivial@nongnu.org>; Fri, 31 Jul 2026 04:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785496587; x=1786101387;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GdWtbUahspZk4iHO3/6745Tf8kqHgAYaLLC7wwzgq1E=;
 b=Y65LJNhfSJdHx5e4DdiTethnrrJicnCavA9jwc3fIHLH8qv9hdhkmoPwJdol4AuFRz
 sbuIHUEvgJYOW418z+UTkdBlsZVlz/3KXyIuPSquiOByugX1kWN8ehyQAGXJJLIVKg6W
 Qyi/drFQdUmi4SVhWJn4TnWbwwAEFPk9hiqNQI+MWOLFMiOPtuqcqOq4Mz9UovG1EVod
 9YBo9ApwBSKIiR9jlEt8KGp6bhFAMom0FBI3EeUZ6dFpOEAAOvMi/Yz5BI+IWtSILW5H
 QiVSheKej3PJ2XqGoXo22D62CdJBLOdCYX4zyK2s4ZOqj3OEd+1M7VZ9cCAHWXdizEOc
 jS1w==
X-Forwarded-Encrypted: i=1;
 AHgh+RrPuPdPoO/JifGDdvESu8SU8tF+/x9Nujx/WimG7q2KjSES8Uxsseeg9HuiwxXESfam8B1Jh+Qsek5PONc=@nongnu.org
X-Gm-Message-State: AOJu0YzC+Z5rsgbMm6RYERhbwrIgRIVqszqEP6W5lG2wtrv8zUV9qkKx
 lCHwEQbziEjLavJII/WKrqlOIqdDUUpBIFDM5EOI42tpJPtwHUNU21QMe/bsd65Gl+XyoT1+F96
 PQ4y2pqd4S1hRjP/psGe6UbQX1Uzljtf3H5akIyhiQmz32JdDJuIaeVk7v08=
X-Gm-Gg: AR+sD11Rj2se9yQzIvHF75NZJ+2UweotpBZWenx6oL2fWakALryXPdFoBlo5Y5O790X
 nuBANqdILdxg6+oDRkFABBoq8nn70qqBqj8YdlcncR8vfbeYOCYvxL7UESAoaELIQFbtp4FPiI6
 ArZIiPYFgPxsvZqVxR0H86a6csEJX1CdGsVDagRua5XDn5pJpMQp6Z9dBlRDD/bOv74y75Umg/n
 lxFeXlBhpyEPyrpMhi9MaVrRDE+npDwkgPVJtIMbBC59ywXuyQVLNon61JZ2EyHfgI8PlPyMwh1
 M1n2Hfp1su6OedUICBWjV3kxPPWcnwzWBIniqJkujKzgJKcwKXg862/QXIi9315x4iomqY8=
X-Received: by 2002:a17:907:5c9:b0:c15:c638:d03c with SMTP id
 a640c23a62f3a-c1fd28ae233mr89394466b.47.1785496587240; 
 Fri, 31 Jul 2026 04:16:27 -0700 (PDT)
X-Received: by 2002:a17:907:5c9:b0:c15:c638:d03c with SMTP id
 a640c23a62f3a-c1fd28ae233mr89391666b.47.1785496586797; 
 Fri, 31 Jul 2026 04:16:26 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.51.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1fd3cc3ea1sm123530766b.26.2026.07.31.04.16.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2026 04:16:25 -0700 (PDT)
Message-ID: <59d99863-07a1-4cc0-8334-e45918a8dee1@redhat.com>
Date: Fri, 31 Jul 2026 13:16:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/net/vmxnet3: Do not abort if guest provides bad
 interrupt numbers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>
Cc: Jason Wang <jasowangio@gmail.com>, qemu-trivial@nongnu.org,
 qemu-stable@nongnu.org
References: <20260730143943.1117129-1-thuth@redhat.com>
 <976c63a9-4ffd-44e6-b549-1bcb16f7ebb2@oss.qualcomm.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <976c63a9-4ffd-44e6-b549-1bcb16f7ebb2@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IC3NETCdZWTCu0ZrHN5QT1-P-h1S9dEAj1LMp1xbS7g_1785496587
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.58,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 31/07/2026 08.03, Philippe Mathieu-Daudé wrote:
> Hi Thomas,
> 
> On 30/7/26 16:39, Thomas Huth wrote:
>> From: Thomas Huth <thuth@redhat.com>
>>
>> vmxnet3_validate_interrupts() currently aborts via hw_error() if
>> the guest provided bad interrupt numbers. This should not happen,
>> QEMU should rather refuse to activate the device in this case instead.
>> Thus propagate the error to the callers to handle it more gracefully
>> there.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/539
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   hw/net/vmxnet3.c | 35 +++++++++++++++++++++++++++--------
>>   1 file changed, 27 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
>> index 8569484b2f2..1c5d1d740cc 100644
>> --- a/hw/net/vmxnet3.c
>> +++ b/hw/net/vmxnet3.c
>> @@ -1336,32 +1336,46 @@ static bool vmxnet3_verify_intx(VMXNET3State *s, 
>> int intx)
>>           || intx == pci_get_byte(s->parent_obj.config + 
>> PCI_INTERRUPT_PIN) - 1;
>>   }
>> -static void vmxnet3_validate_interrupt_idx(bool is_msix, int idx)
>> +static bool vmxnet3_validate_irq_idx(const char *type, bool is_msix, int 
>> idx)
>>   {
>>       int max_ints = is_msix ? VMXNET3_MAX_INTRS : VMXNET3_MAX_NMSIX_INTRS;
>> +
>>       if (idx >= max_ints) {
>> -        hw_error("Bad interrupt index: %d\n", idx);
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "vmxnet3: Bad %s queue interrupt index: %d\n",
>> +                      type, idx);
>> +        return false;
>>       }
>> +
>> +    return true;
>>   }
>> -static void vmxnet3_validate_interrupts(VMXNET3State *s)
>> +static bool vmxnet3_validate_interrupts(VMXNET3State *s)
>>   {
>>       int i;
>>       VMW_CFPRN("Verifying event interrupt index (%d)", s->event_int_idx);
>> -    vmxnet3_validate_interrupt_idx(s->msix_used, s->event_int_idx);
>> +    if (!vmxnet3_validate_irq_idx("event", s->msix_used, s- 
>> >event_int_idx)) {
>> +        return false;
>> +    }
>>       for (i = 0; i < s->txq_num; i++) {
>>           int idx = s->txq_descr[i].intr_idx;
>>           VMW_CFPRN("Verifying TX queue %d interrupt index (%d)", i, idx);
>> -        vmxnet3_validate_interrupt_idx(s->msix_used, idx);
>> +        if (!vmxnet3_validate_irq_idx("TX", s->msix_used, idx)) {
>> +            return false;
>> +        }
>>       }
>>       for (i = 0; i < s->rxq_num; i++) {
>>           int idx = s->rxq_descr[i].intr_idx;
>>           VMW_CFPRN("Verifying RX queue %d interrupt index (%d)", i, idx);
>> -        vmxnet3_validate_interrupt_idx(s->msix_used, idx);
>> +        if (!vmxnet3_validate_irq_idx("RX", s->msix_used, idx)) {
>> +            return false;
>> +        }
>>       }
>> +
>> +    return true;
>>   }
>>   static bool vmxnet3_validate_queues(VMXNET3State *s)
>> @@ -1554,7 +1568,10 @@ static void vmxnet3_activate_device(VMXNET3State *s)
>>                  sizeof(s->rxq_descr[i].rxq_stats));
>>       }
>> -    vmxnet3_validate_interrupts(s);
>> +    if (!vmxnet3_validate_interrupts(s)) {
>> +        vmxnet3_reset(s);
>> +        return;
> 
> We definitively want to return here to not set s->device_active,
> but calling vmxnet3_reset() in the middle of a command handler is
> surprising. Maybe call it in the caller?
I've added it here as precautionary measure, but looking at the code flow 
again, it's likely not really necessary here: vmxnet3_deactivate_device() 
does not do anything at all since device_active has not been set yet. And 
all the other early returns in vmxnet3_activate_device() also don't do this.

So let's simply drop that vmxnet3_reset() from the patch. I'll send a v2...

  Thomas


