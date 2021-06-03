Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lonDl-0006vT-68
	for mharc-qemu-trivial@gnu.org; Thu, 03 Jun 2021 09:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lonDj-0006v7-En
 for qemu-trivial@nongnu.org; Thu, 03 Jun 2021 09:17:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lonDe-0002Yl-Sj
 for qemu-trivial@nongnu.org; Thu, 03 Jun 2021 09:17:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622726225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yUzeIfr4SFlW9ASWWhoJMByrd7I4fnsaQBETGdNzQg4=;
 b=RtIvN2/iZOyBCPfBO10C4NEJwSHW+jem8wB/XOqKWj29gtQdbeG4jwKwQ6b2huUnOXcOvC
 e3F58iD13JIbYbwFNtRBFFvoJ70ZzN95mf1vK8iUzyJXN3Ds3a7mYxZqsvvWbbydXEogct
 +yqtWElNSrlVc2rgqRjCurQABxVDAlo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-J_7iXn1hP9uFqvTndwai0g-1; Thu, 03 Jun 2021 09:17:04 -0400
X-MC-Unique: J_7iXn1hP9uFqvTndwai0g-1
Received: by mail-ed1-f70.google.com with SMTP id
 x8-20020aa7d3880000b029038fe468f5f4so3228259edq.10
 for <qemu-trivial@nongnu.org>; Thu, 03 Jun 2021 06:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yUzeIfr4SFlW9ASWWhoJMByrd7I4fnsaQBETGdNzQg4=;
 b=KQc8krO0/EYBhx9WZCNziHgQFyX4l5l9AfiOZP4byfMyoa7UYrsCGAkeo9qW92s052
 Nh+TYco3WiriuyC8+ZdrCELIffQr7Y0PcrLMvd1tYrV2cIfyH3t6O8YgCucGee8LVE6m
 I9ALpI5V0IoZWuyrgtA8yv3zk1fVknd8C4/xZcn/YBn04dwpIjE/2IsI6BJ+jlKNy5L8
 Ptei5/ts5PYh/XvE9WxkveqrnNUc67qESspd/Cy8HBmE+PEZEyedL7kLy3DVt9bDStph
 uLV7COOhukn1pWwLQ5uAnARvoTlXDFe0zJYZ5QWqqb0ikcY1SUI24qLcLSupqJ89Pcmm
 2Z+w==
X-Gm-Message-State: AOAM531kPNEDTOkdjEuHXDo0DYAX5+IOoOWA+67QSe6GUpQsmsnbjoOX
 PtQuR2qWPLNI0XKtTB53X6z7AL5XdAXFopY3ttDxPQ7XuvG7lHqzCEXMR4HqKUH/y0Wi09Tke7I
 G8T4Gp0g0PCPcXfwo/ewMVbA4+3numAKTSMEkCdYE3uzQUmyUdKD7VJii/5uBQrrYBiw=
X-Received: by 2002:a05:6402:848:: with SMTP id
 b8mr44500339edz.159.1622726221311; 
 Thu, 03 Jun 2021 06:17:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxiFBF4aBrUgqMa7CufTv9rO04v/VFhskwef1Oo9J5lLi3gg9zeICR2uN9gIuvUg2AV/v4DA==
X-Received: by 2002:a05:6402:848:: with SMTP id
 b8mr44500254edz.159.1622726220650; 
 Thu, 03 Jun 2021 06:17:00 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id v1sm1472088ejw.117.2021.06.03.06.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 06:17:00 -0700 (PDT)
Subject: Re: [PATCH v2] vhost-vdpa: Remove redundant declaration of
 address_space_memory
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: mst@redhat.com
Cc: qemu-devel@nongnu.org, jasowang@redhat.com,
 Xie Yongji <xieyongji@bytedance.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210517123246.999-1-xieyongji@bytedance.com>
 <d00aed97-cc58-0c8a-dc7d-9ae8945c3af4@redhat.com>
Message-ID: <f2a8e69d-75b1-6be0-f588-afe67cda3af9@redhat.com>
Date: Thu, 3 Jun 2021 15:16:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <d00aed97-cc58-0c8a-dc7d-9ae8945c3af4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 03 Jun 2021 13:17:11 -0000

Hi Michael,

Could you queue this patch via your 'vhost' tree?

On 5/17/21 3:11 PM, Philippe Mathieu-Daudé wrote:
> Cc'ing qemu-trivial@
> 
> On 5/17/21 2:32 PM, Xie Yongji wrote:
>> The symbol address_space_memory are already declared in
>> include/exec/address-spaces.h. So let's add this header file
>> and remove the redundant declaration in include/hw/virtio/vhost-vdpa.h.
>>
>> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/virtio/vhost-vdpa.c         | 1 +
>>  include/hw/virtio/vhost-vdpa.h | 1 -
>>  2 files changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>> index 8f2fb9f10b2a..ee51863d280b 100644
>> --- a/hw/virtio/vhost-vdpa.c
>> +++ b/hw/virtio/vhost-vdpa.c
>> @@ -18,6 +18,7 @@
>>  #include "hw/virtio/vhost-backend.h"
>>  #include "hw/virtio/virtio-net.h"
>>  #include "hw/virtio/vhost-vdpa.h"
>> +#include "exec/address-spaces.h"
>>  #include "qemu/main-loop.h"
>>  #include "cpu.h"
>>  #include "trace.h"
>> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
>> index 28ca65018ed7..ae9ee7adb2d0 100644
>> --- a/include/hw/virtio/vhost-vdpa.h
>> +++ b/include/hw/virtio/vhost-vdpa.h
>> @@ -21,5 +21,4 @@ typedef struct vhost_vdpa {
>>      struct vhost_dev *dev;
>>  } VhostVDPA;
>>  
>> -extern AddressSpace address_space_memory;
>>  #endif
>>
> 


