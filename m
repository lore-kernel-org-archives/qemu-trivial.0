Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qEt6J-0000rc-Sx
	for mharc-qemu-trivial@gnu.org; Thu, 29 Jun 2023 10:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qEt6I-0000rA-6f
 for qemu-trivial@nongnu.org; Thu, 29 Jun 2023 10:58:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qEt6E-00076P-Nv
 for qemu-trivial@nongnu.org; Thu, 29 Jun 2023 10:58:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688050701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dpf4SJHgWwROyUacCORRSpJuSmOpwbMA9DPWbcP4mTA=;
 b=PQiEe56mmUYNREYpJklgOvD6LIm9L4anzXMnjCu9SgcVpm99B/Am6OohEXO7vWgz4hKf2H
 TpOPAr3cyLxG18dywa9An2SojJOIwVmw5ujeT3Oa+nUGhb/fW4ZdKdYr3nz7jDNsBrdeFx
 DSZVDSrKyqNLFnaGa5pXBJ7DHb4KMHI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-W9Uht8qFOHe53a22hjtpzA-1; Thu, 29 Jun 2023 10:58:20 -0400
X-MC-Unique: W9Uht8qFOHe53a22hjtpzA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fa979d0c32so3758865e9.2
 for <qemu-trivial@nongnu.org>; Thu, 29 Jun 2023 07:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688050699; x=1690642699;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dpf4SJHgWwROyUacCORRSpJuSmOpwbMA9DPWbcP4mTA=;
 b=QLOxaSkj1ggsEJdysDZkMAftLlu50xDgmctayM216LjO8qw1Ih0dYOZj0nJC86IAdu
 s2c0tBGT8vuw6ld3CimiR3inTsFuBIF7lgGoNvja+mlkXH18R2iV7rjrmynNECBKzB0U
 aOmTFphshgWa3N/IGQolNjuR0lcPZg5H/PS5FFpDONe9VucG7O4mnAByBzKBOYeFJJbw
 3bhwdXFDn2V/ERUkEyZH8ebF7sewI8IAVEXj1opmxBJdLeSABtYpttwK/aHsLIHegQMH
 1ZFvEsRAfD4BSBe9D/Pkz4R0LIEZ5v6bFEH2ADk/ZRwPwysPJlvGWsoJicFT/Pe3ehvn
 /lcg==
X-Gm-Message-State: AC+VfDzIbbd8fyf4+7fAKEx2BWNQQcLXjw8+t1Fcjjnb2N1eJJixpEh7
 exZ+o+8Vjn9V2gZChzVQuHtax0yiV6fzNWOg2iRdlhqjRi+378mMfF7KvUpMjwsLXvxbzx7hFNj
 huBIgsYWdB1/UGKPm8g==
X-Received: by 2002:a7b:c8d8:0:b0:3fb:b1bf:7df3 with SMTP id
 f24-20020a7bc8d8000000b003fbb1bf7df3mr4060812wml.16.1688050699277; 
 Thu, 29 Jun 2023 07:58:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6zdjLiJBM8xSkXYa9Olo6ZnoPBMZVIPmQnWD5/v4TnCbB75yBAC9qgf2L45A50Xxhsz0vTCA==
X-Received: by 2002:a7b:c8d8:0:b0:3fb:b1bf:7df3 with SMTP id
 f24-20020a7bc8d8000000b003fbb1bf7df3mr4060794wml.16.1688050699018; 
 Thu, 29 Jun 2023 07:58:19 -0700 (PDT)
Received: from [192.168.8.100] (tmo-067-34.customers.d1-online.com.
 [80.187.67.34]) by smtp.gmail.com with ESMTPSA id
 n9-20020a1c7209000000b003fbacc853ccsm5422266wmc.18.2023.06.29.07.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 07:58:18 -0700 (PDT)
Message-ID: <509ddf59-b401-41c5-099a-0acbf2c94f11@redhat.com>
Date: Thu, 29 Jun 2023 16:58:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] hw: Simplify calls to pci_nic_init_nofail()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Max Filippov <jcmvbkbc@gmail.com>
References: <20230629125449.234945-1-thuth@redhat.com>
 <dc6a61da-73d0-d0ae-fc62-3a04ccea5417@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <dc6a61da-73d0-d0ae-fc62-3a04ccea5417@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.093, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 29 Jun 2023 14:58:26 -0000

On 29/06/2023 15.47, Philippe Mathieu-Daudé wrote:
> Hi Thomas,
> 
> On 29/6/23 14:54, Thomas Huth wrote:
>> pci_nic_init_nofail() calls qemu_find_nic_model(), and this function
>> sets nd->model = g_strdup(default_model) if it has not been initialized
>> yet. So we don't have to set nd->model to the default_nic in the
>> calling sites.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   hw/arm/sbsa-ref.c        | 8 +-------
>>   hw/arm/virt.c            | 8 +-------
>>   hw/loongarch/virt.c      | 8 +-------
>>   hw/mips/loongson3_virt.c | 8 +-------
>>   hw/xtensa/virt.c         | 8 +-------
>>   5 files changed, 5 insertions(+), 35 deletions(-)
...
> This remind me of a branch from end of April with this
> unfinished patch, did we already discuss this together?

No, I haven't seen your patch yet, neither we talked about it. I came up 
with the idea for my patch on my own after looking at certain spots in the 
code. But I guess you could easily rebase your patch on top of mine in case 
you want to finish it ;-)

  Thomas


