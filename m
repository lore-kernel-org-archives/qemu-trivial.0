Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nok1a-0007cr-2c
	for mharc-qemu-trivial@gnu.org; Wed, 11 May 2022 06:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nok1W-0007bz-5s
 for qemu-trivial@nongnu.org; Wed, 11 May 2022 06:56:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nok1U-00073V-7y
 for qemu-trivial@nongnu.org; Wed, 11 May 2022 06:56:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652266611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kONsClAnJ8aoEG+ElC7iF2hKV5qiPx1fAumu9oBivdI=;
 b=a+FoLLUlM5OCGMRMUgdzaB7Sbo9tNfeERDSSfjAy3dHrDswpbXJaPa8zMzwlXSH5wOOjX0
 90MC6FFhOEhFgqkCLynmhXq1S/5xgXSSqDWslnUkIsJ4oyDwDeJ+xZvd6AJsKjKvlM3ZdN
 kdYkgqn59xKuJw3FuM6iBVtsSSC6A1M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-zc0zLY2DNp2REVtfmc6lxw-1; Wed, 11 May 2022 06:56:48 -0400
X-MC-Unique: zc0zLY2DNp2REVtfmc6lxw-1
Received: by mail-wm1-f72.google.com with SMTP id
 r186-20020a1c44c3000000b00393f52ed5ceso2663890wma.7
 for <qemu-trivial@nongnu.org>; Wed, 11 May 2022 03:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=kONsClAnJ8aoEG+ElC7iF2hKV5qiPx1fAumu9oBivdI=;
 b=H08gPfMBt9AUCto5sPhe5JloPwMMh7P1uRMONFqT6/oMZC7qawnAOJGtB65eWY6Q2Y
 lkB4+ir25LZU1fjZj3IjZP8ub9jQ5KA9T+qQuIRhf2HNBTluX3+63l/h0uhQmlfppHDK
 K3mIKlBXkjyRqPRnA9blr28cOkzIg5zrzqk+GzzFZeXXdAFAk63lpHwItHBQUlk3y5dP
 iiILU00hmdWLyEYFrEB2UI2qejSjdvAE0EnFQa0QRxaOKoG2iOMLj0A/3IiANIxb4Phc
 kmTnOOBOuRjBnQEwL8ztQu32ojg46y0cWlmJvJ43GxvwBByVl4AopJvjOUF7DCYn//gF
 fZjg==
X-Gm-Message-State: AOAM532aPbK34H4F+Nb63mv/cHPvrsCIBUNwsyE8BzGbSdfPUDpsuzq8
 Zs2SGOt1mEyVCtJ+gcmSnUBUrHkQ2I+D9Nx4aOQFCXOlFR/okhNq4Yip8qc0RDVP5huVyvNYjHv
 u9IgPorOFvj7DYcdZMQ==
X-Received: by 2002:a05:6000:12ca:b0:20a:dba5:d5f3 with SMTP id
 l10-20020a05600012ca00b0020adba5d5f3mr21418947wrx.149.1652266606870; 
 Wed, 11 May 2022 03:56:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyngnXhMcc3KdAE6sVB3WVj9Sy7hVBpU29h6AGwh2pL9IPIBEVCgMOcv/00sURldUm6wj5XQA==
X-Received: by 2002:a05:6000:12ca:b0:20a:dba5:d5f3 with SMTP id
 l10-20020a05600012ca00b0020adba5d5f3mr21418926wrx.149.1652266606649; 
 Wed, 11 May 2022 03:56:46 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 m36-20020a05600c3b2400b003942a244edbsm2229276wms.32.2022.05.11.03.56.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 03:56:46 -0700 (PDT)
Message-ID: <b819e229-4aff-6381-a686-664aa97712a3@redhat.com>
Date: Wed, 11 May 2022 12:56:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220511094758.794946-1-thuth@redhat.com>
 <CAFEAcA9bUires+a-dc8v-oDDKg5WJRf4vVR8jKady5QgjMJTZA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] meson.build: Bump minimum supported version of pixman to
 0.34.0
In-Reply-To: <CAFEAcA9bUires+a-dc8v-oDDKg5WJRf4vVR8jKady5QgjMJTZA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 11 May 2022 10:56:54 -0000

On 11/05/2022 12.28, Peter Maydell wrote:
> On Wed, 11 May 2022 at 10:50, Thomas Huth <thuth@redhat.com> wrote:
>>
>> We haven't revisited the minimum required versions of pixman
>> since quite a while. Let's check whether we can rule out some
>> old versions that nobody tests anymore...
>>
>> For pixman, per repology.org, currently shipping versions are:
>>
>>       CentOS 8 / RHEL-8 : 0.38.4
>>                Fedora 34: 0.40.0
>>               Debian 10 : 0.36.0
>>        Ubuntu LTS 20.04 : 0.38.4
>>      openSUSE Leap 15.3 : 0.34.0
>>             MSYS2 MinGW : 0.40.0
>>           FreeBSD Ports : 0.34.0 / 0.40.0
>>            NetBSD pksrc : 0.40.0
>>
>> OpenBSD 7.1 seems to use 0.40.0 when running tests/vm/openbsd.
>>
>> So it seems to be fine to bump the minimum version to 0.34.0 now.
> 
> This seems to be missing the rationale for why bumping
> the minimum version is worth doing. What new feature that
> we need is this enabling, or what now-unnecessary bug
> workarounds does this permit us to drop?

We simply don't test such old versions anymore. Thus what happens if someone 
tries to use such a version and runs into a problem (especially if it is 
non-obvious and would need a lot of debugging)? Are you still willing to fix 
it? Or would you then rather bump the version after hours of debugging the 
problem? ... IMHO it's better to set the expectations right from the start. 
If we do not test and support it anymore, we should not give the impression 
that QEMU can still be compiled with this.

  Thomas


