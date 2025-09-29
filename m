Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C31CAC5B0
	for <qemu-trivial@archiver.kernel.org>; Mon, 29 Sep 2025 14:13:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v3Ect-0001lo-Np; Mon, 29 Sep 2025 10:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1v3Ecq-0001la-0x
 for qemu-trivial@nongnu.org; Mon, 29 Sep 2025 10:13:12 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1v3Ecg-0001pD-6v
 for qemu-trivial@nongnu.org; Mon, 29 Sep 2025 10:13:10 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-71d6051aeafso48726307b3.2
 for <qemu-trivial@nongnu.org>; Mon, 29 Sep 2025 07:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1759155172; x=1759759972; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zsWI9+DScXGvZxdizSkdGVr0zurWhmz0t30Av3fwv00=;
 b=gUFhqMg1RKw0mTAil9Hr+T9oszg4ZeVrsnyMPpkYqX9zylutnmuOA31UmWm8J1K1Eb
 r1NLAUhCVoUghjfvzRIiRgUSaY/QOEQqs2ZWvG0pyl2Rq2HL/I6O/ai80zA2dpa9BQBy
 SPvWboX64/b+4Orc7LqXF3yQCuQB/WbRaS0g/lHSjEobTXngyDu4AFIDhh/jm8qGCtdO
 WAYg7v8OzDQZqUcWyV+Du4A2b563dnDJw5GLx2ry8wD7YtwUCTUJL91TJkbiMFOC0UXP
 wy2jXWoU6c1kBzHHg0RDgNGkPTF+VSJcdcZxZ8b5lMv8DM73Kaya7eMCdwKRUTq8JW56
 mJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759155172; x=1759759972;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zsWI9+DScXGvZxdizSkdGVr0zurWhmz0t30Av3fwv00=;
 b=n3TmtZhqL5dwQqj7T8TYfGT7fqPdpww3P2BuBlT06K+D6m3+XukcDvgvcNPaGvYL17
 ej6XI05TdzTcJJyDzErnXZACp1QOHeMyxzzyGWgP1WYt3X/GEggN7SWigKq4jWGiz8I1
 mznb332zTW1LCQhoaVum3jHnpegjDvBPYrnsuw8ydUL8nqzOvFVihR4mod2YEih9V2dz
 E8/z4wrT0gAd5jERCWHqnu5HqNm1rVdc5Fvn5TNK3s4sU+gjhr6of94N1+YiP/LvLgSW
 KQmtxkFWqyVlj/Rc3GcAhv2ZT/khRvc4tNhho+xwpmdAL3/SG9uiZv+w+lTUvz5T7DZu
 wQhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvw8aneqmBDXRKv6Iqaw1a4+ryTAU4TryxyWH0g/2AcuO/XOB1e7CcaqnpnbHZUm/E5uoxhVCud3GhPcY=@nongnu.org
X-Gm-Message-State: AOJu0YyW6ltTQxfkg91d373JCPYwkKssx8FWX+D5Ii3IgUcHXGe8Gh4n
 J7osuqBkrVlPXPLrqToOD1eyiTHSrFEeAo5AHHqcctIJFD/4UVSK94HdRI03Lg9IbjA=
X-Gm-Gg: ASbGncvXMAFuKvXl1ulJPGN8ym/Js7FVyrtqFtd0yoWJIKfKTrhLPjEsyjV+39TSolv
 M9d8DRVpCLhtOHEaleJfzSu4IkYJAc7SQVsTybqNXLewhGeLTAqo6vIFTB1pVnVNV7GTuYTWVe2
 hsMzG40n+oegRYrUkCNGijElS2nf9HCzUDDGWJetF9BzqzzltWG/cXMPVpdYPPN8w3UqPlNdwwt
 Zbjnu7aPXm/ONpCMMl9tiA9RAlbI3TQnZLJ5iUtMYkPjuslcAsO6enh/dBMmMxmXsWBBAcLNLFQ
 aRrXMLL81yNNwRAGEbt+B/KQ/nJaBwuYq1aI7Lu5p8uovJkWd78TV5DgWsNgb19kG0NVszpX1cd
 3S22UbbnV0gggYS5SwNDjrF5IsqrhdICxi0A89R23txsVJl0l
X-Google-Smtp-Source: AGHT+IHmqfoOVU/XwOqOa7Wpxr1CaT4wN1RLV97KFKLPrXbXDdXF7WJvb0o+xAHi20DAqL/vMstZxg==
X-Received: by 2002:a05:690c:9c0d:b0:734:81fb:8ba0 with SMTP id
 00721157ae682-763fb38cd62mr204764887b3.19.1759155172243; 
 Mon, 29 Sep 2025 07:12:52 -0700 (PDT)
Received: from [192.168.68.110] ([152.234.123.171])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-77e5cccdb8fsm1727597b3.29.2025.09.29.07.12.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 07:12:51 -0700 (PDT)
Message-ID: <7df234bd-9443-4b90-8376-365f1967981f@ventanamicro.com>
Date: Mon, 29 Sep 2025 11:12:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Fix endianness swap on compressed
 instructions
To: Valentin Haudiquet <valentin.haudiquet@canonical.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-trivial@nongnu.org,
 zhiwei_liu@linux.alibaba.com, liwei1518@gmail.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, vhaudiquet <vhaudiquet343@hotmail.fr>
References: <20250929115543.1648157-1-valentin.haudiquet@canonical.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250929115543.1648157-1-valentin.haudiquet@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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



On 9/29/25 8:55 AM, Valentin Haudiquet wrote:
> From: vhaudiquet <vhaudiquet343@hotmail.fr>
> 
> Three instructions were not using the endianness swap flag, which resulted in a bug on big-endian architectures.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3131
> Buglink: https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/2123828
> 
> Signed-off-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/insn_trans/trans_rvzce.c.inc | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
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


