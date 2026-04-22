Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F93FA1FEB
	for <qemu-trivial@archiver.kernel.org>; Wed, 22 Apr 2026 19:34:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wFdKl-00077d-ST; Wed, 22 Apr 2026 15:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFdKM-00075q-LH
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2026 15:33:41 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFdKI-0004K8-K0
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2026 15:33:36 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-488ad135063so51528525e9.0
 for <qemu-trivial@nongnu.org>; Wed, 22 Apr 2026 12:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776886411; x=1777491211; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EdvvfQV7C/HKEgtEKulrXXsI/l7NqKfgy04M6FKHrhM=;
 b=LN4N4ubcxXwfr392vCQy77caYfjFi91uPmZPKjtaGe/oJr5HTtSWMeFXsxjEoOFBqf
 UGfP/vPo/VPkeN2wuErN6x8SGRlV8jhloZN5GB0iU1IgOJzUINK/9CKmpPK4t089IIbX
 NOWkdSxNi2w90NKWchwFaSvCeikKixaqyxearmTPbjhvgGdlQ+CGsYAVBV4Ndq0hrmx8
 H/jdZ0uR0Ds2cS+McpLOBKRucIbEvw3sowr+PyVG85SZdKR6N1un1hbgYPVHNQCYKs3I
 ne69pUQSpqIXkQ1g8mAGWKO1VYKsrCbbXkpqhoDWO43yRvHUeDj/HPl89fJm2ZECyFME
 zlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776886411; x=1777491211;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EdvvfQV7C/HKEgtEKulrXXsI/l7NqKfgy04M6FKHrhM=;
 b=Oa0paekHEzfsslf5ajBAVL02crp7nHabl2c282Lq1Azz8eSB8W0lebvqY/SUtn6aM1
 UGG9byv3VU/baTYH/M7A4dP48Lh4QgD8BtALGbVqw18c3XgAv1CsR01lKrI/B/jUua3E
 KV6wkew7tXrlb7cqyZHD9fmRd89x3eFniKlnawEIQq1bFhY6f0LKFWTN5EMYNDsFaYsT
 ioBJwXk0X15IRwluh9OflHgkL9ehEWD9m7Fa6Z8aQ8AZwZiIZoROrS5etSrZZJRjWokQ
 /9lFaZPpwfVEiJfB1F0UanGRWXYH5Ni5ozvBAW0pDGR4Fil2DTyNymksff/x8LYslAhX
 9B6g==
X-Gm-Message-State: AOJu0YwE67MuBxeqc+TxTkE0ol8lBTRX8QuypjtnNns4gKNIuqdj8rxU
 54yIMiU8KvXVjuHEqzCiGu0reEo5izU55YXJ9UrhXKn+/Gm+eBcSrF3SCVxeSZzJdJI=
X-Gm-Gg: AeBDiesN2POg0DfchQRYrTOEpZxtxDiAvDhz3Pgw1uxekOLVwkXXmX1EKrqcLKaLz5/
 1MkL60Vhsapr8/ORDd2IGWdQCLn9Ek9CN/cQlBPUH7QydCa27YzXgy1oASQE801LFuP2u9nlfAm
 enrZSwN+N7D1P+Obo1LMFXuKbN4KtbqcFSzAYSiPM+EivIIKhNxnkAE9sjmJGok6I5iX/G2RC4j
 wBQPP76Rc+nVaReoX465XvDK7WtVYGWWEtJs1bw7zX8mWCsn32H1oGwVKFMeokLQvkFe+fo+gHr
 yAGQmU3aB2D0GZNRFKajyH4j5Im4x8ZzdeE1+7HDtjSfg0bXhXUCq4BH/3gDVT0P9gPY+4C6XB3
 ZJ2kR4zjLfrRYwnLilM4H+Wr+HWfk9PMkVw/N82jR28okNrIoaagtgRnVbxd9k2rrRojaZJ+CIJ
 ZBfNpXHQbXP7fwXC/Wztr1IJRAq2X/Zr2F2UmFUcus5W1iO0V4t3tSyGWldg0MbgWYsISlP1Mvq
 tbv
X-Received: by 2002:a05:600c:8587:b0:485:3f30:6250 with SMTP id
 5b1f17b1804b1-488fb7856b9mr259836695e9.20.1776886411465; 
 Wed, 22 Apr 2026 12:33:31 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48919f54572sm108676365e9.26.2026.04.22.12.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 12:33:30 -0700 (PDT)
Message-ID: <c7358ff1-132d-40ba-b778-f245b7d38480@linaro.org>
Date: Wed, 22 Apr 2026 21:33:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/sh4/sh7750: Remove forgotten abort() in the
 MM_ITLB_DATA handler
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Yoshinori Sato <yoshinori.sato@nifty.com>
Cc: qemu-trivial@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>
References: <20260422075429.341409-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260422075429.341409-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 22/4/26 09:54, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> QEMU currently aborts when the guest writes to the MM_ITLB_DATA register:
> 
>   echo "writel 0xf3000000 0x11223344" | \
>    ./qemu-system-sh4 -M r2d -display none -accel qtest -qtest stdio
>   [I 0.000000] OPENED
>   [R +0.004476] writel 0xf3000000 0x11223344
>   Aborted                    (core dumped)
> 
> Looking at the history of the code, the abort() here has likely just
> been forgotten when the register handler had been implemented (it used
> to be a reminder about unimplemented functionality initially):
> 
>   https://gitlab.com/qemu-project/qemu/-/commit/9f97309a70f12df5f9104f1f
> 
> Thus simply remove the abort() now to get rid of the problem.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3420
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/sh4/sh7750.c | 1 -
>   1 file changed, 1 deletion(-)

Patch queued, thanks!

