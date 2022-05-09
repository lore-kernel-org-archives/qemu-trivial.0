Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1no4CF-0008BF-8L
	for mharc-qemu-trivial@gnu.org; Mon, 09 May 2022 10:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@fungible.com>)
 id 1no2D2-0005Pm-Tv
 for qemu-trivial@nongnu.org; Mon, 09 May 2022 08:09:53 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:38432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@fungible.com>)
 id 1no2D1-0003Fz-46
 for qemu-trivial@nongnu.org; Mon, 09 May 2022 08:09:52 -0400
Received: by mail-pf1-x436.google.com with SMTP id g8so12069834pfh.5
 for <qemu-trivial@nongnu.org>; Mon, 09 May 2022 05:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fungible.com; s=google;
 h=from:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=kagD1Vxj+fpjsKOKtPHHAaHhT/bk0wz63NTd8FuFJio=;
 b=hNPjfP6lW2Uitl6VTY4+Oz0XGygvq4uwT3PwQJrKy+ref9bVzxmC/mzhPMp0+uPA+N
 1iMTA+CjRaBC8XxUw2YSX+CnqLs8dOurKDHCoPZp1nAiSn19EkV5F6UYBycoVnjHQ/e8
 oL34mx2fc9QifhIa1sIrN5yXpysyBkbWgVU7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=kagD1Vxj+fpjsKOKtPHHAaHhT/bk0wz63NTd8FuFJio=;
 b=0j38FegCmk6i7hqG5x6G4IrvlXdYBsrwd+vIjXIphyNglTc8XoodG+5ogmZa42i9RX
 Zz+1UbwsutJbCBALjh2mjEyr/HzLaDLUuSKGDyg1pF1Vabo2D+8gwBqFR1qlU7RvHMqL
 p1IGZNTwlrZYc3JIRhu/BC+/BBsJcLdb4aClw++Q9eo82I7BPDy26p7mROstOdQg5MrE
 0iP7PuK7Yg3t+MR1JQRi97Y0q4vxwNNNSqK2/66RumxkFtuwFQTDgE99hUsboCmIJFdy
 X/sHbgyEspbP9rEw275xoz2DFjGkLpcopoCpL9Xw0ooEdcPz96Wws1Z0WXqGwrrVROuW
 Aa+g==
X-Gm-Message-State: AOAM532aMdua13RsiyFfKVCKqL4tvWN8uJg81KGkCnia+jajb5IeYII6
 SwubFB+nysHI7IMD7N9nldTSCA==
X-Google-Smtp-Source: ABdhPJx/cROHSaEG6k4u7PtZi96StGpKnUKPoZn4N+tk1vpe6e4W1M+HGImeBDBOYlDqMVXAzES/eg==
X-Received: by 2002:aa7:83c2:0:b0:505:723f:6ace with SMTP id
 j2-20020aa783c2000000b00505723f6acemr15767104pfn.86.1652098189544; 
 Mon, 09 May 2022 05:09:49 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a17090a458b00b001dd16b86fc0sm2366180pjg.19.2022.05.09.05.09.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 05:09:49 -0700 (PDT)
From: "=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?="
 <philippe.mathieu-daude@fungible.com>
X-Google-Original-From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
Message-ID: <a3748d2d-cdef-9c9b-35ad-16714df71adc@amsat.org>
Date: Mon, 9 May 2022 14:09:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 01/11] hw/rtc/mc146818rtc: Inline isa_connect_gpio_out()
 and remove it
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220505161805.11116-1-shentey@gmail.com>
 <20220505161805.11116-2-shentey@gmail.com>
In-Reply-To: <20220505161805.11116-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=philippe.mathieu-daude@fungible.com;
 helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 09 May 2022 10:17:00 -0400
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
X-List-Received-Date: Mon, 09 May 2022 12:09:53 -0000

On 5/5/22 18:17, Bernhard Beschow wrote:
> Commit 250263033c5343012b2cd6f01210ffb5b908a159 'isa: introduce wrapper
> isa_connect_gpio_out' introduced it in 2016. Since then, its only user
> remained mc146818rtc. Remove this one-off solution.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/isa-bus.c     | 6 ------
>   hw/rtc/mc146818rtc.c | 3 ++-
>   include/hw/isa/isa.h | 1 -
>   3 files changed, 2 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

