Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q14Iu-0007J4-PX
	for mharc-qemu-trivial@gnu.org; Mon, 22 May 2023 08:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q14IU-00078Q-A4
 for qemu-trivial@nongnu.org; Mon, 22 May 2023 08:05:59 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q14IR-0002e0-Du
 for qemu-trivial@nongnu.org; Mon, 22 May 2023 08:05:54 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-510ddeab704so7801170a12.3
 for <qemu-trivial@nongnu.org>; Mon, 22 May 2023 05:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684757149; x=1687349149;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3nDPkpZcS5CkxGXF3Oer4I4F5NDGn6kOFgGyXUkxK/E=;
 b=cs0EwpM9qL8m1/7oNwI51GvZqAs/JGyPjHUDLh8y9iWvVkEHZrXW8XQCc+CVOy/pHj
 wr44yChWTKiatTH7coLAwpwiY3CeUJHd9Vu+9QjTJFUslm7NT7t15R1dA9cIaKejgBzl
 OSpd1YLhw+mj30VWXw8kvbmWr7wEt6R50xBNZF/vGEzltvjbe3gOaypdxKAaMjLVIpbN
 LKgRWSc1gjJKfvcjtYw7+crNUBHZHwLxe5PM0Wb3gv7aonNmIJ/0SCOS/eF1H2xnr+NP
 1ViqE9DOpZCHpVCX1bqHr0EmbcnohbBKk8lscuQGXBeXKNpAXYXo2SczVCXPGjfuaou4
 GHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684757149; x=1687349149;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3nDPkpZcS5CkxGXF3Oer4I4F5NDGn6kOFgGyXUkxK/E=;
 b=inGwDMxgbHyZQXrO8KmxUSuoG6Ei9BnjVI4qNY0vHiE7p2T4s4CUTpuca7wAiXECT/
 I8wDbvxtU0TW7dCOf0wKW8gnLhMqEDddUoJce/cM4pCpafnTkNroJx1Pf1ABtZlde5nM
 p1yDBqWahXFA7YQ457E657dBMqBdmBoW7PDhmF103Awzqjqx5Jm1BOpVwRQ3G7WvJg0l
 5jiWma3nyrY1AbkA5M5axgpjsPkkDGU34OG+3DCv/LGDu4qlyF83gdETldVMsMAINzzG
 yedVKJVVPrP3J2FjdqXUXU//y9rwmkfYMIQq7ImWbPPPFLahLCuukB9uS6FiludnFW3A
 kWpw==
X-Gm-Message-State: AC+VfDzStTboJ+GjzJ/zJGJGm/OU9ZWg4Q0Wau07lQINZZEA6X1LlZrD
 TZJkb1XPjryw2zNRqvlG0Ek6bOg1rt4R8R5W4IXLssqUPLgD7ZO2
X-Google-Smtp-Source: ACHHUZ47pZ9YadquVeYyJ8XdN2WMY6ydTA9OJuKzkD/eUOmUjgedMrF74ckkcwSlvNi1lVeDSP+mSc1cUwgnCbt0hRo=
X-Received: by 2002:a05:6402:2d5:b0:510:f6e0:7d9f with SMTP id
 b21-20020a05640202d500b00510f6e07d9fmr9184627edx.13.1684757148982; Mon, 22
 May 2023 05:05:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230520205444.887287457E7@zero.eik.bme.hu>
 <CAFEAcA9gAYPpOJ6VyPYwCVyOhMmJMEe4QyGzB57xCbK0MOED5A@mail.gmail.com>
 <0ab99dea-dbe6-9b3c-37a1-0ad66c0573b2@eik.bme.hu>
In-Reply-To: <0ab99dea-dbe6-9b3c-37a1-0ad66c0573b2@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 May 2023 13:05:37 +0100
Message-ID: <CAFEAcA-pxaWN+AQCbzejdy072otR4Sm6hXURW7s8_Eb+cZMBUQ@mail.gmail.com>
Subject: Re: [PATCH] bitops.h: Compile out asserts without --enable-debug
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 22 May 2023 12:06:07 -0000

On Mon, 22 May 2023 at 13:00, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> On Mon, 22 May 2023, Peter Maydell wrote:
> > Can we have some figures for performance improvements,
> > please? General QEMU policy is that asserts remain,
> > even in non-debug builds, so exceptions from that policy
> > should come with justification with figures attached.
>
> Here are some figures converting a 10MB wav file to mp3 with lame on
> AmigaOS pegasos2 which is using a lot of FPU operations (which is using
> softfloat on TCG target/ppc due to no hardfloat so it's very slow):
>
>     8.0: 1:11 0.8264x, 1:11 0x8258x
> master: 1:12 0.8117x, 1:12 0.8103x
>   patch: 1:02 0.9541x, 1:02 0.9506x

Thanks; that does seem like quite a lot of overhead.

> I've never seen these asserts firing and unlikely to depend on run time
> values so leaving them in non-debug builds seems unnecessary overkill that
> also hurts performance.

Where they don't depend on runtime values, the compiler will be
able to detect that the assert condition is always false and
won't emit any code. It's only the cases where the start or
length are variable that will be causing the slowdown.

thanks
-- PMM

