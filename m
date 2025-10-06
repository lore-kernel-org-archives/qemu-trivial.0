Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A20DCCA470
	for <qemu-trivial@archiver.kernel.org>; Mon,  6 Oct 2025 04:12:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v5caT-0002lv-G9; Mon, 06 Oct 2025 00:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v5caR-0002lg-LP
 for qemu-trivial@nongnu.org; Mon, 06 Oct 2025 00:12:35 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v5caP-0004vx-AL
 for qemu-trivial@nongnu.org; Mon, 06 Oct 2025 00:12:35 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-46e37d10f3eso29075325e9.0
 for <qemu-trivial@nongnu.org>; Sun, 05 Oct 2025 21:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759723951; x=1760328751; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x5k2zVZPoomL5ClOhZsRuk1CRanvZLXRyOFE08DzG/8=;
 b=rBMLKYfABBJG0V4BA3OV3bJOE89iXdTF512T+J08PdFpBM6wjc/wUCxbqA61NioD3U
 hcEwBJ/FiIHa+LDdNqoL0xfg+o4WFlqA8W7H7fCn1HTPQDQO0oqzJ1HUefhuM2aSH05m
 2HhKC06rnxYGpb9GLXdXdNkfRQGl91w5Jy5ksG0uiBAiNJV+AitX0j85YCl49UUfYF4c
 z3RYeWrbf/wDUOSpXCqKeC9KKbudI404jasLliIpKan0uBtiFG5FSyFvbo1KiKRxjfEG
 OCJajWfqgWYzez/32E7eWdxPyFbvU7x0Zaxlv8QgU7j6mFcCSQBFr+jZ/J96KvISKDEY
 wnMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759723951; x=1760328751;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x5k2zVZPoomL5ClOhZsRuk1CRanvZLXRyOFE08DzG/8=;
 b=l/XcaPeJWZyqSSKLYeaQRut4In0nSUUbliS6mL2rRhCM2q/3jjgo409HsY4+08FABM
 kjp8QLfE5R4fN0ANBA9YMO94V29hIeQhmpVln6a4y4EgBjHWa9SyqL3ZGMh+7VHLxa0h
 bvGTRBZ81+KcHppAQ/AeJIhmif6wdAwwgNpZga4Puzk8oxAmW6d//Um/GX5joJ0XqNax
 BVFxtnFwaq0sCnZkb3n5E3pJOhwJl7K3iTVtL0DB9NM8/pzLCNcWsdKWS69zMd5s0nuy
 rcMLjFajpbmqDfkdmKiC6evp6UZTaJdeqPgRsyZE7nyadEXKuBYb8Kv9PVHnM0OH5I64
 +0wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeDVeqE3wuuAUEnCamD/Ege+SeBkbomVYKFqL/eJYzDWz3bbil1mVWhRZvOcXGRTljtkZUQJIjReS7hl0=@nongnu.org
X-Gm-Message-State: AOJu0YyP/UvX21EO6hk/VHA+ZMPuuL2043LRvrxaP0nop5vD2nLTxQtr
 aNEnoKRggJvrJru5rwSegV2pBmIAsYHCmXizP9/IASa5Ho+0VQxgJWj0Eg6bumUX180=
X-Gm-Gg: ASbGncvyaPqOT1gOThz+SouwVHWr1T+89V40/3nNHKITou17q59RAEG/XFisdk0pZwP
 PT7/GIenrvEHDqxXB2t6exDiPig5JU69ocESwGrDi22SHZzeDfb++Cct4msW4yvpR/OQjZP2xHZ
 FA0z80yl+fdhS0AJMH9SO1B1tvxzNeQR2Yu/J9ORThKzdTBuBEnxcKM7bfkSn+wJgqBSivVh6fZ
 J6A/ZvQqQWjfdvOctus3mK1hXryLuHFDoAcLJhOhYJHB68+SZ0twFqUfueDAJzZ2tIlIr9AJd2H
 g8HsGOfjf983eA0K+WkszvQBjOx37qN0f+kVtrcM+u/q3sTYQgjU0+nGvCtEA/tLhIo0JD03l09
 5arbNT2AegH+Of8zCY6kyT8olaBCMU3egwn7UZMdDh+dhOw1lxAcQ3o1M3MH3ckjWnWtOUWrVQX
 YuVlIi52e4E+7PpBVoHU4Rjp79e0+X
X-Google-Smtp-Source: AGHT+IEibd69y4sK8Msn6mxNka7aBjCe+u6ar0mcYImy/QOUSujjnfPkK878EX/jztgeWCMjthRgxw==
X-Received: by 2002:a05:600c:6818:b0:45f:2cd5:5086 with SMTP id
 5b1f17b1804b1-46e71103fd8mr72965665e9.3.1759723951241; 
 Sun, 05 Oct 2025 21:12:31 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e5b5e4922sm130891085e9.1.2025.10.05.21.12.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Oct 2025 21:12:30 -0700 (PDT)
Message-ID: <5ae373d6-c9f9-42cf-8a5b-df87c8ccf6e2@linaro.org>
Date: Mon, 6 Oct 2025 06:12:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/alpha: Replace VMSTATE_UINTTL() ->
 VMSTATE_UINT64()
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-trivial@nongnu.org
References: <20250925005137.59378-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250925005137.59378-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

ping

On 25/9/25 02:51, Philippe Mathieu-Daudé wrote:
> All these CPUAlphaState fields are of uint64_t type (except
> the @fir[] array which uses float64, expanded to the same
> type definition). Use the appropriate VMSTATE_UINT64() macro.
> 
> There is no functional change (the migration stream is not
> modified), because the Alpha targets are only built as 64-bit:
> 
>    $ git grep TARGET_LONG_BITS configs/targets/alpha*
>    configs/targets/alpha-linux-user.mak:4:TARGET_LONG_BITS=64
>    configs/targets/alpha-softmmu.mak:2:TARGET_LONG_BITS=64
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> v2: "target is" -> "targets are"
> ---
>   target/alpha/machine.c | 34 +++++++++++++++++-----------------
>   1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/target/alpha/machine.c b/target/alpha/machine.c
> index 5f302b166da..6828b123ca1 100644
> --- a/target/alpha/machine.c
> +++ b/target/alpha/machine.c
> @@ -25,8 +25,8 @@ static const VMStateInfo vmstate_fpcr = {
>   };
>   
>   static const VMStateField vmstate_env_fields[] = {
> -    VMSTATE_UINTTL_ARRAY(ir, CPUAlphaState, 31),
> -    VMSTATE_UINTTL_ARRAY(fir, CPUAlphaState, 31),
> +    VMSTATE_UINT64_ARRAY(ir, CPUAlphaState, 31),
> +    VMSTATE_UINT64_ARRAY(fir, CPUAlphaState, 31),
>       /* Save the architecture value of the fpcr, not the internally
>          expanded version.  Since this architecture value does not
>          exist in memory to be stored, this requires a but of hoop
> @@ -41,27 +41,27 @@ static const VMStateField vmstate_env_fields[] = {
>           .flags = VMS_SINGLE,
>           .offset = 0
>       },
> -    VMSTATE_UINTTL(pc, CPUAlphaState),
> -    VMSTATE_UINTTL(unique, CPUAlphaState),
> -    VMSTATE_UINTTL(lock_addr, CPUAlphaState),
> -    VMSTATE_UINTTL(lock_value, CPUAlphaState),
> +    VMSTATE_UINT64(pc, CPUAlphaState),
> +    VMSTATE_UINT64(unique, CPUAlphaState),
> +    VMSTATE_UINT64(lock_addr, CPUAlphaState),
> +    VMSTATE_UINT64(lock_value, CPUAlphaState),
>   
>       VMSTATE_UINT32(flags, CPUAlphaState),
>       VMSTATE_UINT32(pcc_ofs, CPUAlphaState),
>   
> -    VMSTATE_UINTTL(trap_arg0, CPUAlphaState),
> -    VMSTATE_UINTTL(trap_arg1, CPUAlphaState),
> -    VMSTATE_UINTTL(trap_arg2, CPUAlphaState),
> +    VMSTATE_UINT64(trap_arg0, CPUAlphaState),
> +    VMSTATE_UINT64(trap_arg1, CPUAlphaState),
> +    VMSTATE_UINT64(trap_arg2, CPUAlphaState),
>   
> -    VMSTATE_UINTTL(exc_addr, CPUAlphaState),
> -    VMSTATE_UINTTL(palbr, CPUAlphaState),
> -    VMSTATE_UINTTL(ptbr, CPUAlphaState),
> -    VMSTATE_UINTTL(vptptr, CPUAlphaState),
> -    VMSTATE_UINTTL(sysval, CPUAlphaState),
> -    VMSTATE_UINTTL(usp, CPUAlphaState),
> +    VMSTATE_UINT64(exc_addr, CPUAlphaState),
> +    VMSTATE_UINT64(palbr, CPUAlphaState),
> +    VMSTATE_UINT64(ptbr, CPUAlphaState),
> +    VMSTATE_UINT64(vptptr, CPUAlphaState),
> +    VMSTATE_UINT64(sysval, CPUAlphaState),
> +    VMSTATE_UINT64(usp, CPUAlphaState),
>   
> -    VMSTATE_UINTTL_ARRAY(shadow, CPUAlphaState, 8),
> -    VMSTATE_UINTTL_ARRAY(scratch, CPUAlphaState, 24),
> +    VMSTATE_UINT64_ARRAY(shadow, CPUAlphaState, 8),
> +    VMSTATE_UINT64_ARRAY(scratch, CPUAlphaState, 24),
>   
>       VMSTATE_END_OF_LIST()
>   };


