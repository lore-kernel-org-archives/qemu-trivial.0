Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZYXW-0006i4-7y
	for mharc-qemu-trivial@gnu.org; Mon, 02 Nov 2020 07:02:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZYXU-0006fJ-3J
 for qemu-trivial@nongnu.org; Mon, 02 Nov 2020 07:02:20 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:32807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZYWz-0004lu-9o
 for qemu-trivial@nongnu.org; Mon, 02 Nov 2020 07:02:19 -0500
Received: by mail-ej1-x641.google.com with SMTP id 7so18575732ejm.0
 for <qemu-trivial@nongnu.org>; Mon, 02 Nov 2020 04:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jkzWocvmBlBIpVDb4D3N24qjnp3Vi1uGUcZoWRXSxs4=;
 b=ZK9FioucVXTl4UPNHfBBC49O0Hgr5TKHThBOqPo027j2Hx/NYZNNXItMghYpuvPnc7
 P2c89fCjOUEsoJU5s6Hs6bPXtp+M/27ZF5qtYJgrri4e5SWl4u6LYG02Kq95DYjQplQs
 i8IAKOi3RusKCnzchQFHqPuMFSIN0JVYtNW3BVrfjC02D5Gsc865dvaR1HBfIgbZy/QQ
 EsFmAy4EWVoPtUbebpStGAQuOedCx7r6u5YrkFf5nf12GQmpJOFPJfsdN03iJFe/Ieu5
 JrysVb7D48wpxV1ZNAcVoYsQ4Upt2QOY6A3yr716J7Ozx/QkYW+13zj1DGKH21f/HiQG
 jz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jkzWocvmBlBIpVDb4D3N24qjnp3Vi1uGUcZoWRXSxs4=;
 b=pnWLDczarl2BZfLs63fOJk2htuKJxnDLloL0GPdN8t23ytZTdhUKRxcMLy1WRsy0pQ
 lPDyuxk34MyrqPXC+N4pGYHyLFBuvLd6Vv17mBKEqzdOMeD1LC5pLq0VSuo7UaPOhY57
 6oOoZvmwr1Rp35LLjXCUsCvYEHAdNcIUdl45mp2VVsjZYH2mi4gIHTKcHCSuEWelkIAG
 TAYZHjqYzdjy/hLkjJFOD+eoOkOiwndsRnGqSjyQFgv8RCEwezP+I8qCeYvEcT9mEvAW
 Wo+T1rLibOmOZE5iXQTmupDwMaZu/59bg6k5/oCYpRCtv2NsLukQCcL/DFommcLqsEML
 hGKg==
X-Gm-Message-State: AOAM530dmda4rwZs7BxgkCfDvHBlmZEvNhJEUqwx7ADUCAkOGWTm2k9w
 JIjrCYtjLMel5L+EnTYD1c5knCrYK5Mz8otgkBZn8A==
X-Google-Smtp-Source: ABdhPJw3VjzSNEm+6kJblf31CAiwb2jTaNS7CZpEhd4Ii/E1cefArjTcnyH2zvHHj6RogXxbPKK+8m22QLA/qVnPNm0=
X-Received: by 2002:a17:906:3b59:: with SMTP id
 h25mr15773660ejf.56.1604318507431; 
 Mon, 02 Nov 2020 04:01:47 -0800 (PST)
MIME-Version: 1.0
References: <5F9CDB8A.9000001@huawei.com>
In-Reply-To: <5F9CDB8A.9000001@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Nov 2020 12:01:36 +0000
Message-ID: <CAFEAcA9jBfGS-hG1SxurS3k98XOGpLzka2siw+BZTCHx6fg1Cw@mail.gmail.com>
Subject: Re: [PATCH V2] hw/display/omap_lcdc: Fix potential NULL pointer
 dereference
To: AlexChen <alex.chen@huawei.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU <qemu-devel@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, zhengchuan@huawei.com, 
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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
X-List-Received-Date: Mon, 02 Nov 2020 12:02:20 -0000

On Sat, 31 Oct 2020 at 03:35, AlexChen <alex.chen@huawei.com> wrote:
>
> In omap_lcd_interrupts(), the pointer omap_lcd is dereferinced before
> being check if it is valid, which may lead to NULL pointer dereference.
> So move the assignment to surface after checking that the omap_lcd is valid
> and move surface_bits_per_pixel(surface) to after the surface assignment.
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: AlexChen <alex.chen@huawei.com>
> ---
>  hw/display/omap_lcdc.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)



Applied to target-arm.next, thanks.

-- PMM

