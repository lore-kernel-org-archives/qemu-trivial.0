Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B0CC98315
	for <qemu-trivial@archiver.kernel.org>; Mon, 19 Jan 2026 01:26:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vhe1l-00072g-9z; Sun, 18 Jan 2026 20:25:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vhe1j-000718-CB
 for qemu-trivial@nongnu.org; Sun, 18 Jan 2026 20:25:55 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vhe1h-0004kF-UV
 for qemu-trivial@nongnu.org; Sun, 18 Jan 2026 20:25:55 -0500
Received: by mail-pl1-x644.google.com with SMTP id
 d9443c01a7336-2a09d981507so27737045ad.1
 for <qemu-trivial@nongnu.org>; Sun, 18 Jan 2026 17:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768785952; x=1769390752; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y01E/RUCaBlqxhgPfwif2LFgxCVHmXAvqYomjATnbKA=;
 b=OEdRYOIEE6wlYL8vwAUgI3pkdCLU+AM7GAziWvHKjuak3j5bMEM4+jIQQTyV3u4YaJ
 yTexTpS+tvfKwzmCgEMXCKK2tcpPM6WB5YL0Pucul+1c25Gppho9S9qKYDXdDULFW7La
 7gIw9n7CEGr6nDAt/Nep6fBbB8N6bYgNH2W5unzH0/uJhO68WOHuNwySVfWi72XH6Xre
 +ZqTmIUR2JckxeWtxlPzwk6IfdgsgGhWGm+YRurn3xmKon9NyXFuNATgnhv76xO+/QCc
 QIgD0OLVEhE+CwXp8zoW81KJaLsPI7oeWCZoId/ld4H2VR+4N2ZFeveHLT6CGV2EfVzP
 jr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768785952; x=1769390752;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y01E/RUCaBlqxhgPfwif2LFgxCVHmXAvqYomjATnbKA=;
 b=R7yK+wQE4UOiQCzcpT7YRsdffALUpvJvs9BWnIf5VmhnWJZgkFnV6kJlxpdvpbYlW0
 09C2L3FoUkU4ojBVCyZ1YY2bQOFKn33ScOMDXperkw5xiKjsj8jGcWlbr1AhRTaAbe5I
 AXC6HGrqJuqA2QLoGTxRFq4CRGx0Hxgg9bUTkC4sQgwmsWPFgLb7c0u72OInAY0J68GA
 zp9GYAWOYwukKFB0EFkx+E1q5jyT/nKcZc6Pd8TpmWsSBGcfqHFtmEpi1D6gdFkjdAbX
 P+Fh0sGzLSn3ELke0KZVroPdOcI0+3Kg5hX/BFam/t/kCctFHBHevIpMnlm/O+9hB7dk
 RpgQ==
X-Gm-Message-State: AOJu0YwzRsxomPlpOvKOPiHTfdrpvqJl4qWVdVnXksXnK23ovmnMUjQM
 Y09zGi/p/xDpq/3P2zBSiO+EE67skc+sMrqliAgTAQIrztubhfhbPtGBgso4m07ImB8=
X-Gm-Gg: AY/fxX583nC58a/bhQtJnsPSHX6OQMizyXYwOc4przmZeK7coeTqO7KLPlk9thYcoF1
 8o6pktEXP5/NI9wCunWIVOvWkaEsNVG23IF5t6AKEzdL2OYB1ZzBIn2z1CRvUukMuYV6xJadPJG
 pPRsh/1KaTItXlXNos1cdZRXdvnUQAuixYnjbT1nEhByh11ni1uZ/0Pqi35tGbfen61me/MDo2d
 HQRZLVRSKifUJxTL22OFnUMN26P2w4Tf8dApSLpTs6GV1wwe7GwpWOItyTaJKhG9XNcKjUkUaId
 Ff9uGg/N+hKzzdWW89SLjbV/tulrJ3wpG2BtGvkQfYiBO8Lbcj1pNoj1uC73PPrdSu+//mQVyOp
 XxZBoyETI7tGv3fEU6MDbNwn8VPMs7Z73XlhubtHzV+TjLaZ1YWqyIBS4HSD+FBbiixrrsMNRDt
 wnT+5C+dfcNlU9NGYWLe3YEJNpXJmXVA==
X-Received: by 2002:a17:903:1108:b0:294:f6e5:b91a with SMTP id
 d9443c01a7336-2a7009ba1a2mr114506545ad.13.1768785952411; 
 Sun, 18 Jan 2026 17:25:52 -0800 (PST)
Received: from [192.168.10.140] ([180.233.125.201])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a7190abcf0sm77374445ad.12.2026.01.18.17.25.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jan 2026 17:25:52 -0800 (PST)
Message-ID: <1ffa78cf-a1e6-4338-827c-2d1b175de044@linaro.org>
Date: Mon, 19 Jan 2026 12:25:47 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH trivial 5/7] linux-user: assume epoll is always present
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20260113130008.910240-1-mjt@tls.msk.ru>
 <20260113130008.910240-9-mjt@tls.msk.ru>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260113130008.910240-9-mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/14/26 00:00, Michael Tokarev wrote:
> epoll is in linux since 2.6. epoll_init1 has been
> added in 2.6.27.  There's no need to check for its
> presence, including all other epoll-related syscalls.
> 
> Modern architectures don't have epoll_create(), only
> epoll_create1(), so keep conditional around the former.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   linux-user/syscall.c      | 10 ++--------
>   linux-user/syscall_defs.h |  3 ---
>   2 files changed, 2 insertions(+), 11 deletions(-)

glibc 2.9 for epoll_create1; 2.3.2 for the others.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

