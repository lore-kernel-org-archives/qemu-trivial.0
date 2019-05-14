Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hQUL3-0002xh-Eh
	for mharc-qemu-trivial@gnu.org; Tue, 14 May 2019 06:07:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51703)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hQUKz-0002tp-F8
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 06:07:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hQUKy-00089Z-F5
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 06:07:09 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43955)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hQUKy-000802-8E
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 06:07:08 -0400
Received: by mail-ot1-x343.google.com with SMTP id i8so14641853oth.10
	for <qemu-trivial@nongnu.org>; Tue, 14 May 2019 03:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7tU1y6cgDjkQulfnQj1uO3ZTQRYqn7MfRQezNbpW6lI=;
	b=gczBr28G3EVkNl4b5DarsJhVdC84KqN522VaCrnetnuMGTqQiDKnpKktIs5SJWUQgW
	gKGI5G33Y/j9c6V/QsFNZjoecs6RdYOG/k/rh6WbM810+BE2a2t+AeFpdiDfumjrwrZk
	oHzTIx1UiaywFc2fTgtJxiVQpyXqpbp26lmffxY5UmH7UZvLwTDJjqLpH+9mreqN73DZ
	0ZqWnddodozaF3MrbJ/LQfA2HaHh4yFTTIoR898vxIz8qPjW0kE1UbyyUJp31Pe8I7nn
	LVJPFFjivj4c6FLoQ4lPKzA2p/D4fQ/cUF1dLYs+VaZPRtod3lIvgNik+cG13h1YjJBW
	fOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7tU1y6cgDjkQulfnQj1uO3ZTQRYqn7MfRQezNbpW6lI=;
	b=m9S5kowMLfNn7htEuFM+fNSHp6JLzfaDc/tuVhfJYW20zgGEsAuZ2KxFIw++Cp2A6U
	tYpEfCFfucPeBOvAmrvz0PBYYgSiBf7RvWBnoq7Y0pD1Y6mTGi82FKmcxzuO9Et2ssfx
	5UMz4aGF3zvrcmcZS8Rlmon/G5NHt6ZkTqPCmYZDmcHC+TWA8ak1dvYhpxPWXqLQ/4EM
	pbMSxCXE3eq5gaXI2tOZ++IqoEM1teuNTgv3X+/v9unP/p9YtaALEvN+A5vo4u/FzXPY
	8k6C/NdmC3X7lLjx9VnmRoX0wb+3m0qziWhvvZgObYXwH75fnauwV2OAph4a788fC3tu
	S8Gw==
X-Gm-Message-State: APjAAAX8bILTxe6ImBsPiLkiTSVt38ZKY/B4ndC18I5f5YVSxzS7lFcc
	nqzHqr2NxAePAtJt0O+A388zG1BO0cXB8yUZZk5z9A==
X-Google-Smtp-Source: APXvYqzIPzJd+0AXNk4lgoPMHQ0oKdp+CZkTb5T1tnGlL4qEy1G32ZXmacunVGmqRYa/dLzTzZZNVxiuCDexNE+Jmz0=
X-Received: by 2002:a9d:5e07:: with SMTP id d7mr18983749oti.21.1557828425254; 
	Tue, 14 May 2019 03:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190514100019.13263-1-thuth@redhat.com>
	<20190514100019.13263-3-thuth@redhat.com>
In-Reply-To: <20190514100019.13263-3-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 May 2019 11:06:54 +0100
Message-ID: <CAFEAcA9bGr1249Ofx=TXLK3JNs1KMWTnRR+-FexKr__0AJAipQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-trivial] [Qemu-arm] [PATCH 2/4] hw/core: Add a config
 switch for the "or-irq" device
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 14 May 2019 10:07:11 -0000

On Tue, 14 May 2019 at 11:00, Thomas Huth <thuth@redhat.com> wrote:
>
> The "or-irq" device is only used by certain machines. Let's add
> a proper config switch for it so that it only gets compiled when we
> really need it.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/Kconfig        | 2 ++
>  hw/core/Kconfig       | 3 +++
>  hw/core/Makefile.objs | 2 +-
>  hw/pci-host/Kconfig   | 3 ++-
>  4 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index af8cffde9c..0bb3bbe9d3 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -277,6 +277,7 @@ config RASPI
>  config STM32F205_SOC
>      bool
>      select ARM_V7M
> +    select OR_IRQ
>      select STM32F2XX_TIMER
>      select STM32F2XX_USART
>      select STM32F2XX_SYSCFG
> @@ -424,6 +425,7 @@ config ARMSSE
>      select IOTKIT_SECCTL
>      select IOTKIT_SYSCTL
>      select IOTKIT_SYSINFO
> +    select OR_IRQ
>      select TZ_MPC
>      select TZ_MSC
>      select TZ_PPC

In cases like this where a device is used both by
an SoC and also directly by the board code that uses
that SoC, should we put the select OR_IRQ only in
the SoC's config, or also in the board model's config
(ie, in "config MPS2" as well as "config ARMSSE") ?

thanks
-- PMM

