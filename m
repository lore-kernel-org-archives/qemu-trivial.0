Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgJO0-0006D0-2y
	for mharc-qemu-trivial@gnu.org; Mon, 10 May 2021 23:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgJNv-0006BC-J2
 for qemu-trivial@nongnu.org; Mon, 10 May 2021 23:48:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgJNr-0002Dw-Rs
 for qemu-trivial@nongnu.org; Mon, 10 May 2021 23:48:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620704914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IqEo5Qw9lSgAeADNlf9Um8/oIHZMJ2xDdqsbcEfsQuQ=;
 b=AbtwzBum8PlqBec+7hBAV7LP92hHEJlMAJCk4uLMkj/FZht68USVcgNhqq0RbUe0KSalnR
 txIGnGqwEpTLh1kO3PXcvNWp8UC6xvGEFYCyoQp7aQYlbQW2zNEJVPJt5JaJRjuvxXGOVw
 aOEOQ6SPGgA8wspIL5imKx7zFzvCQ/E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-X6PH5KXuMgKnY1knAN7Sgg-1; Mon, 10 May 2021 23:48:31 -0400
X-MC-Unique: X6PH5KXuMgKnY1knAN7Sgg-1
Received: by mail-ed1-f71.google.com with SMTP id
 y17-20020a0564023591b02903886c26ada4so10201438edc.5
 for <qemu-trivial@nongnu.org>; Mon, 10 May 2021 20:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IqEo5Qw9lSgAeADNlf9Um8/oIHZMJ2xDdqsbcEfsQuQ=;
 b=DGK9zYY4J7e3KaMzFsfYjc2SPG1XgOH3BxHBaelpJd1nM9dtRfHfgt7auj55A7tx7l
 W0RDCHLBorylDsDSb706YctZM9GioNmNK9qhlMugPobeieImypK648GcOwZ4mIMd1LU7
 EcsdEbXUFn/WN6MiNgdNP9skHlEPAKVuX2J07EZpm0/hIHpmjmWvPVV7BsonycQAUrut
 DL5ZmR/J8C/SQL3ccXleF5Y2TqNgl/vo124Kz9TURG22s+j6XPoi1fYC7sEXNLbcN43X
 MoFMI//gOkJcr3+hnyIj1pTBrauKM2xDVjKcmVYkInYU1TC8XQ3DkSz1RGvuGZq2AuDZ
 Q5yA==
X-Gm-Message-State: AOAM533NR+ITKnYaa3pGNTn0mINxoxVBlypCpmFUXEu5l/GltjXgRxmJ
 mQQSN3y/QFGPggcphZd6BSw2ox/W+rJ0BTlMxSkctW2+sxwDv0KZHgdkNemiHPG8bQoUjrZYQ0y
 Sni07txewhd19xhu7iA==
X-Received: by 2002:a17:906:91d3:: with SMTP id
 b19mr29347243ejx.242.1620704909857; 
 Mon, 10 May 2021 20:48:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyK/C9QoZgE83kf7GQdvk+WbJOp645EFvCmUI5wNMOp5TCcqBFFDKLSQHXmo7Jn0zLXf7ZFIA==
X-Received: by 2002:a17:906:91d3:: with SMTP id
 b19mr29347229ejx.242.1620704909686; 
 Mon, 10 May 2021 20:48:29 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n12sm13185788edw.95.2021.05.10.20.48.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 20:48:29 -0700 (PDT)
Subject: Re: [PATCH-for-6.0] hw/mem/meson: Fix linking sparse-mem device with
 fuzzer
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: qemu-devel@nongnu.org, Darren Kenny <darren.kenny@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20210406133944.4193691-1-philmd@redhat.com>
 <20210406143928.shfhgsdupbjqgohc@mozz.bu.edu>
 <31e0de30-c461-33d5-9f12-0f2505aed049@redhat.com>
Message-ID: <60e2df83-b2e2-e710-5abf-ab3b812e7465@redhat.com>
Date: Tue, 11 May 2021 05:48:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <31e0de30-c461-33d5-9f12-0f2505aed049@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
X-List-Received-Date: Tue, 11 May 2021 03:48:41 -0000

Cc'ing qemu-trivial (patch reviewed).

On 4/12/21 1:07 PM, Philippe Mathieu-Daudé wrote:
> ping?
> 
> On 4/6/21 4:39 PM, Alexander Bulekov wrote:
>> On 210406 1539, Philippe Mathieu-Daudé wrote:
>>> sparse-mem.c is added to the 'mem_ss' source set, which itself
>>> is conditionally added to softmmu_ss if CONFIG_MEM_DEVICE is
>>> selected.
>>> But if CONFIG_MEM_DEVICE isn't selected, we get a link failure
>>> even if CONFIG_FUZZ is selected:
>>>
>>>   /usr/bin/ld: tests_qtest_fuzz_generic_fuzz.c.o: in function `generic_pre_fuzz':
>>>   tests/qtest/fuzz/generic_fuzz.c:826: undefined reference to `sparse_mem_init'
>>>   clang-10: error: linker command failed with exit code 1 (use -v to see invocation)
>>>
>>> Fix by adding sparse-mem.c directly to the softmmu_ss set.
>>>
>>> Fixes: 230376d285b ("memory: add a sparse memory device for fuzzing")
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> Oops..
>> Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
>>
>>> ---
>>>  hw/mem/meson.build | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/mem/meson.build b/hw/mem/meson.build
>>> index ef79e046787..3c8fdef9f9e 100644
>>> --- a/hw/mem/meson.build
>>> +++ b/hw/mem/meson.build
>>> @@ -1,8 +1,9 @@
>>>  mem_ss = ss.source_set()
>>>  mem_ss.add(files('memory-device.c'))
>>> -mem_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
>>>  mem_ss.add(when: 'CONFIG_DIMM', if_true: files('pc-dimm.c'))
>>>  mem_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_mc.c'))
>>>  mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
>>>  
>>>  softmmu_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
>>> +
>>> +softmmu_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
>>> -- 
>>> 2.26.3
>>>
>>>
>>
> 


