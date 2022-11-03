Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oqdpk-0007lh-F6
	for mharc-qemu-trivial@gnu.org; Thu, 03 Nov 2022 13:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqdpj-0007l0-DE
 for qemu-trivial@nongnu.org; Thu, 03 Nov 2022 13:16:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqdpf-0001Lk-IK
 for qemu-trivial@nongnu.org; Thu, 03 Nov 2022 13:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667495806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xn/zV/1aq9MhX7PhWTYe4I0LHq8bpkljniNKNkFlny4=;
 b=cYwZSs1mweiDMY1NQWUbbI7/VhbrLyJPPlyHYjGAdfxmXG+JMEbRwBD2+CkAQqJad0Z7eD
 S6DNPULqA4aVsGpr2JjBaUJ6i583S23ZcexceZPANsWXfX1+jjHRMecuHRTirz1VzHsPv0
 uRPG3irAZTBHjEisgi+YCq62P4xRMYc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-536-6jR-7MoqOPSRZgxbeUuOWQ-1; Thu, 03 Nov 2022 13:16:45 -0400
X-MC-Unique: 6jR-7MoqOPSRZgxbeUuOWQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 sc40-20020a1709078a2800b007ae024e5e82so1665404ejc.13
 for <qemu-trivial@nongnu.org>; Thu, 03 Nov 2022 10:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xn/zV/1aq9MhX7PhWTYe4I0LHq8bpkljniNKNkFlny4=;
 b=FpbzNgyoYUGnV6zh9zqA3gjUsoi6QhX3H+n5poeGMF6T/X10B8D5gBp5ff1+AQF259
 9dPYAzBlbGJc8jfxvQ+ABmMdyjXNIzuyqKI5PCsF4cMABoEEHyft8BLcgqdkeO7Tzed1
 4aEwJytwsjOOy0vBooqZsd9fFg/DnpADF1yN6BwbnnyHKGVPFLRNf/EVMDWSp1tBryuk
 gJao5aWuvvpuWi6p9xJpM0c/xJkohQhI+b7J06mRF3QaPv44ZRxvKGopWiwnfpFFpB5L
 Bt4cHwu5dRoozQMqG01rmri1tf7tl7BYEigt+ZCwi5MeDPN4bdxX7IIS9uWAUPeKWqIC
 RG7w==
X-Gm-Message-State: ACrzQf2fVVY6TT18jGyKKcc+OU3xkmtI9QyyyTUc+Ptw6QcHw0ZyG0Yc
 /IRAKq7oib/IWfWPvH/urCmzWFb/62nO9+JMj+hCqZ2QEF/c+7fLLbQEsV+r4c+lYZZojjB4KAu
 dx8s2wXo2bR/KnofOmA==
X-Received: by 2002:a05:6402:2706:b0:461:b93c:cbd8 with SMTP id
 y6-20020a056402270600b00461b93ccbd8mr31293231edd.254.1667495803975; 
 Thu, 03 Nov 2022 10:16:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4QjnBHGfFoAfgEM2ztdg7SS78UGof8XXaYIWFdMVFWucs2caMxZuS+Vpg/qPah3jPSkgTpYQ==
X-Received: by 2002:a05:6402:2706:b0:461:b93c:cbd8 with SMTP id
 y6-20020a056402270600b00461b93ccbd8mr31293093edd.254.1667495802183; 
 Thu, 03 Nov 2022 10:16:42 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 q3-20020a170906a08300b0078d9c2c8250sm728017ejy.84.2022.11.03.10.16.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 10:16:41 -0700 (PDT)
Message-ID: <e9bc7a8c-2d7f-99b9-b9b6-6318a3a56372@redhat.com>
Date: Thu, 3 Nov 2022 18:16:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH for 7.2] Fix broken configure with -Wunused-parameter
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20221102202258.456359-1-sw@weilnetz.de>
 <Y2OCyLSw2hurfemT@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y2OCyLSw2hurfemT@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Thu, 03 Nov 2022 17:16:51 -0000

On 11/3/22 09:58, Daniel P. Berrangé wrote:
> On Wed, Nov 02, 2022 at 09:22:58PM +0100, Stefan Weil via wrote:
>> The configure script fails because it tries to compile small C programs
>> with a main function which is declared with arguments argc and argv
>> although those arguments are unused.
>>
>> Running `configure -extra-cflags=-Wunused-parameter` triggers the problem.
>> configure for a native build does abort but shows the error in config.log.
>> A cross build configure for Windows with Debian stable aborts with an
>> error.
>>
>> Avoiding unused arguments fixes this.
> I'm not convinced that we should allow -extra-cflags to influence
> the configure compile checks at all, as there are likely more cases
> where arbitrary -W$warn flag will impact the checks, potentially
> causing configure to silently take the wrong action.

Meson cc.compiles/cc.links tests never use -Werror to avoid this (which 
has a different set of issues, but if you want you can add the argument 
manually and 0.64 will also add a "werror: true|false" argument).  Since 
the last configure tests will go away in 8.0, I'm fine with just 
applying this patch in the meanwhile.

Paolo


