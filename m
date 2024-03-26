Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rp6sR-0002AP-5I
	for mharc-qemu-trivial@gnu.org; Tue, 26 Mar 2024 09:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rp6sP-00026v-Of
 for qemu-trivial@nongnu.org; Tue, 26 Mar 2024 09:30:05 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rp6sN-0002tf-Q5
 for qemu-trivial@nongnu.org; Tue, 26 Mar 2024 09:30:05 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-515a81928a1so3924428e87.3
 for <qemu-trivial@nongnu.org>; Tue, 26 Mar 2024 06:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711459801; x=1712064601; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/2e3dQMofYK+iQiQyGxuwRKrWC4AGMEVfIDJ8td1qUU=;
 b=Fee2PCY+3/gE4qQGhBvRz5LGBEdOkKYjZ0fD7I9z5+1zUVn0kns13XXitiqPrY+T5a
 zsAjNZTTaweNsx5ZsHDWKVkHb1E1hqJYTmgvQ1YpC37goXeM3tXVSmjQIWk7viUO3DLI
 Xtg1MejLLO/zjwSIPdwwklrGxemotp4hMtb/eTvtqk71/CIWODmM3E4B/I5SdZIpwjzr
 oYCX56rPjwzkfb4c1SvHEr8eQmvz4ABlm2FiLuoE9L0GeOO9kIXOuePeRcCb3LCQ9Pwq
 gMd1/G4Y/8aPobW0q5FK1NviOeQk+RJRkgQgz5II8zCV0FOWBb3p3PR1YWpykbscq8Xy
 dgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711459801; x=1712064601;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/2e3dQMofYK+iQiQyGxuwRKrWC4AGMEVfIDJ8td1qUU=;
 b=RInZ0n6JCmZU4LBzsa+dRJ5w50ysU3ol+sPOZa2WLBtZG92QmAzEfBKUSXNeG3ZTqJ
 b3Q/L5/tWgo72xZkvqN3svhYAd+JFaRJdS8vJykSPEJ1AlsyJXoJkPGfXPiGxPEPMRvd
 DcgCPSWvgkAUx/RkOWYmLCYGqXjYmz3oMJNuNfSjSXdqNHHm465YymrumUtkdBUsD7DJ
 y8o26TXjAYfXldRDvpXZwjh9dklt3lqtr6xQbwZr+NxG8ZdoczooYeZstcKlftnnc30v
 zaEAJKFeJpk3U5JPv86V/7gHb7SVvvc31En6CxP24ZGXXDcc/unCrcuNFqWI4DKfx/VA
 KcYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaugX3n0iJfcBNAhssM8/G6XL8T79nqY6w8WlVk05usVHRXsr74JEZHDqIyVOZQ5QQU1kgQZhwC/qgGuN3evg1IvWZ9dETOQ==
X-Gm-Message-State: AOJu0YwKZZgAi0XA6wcEthvXWZfrFcki4wH6fYQcn3c+USGXtdWSpKbm
 nUYsroV5AgpH8j9/YItwo9ckxhFuSjRRHjN0Dj8rY547HZ2EBSnNtrjUIyySuL0=
X-Google-Smtp-Source: AGHT+IF75fzFm+AWOo2LQ/w/w8nyYXn3T4Fyf5JAvKtoJFdm/58wtWUUcvV4Vx9JbSGRI6CIdcca2w==
X-Received: by 2002:ac2:499e:0:b0:515:7686:6068 with SMTP id
 f30-20020ac2499e000000b0051576866068mr6151219lfl.55.1711459801482; 
 Tue, 26 Mar 2024 06:30:01 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.155.229])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a1709067c8200b00a4720ce2e75sm4200687ejo.129.2024.03.26.06.29.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 06:30:00 -0700 (PDT)
Message-ID: <8dbba6ae-5910-4a62-9a08-a56e20dfb480@linaro.org>
Date: Tue, 26 Mar 2024 14:29:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.0] docs/about: Mark the iaspc machine type as
 deprecated
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: pbonzini@redhat.com, devel@lists.libvirt.org,
 richard.henderson@linaro.org, mst@redhat.com, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20240326125104.90103-1-imammedo@redhat.com>
 <a4a0bb13-d6a0-4665-810d-ecd9a9fb89b1@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <a4a0bb13-d6a0-4665-810d-ecd9a9fb89b1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 26 Mar 2024 13:30:06 -0000

Hi Igor,

On 26/3/24 14:08, Thomas Huth wrote:
> 
> s/iaspc/isapc/ in the subject
> 
> On 26/03/2024 13.51, Igor Mammedov wrote:
>> ISAPC machine was introduced 25 years ago and it's a lot of time since
>> such machine was around with real ISA only PC hardware practically 
>> defunct.
>> Also it's slowly bit-rots (for example: I was able to boot RHEL6 on 
>> RHEL9 host
>> in only TCG mode, while in KVM mode it hung in the middle of boot)

I'm quite opposed to this patch. QEMU models various very-old /
defunct hardware. I'm pretty sure Bernhard and myself are OK to
keep maintaining it, besides we are working in separating it from
the i440fx+piix machine. Also, this machine is particularly
interesting for my single-binary experiments.

Where I agree is we should stop reporting "KVM on ISA/PC machine"
as supported.

Regards,

Phil.

>> Rather than spending time on fixing 'the oldest' no longer tested 
>> machine type,
>> deprecate it so we can clean up QEMU code from legacy fixups and 
>> hopefully
>> make it easier to follow.
>>
>> Folks who have to use ancient guest that requires ISAPC can still
>> use older QEMU to play with it.
>>
>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>> ---
>>   docs/about/deprecated.rst | 7 +++++++
>>   hw/i386/pc_piix.c         | 1 +
>>   2 files changed, 8 insertions(+)
>>
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index 7b548519b5..5708296991 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -226,6 +226,13 @@ These old machine types are quite neglected 
>> nowadays and thus might have
>>   various pitfalls with regards to live migration. Use a newer machine 
>> type
>>   instead.
>> +``isapc`` (since 9.0)
>> +'''''''''''''''''''''''''''''''''''''''''''''''''''''
>> +
>> +These old machine type are quite neglected nowadays and thus might have
> 
> "This old machine type is ..." ?
> 
>> +various pitfalls with regards to live migration. Use a newer machine 
>> type
>> +instead.
> 
> I doubt that isapc could ever be used reliably for live migration, since 
> it's an unversioned machine type, so I think it would be better to not 
> mention live migration here.
> 
>   Thomas
> 
> 


