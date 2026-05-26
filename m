Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BE8CD5BB4
	for <qemu-trivial@archiver.kernel.org>; Tue, 26 May 2026 07:46:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wRmUw-0006e5-NL; Tue, 26 May 2026 03:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wRmUv-0006da-Bo
 for qemu-trivial@nongnu.org; Tue, 26 May 2026 03:46:45 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wRmUt-0007DQ-VP
 for qemu-trivial@nongnu.org; Tue, 26 May 2026 03:46:45 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4903974854dso40663655e9.3
 for <qemu-trivial@nongnu.org>; Tue, 26 May 2026 00:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779781602; x=1780386402; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ccuaxQlJ6nmnaxwolOCTONAaLO9F7oYlnRvBOl+TEIg=;
 b=k6kMvj5wK3oozJqJno1+9t4agVwSkYFEV73TZsRh1Aa8ERud6khZwTq9iCQnLPXRKj
 7+ze2LeE7dYzgv4xvm4dZyjYoVm0TbksrHhp/dmur7sRboXeUdP5XxqSwnI6PsW+xAUI
 R6MKYYJc7gEz4LXY3vz343GGrXWclJbeLGvin+oTdG/V9yCg/WQO1Dcy79wzQwPsVjbS
 w+J0BIVdEbpHRErTLMm66AM0tP7kQ0BTz+2ALbuylsqj0xUWzD2V/q3gA3iUON5HBUbT
 N2RAfIy0dbiM2HafNVqMLi7OVZGB4+2Jv8nLaObovduvuvc43jZGiTcVkU5NVlHDiHBs
 lRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779781602; x=1780386402;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ccuaxQlJ6nmnaxwolOCTONAaLO9F7oYlnRvBOl+TEIg=;
 b=dx7TWEW3YWRW4PDmhM7SAiIUtVWLBorP7Ksgxah79dQKjpGskM/44iYLw2EqIyPhCn
 kkBlwHMv9hay9+NjNuXO7PzMlGomXW27NyA2+WqsHSmsEFVzDgl9T1WckQ2qmiXqr31R
 N/59rPRW3FzR3iZ85xEMVFPo1TMhTgfsxfmeAFQq5K/cx/U1tmFSAiZ8Dy3wm1Ym7kO1
 V92zmakR7Q1OL35hwWlgQcsIEaew5kqey84ZInBc/RVCcmIAvcVvwYNov1Bvh0/lI5OZ
 RHCiIgPw72ESdUaebZu1kLB1N0iJz4+AlEzWsW+O322Kh+6I5sCG3NlD4Gsnat/JaaNm
 5+pQ==
X-Gm-Message-State: AOJu0Ywkyap24QQ6Sw/39wi7Nidl0mS8sb5SyOmDHM6Z6ADIFGywf5V5
 lutMHFtKThw09uUBp8KqNXSUxwV0y/LUmESba/olrag4w80YQndBz4oh3ZtsSDqp8js=
X-Gm-Gg: Acq92OG+YI0rRMD9pUM+yYD2KhKFbWSunMpI1r/+32Kpwf8MQij7QUPsfMAkHDC+220
 xqDoo2mZPH1n/CMOPxCR0D92Dv15IWOjJ2RqLwQmpYJVjq9cPcuyipY0Dt6rE1MOdq/qGBog/32
 eXPFq2z4keQgtyN2Gb8Nw6D8UP8Yy2ExcXKgYoaanuUWEn3nGLymJiPO6QNzjc6nx+CoimJcGH5
 kvJwLfu+grbavk2m7ddz4c3ZtV/Ej1NhlybGuxE2oHQzNbpRrugyzCvi3vS6rQ13jikKIcq4ZQG
 8wjNfpGr1pDCcXIgBGm9oYkurrAKb4R6yNWvLlLh9i2/NuiHsNHQARElDZ7kPukpqzDSYVJiYwi
 01Jnx9Z+G9LLKuAsecLbaIOYeIoyqyeBv2tXdAPumgWOmwcuRqt5vNIKcYrORAQGmYEdAA2+h6f
 4q3iZiCngoQ7mmlXeSpZT+6J7o9rAexGyaq7P7p648CBjdyvBYb1q1zilC9dwhB+4l/Q==
X-Received: by 2002:a05:600c:6217:b0:490:44d0:11b6 with SMTP id
 5b1f17b1804b1-49044d01257mr287308425e9.12.1779781602375; 
 Tue, 26 May 2026 00:46:42 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904561a33dsm278977915e9.11.2026.05.26.00.46.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 00:46:41 -0700 (PDT)
Message-ID: <fae4fb8f-8574-424e-bfc9-dc9eec86b943@linaro.org>
Date: Tue, 26 May 2026 09:46:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] block/io: Use QEMU_LOCK_GUARD to simplify mutex
 handling
Content-Language: en-US
To: Evgeny Kolmakov <randomjack94dev@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, stefanha@redhat.com, fam@euphon.net,
 kwolf@redhat.com, hreitz@redhat.com, zhangckid@gmail.com,
 lizhijian@fujitsu.com, jasowang@redhat.com
References: <20260522080644.9531-1-randomjack94dev@gmail.com>
 <20260522080644.9531-3-randomjack94dev@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260522080644.9531-3-randomjack94dev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

On 22/5/26 10:06, Evgeny Kolmakov wrote:
> Replace qemu_mutex_(un)lock() calls with QEMU_LOCK_GUARD().
> 
> Signed-off-by: Evgeny Kolmakov <randomjack94dev@gmail.com>
> ---
>   block/io.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

