Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E646C44507
	for <qemu-trivial@archiver.kernel.org>; Mon, 13 Jul 2026 10:31:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wjDwB-00074C-0f; Mon, 13 Jul 2026 06:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wjDw9-00073Q-Ad
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2026 06:30:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wjDw7-0000wW-BX
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2026 06:30:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783938654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DXRHZsfAapQPGXFOByAdwNsS6K/zYNXLgtamaNoGgoQ=;
 b=DUmSW/cAwaXow+kjAdkAM7cajRh9//bdpIIvhyTEuONOkmdKcGQKbr97EZMnTPokstvKqL
 Yw+G12zHQhV8oemLeTV0M2WSzc7ofN+Zzbe9s2/k3D7ny9LjpYsc512/DylexWjdlc2yDL
 5EkBxyEw+Fmn9afrygbiGqewGfb0hr4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-YgWFAhCrOiGAYn36hzLhVA-1; Mon, 13 Jul 2026 06:30:53 -0400
X-MC-Unique: YgWFAhCrOiGAYn36hzLhVA-1
X-Mimecast-MFC-AGG-ID: YgWFAhCrOiGAYn36hzLhVA_1783938652
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-4784d0fb9cfso2183501f8f.2
 for <qemu-trivial@nongnu.org>; Mon, 13 Jul 2026 03:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783938652; x=1784543452;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DXRHZsfAapQPGXFOByAdwNsS6K/zYNXLgtamaNoGgoQ=;
 b=TYmZ68SV6B9Egv861SDLdM4qd0CDbbRWK1zXDljrJC/2k7IZYU4l0kf0Pi7wXCpv+f
 4AFxQpVs69/VgZsrXkJy3rMDcxeg+jIUAC2cOf3dtqLHCnLncNhl36a/V1byXIrSGpcF
 o4xiH7D8HOD1SYHuBWjrd6ZDyHDE9kOdDoz6nOvJlFtK1Bgsh0IaK3Gu07BMDDhNRuI4
 brgjuqxNhs1tmshj0YrjdLWPD3I+OhDgNxdoVq5UO6s8lT6QaoTyEOWPijQS/fE7BhUw
 S/JZVBpfoIVBfEHFRUWLC5OmPJPaqaTE5Kjy1CJFFXf7H40B60CUGar13p/QZiLmjvXp
 KZqg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrmo1+Ryt0sXbDnI9vqNk/FO7SqZdsl0YcoKtIsfQsV0xfh16cJIv25+2/D1iqGYmw8E0fRD3+mr3oXEP4=@nongnu.org
X-Gm-Message-State: AOJu0YzcRhIfGzXv12FDrucL4XKMThnA7urAAScz8ihNaAsgm04Btlol
 QasahOe5W6fNk+t1Al6s13/Cg/2dC35agtUcLwBlJXCHZY/pG6vIfqgz17TrzRIFtvD47I8ta2s
 r8yDRcU89UE8564WFuTg/3X2cl1FogDMuKW+pg4DtFHXNxHSxauQRXY4qgwM=
X-Gm-Gg: AfdE7cmIGKNlSJx9N/l/NUE0BCfAGXeRjVN6YRd36wfjMnTOCa5OujK+5umRyke/R7b
 K1ADdW//u/M9BKZLZRUgBfSUdXCH5uIZ+Wyb0mCKdL0+/6UzsQdkPRrMoegsszpcj2Bab3e0ObN
 vr44RPcVLvFTL0abPv0lK97ZZsxfTmwLG20UO/lLQQpVbK39gW80CfLswUMBIhUAn1XdqRl8xdD
 rqW/z3ff5i3ps5SQ6kO0wTo6r2MGB4HI+M/LhnBjFUhDZq8c/7qvYHRvdCw3WbECrUIdJygEhHb
 GNxVuVyvYNSORDYkeoFf+TAqOuYvM0IPqPbwXodbzqym9HZF+RTCRJHUoG2XjJic+mDrGuroEB+
 3CJcaUadh
X-Received: by 2002:a05:6000:1841:b0:473:823:1924 with SMTP id
 ffacd0b85a97d-47f2dcd7860mr10545178f8f.39.1783938652108; 
 Mon, 13 Jul 2026 03:30:52 -0700 (PDT)
X-Received: by 2002:a05:6000:1841:b0:473:823:1924 with SMTP id
 ffacd0b85a97d-47f2dcd7860mr10545128f8f.39.1783938651645; 
 Mon, 13 Jul 2026 03:30:51 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.114.244])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1d905sm87270848f8f.2.2026.07.13.03.30.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 03:30:51 -0700 (PDT)
Message-ID: <4e1ec982-c1c7-47b5-94e8-f775d5add64a@redhat.com>
Date: Mon, 13 Jul 2026 12:30:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] hw/usb/hcd-xhci: Use qemu_log_mask() instead of
 fprintf() statement
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
References: <20260713100508.123623-1-thuth@redhat.com>
 <20260713100508.123623-4-thuth@redhat.com>
 <CAFEAcA8=_3Ofp3KnOXgfk6OSRHZtvSF6L2pb47XfC8b5TTZo+w@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CAFEAcA8=_3Ofp3KnOXgfk6OSRHZtvSF6L2pb47XfC8b5TTZo+w@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Qy_8iAe-8zOaXN1-f1kV1mK3X7ygj6vARn3jVMoAUVk_1783938652
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: permerror client-ip=170.10.129.124;
 envelope-from=thuth@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

On 13/07/2026 12.17, Peter Maydell wrote:
> On Mon, 13 Jul 2026 at 11:05, Thomas Huth <thuth@redhat.com> wrote:
>>
>> From: Thomas Huth <thuth@redhat.com>
>>
>> We've got a proper way for logging unimplemented hardware features,
>> so use qemu_log_mask() instead of the fprintf() here now.
>>
>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   hw/usb/hcd-xhci.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
>> index ee913d5c4d5..527910d92d2 100644
>> --- a/hw/usb/hcd-xhci.c
>> +++ b/hw/usb/hcd-xhci.c
>> @@ -1017,7 +1017,8 @@ static XHCIStreamContext *xhci_find_stream(XHCIEPContext *epctx,
>>           }
>>           sctx = epctx->pstreams + streamid;
>>       } else {
>> -        fprintf(stderr, "xhci: FIXME: secondary streams not implemented yet");
>> +        qemu_log_mask(LOG_UNIMP,
>> +                      "xhci: secondary streams not implemented yet");
>>           *cc_error = CC_INVALID_STREAM_TYPE_ERROR;
>>           return NULL;
>>       }
> 
> qemu_log_mask() strings need a trailing "\n" (as of course does
> printing messages to stderr :-)).

D'oh, I forgot it again! Thanks for spotting it! I'll send an updated version...

> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Thanks!

  Thomas


