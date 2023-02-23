Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVBlq-0007rz-Mj
	for mharc-qemu-trivial@gnu.org; Thu, 23 Feb 2023 08:36:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVBll-0007pm-Qa
 for qemu-trivial@nongnu.org; Thu, 23 Feb 2023 08:36:21 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVBli-000764-6q
 for qemu-trivial@nongnu.org; Thu, 23 Feb 2023 08:36:19 -0500
Received: by mail-pf1-x435.google.com with SMTP id g12so6009512pfi.0
 for <qemu-trivial@nongnu.org>; Thu, 23 Feb 2023 05:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ziMLKydJTay/BmNLV1+TS3AzWc2BBP9B0nqwN7+xrP4=;
 b=BtTRyxb7+dy2VMgw01VMpL1Hj91WrdUv/6B6g9evbk6SILXPsC8eFz0fB8OrhCdI5t
 RLDZOu5CZa+Esyp20IdmUDx+vj5xIpzcLbusF2E2rv3xJZMRAVsWdAv1DHZrJueI0SsZ
 8tJuaMsr/YIDQ2FzKTu+e7bBKsdxfRVezbwrOy9zLndZuY6V7XCAb+DXLSh5MGuBXrlo
 fXg51bQ7L6zc4JYMV51nvwD7hINgqPyMLW54ekjJoPHPCtkYlHzLC+p7MnITo05wkxGy
 tdroeb1sFaGqf5Lfz/l3siJtM2mccO2XxUrG5BxXKHg63Jvnc0r2HMoVH5dghDORy+dw
 xDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ziMLKydJTay/BmNLV1+TS3AzWc2BBP9B0nqwN7+xrP4=;
 b=XnDMF7cQB+fTrvjq2iKlnosSHFV3FkS7PAKAASRzJHmI7lZBXgkCbxgoYod5YcbgRl
 7CKPOs+nJZkpZyQN4yBx2ycxRzXxchBSoByocDhU7jUBebZTRmFvbzhNIk8FPrtf1WAI
 26i91j69rGJ34evCgPg9cC9O33dIpoKIn8UPwZd/f5p+r7YA9cFbojRrj2TMOIvXtHkE
 y6EK5hX2t/Fbzh36NaVvSyPE1w031V4u1GBlRwpeP6cvgy8F01JJgwzC4P/ndY2DxdUr
 hPXzYiAB5WF0wJtFuK1B5IOkIPGEpygC15Dkoe64WdveVJeTa+Ltjbhj3VRGs2wAq9Yl
 y81Q==
X-Gm-Message-State: AO0yUKUSYmFbp/sxXHF458W1PhgqR5zRPzgtAKyT9KoRXrkPwriBx3kI
 9uztZq/aJvZTdHz8VBPLdKAAjGpLiyGJSDGIjVcg0w==
X-Google-Smtp-Source: AK7set968R8ACxGV76QfmgC3Q1J6wAcT//jUUbrQA6Sbw+lr4pqpfoJcvdlxk5JiI2S3GaZOTJWK2B1aiEbDsTtqI2A=
X-Received: by 2002:a63:7555:0:b0:4fd:4602:1b9a with SMTP id
 f21-20020a637555000000b004fd46021b9amr1833686pgn.9.1677159376680; Thu, 23 Feb
 2023 05:36:16 -0800 (PST)
MIME-Version: 1.0
References: <20230113200138.52869-1-philmd@linaro.org>
 <f8a83363-ce88-e424-4db5-2fead70e4ec4@linaro.org>
In-Reply-To: <f8a83363-ce88-e424-4db5-2fead70e4ec4@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 13:36:05 +0000
Message-ID: <CAFEAcA_xqTmYHqv+4QZqouAYtFYRz=PrZNAk6y4arRPHjNrsug@mail.gmail.com>
Subject: Re: [PATCH 0/4] hw: QOM housekeeping around IOTHREAD / IRQ types
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-trivial@nongnu.org, Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 23 Feb 2023 13:36:22 -0000

On Tue, 7 Feb 2023 at 09:17, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Hi Peter,
>
> On 13/1/23 21:01, Philippe Mathieu-Daud=C3=A9 wrote:
> > - remove unused code
> > - use recent QOM macros
> > - use CamelCase typedef
> >
> > Philippe Mathieu-Daud=C3=A9 (4):
> >    iothread: Remove unused IOThreadClass / IOTHREAD_CLASS
> >    hw/irq: Declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()
> >    hw/or-irq: Declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()
> >    hw: Replace qemu_or_irq typedef by OrIRQState
> >
> >   hw/arm/exynos4210.c                  |  4 ++--
> >   hw/arm/mps2-tz.c                     |  2 +-
> >   hw/core/irq.c                        |  9 ++++-----
> >   hw/core/or-irq.c                     | 18 +++++++++---------
> >   hw/pci-host/raven.c                  |  2 +-
> >   include/hw/arm/armsse.h              |  6 +++---
> >   include/hw/arm/bcm2835_peripherals.h |  2 +-
> >   include/hw/arm/exynos4210.h          |  4 ++--
> >   include/hw/arm/stm32f205_soc.h       |  2 +-
> >   include/hw/arm/stm32f405_soc.h       |  2 +-
> >   include/hw/arm/xlnx-versal.h         |  6 +++---
> >   include/hw/arm/xlnx-zynqmp.h         |  2 +-
> >   include/hw/or-irq.h                  |  5 +----
> >   iothread.c                           |  4 ----
> >   14 files changed, 30 insertions(+), 38 deletions(-)
>
> Since most changes concern ARM machines, can this (reviewed)
> series go via your tree?

Sure; applied to target-arm.next, thanks.

-- PMM

