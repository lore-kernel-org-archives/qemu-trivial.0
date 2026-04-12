Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B791CE937F2
	for <qemu-trivial@archiver.kernel.org>; Sun, 12 Apr 2026 17:24:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wByXK-0004L4-Qr; Sun, 12 Apr 2026 13:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wByXI-0004KK-1E
 for qemu-trivial@nongnu.org; Sun, 12 Apr 2026 13:23:52 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wByXG-0007mD-AP
 for qemu-trivial@nongnu.org; Sun, 12 Apr 2026 13:23:51 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so59229375e9.2
 for <qemu-trivial@nongnu.org>; Sun, 12 Apr 2026 10:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776014628; x=1776619428; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2JK7Kl0RfvaSXVCwqzI9oBx4v80TMOjf8l0TSwPpeXg=;
 b=KDFvbv/USSI8fTTlW7F89t0jJKDwX6oAdHEUPLeLtB5RmBotyar/POPVFh3xHgCeW2
 VBhpkKQHxtc143t17NASEzTVIqmPcTn0IvsLIGxyovuItjqcuicmbJKOd/LRd/kI4Gbk
 p0sLbL04uyBOFwODlJaPIm4lujXostYWmZEfSSjZoFgQU8wOdQ1PsXZ+qdFvvWZVASqv
 8wtL63HB6XCtH70IGbt8iWUScixhwxxNP9Vi1y1Bk0ZYHfZzDyf8xITdevSNJXNxTHPp
 X/A0qFkZu98YBVVZvjAky6nS38Mj2JeMgROaHMV0J5B07OBvWh2WIrOo/jl83CinOYq7
 equA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776014628; x=1776619428;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2JK7Kl0RfvaSXVCwqzI9oBx4v80TMOjf8l0TSwPpeXg=;
 b=XTcmmp9EuLaXhZXEHn5hYYJwapnYjlJNE+ijLNLamPqanhtkZu3cetlBYNQeswhCSl
 TT6R3YuRvFzAB/enq64kAGsL8WQ0pN9Nsc+uGwAU86Tc2V4u1Jrn4vfpPlzoQxCyw/Oi
 5QZRBfuqJDGWPUNt97n8c735dlerjPZlXKbGFm/pjfvOsz1jlgkBpnD30Kw0d0X6Hc1c
 pEzl+/Zu72+0lsAg9kFa+6y5jpl+xeuS19yHhINpipPzlHamfXm8cVfbaSc5GrlsH6+P
 Jbrdg1R/rDhF6c82qeyFS4zn2YimYj3pL8SA2UzMpyRiYEgdK/IQOnIOydZo9IaemEyY
 r3Mg==
X-Gm-Message-State: AOJu0YzJhQM5H9GILHWDj76dUzGcECZ5zAxaRnbxARGsHTudI3QHsIwe
 CYmTxYTCwwaeQTTRUR/Vw38UH+ayMteZQ6RTUAqHUlaCKO4Z3QS0x+lycx2SpX9aCMs=
X-Gm-Gg: AeBDiet2nrdH7LyVYUSpSOTZsKNDABIj43D5A6ZvpyN+QF86HSG0/zjS1C3yDy0dLva
 FY6Me36DKT7z9xoVfDUywKXbl+J2kPXKtJWmZZQOu/PLXeUp40KmuL+YF9dQy/R7EqGa5ioeMDW
 xDoXbSZWFFMbbIq1cvKG8cvNirpd93PJZOyYf6sphu5OmkItGHXd0oqzRYjedPsjrdh8/7Rdn8r
 IcPA7dOwlpAsrhVwW3dlye24KJhhgO4iG5GmgHI7M2wi6JojN3tZnfwKd9G5d2jqy6Q097VSkeX
 PsQgVQVBoIXxYPF6T9AsusNyMG+fJhMaTA2gNaNsOBmaOuXAb1pUXVsihLzKInf9zuas4Nz2mHe
 Mj335qGyfJG1agQeeR/82e+VP+u8gRSLqAdoly5kcZfW2OY6X5o41RCgQSglMtgBCSX0Wiv7mIK
 lSB6EUuUpQqgwDspbtYBDTfwxODPJXzIN4Zf4vcHtpIMIfvb5e83fD+eOwfoT86ISEcg==
X-Received: by 2002:a05:600d:1c:b0:487:2439:b7be with SMTP id
 5b1f17b1804b1-488d67bf6ebmr112303285e9.6.1776014628107; 
 Sun, 12 Apr 2026 10:23:48 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d6864121sm74511425e9.28.2026.04.12.10.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Apr 2026 10:23:47 -0700 (PDT)
Message-ID: <1686f699-ea06-4489-9cf5-d940131fb319@linaro.org>
Date: Sun, 12 Apr 2026 19:23:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] qemu-keymap: fix altgr modifier lookup for newer
 xkeyboard-config
To: Michael Tokarev <mjt@tls.msk.ru>, Dietmar Maurer <dietmar@proxmox.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20260408091459.4001711-1-dietmar@proxmox.com>
 <d0e6f8b4-200b-4ba8-adb2-5c29cc668d15@tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <d0e6f8b4-200b-4ba8-adb2-5c29cc668d15@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 12/4/26 09:10, Michael Tokarev wrote:
> On 08.04.2026 12:14, Dietmar Maurer wrote:
>> xkeyboard-config 2.37 removed the "AltGr" virtual modifier in favor
>> of mapping upper groups directly to Mod5. Since then,
>> xkb_keymap_mod_get_index(map, "AltGr") returns XKB_MOD_INVALID, so
>> AltGr-based keysyms were never generated.
>>
>> See: https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard- 
>> config/-/commit/473f9bc32f9ba869829cc0d06a75cd1f2560aa60
>>
>> Try "AltGr" first, and fall back to "Mod5" for compatibility with
>> both old and new xkeyboard-config versions.
> 
> Maybe we can go the other way 'round, namely, first try Mod5,
> and if that's not available, try AltGr?  This way, "current"
> way will be tried first, and "compat" way will be a last resort?

Hmm clever. Dietmar, do you mind posting a follow-up cleanup patch?

> 
> But anyway,
> 
> Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
> 
> Thanks,
> 
> /mjt


