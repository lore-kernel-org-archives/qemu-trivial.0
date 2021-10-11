Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mZzP8-0008Rs-PQ
	for mharc-qemu-trivial@gnu.org; Mon, 11 Oct 2021 13:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZzP7-0008PY-Fe
 for qemu-trivial@nongnu.org; Mon, 11 Oct 2021 13:48:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZzP4-00085G-JF
 for qemu-trivial@nongnu.org; Mon, 11 Oct 2021 13:48:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633974477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+QbFSAO9rNC+thx855cg68HNU4PSWCz7KnKF5Iu9kLc=;
 b=FCO7KxuBVI6QzorbpNJ0rgulfLdqJOV6J09M3PfmvQroksZC958vCtFq2vgvNwsd/8br+0
 zQjZ2kfV3cQdCspK61YD/wM7YzUNOZ+9WZkayct5C3U5aWaSTY64bLBkCWiTPtgdHRGbX8
 E0ZFDZxDay8ER3zV1O68YSqoJhZbB3c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-mKH7HEioMPim0ZPkgfvC0g-1; Mon, 11 Oct 2021 13:47:56 -0400
X-MC-Unique: mKH7HEioMPim0ZPkgfvC0g-1
Received: by mail-wr1-f71.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so13845384wrb.14
 for <qemu-trivial@nongnu.org>; Mon, 11 Oct 2021 10:47:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+QbFSAO9rNC+thx855cg68HNU4PSWCz7KnKF5Iu9kLc=;
 b=SG5EnYGTbL9k0kHuakTspP4X0t12vG0EfDZzak557OziI9GXZo2Dcc6nn6hz6E/5Lr
 F83DnsjIAsAhmISd/LRAjcn+84sMD1KjPC8CjHaduudjp+Q871aA2aiDVbTiwjQ3OX7r
 GRGNGI+KnpVZsec2yeqzKU57kJixE2ri/Ar9N85NnqtfsddtT5hpAdtaSTghM/Z/bK8s
 h9vrI8T3keO2vpkIxjWKp596x+WUuyGJc1xkjKwSMVe6f+p2cJKKuvl6TRjCWw5AYzE2
 Qg8jZjctKCyIcCPpRREAOUBptx978T8DeAM4Kciu4bynFai1NrEsbriZMkasvhDpPAyG
 X8fA==
X-Gm-Message-State: AOAM532UTP9ydtKQ64vwgNuuzMd17WB0XQ/GSbLPeGPGd/HRR63uGiQN
 U8DYvrcQQn9OwBPSbesGuenf+KiZuNuZgZTsNvRkLVANSc1RLAQqE4egcOL37+Dju08aM3z35Za
 AnX8suQpQDwJRw2UQXQ==
X-Received: by 2002:a05:600c:354c:: with SMTP id
 i12mr14195wmq.59.1633974475482; 
 Mon, 11 Oct 2021 10:47:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyY0HYaaMLvRsNAAn73oq711KiBXslwS5lEJfGDBu/rQx9fCbpQVeKspcJI40/ja56GqCZAWA==
X-Received: by 2002:a05:600c:354c:: with SMTP id
 i12mr14157wmq.59.1633974475166; 
 Mon, 11 Oct 2021 10:47:55 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64ba.dip0.t-ipconnect.de. [91.12.100.186])
 by smtp.gmail.com with ESMTPSA id f18sm8797683wrg.3.2021.10.11.10.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 10:47:54 -0700 (PDT)
Subject: Re: [PATCH] memory: Log access direction for invalid accesses
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20211011173616.F1DE0756022@zero.eik.bme.hu>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <7d61c90f-4279-2a2a-18fd-1865f8560b4d@redhat.com>
Date: Mon, 11 Oct 2021 19:47:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211011173616.F1DE0756022@zero.eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 11 Oct 2021 17:48:01 -0000

On 11.10.21 19:32, BALATON Zoltan wrote:
> In memory_region_access_valid() invalid accesses are logged to help
> debugging but the log message does not say if it was a read or write.
> Log that too to better identify the access causing the problem.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   softmmu/memory.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index db182e5d3d..e5826faa0c 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1378,17 +1378,17 @@ bool memory_region_access_valid(MemoryRegion *mr,
>   {
>       if (mr->ops->valid.accepts
>           && !mr->ops->valid.accepts(mr->opaque, addr, size, is_write, attrs)) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "Invalid access at addr "
> -                                       "0x%" HWADDR_PRIX ", size %u, "
> -                                       "region '%s', reason: rejected\n",
> +        qemu_log_mask(LOG_GUEST_ERROR, "Invalid %s at addr 0x%" HWADDR_PRIX
> +                      ", size %u, region '%s', reason: rejected\n",
> +                      is_write ? "write" : "read",
>                         addr, size, memory_region_name(mr));
>           return false;
>       }
>   
>       if (!mr->ops->valid.unaligned && (addr & (size - 1))) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "Invalid access at addr "
> -                                       "0x%" HWADDR_PRIX ", size %u, "
> -                                       "region '%s', reason: unaligned\n",
> +        qemu_log_mask(LOG_GUEST_ERROR, "Invalid %s at addr 0x%" HWADDR_PRIX
> +                      ", size %u, region '%s', reason: unaligned\n",
> +                      is_write ? "write" : "read",
>                         addr, size, memory_region_name(mr));
>           return false;
>       }
> @@ -1400,10 +1400,10 @@ bool memory_region_access_valid(MemoryRegion *mr,
>   
>       if (size > mr->ops->valid.max_access_size
>           || size < mr->ops->valid.min_access_size) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "Invalid access at addr "
> -                                       "0x%" HWADDR_PRIX ", size %u, "
> -                                       "region '%s', reason: invalid size "
> -                                       "(min:%u max:%u)\n",
> +        qemu_log_mask(LOG_GUEST_ERROR, "Invalid %s at addr 0x%" HWADDR_PRIX
> +                      ", size %u, region '%s', reason: invalid size "
> +                      "(min:%u max:%u)\n",
> +                      is_write ? "write" : "read",
>                         addr, size, memory_region_name(mr),
>                         mr->ops->valid.min_access_size,
>                         mr->ops->valid.max_access_size);
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


