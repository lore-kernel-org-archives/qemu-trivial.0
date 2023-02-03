Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pO2yR-0000iH-D3
	for mharc-qemu-trivial@gnu.org; Fri, 03 Feb 2023 15:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO2yM-0000hi-Kc
 for qemu-trivial@nongnu.org; Fri, 03 Feb 2023 15:47:53 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO2yK-0007a7-6b
 for qemu-trivial@nongnu.org; Fri, 03 Feb 2023 15:47:50 -0500
Received: by mail-ej1-x633.google.com with SMTP id ud5so18700614ejc.4
 for <qemu-trivial@nongnu.org>; Fri, 03 Feb 2023 12:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5ydvcVXnkeVZEZbVAHL26kTHEEt7XjNe4pcearoNg0U=;
 b=CFdM5Qtk2XkUQrWZV8DjJtoOX5UrPazPWQclD1BYhEW3fPhlsWTX//Dk7WkTVYurp/
 qCsZuVbLH1fbAKcvbteravy2nni8oiFKkEk9m4lOKfzcdkZ5p3lUAJe7w7d5le7AvhAL
 6J1M44UgomOEAg3ybrvr3oQ4CQtGSyve0f+aLi5R+DZzzYl9VGxsSpyen6B/SMeh29ew
 FH1erC2eAUvh/rx5EbF0lhV3elFb1vRnAQwpqaQ0Etl0P6jUcAFrD0rRN8XdUGH9Uc8u
 mx20gJdrREg7HlCB3wGWcQD42C/YMzbgZc/W+z89hhf5I+3U1VVKC9Mgb4hCTBPA6yln
 Wk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5ydvcVXnkeVZEZbVAHL26kTHEEt7XjNe4pcearoNg0U=;
 b=M/tlobM/wJVC4ApocxJSFHAheX1EeG3vnPONTO+pnKzSbkJD4H5y6AfJ0AWPBAvoBE
 O2sZyKlBbPYhO6k1R9QxctfBHevlPJSDCO0N5jc2Xu0Sf+ajV9dktjaj7mmmHyiA3RC0
 gLKoN9alvt8uD0uG5/MaqXOjwIh0nFf136OtkIHLV5px7Hy0U+Cke2l4uuxyOQmXnVBS
 Xq6rAPyl0Tzd4vG6MCYQg0OeZWzvXOoyVrMsvbqDWraMQYlnIoENk03V/7GXDlBmrQA8
 5MNLh61fjNmkeYoyASMbKBtny+EIk3JdS2gvzBLfROKEi5q0++0orKsTPlhRh7dUzsQK
 9ybA==
X-Gm-Message-State: AO0yUKVAuh9vRiS7IcZbwcZOtION0fLxuKYhUDfkUCD+Tr6r88rhN+ml
 jcDfJS8V7e8FPeK/91PgeFxiew==
X-Google-Smtp-Source: AK7set/ckDdZP+d89Vvk/KLhxv3WrxkEF5tYEjDCdIh9vdk4/3SVOZVInMqGpkJ3w/Eskj3yUQwsbg==
X-Received: by 2002:a17:907:7672:b0:88d:f759:15b0 with SMTP id
 kk18-20020a170907767200b0088df75915b0mr11882742ejc.45.1675457265920; 
 Fri, 03 Feb 2023 12:47:45 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a17090676d600b0088a161c232esm1846721ejn.172.2023.02.03.12.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 12:47:45 -0800 (PST)
Message-ID: <283172a3-41a5-17e0-7d02-3194321025cc@linaro.org>
Date: Fri, 3 Feb 2023 21:47:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] hw/ppc/pegasos2: Fix a typo in a comment
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230203194312.33834745712@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230203194312.33834745712@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-List-Received-Date: Fri, 03 Feb 2023 20:47:54 -0000

On 3/2/23 20:43, BALATON Zoltan wrote:
> Reported-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/pegasos2.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


