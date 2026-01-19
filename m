Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B32BC9830C
	for <qemu-trivial@archiver.kernel.org>; Mon, 19 Jan 2026 01:21:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vhdxk-00050t-8r; Sun, 18 Jan 2026 20:21:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vhdxd-0004zE-Gq
 for qemu-trivial@nongnu.org; Sun, 18 Jan 2026 20:21:42 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vhdxa-0003l5-P0
 for qemu-trivial@nongnu.org; Sun, 18 Jan 2026 20:21:41 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2a0a33d0585so22927395ad.1
 for <qemu-trivial@nongnu.org>; Sun, 18 Jan 2026 17:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768785697; x=1769390497; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0gvxH66qpJYEFDYvBJzcnrey3tjKoB7HqY4h0oF+Cuw=;
 b=BCADxYUSwnphsnfVjUUpgHKiOWgZilQc/T9waIiOzSUn/vQA+pWZ5jTaee8hHXnBj6
 vy2kRw5Uv5iyzIFjMn/i/tfQyy3z6djKNFsoYb121wyyGilBatDyO1xkRdsdRg2/k3Im
 IdPlbbJttoxj84VKrh0Xhokuqy2QNrjhVCX4f3tL4jbORHNaaoQkBwfG1rz7LA+OKZVl
 cu6K0anHFeYxrZkRXrbpvzRjUnw3+gqOK55L8Q+WvEkvsR33OpBRMD5sVkjL1is+mwyM
 C5A/kGAxU/fWZAasCriOkfpYkeNmR61xaQG1VSmNTSyIi1yVTKY3bR4T5ccLKEh7gRko
 /Eew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768785697; x=1769390497;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0gvxH66qpJYEFDYvBJzcnrey3tjKoB7HqY4h0oF+Cuw=;
 b=fPcGGFDJ+BXcflKukVVDKpLm8cItjFE+lA7Bj8c+IkE3UZvBkE4GGuiVNE8lPfLitO
 OovLvPk5SqUpgewVxu8T84XxJn2JDkELSdtIK7+ZEcU8GAhJAMQyPybm9BG86Lebh2E7
 GfKbbu2cDlKvTCjSMCSZKSIxrAOYRkITWbv8Qrf0prAdzEsDXE/wOkMhTOfLdVGt3FIW
 aFvJfkpTkW+eBNlCX58L3+29YhuC1llaPs5bwlRAptDW0G+g1SQ6m5m2NI+tUk1dw/io
 M0x4J+sUmzzILY73IEypTWBXPVvALYiz5wokKNBq8k2slKESVkPCeO/SFgCdSOOfwkP4
 kHXw==
X-Gm-Message-State: AOJu0YxW8pmoQNc1XF3e6hTZvSflCpdz6zHVVPHyyOMhdWxF0F0aYDt6
 Let9ZAIzP+ZPwHQnOa0BCTcLxF1/cNe6YWUNJjItOc/WDk3uzEQrUql3+awjqw3iD7I=
X-Gm-Gg: AY/fxX7Co+1gkz/UJ1NJor+CXaw0oD5ecyB2uvgQF2nHU1sMBr+HGXn7FPirZF/3mLW
 3o2/B6+J2y7DPgXxSFz9KP0Cyph5fZb4jytwbuyvV+VO1d0z8uxthTYuWXjLrUDhcxwHzcGJpZ1
 6faTKv7lPO48Vr7/cI7GVczl4NLmYaeBTLXVr7xENCC5rP3KKCU9I8ZNoJZEvSk5IM4OZysWYyc
 hksUSex4y7WeUaWOR7J5adIe3sRwNMoyDb3WaBBSJqpwk99UJkdPjfbHDu8MNqwwHED9KuPTNN4
 Up3ZhbB00z7GigUNItU0DihMWkfXkecb2a2wvCRJLtJxdHonnVxCNFGOabUqZG97+Zk89RR0QHV
 POpnRxxfYo+ERT62y5WJ/TsDDGx3/ffpdSunIPLqeWvOEF7u9iW/JEk/2CV/sDBQNN66hoO7XRz
 TMgB3Xx6o89cVV4wHfsEX2iPHm+YNuAg==
X-Received: by 2002:a17:902:ce88:b0:299:fc47:d7e3 with SMTP id
 d9443c01a7336-2a7188fd7fdmr87801215ad.31.1768785697064; 
 Sun, 18 Jan 2026 17:21:37 -0800 (PST)
Received: from [192.168.10.140] ([180.233.125.201])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a7193dd582sm76924405ad.52.2026.01.18.17.21.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jan 2026 17:21:36 -0800 (PST)
Message-ID: <9eaa51aa-a234-4682-82e4-9e77488c4a14@linaro.org>
Date: Mon, 19 Jan 2026 12:21:32 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH trivial 2/7] meson.build: stop checking for splice()
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20260113130008.910240-1-mjt@tls.msk.ru>
 <20260113130008.910240-5-mjt@tls.msk.ru>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260113130008.910240-5-mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
> CONFIG_SPLICE was only needed for linux-user/, where it is not
> used anymore (assuming splice &Co is always present)
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   meson.build | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index c58007291a..9b5f1540ff 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2913,14 +2913,6 @@ config_host_data.set('CONFIG_PTHREAD_AFFINITY_NP', cc.links(osdep_prefix + '''
>   config_host_data.set('CONFIG_SIGNALFD', cc.links(osdep_prefix + '''
>     #include <sys/signalfd.h>
>     int main(void) { return signalfd(-1, NULL, SFD_CLOEXEC); }'''))
> -config_host_data.set('CONFIG_SPLICE', cc.links(osdep_prefix + '''
> -  int main(void)
> -  {
> -    int len, fd = 0;
> -    len = tee(STDIN_FILENO, STDOUT_FILENO, INT_MAX, SPLICE_F_NONBLOCK);
> -    splice(STDIN_FILENO, NULL, fd, NULL, len, SPLICE_F_MOVE);
> -    return 0;
> -  }'''))
>   
>   config_host_data.set('HAVE_MLOCKALL', cc.links(osdep_prefix + '''
>     #include <sys/mman.h>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

