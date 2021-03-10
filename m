Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lK1K8-0006wH-9z
	for mharc-qemu-trivial@gnu.org; Wed, 10 Mar 2021 11:04:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lK1K7-0006uE-7w
 for qemu-trivial@nongnu.org; Wed, 10 Mar 2021 11:04:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lK1K0-0004QC-5f
 for qemu-trivial@nongnu.org; Wed, 10 Mar 2021 11:04:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615392266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oSVnxMAAjKSdtyaArk7QoRn+s5vms/zOhUmikvWvD0E=;
 b=g0Wa4LZf5RO10ihfKdNbKcrOPR/8jftjln4OfYVaxmUOzgs/EY8EzlvVR/6Oflyu8ecZ5t
 EOC5wlv7ryqDMRWb9QD9HL96qUkX6MsLDCY8ial9VBu4RrW8V5diRMYfdMuuEwWSop/uPQ
 ymTKZo9ZuxBgbhJ1ag2ym5+abU4If0g=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-KVHiCp7ZOcySArqpRjxTHg-1; Wed, 10 Mar 2021 11:04:24 -0500
X-MC-Unique: KVHiCp7ZOcySArqpRjxTHg-1
Received: by mail-ed1-f70.google.com with SMTP id f9so4283411edd.13
 for <qemu-trivial@nongnu.org>; Wed, 10 Mar 2021 08:04:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oSVnxMAAjKSdtyaArk7QoRn+s5vms/zOhUmikvWvD0E=;
 b=dU2H2wzQdeqMniyFVyRjksP8dvyVIeKc66bqljVoh8vYVRq2GG9tR+7zgTIoKNUABQ
 GlNSWOH9Dz/2sEvyohSw9rWJ7Cpb+d4k6NOspy0QJ4+stBopWSX8r67Bf59OrPdxoEdl
 aavlE2b72JwdWYezPnYxoiR8Fbp302oQ4+et7YqvCvPZFMjPak1X9r3+AoBodT6jW47s
 nU1ZNGFTT+PCmdI+A92551EqoJeQ3RSTwGZy+x9Er207HdbkJ6wHEMgeCBonuaPSvY7J
 n6RKBNgyRPv0LS5yj+7nkd9E3XQ7CrndVtvk0NidZXEbaMF8A/JZCXChNZqnywk1oJ7G
 G9Ug==
X-Gm-Message-State: AOAM533Nepmh0JZevHc9Uv40+lWmxeWqhw4PWt9IaVbyb4D0gZLZNiPl
 MsyMDeILoxyYJHN8cARAax8Ol6rb4u+Pog7lRzGua4r/0QZlSTtw9St8oNVoTRHcTQ281rKwqLA
 IdoU7jolJqtvUTd31GQ==
X-Received: by 2002:aa7:d484:: with SMTP id b4mr4144007edr.63.1615392263104;
 Wed, 10 Mar 2021 08:04:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsXy5h9Wy6g+BaqjDHhNLFwhRZ3g2ODckG+nyFHvEk5rPmFTINzdKo54UiBTunyOrK96YZOw==
X-Received: by 2002:aa7:d484:: with SMTP id b4mr4143994edr.63.1615392262991;
 Wed, 10 Mar 2021 08:04:22 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q11sm9964973ejr.36.2021.03.10.08.04.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 08:04:22 -0800 (PST)
Subject: Re: [PATCH] tests: Fix broken "make check-speed"
To: Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210310094936.1318317-1-thuth@redhat.com>
 <CAKJDGDZdUGW=eT8ZnsVohUzmvrWGUgLdKUs=-0VNejqZyOag0w@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7c6e59fd-913f-31ff-ae33-49186f9ddde1@redhat.com>
Date: Wed, 10 Mar 2021 17:04:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAKJDGDZdUGW=eT8ZnsVohUzmvrWGUgLdKUs=-0VNejqZyOag0w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
X-List-Received-Date: Wed, 10 Mar 2021 16:04:35 -0000

On 10/03/21 16:49, Willian Rampazzo wrote:
> On Wed, Mar 10, 2021 at 6:51 AM Thomas Huth <thuth@redhat.com> wrote:
>>
>> When running "make check-speed", currently nothing happens. This is
>> because the redirection to "bench-speed" is not working as expected
>> (since the bench-speed rule in the generated Makefile.mtest filters
>> for "bench-speed" and "bench" in the MAKECMDGOALS variable).
>> Fix it by calling "make bench-speed" instead of using a dependency.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   tests/Makefile.include | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
> 
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Tested-by: Willian Rampazzo <willianr@redhat.com>
> 

I don't object to the patch, but if no one has noticed in 6 months 
perhaps the target can go (replaced by "make bench"/"make bench-speed").

Paolo


