Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F9BCD4F57
	for <qemu-trivial@archiver.kernel.org>; Tue, 19 May 2026 08:24:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wPFkg-0005uP-Rk; Tue, 19 May 2026 04:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPFke-0005u7-Ft
 for qemu-trivial@nongnu.org; Tue, 19 May 2026 04:24:32 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPFkc-0005zi-FR
 for qemu-trivial@nongnu.org; Tue, 19 May 2026 04:24:31 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48984d29fe3so35651365e9.0
 for <qemu-trivial@nongnu.org>; Tue, 19 May 2026 01:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779179068; x=1779783868; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JmRKOwqAT3+JxL0YNNdKxGNr9QLyhAm1R7EVhecM+tk=;
 b=F5YAqPPBLf3ZgzcrEzCjN3gs6XbKJXyKtqQELHmkWJwtGFaKWpA9rRoBS6j6u3eNJ7
 5rBxjXPRil0AojzLwUfDGIe3jJiV8FhZBvWbqEUr4ZW3mkbtxocLUSIEg79MQJLT9iCg
 FLUMNi4OVAykchhohEm7gMOu+RfWesgbDyw0YQ7CptyQk+g2g07S5VMJjoGG5eUFStYv
 Y7Rrtv5a21IYCHFuBgWvqvemw7Oqjea96CdRMaXnyN9J2SD5OIP0qOSHWmeWWLxg/SPS
 8i3k8OsSpptdc93LDJWppgNzJTR266y7AOsI+E75w2oNBpAQMst7j6Xqd+Zca6wI3fzx
 ZASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779179068; x=1779783868;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JmRKOwqAT3+JxL0YNNdKxGNr9QLyhAm1R7EVhecM+tk=;
 b=CCTi+YT5bJRhq9MRqTFxFcNE/e5qDfz8s9LfdRCxxgGekG1zkHLDvU+m6KTBvQl+v1
 zyahsbXSCZf6J3WHLpG9P3YdtsMHfWOz67/+9KegCkpNESs3YAKRd7sK3a1UkfNqFaXE
 xft16wGNJF1Z5PJfqjFZJI92lrPI+aclVEMhOfpL7+CRYdZcEvb3Cn00P6Bk2CwtV/7Q
 5L8t160gJfFrRqJLytZr4BrU+HR9bAjBJCjCo5+V/PLPUC6FEqaSAsDEBF03wqlOKIUC
 hmJlTEZ71eCmRiw2ABcZ3KlJt14TOs73O6ZZO4zS5RlT1dhfcnZOAAnr00gZ9snrw8K7
 mtUw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Xfq7ROnR2xZ0xXjWB3X1dwhdJcwymtDHjoJDCoMIY+rJnppSVAFelcp/GAw/sySSQQJfXCSh2/OQygm8=@nongnu.org
X-Gm-Message-State: AOJu0YwStZ5ZxghVhouoLxik/TMlj+04Wjhsym2QTfrtu3whIvx8+8t3
 U9vMmts21qnYiZid3WCJoF1wvGsb5RzLjA32HCrlPjhtZkbKrOqgDc8U0+ugKou3Ue8=
X-Gm-Gg: Acq92OGoY2IfcDOvsTRsOVXCUiMfq0oS/obMYK8nylgmXG8YTrnKyGEgn1KirOuqJD8
 HiDJvcNSpWhvXMNjMFMuQ0FWBpOkr+hla9xBzIwUH9iEBEr1rNeh0puFvGMEA3EChGWXNswT/A/
 hyRA1OgMVmAyeeIe+GXZ489OqbU4ZEXx0UQYCjiGHDCuPKHsIZDuPyfI3+QAsGQ0x0HdiTziGmu
 GoyFJsvZ2oe/frZQ/RnyPJMGnPnjMJR66pkayBXRIOlUF7rP4fa+ZPzPvCZQhksSj5oxkFe9p5t
 PTpE/PSLZmYNuUnkatPUtDYg583MhgZXnvCzco3v4jZiuIiYamMPEYXgxmtuw/EYbMid7IN4TqY
 lzgHeqAYY7wbMpOc7dIZKrktffeoVEUu29tlsZHpLv/Feltg6mDkm0V76EA9u0R7JeytYT6BwBP
 dTJYt0qsRRyI7eJDP24bYNws2XfPQnvzkwtPjZCHRZknIQ1JJua89tdsXu+KO2yBbIBWkvYJiMp
 LY=
X-Received: by 2002:a05:600c:4a1a:b0:48a:592c:e655 with SMTP id
 5b1f17b1804b1-48fe6325f25mr172312985e9.17.1779179068500; 
 Tue, 19 May 2026 01:24:28 -0700 (PDT)
Received: from [10.139.182.66] (101.170.88.92.rev.sfr.net. [92.88.170.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec3ac86sm43245804f8f.14.2026.05.19.01.24.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 01:24:27 -0700 (PDT)
Message-ID: <dbc6464c-2685-46c4-803c-6af53d345083@linaro.org>
Date: Tue, 19 May 2026 10:24:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] system/rtc: Fix a possible year-2038 integer overflow
 problem
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20260518160255.1844308-1-thuth@redhat.com>
 <ags5_IDkvxClCdHm@redhat.com> <ags7xIsUG2DqX5vu@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <ags7xIsUG2DqX5vu@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On 18/5/26 18:18, Daniel P. Berrangé wrote:
> On Mon, May 18, 2026 at 05:10:36PM +0100, Daniel P. Berrangé wrote:
>> On Mon, May 18, 2026 at 06:02:55PM +0200, Thomas Huth wrote:
>>> From: Thomas Huth <thuth@redhat.com>
>>>
>>> rtc_realtime_clock_offset is initialized with:
>>>
>>>    rtc_realtime_clock_offset = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
>>>
>>> And QEMU_CLOCK_REALTIME might be based on gettimeofday() in certain
>>> cases (see get_clock_realtime() in include/qemu/timer.h). So this
>>> counter will exceed 32 bits in the year 2038, thus we should not
>>> store this value in a normal integer variable. Change it to an int64_t
>>> to fix the problem.
>>> And while we're at it, also adjust the nearby rtc_host_datetime_offset
>>> variable to be on the safe side in the related code.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   system/rtc.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> Actually on second reading I think this patch is not quite right.
> The code which uses the value is:
> 
>      time_t value = qemu_clock_get_ms(clock) / 1000;
>      switch (clock) {
>      case QEMU_CLOCK_REALTIME:
>          value -= rtc_realtime_clock_offset;
> 
> 
> On 64-bit platforms 'int' was 64-bit already and so was time_t so we
> have no bug to fix.
> 
> On 32-bit platforms the patch fixes 'int' to 'int64' which is fine
> but that int64 value is then subtracted from time_t which is usually
> going to be 32-bit again, unless the OS was built with 64-bit time_t
> on 32-bit which almost no one does.
> 
> IOW we only platform this fixes is 32-bit OS with 64-bit time_t.

"32-bit *host* OS".

Per ./configure script, we still allow:
- x86_64 x32 ABI      (CPU_CFLAGS="-mx32")
- sparc32             (CPU_CFLAGS="-m32 -mv8plus -mcpu=ultrasparc")
- s390                (CPU_CFLAGS="-m31")
otherwise falling back to TCI.

For sure, none of them are tested.

So, only TCI left?

> 
> We can't do any better than that as the caller code paths need a
> time_t to pass into gmtime/localtime.
> 
> So IMHO we should just declare it as time_t.
> 
> With regards,
> Daniel


