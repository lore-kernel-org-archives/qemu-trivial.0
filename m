Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nG0Rx-0007xm-5h
	for mharc-qemu-trivial@gnu.org; Fri, 04 Feb 2022 10:24:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG0Rv-0007nB-AZ
 for qemu-trivial@nongnu.org; Fri, 04 Feb 2022 10:24:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG0Rk-0003AC-C3
 for qemu-trivial@nongnu.org; Fri, 04 Feb 2022 10:24:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643988125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UmNX+D2kMFhrzgsEiswIhfajqUVkthzFx6Z0/eN2xnI=;
 b=OTGv+PhNVJuGmO1Gzvh93sPbdL0j2BbqnJSLPNCmNq3+np5txRfidzrwhoHxlds9hihxqo
 ZSrqGFSbwigQrPMWRgj/CNnZWGfKFC0N5tIEIMDr/EO/TrmLFB7vDSkJ6z/lFXZL5iukAs
 o1XxNsoxn4zRnV/cvrk9RV3XFtUKvg8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-zHv3Xk79NNmdY_Qy0UjSYg-1; Fri, 04 Feb 2022 10:22:02 -0500
X-MC-Unique: zHv3Xk79NNmdY_Qy0UjSYg-1
Received: by mail-wm1-f72.google.com with SMTP id
 v190-20020a1cacc7000000b0034657bb6a66so1136026wme.6
 for <qemu-trivial@nongnu.org>; Fri, 04 Feb 2022 07:22:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UmNX+D2kMFhrzgsEiswIhfajqUVkthzFx6Z0/eN2xnI=;
 b=n+hX1rz3z00ot1FG9G+IxlQvg39H76bwKn9miEtH2ezeZYycnaTo12rQzbehztsTW/
 VvtBRojp5ylBa8oZFPPfKrnUtnAfngoTY8RgdBlQepE28M/OimikZHq6wJMEezU1cK+W
 Xbq9b8yVb0rJRRo2tFLLEjBWdpFD0cPQ25hVKqw6Q7VEKSbEaeFB4rGCpkB7b7AQ629I
 QrUaUunINp63BQWefzn/RS7EuabJ4c1ulL2kE5KLpc9dFKb2LoNKCm8/MmkrQHyROWy+
 /mK0FJxy/s8SNrOr9bz62krLQOmP3nF7clSoSYTr7kvFB0bSKzbvlqdixe819qXeZWuT
 jWEQ==
X-Gm-Message-State: AOAM531oXyXGk1TvEan4+nEzcQSAuvfdgqoQm0bVk0EfyMSk/QECPG+C
 Uzz/OhZs9Xya1RJBnEpZYbO1qXHR/dxOk2o4hWF/P0dF8c8vgPN3PkdEnGVjSlKDURg1mLQj7eE
 NF83r5KO2MaS2t0UZjw==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr2821910wrz.391.1643988121031; 
 Fri, 04 Feb 2022 07:22:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyItSwfOUxBJy/86EmnqtODgW4DMGmJkjulNI9KVDmChFk7OmuWe7ThDD/LjSkWvNb05cUqPA==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr2821894wrz.391.1643988120851; 
 Fri, 04 Feb 2022 07:22:00 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id l40sm1766985wms.0.2022.02.04.07.21.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 07:22:00 -0800 (PST)
Message-ID: <0eadaccf-dfb2-66e8-3ba3-7593af2e0ce3@redhat.com>
Date: Fri, 4 Feb 2022 16:21:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 07/10] core/ptimers: Remove unnecessary 'sysemu/cpus.h'
 include
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20220203193803.45671-1-f4bug@amsat.org>
 <20220203193803.45671-8-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220203193803.45671-8-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 04 Feb 2022 15:24:35 -0000

On 03/02/2022 20.38, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/core/ptimer.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
> index 6ba19fd965..eb5ba1aff7 100644
> --- a/hw/core/ptimer.c
> +++ b/hw/core/ptimer.c
> @@ -14,7 +14,6 @@
>   #include "sysemu/cpu-timers.h"
>   #include "sysemu/qtest.h"
>   #include "block/aio.h"
> -#include "sysemu/cpus.h"
>   #include "hw/clock.h"
>   
>   #define DELTA_ADJUST     1

Reviewed-by: Thomas Huth <thuth@redhat.com>


