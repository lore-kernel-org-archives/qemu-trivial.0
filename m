Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r1AQb-0000uu-D1
	for mharc-qemu-trivial@gnu.org; Thu, 09 Nov 2023 14:10:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r1AQY-0000uQ-VZ
 for qemu-trivial@nongnu.org; Thu, 09 Nov 2023 14:10:55 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r1AQX-0001s1-IH
 for qemu-trivial@nongnu.org; Thu, 09 Nov 2023 14:10:54 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-53de0d1dc46so2045235a12.3
 for <qemu-trivial@nongnu.org>; Thu, 09 Nov 2023 11:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699557051; x=1700161851; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mdoA4bCOHV2xbFNH5vfe2cP2TsA1ItA50LkkszW2hqI=;
 b=iRS3CuV9GNmC6YyIAvgnMy5KcA5u5DMcfbbO1bZgkWURt/erhhwbV3yTMeNmO1+/gI
 YBHelgzomVE7+YSLVCW4nzdZ/anZ4mv88UG+rWKDcBbx0l5xay07q013xIBbZLcrVevg
 vsGw/RaV1eoICL1bdDaFqhYYjlvsXJ36fUJPUr5JgJJVqy7LmVdzXpvL6FZQhYCIWI1S
 T7g6Rlt38F1EM71nYBTWyu9km2KjNu93opsHqwwzPtYa0dlFFLloS3rRO4B/LWL6+ilC
 y6xMVTvRmk3mcN9g+uGI41SD1uNA2kWLEzVwKeitKFw+dc8bD6G7aKz/ZMmqFcs99rQG
 gD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699557051; x=1700161851;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mdoA4bCOHV2xbFNH5vfe2cP2TsA1ItA50LkkszW2hqI=;
 b=b91sHAVKMxcTO3q3UiIvMMGt/XxlSQakrfH8hS25uLD/nvusmoMMqgHEqnFmckz51K
 OnCCJkbW3ooKiyc0lS9v/Ya4hXA945bS1x5FNuaPw9tTVDw/fSRAUSPGJ+cX8rhucxtL
 TnvbFyoNPrk2jxrHSA9DVvCzYKgGU+expwKwYvrLoOTr7rBWpRNPBg9UZJmcHTXCFVIF
 +wmY8GOoIMephfMaC3qroYmuF7vj5SmbvOy/Pw/sZ/olJTWgp0q8QTvSqunOS1n5cHvj
 /7H7kgG2Tke99MK+bpLlgjhyUTOf86VXXblQlNrTj5E70C43+QMMuw2S4uiylR3TmDXl
 Vt8Q==
X-Gm-Message-State: AOJu0YxWAJBp4FVcbAPcloYDm96kmYVoDhjjcuWc/FcpGOKy6m+Tz8eP
 ei9EvVFN/PxkquyXyVUIltsjNaZ04CFsop0lym/dOg==
X-Google-Smtp-Source: AGHT+IGQWLbS6fjT5uskXK5uqeX2dyiUo9uxOjYP+c47qUmCU1v4YNvZ6Y3IS8TXn8wbpntUm+aJhg==
X-Received: by 2002:a50:9508:0:b0:543:8391:a19a with SMTP id
 u8-20020a509508000000b005438391a19amr4551354eda.40.1699557051247; 
 Thu, 09 Nov 2023 11:10:51 -0800 (PST)
Received: from [192.168.69.115] ([176.187.199.161])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a056402516400b0052febc781bfsm166756ede.36.2023.11.09.11.10.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 11:10:50 -0800 (PST)
Message-ID: <d66214c1-fea9-418d-8497-4a3f2da1e734@linaro.org>
Date: Thu, 9 Nov 2023 20:10:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] include/hw/xen: Use more inclusive language in comment
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org
References: <20231109174034.375392-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231109174034.375392-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
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
X-List-Received-Date: Thu, 09 Nov 2023 19:10:55 -0000

On 9/11/23 18:40, Thomas Huth wrote:
> Let's improve the wording here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   include/hw/xen/interface/hvm/params.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



