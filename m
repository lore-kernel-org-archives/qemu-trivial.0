Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mjz7g-0006nV-N4
	for mharc-qemu-trivial@gnu.org; Mon, 08 Nov 2021 02:31:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjz7f-0006lf-5y
 for qemu-trivial@nongnu.org; Mon, 08 Nov 2021 02:31:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjz7Y-0004mp-Qk
 for qemu-trivial@nongnu.org; Mon, 08 Nov 2021 02:31:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636356665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vy07NpmjE3vqxd14i7vOmnS86GY1iLrrFQhK/J26s10=;
 b=TyWjGJ/qC1BjVgDQ/LFdgnpWdAJj7FnaUzsVODpU/kAw73bAGQrP03waa60+VWgfqm2o58
 IqgRbFirqplPUf87dO6eCIOD6zJBOJL0z37f38xNiIJ2fwz82sRWOdy45uLjyP7dt/N8bI
 eEgsioX9zlgbzacvPu83q5+fkLwcz2s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-AlxQXR9DMiOcTEvueJiV8A-1; Mon, 08 Nov 2021 02:31:02 -0500
X-MC-Unique: AlxQXR9DMiOcTEvueJiV8A-1
Received: by mail-wm1-f72.google.com with SMTP id
 145-20020a1c0197000000b0032efc3eb9bcso9750771wmb.0
 for <qemu-trivial@nongnu.org>; Sun, 07 Nov 2021 23:31:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vy07NpmjE3vqxd14i7vOmnS86GY1iLrrFQhK/J26s10=;
 b=udTE0Ov2bn0V5LTzLpdnwHNkTYCVBUvF6sKKGVKrrYpWQgRpnlYHmsCsOuD0g+lSYR
 I5KLtAv9ffsn5Uk+29W19RCfKCQdQnlTdD1hesQ4eYySJicVMrXP5nwrIaq2OUu4wiFS
 p9EuDo+rrzXt3lvhPspEEPl8u3mBSBEm1ygEBTlqQYlrufgrZc9tivhqkJYOY8Y37x/S
 o2F80kCpnmMWrcmyfcGlLAAP82TJaQ3pfoY9wDeJiauMxOgM5+f3OQ8Q7cZQAM5+dN3N
 7wBgLwZAkulHTufBzRdIMP2jmP7VwpSi20FgLyKotUtC6GzIE/lOl8sz5xzieRoeZiSD
 JVyw==
X-Gm-Message-State: AOAM530BKri9m8MPVatrE30VNsjfuyeWriqSr0T8prynS3wNUJ2H48dE
 XNTOVKe7jWymXM9O9vVsrokwY8I2HficoRPF7/Ic0dJC6ZcPX2IFUAd8pimswP48zOQDk8JYZcL
 0FhbBBYEJ/r81zZa7Lg==
X-Received: by 2002:a1c:4b07:: with SMTP id y7mr50274195wma.188.1636356660880; 
 Sun, 07 Nov 2021 23:31:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYtuFSrnm1EhdMPbYxLwSI91eZc8WbOM/tHJhxSFiJnglHqUFheWG77BijCEvzX5IShp0RPw==
X-Received: by 2002:a1c:4b07:: with SMTP id y7mr50274180wma.188.1636356660704; 
 Sun, 07 Nov 2021 23:31:00 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u23sm8843144wru.21.2021.11.07.23.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 23:31:00 -0800 (PST)
Message-ID: <96683e8d-9633-7cb8-98ab-0a8791e1c63e@redhat.com>
Date: Mon, 8 Nov 2021 08:30:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 0/1] hw/hyperv/vmbus: Is it maintained?
To: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
Cc: Jon Doron <arilou@gmail.com>, qemu-trivial@nongnu.org,
 Roman Kagan <rkagan@virtuozzo.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211106134155.582312-1-philmd@redhat.com>
 <e9c29f4d-d5d5-34aa-8311-7ad1fc05b7d6@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <e9c29f4d-d5d5-34aa-8311-7ad1fc05b7d6@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 08 Nov 2021 07:31:19 -0000

On 11/6/21 20:28, Maciej S. Szmigiero wrote:
> On 06.11.2021 14:41, Philippe Mathieu-Daudé wrote:
>> This is the 4th time I send this patch. Is the VMBus infrastructure
>> used / maintained? Should we deprecate & remove?
>>
>>    $ ./scripts/get_maintainer.pl -f hw/hyperv/vmbus.c -f
>> include/hw/hyperv/vmbus.h
>>    get_maintainer.pl: No maintainers found
> 
> There's an email thread at [1] explaining the reasons for having VMBus
> infrastructure last time such question was asked.
> 
> In short: mere presence of a working VMBus is needed for some high-speed
> Windows debugging, also people are working on VMBus host device drivers.

Great. Do you mind adding an entry in MAINTAINERS to
cover these files, so we stop wondering about them?

> Your patch makes sense to me, so for it:
> Reviewed-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

Thank you.

> [1]:
> https://lore.kernel.org/qemu-devel/20201009193919.GF7303@habkost.net/T/#u
> 


