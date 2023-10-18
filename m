Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qsyk1-0001io-81
	for mharc-qemu-trivial@gnu.org; Wed, 18 Oct 2023 01:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qsyk0-0001iY-0g
 for qemu-trivial@nongnu.org; Wed, 18 Oct 2023 01:05:08 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qsyjv-0003cK-4s
 for qemu-trivial@nongnu.org; Wed, 18 Oct 2023 01:05:07 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2bfed7c4e6dso82637691fa.1
 for <qemu-trivial@nongnu.org>; Tue, 17 Oct 2023 22:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697605501; x=1698210301; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K8H5PuQQvXrI1d+CuEbwAz8D/VlFoQM02yrWlgI0Rh8=;
 b=S2yrDvSPSRoVwnsAAgnmOlFo7OZPWr1bB8kd7ShJCgkA+OoSbRcPsU/7BrsVKMwlLM
 YdJkAvmSl3YHgz7kOM/iSl0jdMJMRZvwv6zy/bLDDRw5jQivuSGZTCRsHwZJYpkmJboD
 Sq4Awn3wRgVqb8X4Fum+X/EDSeXZ/Z9OR44hr+iHLeS5UeRnzAs8rmS9lsPgfDf07AcJ
 sU9EYswODk6Eai8yn2Qba0ivnBt1rBdkCosH3AFVxiEfrx9uBsVpwJ4PnyK0w6q8QM5E
 UkJfhrw9Uv6SOEmexyBBGxDDCyXpTsuyE88MG3gdyCKc1/RoDIUqkN87VbPiVDSoV+sO
 FiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697605501; x=1698210301;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K8H5PuQQvXrI1d+CuEbwAz8D/VlFoQM02yrWlgI0Rh8=;
 b=pVDi0PrgVCnC/by4p+Y1iK1ceANAyjefo1ZBl1bzAMCWo1ZWeHmiv9pdcEdtpR+/oz
 pjshEHx4YgAd7pFKhbE0LK2ZvdCSDe/DqaSsQWtLzBAYaEZ1viibg3e6WbYUKaZlOnb+
 0+fm+dlHCoeynkNGdspo75JpVZHrAlDVA3PavDpODq2JgT4Vp9e9ZA13C8SBpX5cI870
 7CPrzoUZJ/6QZdplQk2VBK6yXGw7H/g1r53Zo+bh6TrQ6NccOcqbfI3sNewDrs/to5Dj
 T3xPpiqCb+GxIB+P3Qc7sGasKiz+6IqUFmXOQ5lGPJjuiG+LoFBWqGqtQ3TwAA9EwnEw
 oOdg==
X-Gm-Message-State: AOJu0YwxL+JUevKSuZwA73KLdiegmx6Mmojzjgk6SbY3VFyX94V5maoc
 BkDaY0ynEW5V6B88k8alVE8gotKEu+f6ECZMELeF3A==
X-Google-Smtp-Source: AGHT+IHuDu3zZKriGPd2n39pFM07GZWqhAFoZ9DIBU27CdFCvAAHtUht7nAnucJ80fKEeVmFKHY7Mw==
X-Received: by 2002:a2e:9c51:0:b0:2c5:1bd3:5658 with SMTP id
 t17-20020a2e9c51000000b002c51bd35658mr2814228ljj.28.1697605500868; 
 Tue, 17 Oct 2023 22:05:00 -0700 (PDT)
Received: from [192.168.69.115] ([176.172.118.33])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c320900b004083bc9ac90sm621641wmp.24.2023.10.17.22.04.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Oct 2023 22:05:00 -0700 (PDT)
Message-ID: <9f310f21-2d8d-91f9-bb25-486fc5e943b5@linaro.org>
Date: Wed, 18 Oct 2023 07:04:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Add hw/input/lasips2.c to the HPPA machine
 section
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-trivial@nongnu.org
References: <20231017151933.213780-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231017151933.213780-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x229.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 18 Oct 2023 05:05:08 -0000

On 17/10/23 17:19, Thomas Huth wrote:
> hw/input/lasips2.c and the corresponding header include/hw/input/lasips2.h
> are only used by the HPPA machine, so add them to the corresponding section
> in the MAINTAINERS file.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


