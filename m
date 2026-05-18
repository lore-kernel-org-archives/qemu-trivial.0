Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC56CCD4F3C
	for <qemu-trivial@archiver.kernel.org>; Mon, 18 May 2026 16:08:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wP0WE-0001jP-7U; Mon, 18 May 2026 12:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wP0Vv-0001eZ-3e
 for qemu-trivial@nongnu.org; Mon, 18 May 2026 12:08:22 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wP0Vs-00011E-7e
 for qemu-trivial@nongnu.org; Mon, 18 May 2026 12:08:17 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso20755745e9.2
 for <qemu-trivial@nongnu.org>; Mon, 18 May 2026 09:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779120494; x=1779725294; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1Hq/U8uoTYQfZfrXhRIyCRMmbM4zcasjUbs+QOmzN9w=;
 b=ZZ7qlzVltbODBdm4RMItFwYRY7ftz/u7oyNx75kCYmrCWHmOsHGjn0HQwtM0a4Jhtd
 Utjtp4Bv5bwLvpglxn4/JpkrDtblilioW1eND9HrGC8mAVESd9jz0muwZIJkMV53nEiP
 DCXNkzIbUTODYNX9QDydWtIj8gD8VEPp2Fw9QhFvqDw+uXvYHyRvw9/tOGgWA6QNGEDI
 OpdXtBGfWnySVdxrp9J7VgKnJAqeT/H6g2fmjGNac+q30ta/5A2ioi0TiZ2I3OrOXtBU
 Z7bZ3CzeEWHGk2lPmyCU/W8AvQZc3bOx1nrB620BZe4wfmbeV71NXHGw3VjiAsrq4luV
 NTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779120494; x=1779725294;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Hq/U8uoTYQfZfrXhRIyCRMmbM4zcasjUbs+QOmzN9w=;
 b=QTvdsKuc7n13INuGXJo6XO6fYj42IfvuxHVOGg4+jlYZzRnT5c5vMQJkFSdzii2g99
 +tGOf+SJLSqG0Zj5dp9eO2GVgOmI1ggBaQhfkeg0L7JqXYBs/isUy+PSBvhLQBXjALG3
 Q+VpyeaIJ0eFLhNFaHMwUOaGRHNeaEEn5hxFbJQxOsJchSwnUuhedHr0r0BFRVfdvZut
 4ZaU0Fe7/T1lanfs+VWMxIcZkpG6ELl15sURJkE11mOScryqTTno/qLKmWh0ft0zjqeD
 Ej37svy6axCPqcAkJoyEaP9HFEYxsjTc8VRzkE2iRzqBbSRJxGlVTyxHjl1skw1VP0uJ
 dgiQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+SX+8357eUlvDf14hoqCXS07E7Tdm7Gp/DU3juDwVba6aAagy7vrzZZb9mQb5VAQPwa121Rh9nWHolALA=@nongnu.org
X-Gm-Message-State: AOJu0Yy2Oyp2FV/E9j5AeJ6/qPDeMcBVBV3xxsL1kNWXXKBDUZ4m4SLO
 28Jjumv2kkhHaz/c1DIQJz4lyHNWbr8T329Vw108lRfu+cgxG+OexqFCfD1U6YETUkU=
X-Gm-Gg: Acq92OEuskxPruOS2LbW/kIk0qVKb/uGmTUCTOIdF1L56annuvNDqz5i5GvjkaB83Dc
 yab3xiymUeb+mQSdge4i5z/HJFkdFWWD2cyQLWjdSTWGUUAJg/FNZ89i+gb/VnFdF909t4bcEVc
 8k93itj64h1WBA/w6EBf79BpK8D+luIritTP1J4Ta6frrQn6Nx52tOH3jOtmOrD4TLVLbhDRIIm
 zC1e0BBCZIKvAk8jnXOuIVx187EU5Vh9BTyuHSQCXwVQ93PHgxV7uLWejNHOwhxItnBeNEdOIfM
 ur/i/5i1eSVkGNm/XtMfCrrAkw7lzRmIHIxa9MSLc+M8oZukU5dNWN0W3WN1uxRNaV0d3Bcqr75
 EirCUS2D8mAoe7vjH+dcMWIxhVSatG0UiKfnGmMClXdKFsalnB6t3kBz1Dg4YlV4oDAjX8cUSFV
 +T95gySySACYXjDtcujg/TDYThJuowPXnl3nu2Akf6vjdg1ri24r5mZHfNqukgO0JErA==
X-Received: by 2002:a05:600c:8b6e:b0:485:9a50:3370 with SMTP id
 5b1f17b1804b1-48fe60ecc24mr255578925e9.8.1779120493469; 
 Mon, 18 May 2026 09:08:13 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febe67688sm106981265e9.5.2026.05.18.09.08.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 09:08:12 -0700 (PDT)
Message-ID: <99665646-f286-4e7f-8c74-b667718f4468@linaro.org>
Date: Mon, 18 May 2026 18:08:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] system/qtest: Fix length parameter in the b64write code
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-trivial@nongnu.org
References: <20260518134020.1420932-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260518134020.1420932-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

On 18/5/26 15:40, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> The b64write code has a sanity check that the given lengths matches
> the real length of the given data, and calculates the minimum of the
> two values to be on the safe side. However, the address_space_write()
> then uses the original value and ignores the calculated minimum. Use
> out_len here to fix the problem.
> 
> Fixes: 70da30483e7 ("qtest: Use cpu address space instead of system memory")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   system/qtest.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

