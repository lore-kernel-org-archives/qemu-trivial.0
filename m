Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sZUMi-0006XZ-Ch
	for mharc-qemu-trivial@gnu.org; Thu, 01 Aug 2024 07:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sZUMh-0006Wd-Aj
 for qemu-trivial@nongnu.org; Thu, 01 Aug 2024 07:53:03 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sZUMf-00036c-Nr
 for qemu-trivial@nongnu.org; Thu, 01 Aug 2024 07:53:03 -0400
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2f149845fbaso32284861fa.3
 for <qemu-trivial@nongnu.org>; Thu, 01 Aug 2024 04:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722513179; x=1723117979; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hlRV1J11nRpbipjxFE5QaEkaBKh5+SDcSE8U3WlJp0s=;
 b=TbhiDjYv0xkfCbMJOcXHK2CDoa+muKEsBpQBjaJuK1tvPi16m82Lp4RhYpY4wXeJ/K
 echa78E2xUV8tL5vtzrtB67HpInd5ud8VFF3jnAPGmV3Z39EkIPb1nQQ97+dFsnSqox2
 AWe9+6FgQ5oC1f4cngcydZcg4Nr186R3/wWm2gFW9Ao0u+wpnNAfx+lz8BG2jMHTghkf
 EJ5V1yWkXpBCBlVwBF/hmZU4P+dKzKZdnPw00Kl6uUv0AM/SUeUckKqijPgrtxbr0Y0y
 5aYWsmSBD/Sgk8QyekOMIlhz96jWe6E8ro6Ew2HsdxGZ43yEMiJQpvYkQGXfzbghVQMt
 gdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722513179; x=1723117979;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hlRV1J11nRpbipjxFE5QaEkaBKh5+SDcSE8U3WlJp0s=;
 b=Biv5WGiGd/XBgDvfNq46gKZUN9K3GZHl7s+AaTgh18h3iw16WeSZoI4BtNayl8jzF/
 oeK5DNy//Gh7lgw4QIsAR7if7fn57SEF09RP9/k6y2IFl7nJ6PZEa188Yk0Uiwl1t0wM
 fSQ6/PEaSHfAow5RMSn8roRp62NAJ6q+XDXL7rcpb4AyUZEDg/D/RpiXq28un3kGqtly
 jsFTH5zqFPXsvWaDE+6B9mYKaaXhX3ZL2dxE+C/ccpqOMLmPvzAV7tlGROTmchixU/7/
 ryRkxDPPdk6jbibxpQYItF6NpMCL9Zs6lEM73NUahYbVmTla6BVrmzX3t8mkq3aQcOa0
 RzRQ==
X-Gm-Message-State: AOJu0Ywl5fzHrFNN0yqKfGEA1rimRAB/iJT3xFeyZ+JPpx1XgQ2ZTPbr
 wiQIWfALwHoz0lWbfFTu3X8L4P3Kcl82U23lmbgrm8v3kRGQx0fQQYLLVy/9hcM=
X-Google-Smtp-Source: AGHT+IEzbiahKcYhHoEDds5DaXtAgvY65OIqfiDDAkjW3PWD1Ac5bRhXWIBCscgFKQA6rwtLk7sfEA==
X-Received: by 2002:a2e:b16d:0:b0:2ef:3130:6362 with SMTP id
 38308e7fff4ca-2f1532db5admr16785781fa.39.1722513179103; 
 Thu, 01 Aug 2024 04:52:59 -0700 (PDT)
Received: from [192.168.33.175] (206.red-88-29-191.dynamicip.rima-tde.net.
 [88.29.191.206]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4282bb9d786sm55119955e9.44.2024.08.01.04.52.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 04:52:58 -0700 (PDT)
Message-ID: <9f961fc5-6f3f-4451-b60f-ea29fb033e4f@linaro.org>
Date: Thu, 1 Aug 2024 13:52:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] include: Fix typo in name of MAKE_IDENTFIER macro
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20240801102516.3843780-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240801102516.3843780-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 01 Aug 2024 11:53:03 -0000

On 1/8/24 12:25, Peter Maydell wrote:
> In commit bb71846325e23 we added some macro magic to avoid
> variable-shadowing when using some of our more complicated
> macros. One of the internal components of this is a macro
> named MAKE_IDENTFIER. Fix the typo in its name: it should
> be MAKE_IDENTIFIER.
> 
> Commit created with
>   sed -i -e 's/MAKE_IDENTFIER/MAKE_IDENTIFIER/g' include/qemu/*.h include/qapi/qmp/qobject.h
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/qapi/qmp/qobject.h | 2 +-
>   include/qemu/atomic.h      | 2 +-
>   include/qemu/compiler.h    | 2 +-
>   include/qemu/osdep.h       | 6 +++---
>   4 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


