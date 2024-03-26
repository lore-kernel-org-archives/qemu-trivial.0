Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rp3Xm-0007ub-T3
	for mharc-qemu-trivial@gnu.org; Tue, 26 Mar 2024 05:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rp3Xk-0007o8-Re
 for qemu-trivial@nongnu.org; Tue, 26 Mar 2024 05:56:32 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rp3Xj-0006zW-BI
 for qemu-trivial@nongnu.org; Tue, 26 Mar 2024 05:56:32 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4148c6af2d3so7134125e9.1
 for <qemu-trivial@nongnu.org>; Tue, 26 Mar 2024 02:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711446990; x=1712051790; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qeE5IqzdinRWh6lTlE0AtWqMokUPKMdMOciWC6LfJAE=;
 b=q8Zk5Rb4OTLBovvAs3Ydr0Tp0rP7R9kZ5CGA2R57WElXnLxBIGQGMVbJLbVAHo7OAh
 X5BLsLe9ELPbCVa50LZTezQ/sHZiRvzcQtdFkbrs6hfUD6otd2EWQW7r0WUG74hyuItL
 ecOb6vVVxErVTwRaN2pjVdJ3xgHVzXIFHhq28pzK8bsQv/xbUNcE6YrUU7t1k/8cX8QD
 6t2ESk7Ymm8aQXAO5ynUzFTSLWk67z+3V1ukCxExrD825Ag2X/1cbntV7IIugGM0T6FK
 kVboPIup951wFvs50HRFU3qOLLqrw9/tI/Tgj0rFCIrVfWmxyDYo59y8JPnMR9ESgFHo
 sFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711446990; x=1712051790;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qeE5IqzdinRWh6lTlE0AtWqMokUPKMdMOciWC6LfJAE=;
 b=CVMSuKy0EItPb8Rz2X09/JL0u/lWV3fgTAIgQjpSXi8Cy1WNkSD0LqM4V8rMGw5J+T
 tQ7aZcpUFEgzhAbk6gHTcIfxSzxBR77qgqfJOFym1QcOVbONniYIBAX3B9Q/piLEuLBP
 pNkrUw/u4e6pPc5S4E6vVJokItuqiIVCuqdd/2s6QAmqEp27Dv23jLBw8suOmUtaHCaA
 iFB/WkhTIuEDZ96uAIl2wV5zQwhEwk97QRjpdHJqiXtwz6N+TFTse9gj0sgb0sagv8ac
 qrpTA2UG/5qFskb7V08a6jK/aMY0o/2DOiPM6EU2RojPZgia576QCbO6PSInYNIJ2iLA
 mjoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbbXXPpm0cpvYuNH5pM3CITgghJJRdrZFvBta6DO96abP/dAYnZzqP6sCTKvA7v0oHEIl/FaLdPlQpYcO5ioh5G6IaCAsIdA==
X-Gm-Message-State: AOJu0YzxJwRQr2MmsjAj2WN5BJwUPfUqDcLGssy6qsul7gOCP5BGTJnp
 zEvlhAfTjG1IL76gwJlg1KeHCHb5niiPlSzHHwWqUdKuEkEQsjtJ2+z34xGBfToM6TLQ6NcnIXU
 B
X-Google-Smtp-Source: AGHT+IHmQIRTDEIOw9WFpimkhJHl7IXlFHt30wjN6LKdKXnpUUjIazryJ1GuoVvCRIURrW7j6gutTg==
X-Received: by 2002:a05:600c:2e51:b0:414:250:ccaa with SMTP id
 q17-20020a05600c2e5100b004140250ccaamr6858790wmf.12.1711446989647; 
 Tue, 26 Mar 2024 02:56:29 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.155.229])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a05600c310400b0041462294fe3sm11043010wmo.42.2024.03.26.02.56.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 02:56:29 -0700 (PDT)
Message-ID: <a8408559-7eb4-4643-bae7-4039f16ef00e@linaro.org>
Date: Tue, 26 Mar 2024 10:56:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/system/ppc/amigang.rst: Fix formatting
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
References: <20240324161148.4650D4E601F@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240324161148.4650D4E601F@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 26 Mar 2024 09:56:33 -0000

On 24/3/24 17:11, BALATON Zoltan wrote:
> Add missing space to fix character formatting where it was missed in
> two places.
> 
> Fixes: 623d9065b6 (docs/system/ppc: Document running Linux on AmigaNG machines)
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   docs/system/ppc/amigang.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, patch queued.

