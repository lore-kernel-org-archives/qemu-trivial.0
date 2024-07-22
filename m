Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sVo6U-0008PC-MN
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jul 2024 04:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sVo6Q-0008MQ-N3
 for qemu-trivial@nongnu.org; Mon, 22 Jul 2024 04:09:02 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sVo6O-0002B7-4d
 for qemu-trivial@nongnu.org; Mon, 22 Jul 2024 04:09:01 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-367940c57ddso1970380f8f.3
 for <qemu-trivial@nongnu.org>; Mon, 22 Jul 2024 01:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721635738; x=1722240538; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GuhGhQfW+nG+132ytSxy9RpTW+oDEVjviPWjVECwFhM=;
 b=Z91Wx9YOkS0cg1rWYDyPACw95r+1yYlZkCWKlr5lmK2/hC5jlaDGqe6DZKKXrDw39E
 5SMxagdtHth5T9oB11s0ntzpDi9D9C7xqFDhfvjVdZdYH3OQE/auvRkQquYu2Eq0c7YI
 uc/rkmXZ5GGL34SKOE38dsxa5VrV2bBMbvf1HqstghWdF1R+5VYvcyYTAGy37ijKBLfB
 VRc50gGmNYUs/0XoKO2xVc4dkCCIelaZJ7RLJr++GyUkXoCOxLjjEsJDhtjeCo8dTFLJ
 TbULNPQP9BRUD5ch4wnc6nU4N06B3u0n8rxirjmxJjqnpXhbmnzKJnykiOqJtqut95Px
 +VRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721635738; x=1722240538;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GuhGhQfW+nG+132ytSxy9RpTW+oDEVjviPWjVECwFhM=;
 b=gj9zwsylAThVaMI0jqbP+rXhuDaaEMjAaUAAuJsuDyKb29j4KegV8jU/TrV66aShfg
 swiOUZOCTJP9PVQC3heHAku0ZdMkehOx8KO4SoTYUzXKZNjMCeqq+FQrwygnIE1TqaaQ
 8Wuj2D+VtAJEScPpDCH/qqy3fe5xWM9+tIFUpBF9YluEF+U3om6f2LHF0/hey/WhnaP5
 iH0atJOvk5yIDRWJvpANW7ud8Wnh1xc5SlRa3AtVYAvyhTMFgDPa5V+CMtygN442FXCA
 LodoO9EW7BJveE1JysF6ji/G+Rf6SF7pVLYA9GrU5fOvDE2dFipEzzTL2/ONH2w1dV5W
 L06A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyLtLGpa41De+C7rSQKddleLjUYIiII1DRiNt9c32/KuJXWb4iHoVkrFhk6iSq5+mcHopo3/jv1m5zOIAsk4pwcBsatU5LSA==
X-Gm-Message-State: AOJu0YzIUrsl5YjS+3KvwiPX5tbmJzcpTc2yQFdsLxDom5ZjxQ1mOL7S
 TIkisa443917b+yZW1bgVWNxNiyl9af3ljxTapH5D07JbO3UuSPmBwl0YPwysO0=
X-Google-Smtp-Source: AGHT+IFISfe7Glmxr7X5ayHDuHzcYnKBZCYOjH/6XVdDUkj2wovbUHVeWIkoddXiTHyXbY7zPENxhw==
X-Received: by 2002:a5d:5352:0:b0:368:71bc:2b0c with SMTP id
 ffacd0b85a97d-369bae02398mr3704156f8f.10.1721635738020; 
 Mon, 22 Jul 2024 01:08:58 -0700 (PDT)
Received: from [192.168.69.100] (gen92-h02-176-184-20-254.dsl.sta.abo.bbox.fr.
 [176.184.20.254]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787ecf92sm7759570f8f.101.2024.07.22.01.08.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 01:08:57 -0700 (PDT)
Message-ID: <8ab5cfc4-3360-4b2e-9679-8566aea9b890@linaro.org>
Date: Mon, 22 Jul 2024 10:08:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/i2c/mpc_i2c.c: Fix mmio region size
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20240721225506.B32704E6039@zero.eik.bme.hu>
Content-Language: en-US
Cc: Andrew Randrianasulu <randrianasulu@gmail.com>,
 Amit Singh Tomar <amit.tomar@freescale.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240721225506.B32704E6039@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-List-Received-Date: Mon, 22 Jul 2024 08:09:02 -0000

+Amit & Andrew

On 22/7/24 00:55, BALATON Zoltan wrote:
> The last register of this device is at offset 0x14 occupying 8 bits so
> to cover it the mmio region needs to be 0x15 bytes long. Also correct
> the name of the field storing this register value to match the
> register name.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/i2c/mpc_i2c.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)


> @@ -329,7 +329,7 @@ static void mpc_i2c_realize(DeviceState *dev, Error **errp)
>       MPCI2CState  *i2c = MPC_I2C(dev);
>       sysbus_init_irq(SYS_BUS_DEVICE(dev), &i2c->irq);
>       memory_region_init_io(&i2c->iomem, OBJECT(i2c), &i2c_ops, i2c,
> -                          "mpc-i2c", 0x14);
> +                          "mpc-i2c", 0x15);

Personally I'm not a big fan of non-pow2 regions, so I'd have picked
0x20 or 0x100 where the 2nd i2c controller starts. Amit, what do you
think?

Anyhow,

Fixes: 7abb479c7a ("PPC: E500: Add FSL I2C controller")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>       sysbus_init_mmio(SYS_BUS_DEVICE(dev), &i2c->iomem);
>       i2c->bus = i2c_init_bus(dev, "i2c");
>   }


