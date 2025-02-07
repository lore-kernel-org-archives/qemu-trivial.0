Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tgQO2-0005su-50
	for mharc-qemu-trivial@gnu.org; Fri, 07 Feb 2025 10:35:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tgQNq-0005To-87
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2025 10:35:12 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tgQNn-0004km-7U
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2025 10:35:09 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-21f2339dcfdso36046255ad.1
 for <qemu-trivial@nongnu.org>; Fri, 07 Feb 2025 07:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1738942504; x=1739547304; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JL6HX0/rUgVOcxkk5vAabK9dtF8gasDai0xn6kwNf/0=;
 b=U5GNoRhzpC4yju1x80Yb4QAOfPKYw4r5nR9hcfCDbvdFkcL9iuQ/0A5vbWFn7oYmeD
 2cmHakGMDirOAeHlth5/OWdiuv0268vPMtlgvDiQyTVRLu+8KSyQbYX6h4y299NKGSE+
 WK0BKzpe1zYVs+RgljYLUM/fMRsxSu/CwEe5toi/iwA7BXaG+zYBh8vBcGT993rXbqMd
 Q6N77wrxyzPCE7JkTH7/II9FsepGVl+4hJpyT5Bp/9F6ZLHXkxBbWUIMh0nNN+ovqmRy
 gmSn7g003PGsb4ENkRMirzQxZbQ3Ku93zSHBBGVl5AB/Af4noDgXGSpwPpeCqnaBNdUv
 WNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738942504; x=1739547304;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JL6HX0/rUgVOcxkk5vAabK9dtF8gasDai0xn6kwNf/0=;
 b=iC4sd/eZIju3Ri/SI57PX7ENbPGKbuRmP3d/GNtgLmYiTtzDAJxwj7uGgQ7tenUV1P
 N1qvF8CX4v5fOuNPN/sJYZiE0CBbDmoFefkwfnmSSkp3IUJ6KLBkAacTTpxeCVSVTAyB
 cflDeWy+TecRfoXaYMktsf3shmhyGbr6/wyERlS0JiIX0fwvgUufQHcmvQHzj38VYcMT
 bdK7sM2zCBreCH81QX5grn1MXY7IuukTAxbUs00cOR2aPUGS0dYOjWQ+ddGeuaziCKtO
 83dzgZXjyEcO8+XT937T2YJl8mTsCkXd2W3mnspcXcxrzGYEbFJGctQ/uloU8zkhOMHY
 M5tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0j3YQ9TAaXqVyYu7EOabva4UWumKrdrEv2dFrcC0DIUoJ5xE/UykCrLdeEOazuItBFg3VrUHR2MwmTbU=@nongnu.org
X-Gm-Message-State: AOJu0Yx4YfGIuzErwTn9bzO/+5dnt5i3BiuZbfXz0H10nMtaz9kYoMHg
 DuGJZzTByyWA3oSmCESGHapDiPQ8zgdItuVwR2Z1xK0SjaHM4hz7Mcarvpau5BMWe0ktqN1V0mz
 i
X-Gm-Gg: ASbGncuhbMh+OW+0Xx/Ql2cg0k9jHxvJYzWOrrm8Rb+JsvmWuUK5vjnp/wM+7PskRPY
 aL48FmNNS5XAPqcHYQ8FTA5gCduxjDoZPzUKCM7bj8YmaW4dIQk997/1ZRSAkJfoo1wv3qs5Tum
 x4VYYNQ2qrZ4gVFey0kiZFvzKQzmbViINZ5ds3Dp34jWxHcyVV4lrEWrc187ol8mgXcnusPoUK0
 95n7Qwmq6V3iPuvQ9d3yYNhpfy8jfB2g91NaLVMsRf/xDGXr3TdJH3eLgv1g2g/jyRq5W2kKflV
 IkJZ8JRa9t/DErZtlHwYDFZ+Pldbjpv7TlPWn7GkDPnYmL3G4xEEZlNU2Kze6LtI
X-Google-Smtp-Source: AGHT+IEg6TOgRbngSBxCtjXHpnQ5Uxj1dtAD59nwxTVtH8DBEiy+2pyGG6fbo45a7em/6DU7v01whA==
X-Received: by 2002:a17:902:cf04:b0:216:5db1:5dc1 with SMTP id
 d9443c01a7336-21f4f0ef803mr54542665ad.1.1738942504312; 
 Fri, 07 Feb 2025 07:35:04 -0800 (PST)
Received: from [192.168.68.110] (201-69-66-42.dial-up.telesp.net.br.
 [201.69.66.42]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f36560d6csm32052135ad.92.2025.02.07.07.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 07:35:03 -0800 (PST)
Message-ID: <8f551680-6553-42b1-9307-d4b56e7bc2a5@ventanamicro.com>
Date: Fri, 7 Feb 2025 12:34:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Fix minor whitespace issue in
 riscv_cpu_properties
To: Rob Bradford <rbradford@rivosinc.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>
References: <20250207152823.265068-1-rbradford@rivosinc.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250207152823.265068-1-rbradford@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62c.google.com
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
X-List-Received-Date: Fri, 07 Feb 2025 15:35:14 -0000

Ccing qemu-trivial and Michael
  
On 2/7/25 12:28 PM, Rob Bradford wrote:
> The mvendorid/mimpid/marchid properties have the wrong amount of
> whitespace ahead of them.
> 
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 3d4bd157d2..cca24b9f1f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2844,9 +2844,9 @@ static const Property riscv_cpu_properties[] = {
>       {.name = "cbop_blocksize", .info = &prop_cbop_blksize},
>       {.name = "cboz_blocksize", .info = &prop_cboz_blksize},
>   
> -     {.name = "mvendorid", .info = &prop_mvendorid},
> -     {.name = "mimpid", .info = &prop_mimpid},
> -     {.name = "marchid", .info = &prop_marchid},
> +    {.name = "mvendorid", .info = &prop_mvendorid},
> +    {.name = "mimpid", .info = &prop_mimpid},
> +    {.name = "marchid", .info = &prop_marchid},
>   
>   #ifndef CONFIG_USER_ONLY
>       DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),


