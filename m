Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqy7l-0000hT-70
	for mharc-qemu-trivial@gnu.org; Mon, 24 Apr 2023 11:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqy7k-0000ZO-JV
 for qemu-trivial@nongnu.org; Mon, 24 Apr 2023 11:29:04 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqy7i-00078d-WB
 for qemu-trivial@nongnu.org; Mon, 24 Apr 2023 11:29:04 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f173af665fso29537465e9.3
 for <qemu-trivial@nongnu.org>; Mon, 24 Apr 2023 08:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682350139; x=1684942139;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SeO4Ee8PnhXOG96p6S1hHt+Ms53XU3EnnJq+Jqqlcrs=;
 b=AHKAZynhYJkH/5dJ4KeLsMoOFcWexuB9zT891npxw2WzmmWHwtqpXyoEfz1RDir1TS
 JjPMQwgS57JgHdB1CXVOhZ4B9r//iLWAkBiroUjL22BYL5ehsGU3qYfC8m8VAiUWs6A7
 oDCfJxAE4n76/pSUM+rPWVS5BYQeI38VpT3D2KxrZ3SSAM5bfAl+gsqWgrEJBfuxdJgr
 MKKLlMDbyz6Y5S6dyBMuDleOS+20bJ0pV7qRDsyui9TuDdyFMYoFO5sZBg62MvE4dJVP
 mpFoTLTa4xPDJ2TPZ5MutXclFQ0IJrtSQiriicaYTxU1U1RI3QxsZqsHMUf2Zh9ugV1V
 y/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682350139; x=1684942139;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SeO4Ee8PnhXOG96p6S1hHt+Ms53XU3EnnJq+Jqqlcrs=;
 b=VqWySze+UpWD8ALviZ9U0/wIgzzCHkobIJUi4EiOP9KRLFpu/RuIPFopY2q2Z77R5I
 mRZqM7u8OcVABojk0F+HreTy6N7FY2Or4wrP+wyulDZ0b0zdlV0TJbq0uMrBltAv6p+P
 xNtSOwsSOgrZSj5ygRJh8GCDPaLLHpXcZc9IrtzNnlGuU9PzFYxUskIsSSTh6jAEdPcM
 jHgcIv90kIQRkH+pz2SZajUt6s8Atf2lIf6nhRx1P9xdczWVmfv40BjuZ+MCFxjbewk0
 0r3XQ+1RaULSt/bqu9Iq2fOspzYBL/SnVY4E4xzoKlx7MvFm5gLzAoAXsrkoYGTeG/UD
 CmYw==
X-Gm-Message-State: AAQBX9d+faubbNZTX1EfoePaOtMyv6dO3amiSUK4npHS0NKuN2x/mLgF
 /esrzsccx30ZGXl2toO+bmct7A==
X-Google-Smtp-Source: AKy350Z5Go8s+YD0EBmclfGq0CTDDAm2TV7BBUYFpklxsfQNVWOo6Yi7v3NU0DoBFPozLRqtPHFgJQ==
X-Received: by 2002:a05:600c:2204:b0:3f1:75b3:60df with SMTP id
 z4-20020a05600c220400b003f175b360dfmr6951519wml.41.1682350139072; 
 Mon, 24 Apr 2023 08:28:59 -0700 (PDT)
Received: from [192.168.2.175] (230.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.230]) by smtp.gmail.com with ESMTPSA id
 u3-20020a7bcb03000000b003f16f3cc9fcsm12474438wmj.9.2023.04.24.08.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 08:28:58 -0700 (PDT)
Message-ID: <a493d531-ab8a-f62c-698e-935c634db89e@linaro.org>
Date: Mon, 24 Apr 2023 17:27:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] linux-user/main: Use list_cpus() instead of cpu_list()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Cc: qemu-trivial@nongnu.org
References: <20230424122126.236586-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424122126.236586-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
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
X-List-Received-Date: Mon, 24 Apr 2023 15:29:04 -0000

On 24/4/23 14:21, Thomas Huth wrote:
> This way we can get rid of the if'deffery and the XXX comment
> here (it's repeated in the list_cpus() function anyway).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   linux-user/main.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


