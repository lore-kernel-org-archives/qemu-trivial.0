Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1s2l7k-0000aW-BP
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2024 01:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1s2l7h-0000Zj-Rw
 for qemu-trivial@nongnu.org; Fri, 03 May 2024 01:06:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1s2l7d-000298-EK
 for qemu-trivial@nongnu.org; Fri, 03 May 2024 01:06:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714712770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=B/YnInj8chcBoZZ0HqJV1t/xZwg2JEzweIEyl179rkA=;
 b=YNXyaKXfIcG4+0TgzGSvrZrQBLZe5GK44LGdM0NSV0UCqQ54MwLYf8IXsl8FHEaUBm8UK2
 PCf7rBWYK08bmG/fhGtbjU6T3VhY7DAVMK3ao6psQD6/m+1pyIjBd8/P6EVVsuSx0kAOJ9
 zhfeLm3zAS6aIQssxBnsNUIr9Iqn9mY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-KztwbbCHOPiJW2ttCTUq5g-1; Fri, 03 May 2024 01:06:08 -0400
X-MC-Unique: KztwbbCHOPiJW2ttCTUq5g-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-78ecda35c73so1154103185a.0
 for <qemu-trivial@nongnu.org>; Thu, 02 May 2024 22:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714712768; x=1715317568;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B/YnInj8chcBoZZ0HqJV1t/xZwg2JEzweIEyl179rkA=;
 b=QkmzTJEGe95IksTL0rcguZyO2a+v+rWHRfHb3oceISQQNuGyqHGU7mR/CCm7Op9AJd
 7UbeaKmApIFpNCYH7Zd9sX5vVX/IckawvAiPri+m/KELq4GTLCsn0ST9RslULHWqf3+A
 uLwzkqC6rwYFJcExIHBA2Ao7NQRvqLvqlyLaRQpZI98GOaoaeTWGngGVs25xdBahaX0H
 dGRbz4J2XKHnrOyOgBZoemb0UfvCoO9B0r1hnqd2mVgiu03HHl3DweM2sIGdxvsKnxHG
 n7RVf2YLQcBZeoEFOVDCPYFhfFoP07f1D7EHwPksTW4ES+iq3CfZqMA5k4UBodO9qK3q
 gIiw==
X-Gm-Message-State: AOJu0YxNl9tAaqO32bplE/2PawMBfPC2kDjCmXdlvaruEZ2rNXcnWuCg
 9mGY+VUOhJi8q0cnrghvN+IRPt26+Ki8dTW0+8fM9REhq5C7PKOWWYLaOuQCAo2ILZUKnfHHCk5
 QcJpYiCUxZIJlTJYHFFNMvg8+0j7+WbgDzxnTvxE5f/aTJBNUG88UAoI=
X-Received: by 2002:ad4:5fcf:0:b0:6a0:b0e3:3571 with SMTP id
 jq15-20020ad45fcf000000b006a0b0e33571mr1807338qvb.19.1714712768230; 
 Thu, 02 May 2024 22:06:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAv0CtNhD7OjgDoeiGsdNLgNZkpKiEWxERRRmln9BpNmpAsj+HmvB8qesiS43d45XpvuveQg==
X-Received: by 2002:ad4:5fcf:0:b0:6a0:b0e3:3571 with SMTP id
 jq15-20020ad45fcf000000b006a0b0e33571mr1807326qvb.19.1714712767910; 
 Thu, 02 May 2024 22:06:07 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-179-34.web.vodafone.de.
 [109.43.179.34]) by smtp.gmail.com with ESMTPSA id
 mm23-20020a0562145e9700b006a0d21ba03asm901928qvb.60.2024.05.02.22.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 22:06:07 -0700 (PDT)
Message-ID: <7047048b-7ab2-4283-a1d1-f8e033d6f7d9@redhat.com>
Date: Fri, 3 May 2024 07:06:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Re-enable riscv64-debian-cross-container (debian riscv64
 is finally usable again!)
To: Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, "Daniel P. Berrange" <berrange@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <20240502194046.830825-1-mjt@tls.msk.ru>
 <3ce937fb-afb9-4ea2-97ab-b8dc0952e9be@linaro.org>
 <9969663a-0f00-435b-b507-fb6a429cb4db@tls.msk.ru>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <9969663a-0f00-435b-b507-fb6a429cb4db@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 03 May 2024 05:06:18 -0000

On 02/05/2024 22.08, Michael Tokarev wrote:
> 02.05.2024 23:05, Richard Henderson wrote:
>> On 5/2/24 12:40, Michael Tokarev wrote:
>>> Revert "gitlab-ci: Disable the riscv64-debian-cross-container by default"
>>> This reverts commit f51f90c65ed7706c3c4f7a889ce3d6b7ab75ef6a.
>>>
>>> Hopefully it wont be very unstable.
>>>
>>> Since riscv64 is now a release architecture in debian, we can try switching
>>> to debian testing instead of debian sid.  Also, debian-ports part of the
>>> archive isn't needed anymore.
>>
>> So... please update debian-riscv64-cross.docker.
> 
> debian-riscv64-cross.docker is generated by lcitool.
> It looks like lcitool has to be updated for this.

Updating lcitool isn't too hard. Simply type "make lcitool-refresh" in your 
build directory - this should initialize the tests/lcitool/libvirt-ci 
submodule and regenerate the dockerfiles. Then you can do your change in 
tests/lcitool/libvirt-ci and run the refresh command again to update the 
dockerfiles. Once you're happy with the results, fork 
https://gitlab.com/libvirt/libvirt-ci on gitlab, push your changes into your 
fork and then open a merge request against the upstream libvirt-ci repository.

>>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>>> ---
>>>   .gitlab-ci.d/container-cross.yml | 1 -
>>>   1 file changed, 1 deletion(-)
>>>
>>> diff --git a/.gitlab-ci.d/container-cross.yml 
>>> b/.gitlab-ci.d/container-cross.yml
>>> index e3103940a0..dbffed3f21 100644
>>> --- a/.gitlab-ci.d/container-cross.yml
>>> +++ b/.gitlab-ci.d/container-cross.yml
>>> @@ -77,7 +77,6 @@ riscv64-debian-cross-container:
>>>     allow_failure: true
>>>     variables:
>>>       NAME: debian-riscv64-cross
>>> -    QEMU_JOB_OPTIONAL: 1
>>
>> But you can't do this until the above is done.
> 
> I don't see a reason why not.  Adding debian-ports archive does nothing
> and doesn't hurt either.
> 
> Switching to testing is a different matter.
> 
> This thing works now with sid/unstable, this is what this patch is about.

But this doesn't match the patch description - there you talk about 
switching to testing and that the ports are not needed anymore, so this is 
confusing. I'd suggest to update at least the patch description if we 
continue with sid.

  Thomas


