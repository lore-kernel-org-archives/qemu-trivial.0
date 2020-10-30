Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kYVPw-0006WF-3D
	for mharc-qemu-trivial@gnu.org; Fri, 30 Oct 2020 10:30:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYVPp-0006U0-Ur
 for qemu-trivial@nongnu.org; Fri, 30 Oct 2020 10:30:07 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:46215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYVPo-00014X-6V
 for qemu-trivial@nongnu.org; Fri, 30 Oct 2020 10:30:05 -0400
Received: by mail-ed1-x542.google.com with SMTP id t11so6804483edj.13
 for <qemu-trivial@nongnu.org>; Fri, 30 Oct 2020 07:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NFC39zceG2i5PizwvZ93zNijf5+W6zdm3h74OVX7MHw=;
 b=u+QJ+YdXWOzUPGLjBli0nwiLKVuv471nujgNi/3R6oF3X6zsMN0E3wsg75seRCVAuJ
 JNTvntIE1UJOcldV+vP4tAmdR4YuG9X9O4dCa4jeXNh+DzfvUAT/D29r+tvNzkpOxo6u
 Sgov0uQD/mFtATUnQlarNkCeeRmr9VSQHvYplgEV1uBnR7DL4yzu7LTaGEJN/ERZ+4cK
 SbYwKI5QGBevA+jI8sVHtmWswVk+1Y5DLGRjhjyomj72R4v6nUIsFH27ROmlUnWRmOc2
 PmJ2rki2L/MMr8q+Wi/hCLJ/jXeOecjx+uf3bfCg5yL7veNuBSbzqikNrV8FLX9AAkRv
 EQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NFC39zceG2i5PizwvZ93zNijf5+W6zdm3h74OVX7MHw=;
 b=TxR3l9sgN6i07AIQ0YGSEGXpbu254hSf+Y5gw9WlmowV0AI9vN8yyF46DQUKmv91vk
 4mUoNea+7p7EhaLc5SaIF/y48b7O9gVd9j/r/X4LuQjcx7QwRrGkNf0Z9XzWlHPdjLqs
 D7V+yhJAno8nGqtGfsOoe/Xtfwb8GLprqyw/TG4LuPe25Dj1M7kpGpofL5vdEUSPuEjd
 vxKq6v0YFmgV2TyUvCE1mxr/aD/UOOFBwXlg4tZNLAa+kRnehPEWee5vsH9vK1lf1eKL
 Lpmg7OSKGhyteutImaUXFS1EoH3KnzW4eh1bSJtQKXDqqAPW+ItKb1u7jW6bSmf0qn0x
 oBRQ==
X-Gm-Message-State: AOAM532x1BBWbf99trTeYotHB/sur4Oto7reY2aha/Em9gYFQNVPLYc4
 gveKrLFiN0qbI1JPT1n7Lxl1VmIvbXu7KJcbx5SHUQ==
X-Google-Smtp-Source: ABdhPJx6FCWljKrUairC2DLeWPCw2fKw1oLldfsils4Y62/uuplvIwLeKUS5j6F4jcxjXcsCdgijcJKRuYI+Tm2U0so=
X-Received: by 2002:aa7:d699:: with SMTP id d25mr2639196edr.44.1604068201154; 
 Fri, 30 Oct 2020 07:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <5F9BE993.4050406@huawei.com>
In-Reply-To: <5F9BE993.4050406@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2020 14:29:49 +0000
Message-ID: <CAFEAcA8hpb2UVd3PSY4XuEpKYeu1Am1+41DQ=gN48xbAv281TQ@mail.gmail.com>
Subject: Re: [PATCH] hw/display/omap_lcdc: Fix potential NULL pointer
 dereference
To: AlexChen <alex.chen@huawei.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU <qemu-devel@nongnu.org>, 
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 30 Oct 2020 14:30:08 -0000

On Fri, 30 Oct 2020 at 10:23, AlexChen <alex.chen@huawei.com> wrote:
>
> In omap_lcd_interrupts(), the pointer omap_lcd is dereferenced before
> being check if it is valid, which may lead to NULL pointer dereference.
> So move the assignment to surface after checking that the omap_lcd is valid.
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  hw/display/omap_lcdc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM

