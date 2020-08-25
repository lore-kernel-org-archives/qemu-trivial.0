Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kAaVM-0000Jd-Je
	for mharc-qemu-trivial@gnu.org; Tue, 25 Aug 2020 11:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAaVL-0000GD-1x
 for qemu-trivial@nongnu.org; Tue, 25 Aug 2020 11:04:55 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:46135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAaVJ-0003FI-48
 for qemu-trivial@nongnu.org; Tue, 25 Aug 2020 11:04:54 -0400
Received: by mail-ej1-x642.google.com with SMTP id d11so16793651ejt.13
 for <qemu-trivial@nongnu.org>; Tue, 25 Aug 2020 08:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KIXcaowuMym4eb+LaRrC6GPH85C78x9/rnLVMXOoZqs=;
 b=l00q5erMLE4Dmm5GH+fjk8so955LW4+QaljUWEdLO+iAVWal62GbCU3BhICehAw+/0
 Nl9qgDwp0LY63KzfvgZPbEfvRh9HzxjQDeJ11ZPvIkkwWOWaJ/9ffQMBcHvDb8VhiXgd
 yxqeaAVf/43UXfvlF0KWxdXdANTT5ikRrTevC6SdTNK6oNnwZR8E27zZ5l9xRsrc4vfk
 XMt3+29FVTqx/apfyZCDbtkXOfL07C3jPbxBFMolYJkF4YucgV15H/XBjl6CzKcLrJNC
 hsvy8tq3J9kZsW4RlCACFinWm2OwhemEO0VdgwPsgMUYDSfM/NArWGofh5o2oPsYwcox
 Mj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KIXcaowuMym4eb+LaRrC6GPH85C78x9/rnLVMXOoZqs=;
 b=DFlJRB6+ndvUwXieGdOl5CG/b0MVhuXkIPnYfbIALnoKJwGcMe08ytbSxNzSq4JlEY
 59NHgBDwS7IT2Snwq/jCO2rROM2Ro8rNnPNyH+arCG69Ty3r2zi4tB0OmcAsq0n+Ihpr
 pJ3/g+t+c3CkYPENeUJ9xie0dKTiFIl51TD8w+2+v2ioPCn4XqQWhl2FU135pvs3UrVY
 Hu03Y+oc8rB+ZlvV944S+iPSp9QBxWJ+HiShE1tGvvRfBrv+gnRuTjXjTf6CvLrK2wBD
 hvVPR/pd8V+0bDC3fAls+JZuzKx8DR5mrmjKfbfm39eH5qRjVFEh/9UiNg/CwWLAz6C0
 Craw==
X-Gm-Message-State: AOAM533bJcd/yWzi2pC70Ic49CAH3rsVNd+noNI81maKv8ZYuY5Itul6
 dTTBm8Ut3HpsRQiA7CRJwHWf4EaQypPjw0fmj29t3UHoU9NeAQ==
X-Google-Smtp-Source: ABdhPJxzzSSGguY/ldEpdEfyP/TpDWQjl1FRTvTgnfP+gYFUfATIZzZFnjqBQ9LQap01GlmWIrqR523CIshnOgyRKfs=
X-Received: by 2002:a17:906:2cc2:: with SMTP id
 r2mr10859286ejr.482.1598367891446; 
 Tue, 25 Aug 2020 08:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200818143825.691110-1-f4bug@amsat.org>
 <20200818143825.691110-3-f4bug@amsat.org>
In-Reply-To: <20200818143825.691110-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Aug 2020 16:04:39 +0100
Message-ID: <CAFEAcA8fbA0XKEHzMtTOmkzHCN7ji__wB+22uKTAp0-UAgEjEg@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/core/sysbus: Make sysbus_pass_irq() arguments
 self-describing
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 25 Aug 2020 15:04:55 -0000

On Tue, 18 Aug 2020 at 15:38, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Make the direction sysbus_pass_irq() pass the GPIOs more obvious
> by renaming its arguments as 'from_dev' and 'to_dev'.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/sysbus.h | 7 ++++++-
>  hw/core/sysbus.c    | 5 ++---
>  2 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
> index da9f85c58ce..65de6f6b062 100644
> --- a/include/hw/sysbus.h
> +++ b/include/hw/sysbus.h
> @@ -73,7 +73,12 @@ typedef void FindSysbusDeviceFunc(SysBusDevice *sbdev,=
 void *opaque);
>  void sysbus_init_mmio(SysBusDevice *dev, MemoryRegion *memory);
>  MemoryRegion *sysbus_mmio_get_region(SysBusDevice *dev, int n);
>  void sysbus_init_irq(SysBusDevice *dev, qemu_irq *p);
> -void sysbus_pass_irq(SysBusDevice *dev, SysBusDevice *target);
> +/**
> + * sysbus_pass_irq: Pass through IRQ/GPIO lines from one to another devi=
ce
> + * @to_dev: Device which needs to expose IRQ/GPIO lines
> + * @from_dev: Device which has the IRQ/GPIO lines
> + */
> +void sysbus_pass_irq(SysBusDevice *to_dev, SysBusDevice *from_dev);

I think this is less good than what we had before, because (as
per comments on patch 1) "to" vs "from" is ambiguous.
The 'before' here is not as good as the qdev_pass_gpios()
choice of "dev" vs "container", though, so I guess we should
make this function match that one.

> -/* Pass IRQs from a target device.  */
> -void sysbus_pass_irq(SysBusDevice *dev, SysBusDevice *target)
> +void sysbus_pass_irq(SysBusDevice *to_dev, SysBusDevice *from_dev)
>  {
> -    qdev_pass_gpios(DEVICE(target), DEVICE(dev), SYSBUS_DEVICE_GPIO_IRQ)=
;
> +    qdev_pass_gpios(DEVICE(from_dev), DEVICE(to_dev), SYSBUS_DEVICE_GPIO=
_IRQ);
>  }

Having these two functions pass the container and target in
opposite orders seems unnecessarily confusing. We should
make them use the same order, at least...

thanks
-- PMM

