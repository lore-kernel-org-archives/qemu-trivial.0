Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l9D3W-0001WL-8d
	for mharc-qemu-trivial@gnu.org; Mon, 08 Feb 2021 15:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9D3S-0001U2-Ae
 for qemu-trivial@nongnu.org; Mon, 08 Feb 2021 15:22:43 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:46866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9D3N-0004ll-BX
 for qemu-trivial@nongnu.org; Mon, 08 Feb 2021 15:22:42 -0500
Received: by mail-ej1-x62c.google.com with SMTP id w2so27298601ejk.13
 for <qemu-trivial@nongnu.org>; Mon, 08 Feb 2021 12:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XHpyWSpQwFZpE0QtFaiGrMasCpZLkqhY1AZGZa9GW+s=;
 b=F/khAc1q6YZDVI8crXsa8HqawqOm9R0BeXxEDaPK76fIydHp9I4KSKjD9QH7kXzFJ9
 vKKOUSb78E5uj27UFNyJlOw/yuqqNMwWjZwZAvK8kpgjYijAu3+ONe2Iu7H8u9s263Wt
 So53mZlT7Sqji8dTDmivEF0dGmt8qNJEN8gNeGsAPrahHYJKUruxMxTxA3wi5NONwl+i
 g0OzZTG3NnIRzNPCMyk06E5eEZ5IberO6awYHqvFHUVjUyIfqwNSADG291uQFUabylCR
 opYg3n3KbZgxeWpMMo9wX73GqeidJzQ1YDZosRT8K/X953iC10SWz5IhbYBGVkhOb+CJ
 VQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XHpyWSpQwFZpE0QtFaiGrMasCpZLkqhY1AZGZa9GW+s=;
 b=T/SzHffv8x4EH6kB2LJ7fFa6usURIqEP2rkXItSYCWinwBLfQG2FTzHHoNm5gn318r
 C1fitqZFTB3Jwm2SETCeTsM9WuIHtAQTS4vCvXPVMkDorBeki/QO1oLaOIJS5cE85tUA
 3V/hF/Ghlfv4gHGy/9otZTepEJ9tgg9r2Dde+3Ice98K9qOlgIfEkSlMPNH/3AoHaaM5
 63LX7eK6T65pXHeDWKdcfyxwQFeJpOAQ0/t/aKOsQOrhWASUIfbCwtPoVCVvFGWG/oJW
 6pF+6P2q+MJVnHGYSx/dVkTXiInpfOt3U+VrDb1RAOH77VmUtYSydavWOAkDpKkSDNQ1
 romg==
X-Gm-Message-State: AOAM531cJByc0zpuzoWtRyuvAFwqI7kr6mKMXzrxVC1UWobklXw7pcay
 e5gso3Sv/KVN+rpC1LQ4Saz1vD/TNH0ROVkJ0+Ih7A==
X-Google-Smtp-Source: ABdhPJyyJ5y9HDJZdp/+MZuwIT1y0fbQroUoCBpW1gu+ixQwalEN4s5QlkKFUMjfygDIhHsZTmyp2QqcSzOw14PU21Y=
X-Received: by 2002:a17:906:184e:: with SMTP id
 w14mr10162546eje.56.1612815755816; 
 Mon, 08 Feb 2021 12:22:35 -0800 (PST)
MIME-Version: 1.0
References: <20210208135048.2601693-1-f4bug@amsat.org>
 <20210208135048.2601693-2-f4bug@amsat.org>
In-Reply-To: <20210208135048.2601693-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 20:22:24 +0000
Message-ID: <CAFEAcA-CYk2XpngH_r3adYmb2t=39wfJA0pae8jmcOPCgofOvw@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/sh4/Kconfig: Rename CONFIG_SH4 ->
 CONFIG_SH4_DEVICES
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, 
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Walle <michael@walle.cc>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
X-List-Received-Date: Mon, 08 Feb 2021 20:22:43 -0000

On Mon, 8 Feb 2021 at 20:04, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> We want to be able to use the 'SH4' config for architecture
> specific features. As CONFIG_SH4 is only used to select
> peripherals, rename it CONFIG_SH4_DEVICES.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/block/meson.build | 2 +-
>  hw/char/meson.build  | 2 +-
>  hw/intc/meson.build  | 2 +-
>  hw/sh4/Kconfig       | 6 +++---
>  hw/timer/meson.build | 2 +-
>  5 files changed, 7 insertions(+), 7 deletions(-)

We could if we wished be more fine-grained about this, eg by
adding new CONFIG options for each device:
 CONFIG_TC58128
 CONFIG_SH_SERIAL
 CONFIG_SH_INTC
 CONFIG_SH_TIMER
 CONFIG_SH_PCI

and then in hw/sh4/Kconfig
 * config SH7750:
   add 'select SH_SERIAL', 'select SH_INTC', 'select SH_TIMER'
 * config R2D:
   add 'select SH7750' (it's a pre-existing bug that it doesn't, since
   r2d.c has a call to sh7750_init(). Harmless at the moment because
   nothing actually uses CONFIG_SH7750 -- hw/sh4/meson.build always
   compiles sh7750.c and sh7750_regnames.c unconditionally...)
   add 'select SH_PCI' (and make hw/sh4/meson.build build sh_pci.c
   only if it is set...)
 * config SHIX
   add 'select TC58128'

Do we have a general preference for how fine-grained we go with the
Kconfig switches ? Looking at the arm code, in some cases we have
a CONFIG_ for the SoC that uses 'select' to turn on a separate
CONFIG_ for each device (the STM32 SoCs are done this way), and
in some cases we just have the meson.build use the SoC's CONFIG_*
to control whether we compile its devices (the Xilinx and Exynos4
SoCs are done this way). When reviewing new code it would be helpful
to know whether to suggest doing it one way or the other :-)

thanks
-- PMM

