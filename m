Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gCN30-00051c-By
	for mharc-qemu-trivial@gnu.org; Tue, 16 Oct 2018 06:57:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gCN2y-0004zl-UC
	for qemu-trivial@nongnu.org; Tue, 16 Oct 2018 06:57:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gCN2y-0006zR-24
	for qemu-trivial@nongnu.org; Tue, 16 Oct 2018 06:57:56 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:32882)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gCN2x-0006yI-QR
	for qemu-trivial@nongnu.org; Tue, 16 Oct 2018 06:57:55 -0400
Received: by mail-oi1-x241.google.com with SMTP id a203-v6so17663292oib.0
	for <qemu-trivial@nongnu.org>; Tue, 16 Oct 2018 03:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6fNQlT7a7uh/drHg7yE/0K0I4l0ifSOqfiZXxWYhEZs=;
	b=YYAZAzwCY6xD1jIsU04ZMHJi/poVonhRTtL+Iv7Q64NGwB3Nhuv9b7d2OgQV5c9M5D
	+27hFeL0o1Uk+VZ1ROe4BvIdvr2G8zOkymKt9UZF4tinSrHwim+SmUOIPFkz9vTeS9ip
	ILFGn5iJBFIZW4+YdoU/fuP8/DDwkEmK+vGWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6fNQlT7a7uh/drHg7yE/0K0I4l0ifSOqfiZXxWYhEZs=;
	b=kwE0AmYyL3uHfC+vqB3etqjs94alrFxWIz/KAEQSiVEzipdOywnjgQGr8URRRYxKuf
	x0ypAU8pGO22/dVDW+/LfXhLB/hH6ALFnJl3fTgDMHS9ef+yurxtFaWVJTGKkz5Z6857
	HhMVYWnF/djQKJm0tv3Xet7fQv5a5T6flbH0WYbTzqOwsjZhoeSvRjZPVT5BwYjCilwE
	KAxfVbfq1l/cB7HS985PdnV3SDR2phPCJFozZJUrVmB6OAZHMXYdZuF2tChOofWw+c0L
	swI0uhcf1+GQEjp7eGlJtUO805syEGb62fXqqmsd5dCZdAwiDk6mvwpxhfgVirxv6LHb
	5cxg==
X-Gm-Message-State: ABuFfoiu3iscKHRlzjvNhz6ZaifqUSFxkA9EKev3YmQv9ZG1xe6fFrxu
	//eT4WeMZjJ8/sKTZS6c2Fv720HcuMs6S9KxpYoqVg==
X-Google-Smtp-Source: ACcGV61z8nxC6MDn5b9haruPXjIpobs8LUK5CKkhySdYneDwHJFJyFu3srRT8hOTkjgKom22tpQtXs3rKN2FLzl3QAM=
X-Received: by 2002:aca:53c4:: with SMTP id
	h187-v6mr10480091oib.48.1539687474592; 
	Tue, 16 Oct 2018 03:57:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Tue, 16 Oct 2018 03:57:34
	-0700 (PDT)
In-Reply-To: <20181011035026.23517-1-xypron.glpk@gmx.de>
References: <20181010185445.10290-1-xypron.glpk@gmx.de>
	<20181011035026.23517-1-xypron.glpk@gmx.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Oct 2018 11:57:34 +0100
Message-ID: <CAFEAcA-95cCzjw6opxqCPvQjNOdRBh+ive3+G-SE-04c3qKF5Q@mail.gmail.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-trivial] [PATCH v2 1/1] hw/arm/virt: provide a model
 property in the fdt
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
X-List-Received-Date: Tue, 16 Oct 2018 10:57:57 -0000

On 11 October 2018 at 04:50, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> According to the "Devicetree Specification, Release v0.2" 'model' is a
> required property of the root node.
>
> Some software like the Debian flash-kernel package rely on this property
> to identify boards.
>
> The patch sets the model property to 'qemu,virt'.
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
> v2
>         use the recommended format of the model property
> ---
>  hw/arm/virt.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 281ddcdf6e..abe366895a 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -200,6 +200,7 @@ static void create_fdt(VirtMachineState *vms)
>      vms->fdt = fdt;
>
>      /* Header */
> +    qemu_fdt_setprop_string(fdt, "/", "model", "qemu,virt");
>      qemu_fdt_setprop_string(fdt, "/", "compatible", "linux,dummy-virt");
>      qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
>      qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);

The spec says "a string that uniquely identifies the model of the system
board". So should we be using "virt" for everything, or should we use
"virt-2.10", "virt-2.11", "virt-2.12", etc ?

thanks
-- PMM

