Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD323CD4851
	for <qemu-trivial@archiver.kernel.org>; Tue, 19 May 2026 09:26:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wPGiW-00011A-M5; Tue, 19 May 2026 05:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wPGiV-00010n-2a
 for qemu-trivial@nongnu.org; Tue, 19 May 2026 05:26:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wPGiT-0008R0-Dk
 for qemu-trivial@nongnu.org; Tue, 19 May 2026 05:26:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779182779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JSllUAonAJDX5a1JeBiyKmqynKeJJUK6J8n1r4wbKxc=;
 b=NItmw34RFNgEF+9m4PoLrDDhXI8EmhaMx7ByoZ/gvN/P1pNrxtDMSkf6DoaudcTXOG5+q1
 CV46P74Uk3CQsjdgGVZ0u6J/gAQejJnkbspobGScqAJyyOjmxOdYHcLoCImpT3enLGy+71
 UJk4SrSSFihY1/9f+koGK2Wa4xhRW5U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-uJ9JdET-OfC_I9midOhJ8A-1; Tue, 19 May 2026 05:26:18 -0400
X-MC-Unique: uJ9JdET-OfC_I9midOhJ8A-1
X-Mimecast-MFC-AGG-ID: uJ9JdET-OfC_I9midOhJ8A_1779182777
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-488d3eec9bcso24796055e9.3
 for <qemu-trivial@nongnu.org>; Tue, 19 May 2026 02:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779182777; x=1779787577;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JSllUAonAJDX5a1JeBiyKmqynKeJJUK6J8n1r4wbKxc=;
 b=hGcj4zfUKYwCuRVM05Jph4G2jDZ0ERFgun3GM4TeCEfriW4XkoWXa5w+ab2oLuUKJ2
 3CefiiotBd+UTfOsqUch2RY1h8Yj+XJW6fr69UeQ1VCCRoMru/0A2Vwbk6h7pr/+US0p
 H4e5SGlhx/kmcO5pU2MVC0xAx80bXxjEuxl1cPZ/Wjstg5nNsk8l878CRKB7VXMW23s+
 2y8SlFrnHAJpj5faXHxO5BKZ6vIKSskulNKYYa9sDtwCbwvzD7FEJ94+mtbLaWlLsKvD
 zzRXRAU5oHLn6sYrET3CksPxSF8geo/PZrA6f1Mwygp11e8RBVxONdKxyQCZt46qRMH2
 uTdg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8nOFJafZ3e6bdNqjQHbmGh657vJSxN9T/G/v9zWSNu0e2Q2AGpMl0oF5c52JsUx8fKGx/KR+iOT8ZCZdI=@nongnu.org
X-Gm-Message-State: AOJu0YzIP6UOOxF5JZwe0CywPHK2ruxw7VimCRt3ygay6HqBI0JewTPE
 9HT8K12ykjcMJ7H+LNRuZjEF5F5X9B+OFhkttYXQXoa34d34o47JeC3ThkHyBtEmDjIaMcJQOC5
 6jksaJ9sf7BUcPyS9re3b02mbrmFzXhkTxDkN6uOnX3wznRYLrsEo4lFzbYs=
X-Gm-Gg: Acq92OFRgeFZInHDWHXY78yCGdSkEt8h8qdX4LxQE69NROjiXEX1RbUwKre6XHfOBzi
 vMBZX0WP88lDDcl+RxPWy3qdY53seeF7whMy83FpVGI1Oyy++7VZtGKIBIHeLc+4HMT0gJEMXWi
 Bx5LVZqWCM0qg2OCP2rW/4n9wkkuZxmlmn/GKQAH9+vg+pAbbnWezsTF71zbZMzs6p8Fv3Chi02
 BuuUmdkoLjmnJ2bn8QuSzrXduv34DPu+4OiztJ6r3OzrVJyq0saPUgtXXc1xQlPSCQdcFdC+lnc
 a8gHUCc8Ij8YOyr8T6Yywq2AqLMYAr56mk6RaO1O7sQ/xENzrzyjj6+CB5N7LMoy1HBPQz0Tb8O
 DRxqQrbYlPO7nATvdRhDoKFybAuplQlrH0rAunMks6zrj570=
X-Received: by 2002:a05:600c:858d:b0:48f:d5d7:df63 with SMTP id
 5b1f17b1804b1-48fe661b207mr195412785e9.27.1779182776822; 
 Tue, 19 May 2026 02:26:16 -0700 (PDT)
X-Received: by 2002:a05:600c:858d:b0:48f:d5d7:df63 with SMTP id
 5b1f17b1804b1-48fe661b207mr195412525e9.27.1779182776427; 
 Tue, 19 May 2026 02:26:16 -0700 (PDT)
Received: from [10.33.192.243] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4dac000sm320673195e9.0.2026.05.19.02.26.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 02:26:15 -0700 (PDT)
Message-ID: <b70b35ef-1761-4624-9f98-7c1ae161ed9a@redhat.com>
Date: Tue, 19 May 2026 11:26:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] system/rtc: Fix a possible year-2038 integer overflow
 problem
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>
References: <20260518160255.1844308-1-thuth@redhat.com>
 <ags5_IDkvxClCdHm@redhat.com> <ags7xIsUG2DqX5vu@redhat.com>
 <dbc6464c-2685-46c4-803c-6af53d345083@linaro.org>
 <c9fa27e3-0939-4490-b350-7a625ebcdcdb@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <c9fa27e3-0939-4490-b350-7a625ebcdcdb@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ViDb5e3mCUDJe0kqV4A8yWm1nX3vPyOP6PwtgRYIa68_1779182777
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 19/05/2026 11.18, Thomas Huth wrote:
> On 19/05/2026 10.24, Philippe Mathieu-Daudé wrote:
>> On 18/5/26 18:18, Daniel P. Berrangé wrote:
>>> On Mon, May 18, 2026 at 05:10:36PM +0100, Daniel P. Berrangé wrote:
>>>> On Mon, May 18, 2026 at 06:02:55PM +0200, Thomas Huth wrote:
>>>>> From: Thomas Huth <thuth@redhat.com>
>>>>>
>>>>> rtc_realtime_clock_offset is initialized with:
>>>>>
>>>>>    rtc_realtime_clock_offset = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 
>>>>> 1000;
>>>>>
>>>>> And QEMU_CLOCK_REALTIME might be based on gettimeofday() in certain
>>>>> cases (see get_clock_realtime() in include/qemu/timer.h). So this
>>>>> counter will exceed 32 bits in the year 2038, thus we should not
>>>>> store this value in a normal integer variable. Change it to an int64_t
>>>>> to fix the problem.
>>>>> And while we're at it, also adjust the nearby rtc_host_datetime_offset
>>>>> variable to be on the safe side in the related code.
>>>>>
>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>> ---
>>>>>   system/rtc.c | 4 ++--
>>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>>>
>>> Actually on second reading I think this patch is not quite right.
>>> The code which uses the value is:
>>>
>>>      time_t value = qemu_clock_get_ms(clock) / 1000;
>>>      switch (clock) {
>>>      case QEMU_CLOCK_REALTIME:
>>>          value -= rtc_realtime_clock_offset;
>>>
>>>
>>> On 64-bit platforms 'int' was 64-bit already and so was time_t so we
>>> have no bug to fix.
>>>
>>> On 32-bit platforms the patch fixes 'int' to 'int64' which is fine
>>> but that int64 value is then subtracted from time_t which is usually
>>> going to be 32-bit again, unless the OS was built with 64-bit time_t
>>> on 32-bit which almost no one does.
>>>
>>> IOW we only platform this fixes is 32-bit OS with 64-bit time_t.
>>
>> "32-bit *host* OS".
>>
>> Per ./configure script, we still allow:
>> - x86_64 x32 ABI      (CPU_CFLAGS="-mx32")
> 
> We should maybe deprecate that x32 ABI ...
> 
>> - sparc32             (CPU_CFLAGS="-m32 -mv8plus -mcpu=ultrasparc")
> 
> ... and that one as well?
> 
>> - s390                (CPU_CFLAGS="-m31")
> 
> Uh, we really still allow 31-bit s390 hosts here? I think this could be 
> removed nowadays, also upstream kernel recently ditched the 31-bit userspace:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ 
> commit/?id=8e0b986c59c67e08ada646249f834655a9e6da16
> 
> Question is whether we can remove it immediately, or whether it needs to be 
> deprecated first?

Ah, wait, we completely disallow disallow 32-bit hosts nowadays:

  https://gitlab.com/qemu-project/qemu/-/commit/372ec46b9f1215f48a4717f2b7ed969f65bfadc6

... so these checks in the configure script are just dead code nowadays that 
could be removed now? Or is there still some hidden magic here that depends 
on these lines?

  Thomas


