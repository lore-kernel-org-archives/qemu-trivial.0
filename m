Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjs2g-0007rF-BN
	for mharc-qemu-trivial@gnu.org; Fri, 03 Mar 2017 13:35:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjs2e-0007pJ-9T
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:35:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjs2d-00085V-Dg
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:35:00 -0500
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236]:36596)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjs2d-00085P-7i
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:34:59 -0500
Received: by mail-wm0-x236.google.com with SMTP id n11so21917064wma.1
	for <qemu-trivial@nongnu.org>; Fri, 03 Mar 2017 10:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dNNTZWQUpLPV+dqzjMw2gY+k4LuRRb9Zsjz38EYFaFo=;
	b=P1G6vsIlns04MkqSd0A//g2VCSSKHY2S4TlVPgjcGn0arpCRbaoOZYiUh0vLxMkhcJ
	KMtYjFqTi+CEdz2LeuCoenHyE3Mq6cXCWWNGNQ9RnUDKE72BthsDiyxr+S8oN8GSBhzQ
	BqCzZSztG4gHYGpRRaOFLh9zySyafEEkw8GWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dNNTZWQUpLPV+dqzjMw2gY+k4LuRRb9Zsjz38EYFaFo=;
	b=UBkk6rvex5NEid8vdrzmYh03Z2IjoqFftdWYTYcj/NWQEmIhRm36t5dVJugy6FIGfj
	bZ/vpD3PpiheG46peaPwgaavdqm0ZK3mongBMWJM0rhJTQuHqjKpQjgLx04ds3Cur7E4
	MJbj92gWgCIrZhw7wiFSPsVAh08qEt339Zj2A7Rx/CpB3gIyXnezJ1yLBkThrWmmrPll
	695kpApN15BFiIlj/CTUVRghKV7H8jisXjE4pbPYVnXrwz9lgnccMzw2Ic5eCmvy/ul/
	COFGTB30rNKWvS2Pr88nqIRCETrgtfVmMQezJWf1YuLmMFd6boE84u1LR6Lnc3MugICQ
	jDfw==
X-Gm-Message-State: AMke39nqOV4A6QPfzl6jJyZoZi0s8XYsTGoeaKU8AxRHoKlDPQ+VCHFXszxin9BgNj00fEhKVftZX7S7yEdepLF8
X-Received: by 10.28.172.68 with SMTP id v65mr3810979wme.111.1488566098215;
	Fri, 03 Mar 2017 10:34:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Fri, 3 Mar 2017 10:34:37 -0800 (PST)
In-Reply-To: <cc6a20fc4a2748f24920c03ce64ae34af0f61799.1488504063.git.balaton@eik.bme.hu>
References: <cover.1488504063.git.balaton@eik.bme.hu>
	<cc6a20fc4a2748f24920c03ce64ae34af0f61799.1488504063.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2017 18:34:37 +0000
Message-ID: <CAFEAcA9MJbTHT9DdGOpHsPBTW3BXsr9mPtVmOodHgyNF0Jwf_Q@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::236
Subject: Re: [Qemu-trivial] [PATCH v3 13/13] ppc: Add SM501 device in config
 for ppc and ppcemb targets
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
X-List-Received-Date: Fri, 03 Mar 2017 18:35:01 -0000

On 13 December 2016 at 21:00, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> This is not used by default on any emulated machine yet but it is
> still useful to have it compiled so it can be added from the command
> line for clients that can use it (e.g. MorphOS has no driver for any
> other emulated video cards but can output via SM501)
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  default-configs/ppc-softmmu.mak    | 1 +
>  default-configs/ppcemb-softmmu.mak | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/default-configs/ppc-softmmu.mak b/default-configs/ppc-softmmu.mak
> index 09c1d45..1f1cd85 100644
> --- a/default-configs/ppc-softmmu.mak
> +++ b/default-configs/ppc-softmmu.mak
> @@ -45,6 +45,7 @@ CONFIG_OPENPIC_KVM=$(and $(CONFIG_E500),$(CONFIG_KVM))
>  CONFIG_PLATFORM_BUS=y
>  CONFIG_ETSEC=y
>  CONFIG_LIBDECNUMBER=y
> +CONFIG_SM501=y
>  # For PReP
>  CONFIG_SERIAL_ISA=y
>  CONFIG_MC146818RTC=y
> diff --git a/default-configs/ppcemb-softmmu.mak b/default-configs/ppcemb-softmmu.mak
> index 7f56004..94340de 100644
> --- a/default-configs/ppcemb-softmmu.mak
> +++ b/default-configs/ppcemb-softmmu.mak
> @@ -15,3 +15,4 @@ CONFIG_I8259=y
>  CONFIG_XILINX=y
>  CONFIG_XILINX_ETHLITE=y
>  CONFIG_LIBDECNUMBER=y
> +CONFIG_SM501=y
> --
> 2.7.4

This looks fine but I'll leave official review of it to a ppc person.

thanks
-- PMM

