Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41107E83041
	for <qemu-trivial@archiver.kernel.org>; Tue,  3 Feb 2026 02:36:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vn6HF-0002gd-4D; Mon, 02 Feb 2026 21:36:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vn6HD-0002gM-Vk
 for qemu-trivial@nongnu.org; Mon, 02 Feb 2026 21:36:27 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vn6HC-0004y3-C9
 for qemu-trivial@nongnu.org; Mon, 02 Feb 2026 21:36:27 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-35334ea1f98so2315289a91.1
 for <qemu-trivial@nongnu.org>; Mon, 02 Feb 2026 18:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770086185; x=1770690985; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XgeOt9/6xAZdBDWOTYcZcrZL4DZk6Feit8gyjfJfU/8=;
 b=YP7p9MJabKq9sGPb9lmETF9zcELI2FQQiEGVqHWsC/pkD5gHKlKAn8muSp970M79ZG
 PsR3+u3nz1dnSsAzQOeOMxJne5+it3eenvz8c3fNh5vIENFzOB35OCv88bUdAWgav+N6
 Jsxf0erKIyWlJl0GUVc72DZs9dOrAqxbG6VopOykGXkQA11QV5I91ZqUXB/TULiUtOvz
 zw7eQ63gj36jvxLx8xek7MxaKkHq931PWISsWAwMsMjJGJCbL0dTzHh4BvLGF7/9kagx
 OtRVOcMrx/RVF0ctTCfMi51OD7rqeIhHhxtR0oO8BtXj7j9R8fyidVr5fHTfx/BMWxkm
 b1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770086185; x=1770690985;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XgeOt9/6xAZdBDWOTYcZcrZL4DZk6Feit8gyjfJfU/8=;
 b=Sy0GAo6gpwIy27BxIHwVA1cKZgLndn7HcCqUdiOjj9PrYGpK2zK6xFzEYMg0q0oANI
 0EQ9JRKb63vL8J8tPqfKzw+9da0FFdQ3m2nbLR4q8IsOP+nZHfxtiZMsu0TphX+JbeS4
 EjQss0E9CoK3Hb86HTf2DjHS5hc3bBCUa6HQX2udexp6Lv6rMK241XhKKdzqAKS2hvys
 /wklfOps2oNWEx8RNfoFLesf4AN00vV87ty6oqD0ycYNWOHA62Jw625zfo9pfFbRNJpn
 TVkOvv9WDn4i+rO2MxyDDIjH+z4ZBS/GwhUcFPrtaPadJEA9+vnOwap/0vA68eGw+FDg
 uJdQ==
X-Gm-Message-State: AOJu0YwuGqqb01Q/XRXCB/VWnNPIwZYkiKnyB7V026rXH4hEgnzBCqvr
 dbX3Rb9tQCe1vAajBKz9GtgkPhukgHrDglgtZ0mnhgwzSdYlleCuC6zh9oqUUDlatn/8VREi3Jp
 DcKFXL76gLQ==
X-Gm-Gg: AZuq6aIIaLAphfuHxAkDHEpo5gzrQQvFZ7PHNlLkAifux1Xf3rfLOw3N06ibMqymIkf
 oshXoniL0xUwcnowO62oQH74YSF1BGoU7I1w9JnVtzmIDrR51c7v66PU+HmIr2ytQxfeimAFnnj
 VkghWwZo0hfjPSvuVqSeBX93N3II/cRXUKzDXCsiGO/rwjDMgNuZiyJLoHTlhNhKapjAZhdvdik
 8WsAs3a8l+afiPpUvj2z5uDiUVt76M5AEEPO9c+7bt+JOXNHgkorSLdVQ47eQAzhRyEyIRKrZTW
 V8FbRCxw72snCh7H1n06wkm7asJLP7kOaBJiNJ8HYLb7FDyl/2ihGgYkkE6rRPWlRTRuBXHa1kV
 4QktpwqNEH5UdvpL1PngbCR8Eb53lsFWI+p0JCQddBRAjrg1zzbt+vgfwpO5kvuPPajM/dgS4rx
 W/c5S4x4wcILF2pReEIXiTiHpid718v5KVHQLD0tdWXuSQbNaf9lP5scL7SG43nzfNwC3bckJr3
 jhaRGV3YmR6n8t2FiLhL1VYqEAykZZovUrY0ET2xQ==
X-Received: by 2002:a17:90b:4b02:b0:340:d06d:ea73 with SMTP id
 98e67ed59e1d1-3543b3b24aemr11220496a91.19.1770086184614; 
 Mon, 02 Feb 2026 18:36:24 -0800 (PST)
Received: from ?IPV6:2401:d002:dc0f:2100:1047:c02f:591b:6a5c?
 (bg30dhzn7h1zhjqnvj08.ip6.superloop.au.
 [2401:d002:dc0f:2100:1047:c02f:591b:6a5c])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3543babe32fsm5729724a91.0.2026.02.02.18.36.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 18:36:23 -0800 (PST)
Message-ID: <d104e4b0-94c4-4de4-84e7-1011253ab5f8@linaro.org>
Date: Tue, 3 Feb 2026 12:36:18 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH trivial v2 7/7] rename CONFIG_EPOLL_CREATE1 to
 CONFIG_EPOLL, and stop checking for epoll in meson.build
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20260119140557.2167351-1-mjt@tls.msk.ru>
 <20260119140557.2167351-4-mjt@tls.msk.ru>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260119140557.2167351-4-mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

On 1/20/26 00:05, Michael Tokarev wrote:
> Since CONFIG_EPOLL is now unused, it's okay to
> perform this rename, to make it less ugly.
> 
> Since epoll is linux-specific and is always present on linux,
> define CONFIG_EPOLL to 1 on linux, without compile-time test.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   meson.build      | 3 +--
>   util/aio-posix.h | 4 ++--
>   util/meson.build | 2 +-
>   3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index f4eae50764..157189e306 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2673,8 +2673,7 @@ config_host_data.set('CONFIG_INOTIFY1', have_inotify_init1)
>   # has_header_symbol
>   config_host_data.set('CONFIG_BLKZONED',
>                        cc.has_header_symbol('linux/blkzoned.h', 'BLKOPENZONE'))
> -config_host_data.set('CONFIG_EPOLL_CREATE1',
> -                     cc.has_header_symbol('sys/epoll.h', 'epoll_create1'))
> +config_host_data.set('CONFIG_EPOLL', host_os == 'linux')

I guess my question remains: Why keep CONFIG_EPOLL if it is identical to the existing 
CONFIG_LINUX?


r~

