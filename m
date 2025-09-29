Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293C4CAC5B5
	for <qemu-trivial@archiver.kernel.org>; Mon, 29 Sep 2025 14:39:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v3F0r-00027X-0G; Mon, 29 Sep 2025 10:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3F0n-00026e-F7
 for qemu-trivial@nongnu.org; Mon, 29 Sep 2025 10:37:57 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3F0U-0008O1-6B
 for qemu-trivial@nongnu.org; Mon, 29 Sep 2025 10:37:56 -0400
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-46e42deffa8so37254695e9.0
 for <qemu-trivial@nongnu.org>; Mon, 29 Sep 2025 07:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759156650; x=1759761450; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d/HmMjHkD+czR7AnyI7DSFTbzNnjnunb8/9I/10vC4M=;
 b=vR39S4jDC9+1e8k+QJNvXbloiOnwLDFrZtwR8VqCctblfutYk775PWfqkc20HlxzSG
 hAfPCeB6lr/9nZCtgA/KjsoAdmwt5eYq7Ab+slwblkDjviCgLDOuxArrxqVR+uz5rYl9
 IrbDGeRx8HG/dmjkgpGLmhwFgmZmGYMYvy8XVinPvCYE52Yy1WECApXJt5lKqiP7GyUt
 wTr3hMWF5giXDH6E0guxxNCxn0FVtAR5TNct2ZQUTc62bKLiznq6ZQr6P5XPuk1Z5Ae3
 87GdXVSI26IKjNg/V1EidCIq83yeiJ2mbHlB8yJ0+WO2iPNe4PHisZIOEjsJd+tks6OE
 Vtnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759156650; x=1759761450;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d/HmMjHkD+czR7AnyI7DSFTbzNnjnunb8/9I/10vC4M=;
 b=B5F1VFgZz2Abyi+pmUgh5kE1RCH2Dr1nfD6XEfPBa9mjktFsEEMUsfkY3SxbJ3/TXt
 R4qJ0kirsiAmny87GSASCYyVKMEe2ZC1E3z41bhdzEBXZ3IN2aZ5pAHvMNcOESdFA60X
 iTmPmtiocHR6e/hrjHnpiwmPQ3hQ/Fh4tjJbwxws4OumS8pP8eQJiwdGgF539UKi0UFr
 H0iugSLzZEbJRm+KVWnur7uDx/FdmhMnr9/f7v4Wk6rhwsW+9uWeUIFfyOPOjIi3y4xA
 46MpKHjiGBxutz3nwQ31vwCeI/SAhaiuTPFUD8g1yosZuKnn/R9aggVsZ/PP3uAk2TB2
 yYYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0hOmNEpNhcDfo6okYz1q+dX9TGvtB5hoWoIjtVI523+Gyv2IMEiM8Cc+hUWKCl9wz5onSih1gtC8Hr38=@nongnu.org
X-Gm-Message-State: AOJu0YwzGrqwJ8NL7BISuu46U9+r+caSKa8S+VqSNukcTsbTIkBU+DOI
 1DPg5hgDTuNOFiXYEi7n0StUDgL+SlDfaiM3fRkMbYOK2XfHY9EQHcH/qMSC5bpq+ZE=
X-Gm-Gg: ASbGncvxeyMYnIM8Y0jNeelTbK4TFC+COm0yqQX1DsGLZkAyGXIqhfgt/6Fe7R/t28U
 YcRcRjaz0lRf1nfTwkhBTtOtOb3/JmFB89yuo6rKqi9qPmBIwaMYTWT9ONttJADLIuC796/fgKt
 pn9mplivMOUp1++iIk2DoVWydm4jzjcwMzbCWMVH8OzKMTlWI83vvFxG66RPK0Fb4hYNzUzSG29
 r4ZKiRlQQC5LNKL/JdvKPyJv/UYT3WYzEBx2udNLvXEAismxb5zpzesVE/1eeuWpdookDqu4ljF
 aYu++DjtDxqklsBkcZR1rCrIQPh7nYbv1EaRJHluuAppf5uyDWRYZ5hWKZQeFf3WbltVyFZxEYj
 UwmQHmkiPZ8nkoKlogE33qGpYKQwnCkIbRY5lHlBsXjbUyPL0xSSuHyvtWTPTFpKzNNuuCi04YW
 nA
X-Google-Smtp-Source: AGHT+IH1WyTVJ70JCxrZYGq7SWsflLy3XVHF5cVn8WqnoaK5vdIRAHqjfOVZRzs9z/PamOW8MyR5TQ==
X-Received: by 2002:a05:600c:5251:b0:46e:3802:741a with SMTP id
 5b1f17b1804b1-46e38027650mr117261295e9.22.1759156650119; 
 Mon, 29 Sep 2025 07:37:30 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab48c28sm227425395e9.18.2025.09.29.07.37.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 07:37:29 -0700 (PDT)
Message-ID: <cc5b1d2c-90cb-4276-a192-fd0ce9e926e8@linaro.org>
Date: Mon, 29 Sep 2025 16:37:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Fix endianness swap on compressed
 instructions
Content-Language: en-US
To: Valentin Haudiquet <valentin.haudiquet@canonical.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-trivial@nongnu.org,
 zhiwei_liu@linux.alibaba.com, dbarboza@ventanamicro.com,
 liwei1518@gmail.com, alistair.francis@wdc.com, palmer@dabbelt.com,
 vhaudiquet <vhaudiquet343@hotmail.fr>, anjo@rev.ng
References: <20250929115543.1648157-1-valentin.haudiquet@canonical.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250929115543.1648157-1-valentin.haudiquet@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x341.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
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

Hi,


On 29/9/25 13:55, Valentin Haudiquet wrote:
> From: vhaudiquet <vhaudiquet343@hotmail.fr>
> 
> Three instructions were not using the endianness swap flag, which resulted in a bug on big-endian architectures.

I suppose you mean "big-endian host architectures".
If so, please clarify.

> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3131
> Buglink: https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/2123828
> 
> Signed-off-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
> ---
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
NAck.
Please do not use MO_TE* anymore. Use explicit endianness.

So far all our RISC-V targets are little-endian:

   $ git grep TARGET_BIG_ENDIAN configs/targets/riscv*
   $

If you are not worried about RISCV core running in BE mode
(as we currently don't check MSTATUS_[USM]BE bits), your change
should be:

  -    return gen_load(ctx, a, MO_UW);
  +    return gen_load(ctx, a, MO_UW | MO_LE);

>   }

Regards,

Phil.

