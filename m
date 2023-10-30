Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qxIsk-0000KZ-Si
	for mharc-qemu-trivial@gnu.org; Sun, 29 Oct 2023 23:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxIsj-0000KL-FG
 for qemu-trivial@nongnu.org; Sun, 29 Oct 2023 23:24:01 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxIsh-0006wP-UQ
 for qemu-trivial@nongnu.org; Sun, 29 Oct 2023 23:24:01 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-53db360294fso6676715a12.3
 for <qemu-trivial@nongnu.org>; Sun, 29 Oct 2023 20:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698636238; x=1699241038; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TUZOix7+S8UCeIxe9GrXyoIQmjmVxlOACYTBe+fKbC8=;
 b=dwTDjxbBSpvszEPAjqoCzlNC0dYJQP/hxe8owDLhjouYX5/jlffT9MgHEQGQKV9kLz
 Hae01k4Rua7lfBYDvaLp8T1zEWs4Ixfa7C8UGWYudE//LM2Z4681E9VWqym1GqvD/puh
 bm11kHrJrAi3hrW0Ahxw73VykrICmrHErlbFzhi29mpwVfcdu8nlM9q61VtZkOrnXHay
 NK+eVdHemBBLHU1jKg3F1U8Czr8OuLtb505L3dcpuni89Ugn2vCSK6Am/NAQti3m0m2q
 uVlIoalBwPqUQrnbG1zzWUZrHvPx009kVvkyGRgbVKsYpcwcp3p3LgewHXFyDZWMk6h+
 DjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698636238; x=1699241038;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TUZOix7+S8UCeIxe9GrXyoIQmjmVxlOACYTBe+fKbC8=;
 b=ro6dNRjqansIr3dzUwM+E/h2OwWsL6K6iQJ+UqmjxvN+LBDcP6c0c88YNFNyAF4+HS
 IJogLiLNZP0dC+lvKCCGNYqtyyVlhhegV3z6Ax5MvlLgpEb9svrIzdffbscvgl47Y7tO
 xQF+ILSlhXbSRXMKEojxWyuQT9/ndV2fD+Q4ijCf4DoXbffp0J96ZfuKUevRQoRfvLs7
 gGbtRF621dH/lDQUWjKtYB/7F/0ckOEl6ONrlOvLC9PYv4oQ5W1hRolrY0ye6o9qaKeE
 i4m+MIpdLBGJB9kTwumOaowmb12rYlNKypbZh7j09cWlj2GgL0+bdtrdkAQ8EI9V2g+J
 DAzw==
X-Gm-Message-State: AOJu0YzLfSKBRqzQkU70ZAXPwzzkQRtTZmb3qsLZnwaAqHZ1Nq9W6Z4s
 Xh8Yt5sbD+cyOckeo6K5zI2Obg==
X-Google-Smtp-Source: AGHT+IF8oDqO0yfFFVdns9uvWb9dJT45/e7BRbmxIluTDCdBqc1FFZjC+LLSz0Q07ac7HzVtZd+nrw==
X-Received: by 2002:a17:907:2cc3:b0:9bd:bb63:49db with SMTP id
 hg3-20020a1709072cc300b009bdbb6349dbmr8459604ejc.7.1698636238037; 
 Sun, 29 Oct 2023 20:23:58 -0700 (PDT)
Received: from [192.168.69.115] ([176.170.212.50])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a170906541000b009adc5802d08sm5286362ejo.190.2023.10.29.20.23.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Oct 2023 20:23:57 -0700 (PDT)
Message-ID: <7e52e29c-46c8-483c-cf5a-b6e6ca18c655@linaro.org>
Date: Mon, 30 Oct 2023 04:23:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 4/6] hw/misc/imx6_ccm: Convert DPRINTF to trace events
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Mads Ynddal <mads@ynddal.dk>, Paolo Bonzini <pbonzini@redhat.com>
References: <20231028122415.14869-1-shentey@gmail.com>
 <20231028122415.14869-5-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231028122415.14869-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.972,
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
X-List-Received-Date: Mon, 30 Oct 2023 03:24:01 -0000

Hi Bernhard,

On 28/10/23 14:24, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/misc/imx6_ccm.c   | 41 ++++++++++++++---------------------------
>   hw/misc/trace-events | 15 +++++++++++++++
>   2 files changed, 29 insertions(+), 27 deletions(-)


> +# imx6_ccm.c
> +imx6_analog_get_periph_clk(uint32_t freq) "freq = %u"

Preferably explicit the unit, as "freq = %u Hz".

> +imx6_analog_get_pll2_clk(uint32_t freq) "freq = %u"
> +imx6_analog_get_pll2_pfd0_clk(uint32_t freq) "freq = %u"
> +imx6_analog_get_pll2_pfd2_clk(uint32_t freq) "freq = %u"

> +imx6_ccm_get_ahb_clk(uint32_t freq) "freq = %u"
> +imx6_ccm_get_ipg_clk(uint32_t freq) "freq = %u"
> +imx6_ccm_get_per_clk(uint32_t freq) "freq = %u"
> +imx6_ccm_get_clock_frequency(unsigned clock, uint32_t freq) "(Clock = %d) = %u"

'freq' is uint64_t, but I suppose 32-bit is enough, so I'm
not against the implicit cast.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


