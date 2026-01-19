Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE3CC98315
	for <qemu-trivial@archiver.kernel.org>; Mon, 19 Jan 2026 01:21:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vhdww-0004U7-FW; Sun, 18 Jan 2026 20:20:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vhdwv-0004SL-7g
 for qemu-trivial@nongnu.org; Sun, 18 Jan 2026 20:20:57 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vhdwt-0003iR-QI
 for qemu-trivial@nongnu.org; Sun, 18 Jan 2026 20:20:56 -0500
Received: by mail-pf1-x443.google.com with SMTP id
 d2e1a72fcca58-81ecbdfdcebso2179592b3a.1
 for <qemu-trivial@nongnu.org>; Sun, 18 Jan 2026 17:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768785654; x=1769390454; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BBrzs2RRFJeF55PljLLAsbzFfwlKmB5YZ8RH7zVTXhY=;
 b=YEiS5Z+A+K3LWhydmmifDf4Q9nG6IMXC+q2AOeP9zXP9bokZmeJ+8uPfD4aZv82Kbo
 wMJrEmKD4Oe1NNsogxpRR3erbqWTwClXpICS1xuRLbwU1Aj3mXH0rWuhBgsnJoo6L9pA
 Jf8LqhEZgzwJBetKzahcYnxgI5mFKZIpONqO6l0+CJnHU4tD1zb1ZaqyNp45+H82F2AH
 k37NjcvX3/xfQQLw3TZS25BFyc1M+HHPKAUI8NbDCp8B5MlVED4kSrTi+rMr64LMXxrC
 Dfy/xmB93c9bU4GAATt2qmrF6UALOykmh/PpFx/uqf6VO+PwXz4hz1zGKVuRV/jywlHO
 zlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768785654; x=1769390454;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BBrzs2RRFJeF55PljLLAsbzFfwlKmB5YZ8RH7zVTXhY=;
 b=tRHS1BUe2JBtm2bOZyVVn2yVnIQBxG7jyYxgFhedfaGdXqu4Lef+ZWNU3oZt/H/WtF
 VYm2IJzuWM+2GbLATiL0tb0E7yja0SO7f5vZdor0dZEeX2CC9GbmRe+1qS4q+auZo/qL
 xvRt8DXxp7A89L1P++gqPPahDRkDBmgDWX5DLf43WPQpC4ByRfWhNXMwjPUf10AeB0MP
 DwxmrE0qnfLV5J4lnkwWXz2UvPlo0pVpTMjOWiv1x6zcAC8ifasddJYi70fOrQxLmjzB
 gCEqCJdPHOYKeNTNCi9DNdoUEjfJtQPG0CqCoNfkA/vh4oYEHehag3RZDUuPTapI8jmd
 qgEA==
X-Gm-Message-State: AOJu0YwAB/z4/6euj49hzLW3f5JdlQG3ThPvY2QEV1WfaZiRI8nJIvkC
 lJzpiOYFc8b7V7fEM9YEa08xdwiWiyxSjcerh88ZOBfxOFc/ZTCLfpNQvUgGcyCWAaaDQgZT2KK
 DMwsTFCVZb4U0
X-Gm-Gg: AY/fxX5RvcdZGUblxz4izAk8R17H36yT3JzzIrGT8kuDIF2qkQZSSUH2XZUgniU7x3t
 OhJ/NBEwXafcF/9gskYg01odpdULAE/j+nFdltK8diyGU4jl5M+1vgMDqpB6rgVLpYtpk3sVoHG
 JJBtZnRqbFxIbkBFDi6NYjqeSwhjM+Fc83nc45osTEkJh2Xr+G6P7hz9uOv/dLPLgA3ET54o7a6
 OPLGD8FzN5uyEcbaYhfwXwWa+zrkzMT0ksd33rQBDQEiAXg8/r4A+WlmUMnhEX8tGmk3ckqMOC3
 ANE7r3PzUJXh2M9S/7X9wZhGc+bo+TOPeODeUjV+wUvI0doHVaXsGOE0QLlBOIgKDWdm7v/B7Zs
 fVLJq7q+mB8mHOgSbIINSZqsGPEeAaHaNj40BC5RU+1dpk9zaUvyD69bcthRkfKIN+SV6VwZVQz
 8sjTK1PvH8bcZc4cgiCJvvzeRyqCtusg==
X-Received: by 2002:a05:6a00:1882:b0:81f:5198:ba2f with SMTP id
 d2e1a72fcca58-81fa17bb232mr7657440b3a.30.1768785654000; 
 Sun, 18 Jan 2026 17:20:54 -0800 (PST)
Received: from [192.168.10.140] ([180.233.125.201])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81fa1291135sm7418514b3a.47.2026.01.18.17.20.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jan 2026 17:20:53 -0800 (PST)
Message-ID: <3adf7c0b-bf58-4195-bda9-8aa67ba20a73@linaro.org>
Date: Mon, 19 Jan 2026 12:20:49 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH trivial 1/7] linux-user/syscall.c: assume splice is always
 present
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20260113130008.910240-1-mjt@tls.msk.ru>
 <20260113130008.910240-2-mjt@tls.msk.ru>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260113130008.910240-2-mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
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

On 1/13/26 23:59, Michael Tokarev wrote:
> splice() &Co are defined since linux 2.6.17.
> Assume it is always present.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   linux-user/syscall.c | 15 +++------------
>   1 file changed, 3 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Separately, I wonder if these require safe_* versions to properly handle restart from 
signal delivery during a blocking operation.


r~

> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 67ad681098..9cc9ed2fbc 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -13450,15 +13450,9 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>           return ret;
>   #endif
>   
> -#ifdef CONFIG_SPLICE
> -#ifdef TARGET_NR_tee
>       case TARGET_NR_tee:
> -        {
> -            ret = get_errno(tee(arg1,arg2,arg3,arg4));
> -        }
> +        ret = get_errno(tee(arg1, arg2, arg3, arg4));
>           return ret;
> -#endif
> -#ifdef TARGET_NR_splice
>       case TARGET_NR_splice:
>           {
>               loff_t loff_in, loff_out;
> @@ -13488,9 +13482,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>               }
>           }
>           return ret;
> -#endif
> -#ifdef TARGET_NR_vmsplice
> -	case TARGET_NR_vmsplice:
> +    case TARGET_NR_vmsplice:
>           {
>               struct iovec *vec = lock_iovec(VERIFY_READ, arg2, arg3, 1);
>               if (vec != NULL) {
> @@ -13501,8 +13493,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>               }
>           }
>           return ret;
> -#endif
> -#endif /* CONFIG_SPLICE */
> +
>   #ifdef CONFIG_EVENTFD
>   #if defined(TARGET_NR_eventfd)
>       case TARGET_NR_eventfd:


