Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE8ECAC5B5
	for <qemu-trivial@archiver.kernel.org>; Mon, 29 Sep 2025 14:42:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v3F4S-0003uu-LJ; Mon, 29 Sep 2025 10:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v3F4J-0003fB-7w
 for qemu-trivial@nongnu.org; Mon, 29 Sep 2025 10:41:39 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v3F49-0001OS-Kg
 for qemu-trivial@nongnu.org; Mon, 29 Sep 2025 10:41:34 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-3369dcfef12so2830192a91.2
 for <qemu-trivial@nongnu.org>; Mon, 29 Sep 2025 07:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759156872; x=1759761672; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MkzCGJhxmBl7pB+ADBh0H9ogb846oJxdcaEE8Qh58OA=;
 b=W2w7tfWXMHuF3azQwR0H8tP4awGwW5xh5AkikSG4A0HnL4bTC3J0c9ekWrSAB/Ruwl
 gvG572N6KlNnz6uODbIqc2BRD3sgqKeM8UShzKdKp4Vwr6Y++GqnLZ+YmNyf8cpn2tqZ
 OLj3RfkzVMqMBIzFRbnuI4dvXRWu0u5ufptUWfhOLHoveMOJ+TNYhmzyJBxpRKY34hEF
 4deTgkQvYgjOa97/Z0OXYWRW5KcQBsfthJBgJpzaII0SmtoFyFuwyHrllDgZ4Y8nWWYu
 Xvxdp/SHxz/cTmNoKvVYs6bmTsS137g1ctQkK/QWUorG6cbEHt2e87HMliMhVNSMjxX6
 Ak2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759156872; x=1759761672;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MkzCGJhxmBl7pB+ADBh0H9ogb846oJxdcaEE8Qh58OA=;
 b=VlZj2yAZzm4MZd9gYOukdC683Y6HM50YEf99Dflm9C+s+G5IvO8VVP3ryfYPnKi5Kk
 1A3BDWjQTUzv4o3W+kA1lANpF3jnhewAkUvV8JsH+7d9cWJMic+k5PAVMmKKkS8S+THz
 IKv4tEL49T9j5MBRahkk0kQrrQnYZ8H4/FQ79stwFOeJvVaCxBbXjljX1sI6jVEDi9Qh
 tPO6chkldeX89ZEC5vTrUlNgIA87vENJPwL8xaSggns03TdU8J0t/LFuALHqpxSoKowx
 5J/BnfzIMtYV0hRKejeDbUPvtc6vRO5OtpEHIbUFIZ6oE5UBKDfcsRoCEeW0IgEaB5gM
 P4GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9cJZHhta5ime6Y+JgOdfFMrTKooPlsHh/xjn10vI4tuJS5QQm38+bBhFpByWoZ8cCn2YK1o6JBemNhRg=@nongnu.org
X-Gm-Message-State: AOJu0YwyjztGnU+DsLO5q28px2DpluAUybuofx+zrC6vXHNYjn1rpZmK
 db4Qw1/K520O1ksVLXI/GS/t06ZauTWTB7WvdOc7orfWQJenu3Yop/vMB9lIH61dH1k=
X-Gm-Gg: ASbGncvbk/kIgJjulWRLmDUW+YL1VvnF9FQuvo+s8UbtmEGGJkVveUtdFEN+GwATCWG
 /NimXDWsSJKfLeQ+ks+xgrHndRMDmCwr6RPV/fnQy+P7/mCe0jVXqj2g4NG0c07wnFQqIMr1Ro/
 zOCCQlJWleFHEaMq8Y78u0XgBTudi3p4xeRKUGxyUGWxJYskR2rIXHhQHEe4IRa9AKXk7fbBGNH
 uSvpZtJWxrClh0q30s6U3D+qrHq6unsxD1av32KyGdEvYOeVUCJG0qBPGRSfh7cZYYchvNNufH6
 iZ5ZXplwvbcamDKPTThRp++H2V+U4BuqqSXxZnt5VjyRe6Z9XHpsVdfa5f7yQSwTXXFq0oMuQ0q
 HsikLgco2TzrKAac32gFFZtAjSHhYp5P1JU2EAqpCdWPIOCxozBQRkxmsNQ==
X-Google-Smtp-Source: AGHT+IHPy3QvNuZjOj6YBc+0r5YGXTW69E4S91z1ivN0tb6fevgW3Q5wqiYPN2nAFuNMgcVURiqjBA==
X-Received: by 2002:a17:90b:5627:b0:330:793a:4240 with SMTP id
 98e67ed59e1d1-3342a2c5d9cmr15797380a91.31.1759156872409; 
 Mon, 29 Sep 2025 07:41:12 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3341bd90332sm17219996a91.1.2025.09.29.07.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 07:41:12 -0700 (PDT)
Message-ID: <3fb026bf-3b33-4cfa-a20f-8e1d442e7902@linaro.org>
Date: Mon, 29 Sep 2025 07:41:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Fix endianness swap on compressed
 instructions
To: Valentin Haudiquet <valentin.haudiquet@canonical.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-trivial@nongnu.org,
 zhiwei_liu@linux.alibaba.com, dbarboza@ventanamicro.com,
 liwei1518@gmail.com, alistair.francis@wdc.com, palmer@dabbelt.com,
 vhaudiquet <vhaudiquet343@hotmail.fr>
References: <20250929115543.1648157-1-valentin.haudiquet@canonical.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250929115543.1648157-1-valentin.haudiquet@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

On 9/29/25 04:55, Valentin Haudiquet wrote:
> From: vhaudiquet <vhaudiquet343@hotmail.fr>
> 
> Three instructions were not using the endianness swap flag, which resulted in a bug on big-endian architectures.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3131
> Buglink: https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/2123828
> 
> Signed-off-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
> ---
>   target/riscv/insn_trans/trans_rvzce.c.inc | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Cc: qemu-stable@nongnu.org
Fixes: e0a3054f18e ("target/riscv: add support for Zcb extension")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/insn_trans/trans_rvzce.c.inc
> index c77c2b927b..dd15af0f54 100644
> --- a/target/riscv/insn_trans/trans_rvzce.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzce.c.inc
> @@ -88,13 +88,13 @@ static bool trans_c_lbu(DisasContext *ctx, arg_c_lbu *a)
>   static bool trans_c_lhu(DisasContext *ctx, arg_c_lhu *a)
>   {
>       REQUIRE_ZCB(ctx);
> -    return gen_load(ctx, a, MO_UW);
> +    return gen_load(ctx, a, MO_TEUW);
>   }
>   
>   static bool trans_c_lh(DisasContext *ctx, arg_c_lh *a)
>   {
>       REQUIRE_ZCB(ctx);
> -    return gen_load(ctx, a, MO_SW);
> +    return gen_load(ctx, a, MO_TESW);
>   }
>   
>   static bool trans_c_sb(DisasContext *ctx, arg_c_sb *a)
> @@ -106,7 +106,7 @@ static bool trans_c_sb(DisasContext *ctx, arg_c_sb *a)
>   static bool trans_c_sh(DisasContext *ctx, arg_c_sh *a)
>   {
>       REQUIRE_ZCB(ctx);
> -    return gen_store(ctx, a, MO_UW);
> +    return gen_store(ctx, a, MO_TEUW);
>   }
>   
>   #define X_S0    8


