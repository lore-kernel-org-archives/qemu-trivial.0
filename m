Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA2DC83F17
	for <qemu-trivial@archiver.kernel.org>; Mon, 28 Jul 2025 15:41:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1ugPyF-000868-0w; Mon, 28 Jul 2025 11:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ugPyA-0007Sj-4V
 for qemu-trivial@nongnu.org; Mon, 28 Jul 2025 11:40:54 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ugPy7-0002SF-2s
 for qemu-trivial@nongnu.org; Mon, 28 Jul 2025 11:40:53 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b78310b296so1040206f8f.2
 for <qemu-trivial@nongnu.org>; Mon, 28 Jul 2025 08:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753717249; x=1754322049; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=clWmwPIvlE/uJUsDm2T1onrs09ie61Lz/tDRVg0acxg=;
 b=YeG+ckthrlgntRVLf31/r4Cu1ZHIAFb5SeZ4xq0nqPenh8oL5u9IZn9b1zQQbN/1hC
 nGpv38os/KomAUBMY0bsX/WHzc67rr2Ku5Z+zTfkMl8LWE+u4e+s5ljV8iHEU5gHEPI/
 l2MmFfGFaS4T3BOEPzxr+blvHlqvo+KiJdsKrMU9ITRts4MfiZit8n6XHLLACXpCl11J
 ttClWP58SeQRG8dm2wIgkx/oE7BCxX/dzIkkRJsdL9nD79R3va3vwJ40WBjRa9f6KhSJ
 EJChuMAjI2fmZVBsO1LV7NP++YfMScIIKUX1Zs8xZmW1QawSzhPVwp/pujZSJFf0jcJd
 5s6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753717249; x=1754322049;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=clWmwPIvlE/uJUsDm2T1onrs09ie61Lz/tDRVg0acxg=;
 b=wgPbNvFgE9m9tHz7qCnZ5Q1j/CdXR8Wq8tMHNdqSztjbKrn8oNxCp4Den8gAo+oM/v
 /pK96jTd/6ZmKA3rq87PBU6RPb/pGQZCdXnPW2/bEqZHx0nahIuFFTU73TtyItZzT477
 PbXE2FX0F/FG1QdkIfTFBmxUYCAgiFYVnxgWHA3/ampf1Ew7bhtpb2zzS/3zRz22xzj9
 l/URbOazgFP6XITX6Nfv7ak+3iRLJ0q3RK+rJsuind+ptj3n0y7G0aLScMA4oOQzmt+s
 B13pSJUsVtXmEJe1YL1rhxtrTVKKsd10+TtufCMer7kDABct/mH2DjG7RLJIFQseyhyQ
 TVDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvujwZxRhNF6uY6DToFvP6HAiRyCz9Or0ND250bftO/NfajlB5LdzTXvmFN+tuBZFjV5wn4zcBupZrQgE=@nongnu.org
X-Gm-Message-State: AOJu0YyG0QQHqwvPH2fVBxm+sHh147FZrxzX+0VV2fHtZQAql6R1LIKl
 R/Qh0YpSY+8qFAPOaq3Q4nRNTd3SHr3IjSELQuiEHgjG80KdICv54Q8vETPlqi9cg0b/9jL0t0n
 yjuy7
X-Gm-Gg: ASbGncs/TiVFddtfNXyEgD2DH1IRaYaea+d6iE7EzGwAUYXdfeS0iOtfERQ44KGhNA9
 JBE7JNZfXK16mI+GQ5uWBlOtDpV2AQlyHuj6w95ceaJGgmAZskTV0AVONsGqHqClpqO2h8uFtMU
 Aiv5pEmgHiVrsoRH3sWCqpgYUdeu1rpfXEg7g1tCs9qByepKO/yroG4uu4hrtEBaB4r3yTQuCYr
 q6xQWLiNIKEVC9N5FkH2m3FEohHkXb/ku7vk5RfFkDeoWPpVnfg7xHX11bLND3hcIBUwuX+p45D
 oUbRJTUTQShlse3yHc/70cvm16cG1oRKRRB2eLoO5YNu9xVkDZut0wSuUho5AkTLg0ndMuvhzIK
 GqPw01gODYzbIOEol44Otm462SnPikOrfz91D4LgKIgGXJYqfE8W/bwvPf9y/J1Ajzw==
X-Google-Smtp-Source: AGHT+IHPcE+k/WmwZbRhgKMu43FdnjtR/zsViUUtbcX7mSUgjIwP2DkUsMia7dQ6Ay9g8fMZ9l7uWA==
X-Received: by 2002:a05:6000:2382:b0:3b7:8d80:e382 with SMTP id
 ffacd0b85a97d-3b78d80ea5bmr318913f8f.4.1753717248896; 
 Mon, 28 Jul 2025 08:40:48 -0700 (PDT)
Received: from [192.168.69.209] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b78cf1f571sm739366f8f.22.2025.07.28.08.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 08:40:48 -0700 (PDT)
Message-ID: <1adc2441-3522-43d4-ae04-973a1cf66010@linaro.org>
Date: Mon, 28 Jul 2025 17:40:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/mips/malta: Silence warning from ubsan
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org
References: <20250728115152.187728-1-thuth@redhat.com>
 <43b37539-e4eb-465c-85e8-b7c83324910f@linaro.org>
Content-Language: en-US
In-Reply-To: <43b37539-e4eb-465c-85e8-b7c83324910f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 28/7/25 15:25, Philippe Mathieu-Daudé wrote:
> Hi Thomas,
> 
> On 28/7/25 13:51, Thomas Huth wrote:
>> From: Thomas Huth <thuth@redhat.com>
>>
>> When compiling QEMU with --enable-ubsan there is a undefined behavior
>> warning when using the malta machine:
>>
>>   hw/mips/malta.c:1200:32: runtime error: addition of unsigned offset
>>    to 0x7fb620600000 overflowed to 0x7fb6205fffff
>>   SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior hw/mips/ 
>> malta.c:1200:32
>>
>> To fix the issue, check the bios_size whether we really loaded the
>> firmware before trying to byte-swap the instructions here.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   hw/mips/malta.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
>> index cbdbb210568..47dd4016cfd 100644
>> --- a/hw/mips/malta.c
>> +++ b/hw/mips/malta.c
>> @@ -1190,7 +1190,7 @@ void mips_malta_init(MachineState *machine)
>>            * In little endian mode the 32bit words in the bios are 
>> swapped,
>>            * a neat trick which allows bi-endian firmware.
>>            */
>> -        if (!TARGET_BIG_ENDIAN) {
>> +        if (!TARGET_BIG_ENDIAN && bios_size > 0) {
>>               uint32_t *end, *addr;
>>               const size_t swapsize = MIN(bios_size, 0x3e0000);
>>               addr = rom_ptr(FLASH_ADDRESS, swapsize);

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

and queued, thanks!

> 
> What about:
> 
> -- >8 --
> @@ -1180,7 +1180,7 @@ void mips_malta_init(MachineState *machine)
>               } else {
>                   bios_size = -1;
>               }
> -            if ((bios_size < 0 || bios_size > BIOS_SIZE) &&
> +            if ((bios_size <= 0 || bios_size > BIOS_SIZE) &&
>                   machine->firmware && !qtest_enabled()) {
>                   error_report("Could not load MIPS bios '%s'", machine- 
>  >firmware);
>                   exit(1);
> ---
> 
> ?


