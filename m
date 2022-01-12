Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7g5T-0008Qc-HD
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jan 2022 11:02:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7g5Q-0008JR-W6
 for qemu-trivial@nongnu.org; Wed, 12 Jan 2022 11:02:57 -0500
Received: from [2a00:1450:4864:20::335] (port=43747
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7g5M-000186-9A
 for qemu-trivial@nongnu.org; Wed, 12 Jan 2022 11:02:53 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 o203-20020a1ca5d4000000b003477d032384so1893152wme.2
 for <qemu-trivial@nongnu.org>; Wed, 12 Jan 2022 08:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JtP/OBWv3oGBCGkDc1JxKU9quAN1EqYPaTLl6hCCSDo=;
 b=H+5vOufPhIBz0z0+TumsIKIBf9nlHEuAMHerKiygG+iKzEtpHwqNTT1sG8BMao1jpr
 Bc+MEAObA5uTkHHFqyTZqbsNq+HQfgjFacUcN5F/NuuVbebYD8HkgXA1O1WfXwLY9Sen
 8b0iimnEZpKWN1iGqd99FSRmDeQn1tW83Y30nNc9SK8GY/RNs1pFgOZa03r7rGcdiWbw
 JWKrObblWL/A6toxn+UTpf93Medj3bgBzC8N6o3e8oMSpFMr+MlxHkVF32GBt0qsK0ak
 Yh6v2ZfCwX0Wd4Sw5ae/wlY2fXA4vjmitXjtUGWliLRCGGirtDLnJtY0PASrAYJ0R7Is
 LFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JtP/OBWv3oGBCGkDc1JxKU9quAN1EqYPaTLl6hCCSDo=;
 b=Gah5TWbWo7Eb1qH9k+jEBXS0bX2z9DuqO7+7nwHn1SBeYj2aT7VcExSbVPE0V4/F89
 MejC3ucEpJKZ6va9p9PuGDu2hbcen277erx2rw5swaQTFjADc/DkxxR5+UaQgfBzuUAo
 +7p4Bhj28sYySftgvYPorukaKJ6GuQ2j8ujRpOFlzKFHFdT3sKc14zsgQ+f7hB5EPPta
 1ZlbsKhTdIyWTbLz4mCE2dH3Ij/7oEqhuzqbVd/dou3Wx360WNz/99FvxXSjGYivs9XV
 yyhv4qSnB0KdUAZynZvqivdzomJYr1O/beBpKtgCVzfZqYxiwRo+Ero7hj6OtkmF4fEA
 seUw==
X-Gm-Message-State: AOAM532lKRHbEDN3vq5BSK2ogT9w9Y9OOeuV8YwHGTLBfo9/Chvh42+F
 er/SNwZc//b5cq1ZMuOX3M+Yxq0gJGt76d/fbTUOSQ==
X-Google-Smtp-Source: ABdhPJwnWbbyxVUMESxMGkDUxfCTCRaqaXDI5AlS80ycOBM0Y1VYang3hOYw5W/jX74J2OCbiaZbN8XWMj3mN7j4Zso=
X-Received: by 2002:a05:600c:154c:: with SMTP id
 f12mr3285887wmg.126.1642003369141; 
 Wed, 12 Jan 2022 08:02:49 -0800 (PST)
MIME-Version: 1.0
References: <20211106105623.510868-1-f4bug@amsat.org>
 <8f417138-a3bb-7d07-bda9-db4740550f2f@amsat.org>
 <5cad7d04-1699-35d2-8d96-b236d451101d@linaro.org>
In-Reply-To: <5cad7d04-1699-35d2-8d96-b236d451101d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Jan 2022 16:02:38 +0000
Message-ID: <CAFEAcA8m=uX6ju-4CN6rac4v0Dun2d-Qn1gtReHLaKFjvEt6zg@mail.gmail.com>
Subject: Re: [PATCH] hw/timer/etraxfs_timer: Add vmstate for ETRAX timers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 12 Jan 2022 16:02:57 -0000

On Sat, 18 Dec 2021 at 02:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
> What I don't understand is how these controls get applied to qemu_irq after vmload, here
> or in any other device.  It seems like we should have some post_load hook that calls
> timer_update_irq, etc.

Very late answer, but: we don't need to call qemu_set_irq() on
qemu_irqs outbound from a device after a vmload, because IRQ
lines themselves have no state. The device on the other end of
the irq line also loads its own state, and typically that includes
its internal variables which it uses to track whether its input
lines are 0 or 1.

-- PMM

