Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jef10-0007TK-5G
	for mharc-qemu-trivial@gnu.org; Fri, 29 May 2020 09:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jef0w-0007OR-LM
 for qemu-trivial@nongnu.org; Fri, 29 May 2020 09:25:35 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:33735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jef0u-0004YZ-53
 for qemu-trivial@nongnu.org; Fri, 29 May 2020 09:25:34 -0400
Received: by mail-oi1-x241.google.com with SMTP id r67so2565700oih.0
 for <qemu-trivial@nongnu.org>; Fri, 29 May 2020 06:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=btgoFOOyR201ip2U5xlh75C3/9fSQsab6c8vWsLd7P4=;
 b=NuxkKdvNH3Ml2auKBoV2zLyLN4/FqjwIxufUiCdgDGEfKfw1XxGczx+UQ5NwEJsxeE
 080lEVkgPxa8r6xPQIPBv/15lS9xI7jrfQuaonvVKcS4w08BRhLfcmFiBLsePbcxxq0l
 KAaledeB98PniOyge4mrugyabLS+CsfOzBSstYIqmpuAiKTNhXaRACNtgnsocoxE3pFX
 ES9aL7yDEnRy9Mhr91q5F7A6YNkOa8q55CXD3VUlEvqTRZFL14qpx7QAYImAjqrslaDS
 er4APZSqstq91l1sYNCb4flgPVtbqAhVHidDFk0l6UIdLpqVO7UbUHEl3S3ZU0bTrEpF
 IrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=btgoFOOyR201ip2U5xlh75C3/9fSQsab6c8vWsLd7P4=;
 b=idyU/AtBQ6xJhscABTT8M4kfqer6zQb9VpyV7IIqoq3Xwmd22mQuOHaH4eWQ20ltjv
 1huCqBcUAiHIzvqeYCnAkAGybhVLh4Z0rTr53c8htOGF8r1eJQNinJYwxhciN8LySERB
 WXvQ5xDEWKj1r672n9wxd50TTPnHb6k03nARWac9WrT7Z/iYMLxeCkka4a3HH1nGhbzP
 QhyNGYxNsx2hc+1ncgQu0jj2cVT+mrsrBpzRTDBpuA0iAoQB58B8qYjaAapatQ8iZ1kX
 CCwUDa3y+jxLU3A9B/ktZOvqmA/i4cnzeW8lQiEJ8ufV0iWIAgxrVqkqEid9aow9kf/1
 dskA==
X-Gm-Message-State: AOAM530kLordFYfzk1sMoijbNOr8j/MaRQjcdMoD9lTMDOYlthccbZDT
 w9vfxTNLviJI1ZoV9qGsCMJ9p/xMql9GoVtN4IIj9g==
X-Google-Smtp-Source: ABdhPJyFDGnahpefq/nXKHHefxEqrMbkGExjes8U78WuR2TTIIrotl+5zK4kjQ2dPoBlm7LmCljTorr/dxdLjCk6Sks=
X-Received: by 2002:a54:469a:: with SMTP id k26mr5702300oic.163.1590758730883; 
 Fri, 29 May 2020 06:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200525114123.21317-1-f4bug@amsat.org>
In-Reply-To: <20200525114123.21317-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 May 2020 14:25:20 +0100
Message-ID: <CAFEAcA_iW32pJHnAOC0J5P3JTh=4yS6rzpSZ7a2tn0_uhsrD8g@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/arm/pxa2xx: Logging cleanups
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Andrzej Zaborowski <balrogg@gmail.com>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 29 May 2020 13:25:35 -0000

On Mon, 25 May 2020 at 12:41, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Last pair of trivial logging cleanup patches
> from last week-end.
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   hw/input/pxa2xx_keypad: Replace hw_error() by qemu_log_mask()
>   hw/arm/pxa2xx: Replace printf() call by qemu_log_mask()
>
>  hw/arm/pxa2xx.c          | 66 +++++++++++++++++++++++++++++-----------
>  hw/display/pxa2xx_lcd.c  | 26 ++++++++--------
>  hw/input/pxa2xx_keypad.c | 10 ++++--
>  3 files changed, 70 insertions(+), 32 deletions(-)



Applied to target-arm.next, thanks.

-- PMM

