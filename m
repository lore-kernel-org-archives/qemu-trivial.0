Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r6Y8r-00051K-Fg
	for mharc-qemu-trivial@gnu.org; Fri, 24 Nov 2023 10:30:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6Y8c-0004vJ-2K
 for qemu-trivial@nongnu.org; Fri, 24 Nov 2023 10:30:41 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6Y8Z-0005qa-Dq
 for qemu-trivial@nongnu.org; Fri, 24 Nov 2023 10:30:37 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40a4848c6e1so14006395e9.1
 for <qemu-trivial@nongnu.org>; Fri, 24 Nov 2023 07:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700839831; x=1701444631; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4FeMLTTF9cDZ7eRRNAJVlSJwXuVI906lL/BAvJXNtHI=;
 b=ixZTzv0cbn3cro47XdZSypoFCaT+KlNGcA1FUHBf45ywQo3QaEWIsPJK6eTL8uINln
 7atOoGEQXrDanV5HG76kLd7b8pW+/RlSL+Ig8wO0RlOy84fgYFvflbq2vW85UW/7RA9r
 ETdfWoAPRYO7MBwzbSLRdWV5jH52zthuFs+kxvzahWmDYYAFSLyOfGvf/Bd1pXIt8UWb
 RQbl8httiITJtT92iBP+JH9/gnsExjS6VUbf5TU/VcoXpmXd/YqlNAxKbzjwJsCZmt8G
 StSd6LmBC2FlrIw4UucFgkJUre67CjQq5By0gJnO3Xt8MMhoEXPyBXRqJ6Z+W4H2YrSS
 mOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700839831; x=1701444631;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4FeMLTTF9cDZ7eRRNAJVlSJwXuVI906lL/BAvJXNtHI=;
 b=O4SdTu1H5sv6fB9rVf8IguI8O+MnX9yZvF+yLCr5NkPDWEDT+VVLiGB2dYLzsYUxXA
 V5u0T032UZWxzF5GQIk9FKvChjsCvvHHP9dDEXAiIgx/jAt899gTLtZGKvAKZmdSpBBW
 f3cRU26bf17KTXONLDqGZTndcJhvbSwUm0l/ghit+hQABUeF0Nw4vL384F3fAfJCCSaf
 ToOL4ll0tXaRAXy0z0EhxiEYkR6n69g5U/pIQBradjR6UaResezglRUKp5ggiiSsHKEZ
 QoV7qnsMFiVOsfoAtXvrk/c8bXV9HLCONvskf6mpyWp4B1pPt7Lura9YRkwcujrdmLQj
 rGTw==
X-Gm-Message-State: AOJu0YybmRGBy+89Guyc7Nmg0y+g1WQua4kq56jdU+d2SmbIUCKQurKm
 huqVRwUYr1p866hH7lKKMB80iQ==
X-Google-Smtp-Source: AGHT+IEdvKwGzQ/wXlNwk2E5C1YFSDLYQyUJLVmzBlj2vL37/sWPk9QDk4yhj0PqWgEtxUqUX2w2/A==
X-Received: by 2002:a05:600c:45cf:b0:3f6:58ad:ed85 with SMTP id
 s15-20020a05600c45cf00b003f658aded85mr2796106wmo.10.1700839830677; 
 Fri, 24 Nov 2023 07:30:30 -0800 (PST)
Received: from [192.168.69.100] ([176.187.218.17])
 by smtp.gmail.com with ESMTPSA id
 k24-20020a5d5258000000b00332d04514b9sm4513296wrc.95.2023.11.24.07.30.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 07:30:30 -0800 (PST)
Message-ID: <2ba80e3f-c13e-406b-a365-37841ff655b4@linaro.org>
Date: Fri, 24 Nov 2023 16:30:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sh4: Coding style: Remove tabs
Content-Language: en-US
To: xun <xun794@gmail.com>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-trivial@nongnu.org
References: <20231124044554.513752-1-xun794@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231124044554.513752-1-xun794@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-List-Received-Date: Fri, 24 Nov 2023 15:30:47 -0000

Hi,

On 24/11/23 05:45, xun wrote:
> From: Yihuan Pan <xun794@gmail.com>
> 
> Replaces TABS with spaces to ensure have a consistent coding
> style with an indentation of 4 spaces in the SH4 subsystem.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/376
> Signed-off-by: Yihuan Pan <xun794@gmail.com>
> ---
>   linux-user/sh4/termbits.h |  204 +++---
>   target/sh4/cpu.h          |   80 +-
>   target/sh4/helper.c       |  236 +++---
>   target/sh4/op_helper.c    |   70 +-
>   target/sh4/translate.c    | 1466 ++++++++++++++++++-------------------
>   5 files changed, 1028 insertions(+), 1028 deletions(-)


> @@ -241,17 +241,17 @@ static int find_tlb_entry(CPUSH4State * env, target_ulong address,
>       asid = env->pteh & 0xff;
>   
>       for (i = 0; i < nbtlb; i++) {
> -	if (!entries[i].v)
> -	    continue;		/* Invalid entry */
> -	if (!entries[i].sh && use_asid && entries[i].asid != asid)
> -	    continue;		/* Bad ASID */
> -	start = (entries[i].vpn << 10) & ~(entries[i].size - 1);
> -	end = start + entries[i].size - 1;
> -	if (address >= start && address <= end) {	/* Match */
> -	    if (match != MMU_DTLB_MISS)
> -		return MMU_DTLB_MULTIPLE;	/* Multiple match */
> -	    match = i;
> -	}
> +        if (!entries[i].v)
> +            continue; /* Invalid entry */

Thomas, better fix the 'if { }' in this patch or a following one?

> +        if (!entries[i].sh && use_asid && entries[i].asid != asid)
> +            continue; /* Bad ASID */
> +        start = (entries[i].vpn << 10) & ~(entries[i].size - 1);
> +        end = start + entries[i].size - 1;
> +        if (address >= start && address <= end) { /* Match */
> +            if (match != MMU_DTLB_MISS)
> +                return MMU_DTLB_MULTIPLE; /* Multiple match */
> +            match = i;
> +        }
>       }
>       return match;
>   }
> @@ -265,7 +265,7 @@ static void increment_urc(CPUSH4State * env)
>       urc = ((env->mmucr) >> 10) & 0x3f;
>       urc++;
>       if ((urb > 0 && urc > urb) || urc > (UTLB_SIZE - 1))
> -	urc = 0;
> +        urc = 0;
>       env->mmucr = (env->mmucr & 0xffff03ff) | (urc << 10);
>   }


