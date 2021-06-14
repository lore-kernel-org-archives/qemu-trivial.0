Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lsrvk-00065p-U3
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jun 2021 15:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsrvj-00065W-Cq
 for qemu-trivial@nongnu.org; Mon, 14 Jun 2021 15:07:27 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:46907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsrvh-00067K-Mo
 for qemu-trivial@nongnu.org; Mon, 14 Jun 2021 15:07:27 -0400
Received: by mail-ed1-x52f.google.com with SMTP id s15so7001323edt.13
 for <qemu-trivial@nongnu.org>; Mon, 14 Jun 2021 12:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xrKcEgnbt1zkv06av8gffTuX/xWGXbYLlCu4r/xNRXE=;
 b=U6rizPhrNO5AFo6kc1kSu0VuMK/Y0oVc4LLmEkuuoGb1Wa33u0Mq1EIjyVMNuxSBnV
 3QXLiRJWg9aTD6pZWDppAD0no0XA3JvDjzbOuJSwxIzgLb5bFU3wnI2LD9YguQln/ZfV
 hyEa78ECrvNdcEX7wEU6oBDG7RQz+VJP0Wk3sDWuRQIZeuopAP/FnucZJ6MAT9laRvSC
 G9aI8d5aJryJgqqqDerhg1xP9sHB/OUkBo/eJykS++D8icUD8tcnCTepX2k1w81YcqUF
 9dRJGpItiGEqkXizeF2b7/RO2jYclGgKpu3qlVLC0p3Ii2EMjnLngwcs7hoPdRgbbZtf
 k9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xrKcEgnbt1zkv06av8gffTuX/xWGXbYLlCu4r/xNRXE=;
 b=nBKG6r8OxPs2oEGp02TO5ozih9yMAuzO4AGUP+cKfYnabefkUMC9TblT9zIGuoI6iz
 FlAinRStWFZx0EdxRRG9N1+ZJar01SLo4B/5QmHU21JM1w6GaJilwt7oP9+XmcExZS95
 GwEt9kYIPZsd2PylegWW+8D9bkCiJDttaeZ+hYlf771sNZYLElqn1IrkOkWZxUTelQBq
 I4NHomoYZyRYQ2OLIW9VcKpm4C/tc4FDNj51EKw8LnPq+Rr+zdSzc8MTq8aZhu+xc/L5
 HF7ALLtF4VDBDWgB7rjru1mqXtiaWLrVD+l3xHbHn65dNf67PCmmflP8rhSbT0TbzWIn
 ItMA==
X-Gm-Message-State: AOAM531aGyUmjW4uwWfkSgBip2C+Q2qwLoFB5lquMBP6HWBJJYMwM8bV
 JXhpwb5qOTSHQjy8CKbkVr6dFCq/Py0p/5dhr5W/Ug==
X-Google-Smtp-Source: ABdhPJyUeWDGpF8CROyEpGE0nqAre54/hcOT/LUiI635dHBh5UX52HhAA2LDigzFHNq2tbK1AvTDk3w7Efg4u+7qfmI=
X-Received: by 2002:aa7:d755:: with SMTP id a21mr19015747eds.146.1623697643842; 
 Mon, 14 Jun 2021 12:07:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210614183849.20622-1-email@aabouzied.com>
In-Reply-To: <20210614183849.20622-1-email@aabouzied.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jun 2021 20:06:49 +0100
Message-ID: <CAFEAcA_h2wQF4nDMhu3WT9AzCEMV3jCkDpuuorTREYaGoKaEwQ@mail.gmail.com>
Subject: Re: [PATCH] net: Replace TAB indentations with spaces
To: Ahmed Abouzied <email@aabouzied.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-List-Received-Date: Mon, 14 Jun 2021 19:07:27 -0000

On Mon, 14 Jun 2021 at 19:56, Ahmed Abouzied <email@aabouzied.com> wrote:
>
> Replaces TABs with spaces, making sure to have a consistent coding style
> of 4 space indentations in the net subsystem.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/377
> Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
> ---
>  hw/net/can/ctu_can_fd_frame.h |  180 ++---
>  hw/net/can/ctu_can_fd_regs.h  | 1260 ++++++++++++++++-----------------
>  hw/net/e1000_regs.h           |   30 +-
>  hw/net/mcf_fec.c              |    8 +-
>  hw/net/ne2000.c               |  138 ++--
>  hw/net/pcnet.c                |  136 ++--
>  hw/net/pcnet.h                |    4 +-
>  net/tap-linux.h               |   10 +-
>  8 files changed, 883 insertions(+), 883 deletions(-)

> diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
> index dcd3fc4948..ba20afefc4 100644
> --- a/hw/net/pcnet.c
> +++ b/hw/net/pcnet.c
> @@ -370,7 +370,7 @@ static inline void pcnet_rmd_load(PCNetState *s, struct pcnet_RMD *rmd,
>              uint32_t rbadr;
>              int16_t buf_length;
>              int16_t msg_length;
> -       } rda;
> +    } rda;
>          s->phys_mem_read(s->dma_opaque, addr, (void *)&rda, sizeof(rda), 0);
>          rmd->rbadr = le32_to_cpu(rda.rbadr) & 0xffffff;
>          rmd->buf_length = le16_to_cpu(rda.buf_length);

Indent seems to not be right in this hunk ?

thanks
-- PMM

