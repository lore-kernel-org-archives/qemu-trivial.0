Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVenK-0006re-00
	for mharc-qemu-trivial@gnu.org; Mon, 04 May 2020 13:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVenI-0006rU-Lk
 for qemu-trivial@nongnu.org; Mon, 04 May 2020 13:22:16 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:50445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVenH-0004MT-UH
 for qemu-trivial@nongnu.org; Mon, 04 May 2020 13:22:16 -0400
Received: by mail-pj1-x1041.google.com with SMTP id t9so175369pjw.0
 for <qemu-trivial@nongnu.org>; Mon, 04 May 2020 10:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pe/mA81uRo5jWWJVyxlWLLerp1EOutJhM9oBdr4f3dU=;
 b=QcFPk4+sZWK/c7MQIzTjyBgYU80dsOhTDahPnNDnLJsUK7WHKbJk6g+OIbOggy+tP0
 BYkJAN735GyLSC/ILTeJA9DdoDxf50T2GMXcN19DzEYXgc1GfJ5cPmUVYglg7U3vKqmc
 rrs3w915p1yrDO7/RXiISYgIEulD4R5Fzmp2hTG8IwWMM59ifrC2pBUlO+QUJyAghY9e
 UMYEWjzKdC9WEidZBAoTH2duu2SiLwZIWbT+w4HMtFWCYNiycCHqBv13crR0ZwgIG1nc
 pQmE0A0h7Kj+0miv8JNIefwDQWNmuqcOr9gsR0UND/3bmMcWAer+pnaCAkIVbYoazaCo
 +gIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pe/mA81uRo5jWWJVyxlWLLerp1EOutJhM9oBdr4f3dU=;
 b=J2ozdj6aUIR5oUT3w9B/HoCf1G5euc1Nkj/o65sL3V/ZrlRffoWSuheAJMurdpKySF
 atUGT4wekLICkOHMveNJBuMcsGeuzl1J/HccPEj/ggWhBxjVg3JgkPaxCCbRJwSH+/SU
 L6ZwvRUvDUeAjhD9GWZ1+dfdZ5eG+eiRiEiBSp0TW5v1xU7sgFhkPwO2ZJrDfLwRho18
 ZWvWo5S9I0pUQb2DC71CtQM1Z9lZUs9wrOBSjBzDJ349mYBToQAzOsBoHbzJyVUosUQh
 C//WE/bH8EsF+PmCym+MdhzqHlLoyKIPXq4xzJPuXHzlcDGVxFwqVXtTr1G0OGp7GK+o
 j3ig==
X-Gm-Message-State: AGi0PuYs0+quHecHAwhpaUy9yR1QbzH2X2dhXgsiI24vdiuCNkAXsSyL
 D61Ut4cUlgFnKEjmWL75hCRfQw==
X-Google-Smtp-Source: APiQypIMoKmd492mhQ0cJ8J7ESmw2gqziV+k7MQRLaNtyuooEBpbSaaTjJNZr/KsIB2IfNKX3aBJig==
X-Received: by 2002:a17:90a:20ea:: with SMTP id
 f97mr280410pjg.157.1588612934462; 
 Mon, 04 May 2020 10:22:14 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id o21sm47015pjr.37.2020.05.04.10.22.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 10:22:13 -0700 (PDT)
Subject: Re: [PATCH 2/3] hw/sh4: Extract timer definitions to
 'hw/timer/tmu012.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Magnus Damm <magnus.damm@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20200504081653.14841-1-f4bug@amsat.org>
 <20200504081653.14841-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6df75391-39d0-b1b1-4443-f132bdebd6d7@linaro.org>
Date: Mon, 4 May 2020 10:22:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504081653.14841-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 04 May 2020 17:22:16 -0000

On 5/4/20 1:16 AM, Philippe Mathieu-Daudé wrote:
> Extract timer definitions to 'hw/timer/tmu012.h'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/sh4/sh.h       |  9 ---------
>  include/hw/timer/tmu012.h | 23 +++++++++++++++++++++++
>  hw/sh4/sh7750.c           |  1 +
>  hw/timer/sh_timer.c       |  2 ++
>  4 files changed, 26 insertions(+), 9 deletions(-)
>  create mode 100644 include/hw/timer/tmu012.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


