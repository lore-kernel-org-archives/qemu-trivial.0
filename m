Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qKIFZ-0008A7-7S
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2023 08:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKIFK-00088v-C8
 for qemu-trivial@nongnu.org; Fri, 14 Jul 2023 08:50:08 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKIFG-00009b-OK
 for qemu-trivial@nongnu.org; Fri, 14 Jul 2023 08:50:05 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-51e29ede885so2280050a12.3
 for <qemu-trivial@nongnu.org>; Fri, 14 Jul 2023 05:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689339001; x=1691931001;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YJ5Jujc82u0z5kH9rnsFbWWRI2Pb1ytEMqh9R3JffMs=;
 b=tUF2nT78wZlDnVNSjvGonyKEPLTe7AZY7c40w3mcXFMGrJyOuAavE4oYJKg0QoMkDR
 9FB55b7uIWCb80a9+5MCEowOMlke2AslEjBwPYlrEmv7rtDgWC1AowvuLuzVyjQ3BFd3
 UljcfRMotf0rg6Y1xv1stiS1r2Fv3zfBCw2UBwbPNogXibIQBdzw9DLRlMvmBZ3WUVaU
 kwj2WkWrYNeMX0Bcx9nDcuGGzucxNPwW7b334H3mHcRAKdRFGF8CjtnDGg/1ZYSrzs7w
 Jsp2D66nsS1UAAX3vbSQRgIWNtIV6t7Oh05iOWfwr17fmT6O1f9X/v95E9WLj5u1BtBP
 pKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689339001; x=1691931001;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YJ5Jujc82u0z5kH9rnsFbWWRI2Pb1ytEMqh9R3JffMs=;
 b=Gf3P+xcriwFZmSURs+NKnz+yYFfL1SKSX1lvs2LWDoIoOk/Vs5yAfw01nAmr3b0A6s
 lyU4r4OGMdW7M32dtm/FD7NXqnis42lyGtPAq+ZjpF+1Hmgt4BHx9rgj3JkQ+bZHGYze
 698tjKGoxMfWVPy+U1esqdbbCYUHdNwRqYLpt0jizzOrqocjhMfXsgkx/NwfT0me3Phh
 p63XXlw5jQdyx5p1nruolfUJVjE9zKalMSksfk0v2RP5hjnftyEOfe+6zd55N8in1zmQ
 j7jNnr5rSxysYzHLn1nGqcuvBHX2Y19YzqGjWS5SkMXR7A2Fqo+U8xpLfraDoS+84dKJ
 Bn1Q==
X-Gm-Message-State: ABy/qLbGnXikIgx0ymMk7gS7/GmfAU7ab6+7GIjC48WFQ39jo1xfjWbd
 ITww7myO0k9xTHyyJDB6K77kLEmqAQo0u40KogMuVA==
X-Google-Smtp-Source: APBJJlH4sJa/6DtqrPseH5U2GyKQdNfNJKQ7NzZJHM5cnyd48j2Jd0dEFXZhdsWvwtL91zxdhPaj63K844VWtt2CZJ0=
X-Received: by 2002:aa7:d8d4:0:b0:51d:8ab1:5df4 with SMTP id
 k20-20020aa7d8d4000000b0051d8ab15df4mr4087451eds.21.1689339000978; Fri, 14
 Jul 2023 05:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230714113834.1186117-1-mjt@tls.msk.ru>
 <20230714113834.1186117-17-mjt@tls.msk.ru>
In-Reply-To: <20230714113834.1186117-17-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jul 2023 13:49:50 +0100
Message-ID: <CAFEAcA-VJG_Mt3AVtUeFPK+2sdg=kNabMijy0og9_fH=rQ92fw@mail.gmail.com>
Subject: Re: [PATCH, trivial 15/29] tree-wide spelling fixes in comments and
 some messages: other architectures
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
X-List-Received-Date: Fri, 14 Jul 2023 12:50:08 -0000

On Fri, 14 Jul 2023 at 12:40, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  host/include/aarch64/host/cpuinfo.h              |  2 +-

This...

>  hw/misc/allwinner-r40-dramc.c                    |  2 +-
>  hw/misc/exynos4210_rng.c                         |  2 +-

...these...

>  tests/tcg/aarch64/gdbstub/test-sve.py            |  2 +-
>  tests/tcg/aarch64/sme-outprod1.c                 |  2 +-
>  tests/tcg/aarch64/system/boot.S                  |  6 +++---
>  tests/tcg/aarch64/system/semiheap.c              |  2 +-

...and these are all arm, not "other".

But anyway, for the whole patch
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

