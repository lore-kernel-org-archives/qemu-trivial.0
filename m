Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lq9Ua-0002PA-78
	for mharc-qemu-trivial@gnu.org; Mon, 07 Jun 2021 03:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lq9UX-0002OD-Ty
 for qemu-trivial@nongnu.org; Mon, 07 Jun 2021 03:16:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lq9UU-0002yY-VB
 for qemu-trivial@nongnu.org; Mon, 07 Jun 2021 03:16:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623050165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SIoH7qz/E/dzI8x/wGCnLPRHxL+JpjM+xdrIxQArNPY=;
 b=aS8KTMoQvI0AyhHjU8/LUUtydEzLeOhAkpXP3OP0X0WmKwbnf/z4RbSByDEANy/PmBHM52
 82ih062oeec9BJNoWwRrzM7FLu0+loOlgwgMi9Up9yDtNQmpxcAXT5j/4JULIqmnIujEh6
 QskAoxoLtq6MHi/TFs4R6vkBjd11aMU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-5C3ixpg0O72jsYNxLWcZiA-1; Mon, 07 Jun 2021 03:16:03 -0400
X-MC-Unique: 5C3ixpg0O72jsYNxLWcZiA-1
Received: by mail-wm1-f72.google.com with SMTP id
 z25-20020a1c4c190000b029019f15b0657dso3744442wmf.8
 for <qemu-trivial@nongnu.org>; Mon, 07 Jun 2021 00:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SIoH7qz/E/dzI8x/wGCnLPRHxL+JpjM+xdrIxQArNPY=;
 b=SczA9oXyJdOHoVpoqCYe8+2Gl6nY3d9KxS0cWnFHyzbkIoDr3Ipt0g9Tbe44zhxTx4
 NDHRPUtJ3I8R6J5ahvc2wJePdbrDkH+j3mV+MuuVs5iosMMgEWj1UNLcYN5ZcfIxJpZq
 XwQWajIsynLc7KQAodI3F75lMqQfL1PFa8soqH8AeDV38Y9lFlfRJJLvT+40guRmkzkJ
 Qf2TtPF617CRakBgkGOa1T5ZPokXxYn37ARz8c4A3qeJ4f4sqqAWHzOoYofoTCQ+ANDt
 +IJvhaev4Wyoo6HoZFLsr5v5SDrRAskAaQRh14S4S11Vy/tB6FCTROOBTw7/6JuI8JkH
 8T9A==
X-Gm-Message-State: AOAM5314o7vJNW/Ih070T5bL1VDeiPXnH68s4jpAaI4u/WJcGI6508X/
 IhlJTiHfPDG68FFezCBK829Y01Nd+S+FjOR448cmafWpVoj8URunA1w3KZWlvJbdlrgg80H23dZ
 9pUzlVuC3poKJYLWkQg==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr15522776wmk.97.1623050162683; 
 Mon, 07 Jun 2021 00:16:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhIlUvKgsM8lV4PpuMPq34ZisgafRK0WVHZuBGKa7JKSDMewpFjQmBpEMvCMsSVR2d4cowUw==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr15522758wmk.97.1623050162479; 
 Mon, 07 Jun 2021 00:16:02 -0700 (PDT)
Received: from thuth.remote.csb (pd957536e.dip0.t-ipconnect.de.
 [217.87.83.110])
 by smtp.gmail.com with ESMTPSA id t12sm19000280wre.9.2021.06.07.00.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 00:16:02 -0700 (PDT)
Subject: Re: [PATCH 0/2] Improve vmstate_vmbus_dev handling
To: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jon Doron <arilou@gmail.com>, Roman Kagan <rkagan@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210603104139.556512-1-thuth@redhat.com>
 <29f1529e-5865-db7e-698d-e7a046f012a3@oracle.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <071039e6-2364-d9f3-2b19-ea2cbf454d2a@redhat.com>
Date: Mon, 7 Jun 2021 09:16:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <29f1529e-5865-db7e-698d-e7a046f012a3@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jun 2021 07:16:10 -0000

On 05/06/2021 18.01, Maciej S. Szmigiero wrote:
> Hi Thomas,
> 
> On 03.06.2021 12:41, Thomas Huth wrote:
>> I accidentally came accross vmstate_vmbus_dev and noticed that
>> it is currently not used at all ... wire it up and make it
>> static, since it is only used in one file.
>>
>> Thomas Huth (2):
>>    hw/hyperv/vmbus: Wire up vmstate_vmbus_dev
>>    hw/hyperv/vmbus: Make vmstate_vmbus_dev static
>>
>>   hw/hyperv/vmbus.c         | 29 +++++++++++++++--------------
>>   include/hw/hyperv/vmbus.h |  3 ---
>>   2 files changed, 15 insertions(+), 17 deletions(-)
>>
> 
> I think the idea is to embed vmstate_vmbus_dev into a child device
> VMStateDescription using VMSTATE_STRUCT() - since particular VMBus
> devices aren't merged yet there are currently no users of it.

Ok, then never mind. But some comments in the source code would be really 
helpful - in the current shape, it simply looks like an oversight...

  Thomas


