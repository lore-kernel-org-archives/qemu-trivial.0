Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hQUrI-0004jO-Or
	for mharc-qemu-trivial@gnu.org; Tue, 14 May 2019 06:40:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hQUr9-0004IF-4q
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 06:40:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hQUih-0008T4-O2
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 06:31:41 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34823)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hQUif-0008OZ-Pf
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 06:31:38 -0400
Received: by mail-wr1-f66.google.com with SMTP id w12so18608317wrp.2
	for <qemu-trivial@nongnu.org>; Tue, 14 May 2019 03:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VmJfXoC2WzST8DEgwuGF4IR2cehYCXYnXTuYbo9V1ek=;
	b=QRmw+zCsL4bxAA3gS5vkmdgT/X3ZLA4GhJQedlsgsJPI3txQwjfQhSFbgjK0YWP0oH
	XptNMHF/Mbp2RGPQZczoZ3zhHYSY7Am9zBKZn0ryGLpEDJ4wdnazTg+fTeO4uJZ+E6KX
	ts0QRyI+x2XhJQ7qpSHzFmLfVse00o84CJsWjK0XgCoDwHDviB715514RPd5HZGBzQvz
	IaOfjpZHSJFMnFdbuoI9J2lm8jEEpEh7Jo1RU7QHju7YkvgvXLVai1L1/5ArFz5ymAaI
	m0nuNXxkUiyoCYWJ5QPrt9MwwmvfDsvNfOuu8uuRPgnlvGEbIhYirZmzc3ZKjDiL9NFQ
	aWQg==
X-Gm-Message-State: APjAAAUz8IZON3jAgxW5j1aDJk63JwscjW7WZvvmqnJGQCjFi+3elBsA
	RcR3fkSX4/kuXN95ylBc0hlWp1Jeq5A=
X-Google-Smtp-Source: APXvYqyvw0y5IlR+fOse6T5W+dmIwfwmj1mTJIkcz+u97f41RQLvxIXlGwmoaGpyH/qFuxnSdTUNdQ==
X-Received: by 2002:a05:6000:43:: with SMTP id
	k3mr21264111wrx.234.1557829894567; 
	Tue, 14 May 2019 03:31:34 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193])
	by smtp.gmail.com with ESMTPSA id o4sm2766773wmc.38.2019.05.14.03.31.33
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 03:31:33 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-trivial@nongnu.org
References: <20190514100019.13263-1-thuth@redhat.com>
	<20190514100019.13263-2-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <b8cd670b-7a76-6197-1949-3600a8d1dbe0@redhat.com>
Date: Tue, 14 May 2019 12:31:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514100019.13263-2-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-trivial] [PATCH 1/4] hw/core: Add a config switch for the
 "register" device
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
X-List-Received-Date: Tue, 14 May 2019 10:40:24 -0000

On 5/14/19 12:00 PM, Thomas Huth wrote:
> The "register" device is only used by certain machines. Let's add
> a proper config switch for it so that it only gets compiled when we
> really need it.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/core/Kconfig       | 3 +++
>  hw/core/Makefile.objs | 2 +-
>  hw/dma/Kconfig        | 1 +
>  hw/timer/Kconfig      | 1 +
>  4 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/core/Kconfig b/hw/core/Kconfig
> index c2a1ae8122..d11920fcb3 100644
> --- a/hw/core/Kconfig
> +++ b/hw/core/Kconfig
> @@ -9,3 +9,6 @@ config FITLOADER
>  
>  config PLATFORM_BUS
>      bool
> +
> +config REGISTER
> +    bool
> diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
> index a799c83815..d493a051ee 100644
> --- a/hw/core/Makefile.objs
> +++ b/hw/core/Makefile.objs
> @@ -16,7 +16,7 @@ common-obj-$(CONFIG_SOFTMMU) += machine.o
>  common-obj-$(CONFIG_SOFTMMU) += loader.o
>  common-obj-$(CONFIG_FITLOADER) += loader-fit.o
>  common-obj-$(CONFIG_SOFTMMU) += qdev-properties-system.o
> -common-obj-$(CONFIG_SOFTMMU) += register.o
> +common-obj-$(CONFIG_REGISTER) += register.o
>  common-obj-$(CONFIG_SOFTMMU) += or-irq.o
>  common-obj-$(CONFIG_SOFTMMU) += split-irq.o
>  common-obj-$(CONFIG_PLATFORM_BUS) += platform-bus.o
> diff --git a/hw/dma/Kconfig b/hw/dma/Kconfig
> index 751dec5426..5c61b67bc0 100644
> --- a/hw/dma/Kconfig
> +++ b/hw/dma/Kconfig
> @@ -16,6 +16,7 @@ config I8257
>  
>  config ZYNQ_DEVCFG
>      bool
> +    select REGISTER
>  
>  config STP2000
>      bool
> diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
> index 51921eb63f..f575481210 100644
> --- a/hw/timer/Kconfig
> +++ b/hw/timer/Kconfig
> @@ -36,6 +36,7 @@ config TWL92230
>  
>  config XLNX_ZYNQMP
>      bool
> +    select REGISTER
>  
>  config ALTERA_TIMER
>      bool
> 

Annoying, this clashes with "hw/microblaze: Kconfig cleanup" which is
already queued by Paolo:
https://lists.gnu.org/archive/html/qemu-devel/2019-04/msg04669.html

