Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l569U-0001ZN-RZ
	for mharc-qemu-trivial@gnu.org; Thu, 28 Jan 2021 07:11:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l569S-0001Vn-Eo
 for qemu-trivial@nongnu.org; Thu, 28 Jan 2021 07:11:54 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:41526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l569Q-0007H9-0f
 for qemu-trivial@nongnu.org; Thu, 28 Jan 2021 07:11:54 -0500
Received: by mail-ed1-x52e.google.com with SMTP id bx12so6310475edb.8
 for <qemu-trivial@nongnu.org>; Thu, 28 Jan 2021 04:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0lWTQBcnDCad8XpdN62W1XLqjcZb1faD1VJFzo+wx5c=;
 b=jOsWkj1VBqgvLEJNsfW/aIG2I2AEZM94wUeGAvUAKWuQVDW+d0o5T3z3Zc5bwYV+0/
 Iv1sCgbVG6hBoJqZJB82GLQv3DYx+b4aflbL1cQFgzY3za6Sky7eRkNODOqNQiqpR6PB
 VL3IuliHsG90QP7BHUGYb0GAkhAUJ6eG0YuKw3WXU9fBtZkApxF1iyzocSDx2kpgydkg
 lzHIFLnoHb3QZ330bgr9dPlTwb+b8EZ5mvHK3tcdWnvGuGKmqJlQgvL9kn1dI/bBFOKP
 R9iPc1Zg/CxOYrA/gUqACCryVq6iTlw1gz8SxaMyECSZ2CibaPmTJ0s5V5GK8oIHU+cb
 /fIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0lWTQBcnDCad8XpdN62W1XLqjcZb1faD1VJFzo+wx5c=;
 b=iVTIoUeWbNv2Sv6aHhZRxM5/TdT9XHnDJYyxuzCZQk7Qo6b1fCgIpJ9p7yR7yAfsTs
 IidHZ7iWZt9n9tbP6T6YTEW+rOUDY2CAjwlFT8g/gwNeQKvKCsjYx0usOPkjShCI6ieq
 WBAH+tEAleObc0kah9sQLQzSg3i2zJeKiAq3qr9GisDnkKq7cpMIq/XR1mTVqgmVtjWz
 YUyHm/MfygZWHZSb86d+jJN06HXfMtlcTXY9YMRCYlP1YCgiLwWFzkSY3hdkraW4nrCI
 Ktup+DsHGT/ejToVhylI5pEplEYlkGrQEHhQQ/jJTnjcX5+rW3MJh0LNAEr6DmLdP+c8
 +TSw==
X-Gm-Message-State: AOAM5319ofOOcw52ajiBQuOUYDn/ncJlpgqGY5A1jMEUgOjvGFuDW6/g
 3fOKEbPKfvbDBgJslFYP/L3hggbamxBsITncSz5ZEw==
X-Google-Smtp-Source: ABdhPJwSUoyImPlO/hkwouKtduzASZ6+PiOhDTWs2l6snrmmf/CYUnaY/yW2CcrI38hekbTDKAM/8VWQcT4saQ7KOm8=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr13543617edd.52.1611835910179; 
 Thu, 28 Jan 2021 04:11:50 -0800 (PST)
MIME-Version: 1.0
References: <20210127011142.2122790-1-wuhaotsh@google.com>
In-Reply-To: <20210127011142.2122790-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 12:11:38 +0000
Message-ID: <CAFEAcA_PHnwpdPBT-fYqogwaiVj3CU2tXg1C00F_eVHmc4L+ww@mail.gmail.com>
Subject: Re: [PATCH v2] hw/misc: Fix arith overflow in NPCM7XX PWM module
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 28 Jan 2021 12:11:54 -0000

On Wed, 27 Jan 2021 at 01:11, Hao Wu <wuhaotsh@google.com> wrote:
>
> Fix potential overflow problem when calculating pwm_duty.
> 1. Ensure p->cmr and p->cnr to be from [0,65535], according to the
>    hardware specification.
> 2. Changed duty to uint32_t. However, since MAX_DUTY * (p->cmr+1)
>    can excceed UINT32_MAX, we convert them to uint64_t in computation
>    and converted them back to uint32_t.
>    (duty is guaranteed to be <= MAX_DUTY so it won't overflow.)
>
> Fixes: CID 1442342
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Doug Evans <dje@google.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---



Applied to target-arm.next, thanks.

-- PMM

