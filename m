Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kkOW5-0006QY-9i
	for mharc-qemu-trivial@gnu.org; Wed, 02 Dec 2020 04:33:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkOW0-0006Nm-4D
 for qemu-trivial@nongnu.org; Wed, 02 Dec 2020 04:33:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkOVu-0005e2-H9
 for qemu-trivial@nongnu.org; Wed, 02 Dec 2020 04:33:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606901609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KTXWxpAGLg2Lf0sLYFCCY7+N6VnEwC0MyZblFXVWB+E=;
 b=LQSMpHwZ7Mb5q5OmqFTlTn5wQOWcALL3s5f417fKVq/x/12do6kUlXdUYJfnDuF9lJ3WSn
 k/qrAxvWTnmbXmmMIo+d6viJy6MaWYQvUDQXwmvS4dzOWM+NxWPxfIcQ79D3LNa1XHtcqI
 spoKmJJVyjdFC/O9JF6+1hkLfLBhOrs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-EzWWK1nBPoyPQ2Jh1lsJyA-1; Wed, 02 Dec 2020 04:33:27 -0500
X-MC-Unique: EzWWK1nBPoyPQ2Jh1lsJyA-1
Received: by mail-ej1-f69.google.com with SMTP id t17so2226671ejd.12
 for <qemu-trivial@nongnu.org>; Wed, 02 Dec 2020 01:33:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KTXWxpAGLg2Lf0sLYFCCY7+N6VnEwC0MyZblFXVWB+E=;
 b=g1nuS+mbBkmjzCYEyEKJ6ZdPlLNFSh9GcPBpodzAaRjAeHYvQLrF0eKSBdKmviX1fQ
 ddybDpDBIpRAxGAE8EVHlKcGTpXEky+wDA6Y8GdGaag8rr7BTigyf4Bq1TRPIx5ZQz9H
 RByrYPz8gYfZyx3/TtMCK+I0wT5B9Jvkk//+SOf2wW6xrTO5ACF6UPE6UWxpQzrk7eWL
 T46mfd1B4fVA9n2Xi8rDjEZm4JoLjXugdq0hn4ZGq8wxXG3KRiUQt7+228bcUtmeUSI3
 UVQZ0BymGDnH80fZWG3Xm3deij6v19+pDKN5xixbOV0bi7O8uK0J3TuV1V2JARjIK96O
 e2Iw==
X-Gm-Message-State: AOAM531U+PF9B7onhDijhSTNLyXLUZfW71g4ucjjZsaEqVKuR5gUZo1M
 ssdCTQpiQE2EmJh135YPuV6QU6hNbxT1aL+P3yHLpMpxJETem6DDhA2HZKMaYSkFtZv1JDqEyxF
 wkLFlEUSXlI6jNmrBJQ==
X-Received: by 2002:a17:907:3fa3:: with SMTP id
 hr35mr1436523ejc.71.1606901606464; 
 Wed, 02 Dec 2020 01:33:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBcPxBS2x/g1daqpenlaTf4FswHpT005nAiYqsi0UBcCYA0lNkqj8nSONXyN5Cpj6sFsWOjA==
X-Received: by 2002:a17:907:3fa3:: with SMTP id
 hr35mr1436508ejc.71.1606901606226; 
 Wed, 02 Dec 2020 01:33:26 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o11sm750093ejh.55.2020.12.02.01.33.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 01:33:25 -0800 (PST)
Subject: Re: [PATCH 0/4] Use lock guard macros in block
To: Markus Armbruster <armbru@redhat.com>, Gan Qixin <ganqixin@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, kwolf@redhat.com,
 zhang.zhanghailiang@huawei.com, mreitz@redhat.com, dnbrdsky@gmail.com,
 stefanha@redhat.com, kuhn.chenqun@huawei.com
References: <20201109154327.325675-1-ganqixin@huawei.com>
 <87k0u05zq6.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e381219d-7b12-c2a3-5395-cc67c3ebdfae@redhat.com>
Date: Wed, 2 Dec 2020 10:33:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87k0u05zq6.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
X-List-Received-Date: Wed, 02 Dec 2020 09:33:36 -0000

On 02/12/20 10:22, Markus Armbruster wrote:
> Did this fall through the cracks?
> 
> Gan Qixin <ganqixin@huawei.com> writes:
> 
>> Hi all,
>>    I saw some tasks to replace manual lock()/unlock() calls with lock guard macros in BiteSizedTasks.
>> I am very interested in this and modified some of the files under block. Could someone help me check the code?
>>
>> Thanks,
>> Gan Qixin
>>
>> Gan Qixin (4):
>>    block/accounting.c: Use lock guard macros
>>    block/curl.c: Use lock guard macros
>>    block/throttle-groups.c: Use lock guard macros
>>    block/iscsi.c: Use lock guard macros
>>
>>   block/accounting.c      | 32 +++++++++++++--------------
>>   block/curl.c            | 28 ++++++++++++------------
>>   block/iscsi.c           | 28 +++++++++++-------------
>>   block/throttle-groups.c | 48 ++++++++++++++++++++---------------------
>>   4 files changed, 65 insertions(+), 71 deletions(-)
> 

Yes, it did.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


