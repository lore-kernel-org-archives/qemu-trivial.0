Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oZeqB-00047X-FT
	for mharc-qemu-trivial@gnu.org; Sat, 17 Sep 2022 16:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oZeqA-00046t-17
 for qemu-trivial@nongnu.org; Sat, 17 Sep 2022 16:55:06 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:37859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oZeq7-00011L-Hk
 for qemu-trivial@nongnu.org; Sat, 17 Sep 2022 16:55:05 -0400
Received: by mail-ej1-x62e.google.com with SMTP id a26so27803373ejc.4
 for <qemu-trivial@nongnu.org>; Sat, 17 Sep 2022 13:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=A7KuXsBWHS14s3uK3ec+DPAA5QXdMBqNKEdfQuKPomI=;
 b=HEddFn5k/J/S+ixLr/rmKcRnD7mDRGOgSj7toNT8nYpFYrXMp9jeJdB+5XtRO8Q+xd
 k5N86+H112te4yICsR0iVgkQdzYy5NO6Paa0ep+ZF3wn6cgC50DEhGJK8l9HrG1K1X30
 SvioQstJXkQ6PxJIXn92GWJ3N9qvnpWGcgWLHYmhcnmYlz+Nw8WxaUqP1Vr8x2B/Vg0Q
 sTpj88BVcAOpo13mlfXaSgDGhRPd42bDrJTikbEtjgtq2y8MDSHbrVt8q0R2oojHkMGk
 ma+CCNAlFiGSz0Zq+Lzxq0dtOhs+u43AI69bufCX4re7DySiqaMtTZJGUiduB/6gbeal
 Y+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=A7KuXsBWHS14s3uK3ec+DPAA5QXdMBqNKEdfQuKPomI=;
 b=rkUq0KCn4fQ0R+adgQFKwLfW1tdGWGpS5Llg1lo6fkeQBIyDu0HWLbGWbEHXJN7eKc
 KSv0Wn3OH2ILYlyDL7hzN8pIkEciC1ra8bVsLi98Ot4HRlSAzqx4E8R5/ywcHiFsAE/b
 wo4YwrPDmm4vz0wGmz+NZQaOCZV+/CE9DL9VFp3OELi1klGCjuRYr2G/ZY4pjXdezxXU
 j0kAuu8Qx6HVv4+uKNjtCwsO9ASeCTY94l1UuUYrelQd0AtykAfz+34lWAck04fEwiiM
 gPF3A6hDd95PDq+W8utRiEP/JxJB93nR4zBCawb6J59496ViDYtvBO4nzKz37UV+JBkh
 BQZw==
X-Gm-Message-State: ACrzQf3G2dLojI4o9XFcQUn8M1UAxwpGwy9nJe+gfF2CXnO9EZJ0234R
 JMayFEUzc9dcd3ngPKkeYA5Lpw==
X-Google-Smtp-Source: AMsMyM5yI4CZ2J6NXfMdjuCdSOm/EFzeDj03K9V3zTVvmT60jssdRTsNiuJAro3lSfwPEAhi4QBHvA==
X-Received: by 2002:a17:907:783:b0:76e:f290:8b5 with SMTP id
 xd3-20020a170907078300b0076ef29008b5mr8002250ejb.395.1663448101572; 
 Sat, 17 Sep 2022 13:55:01 -0700 (PDT)
Received: from [192.168.1.176] ([81.0.216.218])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a17090606cf00b00780a26edfcesm3072101ejb.60.2022.09.17.13.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 13:55:01 -0700 (PDT)
Message-ID: <ab521627-1d25-98d8-55d2-be7e03a813a6@linaro.org>
Date: Sat, 17 Sep 2022 22:54:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] Remove unused MAX_IDE_BUS define
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: deller@gmx.de, chenhuacai@kernel.org, f4bug@amsat.org,
 jiaxun.yang@flygoat.com, aurelien@aurel32.net, hpoussin@reactos.org,
 mark.cave-ayland@ilande.co.uk
References: <20220917115136.A32EF746E06@zero.eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220917115136.A32EF746E06@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.529,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 17 Sep 2022 20:55:06 -0000

On 9/17/22 13:51, BALATON Zoltan wrote:
> Several machines have an unused MAX_IDE_BUS define. Remove it from
> these machines that don't need it.
> 
> Signed-off-by: BALATON Zoltan<balaton@eik.bme.hu>
> ---
>   hw/alpha/dp264.c    | 2 --
>   hw/hppa/machine.c   | 2 --
>   hw/mips/fuloong2e.c | 1 -
>   hw/mips/malta.c     | 2 --
>   hw/ppc/prep.c       | 2 --
>   hw/sparc64/sun4u.c  | 1 -
>   6 files changed, 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

