Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kaGjp-0000dX-Fn
	for mharc-qemu-trivial@gnu.org; Wed, 04 Nov 2020 06:14:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kaGjo-0000Zm-3Q
 for qemu-trivial@nongnu.org; Wed, 04 Nov 2020 06:14:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kaGjm-000088-Hq
 for qemu-trivial@nongnu.org; Wed, 04 Nov 2020 06:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604488437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HS+dY8YTCUYIbmhvbzGBHroVhNemjCWzd1W0bmpcS40=;
 b=fRvQe9/T+JgSTxYcmUSpf/7CwhSar07pkXXfsdaXjB903q9PK8CUiB9CADyXT+rqkS0Zs3
 /ciIvgDjf3ytmL2mSWynUrPquJuzKXOqJhL10NlWCvGR+ejViuH0XeKxtQhKx6/JYQrvHD
 mLuzwnPTpmMtPZx+ejXdRx9ZFXAxdWc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-HPBx13r4Nrest6BJUEVE2g-1; Wed, 04 Nov 2020 06:13:54 -0500
X-MC-Unique: HPBx13r4Nrest6BJUEVE2g-1
Received: by mail-wr1-f71.google.com with SMTP id w1so9118366wrr.5
 for <qemu-trivial@nongnu.org>; Wed, 04 Nov 2020 03:13:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HS+dY8YTCUYIbmhvbzGBHroVhNemjCWzd1W0bmpcS40=;
 b=phXj7QmeCk0euC+KwgpxS7IilmB5nC4LpIPdfqvetqOZ10Kb4RqLBxT+XPqg1RRgxN
 eeQ9atUcFp9xNFBKGW9/SlVG9R43RHj8bwnI6bKnX5TSici8lsTKchcD1/Wx7NTpFiK+
 h4bbsXnZtffPY4xil0bSJF8UnTocAMUwLxAFgH51GaDrEof72Q09iBTe+xb05EajQ0Hp
 fZE6yxJtz0cnGt3zovx4vY6bfVCkJjpiNUug3+yAx5S2TTDSm7bIiJ5H84uPtrhPGHG1
 QUwAYYJuaM8AVIdKxGREY5UfuELUHU0WuK3uX4EU6lD6X1AL98C3GOVo4FFdOJbkW6n5
 Laww==
X-Gm-Message-State: AOAM531JN5cc4etJg2/OXH9T597xa2Fg7mVGmW6C5pDdmn/8CSPjPFGE
 X2kb4LDigWmk4UqhuRq73j0EyeTXFqPuSjkGnyaYR6Zpv88lw8SvJwRFnLb2KyhVPUkbxw+kdgQ
 s7sFpLL9O1ZllJLiguQ==
X-Received: by 2002:adf:cd8d:: with SMTP id q13mr31348789wrj.268.1604488433244; 
 Wed, 04 Nov 2020 03:13:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgm1JqqBHRaGC57JWmjdH+rLAw6ErCtHRnvvHuNrzvcg4hC+luCKJh1soqvGKuLVswMWp+yw==
X-Received: by 2002:adf:cd8d:: with SMTP id q13mr31348762wrj.268.1604488433029; 
 Wed, 04 Nov 2020 03:13:53 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id u3sm2031998wro.33.2020.11.04.03.13.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2020 03:13:52 -0800 (PST)
Subject: Re: [PATCH 1/4] bsd-user: space required after semicolon
To: Thomas Huth <thuth@redhat.com>, shiliyang <shiliyang@huawei.com>,
 richard.henderson@linaro.org, pbonzini@redhat.com, alex.bennee@linaro.org,
 laurent@vivier.eu
Cc: alex.chen@huawei.com, hunongda@huawei.com, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
References: <fc9d7415-a17f-2958-69fd-0b5f54e553a1@huawei.com>
 <b7231b6c-97ad-5b4c-0932-08fa331dbb30@huawei.com>
 <28961057-f570-a203-e098-6ec0d5be3f75@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <52c7980b-33bc-7e76-b985-9df77259f33b@redhat.com>
Date: Wed, 4 Nov 2020 12:13:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <28961057-f570-a203-e098-6ec0d5be3f75@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Wed, 04 Nov 2020 11:14:00 -0000

On 11/4/20 12:08 PM, Thomas Huth wrote:
> On 04/11/2020 11.20, shiliyang wrote:
>> This patch fixes error style problems found by checkpatch.pl:
>> ERROR: space required after that ';'
>>
>> Signed-off-by: Liyang Shi <shiliyang@huawei.com>
>>
>> ---
>>  bsd-user/elfload.c | 2 +-
>>  bsd-user/syscall.c | 4 ++--
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
>> index 9f4210af9a..25e625d86b 100644
>> --- a/bsd-user/elfload.c
>> +++ b/bsd-user/elfload.c
>> @@ -1227,7 +1227,7 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
>>      end_data = 0;
>>      interp_ex.a_info = 0;
>>
>> -    for(i=0;i < elf_ex.e_phnum; i++) {
>> +    for(i=0; i < elf_ex.e_phnum; i++) {
> 
> While you're at it, please also add white spaces around the "=" in that line.

IOW please run checkpatch after fixing a checkpatch issue ;)


