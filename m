Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uFFPA-0001A5-2b
	for mharc-qemu-trivial@gnu.org; Wed, 14 May 2025 12:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uFFP5-0000yg-JT
 for qemu-trivial@nongnu.org; Wed, 14 May 2025 12:56:25 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uFFP4-0006Pk-2x
 for qemu-trivial@nongnu.org; Wed, 14 May 2025 12:56:23 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so9350895e9.1
 for <qemu-trivial@nongnu.org>; Wed, 14 May 2025 09:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747241780; x=1747846580; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=03NFeFkvcXV/SgZYdV+cqawldxX/MyngMFRKwJtWSm4=;
 b=kTAsxUdYi84EZ+r/fevA0SHrMZtRPhUBaFNAlgyqSZalbF/uISppj8rzinAq6J59Ms
 JI5fWXbUOfQsS9Jy4WY5XjSSpIr2QnMwc/6p+EE4AIvJ6GScihFbgv/hmMynT74NPakK
 +CQjghL1SuFn/lqK2rAfkjqCfehQDpZe9h5UzjMXe5EkIP7OixhyggO6atqG26gAEG9U
 O/Vxje5M2CmgBz83zk+gX9VIAMZApPIaFLthe+OXWO6/T/fCEPrGigUyCwct6Kltf9ID
 KyMcHZL9N+KBdU12toHgJB04C9NaPyQ/mSQKZZkF3ZjqvwaEDmUZu7MdaATbhQrVNzsJ
 SWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747241780; x=1747846580;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=03NFeFkvcXV/SgZYdV+cqawldxX/MyngMFRKwJtWSm4=;
 b=nydqLV3rD+d6CG/Z1kqZ/RWGRHe0IrSkvdDYFgJezx2LHZaCImUJUxtg7H0C//8Abz
 47V776aNc4JYPIqahHzXjj7UCesU7UaWrcoCRfZu+o+zZ4RHMc5QobMQcv/OvRbo7U9Q
 QNMonjanjScMPBTvJlqftXUH0qcttr3ao0HnbbrE0wOaywiBNRR7PtcZUIi2N+po4ec5
 boZCR3N92O2In3vGZUYIM95YqNBaLP8YAEANHhVO2d6Wgzp269j42m6zvvMc4ovvy2My
 gY/KtVzRnZZHOL827hc0movWx/A7zXF6E4sTlDcOwG67ga82MEi9yqHMwnBlAWNizsla
 tzmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs0rWHVr7RPdqD9s+dRAgFSB1tSK3rWL8b1Abda3HA5/+Hy9y5An9yZWNzbDk2Pas08K75pbr8oMqTuYc=@nongnu.org
X-Gm-Message-State: AOJu0Yye2N1vwDs4KBQYokfUjq8UN/6nCj9aHRsqSK9vU//pVWMgyn6S
 2F5rSAmBiHy0K37LZhq2ryQY1n/SeUnY12l2RtDVvxv2svdzzfb7147R/R3WRrG/Fh8=
X-Gm-Gg: ASbGncvsm8LznydMsDPOXFbyNpkRfpziFmZNuu/amrgHHku4XEMQhYoeG1i/pbQtnCc
 w9I2a/hy94PlY3cr0a8R7pmkJaHcqKusVoFKosN90+7q5Rs7mqx2sBHeuonBv1K40UkxVgA1Xki
 nIGZ2lNIWiru6m6bwcotFGK0sufp041EDSfQ51nSGerCFSce8ebAYLqKVQ83pgpPaA3CnhCLk0k
 bZdRBXtwexFND/H2DMHmGXkze95K8hr7Us1RVTn2ZwkO8+Xt8hU7AtmS94IS/c0aclyACLvArMq
 t8WOgdl5KUeaItR20mIJ4pDaLAxhIpDajBo0OWJnk4hwKyPiOgNyVsdMaIoIim79R6Fy6GKaygA
 h/AgbvrD8QRJdDXTGIw==
X-Google-Smtp-Source: AGHT+IEvbjZbi3iIDArt0denYQx7gUSNbKnEiElozTf2rkIceCHHXVn790DEM4FVrwhycONy6GF8dw==
X-Received: by 2002:a05:600c:3507:b0:43c:f509:2bbf with SMTP id
 5b1f17b1804b1-442f8524653mr3130535e9.15.1747241780377; 
 Wed, 14 May 2025 09:56:20 -0700 (PDT)
Received: from [10.61.1.248] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a2cf0esm20347840f8f.79.2025.05.14.09.56.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 09:56:19 -0700 (PDT)
Message-ID: <17188f61-b225-466c-8ccd-f4d633797bb7@linaro.org>
Date: Wed, 14 May 2025 17:56:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] hw/core/resetcontainer: Consolidate
 OBJECT_DECLARE_SIMPLE_TYPE
To: Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250514084957.2221975-1-zhao1.liu@intel.com>
 <20250514084957.2221975-8-zhao1.liu@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250514084957.2221975-8-zhao1.liu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-List-Received-Date: Wed, 14 May 2025 16:56:25 -0000

On 14/5/25 10:49, Zhao Liu wrote:
> The QOM type of ResettableContainer is defined by
> OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES, which means it doesn't need
> the class!
> 
> Therefore, use OBJECT_DECLARE_SIMPLE_TYPE to declare the type, then
> there's no need for class definition.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   include/hw/core/resetcontainer.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


