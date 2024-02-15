Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rad3Z-0000xF-S8
	for mharc-qemu-trivial@gnu.org; Thu, 15 Feb 2024 09:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rad3X-0000wT-S6
 for qemu-trivial@nongnu.org; Thu, 15 Feb 2024 09:49:43 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rad3W-0007Qj-EE
 for qemu-trivial@nongnu.org; Thu, 15 Feb 2024 09:49:43 -0500
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a389ea940f1so122512066b.3
 for <qemu-trivial@nongnu.org>; Thu, 15 Feb 2024 06:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708008581; x=1708613381; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aqr7wWcuqB9yP7xREpIQs/l1ZNVyP4RyA++HWsSqjYk=;
 b=JhBv/dXYnzJj4ri9ts2Ui32g4euzqD+O48EcV1Iy9F1ZqWTsNoxLACcIM5y/IdhSuJ
 kYgEo10pyTExAnyQpy8kWRVJwWHy5aiis/+7n1740hj8OTrBXLb4IemcTKt9MxuegXQm
 dIiLJFzPRwNC5kQJxP1s22n1gfJBooi6dxFbrft0/KLXpsdSHZvnRwgahbN4voZmP2R9
 Qb1uMHiSSfmaC5hX3YIgIhjOcZxEFCnIAvazDIpciAiy1xrDaJaFowP14TbWrr7F5nOd
 DkNQ9GlOdWLG0Vdd3oMjRBIqMKzax4w9qyCI364PV6S6zYvZX/Wbi77UrY173DNDkJ62
 IypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708008581; x=1708613381;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aqr7wWcuqB9yP7xREpIQs/l1ZNVyP4RyA++HWsSqjYk=;
 b=hk5L4EiLNjoCLZY601PLSAtyFakQOQ3B9se/TVQyFIeuzAqiQNTetq63VZBG5PSyE3
 sJpRDp329vlpAYCEjnx7Vm9dymRtob7N61LwjVffZ5beNHtAkI57lkPaeHqCSUE2t/Mn
 IYaOmiVaebrAE7Ip3kqErXkhr6Fkss1EZL8W6DiNp6bj2hZt3Fg8JEWob9/kl/d9K3Gs
 TCMamAFIeEy1PUbz9Tkln8+hr1Yc1Emo8ZZSJdPnHB9JZHbV1bfTowduVOfVgjXKtzrI
 PY6Msj47RaMvyBF4nKICZH8QxB3ntx69fr+FGuqyW4hZvXD8hB0ZY6ekknlkKmqs37hK
 G5Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgBTZO25pA42GFjqG2Auy4ZpWqWK9RVlLGp6ntwTZtdSc0KsxcDwkSg2Wz6KUC7/y/5++FBw4hhmX7oXk/ToMhPrcb6GVvjg==
X-Gm-Message-State: AOJu0YwqPXzzfSVY4RQ/gfFl9m6vmgtwXFjgO3a9IY3An3dH1FYRmSpK
 V3j9xHDWqnJalxXvvHkd3F378lLxvpuv92jevaBw8Fp6BAqAJtZuRqGBtTwtvFpn6OZGCKCVViR
 P6Bk=
X-Google-Smtp-Source: AGHT+IHR+MQNfCCXanh9nA0RYrDgNOW0/02hZeQFNv3c75DzG6ULdbqrtxiRs3IUDgxPgF6XSetbYg==
X-Received: by 2002:a17:906:f156:b0:a3d:7c4f:9c5b with SMTP id
 gw22-20020a170906f15600b00a3d7c4f9c5bmr1580255ejb.66.1708008580988; 
 Thu, 15 Feb 2024 06:49:40 -0800 (PST)
Received: from [192.168.69.100] ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 gs36-20020a1709072d2400b00a3d0a094574sm629020ejc.66.2024.02.15.06.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 06:49:40 -0800 (PST)
Message-ID: <b6503fb9-b3a3-4b28-a18a-3254dab1a6bd@linaro.org>
Date: Thu, 15 Feb 2024 15:49:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/dma: Pass parent object to i8257_dma_init()
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-trivial@nongnu.org, =?UTF-8?Q?Herv=C3=A9_Poussineau?=
 <hpoussin@reactos.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20240213114426.87836-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240213114426.87836-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 15 Feb 2024 14:49:44 -0000

On 13/2/24 12:44, Philippe Mathieu-Daudé wrote:
> Set I8257 instances parent (migration isn't affected).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/dma/i8257.h | 2 +-
>   hw/dma/i82374.c        | 2 +-
>   hw/dma/i8257.c         | 4 +++-
>   hw/i386/pc_piix.c      | 2 +-
>   hw/isa/lpc_ich9.c      | 2 +-
>   hw/isa/piix.c          | 2 +-
>   hw/isa/vt82c686.c      | 2 +-
>   hw/mips/jazz.c         | 2 +-
>   8 files changed, 10 insertions(+), 8 deletions(-)

Patch queued.

