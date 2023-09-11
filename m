Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qfiyh-0003VJ-Ou
	for mharc-qemu-trivial@gnu.org; Mon, 11 Sep 2023 11:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qfiyg-0003V1-QM
 for qemu-trivial@nongnu.org; Mon, 11 Sep 2023 11:37:30 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qfiye-0002mN-J2
 for qemu-trivial@nongnu.org; Mon, 11 Sep 2023 11:37:30 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-52bcd4db4e6so6031669a12.0
 for <qemu-trivial@nongnu.org>; Mon, 11 Sep 2023 08:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694446646; x=1695051446; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aGRzY2KyKsenM+dLWLHy9SRONGo4LaQUGS3X8i/Jn80=;
 b=LgYNZwusTq6nXT125dgTp9pehT3kNHGBry+uhAoPjIrzFJ+8Qa0dCJNdRFk1wY95Or
 0+ReAD+j2Uj0HOFfmQCwkrI0xjbE67CNb5aIDVC7peQD0KrIjk0HuUOtow39Lb+96zj1
 nEbtPVXyBNGJz/K+5NZTy0kxvbpFH0/T3BH16JCGjFLrRTl8PUX0Ggb/wjHr8kknzOMB
 2FP8GkJVXZcXi+GWyXF2GArbmLpppbPzSBD4vOJ4Fe9Yd9qawRztVTC90lTZPBvdx7Xb
 pmYd7zl3muTbs5iNBkRhA/5F/eh1VAcU83AFXSPWwWyl+DsHw0ENfCIejNUX3k9yKSrb
 qKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694446646; x=1695051446;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aGRzY2KyKsenM+dLWLHy9SRONGo4LaQUGS3X8i/Jn80=;
 b=a9D4bSBFYYOJYXRIBlRbioDQbn81q7p8ow2gTsKy/V+XZN0P27LLzmHAEGppdvYKZq
 lqMFiza2YnCMbLIQ562dOakrp/ZCDKvHYZNw9l4BpH9uP6Uki1QMHrr5iu3Q573X5GCp
 vm1Qiz2x/yEUG6LiPOy/5u29cfx6xUaYXveJ3z9PZKPmZ+cJwxF6VJAnBYBLDpEQxO/G
 enDL547dZvfsDK4+LirSxDYgt24OL0AOINBhzZhFBFfPMs48o9CE7lH8yjH3ztmZ6yTw
 d896djK2JHhnq9u5C+1PVUKrSBSFqCgt9xwinQLZPLjoFzdMnFbP1vWObH6GcZ/kIyBw
 t9uA==
X-Gm-Message-State: AOJu0YyfeHzzG4GkIy+4GE1RikzTUmOp1sVo545IS3jDFp0yBWvTegb7
 05W34lTf4e74F3xW39hH460BrJL1lr/9v99F+BRUZg==
X-Google-Smtp-Source: AGHT+IEcxbwHn7GNGyVuygxltpHhPi3NT+g5DumhnLQio36fKG+d5IIzocLs9XFTOrdgwep0q915NUeha0mXYpQgQLE=
X-Received: by 2002:a05:6402:510:b0:52c:8a13:2126 with SMTP id
 m16-20020a056402051000b0052c8a132126mr8803356edv.37.1694446646241; Mon, 11
 Sep 2023 08:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230909131258.354675-1-mjt@tls.msk.ru>
 <20230909131258.354675-6-mjt@tls.msk.ru>
In-Reply-To: <20230909131258.354675-6-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Sep 2023 16:37:15 +0100
Message-ID: <CAFEAcA8Q3x-k_swFaFvkEMhYSAoSnb7ga6ijBhXMBkGYpX-B3Q@mail.gmail.com>
Subject: Re: [PATCH 5/7] hw/pci: spelling fixes
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-List-Received-Date: Mon, 11 Sep 2023 15:37:31 -0000

On Sat, 9 Sept 2023 at 14:18, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>


> @@ -503,7 +503,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
>                            &designware_pci_host_msi_ops,
>                            root, "pcie-msi", 0x4);
>      /*
> -     * We initially place MSI interrupt I/O region a adress 0 and
> +     * We initially place MSI interrupt I/O region a address 0 and

"at address 0"

>       * disable it. It'll be later moved to correct offset and enabled
>       * in designware_pcie_root_update_msi_mapping() as a part of
>       * initialization done by guest OS

> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index 7c7316bc96..87ba074254 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -177,7 +177,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>              acpi_dsdt_add_pci_route_table(dev, cfg->irq);
>
>              /*
> -             * Resources defined for PXBs are composed by the folling parts:
> +             * Resources defined for PXBs are composed by the following parts:

Should be "composed of", while we're editing the line.

>               * 1. The resources the pci-brige/pcie-root-port need.
>               * 2. The resources the devices behind pxb need.
>               */

otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

