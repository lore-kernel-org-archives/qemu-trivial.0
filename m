Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sVmbr-0007r1-92
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jul 2024 02:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sVmbq-0007qU-2L
 for qemu-trivial@nongnu.org; Mon, 22 Jul 2024 02:33:22 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sVmbn-0001Rh-O1
 for qemu-trivial@nongnu.org; Mon, 22 Jul 2024 02:33:21 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2eeb1051360so39504681fa.0
 for <qemu-trivial@nongnu.org>; Sun, 21 Jul 2024 23:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721629997; x=1722234797; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bInXiqdV3eXAshI7vnDA2SSh0rpROT2z1DIsmA1ycpU=;
 b=ZbRn4gNbpS4ljiFIHjDFuJ85RvvwUyybvh9BLhQPy46H/UgjVd7qq0kvHa5CdNvuDv
 PYhIhaTuDRGZtcOdTa4g0nYmswy+OMqOdsx6Vrhs0M0tXHDXOvOitic7YF1F0Hd003Ta
 nLczJKthBfYl6aiydlK7T2QWk+Euw5fPOgSS3oecYFokPSVrmv7dsSXd7Wb7631FTb/P
 F0FlqOTIy+0wMFnhlWZ3SodNO5eE2bbZEmdUGrGHb4AjmaPIhV076pIGhKmRM0tUkwTd
 9YuIpeS7Dwo9iGAgwKYJ+AMsJ3P8rie5VhQJ92D53jn3KsM/30j7INjmH1nNT1AV4Ico
 HXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721629997; x=1722234797;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bInXiqdV3eXAshI7vnDA2SSh0rpROT2z1DIsmA1ycpU=;
 b=WJsiPwRt85/s29+xI5bACL8S+9ktuzYW2/IQucZKpi0cCUJe1LcQFyF74Kd7Xv23q1
 KMt32M4wiRxh0piAxYGW+ppmSnVnvMaIkKx9bQSthFV/QbCUdj/bxbnPbEBx/MJy2UQo
 LoXNXD0/8sw4ZfjusMBoqvoZq8+A33NR27d8wkdaLgToGEemskCYeFFimP3BoCQhGdbb
 6GxDuC8uIq7rUDsq/Y7UajoI9Bm7RmSkCeS5iI2+z4wClZ8UaJlguGRrlMooOq3DyDRa
 efJayaeP1ax1JOzGPeDGnTvIdXDvM16M6lfBAKEfWuZseU7muUz2iOnmwUpexf66Elad
 vvDg==
X-Gm-Message-State: AOJu0Yw9Tng5risNA2Ns2c0BMiIrlA1PXO3MJoZFJaQRunx37yXgcWtO
 frP4VWCLyKFPariDZ4BkDPyLdwj6Jk7+AVzAYUPAEhaM7IwQqxXLzt+N+4H5yTY=
X-Google-Smtp-Source: AGHT+IF0EegEtbPd6mAxDmZ6Uef9o/VXxKVfpjLdIh/t6CNDo+b0e+n+vn80gJfp1c2ow0MJQr7kNA==
X-Received: by 2002:a05:651c:1a0c:b0:2ef:2dac:9078 with SMTP id
 38308e7fff4ca-2ef2dac92e3mr22442671fa.16.1721629996832; 
 Sun, 21 Jul 2024 23:33:16 -0700 (PDT)
Received: from [192.168.69.100] (gen92-h02-176-184-20-254.dsl.sta.abo.bbox.fr.
 [176.184.20.254]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427e29d11d5sm46187495e9.38.2024.07.21.23.33.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Jul 2024 23:33:16 -0700 (PDT)
Message-ID: <4100ce91-e4e0-426a-8098-93cd29e634ec@linaro.org>
Date: Mon, 22 Jul 2024 08:33:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH qemu] [hw/char/bcm2835_aux] Fix receive FIFO filling up
 (raspi3)
To: ~fvanhovell <frederik@fvhovell.nl>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-trivial@nongnu.org, Cryptjar <cryptjar@junk.studio>
References: <172158154072.9480.4077116485578955977-0@git.sr.ht>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <172158154072.9480.4077116485578955977-0@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22d.google.com
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
X-List-Received-Date: Mon, 22 Jul 2024 06:33:22 -0000

On 21/7/24 18:13, ~fvanhovell wrote:
> From: Frederik van Hövell <frederik@fvhovell.nl>
> 
> When a bare-metal application on the raspi3 board reads the
> AUX_MU_STAT_REG MMIO register while the device's buffer is
> at full receive FIFO capacity
> (i.e. `s->read_count == BCM2835_AUX_RX_FIFO_LEN`) the
> assertion `assert(s->read_count < BCM2835_AUX_RX_FIFO_LEN)`
> fails.
> 

Reported-by: Cryptjar <cryptjar@junk.studio>
Suggested-by: Cryptjar <cryptjar@junk.studio>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/459
> Signed-off-by: Frederik van Hövell <frederik@fvhovell.nl>
> ---
>   hw/char/bcm2835_aux.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/char/bcm2835_aux.c b/hw/char/bcm2835_aux.c
> index 83990e20f7..fca2f27a55 100644
> --- a/hw/char/bcm2835_aux.c
> +++ b/hw/char/bcm2835_aux.c
> @@ -138,7 +138,7 @@ static uint64_t bcm2835_aux_read(void *opaque, hwaddr offset, unsigned size)
>           res = 0x30e; /* space in the output buffer, empty tx fifo, idle tx/rx */
>           if (s->read_count > 0) {
>               res |= 0x1; /* data in input buffer */
> -            assert(s->read_count < BCM2835_AUX_RX_FIFO_LEN);
> +            assert(s->read_count <= BCM2835_AUX_RX_FIFO_LEN);
>               res |= ((uint32_t)s->read_count) << 16; /* rx fifo fill level */
>           }
>           return res;


