Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1loho0-0008Ro-Hr
	for mharc-qemu-trivial@gnu.org; Thu, 03 Jun 2021 03:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lohnz-0008Ql-8w
 for qemu-trivial@nongnu.org; Thu, 03 Jun 2021 03:30:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lohnx-00076q-DZ
 for qemu-trivial@nongnu.org; Thu, 03 Jun 2021 03:30:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622705412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XhkhzH0Ec7rOMKGs0jDelj2yQw1bK6lXAx/cskk/K00=;
 b=VllEenCqpgHAA3WedEi7VaWlTqvpSavyuzPKSkkvxYK7lDksmiiPiwwq0ICvPPtcqcty3M
 ppcMYEDJxo65qpZzGDI6+ZDH5r//0MnSggXuNcUcGYkbYbQgV+XVRuMEkviV7VreZQmPlu
 RTiOnuCbG9vJD5MfyDsr4kMLe49vCNg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-2v8j9rUpMbyDvfMa9exVOQ-1; Thu, 03 Jun 2021 03:30:10 -0400
X-MC-Unique: 2v8j9rUpMbyDvfMa9exVOQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 b8-20020a170906d108b02903fa10388224so1613423ejz.18
 for <qemu-trivial@nongnu.org>; Thu, 03 Jun 2021 00:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XhkhzH0Ec7rOMKGs0jDelj2yQw1bK6lXAx/cskk/K00=;
 b=hHkDteHvUon0PeE/A1r+7vD9UTNpQL5kQSMSdHopamvdfvC5HQaquLGP8W0tCFaLfL
 BYcqzackISvLZLfNZAHj+HONQ5plNvr4+qSMty79SsD+Z8i8yU8YlN/gwB2L2bfng/c2
 +vlV65/4FS58ingF38P2zhnhyJusBQ8+wMN5PwPX/QY0QNts98PBHkQN2Xe9pu0BynHC
 11Q0GOgwB9/XyTQDmpOaMFPBFdLyxOw+hxm5btKa2PzaoIkdgW0suAdW8P75n3kve/V2
 hx/61BYdTumLBOU3V+HIcL5xu6XnQ60aM0AaVT65i6KhczWtZCrQJCzhmQwy0IM9KSXX
 P2YA==
X-Gm-Message-State: AOAM533298bKGiYj/NFlz5e/VEmP6N60OhF9VytAZB2GFm8/hchHB39C
 0FynSTQvu1Nxf5TA6qW/C3GQenBAxSVZOBPQ0PuUODrpBHC/RLPSOjc6z5JMOKk/nHytsqq7fCN
 3HxR5VYkeyKRIIaDrhvY8+EN+ysUFTfQdQXwOUE6ILPYc0fX0tb6gQ/9RgHnh/CbMzok=
X-Received: by 2002:a17:906:55d6:: with SMTP id
 z22mr38156183ejp.355.1622705409080; 
 Thu, 03 Jun 2021 00:30:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZVgm94jugx2PCmQxFOhL2yW22dR24ypAEnE4LFdMISZQoZPL6HVANT4LcYPXvHfJ15a+PEg==
X-Received: by 2002:a17:906:55d6:: with SMTP id
 z22mr38156156ejp.355.1622705408698; 
 Thu, 03 Jun 2021 00:30:08 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id l14sm311156edb.58.2021.06.03.00.30.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 00:30:08 -0700 (PDT)
Subject: Re: [PATCH] target/i386/sev: Ensure sev_fw_errlist is sync with
 update-linux-headers
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, Connor Kuehl <ckuehl@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210219180131.2061072-1-philmd@redhat.com>
 <665ebe97-fbe2-2273-0a02-1a94351c1e1c@redhat.com>
 <20210602142212.siv7c33hsxiik36y@habkost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cae5fd02-953e-c0b3-83db-3f2e534006c8@redhat.com>
Date: Thu, 3 Jun 2021 09:30:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602142212.siv7c33hsxiik36y@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Thu, 03 Jun 2021 07:30:15 -0000

On 6/2/21 4:22 PM, Eduardo Habkost wrote:
> On Wed, Jun 02, 2021 at 12:48:18PM +0200, Philippe Mathieu-Daudé wrote:
>> This patch was supposed to go via Eduardo's tree but he
>> missed it, can it go via qemu-trivial instead?
> 
> My apologies, again.  I'm still behind on my qemu-devel backlog,
> and this was still buried in my inbox.
> 
>>
>> On 2/19/21 7:01 PM, Philippe Mathieu-Daudé wrote:
>>> Ensure sev_fw_errlist[] is updated after running
>>> the update-linux-headers.sh script.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>> Based-on: <20210218151633.215374-1-ckuehl@redhat.com>
>>> ---
>>>  target/i386/sev.c | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/target/i386/sev.c b/target/i386/sev.c
>>> index 37690ae809c..92c69a23769 100644
>>> --- a/target/i386/sev.c
>>> +++ b/target/i386/sev.c
>>> @@ -87,7 +87,7 @@ typedef struct __attribute__((__packed__)) SevInfoBlock {
>>>  static SevGuestState *sev_guest;
>>>  static Error *sev_mig_blocker;
>>>  
>>> -static const char *const sev_fw_errlist[] = {
>>> +static const char *const sev_fw_errlist[SEV_RET_MAX] = {
>>>      [SEV_RET_SUCCESS]                = "",
>>>      [SEV_RET_INVALID_PLATFORM_STATE] = "Platform state is invalid",
>>>      [SEV_RET_INVALID_GUEST_STATE]    = "Guest state is invalid",
>>> @@ -114,6 +114,8 @@ static const char *const sev_fw_errlist[] = {
>>>      [SEV_RET_RESOURCE_LIMIT]         = "Required firmware resource depleted",
>>>      [SEV_RET_SECURE_DATA_INVALID]    = "Part-specific integrity check failure",
>>>  };
>>> +/* Ensure sev_fw_errlist[] is updated after running update-linux-headers.sh */
>>> +QEMU_BUILD_BUG_ON(SEV_RET_SECURE_DATA_INVALID + 1 != SEV_RET_MAX);
> 
> A mechanism to notify us when sev_fw_errlist needs to be updated
> would be useful, but I'm not sure I agree with this change.
> I expect update-linux-headers patches always consist of 100%
> automated changes.  This patch would require a manual update of
> target/i386/sev.c to be included in the same commit as
> the header update.

OK :(


