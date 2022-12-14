Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p5MAl-0007SH-J2
	for mharc-qemu-trivial@gnu.org; Wed, 14 Dec 2022 02:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5MAh-0007Rm-M0
 for qemu-trivial@nongnu.org; Wed, 14 Dec 2022 02:27:19 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5MAf-0006Zf-7C
 for qemu-trivial@nongnu.org; Wed, 14 Dec 2022 02:27:18 -0500
Received: by mail-wm1-x32f.google.com with SMTP id ay40so10551014wmb.2
 for <qemu-trivial@nongnu.org>; Tue, 13 Dec 2022 23:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VzoK6arwqv2kcSLGOD0mXDzLTpqlSGTUsoJG70k049g=;
 b=wGfVFj1x+xGLZg+vk0hp7m/ErANDg46dZZTR6gBATgkY59+tkXWNTXhpexoXduODz2
 dzRIjQz8Q/Hu0R12RzJke9fHozinBxle4+/OxbxazgnxtKKHA15v5Pp2EfcGc5kXXvVt
 ckntOjATb27LDhNdu7d5IN+Vo7xUHeYVN1qQo8Lviq06twXZe6AykuZgIRQUOP8hq3mB
 9hTb2lxeKheoUPbEoOJqYkn4LmGgaHubS67yAgb5118ngQ5HSdDZ9k09/SK7V+mhnqj9
 Yr3y7sHntOGrOecBqctqYJ52uUZOr287WLm3DHTOgD2cnxjNijHi6/PHjRtYZfxZedVC
 uqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VzoK6arwqv2kcSLGOD0mXDzLTpqlSGTUsoJG70k049g=;
 b=1P141/NgrvftA7usnDi5loUBqcSk2SLrE8RWoLAIWsO9jMvJKZyM70jgJ78CpUELFi
 EjlgDuoe3X+MHzlxrytMSsgibYjA516ctfFKJezrTN9KtgxNAgLRecZsvbBelNS8vcrd
 9RpAul+Esq5oWw8bZIzaH00+4NPRcJ2ipR7o1/qQP0DiqLR8no39QDIm6jM8WrAIjCod
 39oeLcax1nPUnmihFVMJKfjjsod9UIDxZXw8esBREpO+yQrfwCwYIwUzs9wodzz4OlWd
 +2fiSP+OlhWq8ggorgRu+8ljk3G48YcRaWzxZAf9Bi6SEHBWZa85mtjnbo2/ecX3CtdP
 F8IQ==
X-Gm-Message-State: ANoB5pkFbYRbHRZjkP4bU5X8QZ0Mkd1lafl9MmbsWrhVaMU+1x7phptj
 u/GTBkO2LkofuHnaK7iSrfzLVQ==
X-Google-Smtp-Source: AA0mqf5QOdamz+2lsRKT8P3HfBlgZX+/UYt/C8TRNijuB5AWAuUtaqPtek3U2RrinqknCzcTAMS0hQ==
X-Received: by 2002:a05:600c:4f89:b0:3cf:d0be:1231 with SMTP id
 n9-20020a05600c4f8900b003cfd0be1231mr21967874wmq.13.1671002835370; 
 Tue, 13 Dec 2022 23:27:15 -0800 (PST)
Received: from [192.168.128.175] (200.red-88-28-24.dynamicip.rima-tde.net.
 [88.28.24.200]) by smtp.gmail.com with ESMTPSA id
 d22-20020a05600c34d600b003cfa80443a0sm1372117wmq.35.2022.12.13.23.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 23:27:14 -0800 (PST)
Message-ID: <b973baf8-7b13-6cbe-5b9e-00cf2f94d8fe@linaro.org>
Date: Wed, 14 Dec 2022 08:27:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0] coroutine: Add missing <qemu/atomic.h> include
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20221125175532.48858-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221125175532.48858-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 14 Dec 2022 07:27:21 -0000

Cc'ing Markus

On 25/11/22 18:55, Philippe Mathieu-Daudé wrote:
> qemu_co_mutex_assert_locked() calls qatomic_read(), which
> is declared in <qemu/atomic.h>. This fixes when refactoring:
> 
>    In file included from include/qemu/osdep.h:113,
>                     from ../../util/error-report.c:13:
>    include/qemu/coroutine.h: In function 'qemu_co_mutex_assert_locked':
>    include/qemu/coroutine.h:182:12: error: implicit declaration of function 'qatomic_read' [-Werror=implicit-function-declaration]
>      182 |     assert(qatomic_read(&mutex->locked) &&
>          |            ^~~~~~~~~~~~
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/qemu/coroutine.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
> index 89650a2d7f..1750c30d8e 100644
> --- a/include/qemu/coroutine.h
> +++ b/include/qemu/coroutine.h
> @@ -17,6 +17,7 @@
>   
>   #include "qemu/queue.h"
>   #include "qemu/timer.h"
> +#include "qemu/atomic.h"
>   
>   /**
>    * Coroutines are a mechanism for stack switching and can be used for


