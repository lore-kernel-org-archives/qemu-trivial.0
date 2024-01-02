Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rKgO5-0001hk-HQ
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jan 2024 10:09:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rKgO4-0001hA-D8
 for qemu-trivial@nongnu.org; Tue, 02 Jan 2024 10:09:00 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rKgO1-0000wm-JX
 for qemu-trivial@nongnu.org; Tue, 02 Jan 2024 10:09:00 -0500
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50e7af5f618so6687565e87.1
 for <qemu-trivial@nongnu.org>; Tue, 02 Jan 2024 07:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704208135; x=1704812935; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J7Tq9QtgITf1V5dEA4XQbNPEPX/yCoTUWLmNnJyV6yI=;
 b=xNY8KlsCiKdR/dKI88opLPrm28l03/ZElUnU97UeTexmMT54aXcSSrKTWJ1bnqI0id
 CbeIe6HadrhHOnVlPWRjsXgTfh4IQKleRJDeIGB4MKisQKKGhkmnZZhSkLPgqgnkg5gu
 lNkm7h9iJfyX+gudtrahOusLSeLxwhx8gvraJX6HtaSMTkVljBWnE7BJjJWFuclLpqZn
 FQ594P2swLbcfB+JggZ7ip2NtPgFVWOLeKwQTU1yn7n3PQq0rm96YpTmLrRq0uNJ/DFr
 JnrTBHmtG6LoVb0l+FE83O2uqnjqltzjtNJfyB3fc24lEBMRsRM99wm01b5bFY/mb/Fr
 D7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704208135; x=1704812935;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J7Tq9QtgITf1V5dEA4XQbNPEPX/yCoTUWLmNnJyV6yI=;
 b=d/mpJRI/ZA5nNdhYxtGp12nkoi98wrhta2+284nfOEh3PLnZBh53d7Ny0xCr21BFHq
 fWsrJk0qblbGnq6jYuduVw2LdVYwYI3MwZRy0bpEoKV4v8yM7C5dQN+j2w+v+XBfef9h
 YdQpn7YefVUj0yz19IVp/YdjwbvkWesXrpLJMy6JrOb4avtjqNl/eT0BmFUxEDtGcGqz
 vFh6RV2hAee7yLDt2FFe35Q/TnHfQiPBI65QCf7EOcuPMgaxL210AzhCAnUdOyZVufIG
 zA7Ijqbng6HSYjCRflYfiEeQ5rQctb2v4LTA7YC6EfBQiTHM9oxcltsJdQnUQOiQpHW+
 EvKQ==
X-Gm-Message-State: AOJu0Yy6FHIXCaMj+Ie26e3u10ICvaUrMogzjZvQB5XYe8y2Uft4zI1S
 IXDm5H8b9PdSD+YmAUrxS2JCXs0KJsVYDw==
X-Google-Smtp-Source: AGHT+IGAByqF8gx3Q5Y/SXLiyjnnY7ZEYqkNG8ikWH782h3MP0VLzZWDbJ/rzZdLzn0ZuQaN+iGLKA==
X-Received: by 2002:a05:6512:3b83:b0:50e:7b37:d110 with SMTP id
 g3-20020a0565123b8300b0050e7b37d110mr5949366lfv.16.1704208135402; 
 Tue, 02 Jan 2024 07:08:55 -0800 (PST)
Received: from [192.168.69.100] (sal63-h02-176-184-16-71.dsl.sta.abo.bbox.fr.
 [176.184.16.71]) by smtp.gmail.com with ESMTPSA id
 qc28-20020a170906d8bc00b00a279b182e42sm4026491ejb.171.2024.01.02.07.08.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jan 2024 07:08:55 -0800 (PST)
Message-ID: <985e87d6-0f8c-4127-b425-f1efc6034879@linaro.org>
Date: Tue, 2 Jan 2024 16:08:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 8.2.1] hw/net: cadence_gem: Fix MDIO_OP_xxx values
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, Luc Michel <luc.michel@amd.com>
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Sai Pavan Boddu <sai.pavan.boddu@amd.com>
References: <20240102141803.117631-1-bmeng@tinylab.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240102141803.117631-1-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 02 Jan 2024 15:09:00 -0000

On 2/1/24 15:18, Bin Meng wrote:
> Testing upstream U-Boot with 'sifive_u' machine we see:
> 
>    => dhcp
>    ethernet@10090000: PHY present at 0
>    Could not get PHY for ethernet@10090000: addr 0
>    phy_connect failed
> 
> This has been working till QEMU 8.1 but broken since QEMU 8.2.

s/till/until/?

> Fixes: 1b09eeb122aa ("hw/net/cadence_gem: use FIELD to describe PHYMNTNC register fields")
> Reported-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> 
> ---
> 
>   hw/net/cadence_gem.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 296bba238e..472ce9c8cf 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -199,8 +199,8 @@ REG32(PHYMNTNC, 0x34) /* Phy Maintenance reg */
>       FIELD(PHYMNTNC, PHY_ADDR, 23, 5)
>       FIELD(PHYMNTNC, OP, 28, 2)
>       FIELD(PHYMNTNC, ST, 30, 2)
> -#define MDIO_OP_READ    0x3
> -#define MDIO_OP_WRITE   0x2
> +#define MDIO_OP_READ    0x2
> +#define MDIO_OP_WRITE   0x1
>   
>   REG32(RXPAUSE, 0x38) /* RX Pause Time reg */
>   REG32(TXPAUSE, 0x3c) /* TX Pause Time reg */

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


