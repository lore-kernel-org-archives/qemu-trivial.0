Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q1hpy-0002uw-1X
	for mharc-qemu-trivial@gnu.org; Wed, 24 May 2023 02:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1hpp-0002qN-GN
 for qemu-trivial@nongnu.org; Wed, 24 May 2023 02:18:58 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1hpm-0004OK-To
 for qemu-trivial@nongnu.org; Wed, 24 May 2023 02:18:57 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f6147227a7so1520545e9.1
 for <qemu-trivial@nongnu.org>; Tue, 23 May 2023 23:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684909132; x=1687501132;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zXP9bbbfnrujl2z83OZx0ev2hu3VaP9qwcc8H6TTGA0=;
 b=rh3iCj/WHxJvuwvSVx4YUSw8HaCMvtBI6hsxrjh9Gsef0+hPBA5cwkt3aIxXhaq9c3
 NJD5ICMCCI9RL5XDrCp6Xfv/ie4iqNJ+z8clvW2boPkVvilU7FPq9PIVJSjKghFQ7sVG
 eZ4Qj7vHVoG33Mx7GjzQDpa//6VxiWwcpoGgUJL3nh+2lGWN638MQzXY+j7BbnDmWocy
 OvkOx3pk1sYLl40lVQfw5/GChU4oEseYs3BpYoW0szd+459NLHqo9M/nMn6NkzfRbifY
 fGxI8ifEhUZ+jsl6aXx/mAFkz5TnJCIWkUrrrhzJIgw4w4fmkkJwTwFme/X7tUIE5Z9A
 /l5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684909132; x=1687501132;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zXP9bbbfnrujl2z83OZx0ev2hu3VaP9qwcc8H6TTGA0=;
 b=disZAseFGkt6EcAN3lhvPPWEPBZBQA0IA93sdKwDItkjNrYyKeMwHxXJmQpL8Nqdqr
 CcQrw+PBdhNiR5Ek5tQSp8bnbFJNz46n3+XjbRotrlkkrR7jaJONd85uK1smyiq6B+hk
 tHTO24STpzck1e8sSnDxnpUKre2uzklBvrwZiwTPKqZ6mKvywhSree0ewMxgN42WQhX0
 Ey12p41P0yz5J71zaSvcPylx3dHfzKTN/ygIh5hwEjFrLa0TvvqA/RAoV0M7FEcqTE8r
 rbWP+aV/fsNtKuTmRR3dzBk3h57+cBX+adjTGBv5DqOHhaE6TBFGFLUPYk+JUqnIqagL
 DMMQ==
X-Gm-Message-State: AC+VfDyCYbFt+FMX6QZ+6zomOFCfUBPaSUA7ojYu9h9jKmYfv/Dt301o
 Xf6EsnxhvcehJLfeTL2RVDjfrA==
X-Google-Smtp-Source: ACHHUZ5I3TFqOw6PKkD+RMkkEsJ2IH3rrhc9rtmHTNqKYmYGpfaczk5SDqsUVy70bqlt6x9uOcXb6A==
X-Received: by 2002:a5d:618d:0:b0:309:53f3:6e3e with SMTP id
 j13-20020a5d618d000000b0030953f36e3emr11707907wru.69.1684909132476; 
 Tue, 23 May 2023 23:18:52 -0700 (PDT)
Received: from [192.168.215.175] (35.red-95-127-46.staticip.rima-tde.net.
 [95.127.46.35]) by smtp.gmail.com with ESMTPSA id
 j18-20020adff012000000b00304adbeeabbsm13197162wro.99.2023.05.23.23.18.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 23:18:52 -0700 (PDT)
Message-ID: <9be2cb0b-307f-2f33-8c7c-d8fad36a0b98@linaro.org>
Date: Wed, 24 May 2023 08:18:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v3 3/3] hw/isa/i82378: Remove unused "io" attribute
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20230523195608.125820-1-shentey@gmail.com>
 <20230523195608.125820-4-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230523195608.125820-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 24 May 2023 06:18:58 -0000

On 23/5/23 21:56, Bernhard Beschow wrote:
> The attribute isn't used since commit 5c9736789b79ea49cd236ac326f0a414f63b1015
> "i82378: Cleanup implementation".
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/isa/i82378.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



