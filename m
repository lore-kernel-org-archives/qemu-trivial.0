Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1s1oF5-0001KF-Mz
	for mharc-qemu-trivial@gnu.org; Tue, 30 Apr 2024 10:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s1oF4-0001Jj-OK
 for qemu-trivial@nongnu.org; Tue, 30 Apr 2024 10:13:58 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s1oF2-0005R9-HB
 for qemu-trivial@nongnu.org; Tue, 30 Apr 2024 10:13:58 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-5aa28cde736so3736010eaf.1
 for <qemu-trivial@nongnu.org>; Tue, 30 Apr 2024 07:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714486434; x=1715091234; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FHzyRMKZ53B26FqbkvMA0fjb0lvxvA47sH2zsNhx0xY=;
 b=NzIO1zPLR5ZshAQ4bERZ2hR9HfxgOFd6biYcVT91exLcUYqA692P9S63naVtPV9p01
 raEy7l+jVk4Gtz1UA5lks5X/0B+/9fuz3wparseES0VCXQ9F/twpmSEhsIuIlPSC35vB
 IB2IyZEvl7k9dGs0zUs7hohc6ayREvPPs8KdsAyPG+sh8tc9DmQFuICjCBwiv1J3VaNf
 12d14BMxkXZpQdOVI6+7ZtVayp2Tej6itFRCss2M5IwOnlhjeQQ7bZzPuYUHkXSl/6ft
 +GujpGC5mU/y/uBtEyQPMVY5Agz26OOA0vTvJNsZ19insEGtyUzv0uiURSWcAqq7crpL
 zPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714486434; x=1715091234;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FHzyRMKZ53B26FqbkvMA0fjb0lvxvA47sH2zsNhx0xY=;
 b=W9UzLBaNAKEGBqCaQRY8qSm3BT9I3qeZ11rAfZVgB0XnWq3yOWKKGBsC+W+eAnZp/G
 zZZIbms2zcjwx37liLibSZbA88GzwnLtidvbX5lyE1B+tswXVnWR0uHNgeOtZhXOgtc5
 EgnrlYRYE76gliNnBAmwPhhp7q/UdgaLFSeJKvs9xAvtWgQtV9kmrklc+UKvCz6dA2hC
 +hM7hIRd0l2p+kXs8AGn1GIQONRJC7Zr47dwzmw2aFyX0XmDrrgRTdgOO92Wpi2Qz2Ux
 Ze7MakTkaEMYwWLAkFIDq7ybjcGxrFwlruetBzqEMx22AtIDYsbPOgOvLAeDWLVlXA1I
 2TWQ==
X-Gm-Message-State: AOJu0YwzmggEWmd2IyKR1ObNOQXzgZkNOCrSVuXCj4+UaDNmXs2Vp0Vo
 7rPw64lin9Kz7kdXTAHxtdGrIlIMnMn6PB6PsGygDZ7IUCfypEIJzAoqLbI9l9c=
X-Google-Smtp-Source: AGHT+IFo+2JWbxtqX7ZgeQUCoEh99he8ejfJ4XCxwQWULAaBnTHIjkXdWFz6n6QpOCzWKCPiz6Qdsg==
X-Received: by 2002:a05:6358:397:b0:186:5c1:1dd1 with SMTP id
 a23-20020a056358039700b0018605c11dd1mr15422539rwj.19.1714486434165; 
 Tue, 30 Apr 2024 07:13:54 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a656712000000b005fd81ad7835sm14389991pgf.58.2024.04.30.07.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 07:13:53 -0700 (PDT)
Message-ID: <2ffc95c3-47bc-434a-8854-a07219febdd7@linaro.org>
Date: Tue, 30 Apr 2024 07:13:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL v2 0/9] Trivial patches for 2024-04-29
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20240429123110.250689-1-mjt@tls.msk.ru>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240429123110.250689-1-mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc29.google.com
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
X-List-Received-Date: Tue, 30 Apr 2024 14:13:59 -0000

On 4/29/24 05:31, Michael Tokarev wrote:
> The following changes since commit fd87be1dada5672f877e03c2ca8504458292c479:
> 
>    Merge tag 'accel-20240426' ofhttps://github.com/philmd/qemu  into staging (2024-04-26 15:28:13 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/mjt0k/qemu.git  tags/pull-trivial-patches
> 
> for you to fetch changes up to ce1992d45c875c29a9018b7ac2fa9bad6587c711:
> 
>    checkpatch.pl: forbid strerrorname_np() (2024-04-29 15:26:56 +0300)
> 
> ----------------------------------------------------------------
> trivial patches for 2024-04-29
> 
> v2: fix author of "backends/cryptodev-builtin: Fix local_error leaks"
> (which should be catched now by checkpatch.pl additions in this series)
> Only patch 6 is being resent.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/9.1 as appropriate.


r~


