Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVIGA-0007ij-RK
	for mharc-qemu-trivial@gnu.org; Sun, 03 May 2020 13:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVIG8-0007Y7-Ff
 for qemu-trivial@nongnu.org; Sun, 03 May 2020 13:18:32 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:38924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVIG7-0007LT-BO
 for qemu-trivial@nongnu.org; Sun, 03 May 2020 13:18:32 -0400
Received: by mail-pf1-x443.google.com with SMTP id 18so4376754pfx.6
 for <qemu-trivial@nongnu.org>; Sun, 03 May 2020 10:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KGIW5W7BgT3oIKOmWT+7ki2S7423w+LxIvwe9IaaH4Q=;
 b=PDn3TSoRsk/PRdvsZMA1VcX0LExYFAI1AG5YwP4b1PV4e9LFjBeTdtMRdgBXbrrP5g
 9x4vDskQM636vUZ242oRHd9GZwGr1AMuBVv9PGlWMfDmC6620Ok0zh874blWLwH9m60X
 spZuPiYnWOvMrq7DA542anV9d4WiX9hC+LEA8FetIN5kxuzE2FzeuxhW1Dvn7HLMzmAm
 +jEdSKPQYnFVZAKIXpOq4FAlyrUZbztntoQPtSXcItA1BUWJIuBvs+XaiwbYSyQaTvWT
 pliLCONPYjZNmmxiiuEw1Sh9VWA6p6Gqxtx0XWCRqq+g3la0Hj+0oEiRux421dophJaZ
 ENVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KGIW5W7BgT3oIKOmWT+7ki2S7423w+LxIvwe9IaaH4Q=;
 b=gbjre0Ft5dW3z0k6fPycWCUJXGDRZEEWqAcq/hKz27CvPRZpURu3G9GF2NFNVWjDYS
 uPQOrDlwhNRLU1HUVtYiN8fidkozuA0Y9rFcX9eDjaFVpGATySM6/rxqMhCECszteXJk
 5PArnuwwzAC8BvVN6zhLPUW8+LxJofipyJvIzX3jXYTD4hEF5V0EuHtUdfjzlF3RTRis
 atTt2KLPvhAlcSoJtxuqtI8PgLqG1znlQKqqMHv+Kz2K55U7UEYrEliEgJ02tp8DBY4E
 S8oMabKZHC8Z+FT6JovluCmgk+GLxbTEvhLiVmBEggXCWvyFuVwiNhFw7ZI+MGfhq4aw
 t22A==
X-Gm-Message-State: AGi0PuZO60ZErKYSG6GkiMua29MiVvTkvAsd1A7X8ih1gSI7nIQCbTcG
 EPOAtD74g72MTFKkEjabiAOahw==
X-Google-Smtp-Source: APiQypIJ+v1FaltfSk1XL74NfJG4CWgckDvRZFTLuvKABx96kJGWcP0VSYPw3JpNpQehPFqHEq5MXA==
X-Received: by 2002:a62:1bd0:: with SMTP id
 b199mr13751624pfb.283.1588526309745; 
 Sun, 03 May 2020 10:18:29 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id h14sm4548356pjc.46.2020.05.03.10.18.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 May 2020 10:18:29 -0700 (PDT)
Subject: Re: [RFC PATCH 2/2] linux-user/mmap: Fix Clang 'type-limit-compare'
 warning
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Gerd Hoffmann <kraxel@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
References: <20200503113220.30808-1-f4bug@amsat.org>
 <20200503113220.30808-3-f4bug@amsat.org>
 <CAHiYmc61KAjFHuYCMyRunkfMdf4DD83TFTo4DJF-58KZ5YQ+Jg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cf98c9d2-a671-3efe-3e12-858f46a4a746@linaro.org>
Date: Sun, 3 May 2020 10:18:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHiYmc61KAjFHuYCMyRunkfMdf4DD83TFTo4DJF-58KZ5YQ+Jg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Sun, 03 May 2020 17:18:32 -0000

On 5/3/20 5:49 AM, Aleksandar Markovic wrote:
> нед, 3. мај 2020. у 13:33 Philippe Mathieu-Daudé <f4bug@amsat.org> је
> написао/ла:
>>
>> When building with Clang 10 on Fedora 32, we get:
>>
>>     CC      linux-user/mmap.o
>>   linux-user/mmap.c:720:49: error: result of comparison 'unsigned long' > 18446744073709551615 is always false [-Werror,-Wtautological-type-limit-compare]
>>           if ((unsigned long)host_addr + new_size > (abi_ulong)-1) {
>>               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
>>
>> Fix by restricting the check for when target sizeof(abi_ulong) is
>> smaller than target sizeof(unsigned long).
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  linux-user/mmap.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
>> index e378033797..b14652d894 100644
>> --- a/linux-user/mmap.c
>> +++ b/linux-user/mmap.c
>> @@ -714,6 +714,7 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
>>              errno = ENOMEM;
>>              host_addr = MAP_FAILED;
>>          }
>> +#if TARGET_ABI_BITS < TARGET_LONG_BITS
>>          /* Check if address fits target address space */
>>          if ((unsigned long)host_addr + new_size > (abi_ulong)-1) {
>>              /* Revert mremap() changes */
>> @@ -721,6 +722,7 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
>>              errno = ENOMEM;
>>              host_addr = MAP_FAILED;
>>          }
>> +#endif /* TARGET_ABI_BITS < TARGET_LONG_BITS */
> 
> Hm, Philippe, this will silence the clang error, but is this the right
> thing to do?
> 
> Why do you think the case:
> 
> TARGET_ABI_BITS < TARGET_LONG_BITS
> 
> doesn't need this check?

I think that's quite obvious from the clang warning -- the test is always false
due to type limits.

That said, this is at minimum the second occurrence of having to add ifdefs to
work around this particular new warning, because there does not seem to be any
other way to suppress the warning, and I'm not keen on that.

I would prefer that we disable the warning on the compiler command line in
configure.


r~

