Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qKIH7-0000jl-Hn
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2023 08:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKIH5-0000jG-Lb
 for qemu-trivial@nongnu.org; Fri, 14 Jul 2023 08:51:55 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKIH4-0000d6-4U
 for qemu-trivial@nongnu.org; Fri, 14 Jul 2023 08:51:55 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fbf1f6c771so3212358e87.1
 for <qemu-trivial@nongnu.org>; Fri, 14 Jul 2023 05:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689339112; x=1691931112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ITf/kqcAbWKiUteud+m02bGvRT0KCZCBfrzgwH07mFU=;
 b=K2tJJX3RyyCicBr+K5XIz/Py9FcxVAhb7o+QaPAVjVfpKutiRITaaANo6fsMva+FEX
 H9Bf2ZYspsa71HQeWzERKz5sdEC1HSR7ODPH2urXjoK869h4OkZWQ7PnC07ZMCKKxXXn
 6ffoly9R0XRfuARdmCFBpWAhFTdJKgUBDNGfPSW1OIjlkPr5MwS90eMkKtFQNude0Eim
 f0cIu4U1TCuYb+U2IeXRI6BOR6FyaGi16UdJMfUi7iOpXC7PHNgYHdlE+Jp+zlKelrx/
 6gMsvGzpOdAzXFrrF7+YEFu6EG0a8zp8CdbMHIL4uvtbGsaBmai0XlKK29ql7SsHgk8s
 ppMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689339112; x=1691931112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ITf/kqcAbWKiUteud+m02bGvRT0KCZCBfrzgwH07mFU=;
 b=UQE2mqg9aMKduOaP7Tm5grYFOBzoKizGmWzVfi5QCfawKzV4DkYfcyhNmwAENeCjaj
 blKI1WcJozAH4Nni4WdoD3svY0SRH2UKmL+aFNKVfCcR0q/Xc9m6zGVgOZoJWqDWv2EW
 q3wm5Dea9PWqUVhWrISTtFz2/aeyoKRxVHP7UQUmXkknBhAufjnkvY1ljZe6/2gtBupb
 rS8wKZoCO0xu2cC13AjSzrGRiZ2K9BgOQXBHwfcyWGt/xVz/lJzJBokPNcjq7mqbomJU
 E5yqtXJm5opJvTGAIb9yAWKNaWruv7qwgYQlPdwcEV03DwbGEbplEJguhgjFjYDWVOhP
 GOjg==
X-Gm-Message-State: ABy/qLaE1Rqbg+Hp2BulVl/RKk5YptHm5yCKLylRf/Nuq0IxdDqkC3bo
 4JP57/qQX2s5Q63tuO4K4/Js6/4t65NtJTUz3IWyK5mc+XysCT4+
X-Google-Smtp-Source: APBJJlFwmLSYuDRd/G8B3V6w0gOoaAIT4i8eP5bNm0HFs91pN02QfB8DVtohOii5TogYw2h0yAYWNt6jGOHvcarJj2k=
X-Received: by 2002:a05:6512:2013:b0:4fa:f96c:745f with SMTP id
 a19-20020a056512201300b004faf96c745fmr3313726lfb.38.1689339112338; Fri, 14
 Jul 2023 05:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230714113834.1186117-1-mjt@tls.msk.ru>
 <20230714113834.1186117-10-mjt@tls.msk.ru>
In-Reply-To: <20230714113834.1186117-10-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jul 2023 13:51:41 +0100
Message-ID: <CAFEAcA8YgiN6N3C3SnXTM6P_sw9rOabW+FC-fX_YhPuwfpVggA@mail.gmail.com>
Subject: Re: [PATCH, trivial 08/29] tree-wide spelling fixes in comments and
 some messages: arm
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12b.google.com
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
X-List-Received-Date: Fri, 14 Jul 2023 12:51:55 -0000

On Fri, 14 Jul 2023 at 12:44, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  hw/arm/aspeed.c                | 2 +-
>  hw/arm/mps2-tz.c               | 2 +-
>  hw/intc/arm_gic.c              | 4 ++--
>  hw/intc/arm_gicv3_redist.c     | 2 +-
>  hw/intc/armv7m_nvic.c          | 2 +-
>  include/hw/arm/fsl-imx7.h      | 2 +-
>  include/hw/intc/armv7m_nvic.h  | 2 +-
>  target/arm/cpu.c               | 2 +-
>  target/arm/cpu.h               | 2 +-
>  target/arm/cpu64.c             | 2 +-
>  target/arm/helper.c            | 4 ++--
>  target/arm/tcg/m_helper.c      | 2 +-
>  target/arm/tcg/translate-a64.c | 4 ++--
>  target/arm/tcg/translate-mve.c | 4 ++--
>  target/arm/tcg/translate-sve.c | 2 +-
>  target/arm/tcg/translate-vfp.c | 2 +-
>  target/arm/tcg/vec_helper.c    | 2 +-
>  17 files changed, 21 insertions(+), 21 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

