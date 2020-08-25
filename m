Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kAYAs-0006Qp-II
	for mharc-qemu-trivial@gnu.org; Tue, 25 Aug 2020 08:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAYAp-0006Ns-JX
 for qemu-trivial@nongnu.org; Tue, 25 Aug 2020 08:35:35 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:33656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAYAl-0006nj-HE
 for qemu-trivial@nongnu.org; Tue, 25 Aug 2020 08:35:35 -0400
Received: by mail-ej1-x643.google.com with SMTP id a21so329937ejp.0
 for <qemu-trivial@nongnu.org>; Tue, 25 Aug 2020 05:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8A737/DKrYh9uyX44xcwujC6YeU+OC0xxDzLI1ANFW0=;
 b=S5vv8DGtFwBS03ICqE0tEHu2hRoK3m/gELrFRePiSnEDauLQIVmv04uAxjoDWOq730
 S9jpYcZ2Dx4Qd+YMRu5XL0LfVhfPV7Xt3EGtAsg26iDgh2lG/oBj7jURtmdZVhLSbO0B
 FvVgGQZamN7ck+S7xFwvlKsyrhF4yzY2SEfRhVmmfk7voHJGaI1HxYwQ4WE+ESUnsDo7
 nfo4VzngueORoQ2ErbPUGOqNNqePBDishFUYQ7bV84MLLc5EmozsEpCqXdCQp8yQ/jcL
 Pc61w3ZSEA8y6oZkCQ3kU3SF+jRpg6Dzb2BAHPHgSYqrwl7rAzgaQuH9nURvMl5CLaHx
 +n7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8A737/DKrYh9uyX44xcwujC6YeU+OC0xxDzLI1ANFW0=;
 b=ljy3M01qCMRz0zCU+UCyP3XoiwauZfTHh7LedFNc0EBXMbJKI106i3bn2JfYM9mZCi
 vogRjzGZvSSvYU8ilcVbthRmuK4dOHGMcOOn7/nDjXBltclZy1yqyUvFsc0Dqc5+pGpz
 /WhIQSibPSlEo3syTQvEKxNivlwqCPg/+zn/yhkXJRK8gapnCMKv1kWqQLE2rVIS4clf
 RSeuEEj4xR6ZDeCLZE2uqk+AMkyiW1ZjeKIxJP8yW5Id66CExImXENJE/Dmf6tt8La3M
 YNTWDt2JTWuH7mBwjRNS3o/mmXtlKIS6T88nMVkGcAPre6AUW000re/x4dDX0lfbZXEH
 lYhQ==
X-Gm-Message-State: AOAM531jpzdMJdpGxRN73h1/1cbbXmKAGCrBKhX/6dUmAaCzLTg06b6m
 6qzcflm2InhL316ekm8X1OExX0u08hbt+8zCeRnFHQ==
X-Google-Smtp-Source: ABdhPJy9O3f1G/JlOAisG5F/m2zoBzsTWdbBFmfi+CqUEmjHJtK5KAHiatDDUChwfJfBXfsDYdY3+Z/4BWefSE5A9CA=
X-Received: by 2002:a17:906:2b0b:: with SMTP id
 a11mr696161ejg.250.1598358929313; 
 Tue, 25 Aug 2020 05:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200825112447.126308-1-kuhn.chenqun@huawei.com>
 <20200825112447.126308-3-kuhn.chenqun@huawei.com>
In-Reply-To: <20200825112447.126308-3-kuhn.chenqun@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Aug 2020 13:35:17 +0100
Message-ID: <CAFEAcA-MJZp5RVvg=tM45kz+=pZ6t8gm-zdkLLzC9C59QVCoDw@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] hw/arm/omap1:Remove redundant statement in
 omap_clkdsp_read()
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Pan Nengyuan <pannengyuan@huawei.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 Euler Robot <euler.robot@huawei.com>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Tue, 25 Aug 2020 12:35:35 -0000

On Tue, 25 Aug 2020 at 12:26, Chen Qun <kuhn.chenqun@huawei.com> wrote:
>
> Clang static code analyzer show warning:
> hw/arm/omap1.c:1760:15: warning: Value stored to 'cpu' during its
> initialization is never read
>     CPUState *cpu = CPU(s->cpu);
>               ^~~   ~~~~~~~~~~~
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

