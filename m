Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYmzA-0001rD-3Q
	for mharc-qemu-trivial@gnu.org; Fri, 17 Jan 2025 09:06:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1tYmz8-0001qO-AX
 for qemu-trivial@nongnu.org; Fri, 17 Jan 2025 09:06:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1tYmz5-000654-Pz
 for qemu-trivial@nongnu.org; Fri, 17 Jan 2025 09:06:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737122762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3/DYc+7yVdObzlMoG4kdXIf7FEyFchXDz5IdKcKY+eA=;
 b=fZQPXr3uKtVQNjgKR8ajZsykLU80qbErv4pxcgcQnK8Xprg/pet3TwcNxsBd8sSrTFACNx
 FIuEyqFFEvrpbvABayQEtTWYUxMsVD2MAe9EfYRHOt0X/oedJvxALPBsPCLBdjxX3IhCmQ
 aom1CpfPj2yFqHdyQBC7+TZ8luYwct8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-0xBtMR8uM8KB5y05pgG-sQ-1; Fri, 17 Jan 2025 09:06:01 -0500
X-MC-Unique: 0xBtMR8uM8KB5y05pgG-sQ-1
X-Mimecast-MFC-AGG-ID: 0xBtMR8uM8KB5y05pgG-sQ
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7b6e178d4f8so330424585a.3
 for <qemu-trivial@nongnu.org>; Fri, 17 Jan 2025 06:06:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737122760; x=1737727560;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3/DYc+7yVdObzlMoG4kdXIf7FEyFchXDz5IdKcKY+eA=;
 b=VrbKNLD0KxUxUkqZHQxRZ1hYjoPtgrHR7D+ddgvnadsxuTgCekWNeqoanJjwoXBzI4
 /uyYDU/vt62v/tAocEkZyAqOZ4iwIJhtwDJR6ELu6MsJRKAxH+RbJtbOXDrKbsHu3UU9
 fyecIkxXCsHC4PmC1mDe2QMMx8tYn7BgxsOOjRuBzASFaB891erFGkIT6ZyIh8Pq/ick
 5bFoVIqcYX8q+mQUzf5SdyoGUs2e3utvFiimuEoyUz6R5uXn5V8yim7lQP2QvGFxSeeP
 5wbjOt6Bkq3SZnTci5xokvOnZzokARLUETeeZzKxJV3WZrQaG4TRm70ziX9mUbqifJb6
 bkjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV4az5/ypiMzDH2U9bz0JloLgofzkKeApJAAzo8UgCtJiZyi5L5c76hR8PRxe3Jwix9Gj3BBrW9Wuh00c=@nongnu.org
X-Gm-Message-State: AOJu0Yx/V2Dm1qLG67BahDYglpovEwv6YbAyKIUu7Ij0eCn33H9yorpe
 FOKC2g443KOMYhnP478BYPkawGtPFxxLiqYIhZae+iY/xMqq9l2bckb8z6B18YYjI+x8GR00MnW
 LsIm93sk7lCKTaJXTf8fP79CCCCGvUFlRg7fuA7nR8YKrz+r0V+iR2js=
X-Gm-Gg: ASbGncvcllWLzyyaX0C7lOINHu4C2Ev2IHiQS1fFalrtPMi5xH/Clky5B1NKGWwaJ+H
 qdqxsOhXXDgyocgUA/sCTfGPO0hCQnifLDEg8FpWVM4eRfoCT9RUsF9ONTU0KcUwBwVF2QgG7NI
 9B2jdZbpbcbJAkueh3UWCCY5iReaZ/qG6XxsjLT9cQpodgenTxQXLnrB/jGosL6gvNIYzrUzlUK
 dHNsIns0nTFjTUeFdOw8sQgacy8iKi0GOnQXoQkWgPT3MW4vsXyQmQku6ItYACCq6CAloQfGlj0
 GEOymZ7KrQBLySPV5R4=
X-Received: by 2002:a05:620a:2894:b0:7b6:d611:5d35 with SMTP id
 af79cd13be357-7be63249f09mr402482585a.32.1737122760206; 
 Fri, 17 Jan 2025 06:06:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzgthHyCQuQCs0f990+8+u1trHywbfBBBxFvGEso0mTZon1DD7jg+wduEYvMSa2l/Y8eCajg==
X-Received: by 2002:a05:620a:2894:b0:7b6:d611:5d35 with SMTP id
 af79cd13be357-7be63249f09mr402479785a.32.1737122759886; 
 Fri, 17 Jan 2025 06:05:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e10:ef90:343a:68f:2e91:95c?
 ([2a01:e0a:e10:ef90:343a:68f:2e91:95c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7be61473cb9sm115733185a.11.2025.01.17.06.05.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jan 2025 06:05:59 -0800 (PST)
Message-ID: <fee03f11-bcf5-4586-abc1-2d38ce6a7f9c@redhat.com>
Date: Fri, 17 Jan 2025 15:05:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] net: Fix announce_self with vhost
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
 qemu-stable@nongnu.org
References: <20250117111709.970789-1-lvivier@redhat.com>
Autocrypt: addr=lvivier@redhat.com; keydata=
 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
In-Reply-To: <20250117111709.970789-1-lvivier@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: D7KW6RyHR059TEvjYy8AFlnuH6Dksrb2tyKWKUjdItk_1737122760
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 17 Jan 2025 14:06:06 -0000

CC: qemu-stable and qemu-trivial.

On 17/01/2025 12:17, Laurent Vivier wrote:
> announce_self that sends a RARP packet after migration
> or with announce_self QMP/HMP command doesn't work with
> vhost because of the vnet headers.
> 
> announce_self is the only user of QEMU_NET_PACKET_FLAG_RAW and
> this flag is not correctly managed.
> 
> This series fix a problem with this flag in filter-dump and in
> qemu_deliver_packet_iov().
> 
> Laurent Vivier (2):
>    net: Fix announce_self
>    net/dump: Correctly compute Ethernet packet offset
> 
>   net/dump.c | 3 ++-
>   net/net.c  | 1 +
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 


