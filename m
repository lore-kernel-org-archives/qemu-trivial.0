Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUZTI-00075r-AE
	for mharc-qemu-trivial@gnu.org; Thu, 08 Apr 2021 14:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUZTG-00074a-NZ
 for qemu-trivial@nongnu.org; Thu, 08 Apr 2021 14:33:38 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:42858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUZTC-0001pH-AR
 for qemu-trivial@nongnu.org; Thu, 08 Apr 2021 14:33:38 -0400
Received: by mail-pg1-x52b.google.com with SMTP id g35so2005014pgg.9
 for <qemu-trivial@nongnu.org>; Thu, 08 Apr 2021 11:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WgwC6+hFz+TB3NYM6gJhEjKyEs4qCMPETynqq+oMI90=;
 b=EmSSTWyRhagPmB4HheTS5kAyfM6XI24okBFT+svJ8KELdW+JEjHHc9xryV4VQukJhV
 4YwCppmm/KLoG2CVBwz2FTlwv5//Sai+H4Cdj5ItdY3ibLPTKiW0TOxLc0DoHn3+ajdZ
 8VMj6JFTpHhjdnG195ZEHjBksIwND8XGMfH18RV73RwqjPCwovhYP6Q9kOjPTZZpED63
 MnQfqQXrksG56RW5m81nfefRhQjPz7Kf+k5TD+DHEv6V7jhkofgolzmVtpI9TCXuLXtp
 WLXcIbXIuFgxlfECAixzQfMTaDPIpjZ+sb1Leue5VdCS0btraxvp5B8iThtxWIGHs6of
 FA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WgwC6+hFz+TB3NYM6gJhEjKyEs4qCMPETynqq+oMI90=;
 b=JsSoAoF4yWpXnI9z+4IXSuuhvwOkBqU7D5Hdp7TTWcwIAbaymWSrKEuhzSd8O2dN4h
 UxHoxLynX7Z7i+n5mY5hbsX2NNxA3ZN/Bjyt6NVyzZvXQZwCxYpu5G6la8xTBujsQKWW
 d1EpRWXacDEcAvXT3pUIxvoINUiAnzYQzUsJXcCH/zP/EWUBce77VG+1LgjuR2ZFzO0k
 bDCdZPUa5IRj9TmsKxP0D3svlffhuf5gtTF8g9yYU3FFEFlZQeAb5Bkhpl03gCoDGWka
 f0DvFsmzDVsf8DamANO5poAVXHZqEjJcAWMbR8Czcnm59biSDkDg8pmiWu+bGhqOfyPN
 EfRg==
X-Gm-Message-State: AOAM5322+0fmB0vRzdJtXRblT44Q+pi8mvsafx0ZPoKLUX1eELSY9YwC
 NHzP50jRxBRqeKgKSGxeJ4f74g==
X-Google-Smtp-Source: ABdhPJwtjUcHE1s2tBeINH5eFatV/aZtDToNEE6YmWCtXBNlgo37UTQgvDcOWFIUDYX1i7OxS3DGTw==
X-Received: by 2002:a63:eb50:: with SMTP id b16mr9127532pgk.270.1617906810785; 
 Thu, 08 Apr 2021 11:33:30 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id w134sm168281pfd.173.2021.04.08.11.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 11:33:30 -0700 (PDT)
Subject: Re: [PATCH] vmstate: Constify some VMStateDescriptions
To: Keqian Zhu <zhukeqian1@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, wanghaibin.wang@huawei.com
References: <20210408140706.23412-1-zhukeqian1@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <65ecfe1d-4a88-e432-7689-390c76e64d45@linaro.org>
Date: Thu, 8 Apr 2021 11:33:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210408140706.23412-1-zhukeqian1@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 08 Apr 2021 18:33:39 -0000

On 4/8/21 7:07 AM, Keqian Zhu wrote:
> Constify vmstate_ecc_state and vmstate_x86_cpu.
> 
> Signed-off-by: Keqian Zhu<zhukeqian1@huawei.com>
> ---
>   hw/block/ecc.c           | 2 +-
>   include/hw/block/flash.h | 2 +-
>   target/i386/cpu.h        | 2 +-
>   target/i386/machine.c    | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

