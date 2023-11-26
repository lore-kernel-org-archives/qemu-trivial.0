Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r7I2P-0004IQ-6W
	for mharc-qemu-trivial@gnu.org; Sun, 26 Nov 2023 11:31:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r7I2N-0004I3-3T
 for qemu-trivial@nongnu.org; Sun, 26 Nov 2023 11:31:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r7I2L-0000gK-Ef
 for qemu-trivial@nongnu.org; Sun, 26 Nov 2023 11:31:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701016270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tESVyCbEqY3fZphta7AAE85uWY/SdylIvWfSF0jFY2c=;
 b=Jkhmq8FQJjvQAL7v/5uCpw6KbF8DML77JwbOLQfDiXLBi+mhcCX+ZHntu4v9WCLjn8U7xL
 i9/5Nkv+dIR0mvazvyiN9b9Jjuf+wUWZXm3dA8tkoAqdtCaD+fqVjStiypWpdB99BNImTw
 leT6ja1hyu98giWN93UAqA/gC2tfJHU=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-8bPTXtp4MdqHxJKVtdGFeQ-1; Sun, 26 Nov 2023 11:31:08 -0500
X-MC-Unique: 8bPTXtp4MdqHxJKVtdGFeQ-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2c50255b905so30552071fa.0
 for <qemu-trivial@nongnu.org>; Sun, 26 Nov 2023 08:31:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701016267; x=1701621067;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tESVyCbEqY3fZphta7AAE85uWY/SdylIvWfSF0jFY2c=;
 b=oCXbZ6Ir/rFk1puuUUt7U4+/kpSN7EvlA5Fbz2E221x/MMgO6BLnNjFKLvircc9uf+
 AShBX/FhIVHIzs6iDW8QvmlTVWjbLdf18s3DHKPyDYNXoFRqQBlM0nL4MOvWwNZAlY1i
 9Xi6r2hL9VdFf91eCB6ouuZKxycGDmQQqLJtJkdZ/QiOfh+4hLlNDXw43TwF+Myz8V2g
 29vB2aE9frbw/Fl9TffzV+ZKo+ZeVaMhQ/9P+JjaUVOt8i+e3GQcm4D+ozd6dScvEoTU
 IWPLtJDDfu1HqHgMzQHrCMpuCYnIJrgtX2iQmnuOVb5JkWR84dKogNVU/IsUKUFSGh8G
 5pZQ==
X-Gm-Message-State: AOJu0Ywl/Tx1mTuJ+RdrjPrkTamaNrOZ1wGQ8N6I8T9omRW6ioBDjf90
 YriY/exDWmXJJROCu7IbLFfWg0A38etd+rEuau4i166JkzOHAHIRu6Hwj81c++Kp8wsIDXt4G0D
 ETQkxnhX6XuHqARJ1wQ==
X-Received: by 2002:a2e:b811:0:b0:2c9:99d8:e31f with SMTP id
 u17-20020a2eb811000000b002c999d8e31fmr1778213ljo.16.1701016267012; 
 Sun, 26 Nov 2023 08:31:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEz1sHo8xNuR9+ZRfDrUpuODB6ml4LYE/VmR49/HGxPTH5S3PMsdPwgWa+LGnjJnI/hVJt+0Q==
X-Received: by 2002:a2e:b811:0:b0:2c9:99d8:e31f with SMTP id
 u17-20020a2eb811000000b002c999d8e31fmr1778203ljo.16.1701016266651; 
 Sun, 26 Nov 2023 08:31:06 -0800 (PST)
Received: from [192.168.0.6] (ip-109-43-178-170.web.vodafone.de.
 [109.43.178.170]) by smtp.gmail.com with ESMTPSA id
 t4-20020a0560001a4400b0032d9337e7d1sm9598659wry.11.2023.11.26.08.31.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 08:31:06 -0800 (PST)
Message-ID: <ebfa1132-14e7-4ae1-96f0-b2581d0abb2c@redhat.com>
Date: Sun, 26 Nov 2023 17:31:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sh4: Coding style: Remove tabs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 xun <xun794@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>
References: <20231124044554.513752-1-xun794@gmail.com>
 <2ba80e3f-c13e-406b-a365-37841ff655b4@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <2ba80e3f-c13e-406b-a365-37841ff655b4@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Sun, 26 Nov 2023 16:31:15 -0000

On 24/11/2023 16.30, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> On 24/11/23 05:45, xun wrote:
>> From: Yihuan Pan <xun794@gmail.com>
>>
>> Replaces TABS with spaces to ensure have a consistent coding
>> style with an indentation of 4 spaces in the SH4 subsystem.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/376
>> Signed-off-by: Yihuan Pan <xun794@gmail.com>
>> ---
>>   linux-user/sh4/termbits.h |  204 +++---
>>   target/sh4/cpu.h          |   80 +-
>>   target/sh4/helper.c       |  236 +++---
>>   target/sh4/op_helper.c    |   70 +-
>>   target/sh4/translate.c    | 1466 ++++++++++++++++++-------------------
>>   5 files changed, 1028 insertions(+), 1028 deletions(-)
> 
> 
>> @@ -241,17 +241,17 @@ static int find_tlb_entry(CPUSH4State * env, 
>> target_ulong address,
>>       asid = env->pteh & 0xff;
>>       for (i = 0; i < nbtlb; i++) {
>> -    if (!entries[i].v)
>> -        continue;        /* Invalid entry */
>> -    if (!entries[i].sh && use_asid && entries[i].asid != asid)
>> -        continue;        /* Bad ASID */
>> -    start = (entries[i].vpn << 10) & ~(entries[i].size - 1);
>> -    end = start + entries[i].size - 1;
>> -    if (address >= start && address <= end) {    /* Match */
>> -        if (match != MMU_DTLB_MISS)
>> -        return MMU_DTLB_MULTIPLE;    /* Multiple match */
>> -        match = i;
>> -    }
>> +        if (!entries[i].v)
>> +            continue; /* Invalid entry */
> 
> Thomas, better fix the 'if { }' in this patch or a following one?

Normally I would not mind either way, but this patch is already quite big, 
so I think it would be better to fix other coding style issues in separate 
patches.
This way, you can also verify with "git show -b" that there are no other 
unwanted changes in here.

I now also quickly skimmed through the changes and the patch looks fine to 
me, so:

Reviewed-by: Thomas Huth <thuth@redhat.com>

Since the sh4 subsystem currently does not have a maintainer, I'll take the 
patch for my next pull request.

Thank you for tackling this!

  Thomas


