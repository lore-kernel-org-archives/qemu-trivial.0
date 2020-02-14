Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j2Xei-0005um-Ql
	for mharc-qemu-trivial@gnu.org; Fri, 14 Feb 2020 04:53:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55766)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mprivozn@redhat.com>) id 1j2Xeg-0005pM-OR
 for qemu-trivial@nongnu.org; Fri, 14 Feb 2020 04:53:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mprivozn@redhat.com>) id 1j2Xef-0002Uy-SV
 for qemu-trivial@nongnu.org; Fri, 14 Feb 2020 04:53:02 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:53748
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mprivozn@redhat.com>) id 1j2Xef-0002Tl-Oc
 for qemu-trivial@nongnu.org; Fri, 14 Feb 2020 04:53:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581673981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LtYh2eubS/WqhSyA6bT0OfoBAOKouSgEVvVK7WxmNwY=;
 b=RAb33j1OZTqgREuYThDDsiPmEuuDDmXyK12aNsXOqotyr0ZcoBfY+PVgVqtQ30LurABbJR
 9pMmgEHB8MGdmv9Ch+bxRqx+RNZ6qfnQxj8CMfSwPSbl5Y2APupRc5XQaeGCYcqpDU8uuX
 cxUhzMWZBu1EwR/Zj6mIv7bFZUyxbME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-SEhiHXEtM6SlLs6KLGajBg-1; Fri, 14 Feb 2020 04:52:57 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A460D8010E3;
 Fri, 14 Feb 2020 09:52:56 +0000 (UTC)
Received: from [10.43.2.30] (unknown [10.43.2.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27AFA5C1C3;
 Fri, 14 Feb 2020 09:52:52 +0000 (UTC)
Subject: Re: [PATCH] Report stringified errno in VFIO related errors
To: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-trivial@nongnu.org, alex.williamson@redhat.com, qemu-devel@nongnu.org
References: <2dc5a0962a38b912e4fa4900f9813b7ea1a9273c.1581670009.git.mprivozn@redhat.com>
 <20200214104740.07f59c72.cohuck@redhat.com>
From: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <a1f18897-264b-1ccd-f64a-bab40c9e1653@redhat.com>
Date: Fri, 14 Feb 2020 10:52:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200214104740.07f59c72.cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: SEhiHXEtM6SlLs6KLGajBg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Fri, 14 Feb 2020 09:53:03 -0000

On 2/14/20 10:47 AM, Cornelia Huck wrote:
> On Fri, 14 Feb 2020 09:47:39 +0100
> Michal Privoznik <mprivozn@redhat.com> wrote:
> 
>> In a few places we report errno formatted as a negative integer.
>> This is not as user friendly as it can be. Use strerror() and/or
>> error_setg_errno() instead.
>>
>> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
>> ---
>>   hw/vfio/common.c    | 2 +-
>>   util/vfio-helpers.c | 6 +++---
>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 5ca11488d6..a3a2a82d99 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -352,7 +352,7 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>>           return 0;
>>       }
>>   
>> -    error_report("VFIO_MAP_DMA: %d", -errno);
>> +    error_report("VFIO_MAP_DMA failed: %s", strerror(errno));
>>       return -errno;
>>   }
> 
> I think you missed the one in vfio_dma_unmap().
> 

Indeed, will send v2.

Michal


