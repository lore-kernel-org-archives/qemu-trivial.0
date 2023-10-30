Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qxImq-0005RT-7z
	for mharc-qemu-trivial@gnu.org; Sun, 29 Oct 2023 23:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxIml-0005Qp-0c
 for qemu-trivial@nongnu.org; Sun, 29 Oct 2023 23:17:53 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxImi-00067t-8H
 for qemu-trivial@nongnu.org; Sun, 29 Oct 2023 23:17:50 -0400
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c5056059e0so58022481fa.3
 for <qemu-trivial@nongnu.org>; Sun, 29 Oct 2023 20:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698635864; x=1699240664; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EZDWAj1ykkJn4R5/rp3f1Fz3f3ygHodsmieKmcp466M=;
 b=zmIiWTzD8gWWWFWNxjeQ/ZypjDUCDodRCTDY8nKLHBiSWJ1erJncw8LUPkVR3eijC/
 2JnjdorEqTUoaP3KZEK/DkrA8h5MomO87YBUs8DhzN4Nq9Xw3mmUDMbcaRUMQTM+dMsg
 1gGiRtCPSHhmentt/AcOPUR+IFmYXspmYI0wFT5rSbeyJHJbdYq9ixl9nQ3fnsz58KT7
 q08HsCYHfMHo1A7EGhWIO3yPJrPxU/nvC9NOxFzCVDF28m2oyvv0NSVbiFlPMzNR6e9n
 +xRDVbCKr96beN0EIJdNxP4A+27Zs5D4eaLKOQkSLbREu8YuV2VX6FccwCpJcwfghV1l
 Bgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698635864; x=1699240664;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EZDWAj1ykkJn4R5/rp3f1Fz3f3ygHodsmieKmcp466M=;
 b=d9e2Sztu84tVNvA3Ms+iiS2EYsBYy7VFC05RUEHdCt/Ff8u9AKoEpOFX2/adzwpGF7
 oPzqocGk74qy26EoB4/TITQHtvXGEhulbQe5hxKz0eUQ6Bb88uw/vLjoqE6mePXr4Twi
 3vjqA1eUKN++REY2xgbR0Z8V3uCitR+jysor/2oCCSO9BvHwt+uCcJpVbagO4z0K2SA2
 wjVGPmegEUIEUjUlhG/u+CJbSkBGJa3hLgUiDVIfGkvnILRA64DN5g94coAYqHJ1Z6L+
 GohnTa66fw7bUrhMaBUBQGr4oKIYSahFQnlY4NYhmhMBRPkx1pE5irHcc31I8oKL7nWd
 wXwA==
X-Gm-Message-State: AOJu0Yxx0mXk8c+qHXtKjS9yG2rJUOHUoLbAplN+2szENXXXrD9rdFUj
 a646ejhMa523PrN25/rnLEubxg==
X-Google-Smtp-Source: AGHT+IEOpLAOzm7qSabmM28Vo5aaKS60C5sH2RgBNpS1Fm6uCguOrTMCS610koiYqVQ1a2x08Rzogw==
X-Received: by 2002:a2e:bc83:0:b0:2c3:3c0b:d747 with SMTP id
 h3-20020a2ebc83000000b002c33c0bd747mr7670151ljf.17.1698635864024; 
 Sun, 29 Oct 2023 20:17:44 -0700 (PDT)
Received: from [192.168.69.115] ([176.170.212.50])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a1c770a000000b00405bbfd5d16sm8002419wmi.7.2023.10.29.20.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Oct 2023 20:17:43 -0700 (PDT)
Message-ID: <2fe346f1-c76f-7b37-32cf-b9118037b235@linaro.org>
Date: Mon, 30 Oct 2023 04:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 1/6] hw/watchdog/wdt_imx2: Trace MMIO access
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Mads Ynddal <mads@ynddal.dk>, Paolo Bonzini <pbonzini@redhat.com>
References: <20231028122415.14869-1-shentey@gmail.com>
 <20231028122415.14869-2-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231028122415.14869-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x232.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.972,
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
X-List-Received-Date: Mon, 30 Oct 2023 03:17:53 -0000

On 28/10/23 14:24, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/watchdog/wdt_imx2.c   | 24 ++++++++++++++++++------
>   hw/watchdog/trace-events |  4 ++++
>   2 files changed, 22 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


