Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rcP82-000303-W1
	for mharc-qemu-trivial@gnu.org; Tue, 20 Feb 2024 07:21:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rcP81-0002zF-BL
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 07:21:41 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rcP7y-0005H6-GB
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 07:21:41 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4127011685dso2644175e9.1
 for <qemu-trivial@nongnu.org>; Tue, 20 Feb 2024 04:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708431697; x=1709036497; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f6oXI87+iR5ZssZLkFJMzREgIJ7tHfkviS3tT19oqAU=;
 b=w35XfhF8JZJsnbZ3eSSc/lYdXQcEuWvIZGMuMNiilCDgCVf2s2wgihlXJi8FLGrBZU
 KJVV7wCB12U6BLc5Ugw/gPL56/fHGgLcrz33GiPpWuObfK9OdpZgCbaV+8kDC/Oox4iS
 bJJ/UFjuMlGH7OsCOxIAlCFziBnt0cFlQGBTum8MnkEwPbK/uED5TAihDR3GBfpEY/b9
 y/QC7eVd/5qkJmo0qgL7vBdG1kgfMSv1PXVU1eNjfFnoEszZfmYI6cefs61wo4nzma2V
 SkpGtMQJCa5/5oBfqj2yCIEEnmgVPGEMY8vWUduEs7/OPKEArgod0EGSVlemQcE+UiRg
 Rmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708431697; x=1709036497;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f6oXI87+iR5ZssZLkFJMzREgIJ7tHfkviS3tT19oqAU=;
 b=wnSEUvlcFyl11Lx/2r0Ws9YlrXJKz1d95AbfsTHgK0NdurP6LfQoWW56mqvTKJDPCx
 aJOQ9adADXcIV2aKe90ZJybjuKGWT/yLzcPvNO1ugJ2kEzgoqCXHc0etE8EYoY42Y4oO
 5UqCdvVdOunoW0mQ7BVtx2BiVXXH6uMF7vqSpOI8qm17TcNrkL2HEkT7tNswCaIXrwSG
 dBppO70uH/vx0xhpjrwhAjS93beR2D1aNiPyBTzRVc97d/qbZPp5nOZF57qlhObZxeKN
 SWzeOAHMcwtKXaaJwuAhsSEdVVh/v0WI4AKcEAligv6kq3BxyddO5NGX2i1pEQnPAoZq
 TVyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkMvXR5hur0PPxkAq1aT6v97pYYuQoZ0mkFmUriLmGHKzzUUiMEUtVwLnQuMvYFrvIeEbizkX5Sa86T4qfji/SzGIyksnMRg==
X-Gm-Message-State: AOJu0Yw1vSF+hG6naG+td4kbtgvM+WlcY1Orqai11xtnAJjZnKqLGrhj
 X51yp3m8jXt1A2NpygF3/ZtfUBTX7XS7uvY0n+3ILq9Bst8DdHcZoGTWH67cYIk=
X-Google-Smtp-Source: AGHT+IF0FWUyyTfX2kAW25BFgitWBykWUI6UJ17L74ZHeXprfbZyNjwonhlollckUZDPfKveQOPfaQ==
X-Received: by 2002:a05:6000:1044:b0:33d:5661:4e7f with SMTP id
 c4-20020a056000104400b0033d56614e7fmr3487195wrx.42.1708431696950; 
 Tue, 20 Feb 2024 04:21:36 -0800 (PST)
Received: from [192.168.69.100] (mek33-h02-176-184-23-7.dsl.sta.abo.bbox.fr.
 [176.184.23.7]) by smtp.gmail.com with ESMTPSA id
 a7-20020adfeec7000000b0033b483d1abcsm13193952wrp.53.2024.02.20.04.21.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 04:21:36 -0800 (PST)
Message-ID: <b9afa983-56e7-44d9-815c-634b4e540be7@linaro.org>
Date: Tue, 20 Feb 2024 13:21:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 20/21] s390x: correct typos
Content-Language: en-US
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-s390x@nongnu.org
References: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
 <73c534c8b6cdd769ab4d0220f505da8ec7470983.1708419115.git.manos.pitsidianakis@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <73c534c8b6cdd769ab4d0220f505da8ec7470983.1708419115.git.manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-List-Received-Date: Tue, 20 Feb 2024 12:21:41 -0000

On 20/2/24 09:52, Manos Pitsidianakis wrote:
> Correct typos automatically found with the `typos` tool
> <https://crates.io/crates/typos>
> 
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>   target/s390x/cpu_features_def.h.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



