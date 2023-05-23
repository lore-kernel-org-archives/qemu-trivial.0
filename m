Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q1Wfo-0003Kt-Nb
	for mharc-qemu-trivial@gnu.org; Tue, 23 May 2023 14:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1Wfm-0003IB-3o
 for qemu-trivial@nongnu.org; Tue, 23 May 2023 14:23:50 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1Wfk-0003G6-EZ
 for qemu-trivial@nongnu.org; Tue, 23 May 2023 14:23:49 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-64d3bc502ddso115309b3a.0
 for <qemu-trivial@nongnu.org>; Tue, 23 May 2023 11:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684866224; x=1687458224;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZeUMxqK2a0mu+0TJQHf1Ip6p3nNOkf26yqQPPbHPByQ=;
 b=Q97y8woPiLfMXj4qu1nr52H6yESJIndqAu4KXxkOky47RC/Kq4GFXh7ilLECmMC+18
 ZgS6pT7GwG+b71Z13XkFNo3o0TDD0QSwlu7DsRtJo4uS+xZViKEgCHE6KeVtaP00bgeZ
 SzHf6JSLuFajahRJ+FZOQaN9bqTgq/1oOtvw+Q5MxMIOdf36GMS/pyQKAspdHtRkX5G9
 mL3gK4+EzkenMNT17UbGvCL8KPUzB7Fcftn9qrgSNs5WYe6Gix2PWct5gX/2aKn/hVpU
 JaomVtvN39ELFIr5yX1e+xwlw/OT7PlI9P3xDNNExNLcTyzBGLKmIHdWQA1hG/Tlu468
 XFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684866224; x=1687458224;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZeUMxqK2a0mu+0TJQHf1Ip6p3nNOkf26yqQPPbHPByQ=;
 b=RZvN6WFAqTfHocmcnOkewhUnn4WPu+vP4MBdqOBrja2aYBsP7N3oBY3qKRqAWuxkmj
 c1+mwJzsq3QTtukxzZMY5YU6S+LnA3xFTMdkFxocYO6JwEgpwauzxEH9Y2bg+yvEIX+m
 wWuM6rBUT6jg+Zu9hABkBrPLL4y6TmLFR+hl3xtSXmOQR8nnfcRxXJRC4eqcihRXnyL8
 64uYvlVC3gy+yq651Ulp/Wvx+itB7+lXQpEaLrY7zBwrYLE8TMkNl1B3BLSMGtU2HX7w
 DsptlX3NuXkKdi7J0RzCriTPJBxwoZmu0f3GiHDLvPB7cJ2E3rmJM6oob7jRi/XTeHwf
 Mnhg==
X-Gm-Message-State: AC+VfDwVGwKpZ2mcN/cTFd4KgU+zzmmbl3v6wtKUiPgONV9yJ2r20U7F
 6CaBlIM9WOMcjaYYY8r1wnryYw==
X-Google-Smtp-Source: ACHHUZ6rvQl2uTHmz6YVzvO1tbphNz7W9BlFxL1zKtQW+AHNfdrjYqfaRv8kDbxaXwCUjsgXoyzZpg==
X-Received: by 2002:a05:6a21:6d9f:b0:10a:e388:fcb5 with SMTP id
 wl31-20020a056a216d9f00b0010ae388fcb5mr14163944pzb.13.1684866224659; 
 Tue, 23 May 2023 11:23:44 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:c13a:d73:4f88:3654?
 ([2602:ae:1598:4c01:c13a:d73:4f88:3654])
 by smtp.gmail.com with ESMTPSA id
 bs5-20020a632805000000b0051eff0a70d7sm6245240pgb.94.2023.05.23.11.23.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 11:23:44 -0700 (PDT)
Message-ID: <fb306418-0f6d-1b5d-6d48-16d8319f1eed@linaro.org>
Date: Tue, 23 May 2023 11:23:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/4] hw/pci/pci: Simplify pci_bar_address() using
 MACHINE_GET_CLASS() macro
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230523061207.48818-1-philmd@linaro.org>
 <20230523061207.48818-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230523061207.48818-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 23 May 2023 18:23:51 -0000

On 5/22/23 23:12, Philippe Mathieu-Daudé wrote:
> Remove unnecessary intermediate variables.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/pci/pci.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

