Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B4AC9830C
	for <qemu-trivial@archiver.kernel.org>; Mon, 19 Jan 2026 01:28:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vhe4M-0000ul-9L; Sun, 18 Jan 2026 20:28:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vhe4K-0000sv-NC
 for qemu-trivial@nongnu.org; Sun, 18 Jan 2026 20:28:36 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vhe4J-0004s0-4E
 for qemu-trivial@nongnu.org; Sun, 18 Jan 2026 20:28:36 -0500
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-c2af7d09533so2487613a12.1
 for <qemu-trivial@nongnu.org>; Sun, 18 Jan 2026 17:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768786113; x=1769390913; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=19b4lsNqh5g0QXi/Wgzru/UUBfNwOcTHs2Y9VJ25mII=;
 b=HieTplPIsOpuFBC32lh7ZYXhJ47enC6OXPNbC/MtRxNEWpsclgl5g8hE//Rhpcppb4
 V/9TvI840XXnCmKJmtZn3I0hERrteek33WIINb4L1j2TwmPmabQOK7p2UdS/qo9op4h2
 vWSmMg2ciNmddnIQn6vS+S3jCl7UBMH96LWrXnfY8Mz0vkcIZcXwf9DPQWlwHGGF+CO9
 HjksA7l4Vw2c4twlkgRWDVKFOByH897xZeLUMxGtHsqm8QyOz4ZZYqJqKX90Kl4AqYqD
 qSQWGnQIm9djLE+y3thQ4c/BqV0l7ojtDFEGiBt3CVkPuae3nXl+S5JRxLzImALjqLoS
 R1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768786113; x=1769390913;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=19b4lsNqh5g0QXi/Wgzru/UUBfNwOcTHs2Y9VJ25mII=;
 b=Mv1SgL3sMjv9GNskvKEzspiWd94m13jbzJRl3GFZNGNawBhSAeTTIjoel5fNn9KTiv
 PLCQpAn4k1Tc8LqpdPfTxh0XOw48QxyTb2+/B0X65t18ezAUi6LBsYZMOziaFMH155Qh
 8T/ABRbw8+fqtGudLCCdVWIdIiaE8/rLcP1A0d1PAEjUjxnpWRpuQKnMWRtbAC2R/Zoq
 kw2OYO6GwTF3Vs3ZlMbtaRVj3xBDkGWBo6K7sr7O9Jp6zHPCLDh3Z2JSqkyEL9rZqPJT
 qTZz7vhuuu5GMoUc40iHzawTsQ7jAoxHVS2reFmDQ98GJBovuKTIQfDAYD+brs52Pk7X
 zvyg==
X-Gm-Message-State: AOJu0Yygwr4Cod02G0t5IdfhMSUuDWk1zkkKhvbLkig5BrQchJsdXqK8
 yDNJZZwZiXDAS1EmfO8ie81CPxJGboCD3DGxzag/OvWEtzxtMe0Dsng2vmMrwxQhnjQ=
X-Gm-Gg: AY/fxX7vAHhCRx4W8ZBgUA8knXpllWXrCyNmwcqgTGJFPCnfKzC7y0aQzwi24pvk0bN
 VuEmWvsqYkN9FmQPNZ4r9XymqiIpcIk7xfX8Cq4I2niMFMBCLZX5GHuW0x2ehGKzBZi+TUjQHWE
 e+vfyf72zsUcOTMLGAYkfOqveqKRraKeWe5rZb0Dbzq1mfRxFl1dRcZOZ6+l7YltB4BqleXtvPQ
 e0DnIPKVB6jeqkZwB7L83R6YvLYnkttZho0SotgAsy33oevrvrAilHb2AqJfvU64FNBORndR4J+
 m0a59Dp+ExYO268potX1LaDKOBCGV6h5IueWTB2F19G4ux/Gp96JLl7awTYhtlMFVTIzWsZK7KB
 pqWVcJNXIPTQPuwPWcTUI9rnSb1NGTw1Rem4gweG8+WkmJYHIYRohoqH+T6wnHqgbiQrTYsbXEI
 aP3zjF9Iiu32gIRTxSHOjbxoxcEBRRkw==
X-Received: by 2002:a17:903:22c3:b0:2a3:bf9d:9399 with SMTP id
 d9443c01a7336-2a7175a247emr90649615ad.35.1768786113337; 
 Sun, 18 Jan 2026 17:28:33 -0800 (PST)
Received: from [192.168.10.140] ([180.233.125.201])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c5edf355ca7sm7670027a12.27.2026.01.18.17.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jan 2026 17:28:33 -0800 (PST)
Message-ID: <5fa1630e-e557-4e23-adf6-3bdf695c81fe@linaro.org>
Date: Mon, 19 Jan 2026 12:28:28 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH trivial 7/7] rename CONFIG_EPOLL_CREATE1 to CONFIG_EPOLL
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20260113130008.910240-1-mjt@tls.msk.ru>
 <20260113130008.910240-11-mjt@tls.msk.ru>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260113130008.910240-11-mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

On 1/14/26 00:00, Michael Tokarev wrote:
> Since CONFIG_EPOLL is now unused, it's okay to
> perform this rename, to make it less ugly.
> 
> Since epoll is linux-specific and is always
> present, we might as well make CONFIG_EPOLL equal
> to CONFIG_LINUX.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   meson.build      | 2 +-
>   util/aio-posix.h | 4 ++--
>   util/meson.build | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index f8b4f06049..552b34f34e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2713,7 +2713,7 @@ config_host_data.set('CONFIG_INOTIFY1', have_inotify_init1)
>   # has_header_symbol
>   config_host_data.set('CONFIG_BLKZONED',
>                        cc.has_header_symbol('linux/blkzoned.h', 'BLKOPENZONE'))
> -config_host_data.set('CONFIG_EPOLL_CREATE1',
> +config_host_data.set('CONFIG_EPOLL',
>                        cc.has_header_symbol('sys/epoll.h', 'epoll_create1'))

This is present in glibc 2.9, which is required.
Therefore you can drop this bit of configuration as well.


r~

