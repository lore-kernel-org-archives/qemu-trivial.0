Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kYVOs-0005bP-LS
	for mharc-qemu-trivial@gnu.org; Fri, 30 Oct 2020 10:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYVOq-0005WK-PL
 for qemu-trivial@nongnu.org; Fri, 30 Oct 2020 10:29:04 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:37862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYVOn-0000yW-P4
 for qemu-trivial@nongnu.org; Fri, 30 Oct 2020 10:29:04 -0400
Received: by mail-ej1-x642.google.com with SMTP id p9so8917175eji.4
 for <qemu-trivial@nongnu.org>; Fri, 30 Oct 2020 07:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CrRzD2OxH5662WFncZKSf2Ox7cQn2AYxZntw1toNEbs=;
 b=X2PJEKf2WVVNxxn4NBDT/5Xpr1Thzq/P2GXXPWAjEMiQmjVFD8XKRmDCqW7TxjX47o
 aBoF19VB+zGHQaM8KRIc/4mfxah+ArTI8N0lFuhXSVELywcxWfu+2ajfBN2Y9gY+Kq18
 hs/41zG3bIlOYt7bqIPfa/ct7K5eQSgANmZPDySyHo3e2t2J0qUfZTvNGXmIZ34izupv
 ep7snExaGXzDpG0GthKKvG478JeZ+H7TEnmi8v4dM6edSHSEB8ufzsUEc2b9pVlubGD2
 6Zkc6BUOcPF4GRsUHfpcUCYex4asRW2JDsA/igpFRQWuCeXL47lzHXxLKH1aSS17s4ES
 9y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CrRzD2OxH5662WFncZKSf2Ox7cQn2AYxZntw1toNEbs=;
 b=Lb1T9lFIj2Ky+3QwphZknNDlgbyalcRJrRsiQP+xhO/AprZdh18/nho5s1MKMT+r2b
 /y/taTR/GLuKVv5eFjIPZhzRsp/mL96OONceAx8KgmzNb9KRbm4XeRmDCGuZdXOK/kik
 MK6o7yX3qGKRqCN0FA/YAwjrwqrGlcDsnn6F8PV0KHDqJbAoHRLNDoOZWO057gBCXZoL
 hwUxzYbzv7KMSYZT2LDltKFQc3iX0Dl2jbTifNAwPLbj8wfFnM+uTZWfPbqgpf4c4eX8
 igDxf3977+r/byvw7DwIE/WIZ5XSx9rIKmb9vypUwOD4pJpqmhkitOo47n7MyzonOkH9
 WpuQ==
X-Gm-Message-State: AOAM532D/zMDrhUhhiPv160sQmxLmXF1bprrtIOCCrpbx7DRL7gV3/Ju
 /4yr63IUG1CiUEh8xo4oKe7Q/hOa56VNj/rodU5uDQ==
X-Google-Smtp-Source: ABdhPJzjC6cJsDtUPsYVPwW+zCCJr8NDdSfog3dkJ/0lZXEQ5qaw/Vt2bV6vV2Cy1MNlcK6ltK+szkSdVtEo/k/iAuE=
X-Received: by 2002:a17:906:1f42:: with SMTP id
 d2mr2667860ejk.407.1604068140154; 
 Fri, 30 Oct 2020 07:29:00 -0700 (PDT)
MIME-Version: 1.0
References: <5F9BE974.3040806@huawei.com>
In-Reply-To: <5F9BE974.3040806@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2020 14:28:49 +0000
Message-ID: <CAFEAcA_7xMjOTAWkk+k34oneB_KGCGk_hoBVMX-oDRMLZzR8Wg@mail.gmail.com>
Subject: Re: [PATCH] hw/display/exynos4210_fimd: Fix potential NULL pointer
 dereference
To: AlexChen <alex.chen@huawei.com>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
X-List-Received-Date: Fri, 30 Oct 2020 14:29:05 -0000

On Fri, 30 Oct 2020 at 10:23, AlexChen <alex.chen@huawei.com> wrote:
>
> In exynos4210_fimd_update(), the pointer s is dereferenced before
> being check if it is valid, which may lead to NULL pointer dereference.
> So move the assignment to global_width after checking that the s is valid
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  hw/display/exynos4210_fimd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
> index 4c16e1f5a0..a1179d2f89 100644
> --- a/hw/display/exynos4210_fimd.c
> +++ b/hw/display/exynos4210_fimd.c
> @@ -1275,12 +1275,12 @@ static void exynos4210_fimd_update(void *opaque)
>      bool blend = false;
>      uint8_t *host_fb_addr;
>      bool is_dirty = false;
> -    const int global_width = (s->vidtcon[2] & FIMD_VIDTCON2_SIZE_MASK) + 1;
>
>      if (!s || !s->console || !s->enabled ||
>          surface_bits_per_pixel(qemu_console_surface(s->console)) == 0) {
>          return;
>      }
> +    const int global_width = (s->vidtcon[2] & FIMD_VIDTCON2_SIZE_MASK) + 1;
>      exynos4210_update_resolution(s);
>      surface = qemu_console_surface(s->console);

Yep, this is a bug, but QEMU's coding style doesn't permit
variable declarations in the middle of functions. You need
to split the declaration (which stays where it is) and the
initialization (which can moved down below the !s test.

thanks
-- PMM

