Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1llY2s-0003dD-1R
	for mharc-qemu-trivial@gnu.org; Tue, 25 May 2021 10:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llY2r-0003bM-9b
 for qemu-trivial@nongnu.org; Tue, 25 May 2021 10:28:33 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:46040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llY2p-00085i-KK
 for qemu-trivial@nongnu.org; Tue, 25 May 2021 10:28:33 -0400
Received: by mail-pl1-x62c.google.com with SMTP id s4so14880431plg.12
 for <qemu-trivial@nongnu.org>; Tue, 25 May 2021 07:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Lv7lk7siHNvlsrrkP6v0tE7NK3VU3UzGqafpB+GqhCE=;
 b=rS60gKCdLa7Kuo2PAonZdjeZFYW2vpGgyRX7Y/xaTk8m24r0pWyg/r303O7408Y/LW
 BAfF2qk1BuykppDBCBa5cj2vcxg5yCM7VqFGo96JEVp/v+U4t9PWqZ3JAtW9fYTpEoFC
 WBAd3H6WHx0m9BOsZxqw6Rkzaj5s8PjdNGMKnxeF72zad3Q7VLI/sJvRLLYpV4U5QeDR
 SnS+fGJSZJArca3dalwHm4R1uMPnKa7j7Uc38++Lx1+u2HM4IqeHKQ3h9a3D/YJfnE+N
 RIiSZJNyUPVkXWL2RvdG+QoOoScDzNGkg+drtwuxKJArXlHnBGeL/O7iZG22ZRkwC/U/
 9idQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Lv7lk7siHNvlsrrkP6v0tE7NK3VU3UzGqafpB+GqhCE=;
 b=IaUo91Q/a28K9tMOTrF1V0bWGDVlW6c1dTo11ZC+gsygjHOO6uJL7ZiHJEz9J09Jc6
 W/2I9Ez8RDMWms0DNZDsY1AQ8YzTkCT0LZKN85R72gRFxwGH69EoeriQbO+MUR/7WWjx
 EHx2oDVITPUDwQvN3BglzuZeU3QbRWrf6RII+SL3D1vpRfwYAbsbjhm2ZM8dbyyZ1w1t
 MGgOrg9P/00jF3tJD8KXXCEG4Q08AcVIM/ghcj2YKwfsL//IAZxicPg3RFsDBA340Z4y
 8UVflJ4OU0BrXhB0lJ72TQYaM+YC1av5OhJgXijCufNrZYHOj1mgS4MFCajA44NFHKlE
 VrMQ==
X-Gm-Message-State: AOAM531C9ON8uANerP7NjjnBz8P0soVSuqr86fOzLCFtEl1npNmNW8c8
 G1ttr0I4hkKBYXjjjJRbaoAIyA==
X-Google-Smtp-Source: ABdhPJxP5pkcU7nYN9eiRIc3yfQ4Y4JOoxrJwvrSB3HJSr+YJYH/NFLIsy9/k8oMSDWhffKIZhVtCQ==
X-Received: by 2002:a17:902:ee8b:b029:ef:ab33:b835 with SMTP id
 a11-20020a170902ee8bb02900efab33b835mr30531089pld.27.1621952909476; 
 Tue, 25 May 2021 07:28:29 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 iq16sm12743678pjb.31.2021.05.25.07.28.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 07:28:29 -0700 (PDT)
Subject: Re: [PATCH] target/nios2: fix page-fit instruction count
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Cc: crwulff@gmail.com, marex@denx.de, pbonzini@redhat.com,
 qemu-trivial <qemu-trivial@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
References: <162072241046.823357.10485774346114851009.stgit@pasha-ThinkPad-X280>
 <7ff230df-8173-1dae-3750-a40b0588f13d@ispras.ru>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aa23def1-fdf1-905c-94fc-954fea420762@linaro.org>
Date: Tue, 25 May 2021 07:28:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7ff230df-8173-1dae-3750-a40b0588f13d@ispras.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 25 May 2021 14:28:33 -0000

Laurent, how about through trivial?

r~

On 5/24/21 11:40 PM, Pavel Dovgalyuk wrote:
> ping
> 
> On 11.05.2021 11:40, Pavel Dovgalyuk wrote:
>> This patch fixes calculation of number of the instructions
>> that fit the current page. It prevents creation of the translation
>> blocks that cross the page boundaries. It is required for deterministic
>> exception generation in icount mode.
>>
>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/nios2/translate.c |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/nios2/translate.c b/target/nios2/translate.c
>> index 9824544eb3..399f22d938 100644
>> --- a/target/nios2/translate.c
>> +++ b/target/nios2/translate.c
>> @@ -829,7 +829,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock 
>> *tb, int max_insns)
>>       /* Set up instruction counts */
>>       num_insns = 0;
>>       if (max_insns > 1) {
>> -        int page_insns = (TARGET_PAGE_SIZE - (tb->pc & TARGET_PAGE_MASK)) / 4;
>> +        int page_insns = (TARGET_PAGE_SIZE - (tb->pc & ~TARGET_PAGE_MASK)) / 4;
>>           if (max_insns > page_insns) {
>>               max_insns = page_insns;
>>           }
>>
> 


