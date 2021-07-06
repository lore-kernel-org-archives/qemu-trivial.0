Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m0hwD-0005fz-5H
	for mharc-qemu-trivial@gnu.org; Tue, 06 Jul 2021 06:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0hwB-0005Xx-3o
 for qemu-trivial@nongnu.org; Tue, 06 Jul 2021 06:04:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0hw8-0003bt-PF
 for qemu-trivial@nongnu.org; Tue, 06 Jul 2021 06:04:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625565856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTNqeTDlsq6qcIV5wmI/vNTDAwqBOgdm1QdifDPmkWo=;
 b=K2SDLZOzZw3IId0ysryhjrEj74+50h79BAYgtchdfEiloRisgA5npc5+Dga8PKNPDtoDiR
 R9Yv5zOnU6ot7V5IT1a3gWPkl7Oaj+j71uSCpxZqtdshZUbwMEisb7F8HZ+fMpMoKgPcgD
 WK2mzCIE9nGeJIloXqkduVXXYdrfQ6o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-_Lgprd_VMHK-WAaLnA84Cg-1; Tue, 06 Jul 2021 06:04:15 -0400
X-MC-Unique: _Lgprd_VMHK-WAaLnA84Cg-1
Received: by mail-wr1-f69.google.com with SMTP id
 r11-20020a5d52cb0000b02901309f5e7298so3642839wrv.0
 for <qemu-trivial@nongnu.org>; Tue, 06 Jul 2021 03:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LTNqeTDlsq6qcIV5wmI/vNTDAwqBOgdm1QdifDPmkWo=;
 b=jOjgEOoFN5huoHJoyCSMYq+qp7JxC/XoEgoRwJKdjJ5IqLxOOcznepLmUG2AuEv9Us
 EYbUEard+Y3CWFwwPFuulCoYT+C7VLLj0jwJvSu9tybY9L5kNxv7+jBIMWWSkf9Tcbh5
 Xs7SU6oVzZl6xZ9n42AWHX7y+PAUQ42zjp52lXODl9rVxJ3FLzuq9b9HBeAba7YUAkbD
 6U7hIzxJ4h5nQeykKjWZgD+u+ICRtm8e3hgv6SxFS675PytNdCYboMI5jdwROrp4GKef
 ikjKbZ/jkdHeBgpDz6bKnlI6/kmnkuVcvQUYIfoZfSzYq+Fq+S8zTyX/ECwKLjjy+Ft1
 VE7A==
X-Gm-Message-State: AOAM53313fCRseJUyxNMrQzKEWBYbW4b65vDR/50hZFdrEopUCLhxrtx
 o1ifBjVxpPPPI314m1kfXIpQt4mU4qlVZGUWPOLYhVFCAPQ04/1pxO5lb+p6bA8LEyLbzlS5u5E
 wF2mnwBN8y0Kxm9W2Kw==
X-Received: by 2002:a5d:48ce:: with SMTP id p14mr21109044wrs.170.1625565853896; 
 Tue, 06 Jul 2021 03:04:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCBAIT1p1Urx5sbVJZnStb/DLpXmGm2o2/aB8rYvhirInmJpnq/cqxfXhHGHNaHp/YyPEimg==
X-Received: by 2002:a5d:48ce:: with SMTP id p14mr21109032wrs.170.1625565853781; 
 Tue, 06 Jul 2021 03:04:13 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f6sm15906358wrs.13.2021.07.06.03.04.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 03:04:13 -0700 (PDT)
Subject: Re: [PATCH v2] hw/virtio: Document *_should_notify() are called
 within rcu_read_lock()
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
References: <20210523094040.3516968-1-philmd@redhat.com>
 <d3198f6b-3bce-1686-2123-e1c44479bdf9@redhat.com>
Message-ID: <5711b02d-5cc0-414c-eb5c-4e8a7f191088@redhat.com>
Date: Tue, 6 Jul 2021 12:04:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d3198f6b-3bce-1686-2123-e1c44479bdf9@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Tue, 06 Jul 2021 10:04:19 -0000

Hi Michael, since I asked a modification on v1, I suppose
this patch is somehow worth in documentation, so I'm
pinging again. It could go via qemu-trival if you ack it.

On 6/21/21 12:06 PM, Philippe Mathieu-Daudé wrote:
> ping?
> 
> On 5/23/21 11:40 AM, Philippe Mathieu-Daudé wrote:
>> Such comments make reviewing this file somehow easier.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> v2: only one space before end of comment (mst)
>> ---
>>  hw/virtio/virtio.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>> index e02544b2df7..130e3568409 100644
>> --- a/hw/virtio/virtio.c
>> +++ b/hw/virtio/virtio.c
>> @@ -2449,6 +2449,7 @@ static void virtio_set_isr(VirtIODevice *vdev, int value)
>>      }
>>  }
>>  
>> +/* Called within rcu_read_lock(). */
>>  static bool virtio_split_should_notify(VirtIODevice *vdev, VirtQueue *vq)
>>  {
>>      uint16_t old, new;
>> @@ -2485,6 +2486,7 @@ static bool vring_packed_need_event(VirtQueue *vq, bool wrap,
>>      return vring_need_event(off, new, old);
>>  }
>>  
>> +/* Called within rcu_read_lock(). */
>>  static bool virtio_packed_should_notify(VirtIODevice *vdev, VirtQueue *vq)
>>  {
>>      VRingPackedDescEvent e;
>>
> 


