Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lqsOB-0005Dr-O9
	for mharc-qemu-trivial@gnu.org; Wed, 09 Jun 2021 03:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqsOA-0005CC-OJ
 for qemu-trivial@nongnu.org; Wed, 09 Jun 2021 03:12:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqsO8-000288-9d
 for qemu-trivial@nongnu.org; Wed, 09 Jun 2021 03:12:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623222750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fA1bVP8D6Yi1mfcqUVu0XeNF6cQUVoehe01yhsl6C4g=;
 b=T9FvkJsC4s7baSwlgax/CFIJPqCHB8BobjQslm/ea31uUisHvtbX2qeax6Gboxrq78xYJM
 MIh/E3fhgDdtly/V4z/JjKYEB8H1rYltEaqjKHthT1BhieIb6k9ksk0MSX8PW8P3WFc/r1
 duMQLG76zSHpR3W9rllD3QS4B3gnpPw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-HMYWlbAuNE-kzb5nTlTERQ-1; Wed, 09 Jun 2021 03:12:29 -0400
X-MC-Unique: HMYWlbAuNE-kzb5nTlTERQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 g14-20020a5d698e0000b0290117735bd4d3so10255517wru.13
 for <qemu-trivial@nongnu.org>; Wed, 09 Jun 2021 00:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fA1bVP8D6Yi1mfcqUVu0XeNF6cQUVoehe01yhsl6C4g=;
 b=AmhzqyzIBXxQh/goEHxoe2QgtZlsBYRr45JS56vSkxDYultiiTk/rBDuXFeRntWwtf
 i5EXNSbFF5TI8TB+kXi6a7KM7z0tXF+3quO9prD9bEMYmeYZ/p9ersNen1wJdzgipNMb
 HyvBgxQfXrPfh+OWB+VtIypkxaLJtzSumDtVV32gaFjkl0mbz2NWX5Yaom19PfKvaFym
 k7Lcp35lcl6+KRSXezJzyCaZUOCwCN8cTMohD+bPRa92m8snS/Xd1ZRh8a/j9ypDyEP1
 YhIDYMQpMi1ZpCyc7pf/O3xFABmraH29CY80c1v3TNg7TFG4hapN6gu+TIVN9/xduttf
 LeSg==
X-Gm-Message-State: AOAM5325B1f3Al/DNMmobLgxCkNQPDzqHpFiF3v7av86oHFmGbZH+zIl
 U0kOPWRwRCiRDutISxSB/wXjrD5FAbr+hp/qG1Ntudvd3FkZRK9h+KrJ7uuUVq9R81ZhNiP6cDE
 eSVUxW7pGxSNNTrpa1g==
X-Received: by 2002:a7b:c8ce:: with SMTP id f14mr25733633wml.88.1623222748002; 
 Wed, 09 Jun 2021 00:12:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAOd/PcSWpGQZ7ALnEYSBdnnKApRgivwoEFn6ePeUndEBc67S4pWHJVId782FadEkaIrVB5A==
X-Received: by 2002:a7b:c8ce:: with SMTP id f14mr25733603wml.88.1623222747773; 
 Wed, 09 Jun 2021 00:12:27 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83d80.dip0.t-ipconnect.de.
 [217.232.61.128])
 by smtp.gmail.com with ESMTPSA id f18sm20057897wmj.13.2021.06.09.00.12.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 00:12:27 -0700 (PDT)
Subject: Re: Prevent compiler warning on block.c
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
References: <1162368493.17178530.1620201543649.JavaMail.zimbra@redhat.com>
 <62c90da0-b2f9-7068-e84f-c13bb1527191@virtuozzo.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9ef22266-25e1-36df-52e9-ad5244a648dc@redhat.com>
Date: Wed, 9 Jun 2021 09:12:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <62c90da0-b2f9-7068-e84f-c13bb1527191@virtuozzo.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Wed, 09 Jun 2021 07:12:35 -0000

On 05/05/2021 10.05, Vladimir Sementsov-Ogievskiy wrote:
> 05.05.2021 10:59, Miroslav Rezanina wrote:
>> Commit 3108a15cf (block: introduce bdrv_drop_filter()) introduced 
>> uninitialized
>> variable to_cow_parent in bdrv_replace_node_common function that is used 
>> only when
>> detach_subchain is true. It is used in two places. First if block properly 
>> initialize
>> the variable and second block use it.
>>
>> However, compiler treats this two blocks as two independent cases so it 
>> thinks first
>> block can fail test and second one pass (although both use same 
>> condition). This cause
>> warning that variable can be uninitialized in second block.
>>
>> To prevent this warning, initialize the variable with NULL.
>>
>> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
>> ---
>> diff --git a/block.c b/block.c
>> index 874c22c43e..3ca27bd2d9 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -4851,7 +4851,7 @@ static int bdrv_replace_node_common(BlockDriverState 
>> *from,
>>       Transaction *tran = tran_new();
>>       g_autoptr(GHashTable) found = NULL;
>>       g_autoptr(GSList) refresh_list = NULL;
>> -    BlockDriverState *to_cow_parent;
>> +    BlockDriverState *to_cow_parent = NULL;
>>       int ret;
>>
>>       if (detach_subchain) {
>>
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

This just popped up again here:

  https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg02067.html

Kevin, Max, could you please pick it up to get this problem fixed?

  Thomas


