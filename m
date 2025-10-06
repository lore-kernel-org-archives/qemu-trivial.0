Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BE4CCA470
	for <qemu-trivial@archiver.kernel.org>; Mon,  6 Oct 2025 04:13:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v5cag-0002n9-0I; Mon, 06 Oct 2025 00:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v5cad-0002mn-Cq
 for qemu-trivial@nongnu.org; Mon, 06 Oct 2025 00:12:47 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v5cab-0004wo-IC
 for qemu-trivial@nongnu.org; Mon, 06 Oct 2025 00:12:47 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3f44000626bso2713320f8f.3
 for <qemu-trivial@nongnu.org>; Sun, 05 Oct 2025 21:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759723963; x=1760328763; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7TL2S4y4tBH1AYTrLDVwmbGtgIo2li3NtoPmqfxWBfQ=;
 b=p6WouMXmVPWMJt0uaIYo6dv1V+aI2EBXO/fWCC94mUWGmnMYU6xephYCUw4gFuTXej
 3/nXSobOva7pee3PnDjBpHKN53PpG1Xrub1Tm9FCvu8VGAXmsTAni7b2FAJlSHKSTQ8f
 ny8s7kfKFPeMIKZJV47V4TRX6zJDmslwTugMfYIx+tp/kmZCuRWUiEUt/7OsIXO/lCOM
 DMFeD5+b/44XLiis0opEFK3jH2y5KjC6VAFJK2L2Jf8OIx6hsFkm7mfttq3leR6Lyukj
 TVIFpHL2nQcK1mK+LoP5e7IcoiKC8IvDLXRsGNwUAbIELXxAZ3/Rm2wj/ilteLfG52d4
 K5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759723963; x=1760328763;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7TL2S4y4tBH1AYTrLDVwmbGtgIo2li3NtoPmqfxWBfQ=;
 b=wdTLg7lhMqH095afPnd5rzgoBb4zZqSEVXKW51EV5Vg7Gfo6IPfmVwMnDR847fkbby
 m/QnJEsf/UjVwnWzhbSg++kk8Sk7bZ5Y5WXcrG9OtsCytLXJi41ArlkVmdbFMhJ0N7nt
 9WzkgIszXxRuyYhgRgEBIaewK+KYXMv86b8J+jVvl+AUrbBvJ99gDTsOudb8f8WH8ao3
 IyRpLe+YEurQu00ZpphGnb7BtcvvgpD/QyShvfBTgfNWhM0/c8Dy9m9cRgGZFrZCtC8D
 f11WZulFEhX+zkS2I3NN8AgJVfZiB9LCaMatYcIlgkOB25UBtKKrPwE/C5UBh3+h13+o
 46eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCViP54LbEVkwunSLHm+rcRH57IJ/xxCVQvU/tvCd93zgHxw5HGtOACEZMbjPLwFshNlZLkxlwnO20F/lq8=@nongnu.org
X-Gm-Message-State: AOJu0YwcrDSFoFP3WCH33jEA73e1eCaeIYV9xiYB8QFdLIdkK8U+yK+P
 vonukoSd6xWYBVNGGTJb2zx/8EbEJ4zVNb5l4IsHQLruUUqakYvjY9vszncRWGl0oTYVJjVb8l1
 9HI1YBUyUVQ==
X-Gm-Gg: ASbGncuhxHmsadRQEAiNONJym+7540t9IsVScBA/OGPSYo0RV2CH6QM+pEx9A8ESl5K
 8xXT5QL7t+39KgfcT0PD7odPDN2oAT4lWbURa0zpbLC9AOT6R6euPnMBwG7aekCvxH0+/uNq02a
 FO8R1KR4Eg9Hk4LfLmqUuKENHnpYAajBy01tPrgzIqXK5+0S97cQviz99WhDO17jFyiGzAnX3nJ
 Yjjv/IYnXjy60g9vN04L7cki8SKBsAPGGU+5HTmEFn1NMrqchZZ52yTGavIa/L/c1eqy9KRGrEP
 KfkpQkIv3JkrKC3rdU2foCHfDqapxZo1LA5ewSDF9sLDmdcGErRdigmVC0bftna+9nDGZ0zFJ4y
 +P3FvrwwkThdbzX3PfpX3lnJkAb3c6i1dErul89cJZxxKAOaUeKunhXuJvrmr5s+bZPWnXuoWeW
 BC30FL/FkdMqz2R68ABg==
X-Google-Smtp-Source: AGHT+IHZV0DGVaUFFaPFtQVuPHq2KDQfzU/Ec7UYX4RHRi/ByDFrehd4adXxQmkiq/TizARbrI/RaQ==
X-Received: by 2002:a5d:584c:0:b0:3f5:453:77e3 with SMTP id
 ffacd0b85a97d-4256713a129mr6016831f8f.6.1759723963633; 
 Sun, 05 Oct 2025 21:12:43 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e72359e0asm143195045e9.12.2025.10.05.21.12.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Oct 2025 21:12:43 -0700 (PDT)
Message-ID: <d65a63ca-9c54-4855-979c-56b1c1b351a7@linaro.org>
Date: Mon, 6 Oct 2025 06:12:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/openrisc: Replace VMSTATE_UINTTL() ->
 VMSTATE_UINT32()
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Stafford Horne <shorne@gmail.com>,
 qemu-trivial@nongnu.org
References: <20250925004855.59084-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250925004855.59084-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

ping

On 25/9/25 02:48, Philippe Mathieu-Daudé wrote:
> Both OpenRISCTLBEntry fields are of uint32_t type. Use the
> appropriate VMSTATE_UINT32() macro.
> 
> There is no functional change (the migration stream is not
> modified), because the OpenRISC targets are only built as 32-bit:
> 
>    $ git grep TARGET_LONG_BITS configs/targets/or1k-*
>    configs/targets/or1k-linux-user.mak:5:TARGET_LONG_BITS=32
>    configs/targets/or1k-softmmu.mak:5:TARGET_LONG_BITS=32
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/openrisc/machine.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/openrisc/machine.c b/target/openrisc/machine.c
> index 081c706d02c..fa054e528bd 100644
> --- a/target/openrisc/machine.c
> +++ b/target/openrisc/machine.c
> @@ -26,8 +26,8 @@ static const VMStateDescription vmstate_tlb_entry = {
>       .version_id = 1,
>       .minimum_version_id = 1,
>       .fields = (const VMStateField[]) {
> -        VMSTATE_UINTTL(mr, OpenRISCTLBEntry),
> -        VMSTATE_UINTTL(tr, OpenRISCTLBEntry),
> +        VMSTATE_UINT32(mr, OpenRISCTLBEntry),
> +        VMSTATE_UINT32(tr, OpenRISCTLBEntry),
>           VMSTATE_END_OF_LIST()
>       }
>   };


