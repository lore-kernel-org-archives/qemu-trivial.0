Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qxIno-0006Fu-6B
	for mharc-qemu-trivial@gnu.org; Sun, 29 Oct 2023 23:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxIni-0006BM-17
 for qemu-trivial@nongnu.org; Sun, 29 Oct 2023 23:18:50 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxIng-0006CH-3d
 for qemu-trivial@nongnu.org; Sun, 29 Oct 2023 23:18:49 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c50fbc218bso55266881fa.3
 for <qemu-trivial@nongnu.org>; Sun, 29 Oct 2023 20:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698635926; x=1699240726; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QXdjaUTyztNJnuqJ51DB8PqlITILxnd7HmwWp4+4IL0=;
 b=WfaKEtHxjL76cpyfFBNVOk8VEBvWaoXF0guREoR/uoQ1uykIMGZvIzdYJPS3OZeyGN
 rn7p+U1UMxLe2cGFbUFBK/rB/BGaVtJQwSAZEz6vCTUKTzPN1CLPguWhWiZVlIhQ1BOf
 oZO+ExPLXC2e6Mv9uOWalVO2n5QNiHdSQarM7OfxiyNGBlOrR54si/MBrrIfpBThruji
 3Y5AOapMn4vvkClt7cyptnFr37W+AdNdgI5gqgtv/gmHcZ8jaUSjtIITg14KxhSTQRM9
 v1BWlcfGucjMki/i8r7U5JPEP4GbaHpntcr0jU3iUVdU3w9IxKH2GlPVCe6CLXiyPaHr
 ttdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698635926; x=1699240726;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QXdjaUTyztNJnuqJ51DB8PqlITILxnd7HmwWp4+4IL0=;
 b=Q+TXW2yTqtaOTVn5ghpzTLISwl8vEJPWh7Vd6hYjw4E15wdcIgbV5q68s//Yx7IGml
 W8sKxdAFI+3WpYfr3oJG5TZqCX6vXJpCdrXeYUJuNY4/5ffy/SetEiavcbWp/wzKJ5l2
 AYPvqReh0rRMNwrBtIyCxjQL9gkKWD1O+MIpO+v4p3etxU7MEV3PA2RjVCMWXGhdwiby
 mUej7BoFt262V6Cu3z6iWK/wwEgV8cFNC3Epnx540xNIwx5kuLrnXZPc9VE/jOyYlkF+
 vzavT+iLM2RAAVLSkthBuwVlA0e+A1wj/mux6+fo+o/2pdVsyI7BYJwFexsuKKx70Y7V
 JnbQ==
X-Gm-Message-State: AOJu0Yy192Q3s/JWv/L3D9lGG4DhUcYkdq+KNoZR4Gcaqc91bGY1Ub19
 jCsMkLxgEPx9MFeH5PBz314AUg==
X-Google-Smtp-Source: AGHT+IHUytrSL5DZ682plzKar3Cz4BiBFAvn9A5Mx4wsuFYCOEmdo+iWr1NPi6P//uO0GiIgVWOXUQ==
X-Received: by 2002:a2e:a9a7:0:b0:2bc:db70:b563 with SMTP id
 x39-20020a2ea9a7000000b002bcdb70b563mr7667009ljq.32.1698635926035; 
 Sun, 29 Oct 2023 20:18:46 -0700 (PDT)
Received: from [192.168.69.115] ([176.170.212.50])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a05600c4f4100b004063d8b43e7sm11584532wmq.48.2023.10.29.20.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Oct 2023 20:18:45 -0700 (PDT)
Message-ID: <5f764920-b707-98ca-e58a-1c1726145685@linaro.org>
Date: Mon, 30 Oct 2023 04:18:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 3/6] hw/misc/imx7_snvs: Trace MMIO access
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Mads Ynddal <mads@ynddal.dk>, Paolo Bonzini <pbonzini@redhat.com>
References: <20231028122415.14869-1-shentey@gmail.com>
 <20231028122415.14869-4-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231028122415.14869-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22d.google.com
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
X-List-Received-Date: Mon, 30 Oct 2023 03:18:50 -0000

On 28/10/23 14:24, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/misc/imx7_snvs.c  | 5 +++++
>   hw/misc/trace-events | 4 ++++
>   2 files changed, 9 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


