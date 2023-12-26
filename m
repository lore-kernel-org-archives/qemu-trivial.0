Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rI9Go-0006Qx-8L
	for mharc-qemu-trivial@gnu.org; Tue, 26 Dec 2023 10:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rI9Gn-0006QC-1D
 for qemu-trivial@nongnu.org; Tue, 26 Dec 2023 10:23:01 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rI9Gk-0006iX-Nq
 for qemu-trivial@nongnu.org; Tue, 26 Dec 2023 10:23:00 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-336f2c88361so3672f8f.3
 for <qemu-trivial@nongnu.org>; Tue, 26 Dec 2023 07:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703604177; x=1704208977; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b0nMFW6LMdE8Xm8hxjzwF8HIN5deAzqIfkDUxKLzdtM=;
 b=C5mmRIlgtuM+ad99TGMNS0fLS8hrbZGx9N9dQAksMCqKz0Y7Fzau5pDSPOn/4w1RUE
 aelRntmA4rMtLuldyOfa5Yw4N4uveqolZ39tffmGk1vk4dsalYUF/+0FF6NzTxYaPCPn
 4mPdFeaJwe0saY4X7VDYw73aDePcWHT6PPCnw6LhjxQsebm1RXGRB2FiZx7vtydvc76B
 xfOfTXb7eKQZgS+zKOsrQ9kIyErK7Lz7nXyKp9Gz1dtN2v80bYNE+J3uEdCc6vq6mLGi
 m7dq4CJ6xITRKGpyRUai+E5JRc9poFralBA2mrchfxsFTK64UYZwkw+9feJPB2CdaPTS
 dkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703604177; x=1704208977;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b0nMFW6LMdE8Xm8hxjzwF8HIN5deAzqIfkDUxKLzdtM=;
 b=QetS1Wv+U+Hi4ajfA8bzoJCBqF7ZEyWw6OXK0ImgkKoyGfkbVlJw6KD8umHvGfsgu7
 3TqU/ONxU5+oSL3Z+lOzye5zCab4HkCq4OnzYh0w9G0uhRBKWYzFepl1R7AELbIvr5J2
 +TgPj92ur4zNsJjuTR+HSzwQqja2K/wWMisnr2USQfgLT+avYqN88N3YBXZOGiwjbQCo
 C27stsYYfRiYH63JDu8RTSNYLIB/2Os2F6xwc4AeKJFi8FXtzimQXIehIDD7yoxl2aj2
 G7ocVyiZm70IIC3PnahGt9YHnzbWcNJ+z0uVAobPOizlSzOYZ3ID6evXtYHurQixDq8U
 ET8w==
X-Gm-Message-State: AOJu0YymbXMIKcW+YJbJr9nYtSYSvECao5OvTqdjfFp0svC8Akm72t0k
 lM5yCo0AejICwCeoXvO29BLEYZfhOEDjrg==
X-Google-Smtp-Source: AGHT+IExP0Zdvy4TtZJ8Vmtb44MBWw7RLrNTIr1Gav684fwRhmc86g2e4UaTkZUkLf5itUX37Whl+w==
X-Received: by 2002:a5d:6511:0:b0:336:7357:acc5 with SMTP id
 x17-20020a5d6511000000b003367357acc5mr3226778wru.73.1703604177299; 
 Tue, 26 Dec 2023 07:22:57 -0800 (PST)
Received: from [192.168.19.175] (131.red-88-29-190.dynamicip.rima-tde.net.
 [88.29.190.131]) by smtp.gmail.com with ESMTPSA id
 a4-20020adffb84000000b00336d24b4847sm2762191wrr.114.2023.12.26.07.22.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Dec 2023 07:22:56 -0800 (PST)
Message-ID: <bbffef1f-0967-46d2-85b6-18c32f4c5e3a@linaro.org>
Date: Tue, 26 Dec 2023 16:22:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio-blk: Fix potential nullpointer read access in
 virtio_blk_data_plane_destroy
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20231224114314.420360-1-sw@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231224114314.420360-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-List-Received-Date: Tue, 26 Dec 2023 15:23:01 -0000

On 24/12/23 12:43, Stefan Weil via wrote:
> Fixes: CID 1532828
> Fixes: b6948ab01d ("virtio-blk: add iothread-vq-mapping parameter")
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>   hw/block/dataplane/virtio-blk.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


