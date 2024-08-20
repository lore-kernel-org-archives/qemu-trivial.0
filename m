Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sgMF1-0002NN-SK
	for mharc-qemu-trivial@gnu.org; Tue, 20 Aug 2024 06:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sgMF0-0002Hq-HU
 for qemu-trivial@nongnu.org; Tue, 20 Aug 2024 06:37:30 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sgMEy-0005dW-TJ
 for qemu-trivial@nongnu.org; Tue, 20 Aug 2024 06:37:30 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5becdf7d36aso4244251a12.1
 for <qemu-trivial@nongnu.org>; Tue, 20 Aug 2024 03:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724150247; x=1724755047; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YeX2pH7S+X+RBHTTO4RrTsaPeGgF/gJQxWwMU4ZFPK0=;
 b=HbsYA+3SEIjAcax2f/+ehQXTa4N04fKcOD5wwZBI/ejh88knUWioocBQATica0pt4c
 71q1HC5doobogu545fGPahTA9uV+g27l57qF470Fd0UDfN2ER69vvI1mCzqsIZUoKeYj
 JOyK6l4W1zHPAadd+BzWIBaJ5ScfzxOR1nzkgSp6GuWSNpSYLadpZj9bl/FlDKbXN3KO
 3mW/93y/liB6AGhpUTj5pXj39PzncD7ATOv7ieFS71Zy7Aoxr3bu7iVfSudTqDOecqDu
 GTewXvw/O6gSZ6jNDUVVzreQVyirpHDGhA1+NfkRIl65aEIl7xb/JKA4SyoBeQCOC2x+
 3XhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724150247; x=1724755047;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YeX2pH7S+X+RBHTTO4RrTsaPeGgF/gJQxWwMU4ZFPK0=;
 b=PAEhUJZ/3aTpILqTFDEU/jMEMBfwTsGbKVSfq3snu0JG894lQQcV6ZRCYsIPVKHz3/
 kxREY40eko/AE9dcahvwIoGuX8kT5vhxbBLNl3bwL7X+bxWc/HNiq7V+32uaX7S2qYRU
 cH0F+5686JTIBIllLmHYHBVeHWuM17Y7QhOd3utnOo0M6PPniRjYXaCJlC/RFFfZgoGv
 eRlcLPkas04AuWLr0eFe9Ant6rELEZz9ZqUY89eD/htouCF8IMPpaqDZKvh+iiUpirzU
 T32/4rfQCcIJEPPEFQaXvnA31pQoIJdhz0ckEJDWDo7TsMTLyBHAYZK8U1mEsyYOxD2n
 1Rhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGH4F30yvBt7RliN8aMbsSHpRwVzWYz8/iTyfenBhaqj81fpIMlzkFqqFpHQn05Qz1jS22HVNbcMa2487ZevUmHmKEdsI8eQ==
X-Gm-Message-State: AOJu0YxpJsd7zvDaP1IdVxfRzZkXNAXKAEiAclu/RCkYpytc7PBcEBKr
 OtU0L2H2V4X/S9ZsdRVqjfw7WYt0DO6ZUfcZgx0Ae1K8WPGP6UnmKi2m3mUOjLA=
X-Google-Smtp-Source: AGHT+IHWKHfbZO57bp3Tn0tlgqLMdg71wiUgDSrD3F+p4iWZNBnF7sMJ2i3CRk0QyFQBZVek+nJzew==
X-Received: by 2002:a05:6402:42ce:b0:59e:f6e7:5521 with SMTP id
 4fb4d7f45d1cf-5beca59365bmr10097247a12.19.1724150246944; 
 Tue, 20 Aug 2024 03:37:26 -0700 (PDT)
Received: from [192.168.223.175] (84.21.205.77.rev.sfr.net. [77.205.21.84])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bebbe7f17bsm6710306a12.59.2024.08.20.03.37.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 03:37:26 -0700 (PDT)
Message-ID: <148cb5a4-2db3-4ba4-bb3b-a281e7dde9d3@linaro.org>
Date: Tue, 20 Aug 2024 12:37:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/display/vhost-user-gpu.c: fix vhost_user_gpu_chr_read()
To: Haoran Zhang <wh1sper@zju.edu.cn>, qemu-trivial@nongnu.org
Cc: marcandre.lureau@redhat.com, qemu-stable <qemu-stable@nongnu.org>
References: <20240820030433.395444-2-wh1sper@zju.edu.cn>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240820030433.395444-2-wh1sper@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x536.google.com
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
X-List-Received-Date: Tue, 20 Aug 2024 10:37:30 -0000

On 20/8/24 05:04, Haoran Zhang wrote:
> fix vhost_user_gpu_chr_read() where `size` was incorretly passed

Typo "incorrectly".

> to `msg->flags`.
> 
> Signed-off-by: Haoran Zhang <wh1sper@zju.edu.cn>
> ---
>   hw/display/vhost-user-gpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Cc: qemu-stable@nongnu.org
Fixes: 267f664658 ("hw/display: add vhost-user-vga & gpu-pci")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


