Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8444D262B7
	for <qemu-trivial@archiver.kernel.org>; Wed, 21 Jan 2026 04:45:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1viQ5I-0005UN-E4; Tue, 20 Jan 2026 23:44:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1viQ5F-0005Qx-Rs
 for qemu-trivial@nongnu.org; Tue, 20 Jan 2026 23:44:45 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1viQ5E-0006oa-0x
 for qemu-trivial@nongnu.org; Tue, 20 Jan 2026 23:44:45 -0500
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-bc29d64b39dso2028275a12.3
 for <qemu-trivial@nongnu.org>; Tue, 20 Jan 2026 20:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768970682; x=1769575482; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4zx7doX7UoTngoxwG03mZXvl0zEiqMmCA9YlOsTrq0g=;
 b=S76wu8AEhcahIj3XqsOkeeoq8U4TzTyvOw2rO6S0bWx3D4O0oQcPAXdQfliWQAQKQH
 92O8SJGGcveJnCy7Ot6qu/b2c9CbnA14Mcmg/txgf77kbGnbqPQ9impzJFab/BbiL2r/
 5fuoOo4sjAvTWFpb/mmCvd+/z/avT8Bv5pQlnF7HAqbc0VVI8cHrtCg4qG2029PG4qnf
 j4dpsOr0+cuGXF6b2WhA0vXDhp5A4HJFGxSoEk5PZgk0uk4M8VtuqvO0SI7q5roSMZ3s
 Xu1DzZjFZwh2R0y8h1T63LgmYgTByR+8zmmh0m/XeobroRd667uKGsQqOQGWflk/VH6e
 X0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768970682; x=1769575482;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4zx7doX7UoTngoxwG03mZXvl0zEiqMmCA9YlOsTrq0g=;
 b=YOKSvpJQy4MW0BvwhEe0GzbCzVItzBFlxNZJjE1Pc56f2VF7OwI8CuwrxQPv1sDfeI
 Z/+jrCConNIyRUSuf06BzG/+I+uXS8zELWEIqKgND+urGDorTcxbH+zGlG08rYcQwHnJ
 opHCFTpd76IlWKi04tQUq75YWw5290vuTeySI6b425EiWWJJhC45fG6fDMOGnmU4oLyD
 XWojxiibMqwDsETvh2ePG8n8a6Y+CT4FpQtVueMKf2ibVzEdctCy9R+6LcHWndIUxRpK
 rUKB6DGbPLHdlL0Ht4+UkVfdRbgTU6bGBBXuABoIwPUfgkxlDxrliTCGsrbETAjprjMA
 r+pQ==
X-Gm-Message-State: AOJu0YwRiKJYrPYosc1XAX5JxE+3OKxWBL7sZb4HRnAReaKOfNqO1hXp
 8PRrOLnRhsLx8TAZM3q+03wrVM3uJYr1vKgWHxuwunUjnJNHTkVqO6Yvyi00rPulmIOe5KtFU6d
 BE/qH0oZWhw==
X-Gm-Gg: AZuq6aLbX/YpunzQb4tctlBsbpz1cyDplaQOLruZ1QSHEXz2G8wYGvlPdnG30O2POP8
 PxWsf89NTUV0UWCWKrGrzUkXkvgHlm3wugMziU+T5kQNLIIX6arrxQgCf2X2SK7SgXOmj/GZhBE
 Kjo4JzR+ZOeAxawkdx2vJ2+Hle4xGn8CTYRhEsYwAnFYXAQBi3yI0OjcwoJ0h4aoq93MyJGZDCr
 IpOJ2NLi4uwyhCbgAr18mnEYVUvGivlRe+dLIpw/rk1ya9hsEe7Xl5QY7QLAn0E0QCEbjq5Ioud
 2Lv2rbJ0IGoZOPhzAy91zapYZZgPdhQFifIIeF1uSPcdHJcslUO6ITQul25eIYgpPdiD8KqiUfD
 pDLY7OETpeybmt150iWvF9f3Xjq61zHGSCWdXk9u2sALYIhK7DDGvzoqqA12kQN1ruzIOTVJJn2
 9+NwcuLiuPO6nhrK7fVDyzG7t53828gA==
X-Received: by 2002:a05:6a20:4325:b0:364:be7:6ffc with SMTP id
 adf61e73a8af0-38e00c029d0mr15784224637.18.1768970681667; 
 Tue, 20 Jan 2026 20:44:41 -0800 (PST)
Received: from [192.168.10.140] ([180.233.125.201])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81fa108b21fsm13595345b3a.13.2026.01.20.20.44.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 20:44:41 -0800 (PST)
Message-ID: <ca79d5d1-2e7e-47ea-b695-c2bd67f5e78f@linaro.org>
Date: Wed, 21 Jan 2026 15:44:37 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL v2 00/10] Trivial patches for 2026-01-20
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20260120123107.2255178-1-mjt@tls.msk.ru>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260120123107.2255178-1-mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

On 1/20/26 23:30, Michael Tokarev wrote:
> The following changes since commit 38879a667fbb4ef54c70de71494882615f600a64:
> 
>    Merge tag 'pull-tcg-20260119' ofhttps://gitlab.com/rth7680/qemu into staging (2026-01-19 09:04:31 +1100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/mjt0k/qemu.git tags/pull-trivial-patches
> 
> for you to fetch changes up to f0de58ccf6566ad5cf04948788f9b0cfb8b960b4:
> 
>    bsd-user/syscall_defs.h: define STAT_TIME_T_EXT only for 32 bits (2026-01-20 15:28:21 +0300)
> 
> ----------------------------------------------------------------
> trivial patches for 2026-01-20
> 
> I'm also picking up the STAT_TIME_T_EXT fix from Pierrick
> (not resending whole series, just this additional patch)

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/11.0 as appropriate.

r~

