Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lEtFS-0000uR-N5
	for mharc-qemu-trivial@gnu.org; Wed, 24 Feb 2021 07:26:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEtFQ-0000rO-GZ
 for qemu-trivial@nongnu.org; Wed, 24 Feb 2021 07:26:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEtFN-0001Uz-T2
 for qemu-trivial@nongnu.org; Wed, 24 Feb 2021 07:26:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614169589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/CRAkw4jrNYafO8dLBQfMq0SD7HD0L0F3sU0iuCuYWk=;
 b=Px0pVsQHucfWxj4ADRqn6S/btO4h/aI2VXcBebWOz3oMZMt6CmnT0nPEQxRdMDxsANks89
 Jtsig16EkU1eMklVoCFCKj2jiAHr6nzJ/NFae3m00WFaCI5/G6+A1QY+lHWAGY3E9kni0z
 6kG8zJxcvUA2HTfiNS5T1BjjjRrFIAo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-neWYo-28M5qXlri0tyWYEQ-1; Wed, 24 Feb 2021 07:26:27 -0500
X-MC-Unique: neWYo-28M5qXlri0tyWYEQ-1
Received: by mail-ed1-f69.google.com with SMTP id h1so783842edq.1
 for <qemu-trivial@nongnu.org>; Wed, 24 Feb 2021 04:26:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/CRAkw4jrNYafO8dLBQfMq0SD7HD0L0F3sU0iuCuYWk=;
 b=gNON0E+Vsz0B2eXjRbEZ7bMlt5MgAYCMC5iKD3+L76GOgx5B5kjh3c3sMOf8vWsd1f
 F0AGESYaK/InyV9K12a8i7YNlHDcs5PFrhrBPrRBwuTGEkjDaObhEzp6sx2QtnUC++c6
 6kZAMKFFPPW3q48WK06G2ZrNZPAtJh8QTB4zzNvZqZm9CvH54SfYP+ZWyi/iZ6N8oiRq
 6n+ZxZRUIH2zJ4w+Sbxj53b4snwSlrUAyEoZaPolmmloqs597H7fYqrR86sM/3L9fdIL
 L3O6Tv0id9eAAZkV916yXdtoIVp6xIFFcmo4lhV6+aJaY/IiYiFONh/UNaf6MTnpGLqM
 uXWw==
X-Gm-Message-State: AOAM531Cocsh+XqoOFp6lS+tlmK1G9I6i4kJ8X7nf8CQNB4hLqFqkCzh
 g6P0mPfNNCCAMXbrrOU4D6xyX1cpcZNgw4+liIdFU9vI74hG2iYiYea9TZ2JrYOOhf74xR5pkvE
 gYzQWB31umQePkN9QspK51lpr9ht16wKArTXYKigycplOnSU0He6egOdfu42h+hlv2colrQ==
X-Received: by 2002:a05:6402:1f3:: with SMTP id
 i19mr32769105edy.217.1614169585848; 
 Wed, 24 Feb 2021 04:26:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxAa9i3hkxnxuBOX5fNHOfRnFHm9wBdeDreJXAUrlv5luwisp/pS2f+uLe3j3k5ACDftciDzQ==
X-Received: by 2002:a05:6402:1f3:: with SMTP id
 i19mr32769087edy.217.1614169585610; 
 Wed, 24 Feb 2021 04:26:25 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id br22sm1232458ejb.117.2021.02.24.04.26.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 04:26:25 -0800 (PST)
Subject: Re: [PATCH] meson: Only generate trace files for selected targets
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-trivial@nongnu.org
References: <20210224120923.3154325-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <39cc99dd-54d5-9dd1-d66a-7947686dbada@redhat.com>
Date: Wed, 24 Feb 2021 13:26:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224120923.3154325-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 24 Feb 2021 12:26:32 -0000

On 24/02/21 13:09, Philippe Mathieu-Daudé wrote:
> We don't need to generate trace files for targets we
> are not building. Restrict the the ones selected.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   meson.build | 10 +---------
>   1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 05a67c20d93..c9b0433667d 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1826,15 +1826,6 @@
>     trace_events_subdirs += [
>       'accel/tcg',
>       'hw/core',
> -    'target/arm',
> -    'target/hppa',
> -    'target/i386',
> -    'target/i386/kvm',
> -    'target/mips',
> -    'target/ppc',
> -    'target/riscv',
> -    'target/s390x',
> -    'target/sparc',
>     ]
>   endif
>   
> @@ -2166,6 +2157,7 @@
>     t = target_arch[arch].apply(config_target, strict: false)
>     arch_srcs += t.sources()
>     arch_deps += t.dependencies()
> +  trace_events_subdirs += ['target' / arch]
>   
>     target_common = common_ss.apply(config_target, strict: false)
>     objects = common_all.extract_objects(target_common.sources())
> 

Is this still okay if there is no trace-events file for a given arch?

Paolo


