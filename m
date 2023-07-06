Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qHSCD-0002qQ-7V
	for mharc-qemu-trivial@gnu.org; Thu, 06 Jul 2023 12:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qHSC8-0002pv-QR
 for qemu-trivial@nongnu.org; Thu, 06 Jul 2023 12:51:04 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qHSC5-00009Y-7v
 for qemu-trivial@nongnu.org; Thu, 06 Jul 2023 12:51:03 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-99313a34b2dso110654866b.1
 for <qemu-trivial@nongnu.org>; Thu, 06 Jul 2023 09:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688662259; x=1691254259;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xz5uFkMVAHreoQsP7qWUQ7Nk5ICo8gFm0Z5UxHN3DYM=;
 b=O9DU5yRoGcUpnn4ec/qHb8Nr9a5nBpuuP32GE4LsyDwg2kA1/cJZVL/l9EFQ/boiPO
 KZFee4mlDbTMSd+z4UTxzI2B8yZuqUSeYslw3nEHDs4c2uesl2whELy7XiYerLZGMwQA
 l8oFS86+A9ZQT8m/5OzH/NNIQtmn0ukLB7uKFZuP47u6ciVkst+C/EdlvQG13Uumgaxo
 cymRbsTDjECBYhWpeGqe2ym9glUrAXJpRRf0o/oKchmh/wo4kRnL0Ou67pcrP1ZAxUfJ
 RgbXXBtENgg+GKmUOgEt8IyjfeXF4K+41F3qrKvUPPb96nVkqceh51CYmpPGM71XY4Ll
 YwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688662259; x=1691254259;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xz5uFkMVAHreoQsP7qWUQ7Nk5ICo8gFm0Z5UxHN3DYM=;
 b=Wmiwkdi67yxZh1u3mJmhpST4ysAflz5msVm0PooLoqGR/Zn2zTnDLNwGrDGoqqOtaV
 PkfmAviMpx6UYxtSuhA6dsyNTAcQh+QorEILE8XttTmSgdhGWbALlKSKmdCOhw391QMu
 eHnyhAonfhny5EaADJLLk6tXnlQOCZIN2SmrQ58PWRV//ncn/M089y0ejTIDifpWQ/E0
 BuYni95Vw56spVW3WvK3amqhZrzw+QycM0nm+A4+IoVLBm8svL9N1BejFyWg5IddJvTR
 fK40ZbiQ82gUL21BM/focUz56qN38AWMxsEhO9xxISvcbkF+N3r+8grlx2qipW89TNhP
 au3w==
X-Gm-Message-State: ABy/qLbbTp44ayDL2fYWx3ATNLuHAR1v2TzXQDDxJSMdpY3UuyktcFZa
 OYd8Wfxe/yaGj8qEF5kbeIX34Q==
X-Google-Smtp-Source: APBJJlEyKBONGcfBZCJkmY/HjvyD+4VKSj03dsa8ID25/OjNEyj2GhWyljDqwggWygT5U6czyEYEEA==
X-Received: by 2002:a17:906:20e:b0:992:8a4a:6811 with SMTP id
 14-20020a170906020e00b009928a4a6811mr2313658ejd.15.1688662259675; 
 Thu, 06 Jul 2023 09:50:59 -0700 (PDT)
Received: from [192.168.1.102] ([176.187.199.225])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a17090607ca00b00989257be620sm1017322ejc.200.2023.07.06.09.50.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 09:50:59 -0700 (PDT)
Message-ID: <c03209e3-c0e3-3fb0-c627-478bd820fc89@linaro.org>
Date: Thu, 6 Jul 2023 18:50:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] hw/arm/virt-acpi-build.c: Add missing header
Content-Language: en-US
To: Peng Liang <tcx4c70@gmail.com>, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, shannon.zhaosl@gmail.com, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230706150839.1180137-1-tcx4c70@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230706150839.1180137-1-tcx4c70@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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
X-List-Received-Date: Thu, 06 Jul 2023 16:51:05 -0000

On 6/7/23 17:08, Peng Liang wrote:
> virt-acpi-build.c uses warn_report. However, it doesn't include
> qemu/error-report.h directly, it include qemu/error-report.h via trace.h
> if we enable log trace backend. But if we disable the log trace backend
> (e.g., --enable-trace-backends=nop), then virt-acpi-build.c will not
> include qemu/error-report.h any more and it will lead to build errors.
> Include qemu/error-report.h directly in virt-acpi-build.c to avoid the
> errors.
> 

Fixes: 451b157041 ("acpi: Align the size to 128k")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Peng Liang <tcx4c70@gmail.com>
> ---
>   hw/arm/virt-acpi-build.c | 1 +
>   1 file changed, 1 insertion(+)


