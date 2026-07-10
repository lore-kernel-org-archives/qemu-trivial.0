Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44E0C44501
	for <qemu-trivial@archiver.kernel.org>; Fri, 10 Jul 2026 14:41:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wiCPR-0000al-25; Fri, 10 Jul 2026 10:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wiCPI-0000a9-LQ
 for qemu-trivial@nongnu.org; Fri, 10 Jul 2026 10:40:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wiCPF-0004wy-Oi
 for qemu-trivial@nongnu.org; Fri, 10 Jul 2026 10:40:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783694441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0V4nuntP4ZVVntCf4uXAKMupjDf67pXY9SlJjDoZw2M=;
 b=AzorzE25nF/eGiiJrpt3JvXOcXaHWYL9tFZOEPWq2Lu4q+qj6rRrd9+wmQTabqSqg1Ze68
 qJq0d83ipzabi0r4JVeNr2vdZfaTB4oHqyXbWC36ColS3hMDmuVmbXMRoR/bqSBb8uB1du
 txb79pNkmzmrFZ+SxTfll+2+9sHBaGM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-dId50VMxP4SDNwdIYYBBCQ-1; Fri, 10 Jul 2026 10:40:39 -0400
X-MC-Unique: dId50VMxP4SDNwdIYYBBCQ-1
X-Mimecast-MFC-AGG-ID: dId50VMxP4SDNwdIYYBBCQ_1783694438
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-472bdd6f529so652562f8f.1
 for <qemu-trivial@nongnu.org>; Fri, 10 Jul 2026 07:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783694438; x=1784299238;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0V4nuntP4ZVVntCf4uXAKMupjDf67pXY9SlJjDoZw2M=;
 b=j8fUP5IwXvCN/F5pv2ILf3qmw8PJytlxhxZc1Mg59zVv4n73fZK/7ji5T4jldnAWs7
 ZPoNGN7uIKBajIRRl4zaLV/6NypSKUhcwHMZGt3ZYjG1tFnnEsXgR0gy8020+y+Uenmm
 iNO5Qd1u199r5EfM3ceYsbggEls60/gckR4dMDIwecBKCeR3zQknE/m/6SYVLzZ8n7H2
 bOJEAH1AOtySibF6dnJHO/EOzPFTDAoUV2bSXs/qqCNyUfnyd9DgUaZPZrOrNvrYDsLV
 9l4o6MvLInwtvKmhAJcCAK+V/G1mrCZ85JMGVuTVK3a60B+fyBLa7vS0XQexUzuJuhTS
 ygPA==
X-Gm-Message-State: AOJu0YxNu7Zd7mvkTO1oF/9TojtP9a6BXI7qefxSuBgpUvy/UrPYIGlI
 Fg8DMH13sgdnNntXV64AgZ+/0rnfkBRXqNGmo5lVFiFp0JbxxkPkLqat7tVeTdgK3z2yrQPc5RR
 U1yw5hfWQYS7UsrcvNRMHoW/fUdMIDGS0Zj916zTV12Y9BIk1GQx3LfWXehw=
X-Gm-Gg: AfdE7clwnnFGoGp2X0IdCaJbxW83V9O+CPXnIacE/zR4hgHtSFJitlnlP1mNQQN22Ks
 9iOu+SC7UaLAR01LJ4+a1fzyf2mfBu2VCedB+21T9D57xP981vi+hSw4znLcfOwZ7x992/xfeei
 ZhQQOuyJIwnT3fFntNsA3vbECC5nzKeg5PPSjsLTCD+l47d6lGKGfjbWHIUDH3swjhD10tGFoa7
 kc+ZUEfiDiuk8gTgT4Omr1Ep33CO8xj+jiuhzKv8X6vq66UfAZqyFAIPMvQh1C047hWmrwoTvYv
 /CxqAeFYgCGmEZt2XyF01IxFAuB4GIZBKroqM04IwdGixRF2UOZLn1vjf2+NS/eQ2qt0rTPjzLt
 xjOHc90nk
X-Received: by 2002:a05:600c:528e:b0:492:4363:e7eb with SMTP id
 5b1f17b1804b1-493e68f03damr123524885e9.32.1783694438539; 
 Fri, 10 Jul 2026 07:40:38 -0700 (PDT)
X-Received: by 2002:a05:600c:528e:b0:492:4363:e7eb with SMTP id
 5b1f17b1804b1-493e68f03damr123524505e9.32.1783694438127; 
 Fri, 10 Jul 2026 07:40:38 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.114.244])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6e8844sm158570905e9.10.2026.07.10.07.40.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 07:40:37 -0700 (PDT)
Message-ID: <ff2c039d-c5e3-4d49-add1-242135679958@redhat.com>
Date: Fri, 10 Jul 2026 16:40:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/usb/hcd-xhci: Turn guest-triggerable abort() into
 qemu_log_mask()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20260710142727.592667-1-thuth@redhat.com>
 <98470e76-bd6a-4a01-af1d-6f03ac9fcdbe@oss.qualcomm.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <98470e76-bd6a-4a01-af1d-6f03ac9fcdbe@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2S6M7eOf-28RPz_stJswYkRfznrPov7yj0frThhAQd0_1783694438
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/07/2026 16.36, Philippe Mathieu-Daudé wrote:
> On 10/7/26 16:27, Thomas Huth wrote:
>> From: Thomas Huth <thuth@redhat.com>
>>
>> The FIXME macros in xhci_alloc_device_streams() can be triggered
>> by a (malicious) guest. Since the macro also contains an abort()
>> statement, this terminates QEMU. Turn the FIXME statements into
>> a qemu_log_mask() instead to avoid that a guest can shoot itself
>> this way.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3784
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   hw/usb/hcd-xhci.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
>> index 2cdab3ba0e4..9ff50d0b7f9 100644
>> --- a/hw/usb/hcd-xhci.c
>> +++ b/hw/usb/hcd-xhci.c
>> @@ -965,11 +965,13 @@ static TRBCCode xhci_alloc_device_streams(XHCIState 
>> *xhci, unsigned int slotid,
>>            * together and make an usb_device_alloc_streams call per group.
>>            */
>>           if (epctxs[i]->nr_pstreams != req_nr_streams) {
>> -            FIXME("guest streams config not identical for all eps");
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                          "guest streams config not identical for all eps");
> 
> With trailing \n:

D'oh! Thanks!

I just noticed that I also forgot to add a "Reported-by" line to the 
description. I'll send a v2...

> Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Thanks!

  Thomas


