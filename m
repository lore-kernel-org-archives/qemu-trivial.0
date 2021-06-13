Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lsJB9-00023M-Eq
	for mharc-qemu-trivial@gnu.org; Sun, 13 Jun 2021 02:01:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lsJB6-00022v-Qd
 for qemu-trivial@nongnu.org; Sun, 13 Jun 2021 02:01:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lsJB1-0007qb-Dy
 for qemu-trivial@nongnu.org; Sun, 13 Jun 2021 02:00:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623564054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jJS6at8k7Nq1nFDIUmxO4VL2MXxoWFKN+gC1lGkU1rk=;
 b=gRyNzCkYautwdxBj3dz0fnTzvzf5O4jyijGA8xdL+pAr8RlHJf2GmYUE9eAu9Y2wekhcGW
 kkh5e9rAsDp8dAd9ovZlRQnnGnj8LyDh6qtQviQZSHZFN3inB6yR3p/wv9WkVfZPwCEuAd
 tPQ520PWnlmcppSfFX3eKr3HP2pxgpw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-rEeg38tyO2Owh_C95oT9GQ-1; Sun, 13 Jun 2021 02:00:50 -0400
X-MC-Unique: rEeg38tyO2Owh_C95oT9GQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l25-20020a1c79190000b02901c7057f03d1so51354wme.4
 for <qemu-trivial@nongnu.org>; Sat, 12 Jun 2021 23:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jJS6at8k7Nq1nFDIUmxO4VL2MXxoWFKN+gC1lGkU1rk=;
 b=CsXqxIhgxvcdWQictdgzVYnDsiU/a4/8/wXQ3VsoJPix30nDyFwtXjpQYp7CIJyUmt
 xlfFgK/GC0ijzZraQgRcnl+mc4HLYn354eAbR1TEE/eSJkU8u+/Lo7csCzG3lyFKE9UL
 8PIhuqEZyE3DR2jWsCcTKBwKmk/VkTaUZEovDwTXny8UZoC9TGrAyRCpqzYSXv/+Qnfz
 lMn56Noer96rBT5008eWPlhoS1upPypynz3+PEoF9h5AP6BUoqHFNf6TzBEUk8GYCzpW
 RjQEckHePClQAuOxgyrUuL9D2mR01G47dZHxpei/eX2voBDkwZ/0QW9Iwt3Kn1worj25
 rH0g==
X-Gm-Message-State: AOAM530xeFCww/6FUj1vC+q5FcYqDpIaJxo/di79DEv9/v73rtqHHRGz
 rqnODhPZTOGBMpZsnOWjHCUwYEXB7ISYVT5mnF1PiCnphG5pNWHod1eAIBWyigTomcTDRuwWVXb
 2bePtRCzspAHPjux2+A==
X-Received: by 2002:a1c:b087:: with SMTP id z129mr26362043wme.67.1623564049675; 
 Sat, 12 Jun 2021 23:00:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUPTAdPuQyB/wwwSTttIRsXcPImS1E788T8OUcYp1LqVfCp6B0HQHuvji8GOZYE3GtyjymXQ==
X-Received: by 2002:a1c:b087:: with SMTP id z129mr26362022wme.67.1623564049425; 
 Sat, 12 Jun 2021 23:00:49 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-144-190.46.114.pool.telefonica.de. [46.114.144.190])
 by smtp.gmail.com with ESMTPSA id e16sm12677447wrw.49.2021.06.12.23.00.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Jun 2021 23:00:48 -0700 (PDT)
Subject: Re: [PATCH v2] fuzz: Display hexadecimal value with '0x' prefix
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20210612195842.1595999-1-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <95c1fc12-8256-0209-02d1-081a21f5a669@redhat.com>
Date: Sun, 13 Jun 2021 08:00:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210612195842.1595999-1-f4bug@amsat.org>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
X-List-Received-Date: Sun, 13 Jun 2021 06:01:01 -0000

On 12/06/2021 21.58, Philippe Mathieu-Daudé wrote:
> Use memory_region_size() to get the MemoryRegion size,
> and display it with the '0x' prefix.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2:
> - Use PRIx64 (lvivier)
> - Use memory_region_size()
> ---
>   tests/qtest/fuzz/generic_fuzz.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index cea7d4058e8..6c675227174 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -841,9 +841,9 @@ static void generic_pre_fuzz(QTestState *s)
>   
>       g_hash_table_iter_init(&iter, fuzzable_memoryregions);
>       while (g_hash_table_iter_next(&iter, (gpointer)&mr, NULL)) {
> -        printf("  * %s (size %lx)\n",
> +        printf("  * %s (size 0x%" PRIx64 ")\n",
>                  object_get_canonical_path_component(&(mr->parent_obj)),
> -               (uint64_t)mr->size);
> +               memory_region_size(mr));
>       }
>   
>       if (!g_hash_table_size(fuzzable_memoryregions)) {
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


