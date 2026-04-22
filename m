Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F02EF94CDF
	for <qemu-trivial@archiver.kernel.org>; Wed, 22 Apr 2026 08:07:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wFScX-0001aR-Sj; Wed, 22 Apr 2026 04:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFScV-0001Zr-UA
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2026 04:07:40 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFScU-0002Ln-DQ
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2026 04:07:39 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-488e1a8ac40so64434785e9.2
 for <qemu-trivial@nongnu.org>; Wed, 22 Apr 2026 01:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776845257; x=1777450057; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zSbmgQ4mUKO3noT9uImqlbfaB1HH+PFpn68SkuRwax0=;
 b=hA+lkWMN6d8SmiUbYSX5AluH0DIIeJPWmwckbrnhyqJqcTYXo029/mmH7Cqahj5DlJ
 RIqZJ1akdp1X3/DSBS3WN70UI4A5gLkTa0BiXIjdGuyyVrkpvDF4PS5ndY2e+ccyIUIK
 lEWXMZQ0gilmYXEc7yJKFcmuz7Tgt4pTbpXKbh9S2pFiKB050q9gBQIOmUv5hOscIi8j
 Nc6XrUE3zkZ0J4/7ChQGdUqdsWQuyxE6pXLKgE0/3spls26/OwaYZkIzZkXQKQWZ5i9E
 gUIzT7lOLZ7wSeIMR23CMwxBprS+4RtKDqMfYxEwjyD7tl3v9axXc4WIgP/AofyulHCS
 cfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776845257; x=1777450057;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zSbmgQ4mUKO3noT9uImqlbfaB1HH+PFpn68SkuRwax0=;
 b=B8dNG04KbT1dnCjWBw3cxlEmNIaGOpXocGD+HXfwl1JgiooBamNhmgiLI23ZXLlRpr
 xNc07q+/3ZUFXEDAklAo5s4uo2y2dahDY4Ly1RCB/5q+N0kCSdbsltK5RF+CWMGm1+0R
 2h9gjC23AzPjL9kwupCQ8LKKIXn0Kl4Qcs8gvjn3xe0wyKom4LEBUuyMdd6qIktjCMkM
 mpNDG9CoPaVO7X85nExio/HsI2aF68j+Vx9+46HK/WV0ftriC0F//WMjQr/gvfitXhjj
 6Uf9DmDh5FinenAUWlPgwDBbif4oxtqh1m9WkudSXdQ1kIXKzokQ69xn/1qQfU1K2Nnh
 LDPg==
X-Gm-Message-State: AOJu0YxrMQmJx7RJF8tFcWC8nOjx2XcPUZEt4AXgOMSc18z+ateFYbfH
 +cdaDvTo6H8WS8tDDsUUpV4MMoL/RWDBM9bkd801mBy1HLhXw0o6mSRD+L5gaGUjNSpPec9IIcS
 9h9mvNJU=
X-Gm-Gg: AeBDietztWEE6RqNBkIvsRt30zJEYHJzqWsM7AfUY2qKSKuMzhOphu21EbxomcvLc0Q
 ndbmVVR4DhH9J/G93JJ+DmAMagTevVDc7oADolcBzv/Nq4gYNkPZgfopUjomqm2XSzQN5iTF68g
 uKZCOdKaJSYfuxXbq4QBp3cr0QO5nQH0OfOVuy4JNSvBQDe3I8jOod8lUMUSBNkX+uYBc4DaC6O
 el8wZUhK7JgSI306gK3/K5KkoLk01aBboTezsrIYwYDRaJPoy/UIa8ip/awJG/TQA+KPG6ec3zM
 MTvBJXSSSmXWPjrdDbPH53WYH3am3yjNIpZy4+cj9DlrkGGArP2eFyBHJ06UbcSctZ8+/YAPsFt
 jbvw1JG4HkWZBj9ooAA9ptxBX1lcvEwOnYZyHnSpD0S+H37xedAqJesKYhpVFCwuKNeHDY75Y9D
 Mg/Yk6tuMqsSh44NvEaLCEewQ7liUjacvTzgrXk7OJ1O0S31CT0vCdKspH6Ode1J5kFGDmq2fKT
 VmA
X-Received: by 2002:a05:600c:3f0c:b0:48a:563c:c8e0 with SMTP id
 5b1f17b1804b1-48a563cd16bmr75304245e9.1.1776845256395; 
 Wed, 22 Apr 2026 01:07:36 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4d6casm39675477f8f.32.2026.04.22.01.07.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 01:07:35 -0700 (PDT)
Message-ID: <1012727b-f164-4543-b23b-bb68e4ddcd1d@linaro.org>
Date: Wed, 22 Apr 2026 10:07:34 +0200
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
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

