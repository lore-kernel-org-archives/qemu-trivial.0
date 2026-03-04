Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F408EDEBE7
	for <qemu-trivial@archiver.kernel.org>; Wed,  4 Mar 2026 01:42:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vxbFQ-0004aa-1Y; Tue, 03 Mar 2026 20:42:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vxbFO-0004a7-OR
 for qemu-trivial@nongnu.org; Tue, 03 Mar 2026 20:41:58 -0500
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vxbFN-0000gI-5r
 for qemu-trivial@nongnu.org; Tue, 03 Mar 2026 20:41:58 -0500
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-5637886c92aso3483091e0c.0
 for <qemu-trivial@nongnu.org>; Tue, 03 Mar 2026 17:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772588515; x=1773193315; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o3JvKW/+GHuHCKVZcMTsEX8KByjilP9LITsEXZJLkFM=;
 b=TgexFXRsjXr98EragZvuAM0wtghgnB/BFjNuxNLRNSqiaLukAuS5z7fBQHC4n+2dot
 7/2SaPjjWunqJf4F7SkIC7GuJ1cYNgMUmVyipQuMEQtCOc939nm3+uPy9pM2gkjkJIL/
 izgFIq/njUZ7UBT2IjNU7BjKhTHWVgwSWIfEbOOAQfTM8CpujbVfOOSzQN7sT1jjinGi
 r5iYsKdC4tiKX9vlIEaIvZ4H1faQTYt0YPZYf7c5rmmsWogR+/ObzO1dxWeVN03oTv/h
 5qRMUsxXvyDdLuqISdnP2pdBuM7J6OPAYuoo62rO2mD6DLy1VRH8GMy+RS2IHt6eKoNS
 GRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772588515; x=1773193315;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o3JvKW/+GHuHCKVZcMTsEX8KByjilP9LITsEXZJLkFM=;
 b=Q4U/a2NOFT1JK0MQf4MJn8DkDDZnBeW0diB+qmvrUE5hR20PKxbTOgMKoNQQNU4n+V
 ZmvJuu6TXiXXmWvwTXRxmBAHBG5R7cms1IJ5SE+fzHnC8ye7kRX7STj63el4cl/uwmFI
 L+DCB6I2W+aYYK6HVp7wjolOZWIlpoxpdskKK+94qqfNQhTP78EqvOzxREgXdF06seLe
 Mp2O5C/2cXcd4aoZjb1SRghg26ANkqkdqu5ele+dfiNmg47q7EZ+fgmbNIAZkzO0v/Hc
 V8d2d0UltCEXugHw52jdc9PK6rBbRQdkdLcYeQzy8woFaQGOvg/T8OGWywC1sH7Q/qM9
 N7yA==
X-Gm-Message-State: AOJu0YxHLy6h9ejHFCMejwWLmTRVEKyWHFEY4gYuULsuavADwAY+I3uq
 F2BMlgL/1hWoeb5NQCmi8i/Yd77ik787Z+63xIYnEDDT7vlLDvdpdugzLAYoArFzBEy+dhbKbX4
 vAhvh
X-Gm-Gg: ATEYQzxV+1CKl58juNx5+81OsLvxlTC7fTasjjN4JhaoeprEAR96OFmS48WVaWhEkOR
 1XPKvqWmfHxPEEagKHbPUXnIRdcHLu3zV40IZnAQ9Gtq2USC0cF5KY4ICr/aLynA6XrE+yZ4JuD
 rK0sqoghrxjwHoUOWoCaCiVDOQcx7DFjIxTaz+5uqTHchgw9OAqdayTS8nk/ma5B+1BYokSghzi
 kG+WjUOaEAyrQXxrXsQGZUNZOG+6AA367JsBgCHzfTx+kvksXFt0pB5PjAqgaCwEE/Jj9fZT0Vv
 nYC45deIJav0wlMz7DFDOuwkZBCG/r2pSMI4eUeaXjeQmSaulDYhew5AiIVYwOcftV5kxjNfAsr
 PFvNHjlb1KsaZfuGJCKcUYAbYCIgJTG9o4IHAzcq33QR+0MF3wHd2lyRDqIM25t9gqypPAx5n18
 a/crZMc3lS+b6JyKYvrqrZ+2NQZNDT/Vui
X-Received: by 2002:a05:6122:1b8f:b0:559:6723:628c with SMTP id
 71dfb90a1353d-56ae77e425dmr222658e0c.16.1772588515166; 
 Tue, 03 Mar 2026 17:41:55 -0800 (PST)
Received: from [192.168.0.103] ([191.8.216.93])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-56a91b8c7ddsm21413469e0c.3.2026.03.03.17.41.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 17:41:54 -0800 (PST)
Message-ID: <f49624c0-e2be-443d-a211-752a35e545f7@linaro.org>
Date: Tue, 3 Mar 2026 22:41:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Replace @tuxfamily.org address
To: Thomas Huth <huth@tuxfamily.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20260303203044.8403-1-huth@tuxfamily.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20260303203044.8403-1-huth@tuxfamily.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=gustavo.romero@linaro.org; helo=mail-vk1-xa36.google.com
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

Hi Thomas,

On 3/3/26 17:30, Thomas Huth wrote:
> Tuxfamily.org has had many outages in the recent years and will likely
> go away in the near future:
> 
>   https://forum.tuxfamily.org/post/3381/#p3381
> 
> Thus replace my @tuxfamily.org address with another one that is more
> reliable and hopefully will survive longer.
> 
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>
> ---
>   MAINTAINERS | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6698e5ff69..b75f1e592f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1367,13 +1367,13 @@ F: gdb-xml/loongarch*.xml
>   M68K Machines
>   -------------
>   an5206
> -M: Thomas Huth <huth@tuxfamily.org>
> +M: Thomas Huth <th.huth+qemu@posteo.eu>
>   S: Odd Fixes
>   F: hw/m68k/an5206.c
>   F: hw/m68k/mcf5206.c
>   
>   mcf5208
> -M: Thomas Huth <huth@tuxfamily.org>
> +M: Thomas Huth <th.huth+qemu@posteo.eu>
>   S: Odd Fixes
>   F: hw/m68k/mcf5208.c
>   F: hw/m68k/mcf_intc.c
> @@ -1383,7 +1383,7 @@ F: include/hw/m68k/mcf*.h
>   F: tests/functional/m68k/test_mcf5208evb.py
>   
>   NeXTcube
> -M: Thomas Huth <huth@tuxfamily.org>
> +M: Thomas Huth <th.huth+qemu@posteo.eu>
>   S: Odd Fixes
>   F: hw/m68k/next-*.c
>   F: hw/display/next-fb.c
> @@ -3098,7 +3098,7 @@ F: audio/paaudio.c
>   
>   SDL Audio backend
>   M: Gerd Hoffmann <kraxel@redhat.com>
> -R: Thomas Huth <huth@tuxfamily.org>
> +R: Thomas Huth <th.huth+qemu@posteo.eu>
>   S: Odd Fixes
>   F: audio/sdlaudio.c
>   

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo

