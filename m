Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113AAE8536F
	for <qemu-trivial@archiver.kernel.org>; Fri,  3 Apr 2026 15:30:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1w8gTV-0004NT-Ip; Fri, 03 Apr 2026 11:30:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w8gTT-0004My-Qe
 for qemu-trivial@nongnu.org; Fri, 03 Apr 2026 11:30:19 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w8gTP-0005mc-Lp
 for qemu-trivial@nongnu.org; Fri, 03 Apr 2026 11:30:17 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-43cfd1f9fd1so1163551f8f.3
 for <qemu-trivial@nongnu.org>; Fri, 03 Apr 2026 08:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775230214; x=1775835014; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rPs+Hsasf2RYz92x94VhxOaLL15RFPbJxBYfJKmDzSw=;
 b=Qoumquuyh2tELV967MYckJwiC7JE6mYraV+wOl71c3gaYwGQLLSUIZPoXThqUGxz70
 EuuLUXmfgCKffkUaTWdrmvg5yPI+a4J+rP7rpav186I8GdWGiky7RRjgbJ/X2LspPSV+
 BXUHPNwn7CjSo83pdrQZMETTq69YVmwnEwuadaUkAi0i5cn0yqjjo8FoQ3LkRw4bGm/A
 K8zcLRVydQgOA9/P1+LO8UuhFr6RLCN1dNX9GdAw+N/pd31JoOkj7X/UftUULRCg/MOV
 Pol9LPg/5+p9u2BGV7hwJGw/KNAfPs4M09in7OjeRTh5IZNUccZsWK3DAxSm6B1h7R+0
 Vsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775230214; x=1775835014;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rPs+Hsasf2RYz92x94VhxOaLL15RFPbJxBYfJKmDzSw=;
 b=rM87T7L0k409MO+UCD3lNnvNc/QM4SO6eP6uQJ+tNwv0zupym/HtEgCNPSVVnCE+A9
 2JRLvAU3kMaL/Xy8eUvVBdu7lreoRdPAz4by0xT4ZKPxd28DJJdOW2OxR3AB/NTtJsEp
 qqlEbAvvIW8RbKw4yfT4dXca8i6MIPuDQfCCbYg0E27yNUnslTQnSOSRoJVotJ2Wyy+T
 wm3pfE9kkaChZinzCT0BdeJ8xtEbPszZ8/pRBHuR9XXmvjK1dZcmPSn1Z7TbAFJqpxOi
 JMItVJZUZKQUuIB0Bh6LIb6orUnQQxXD1rL1s1JTt6cF8VaGCA5Zf4f3AQUFlFplTZqd
 OVcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtXD1gUHRFIQpu/q6sEcZc5XiVlZCO+O22fKQAllcB97yJJ0cHsFilz4fIC+I8LO9DjrpuMRRJ/nKDrMA=@nongnu.org
X-Gm-Message-State: AOJu0YzqXlXYuwVLHYoYaSZ9844UvrVyPhD4QV9SFCbuNpVnx2cGeuDW
 ur5+0dPnzapFuLEC9x1DeS6Uf12XAfvzu42z9bJSq+jyTuJ410s9syvTfQjl8iEWzac=
X-Gm-Gg: AeBDiesvMr6w7NFB0MlhvxMproEvqF0lQ6G5HVKFFcQGI42kJ8xHYW/EuN10XvK4di4
 a6jc+39uQZeXi45PYTjbKgWpJSMvZ/oopeQ5Vr8a2n7T6FpPASbElWpNDORrgKJkC2f79RysQny
 NirVsl/7H1Xm8X74OZWSrPNylcVVOmulCiWvVtnITg9iqRpO0mHPiYVR+f1qZS/rbalr4yigAHs
 scvBWQzga8CGcW7G+d382Oqaf6AgbLEoZHMx0Ojs1BogzwQFqzoFYUTlNfjweW0cJRA+IdAJ/zQ
 dElYypZHoGhYjMhin7Ieklhg8gTQDU9E+ikQBnhhFFfCjnlg8VPXIMqBLWDflCg00BFhxHDrh8v
 DOmI30/lXR5m9kV0gt81E9LEFMjSWbE7cmZ3IMh9/B/AO1CglPM503tzyodiXwcOaVjuF1UwKPE
 QPSYThTuVaGMH4YNPVGNRqaFKa+gAZiaVej+1NtxZ7xf8iiShFJbSz6Eemu44aYrCfEiXGWXDUV
 Y+H
X-Received: by 2002:a05:6000:250f:b0:43d:1c21:eb14 with SMTP id
 ffacd0b85a97d-43d292af213mr5892466f8f.21.1775230213813; 
 Fri, 03 Apr 2026 08:30:13 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4d282esm17689069f8f.18.2026.04.03.08.30.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Apr 2026 08:30:12 -0700 (PDT)
Message-ID: <2ab6424b-ef80-4c49-aed5-5643be850958@linaro.org>
Date: Fri, 3 Apr 2026 17:30:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH trivial] util/meson.build: do not add cpuinfo-$arch to
 util_ss for 32bit CPUs
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20260325134932.765163-1-mjt@tls.msk.ru>
 <bdc97085-ba40-4c32-a491-57112f77a2ad@tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <bdc97085-ba40-4c32-a491-57112f77a2ad@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

On 3/4/26 12:35, Michael Tokarev wrote:
> On 25.03.2026 16:49, Michael Tokarev wrote:
>> qemu dropped support for 32bit CPUs recently, so this change is an
>> additional clean-up on top.  But in theory it will allow building
>> qemu-guest-agent on a 32bit system.
>>
>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>> ---
>>   util/meson.build | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/util/meson.build b/util/meson.build
>> index 33132c04ad..170e959d9b 100644
>> --- a/util/meson.build
>> +++ b/util/meson.build
>> @@ -116,13 +116,13 @@ endif
>>   if cpu == 'aarch64'
>>     util_ss.add(files('cpuinfo-aarch64.c'))
>> -elif cpu in ['x86', 'x86_64']
>> +elif cpu == 'x86_64'
>>     util_ss.add(files('cpuinfo-i386.c'))
>>   elif cpu == 'loongarch64'
>>     util_ss.add(files('cpuinfo-loongarch.c'))
>> -elif cpu in ['ppc', 'ppc64']
>> +elif cpu == 'ppc64'
>>     util_ss.add(files('cpuinfo-ppc.c'))
>> -elif cpu in ['riscv32', 'riscv64']
>> +elif cpu = 'riscv64'
> 
> This should be ==, not =.

For 11.0, using '==':

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

For 11.1 we should simply rename the files using $target_base_arch
suffix.

