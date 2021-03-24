Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lP3pA-0001vf-JF
	for mharc-qemu-trivial@gnu.org; Wed, 24 Mar 2021 09:45:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lP3oz-0001tR-3s
 for qemu-trivial@nongnu.org; Wed, 24 Mar 2021 09:45:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lP3ow-0005BN-4J
 for qemu-trivial@nongnu.org; Wed, 24 Mar 2021 09:45:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616593510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sNX3cUEJEvvitchZ4JiICyTbhnRmdCtN6N6kmuEXzAQ=;
 b=FwlKqVqc5RiESlq8zHrE3EoE+dQTmPE/T/lMZBugUlRJ4dgKKd3A2cTwlc5JQCYgNOm6mo
 0iCQXa7xqoUOCAQX8h1D+ktGITlSTJ/DPT2mfIqYFfLdo8lNzLkHOczAjFaQCB15yAxO8E
 yFrDev7ll4RcOyAWa5L3F63THTFbjEs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-vhtDnALWM42vyAAM9aJLQA-1; Wed, 24 Mar 2021 09:45:05 -0400
X-MC-Unique: vhtDnALWM42vyAAM9aJLQA-1
Received: by mail-wr1-f71.google.com with SMTP id 75so1101881wrl.3
 for <qemu-trivial@nongnu.org>; Wed, 24 Mar 2021 06:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sNX3cUEJEvvitchZ4JiICyTbhnRmdCtN6N6kmuEXzAQ=;
 b=uGhz+lHwqiS1R4wqGL0dzCVv5xeere7gKNQtTfyLRZu/+OiBpBqe3Iu8chkI4coQj2
 ZYPZgPL0UoXVOgXTEz2mTO2TOzdx+m98NXGa4WrkBiPSXoujr5rtQQPBU46fzhmwrBo0
 RNl0MjHJuE/c4+ZaRZ1vf8Fffs4qCheU08zh98qRb2K6HAI6RDJoFi43IWq9oK2GL9xa
 hWG1mM5gwR0qW5ve2MqTQ578dArItOwcfQSQXjZfNBVNvk0gHkSDUe21f6pwGx2DBJdO
 7fC3sfhKfSIrGyVKrsVtsiVkgWVdrB3w+UDKdnGdQvv0bflYXnJhAgqDM4Jz17jOOF19
 J9QA==
X-Gm-Message-State: AOAM530Xh5c02rj1ZDG11ckYPRHBUxNggnQ6XvUFGS48hO5/jbidRHt6
 8e/c3jRi4+2PJAnarCtBQWilxETCy2r0t904da6+/J1shWLxXCyrLDfiR7dkV0sIN5+NP58Y67V
 6k6POJ+52QqcAxRK2gQ==
X-Received: by 2002:a05:600c:203:: with SMTP id 3mr3013421wmi.88.1616593503454; 
 Wed, 24 Mar 2021 06:45:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdKwGMdMJ6Z7fj8XISovW3Ng8H3ajrRgtYCYoVBSYBWWDKemE3QuKziSl7K0rTjfnDziKVWw==
X-Received: by 2002:a05:600c:203:: with SMTP id 3mr3013401wmi.88.1616593503159; 
 Wed, 24 Mar 2021 06:45:03 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e17sm3488513wra.65.2021.03.24.06.45.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 06:45:01 -0700 (PDT)
Subject: Re: [PATCH v2] meson: Propagate gnutls dependency to migration
To: Jessica Clarke <jrtc27@jrtc27.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20210320164730.33285-1-jrtc27@jrtc27.com>
 <20210320171221.37437-1-jrtc27@jrtc27.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a803e5f6-61d6-3656-ca62-d2399aefc09b@redhat.com>
Date: Wed, 24 Mar 2021 14:45:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210320171221.37437-1-jrtc27@jrtc27.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-List-Received-Date: Wed, 24 Mar 2021 13:45:18 -0000

On 20/03/21 18:12, Jessica Clarke wrote:
> Commit 3eacf70bb5a83e4775ad8003cbca63a40f70c8c2 neglected to fix this
> for softmmu configs, which pull in migration's use of gnutls.
> 
> This fixes the following compilation failure on Arm-based Macs:
> 
>    In file included from migration/multifd.c:23:
>    In file included from migration/tls.h:25:
>    In file included from include/io/channel-tls.h:26:
>    In file included from include/crypto/tlssession.h:24:
>    include/crypto/tlscreds.h:28:10: fatal error: 'gnutls/gnutls.h' file not found
>    #include <gnutls/gnutls.h>
>             ^~~~~~~~~~~~~~~~~
>    1 error generated.
> 
> (as well as for channel.c and tls.c)
> 
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> ---
> Changes in v2:
>   * Added error to commit message
> 
>   migration/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/meson.build b/migration/meson.build
> index 9645f44005..6fa2f8745d 100644
> --- a/migration/meson.build
> +++ b/migration/meson.build
> @@ -24,7 +24,7 @@ softmmu_ss.add(files(
>     'savevm.c',
>     'socket.c',
>     'tls.c',
> -))
> +), gnutls)
>   
>   softmmu_ss.add(when: ['CONFIG_RDMA', rdma], if_true: files('rdma.c'))
>   softmmu_ss.add(when: 'CONFIG_LIVE_BLOCK_MIGRATION', if_true: files('block.c'))
> 

Queued, thanks.

Paolo


