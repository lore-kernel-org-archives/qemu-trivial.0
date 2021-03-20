Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNf3g-0002XO-Bo
	for mharc-qemu-trivial@gnu.org; Sat, 20 Mar 2021 13:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNf3e-0002U1-7g
 for qemu-trivial@nongnu.org; Sat, 20 Mar 2021 13:06:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNf3b-00074P-6i
 for qemu-trivial@nongnu.org; Sat, 20 Mar 2021 13:06:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616259993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dkI9l3f+FlH7vevFK+TVLMOyEs/A1FxcjP/kdlkbnZw=;
 b=Y+h/Gms5K+PyU/FDUwjA/t9jcw1xOsbiKFMXZyZIaKPBR7spC1Sg92OCSVeusOQ+LZfWyq
 CqNQlZ9ypyCoKFbPfIt/tGprkmlhMLciy1F48vPPpOqTSaUNmCyLV8RIOpET95xEG+5zjx
 r/ndROhCCbUfdf9HLhlY4s7p42wvoyI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-2luum53xPpOIu0GkC0fpAA-1; Sat, 20 Mar 2021 13:06:29 -0400
X-MC-Unique: 2luum53xPpOIu0GkC0fpAA-1
Received: by mail-ed1-f70.google.com with SMTP id h5so24766842edf.17
 for <qemu-trivial@nongnu.org>; Sat, 20 Mar 2021 10:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dkI9l3f+FlH7vevFK+TVLMOyEs/A1FxcjP/kdlkbnZw=;
 b=mtY9IPGP5X+cs9a8+P4pif2k8eINr270qa5EpG30CRfItAQ38Gqr4oZHjx3DbMl1SZ
 k+1kLB7WR2guKFjbnbHY4U3s+WweRi5f3y3RYWf9CG6WsyJPERsJtz31gzYAHnPCRZtX
 17SNnsf23+upoG/DQ9kKklX8s9gbowFkFArOeMmsFgrknfTdH9BsUdDq5Xhmyyrxpv9p
 5Q+b3fKH+sBpbZprHLIerhlVpFvQ5+IaBVCFG5nCDgE3x2mu4EYKQWtf4LJY9R+ggUKs
 Zz8hhjnFtSp6yWnjPJya9PsVSY3Ne/1tgFyFzKahlPhZNg+x0jAs4n85yT+KP9bcF9LV
 1x2Q==
X-Gm-Message-State: AOAM533b+3rsmr0MGl3rmxJHOMeItzFD461LWkKfvxN0WxXa99NF/y0K
 9sv3Ys9u79ldaHtRf4/QMCCcmv/GR5x1NJMMallqagcoPCBCg+LoS+z2fai05YLRKQTuwQV5Xd0
 epvE7H8b+zTh45YqdCg==
X-Received: by 2002:a05:6402:440d:: with SMTP id
 y13mr16513925eda.316.1616259988222; 
 Sat, 20 Mar 2021 10:06:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKlwSgcbcIznLDhJVFA8j33axw7gxPwmhfexqpAKgp6YNYYMimTW3uTWVW7/2zZp/jhMlxeQ==
X-Received: by 2002:a05:6402:440d:: with SMTP id
 y13mr16513904eda.316.1616259988012; 
 Sat, 20 Mar 2021 10:06:28 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id cy5sm6505171edb.46.2021.03.20.10.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Mar 2021 10:06:27 -0700 (PDT)
Subject: Re: [PATCH] meson: Propagate gnutls dependency to migration
To: Jessica Clarke <jrtc27@jrtc27.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20210320164730.33285-1-jrtc27@jrtc27.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <87f34651-8726-398e-31bb-3df7e8fac0dd@redhat.com>
Date: Sat, 20 Mar 2021 18:06:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210320164730.33285-1-jrtc27@jrtc27.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
X-List-Received-Date: Sat, 20 Mar 2021 17:06:38 -0000

On 20/03/21 17:47, Jessica Clarke wrote:
> Commit 3eacf70bb5a83e4775ad8003cbca63a40f70c8c2 neglected to fix this
> for softmmu configs, which pull in migration's use of gnutls.
> 
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> ---
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

Hi, can you explain in the commit message the compilation failure that 
is being fixed here?

Paolo


