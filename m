Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kYshB-0006tu-3N
	for mharc-qemu-trivial@gnu.org; Sat, 31 Oct 2020 11:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYsh9-0006rf-IK
 for qemu-trivial@nongnu.org; Sat, 31 Oct 2020 11:21:31 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:35615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYsh4-0007Uy-Hz
 for qemu-trivial@nongnu.org; Sat, 31 Oct 2020 11:21:31 -0400
Received: by mail-ed1-x542.google.com with SMTP id w25so9766673edx.2
 for <qemu-trivial@nongnu.org>; Sat, 31 Oct 2020 08:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y3FTOIWKoACXeB9bxehIKqItvK8BcAi1OznwLkk0X44=;
 b=l6BzSHF1Zid5jZMHZi9FY/B5hhrFH20Fmq5jzzCJ7pVwWdcm7BfawXg7qY6P1tLYnF
 RPkv1rBTTvyR/6jFKOcZFrINseP1RXA8xQllNTXQVs1YjULCNHZy9jJgxtU+d8NMaCx5
 KzTd9+CZZkgI6HS5qDrg16ouY7jSYpawhIAqa/EVXWh3sy99EYLAINxXecKp09UDLKRa
 EP14LqVlXNXn1Tk6Y0n/eEtTkVyS7s+1dpw9Z8KOlnVhOpFPufZb2Q/ay/FQoouuyLx7
 HB9rD0A+qfrPNipe3zqHXp9vCRP8t7IEDAcFu+lj0rSRHICuxebaYBinL34pC807D9qN
 pnjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y3FTOIWKoACXeB9bxehIKqItvK8BcAi1OznwLkk0X44=;
 b=hBPcazcgFjET5gE8kGQexTWheCu/N2OWSv7zwvpfl7rBTaIyNDCJT6ceaBlRXal77q
 clHDLB8FO7DBLX8bzeo3adfBz4WNhmnBauHaSFS+UyYCSme5LdGdPCXbASIoVwb5415O
 GlOUxxl/zmGaaiT+I+ID2iYwQSrvEnK6DzutUk6gD7/C8KCq9ohcF7GHu4JSJwGJlR7Z
 qGsgghE/MA5x6QZjo89pi6A29NCyisqeMA3K9hmJdOw9Xhnzs7PijolL8O30uIG5JRze
 R/MdbkCFB5x8plf3nHwGUu3m7vevd3pS5Ks5cTrY3wQ8VlxSrTd+jgV/FZf2XyhRHQnO
 g4kQ==
X-Gm-Message-State: AOAM533jQv9EK4hiQGRzik0b3VEHGAqWcfRJtomulhVLwG1mJE/yrfrD
 GOjbDWJE0Pll478P2wg0g/eIKq7Sb3P0wyCPGwHQ2KpBa/iv0w==
X-Google-Smtp-Source: ABdhPJwI/gQAgRsOPTmTsgN/9RLhTvdUg/OaVz0wC9nDx2h/Xfv/jDAT6Qp42SR8uhfZ8hkWUbyY6q2UgMKRDEZ5oh0=
X-Received: by 2002:a05:6402:b35:: with SMTP id
 bo21mr8393283edb.52.1604157683543; 
 Sat, 31 Oct 2020 08:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <5F9D449A.900@huawei.com>
In-Reply-To: <5F9D449A.900@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 31 Oct 2020 15:21:12 +0000
Message-ID: <CAFEAcA9w_JZ5m2Cj9Cuc4GMka8vp-AabtmqNLwe0q7ObN7QKyA@mail.gmail.com>
Subject: Re: [PATCH] util: Remove redundant checks in the openpty()
To: AlexChen <alex.chen@huawei.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, QEMU <qemu-devel@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
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
X-List-Received-Date: Sat, 31 Oct 2020 15:21:31 -0000

On Sat, 31 Oct 2020 at 11:04, AlexChen <alex.chen@huawei.com> wrote:
>
> As we can see from the following function call stack, the amaster and the aslave
> cannot be NULL: char_pty_open() -> qemu_openpty_raw() -> openpty().
> In addition, the amaster and the aslave has been dereferenced at the beginning
> of the openpty(). So the checks on amaster and aslave in the openpty() are redundant.
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>

This function is trying to match the BSD/glibc openpty()
function, so the thing to check here is not QEMU's specific
current usage but the API specification for openpty():
https://www.gnu.org/software/libc/manual/html_node/Pseudo_002dTerminal-Pairs.html
https://www.freebsd.org/cgi/man.cgi?query=openpty

The spec says that name, termp and winp can all be
NULL, but it doesn't say this for amaster and aslave,
so indeed the change in this patch is the correct one.

> ---
>  util/qemu-openpty.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/util/qemu-openpty.c b/util/qemu-openpty.c
> index eb17f5b0bc..427f43a769 100644
> --- a/util/qemu-openpty.c
> +++ b/util/qemu-openpty.c
> @@ -80,10 +80,9 @@ static int openpty(int *amaster, int *aslave, char *name,
>              (termp != NULL && tcgetattr(sfd, termp) < 0))
>                  goto err;
>
> -        if (amaster)
> -                *amaster = mfd;
> -        if (aslave)
> -                *aslave = sfd;
> +        *amaster = mfd;
> +        *aslave = sfd;
> +
>          if (winp)
>                  ioctl(sfd, TIOCSWINSZ, winp);

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

though you might like to mention in the commit message that
the openpty() API doesn't allow NULL amaster or aslave
arguments.

thanks
-- PMM

