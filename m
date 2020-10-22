Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kVbm6-0006nU-8e
	for mharc-qemu-trivial@gnu.org; Thu, 22 Oct 2020 10:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kVbm4-0006my-Sw
 for qemu-trivial@nongnu.org; Thu, 22 Oct 2020 10:41:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kVbm1-0005W4-BD
 for qemu-trivial@nongnu.org; Thu, 22 Oct 2020 10:41:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603377659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8WvqbHVYogtLzlHc/a3Kgy8w9owMRFq4ObfFfOYCJlQ=;
 b=TNGTh1BXmlmzEtYxkhiVwQFfNBskCBUKiYgS8Amq3sz1ugM9beeb0k8X6v2R6bhns70VNl
 2K2ShO/rV6SKxwoS1bZKTYqtcJMe6OmP5KiS2e6Ckb/cwp0WTmaR5yY2q3HYGLV7BluX5O
 jS9mtUmJXlilCMwVjyFCgQ4yFitpfZo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-sTwE1npKMXyrIQUCxXbZNA-1; Thu, 22 Oct 2020 10:40:58 -0400
X-MC-Unique: sTwE1npKMXyrIQUCxXbZNA-1
Received: by mail-wr1-f72.google.com with SMTP id t11so710918wrv.10
 for <qemu-trivial@nongnu.org>; Thu, 22 Oct 2020 07:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8WvqbHVYogtLzlHc/a3Kgy8w9owMRFq4ObfFfOYCJlQ=;
 b=sVwytrs75r7OBqj6NMOE6CnvW4qLyIm3GySDXNCtT60hQ89JfR/YOCeYvDWMqE6YXy
 2EjnxcuZu/qmjB5/kLavZdi6wVjwYTZIHnrRaEd0ln6vTEpGlqWXOUQOlsN2IkjU2Lpq
 AFRp3z6EMlChUlwh867rqVUi5hSnaNixGa5AHCM3i1sE0xG/NsZCY7W6Dn/1Iu9CfHIP
 rguInTwrMOAXGxjawFNNKvM/LuaQr10cwRP+lz+V743nb0Tue0/B8C/ndIhOIttnh/2Z
 b657Q2Umw+UvLVmso9RhvFkizLo6NSfL84UjSouQV6YjsHD9U3yP1jw6ov6zhNyxQ5KR
 6WOg==
X-Gm-Message-State: AOAM530qtGfUUjzPLFk/PZ63316frsqaWNnxk8YFdi5wR/r0aP4pdjc+
 wA6lrxS90KFQNPMkx5kNZcogHZlmSZMojENzSVztG0L8RVl537ic6hK6nYePqw2Bc0Zv0n+cu0M
 3Q0b5VQQKLsBBEAVB/Q==
X-Received: by 2002:adf:9c19:: with SMTP id f25mr3041463wrc.366.1603377656832; 
 Thu, 22 Oct 2020 07:40:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxa4FL98fkGVyL7mwGAoI1dwHbhQjOUjxEdq2m+u2fzW+0UUblWr8HNfC10UITJTrmLzOybtA==
X-Received: by 2002:adf:9c19:: with SMTP id f25mr3041444wrc.366.1603377656600; 
 Thu, 22 Oct 2020 07:40:56 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id x1sm3900666wrl.41.2020.10.22.07.40.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2020 07:40:56 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Cover "block/nvme.h" file
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Keith Busch <kbusch@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Niklas Cassel <Niklas.Cassel@wdc.com>, Klaus Jensen <its@irrelevant.dk>,
 Klaus Jensen <k.jensen@samsung.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
References: <20200701140634.25994-1-philmd@redhat.com>
 <ccdce593-67fc-1ed5-c05c-c64d45cf5515@redhat.com>
Message-ID: <9dba9f82-4a08-ce73-61d7-0a5740df42ef@redhat.com>
Date: Thu, 22 Oct 2020 16:40:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <ccdce593-67fc-1ed5-c05c-c64d45cf5515@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 08:33:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.107, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 22 Oct 2020 14:41:05 -0000

On 10/22/20 4:20 PM, Philippe Mathieu-Daudé wrote:
> Cc'ing qemu-trivial@

Bah it doesn't apply anymore, I'll resend.

> 
> On 7/1/20 4:06 PM, Philippe Mathieu-Daudé wrote:
>> The "block/nvme.h" header is shared by both the NVMe block
>> driver and the NVMe emulated device. Add the 'F:' entry on
>> both sections, so all maintainers/reviewers are notified
>> when it is changed.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>


