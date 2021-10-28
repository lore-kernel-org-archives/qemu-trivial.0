Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mg77v-0003ox-FF
	for mharc-qemu-trivial@gnu.org; Thu, 28 Oct 2021 11:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg77m-0003nn-DA
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 11:15:28 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:34776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg77k-0000Zr-Kv
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 11:15:26 -0400
Received: by mail-pg1-x52b.google.com with SMTP id h193so6721756pgc.1
 for <qemu-trivial@nongnu.org>; Thu, 28 Oct 2021 08:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hZynjcNZksCahEJ3jDWoedi8qTmHkUHby2Gd6UMXYRY=;
 b=NgafYgJCly9NV+XxeUnJ7icoT+yxFASDn8Tkld9QqhAJWVy3Jae1ucjmp47yS0z1yf
 FNKvF5e+WGrY0ncfxbt7kJtqiGB4f4TTv4tmk6ZlC3vJp+azswf7LgR+cZdQzOUawptN
 eBr7s3HBRaStsm0aDK7AIMRKAJ8Hl1eNbbKhPPXofJHzjS9OuJ1mIW+DgvP6ip6BdaaG
 d1TjAvZfKRxR9zcAtuamRmlXzW34+lwzd0L+EOu1+/TP0EQMXm0+cZqwUEf8dfy3MuWa
 si5Xh/ayaAH5IzzsL4qFdvXPjUK/AHWP9zikqg7Insu38aqyOd6hZqAp6rLSk7paq/Re
 7rww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hZynjcNZksCahEJ3jDWoedi8qTmHkUHby2Gd6UMXYRY=;
 b=AqDcI580sCKWrSmPc9D/qmCI5nXzvCOsgfguicaI/U8mdmk9KdydT16hM8fRAO6VCN
 mKBCXipTcpkgs0wbTX+iNgrvQkuoeGWBzpvHHrok1wO/JxMqpZ2Cx3cJIz6UgX8ASrsr
 +tTY5BPC9l1L5LUWx65bamh5GFE2K3VLAAxxeQD+kK9aZeVakUqmJF3VWGvAtppmOWlL
 acmqSrxCaCgE15Kw33a3dAcGgAONCYhAjj7pR0CWZtntZQBNFTASpkC/wXbmFpFpJ/G3
 46UK9TbkH5PRZy7sRUOeKYCVne4luZuBL4kaAXkvSMDeFOgHzBWQ7ViVxuj4/t3XK3th
 EVsQ==
X-Gm-Message-State: AOAM531X+KrhKIdAManZDz1PA2/6lO9HIAhMvWJ2plY9lkaLGF93YyAx
 ReXKtbGPDMi7VPJnkx0bi6vvvQ==
X-Google-Smtp-Source: ABdhPJwTsT2+Wn/Fqg/gIytEgDDPj1krDRsGHevEvZ3D4dG65fEgG2eK+ReUE9dUFxmgSKYxhB0WPA==
X-Received: by 2002:a63:8648:: with SMTP id x69mr751169pgd.438.1635434121602; 
 Thu, 28 Oct 2021 08:15:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k5sm4341465pfc.111.2021.10.28.08.15.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 08:15:20 -0700 (PDT)
Subject: Re: [PATCH 05/24] bsd-user/arm/target_arch_cpu.h: Implement
 target_cpu_clone_regs
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-6-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5d21fe60-9001-809d-b7f4-e8cac67da50e@linaro.org>
Date: Thu, 28 Oct 2021 08:15:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-6-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 28 Oct 2021 15:15:29 -0000

On 10/19/21 9:44 AM, Warner Losh wrote:
> Implement target_cpu_clone_regs to clone the resister state on a fork.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_cpu.h | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

