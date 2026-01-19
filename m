Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16ABC98315
	for <qemu-trivial@archiver.kernel.org>; Mon, 19 Jan 2026 01:26:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vhe27-0007ZU-H7; Sun, 18 Jan 2026 20:26:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vhe23-0007PQ-C3
 for qemu-trivial@nongnu.org; Sun, 18 Jan 2026 20:26:15 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vhe21-0004lG-UN
 for qemu-trivial@nongnu.org; Sun, 18 Jan 2026 20:26:15 -0500
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-81e98a1f55eso1892183b3a.3
 for <qemu-trivial@nongnu.org>; Sun, 18 Jan 2026 17:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768785972; x=1769390772; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wap4gVhHL2+7+mwYV5ngCK8AUXAeJIsk5rEv9j56blo=;
 b=hyBvxdniquuwVnusilcCwmJG5xa3eyNAjAoysULUMprIlVvHYyz08Ki9klsMTWWaEf
 Qc17fSmyzVrEV6oLERBWk+X9wrC2CRASgbMn0YSZifnTa90k0nwyk4xKi+CncCtdrMEc
 jOvwdXr77ExVeXKsUyznAmbUkC6XRB7SLVQ3HWXEZ62JYpLJLP7YJ4rhG8ro417G5gP1
 cvaK8J8Cr8eR4qgxvlPz+0l+UD1c+D5IKXG2Lhh0l3j1He23bp2+YoVVJXb/11KVn2W1
 BC3xL27kFJrQTjeKy8N0d7VH5ZllGj18NNPDkRvmL4/wcYmHe6TPaF8kx3fb8KFrLRnY
 kQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768785972; x=1769390772;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wap4gVhHL2+7+mwYV5ngCK8AUXAeJIsk5rEv9j56blo=;
 b=YfzlIyZay3LJu7vOhJWu49xJwnIK7qAWiD47CM4Yz/RlpXE8bONdAGHDBBy5quV56v
 f1XFRJPsUJGXHA5qO0+5ZWR6UBF0ij3vANyCPX4AY7wIaVAlK7qPYs0sDJWTM7zqojU3
 LJmbNLvmk2QBIONF+R5IEgOWonBrSBhWlY0qtKah6EUu3nN3hc7GpesgCofyjNYdiExH
 /8btstwLd/w1Vdvx0kOPZpUdW+ZPON1Ka3T++Wccev46xDRi49wtBVwd8rS//Xx7jpsr
 rScPeFpGEjyv56wUdKNpAHh61pXVeP2cbkPx41Y5LMHWYySREKU0Bb7rd+Jl4zgLg5Ky
 r9pg==
X-Gm-Message-State: AOJu0Yxpu6aqWnKOXSh+ZqGevoNJoFaI5b+VsEbH9xQ8xrraYEld/uA7
 g/sPM+r55kJAC9Xrm5Y2ig14vDsoAZJC3ggMAQ+RMa2HituLo1wxgKztBalorn+F+POnm+81lxM
 pT/y21N2DaQ==
X-Gm-Gg: AY/fxX5mg7/1eMlNPNNqAgpTc6ggHMqZkxbDdHdoDmc7rfYwaNmsDIfY4ug/oTVOzQA
 dFuqjltCgLKqGR6WusEggEFTsNXAnUKFdrIrsqgMizSsBe2BciwvCPwUReQzieb7mEvwHEEymLi
 HRrVjVsFiHXsOpTbndzgCHh7bHTndRgBArODnMaFpY5PsvcuvAEaJNF74VzKuJ1Dn5pn3GaKGvZ
 mNuYYQi8N9W2UM9/RrnHgfkYoqxiSoIxEsiJlp3Z/cNZ2PV9PdIrPLXTEhy67I28ReD8s9ytFs5
 6bNUqDox7ztrX7wNUD/AJYwhHYgAitxq3T/hcnP8ac0f7drGjFQXQuy1nV4YIYGVNdSaUDjcd/F
 s2F9K/PbYu/lafb1Kzi3b/nBK/z8RXBrUac8hPVNk9241VtFildQywD0uOVEkm4XXrCWD1+0fPl
 OtRb8IU9r+ocb2fdmZV78yNI9Xp3JtFg==
X-Received: by 2002:a05:6a00:408c:b0:7e8:4471:ae66 with SMTP id
 d2e1a72fcca58-81fa1861292mr6808333b3a.50.1768785971696; 
 Sun, 18 Jan 2026 17:26:11 -0800 (PST)
Received: from [192.168.10.140] ([180.233.125.201])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81fa12911c2sm7411341b3a.46.2026.01.18.17.26.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jan 2026 17:26:11 -0800 (PST)
Message-ID: <905bd70b-1a98-46f3-84b3-16430f6a287d@linaro.org>
Date: Mon, 19 Jan 2026 12:26:06 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH trivial 6/7] meson.build: do not check for epoll.h
 (CONFIG_EPOLL)
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20260113130008.910240-1-mjt@tls.msk.ru>
 <20260113130008.910240-10-mjt@tls.msk.ru>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260113130008.910240-10-mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
> The only place where we used CONFIG_EPOLL was linux-user,
> which now enables it unconditionally.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   meson.build | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 6ea49c6fc0..f8b4f06049 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2617,7 +2617,6 @@ config_host_data.set('CONFIG_FSFREEZE', qga_fsfreeze)
>   config_host_data.set('CONFIG_FSTRIM', qga_fstrim)
>   
>   # has_header
> -config_host_data.set('CONFIG_EPOLL', cc.has_header('sys/epoll.h'))
>   config_host_data.set('CONFIG_LINUX_MAGIC_H', cc.has_header('linux/magic.h'))
>   valgrind = false
>   if get_option('valgrind').allowed()

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

