Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1llRsj-0005UW-Jq
	for mharc-qemu-trivial@gnu.org; Tue, 25 May 2021 03:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llRsh-0005OD-Lh
 for qemu-trivial@nongnu.org; Tue, 25 May 2021 03:53:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llRse-0003Lj-TL
 for qemu-trivial@nongnu.org; Tue, 25 May 2021 03:53:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621929215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LxPstLsb3dt2KoYpSap2npVnKW1k0hOhIrvJhz8JJxQ=;
 b=jJIzV/VBu58aYfLsqE+j60aSdO7jWGjv9n7v7Hb54vrK/jJd9bZXKfrjo3kY/25F55PUun
 XwQnb4sUX4jh5MymTngyryR91dnOFs3pE21Qqy9j/EQW5Qw8DGIOR+wYUtB3SdlJeu4WO4
 4qjhXLus2ANryigg8K/U5M7WlF0jkT0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-cqEDn80YOx2ftN3xtWQp-g-1; Tue, 25 May 2021 03:53:33 -0400
X-MC-Unique: cqEDn80YOx2ftN3xtWQp-g-1
Received: by mail-wm1-f72.google.com with SMTP id
 n127-20020a1c27850000b02901717a27c785so5626402wmn.9
 for <qemu-trivial@nongnu.org>; Tue, 25 May 2021 00:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LxPstLsb3dt2KoYpSap2npVnKW1k0hOhIrvJhz8JJxQ=;
 b=rcQhTjZOlYhoWBflR+YvVWO/hDk3osj6D/b31EyefAsTUe9/bAZZqa2hyjOe2i+jhz
 iYvq0vm3swmD1OjE6bvOYCSxracYmdUk488RYIsbVwISY750vxKi1yasbqPP2UTBKgTV
 J0xmR03bsQOXfeOJ8I2X60q6QwhaFmGDaProV1IkL/Jx9jJ/QHODvOfwvECtBIMtoMbP
 SDC3eAYoIbALZ2kBDdAWORnHBrfd+l7viMBQE8+2nr9piTvxnIT4NfWJ8+RikFSNtPJC
 UqerToEbtvm5IYF4wCaYn9VnciUlGYmZsNQOzT1wKvJi7Ixc7jF2OciG+FkiH5ZL2n18
 47mg==
X-Gm-Message-State: AOAM531mqJnihiRbkgkJGywpUEur28KHNotJbK8aWLP7fT54t6rQXf5Y
 v/wJSCdE8UAyHZZEyKmLsKWJxlEqBW526Y/fg/3jKfB3N3ootFulK/dxy6yEkw+fhUPFkA722oG
 mP4RnZqCR3+PUPS+FVw==
X-Received: by 2002:a05:600c:3043:: with SMTP id
 n3mr21411538wmh.98.1621929212674; 
 Tue, 25 May 2021 00:53:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzm302cVM38B8FVGASRCVePhu4yOpDR97Ff1irN+2fXWp9S87nhg41Tw9RrVOttoHZuGOsGsA==
X-Received: by 2002:a05:600c:3043:: with SMTP id
 n3mr21411527wmh.98.1621929212528; 
 Tue, 25 May 2021 00:53:32 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id u126sm2180932wmb.9.2021.05.25.00.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 00:53:31 -0700 (PDT)
Subject: Re: [PATCH] tests/qtest/fuzz: Fix build failure
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Bandan Das <bsd@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20210513162008.3922223-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b564c68b-4d9f-f243-f4f0-75f81ffeada6@redhat.com>
Date: Tue, 25 May 2021 09:53:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210513162008.3922223-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
X-List-Received-Date: Tue, 25 May 2021 07:53:39 -0000

ping? (patch reviewed).

On 5/13/21 6:20 PM, Philippe Mathieu-Daudé wrote:
> On Fedora 32, using clang (version 10.0.1-3.fc32) we get:
> 
>   tests/qtest/fuzz/fuzz.c:237:5: error: implicit declaration of function 'qemu_init' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>       qemu_init(result.we_wordc, result.we_wordv, NULL);
>       ^
> 
> qemu_init() is declared in "sysemu/sysemu.h", include this
> header to fix.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/qtest/fuzz/fuzz.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
> index 04b70e114bf..5f77c849837 100644
> --- a/tests/qtest/fuzz/fuzz.c
> +++ b/tests/qtest/fuzz/fuzz.c
> @@ -16,6 +16,7 @@
>  #include <wordexp.h>
>  
>  #include "qemu/datadir.h"
> +#include "sysemu/sysemu.h"
>  #include "sysemu/qtest.h"
>  #include "sysemu/runstate.h"
>  #include "qemu/main-loop.h"
> 


