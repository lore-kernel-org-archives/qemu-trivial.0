Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E996C4451C
	for <qemu-trivial@archiver.kernel.org>; Tue, 21 Jul 2026 06:44:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wm4DK-00087g-EX; Tue, 21 Jul 2026 02:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wm4DH-00086W-7l
 for qemu-trivial@nongnu.org; Tue, 21 Jul 2026 02:44:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wm4DD-00052J-66
 for qemu-trivial@nongnu.org; Tue, 21 Jul 2026 02:44:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784616257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=p+tkwyDp1Yn7DqT72sgxYjvB1R8s3O1UAMDF8OfxCOw=;
 b=bO3MhEcODeJbftxqNK2BIaTVlLBBW0nzUzvpu7Yb4iCM+2d3mp2msozwKg6AXm1RLEfhL/
 R0SJKok59XuU5mzQHXQ1L8brE8AvvysBUduDxpyauEfEIx6P8iPD6Z+mSRi/fzrgEL3h8W
 e1cO2ayF2p0aVGimazJrfi5Ba17Wxc0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-afUp4MiGM1G513v_xFNMaA-1; Tue, 21 Jul 2026 02:44:16 -0400
X-MC-Unique: afUp4MiGM1G513v_xFNMaA-1
X-Mimecast-MFC-AGG-ID: afUp4MiGM1G513v_xFNMaA_1784616255
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4955843c6cdso25163595e9.1
 for <qemu-trivial@nongnu.org>; Mon, 20 Jul 2026 23:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784616255; x=1785221055;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=p+tkwyDp1Yn7DqT72sgxYjvB1R8s3O1UAMDF8OfxCOw=;
 b=eYL/LjGDszAsq8UR4wR1gWAwgmAA7yazzKYU0ziWFN74teIt2WdDTKnppemTU1kBG9
 +iN0ODuzQdbM9mnerNfrKjF19cSU4yLuNtqGJzfYSXXdSYUPsHhVDgQS4PsUq6dGVGLS
 YnHbBwE+qvd8IyKtYlKZOMsFdUJCfsZRA7FfSuNboSdhMq83rd6CMXV9QHX2aol59+c/
 hEYVPu8vWAjlEJm90ZfDQKOiIVwYSvT+6/yNrUGwE3gBsh01tlkp3Q/r5y8Osi44Hp8g
 cZWszUcvo7jTCx0JmshH+y+pqaJda9w/MVUsozJVM75Wuin6XiJ4QfPT+BkiHaAFJXvv
 gXCw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrbJN/TmW0OGi/NvbkrGiH4Va6Tj+C+w7xAfdD4f+ud5Ty4SQ6kx6TkQoW5Xrnntff80contLd++in5CMQ=@nongnu.org
X-Gm-Message-State: AOJu0Yx5jCQnlDfwiJsXvyDRFKv/C/GmNv2+GhE+n6uRXQCkNEtNNDN0
 q+bLTKheJwF2O+QB4EHBp4JmCVrt2PTTn+KSdJ4rs3KHwqVP7fmO0+DWo8gDjwC+bRXgcfNj4vk
 fEI1wB6tjUlmfFruX0jJTRe6mdV10BwDwOPht49ob2oBZgUFG0BfbqASMY/4=
X-Gm-Gg: AfdE7clpsjUMSqf63dtOs5Vch6McDQdpI9I3gDiD9M+R5HPVdd1jY7OuSwi6X1xcXkD
 x9yFVfMgfJq28wl7Gsgp1eJR7I4kNTFf1yh85qkg7tTlPFTlZKg7fowT/eTYJZEXiW/K0czoyQK
 X/lSfPSUXt0dAM/6E8awuRWsTHDCcfkbsjlh7RJG1PJrx/4kw23ITLrHGOZUNe5xtHWDruKECZA
 am7h1oURysy1tGK7lZgEAprxhM3xZhALokEEx5PWhwH33nmCM2vsXreGf1ALqf0KAK1yZfj1MWp
 gG7cvhsl9XwJKQRnvXpxUemQe7tUJeioW/zgaYveExjX1Wls9V6F+5zMS4V7xWV4gJcVA1l4Dw=
 =
X-Received: by 2002:a05:600c:a44:b0:492:68bc:3237 with SMTP id
 5b1f17b1804b1-4954a40c014mr176717235e9.32.1784616255086; 
 Mon, 20 Jul 2026 23:44:15 -0700 (PDT)
X-Received: by 2002:a05:600c:a44:b0:492:68bc:3237 with SMTP id
 5b1f17b1804b1-4954a40c014mr176716935e9.32.1784616254719; 
 Mon, 20 Jul 2026 23:44:14 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.113.188])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956546db7bsm45230385e9.3.2026.07.20.23.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 23:44:14 -0700 (PDT)
Message-ID: <029d4e97-0a58-4121-86e4-bf27d1faaa17@redhat.com>
Date: Tue, 21 Jul 2026 08:44:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/ide/core: Fix possible crash via NULL pointer in
 ide_cancel_dma_sync()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>
Cc: Alexander Bulekov <alxndr@bu.edu>, qemu-block@nongnu.org,
 qemu-stable@nongnu.org, qemu-trivial@nongnu.org
References: <20260720194210.663629-1-thuth@redhat.com>
 <cd8ff4ea-9d66-4be1-b8ff-e361cfaea5d2@oss.qualcomm.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <cd8ff4ea-9d66-4be1-b8ff-e361cfaea5d2@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xxm6-38tZRNBB-bDci9SZE4XNCIYuPM1BPrcQqKZG8A_1784616255
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=170.10.129.124;
 envelope-from=thuth@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 20/07/2026 22.36, Philippe Mathieu-Daudé wrote:
> On 20/7/26 21:42, Thomas Huth wrote:
>> From: Thomas Huth <thuth@redhat.com>
>>
>> ide_cancel_dma_sync() is called with a "IDEState *s" for one of the
>> two IDE drives on a bus (primary or secondary drive) to cancel all
>> pending DMA transfers on the drive. The code then checks
>> s->bus->dma->aiocb to see whether there is any IO in flight on the
>> *bus* and then calls blk_drain(s->blk) to wait for its completion.
>> However, s->bus->dma->aiocb might belong to the other drive on the
>> bus, and if there is no disk attached to the current drive, s->blk
>> is NULL. Since blk_drain() does not check its parameter for a NULL
>> pointer, QEMU can crash in such a case.
>>
>> Fix the problem by checking s->blk to be a valid pointer before
>> calling blk_drain() in this function.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/905
>> Reported-by: Alexander Bulekov <alxndr@bu.edu>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4052
>> Reported-by: dong ling
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   hw/ide/core.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/ide/core.c b/hw/ide/core.c
>> index f78b00220b8..49848c8e6bd 100644
>> --- a/hw/ide/core.c
>> +++ b/hw/ide/core.c
>> @@ -741,8 +741,11 @@ void ide_cancel_dma_sync(IDEState *s)
>>        * In the future we'll be able to safely cancel the I/O if the
>>        * whole DMA operation will be submitted to disk with a single
>>        * aio operation with preadv/pwritev.
>> +     *
>> +     * Note: s->bus->dma->aiocb might belong to the adjacent IDEState,
>> +     * so we have to check s->blk for not being NULL, too.
>>        */
>> -    if (s->bus->dma->aiocb) {
>> +    if (s->bus->dma->aiocb && s->blk) {
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> 
> If you don't object, I'll change to:
> 
>         if (s->blk && s->bus->dma->aiocb) {
> 
> when queueing.
Please unqueue it again - I just noticed that it is now possible to trigger 
the assert(s->bus->dma->aiocb == NULL) after the blk_drain() instead...
I think we simply have to drain both drives, primary and secondary, if their 
"blk" is not NULL... I'll send a v2.

  Thomas


