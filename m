Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC915CD4F5B
	for <qemu-trivial@archiver.kernel.org>; Tue, 19 May 2026 20:20:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wPQvP-0005ae-02; Tue, 19 May 2026 16:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPQvH-0005Wl-E1
 for qemu-trivial@nongnu.org; Tue, 19 May 2026 16:20:19 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPQvG-00052j-1O
 for qemu-trivial@nongnu.org; Tue, 19 May 2026 16:20:15 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2ba17c8cfacso38927305ad.2
 for <qemu-trivial@nongnu.org>; Tue, 19 May 2026 13:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779222010; x=1779826810; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WX7x84E+DmnFKK6FwZ0UaKRZmCRHlVbSGDnyYPd/N/g=;
 b=cAFT5FIbXIwetXeL0yVqIfJXkFQEmNPjRH1ZZpm7YUEvO7aF+7xzJejCrc9PnCa3jP
 AbmUxyonbkQ/Z0S3NjBiPP0EuXI1668eS+MbkUZhhmM8KdibVd8hdV4ezOHP0FLF0/Rx
 kdrBGlhlQ6IIpWbBRXLYBjCARPUrI1sWHnhQN26Hc19D7tMlMEKFjw2ifJb2HtSzdy9R
 DiCRGXZbazKfspLLDbcr05wUnR0IZoRsKA/6hJeIANqv6zhve5N+34EKH48YE+8+tyiM
 uJzfD/yNJShZtG/qo/NN9sQ4Tw4hF/t+ZjtYatkKUHH6A0vNjjf2rp80NiCgv7XG1Ydi
 pJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779222010; x=1779826810;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WX7x84E+DmnFKK6FwZ0UaKRZmCRHlVbSGDnyYPd/N/g=;
 b=FKJxxx32K6PrHcOJwXLDE+difP5WGmWFyPgFmlnjb+NwUDMJagFslK2lqaiGMIMRvV
 G9jCKfMWmuJX3OwDh5HpbUAnhSGbPWjs/4tuctuqUCN+JbgeqD2UOwOyHNvlAAuMi7kl
 DZwDtsjN7HgAlLVxTVT9XUnRy7dDTk2TxqpwjBtNcrH4Vbza66XWMP8y3iiEjSAT43MW
 VheqVcg2/fpeTy6BroJ8MpPA/4BzgxJOUWxgFipISNPCzaAuHFqPZbpgrSplKRe0KMSA
 nVPfmbm66LU9fTGGoWGl2tSkmPcc/Ezztzym0eIPNvY1VLW8bq257ShqqzVbqSRLEpnH
 QTHA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/5cT3R8nXmiewqmU6VwR55vfG2TbQZeFKoiEBB6RbxjxDZC1lBtOQtgGh9Qyhy9S6C00xHoD/f3hLS/2o=@nongnu.org
X-Gm-Message-State: AOJu0YxkhzJSypUL3Rpp/KBwPEb+lW0klkNCy0Df9IxIkmdnTvS/+p4h
 vp2e+cb1waqkOP81rqSNMl+hBIjmJoY55UEY+O1WK9NxK3fJgmcvkV+8+8TA159FXUY=
X-Gm-Gg: Acq92OGItS2XynlST8Co18E6jaLgP4Y2xLBW6q2dW40kvXxZOQ5TapVVP63oMcgAfS5
 hZPAMhFENbVK6Mt6BErw/txXZhJxWLl3OIObuJnTAn+cFzM3jLNIKILjdQxlej9jUML48xQMrAU
 Fsx/tczClrawsDHSxPe39rofYWzdC+wEI8ZBWfUH/avF1m9wdt3sRgQgwvyFxI9joE11ZT9nuos
 YZ2ZMOIC8JD+reNdkeXzEdlmJbkVnfMrDJqWXxsJIRhRReNtVvb/Lr/BRas9FFuFt/DKw7GCioL
 thzqSDQazjbRvZXkXr9xsPPB1rVEnphbAW6qN4nUsSXJdsQ3bY2EBuVaNd14vvGxVJFt5lUOHjq
 YFGcz+fIUx4Vb8RRfCmHBlYgrpshthfYtF5V8YV6kLSYKSirTdhEPo1P+gPnwT1LUDsdr4G1Cg1
 AgVzGQlMjbyYl/j/yUb5CDp+8eEMRRfe8qfsH24WM/4lUjee4=
X-Received: by 2002:a17:902:d5d0:b0:2b0:7531:b61e with SMTP id
 d9443c01a7336-2bd7e97a6c2mr139604915ad.41.1779222010137; 
 Tue, 19 May 2026 13:20:10 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5d0fd384sm196292405ad.65.2026.05.19.13.20.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 13:20:09 -0700 (PDT)
Message-ID: <07cfc3ad-e828-41e5-859a-0667f63b22a9@linaro.org>
Date: Tue, 19 May 2026 13:20:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] system/rtc: Fix a possible year-2038 integer overflow
 problem
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20260518160255.1844308-1-thuth@redhat.com>
 <ags5_IDkvxClCdHm@redhat.com> <ags7xIsUG2DqX5vu@redhat.com>
 <dbc6464c-2685-46c4-803c-6af53d345083@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <dbc6464c-2685-46c4-803c-6af53d345083@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

On 5/19/26 01:24, Philippe Mathieu-Daudé wrote:
>> IOW we only platform this fixes is 32-bit OS with 64-bit time_t.
> 
> "32-bit *host* OS".
> 
> Per ./configure script, we still allow:
> - x86_64 x32 ABI      (CPU_CFLAGS="-mx32")
> - sparc32             (CPU_CFLAGS="-m32 -mv8plus -mcpu=ultrasparc")
> - s390                (CPU_CFLAGS="-m31")

All that is stuff that missed getting removed with the rest of 32-bit hosts.

> otherwise falling back to TCI.

Even TCI is 64-bit now.


r~

