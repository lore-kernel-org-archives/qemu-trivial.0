Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uVRBH-0006yJ-70
	for mharc-qemu-trivial@gnu.org; Sat, 28 Jun 2025 04:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uVRBE-0006xd-T6
 for qemu-trivial@nongnu.org; Sat, 28 Jun 2025 04:45:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uVRBD-0008E4-B7
 for qemu-trivial@nongnu.org; Sat, 28 Jun 2025 04:45:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751100297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zGaOA3EoKe56V6PTNIDNCgS+XJLqau081bRvVeq8J/s=;
 b=QXxWu19A5cQM6UWc3uofUFUH053RxbDgmVGHUj94DNfOz0fUGIu7tHrQ9YqzHtL2anyDB4
 CGzzhgshBq19bDOqv8DZgP1SFAXPXy75SRmIiW75cRi+2qgyW9gIDepPMPMSCw3lF23Qr3
 ESe9zSMtYr7NKBsdopVkwXvnsSsIN2c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-kQiPCPo1NuKJArpJrx672A-1; Sat, 28 Jun 2025 04:44:56 -0400
X-MC-Unique: kQiPCPo1NuKJArpJrx672A-1
X-Mimecast-MFC-AGG-ID: kQiPCPo1NuKJArpJrx672A_1751100295
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a503f28b09so1475700f8f.0
 for <qemu-trivial@nongnu.org>; Sat, 28 Jun 2025 01:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751100295; x=1751705095;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zGaOA3EoKe56V6PTNIDNCgS+XJLqau081bRvVeq8J/s=;
 b=u0d/q+bq5ifJhcTrEh7cSERODlYSR0aOueNMc39DZA0aUjibOcQjIlxFVzSqANDiRe
 5xOTymn82LYJsJHRGxQX2Cn7c3laDjFvxv6ZsMlMpD94RmNKyLbJoXko5T3tC/YyJ7wd
 FCwHGfwx6kTiVAayXe9vP2urg3PpfcSG3JHMT6bwwc0tHwwYGDTq7iz2p1FabbQ9abDC
 S1BlksyFib3B0IfMfUkYskZzrCBhuw5tkuIcWSFV0GsvjZCvpVMyh45Sll0ulWmIfo33
 Gi4hVuu73PZ3TR9aVc5GcbAsbVa9nb8lNeFeTld2cJMVS+FY+vuHnqZgJBgCEGzdUNL2
 Jwug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqXp8GoAumwidftDJK1QJXRQC/wThPf0gkm040M7gEj7o75Eu85y6W4c+3E3bFPQ3plu3cBsuTxnjB+xo=@nongnu.org
X-Gm-Message-State: AOJu0YzqGt/roAQ+RyEqUIrXWD34NTQYD7K4vYbih3ttOAw0DylkWo1w
 0yma7FQ4ozkNlOsZVrtYoIYozIjYWSDHY/WzIGGUbHVJy20XW2XWPItDH2Smz3fhSZHL8aPDYWW
 lJ0p09T1E+7iN9CAFcYNX+vDpBUHSrru96e3jNuG8dbcwlMOsMxh60PgkfPQ=
X-Gm-Gg: ASbGncvrqTFnqmq4YboUUrmVXKgIcKjAyhw8NdZ3u/70J6r4z5WbKxvCYVfPBib3SzN
 aVnZNCk+r3Umh2+7a4lT8tsNTz4ssYk+6hzw538fesDKwYDbo7OhbS8uhrSURhURIfUrpvM2PrQ
 68fMJHer6RPWYv4+efuo6Pc4EuYZK6g2y0tT76RJKPxlBxptVDSHhnwY3oG0LBns4iTqu/CWMW1
 DdlYtGuV1t+oCI2cnUtuAfo0Cl8e3NM9mNWTWHysBHBFCIf2Mm+Wqn5fyrYF0d5KOYCKKAZJNhl
 3HOZKUdRsYZeT7jYBHTmxv4gRxSF/e8JZbPsQIX38ac4QnVpQ9bntmkhfad9
X-Received: by 2002:a05:6000:40c8:b0:3a4:dfbe:2b14 with SMTP id
 ffacd0b85a97d-3a98b53f408mr5488932f8f.16.1751100294596; 
 Sat, 28 Jun 2025 01:44:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFan0mKCezRjfR/gYiH4DG4DWHrt/1TldIn5rk5snSPzZvuqX8Vh+4H37mntMO5jQ1nSHZ3NA==
X-Received: by 2002:a05:6000:40c8:b0:3a4:dfbe:2b14 with SMTP id
 ffacd0b85a97d-3a98b53f408mr5488909f8f.16.1751100294165; 
 Sat, 28 Jun 2025 01:44:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7fab15sm4855776f8f.33.2025.06.28.01.44.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jun 2025 01:44:53 -0700 (PDT)
Message-ID: <093bb0b9-46ea-459c-ab00-fce228da0854@redhat.com>
Date: Sat, 28 Jun 2025 10:44:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Some trivial live update fixes
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, eric.auger@redhat.com,
 steven.sistare@oracle.com, chao.p.peng@intel.com,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 "open list:Trivial patches" <qemu-trivial@nongnu.org>
References: <20250627063332.5173-1-zhenzhong.duan@intel.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20250627063332.5173-1-zhenzhong.duan@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v_FtW2Q7HPZx7CrXdyTi3H68k2NfpOQdN8ghIPOoDRg_1751100295
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Sat, 28 Jun 2025 08:45:01 -0000

On 6/27/25 08:33, Zhenzhong Duan wrote:
> Hi
> 
> These are trivial VFIO live update fixes in corner cases.
> 
> 1) potential SIGSEGV when unmap-all-vaddr failed
> 2) potential vfio_container_post_load failure
> 
> Thanks
> Zhenzhong
> 
> Changelog:
> v2:
> - drop patch1,2 in v1 as they are merged
> - squashed "local save" parts of patch3 into patch4 (Steve)
> - s/DMA_MAP_FUNC/dma_map_fn (Steve)
> 
> Zhenzhong Duan (2):
>    vfio/container: Fix potential SIGSEGV when recover from
>      unmap-all-vaddr failure
>    vfio/container: Fix vfio_container_post_load()
> 
>   include/hw/vfio/vfio-cpr.h |  7 ++++---
>   hw/vfio/cpr-legacy.c       | 23 +++++++++--------------
>   2 files changed, 13 insertions(+), 17 deletions(-)
> 


Applied to vfio-next.

Thanks,

C.



