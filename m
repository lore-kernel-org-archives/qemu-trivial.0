Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rh1Rm-0000UE-AY
	for mharc-qemu-trivial@gnu.org; Mon, 04 Mar 2024 01:05:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rh1Rb-0000TH-SC
 for qemu-trivial@nongnu.org; Mon, 04 Mar 2024 01:05:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rh1RW-0003xZ-VC
 for qemu-trivial@nongnu.org; Mon, 04 Mar 2024 01:04:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709532294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bcRCjx853DSdthX+pMr0ZG6ezF7sCgK9E6qewB5AA0s=;
 b=YMytDbZ9IKeJMLkQjDrUScte/Dt+wdQupo5wxXUiVQizBhD1gWo3tDI8ei4wxzMM+DXeFt
 lp5R6nXqcaiFR5dYKnUHbWicTUn02bYRdoIcC0e2O3DXZ+ejDenqvve5hGGMbny9bvlL+J
 le7+2mEzM5ljxezSHP5scUSsPjWtBnU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-Ki4frzafOxqonoCICNYFyA-1; Mon, 04 Mar 2024 01:04:50 -0500
X-MC-Unique: Ki4frzafOxqonoCICNYFyA-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-42eee9bf542so9293961cf.0
 for <qemu-trivial@nongnu.org>; Sun, 03 Mar 2024 22:04:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709532290; x=1710137090;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bcRCjx853DSdthX+pMr0ZG6ezF7sCgK9E6qewB5AA0s=;
 b=czWNm2/4X6Uu5AYVQQ56YpdypR8LFvpUKDgM5lnEbQ3wCormb149bbbQWyk960JINm
 XtJV5x0NYgAw9B4sfnHOeET60c+FIu/4m4WjZghenZntkiPmCziJ2/jliOy2u01AOCVi
 u2Zth+nLJTQOJ6Yjj6IUO933dFGnI9qbLHIWGJ8YNxM9HodyTqjtc7g5nT7oSJcmT4jY
 3gRCCx3rzF1nKH0gp64TUk0uBweL1gKArrQ8pTG6ZgUpAWW3xuwG01iROdeSnG2hJfpV
 CrnL9JrUysXYWO2IFXrSkjLG/PV1JVpIgQ3jLtK6Jzqz8PMIwI5+NvZSeaFaLKoqDwSO
 52rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh4eehY4/LJneTGC9o6bTE12hioV/crI3/ljXq3/wHFkBAtQuUfI2VNDpsu3VPelvMJAKdvf1Oe4D3CLR14TE93W1lGLR2Kw==
X-Gm-Message-State: AOJu0YxGA8Uj7WJf2LFw8rGzm9dVg6Gzq+o4BYdLAA7Fsn7ZaTOvDJFl
 QrV6HxwJ80r6RfSHt/kvpMO9Kf8N+5Nseh7n65lWJwgfUtmTSzFJaFfUWryHp0kYVm0gcl7uphk
 FADgrZtgIxZ2UeHSLkmY55x0zMgAbZWqhTG8vPUj1qfer0yQoYXgLyfY=
X-Received: by 2002:ad4:57c7:0:b0:690:5744:e910 with SMTP id
 y7-20020ad457c7000000b006905744e910mr8320921qvx.23.1709532289810; 
 Sun, 03 Mar 2024 22:04:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+9dgq/LdOY7Rjr6wjviRcdyf6kMqe4/2qPdopmUXORmz7oNCzgRGCvFi2qXRNHSTnOVNOsg==
X-Received: by 2002:ad4:57c7:0:b0:690:5744:e910 with SMTP id
 y7-20020ad457c7000000b006905744e910mr8320900qvx.23.1709532289464; 
 Sun, 03 Mar 2024 22:04:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a0cd990000000b0068f54a37babsm4754488qvj.129.2024.03.03.22.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Mar 2024 22:04:49 -0800 (PST)
Message-ID: <4629e910-a24b-4ffa-b0d2-2da8197c065e@redhat.com>
Date: Mon, 4 Mar 2024 07:04:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix typo in comment (uin32_t -> uint32_t)
To: Zhao Liu <zhao1.liu@intel.com>, Frediano Ziglio <freddy77@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org
References: <CAHt6W4fiLh+bBOX1qwvm-1qJVG=j9SrT5rMJnEaMSWPjwwZr1g@mail.gmail.com>
 <ZeLQEEtbcPJpxenT@intel.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <ZeLQEEtbcPJpxenT@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.589,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 04 Mar 2024 06:05:03 -0000

On 3/2/24 08:06, Zhao Liu wrote:
> On Fri, Mar 01, 2024 at 06:55:35PM +0000, Frediano Ziglio wrote:
>> Date: Fri, 1 Mar 2024 18:55:35 +0000
>> From: Frediano Ziglio <freddy77@gmail.com>
>> Subject: [PATCH] Fix typo in comment (uin32_t -> uint32_t)
>>
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>> ---
>>   hw/vfio/pci.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
>> index 6e64a2654e..4bb7d7d257 100644
>> --- a/hw/vfio/pci.h
>> +++ b/hw/vfio/pci.h
>> @@ -181,7 +181,7 @@ struct VFIOPCIDevice {
>>       Notifier irqchip_change_notifier;
>>   };
>>
>> -/* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
>> +/* Use uint32_t for vendor & device so PCI_ANY_ID expands and cannot
>> match hw */
> 
> It would be better to also change the comment style as:
> 
> /*
>   * Use uint32_t for vendor & device so PCI_ANY_ID expands and cannot
>   * match hw.
>   */

yes and there is a similar typo in linux-user/fd-trans.c.

Thanks,

C.


