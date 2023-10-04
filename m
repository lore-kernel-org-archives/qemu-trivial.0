Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qnzk5-00074y-Gu
	for mharc-qemu-trivial@gnu.org; Wed, 04 Oct 2023 07:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qnzk1-0006uZ-BZ
 for qemu-trivial@nongnu.org; Wed, 04 Oct 2023 07:08:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qnzjz-00047s-N1
 for qemu-trivial@nongnu.org; Wed, 04 Oct 2023 07:08:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696417710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nivnr0iv1DS2BqjL93n1UyJaBBNCY4t/SkIQNAI3BAo=;
 b=IwOmVqdDB082m46IQXWmLfoQ+ujF3c/yNVcHc6HiF+qSd0HWorLD+jGGEEZ6h6UevnkRTw
 aJ3NXLekjJTbuRY19eQ8jw9L9EV+ndo8c3nb66Lsg49S65iCdf5kNDl9fy8A3KbYx1Uwu5
 IPQ4qamxwOYvPMeMdAtMh0xGnFA9idE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-OU2V4B4COFmaVh-bcEbnEA-1; Wed, 04 Oct 2023 07:08:29 -0400
X-MC-Unique: OU2V4B4COFmaVh-bcEbnEA-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-774294bde69so115438685a.1
 for <qemu-trivial@nongnu.org>; Wed, 04 Oct 2023 04:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696417709; x=1697022509;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nivnr0iv1DS2BqjL93n1UyJaBBNCY4t/SkIQNAI3BAo=;
 b=sz7Q5a1UYJtJmPhcqCaYgHTNbMyOwVmPzrufAEWfiGsW9UvEfnrzPLm20xBYaWzzMt
 qBaKlGqULnumJ8miWgo7qkgC3SpJyiaBzoH5Ib8CP4Xswkg30B7EskQN05o9uPNwBIxw
 0ko0m2DqSx8jOzvwKPe85W4zPWuAEyWaPepxSXRfZRp8Q1CGytzPflk2S2OC/qusFL4O
 2+K0m53jrMzOLVkp3HgVtc4MUji6ZsU44p3ybYbddsYEmQ/g/VQzhXmQd5vUEPYi1YTX
 58e509Nh8A4CfsNhep8Q9VkViw9MLWkuvOiXp/xHF7h/1Pg30SZa28N0w5Ga1eor4k/3
 M6/w==
X-Gm-Message-State: AOJu0YyQDiSBlCewj3v147/KjSHve9uizua866kR8wrddknjmnUcwMzy
 0teylIpg8CvkCJooYvgHl4+POdZ6SJLoErvy6xtQfJfP9z2xrEq4sPwaceDQ0UKiWX8AFhHyMUy
 lFnvWh3lDoXTSth+DKQ==
X-Received: by 2002:a05:620a:459e:b0:774:2afe:97c4 with SMTP id
 bp30-20020a05620a459e00b007742afe97c4mr6697321qkb.12.1696417708726; 
 Wed, 04 Oct 2023 04:08:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFiXF483LQ36s9drVpxH0l+D4gmvYbLYuJlcYrnHwN2Lkt0CfPSCKHMXFZQ7J9MjzJZ4UH8A==
X-Received: by 2002:a05:620a:459e:b0:774:2afe:97c4 with SMTP id
 bp30-20020a05620a459e00b007742afe97c4mr6697300qkb.12.1696417708477; 
 Wed, 04 Oct 2023 04:08:28 -0700 (PDT)
Received: from [10.33.192.181] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 g27-20020a05620a13db00b00770f3e5618esm1173943qkl.101.2023.10.04.04.08.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Oct 2023 04:08:28 -0700 (PDT)
Message-ID: <c3e2e15d-f4dd-a5bd-eab7-f4db9f93626e@redhat.com>
Date: Wed, 4 Oct 2023 13:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] hw/virtio/virtio-pci: Avoid compiler warning with -Wshadow
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-trivial@nongnu.org
References: <20231004075536.48219-1-thuth@redhat.com>
 <87bkdeiri9.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87bkdeiri9.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 04 Oct 2023 11:08:34 -0000

On 04/10/2023 12.58, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> "len" is used as parameter of the function virtio_write_config()
>> and as a local variable, so this causes a compiler warning
>> when compiling with "-Wshadow" and can be confusing for the reader.
>> Rename the local variable to "caplen" to avoid this problem.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   hw/virtio/virtio-pci.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
>> index edbc0daa18..d0ef1edd66 100644
>> --- a/hw/virtio/virtio-pci.c
>> +++ b/hw/virtio/virtio-pci.c
>> @@ -780,15 +780,15 @@ static void virtio_write_config(PCIDevice *pci_dev, uint32_t address,
>>                                                                     pci_cfg_data),
>>                          sizeof cfg->pci_cfg_data)) {
>>           uint32_t off;
>> -        uint32_t len;
>> +        uint32_t caplen;
>>   
>>           cfg = (void *)(proxy->pci_dev.config + proxy->config_cap);
>>           off = le32_to_cpu(cfg->cap.offset);
>> -        len = le32_to_cpu(cfg->cap.length);
>> +        caplen = le32_to_cpu(cfg->cap.length);
>>   
>> -        if (len == 1 || len == 2 || len == 4) {
>> -            assert(len <= sizeof cfg->pci_cfg_data);
>> -            virtio_address_space_write(proxy, off, cfg->pci_cfg_data, len);
>> +        if (caplen == 1 || caplen == 2 || caplen == 4) {
>> +            assert(caplen <= sizeof cfg->pci_cfg_data);
>> +            virtio_address_space_write(proxy, off, cfg->pci_cfg_data, caplen);
>>           }
>>       }
>>   }
> 
> I see the same warning in virtio_read_config().  Care to patch that,
> too?

Patch is already on the list:
https://lore.kernel.org/qemu-devel/20231004095302.99037-1-thuth@redhat.com/

  Thomas



