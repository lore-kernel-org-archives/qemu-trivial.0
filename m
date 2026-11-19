Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F321606A32C
	for <qemu-trivial@archiver.kernel.org>; Thu, 19 Nov 2026 19:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jjP9EckQ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1xU8GF-0008JS-UX; Thu, 19 Nov 2026 14:57:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xU8GE-0008Ia-H9
 for qemu-trivial@nongnu.org; Thu, 19 Nov 2026 14:57:34 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xU8GC-0001qL-WB
 for qemu-trivial@nongnu.org; Thu, 19 Nov 2026 14:57:34 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-3b40470fdd8so82250a91.1
 for <qemu-trivial@nongnu.org>; Thu, 19 Nov 2026 11:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795118251; x=1795723051; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=CqK6/5UtrHn2Jd5D38VgHA5J3v46X+Rgo/j00yFhdgg=;
 b=jjP9EckQzh2Tn7c3E1uoXjR8coxocznBDxxGT52QUz/WmcxDdy3EHEyDFR4N45y2E9
 FjMkt0pLsCx/C59LyIi7xd9tl9uyb2PFuSph149AVA0amlnAPKg/yHxJbtBmNwGG/Uwq
 L3LOHAolIgw8wNjkQ+fHBwcE9HYewyumLIr/eSIcEITB8yDKhBSZeK6aJjPvq5UH7sFR
 PZCN83Gsoet17Lg7XfimxQHUDVHRg80VTp/67HFq4hMzdq/If14EECt9rpfzeR4wfofi
 JCzAH34xp1oqt11cXfnqQEJc+qLKdVflA34BnuM/eGhikqXDmwF/bFO/MtBbMymTpNJj
 5v3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795118251; x=1795723051;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CqK6/5UtrHn2Jd5D38VgHA5J3v46X+Rgo/j00yFhdgg=;
 b=HLthkBnQsI/LE99XWM2VErGclforHxBKhy4mdNrWOgvnsktvuhBtGD91Tj61X1/oro
 zZvz0NSTgsC2IlmviiRtqcEiTuQ0JIl2UBUMqE4zff1ABL67pBMF8EZO4846hZnalML+
 2Q1qebtPaUlgG9nJb5rP6J/VWP8JaZjr7V0H0mEDndCvfq+c+tOfFWYeqoVlW1yjV4U8
 gtq3nq/OSzBo/Wot2hipJ0o25OQ8NyjibaONJ30a3R1FPM2zSqKT3UNl7sRXHQKPpxs1
 +KiJiFwS3o3VGQSctGtGtuhbBX5oxwx+LWGdmrOZscXfKW8d8c4tdLhSa+KF4wyE90Y3
 O3eQ==
X-Forwarded-Encrypted: i=1;
 AL+hErEFBtAKgQkVY70Huzqj494JfzBYbEv+5pOtJCq9+D83sIp9ReW3cqSaQXM4tGM2hiTpi+oWbqRikjlqOXE=@nongnu.org
X-Gm-Message-State: APuU4Z987WB5AX4ULq4eZpKBVcon4XXalEoUWRU1uxtnmW9d9m1T7YPr
 xKKhqodgFW7O/FS1jWW1UgpbHIQsBNmcrrqjHmnwEZwrzkGmwNax+rOzbRxPaFMk3iI=
X-Gm-Gg: AZFdTZcZ7E2IxxvhjiQuUH0m714SWRpFthT7jNHhhmPBboUITslnpwbzc/TYVswMkow
 dXT/WMVPh75KFx1cKJ2AzIWHfzfR/zgCVAwDizRS9e+RbK+JHvjeQ/09WTB+EeYFXINtExIgBP1
 1zF0maNjz0hLVECAkOhdUQfWft05vHSve1QcFGktXppVye6+vKkFkfBrRwKMdcKN4OnowtfR8DO
 zzJASKLXkNd/T4fTdH5eulhSIS6CzzIUNvPV2T1CcIMzu+iDUVFPSBwF0FrazLCN5y60J26wFpf
 lZOVhaMGUg1XAcCkFb1tzpkhtFVwYTyVraUd1UTssDqQpShxHiRrzu/0mD2KWpuGywQN58jUiIl
 xPfFScZlc7QQ0sBi0Ins8qK8/gxfgSGTu1J9aZqAk/RF7JlbW2aGi3PKCPNagE1UycVVlEuOpGD
 1Shj+jlE1TCIPqsDb4aOK/0+i/Ie0wmJpPszHI5CMUL35erJ3IK25h6PhpjdGQRiP7e+lW7Yl4t
 MNgqEQJI5cTy+rxwuskppyqWOARaLBtaWBSZmrmK6BX4ksRYf01oIV02JBoVzcF4XZcYT8INDN0
 sEaa3VlPK/EYhEy7fqpfMY9kVJKU74jMeGK2mREyz5SYIrT/r8kbz58L5IjXt/MOEg8tJPM=
X-Received: by 2002:a17:90b:442d:b0:3b4:eb3:a363 with SMTP id
 98e67ed59e1d1-3b41c98a32cmr396266a91.17.1795118251289; 
 Thu, 19 Nov 2026 11:57:31 -0800 (PST)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b41cfbaf2bsm182107a91.2.2026.11.19.11.57.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2026 11:57:30 -0800 (PST)
Message-ID: <5288ce59-a250-40a2-8f87-7a35d130b60d@linaro.org>
Date: Thu, 19 Nov 2026 11:57:29 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/tcg-ops: Rename cpu_env to tcg_env
To: Chinmay Rath <rathc@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: pbonzini@redhat.com, pierrick.bouvier@oss.qualcomm.com,
 harshpb@linux.ibm.com, philmd@oss.qualcomm.com
References: <20261119102319.2618086-1-rathc@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261119102319.2618086-1-rathc@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/19/26 02:23, Chinmay Rath wrote:
> Commit ad75a51e (tcg: Rename cpu_env to tcg_env) from 2023, renamed
> cpu_env to tcg_env. However the same was never done in the docs.
> Updating docs with the necessary renaming.
> 
> Signed-off-by: Chinmay Rath <rathc@linux.ibm.com>
> ---
>   docs/devel/tcg-ops.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/devel/tcg-ops.rst b/docs/devel/tcg-ops.rst
> index 51fa183e91..7ee419f959 100644
> --- a/docs/devel/tcg-ops.rst
> +++ b/docs/devel/tcg-ops.rst
> @@ -66,7 +66,7 @@ Variables
>   
>   * ``TEMP_FIXED``
>   
> -  There is one TCG *fixed global* variable, ``cpu_env``, which is
> +  There is one TCG *fixed global* variable, ``tcg_env``, which is
>     live in all translation blocks, and holds a pointer to ``CPUArchState``.
>     This variable is held in a host cpu register at all times in all
>     translation blocks.
> @@ -75,7 +75,7 @@ Variables
>   
>     A TCG *global* is a variable which is live in all translation blocks,
>     and corresponds to memory location that is within ``CPUArchState``.
> -  These may be specified as an offset from ``cpu_env``, in which case
> +  These may be specified as an offset from ``tcg_env``, in which case
>     they are called *direct globals*, or may be specified as an offset
>     from a direct global, in which case they are called *indirect globals*.
>     Even indirect globals should still reference memory within

Oops.  Queued.

r~

