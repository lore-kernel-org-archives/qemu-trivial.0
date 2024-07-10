Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sRXr7-0004a1-30
	for mharc-qemu-trivial@gnu.org; Wed, 10 Jul 2024 09:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRXr4-0004Yl-N8
 for qemu-trivial@nongnu.org; Wed, 10 Jul 2024 09:59:34 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRXr2-0000YI-OR
 for qemu-trivial@nongnu.org; Wed, 10 Jul 2024 09:59:34 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-426526d30aaso36063565e9.0
 for <qemu-trivial@nongnu.org>; Wed, 10 Jul 2024 06:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720619971; x=1721224771; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kJ4vIdBWINpISsNnSom9WLnNU/7LffLcmCsv6uUHM7g=;
 b=BJmovzUIP+wlc3/nctsxkAavd6/yBETvtKz++1pBo5tx9suQ9xoJV3RRTpj9L2qbRj
 J4vjxg9P6WX/T19QM2PnarpSs5tryDC8N17IcjOoTW/tkoPBGcIVidVBlhZQ0Yrcmcyv
 Qlma9LAmNgVCV6RNArQKc6J/sGsGUt04O9IywLs9hyZWqrSw5O2FV7erpf+Cj9spXaPc
 JLkH4Yna5OGB0uRDxNxAwc1yQLOtmy/xsjP5CHVCi+OMlJwUcvzm2ddb1a/L5P7d5b86
 s+HvWNLXtWZ2feWUE+I8fpAY116UuoAdplm2+LSW+arZ/qxeV/F4dtjd6bElZDex1Wr9
 PLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720619971; x=1721224771;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kJ4vIdBWINpISsNnSom9WLnNU/7LffLcmCsv6uUHM7g=;
 b=UjC3vusCA8tkoU4ONnDXWXTOXe4Sjzsd5Hn8HI3QMt/PArR/xkXQYbu3Ff7IJZlCOI
 cDDjcBrAtf09DpwiBxyg9EOa9EjOIPOVpA+dmelahsDfkAbeMbyvye9VLhys9G7hnb0N
 bXaZOhqNjR5Nqm7ki7BWDBmQbyW247zEQdZWPYZO5IcoeAAAtufw3JPjn82jTdDN5wnj
 4hAYt/KRKf2mRec+CNXBmiQR5ogTiwczTTyj46ezp8g1qosXqKDsZjALPz3DKvr262Ds
 wZyey45GbJ4eFKcnpHr0p2F5hwOV4IyQPofAzjt+7Nf6jXKlxOapOklQZcCXjLuUh2Sr
 XqDQ==
X-Gm-Message-State: AOJu0YwQDmriPWZacJrlkzJ8kitcjmV3oimuMrW1MZIh9eN5Tw47Iu+Q
 9y9TVMvSzkQpIa6ZY/JevoIlVwfm7nlwQZq+d3tyLm3W2guyhiPdDI+mBSFQg9M=
X-Google-Smtp-Source: AGHT+IEWw8ovDGVJYf9lATgxbhx+omcLO3jSJmbP+ZlLgTv8CVbAL6kdi2o25u7EIfmSgJbv3rH+8Q==
X-Received: by 2002:adf:f20b:0:b0:366:ecd1:2f38 with SMTP id
 ffacd0b85a97d-367cea45cb1mr3622065f8f.7.1720619970836; 
 Wed, 10 Jul 2024 06:59:30 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.167.117])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfa06d3sm5342613f8f.75.2024.07.10.06.59.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 06:59:30 -0700 (PDT)
Message-ID: <fb9a6445-a4f9-41dc-829f-5566f41aa2a2@linaro.org>
Date: Wed, 10 Jul 2024 15:59:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/avocado: Remove the non-working virtio_check_params
 test
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Denis Plotnikov <dplotnikov@virtuozzo.com>
References: <20240710120330.78581-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240710120330.78581-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-List-Received-Date: Wed, 10 Jul 2024 13:59:35 -0000

On 10/7/24 14:03, Thomas Huth wrote:
> The test has been marked as broken more than 4 years ago

[*]

, and
> so far nobody ever cared to fix it. Thus let's simply remove it
> now ... if somebody ever needs it again, they can restore the
> file from an older version of QEMU.

You might refer to:

[*] 
https://lore.kernel.org/qemu-devel/4bbe9ff8-e1a8-917d-5a57-ce5185da19fa@redhat.com/

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/avocado/virtio_check_params.py | 143 ---------------------------
>   1 file changed, 143 deletions(-)
>   delete mode 100644 tests/avocado/virtio_check_params.py

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


