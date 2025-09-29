Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC18CAC5B9
	for <qemu-trivial@archiver.kernel.org>; Mon, 29 Sep 2025 16:14:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v3GWD-0004RH-Gd; Mon, 29 Sep 2025 12:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3GWC-0004Qo-7Z
 for qemu-trivial@nongnu.org; Mon, 29 Sep 2025 12:14:28 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3GW2-0005Tg-AL
 for qemu-trivial@nongnu.org; Mon, 29 Sep 2025 12:14:28 -0400
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-3f42b54d1b9so121414f8f.0
 for <qemu-trivial@nongnu.org>; Mon, 29 Sep 2025 09:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759162454; x=1759767254; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eB0TqlOiRyh4ouPHbbFWI/SaOjYQkdpCZinAEAFvvBA=;
 b=z1BzkreKFea0l5/gf6oFloexjeZxf7I8qQ+HnZwPoDev+kipeVr+QKLHExM3n0QjJw
 0VpoVQlj8jlQ4fzstN6ghd+O5jA5ufXh9JIgF/90HGnbR/9qVw7WxuNpbMFCYLQzDwU4
 NX7YKoNWlvEDi/1p4Jf/JjH1Y56cEnc5doHwdkHGSNAn3YMMbDDp30EbHPkcwLDgtGd7
 nAczn8tEQRsfV/reHx7lkJ7oTlO/wjNAtEEIlC0etEl1R7mNi41CgLJPXYHUWZiXTMb0
 thn3y1NRbm/5ATTLZlqm8gnXy5mGA2eonnMRd3gZmqf9f9u+P9kyaRyYlBG7LpxY69iP
 128w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759162454; x=1759767254;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eB0TqlOiRyh4ouPHbbFWI/SaOjYQkdpCZinAEAFvvBA=;
 b=TFe5+dOgEkzJcvQE2BvbU5Rw3IP2XmwLcb/bw8uqmrNwEawnJ1CLWcusENrNhWgLpV
 OCIyca3aLlHrs0o+/ZuLLrfne+yEUnwKtj5Aw/glNkh1OEZSHado/UCBnZ337dxTaUuD
 JW1hDhhW7l89sA4ASnLDX6uAHDkSQc3KVxiDEpZdsu1kWuKC/JurcXwH6/BTs3GmdifW
 0IclZfxDVZVtvVlcHphuPZu9U2bshUX6hUgUqdvZbuMyLMDP0KWnHs/Vr6VbcTcxhb4L
 ZRS/Gzya+NttQJeo4ujiltIuPcq12x8Xk0EGnjg4UPYtgAT85XEn1K4VCakuWXK/x65/
 B5PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3O5yjTDwXr44X2mNFFbAj2iHnEyCoUbfnxpAWjCHPq5EUW5ol8DHe5H8ym9CZgg0NJEP9kvzEBEvK9Ik=@nongnu.org
X-Gm-Message-State: AOJu0YxrPFNhUYrwfrP5cUfiuYIBdRI2fOYQ+gosxuYQ9H2KmQdl5mYZ
 tbgf+kbLGFTx1H/lpOBjkixTZyXyyqOyDMtS5ga3z4wYgWnMKB4A+8a337A0MlAq/mU=
X-Gm-Gg: ASbGncu4qQKxAjcknkmugTWk2d5u5NQpeMThrkxU7+2AMbhlbUW1yF0om8tHnVQHd5w
 Jq+fV2l3h8n+yljQX8l0S1jqSRKZrjwy1czB06seoyR8tXFC8LWey8/9bBvXqvF6EqdeWKA+YpJ
 9ZrZnqyGBVcdvLGOifGDW6IoGNdHECrGyLm6rLs0jvhoUasPkCcPaJSdOBcRa/QYXYpW+nwj2HL
 0iPHSM9zqsC7rYUOSGBwhDV/tzPMuAvdK6296ph1HCWfeSPLhAhDVOQRZfmIaHarO15D8pvQ4wg
 eM4tvp2Qe263R8LRQV3XN0e6L9eJDraaBKIBzKba+1KS57tRmmEIZqF+EBK59f6sHD8pxludiQ7
 2nDqbd9Q77QrEKx/A+VLfmEU6X/cSxn3a3ftINPvzQcMQFCCr5pTJroKaq/DnLDtAsw==
X-Google-Smtp-Source: AGHT+IHrBuNNWUZ08axdxtdPe6n5HHZZB6u2gnaAAl7flBW8M6Q8TrdBL0nO357Z4eh8VSNL6dy+Vg==
X-Received: by 2002:a05:6000:400b:b0:3e8:9e32:38f8 with SMTP id
 ffacd0b85a97d-40e44498167mr17518625f8f.14.1759162453792; 
 Mon, 29 Sep 2025 09:14:13 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb89fb19fsm19177716f8f.21.2025.09.29.09.14.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 09:14:13 -0700 (PDT)
Message-ID: <400d772d-8231-449f-90c6-50b441c2d837@linaro.org>
Date: Mon, 29 Sep 2025 18:14:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Fix endianness swap on compressed
 instructions
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Anton Johansson <anjo@rev.ng>
Cc: Valentin Haudiquet <valentin.haudiquet@canonical.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-trivial@nongnu.org,
 zhiwei_liu@linux.alibaba.com, dbarboza@ventanamicro.com,
 liwei1518@gmail.com, alistair.francis@wdc.com, palmer@dabbelt.com,
 vhaudiquet <vhaudiquet343@hotmail.fr>
References: <20250929115543.1648157-1-valentin.haudiquet@canonical.com>
 <cc5b1d2c-90cb-4276-a192-fd0ce9e926e8@linaro.org>
 <x6aqkgtvpzki7sgy7vkwqky76sfuvgs4qgf6g7jm2exks4j7tr@m76wj23zdejf>
 <726f2410-a977-4142-9f17-82b0487d5be8@linaro.org>
In-Reply-To: <726f2410-a977-4142-9f17-82b0487d5be8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x443.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 29/9/25 17:19, Philippe Mathieu-Daudé wrote:
> On 29/9/25 17:12, Anton Johansson wrote:
>> On 29/09/25, Philippe Mathieu-Daudé wrote:
>>> Hi,
>>>
>>>
>>> On 29/9/25 13:55, Valentin Haudiquet wrote:
>>>> From: vhaudiquet <vhaudiquet343@hotmail.fr>
>>>>
>>>> Three instructions were not using the endianness swap flag, which 
>>>> resulted in a bug on big-endian architectures.
>>>
>>> I suppose you mean "big-endian host architectures".
>>> If so, please clarify.
>>>
>>>>
>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3131
>>>> Buglink: https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/2123828
>>>>
>>>> Signed-off-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
>>>> ---
>>>>    target/riscv/insn_trans/trans_rvzce.c.inc | 6 +++---
>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/ 
>>>> riscv/insn_trans/trans_rvzce.c.inc
>>>> index c77c2b927b..dd15af0f54 100644
>>>> --- a/target/riscv/insn_trans/trans_rvzce.c.inc
>>>> +++ b/target/riscv/insn_trans/trans_rvzce.c.inc
>>>> @@ -88,13 +88,13 @@ static bool trans_c_lbu(DisasContext *ctx, 
>>>> arg_c_lbu *a)
>>>>    static bool trans_c_lhu(DisasContext *ctx, arg_c_lhu *a)
>>>>    {
>>>>        REQUIRE_ZCB(ctx);
>>>> -    return gen_load(ctx, a, MO_UW);
>>>> +    return gen_load(ctx, a, MO_TEUW);
>>> NAck.
>>> Please do not use MO_TE* anymore. Use explicit endianness.
>>>
>>> So far all our RISC-V targets are little-endian:
>>>
>>>    $ git grep TARGET_BIG_ENDIAN configs/targets/riscv*
>>>    $
>>>
>>> If you are not worried about RISCV core running in BE mode
>>> (as we currently don't check MSTATUS_[USM]BE bits), your change
>>> should be:
>>>
>>>   -    return gen_load(ctx, a, MO_UW);
>>>   +    return gen_load(ctx, a, MO_UW | MO_LE);
>>>
>>>>    }
>>>
>>> Regards,
>>>
>>> Phil.
>>
>> Right, I forgot about the MO_TE changes when reviewing. My bad.
> 
> Well, since this is a bugfix for current tree, maybe let's go with
> this patch and remove MO_TE on top...

Also, as Valentin noted, there is no "official MO_TE" deprecation,
so my Nack is really aggressive here, and I apologize for it.

Regards,

Phil.

