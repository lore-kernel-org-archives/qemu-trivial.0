Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20248FF885A
	for <qemu-trivial@archiver.kernel.org>; Tue,  5 May 2026 08:33:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wKBDX-0003T1-7G; Tue, 05 May 2026 04:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1wKBDQ-0003SN-0o
 for qemu-trivial@nongnu.org; Tue, 05 May 2026 04:33:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1wKBDO-0006Nl-B5
 for qemu-trivial@nongnu.org; Tue, 05 May 2026 04:33:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1777969992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SlhHLb53sebPywOjxS/Q1MJ1r29PhS7kddribYtGVDk=;
 b=iPcbK13vtsA5WJ4+V5avC00Uaq/oCZuMmAxGs8CWYFMU+BDCqnsAMmiSBdrn/bKDY8EPVK
 V3vAF3rFIER1lLtcIObQ7llEFISU5eWYV46pd7x0GP1d4oLKODSCVKg2z4ywasHMdueths
 sESmyvmrkBYm+/L3FFbfkCFc0xWYgcc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-njdYlNp8MAGEKQ8e9iNXRw-1; Tue, 05 May 2026 04:33:11 -0400
X-MC-Unique: njdYlNp8MAGEKQ8e9iNXRw-1
X-Mimecast-MFC-AGG-ID: njdYlNp8MAGEKQ8e9iNXRw_1777969990
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-488c2cc0cbaso44245435e9.3
 for <qemu-trivial@nongnu.org>; Tue, 05 May 2026 01:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777969990; x=1778574790;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SlhHLb53sebPywOjxS/Q1MJ1r29PhS7kddribYtGVDk=;
 b=iy0rjbm3YiWwHP176T6klOvev8nIoHrTrW4AkoZRrPsP3NfkwPfaqmIDA1/tyqjyLs
 I32VVw1ZMU/mpFWL32qorYd1oT5nINzepzI1ji3ATq1XXS61m93j2BMGdGDWZkAX/cNz
 0h0T81IJP8rbTjjh+88PTNc1zNpJiESVugw6YtteXRcrfQIJ6SJttn0lrivKYFZh/yrK
 7D1PeItP6y5/wfkyH+mTUK1RiIQ6u78s6fxoOqh2zwTEt/Gsn2tEKOBt7RXQ+exnIfIx
 1+4Bv3DM/LNy/aDaE5iZg13gw04UaXH/5zDqPQeBIaBndSLxIz+SPSzrSlDX/nW8mGC0
 L2xA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+j/ItosgniA7Q+Tas2NkidMT2KPo3JbCcyzkEVUSYH86cv53yFriV6BhKfl4Q/xgLLedF/F9t+g97O4vw=@nongnu.org
X-Gm-Message-State: AOJu0YwSISpYalpec7RtuqLW6Ap8lcNw4x9VIkBFzr3dw2yV05gujci0
 rnTQhN2TIqU299Xv5Fj4ZHJdEbzz0tTSGeLg2ZUS1pG9GlKWcXWFnffgkFSbk0cxA66lFidx7ml
 BXVWsDYG5v8JGWnvi/BHihzQulvpUT862W/aPxMc3vybqZozw7q4ZOPLYQU8=
X-Gm-Gg: AeBDieuMT+qMPUsQ4gYflJj9BxGC0OCZlLBl0f3Dd+5wK1vWV4p50wi/d/2a1jRYbjD
 G9OByeDZkp2tP/8eqYbMgPQWgWr2NzzEfF4iGLVKUbfb568D0mA+2hk907HuPSp4ok9+lGBjOW+
 oZ9Nul6PYPhInNx39/bpkAd0x7Aj0RENR3H9/vPUIAXpnMSR+/DH0NAAlag2qVwPp/uBgPhP/R0
 rdllxj9MTu7yjsG/3/XSgFx7zmEpSfY4+F0jDYezPZMSNerMXooyZVdAZ1M1GKFqgjevo5R6f0l
 p8kI7Rf6dWdM7FmOSh0b3dSd39gG/dLCg8ukOueYCKZigb0M4wbipsGlro5jTKL4a/IhjYLx/Ew
 FQiMCvE3pnduU+FMqrDqgIeIKZCdqMJFLFhKOKwyE6arz6MCKoORMFTfZBAxnWupFFdfHrls=
X-Received: by 2002:a05:600c:a316:b0:48a:563c:c8d6 with SMTP id
 5b1f17b1804b1-48a9887114cmr152282205e9.7.1777969989639; 
 Tue, 05 May 2026 01:33:09 -0700 (PDT)
X-Received: by 2002:a05:600c:a316:b0:48a:563c:c8d6 with SMTP id
 5b1f17b1804b1-48a9887114cmr152281905e9.7.1777969989151; 
 Tue, 05 May 2026 01:33:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8eb69800sm324739365e9.2.2026.05.05.01.33.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2026 01:33:08 -0700 (PDT)
Message-ID: <fd882dee-290d-419a-bda0-b9aaed31a33d@redhat.com>
Date: Tue, 5 May 2026 10:33:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/vfio: Drop superfluous inclusion of hw-error.h
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Alex Williamson <alex@shazbot.org>, Tomita Moeko <tomitamoeko@gmail.com>,
 qemu-trivial@nongnu.org
References: <20260428163702.3224323-1-thuth@redhat.com>
 <64e966e3-8450-40ff-98fd-479eee458b38@redhat.com>
 <CAFEAcA9HGWgJYvU_GVZCsxM7-WaR5QuwLES8aetPqD9jaLKr_A@mail.gmail.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <CAFEAcA9HGWgJYvU_GVZCsxM7-WaR5QuwLES8aetPqD9jaLKr_A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j6zx-eeZSkWzkR_NYrgBNwscZzJjQNaVXgJVMPwM2j0_1777969990
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.444,
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

On 5/5/26 10:18, Peter Maydell wrote:
> On Mon, 4 May 2026 at 16:04, Cédric Le Goater <clg@redhat.com> wrote:
>> On 4/28/26 18:37, Thomas Huth wrote:
>> Applied to
>>
>>       https://github.com/legoater/qemu vfio-next
>>
>> Please base future contributions on this branch.
> 
> In general I think it's better if we don't have odd subsystem
> specific requirements like this. The general assumption for
> QEMU patches should be that they are based on the current
> head-of-git. 

ok

> I don't want to have to remember that vfio
> is weird if I'm doing a patch that touches more than one
> part of the codebase. If you're accumulating so much
> stuff in vfio-next that it's problematic to have new
> patches based on head-of-git, then my feeling is that
> you're not sending pullreqs regularly enough.

Fair enough.

I have had to deal with cases in the past where there were
ordering headaches. I agree we should promote using the HEAD
always.

I will remove that last sentence from my "applied" script.

Thanks,

C.


