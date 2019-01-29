Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goV26-0005DB-Vm
	for mharc-qemu-trivial@gnu.org; Tue, 29 Jan 2019 10:10:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1goV1w-00053M-Jl
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 10:10:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1goV1b-0006Rp-IA
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 10:10:16 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:41141)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1goV1b-0006Nh-Dt
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 10:10:07 -0500
Received: by mail-ot1-x341.google.com with SMTP id u16so18131870otk.8
	for <qemu-trivial@nongnu.org>; Tue, 29 Jan 2019 07:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FXy/0xrxGUndw9cUjyJrDYX2PS81ENoDlIBK7WQ7S7s=;
	b=doRt9sb/Cwd1EX/zRTFGU2jDCFuGJoL9lJ+iqm97nDBBdNpj1Tk6T+cmGVu/tkcxns
	FAA+FMWvxETz4LyMUIAimS5h+NTjcZEvzIhgAopo6I7cH/mSXYmOz1FkhErxQast9Ypa
	xCCLGp0flubvz7b0ec5K3lwQvTRNNlcsU0i+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FXy/0xrxGUndw9cUjyJrDYX2PS81ENoDlIBK7WQ7S7s=;
	b=e6oDowDAFnWfr7G/OXe3ucY/1JwxUY6P2wwg1Kexn5nN+PlomC85fD3knFqcaShX2e
	vWScyYWzzDGJd7thdenB10CyW8Typ40qYWRWcM3Rjiy5sZ8wrjNB7bqqh3yy9QEhtUF1
	0Wsh4VFKzF6LvXLAKNtUjsM7Dj28fe7e51ZchvHQAtwOxhZ4BDv62Ci522pQDb+XvY5V
	VIJNISc+0vEOg8zmC3773ey17sKFjE2S/cdfQwFBNbqLlJV9TlYziIy+ObYiBqB7gavc
	bcPjmjTMzJqvILUElCcGJfkhySy8phucn3QordqJK0X/tEt6KThTYlzeBUNLf83lM6gn
	JO+Q==
X-Gm-Message-State: AJcUukctJYyHD9qODhREgiGVwHaHjD40UYt/bMpAj72dRMqKduxdJZAS
	fss3lHtlN/fWw1XFxhhfSGImkBA1qjMgFNGbOWXa6g==
X-Google-Smtp-Source: ALg8bN4jl8xy2Tc7vF8r/1LrlDTLkBLURCN9Expo2erxpOWv2zQJZI2uHonUK5e3SYWo8VBv95MXubmJSNaEmXlF40U=
X-Received: by 2002:a9d:3a22:: with SMTP id j31mr20041441otc.238.1548774586798;
	Tue, 29 Jan 2019 07:09:46 -0800 (PST)
MIME-Version: 1.0
References: <20190125155630.17430-1-sourav.jb1988@gmail.com>
In-Reply-To: <20190125155630.17430-1-sourav.jb1988@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jan 2019 15:09:34 +0000
Message-ID: <CAFEAcA-E=-6H340nhA258GkCbM2YC4=CxCRsBicanKJtEc7SXA@mail.gmail.com>
To: kumar sourav <sourav.jb1988@gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Joel Stanley <joel@jms.id.au>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-trivial] [PATCH] hw/arm/nrf51_soc: set object owner in
 memory_region_init_ram
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
X-List-Received-Date: Tue, 29 Jan 2019 15:10:38 -0000

On Fri, 25 Jan 2019 at 15:56, kumar sourav <sourav.jb1988@gmail.com> wrote:
>
> set object owner in memory_region_init_ram() instead
> of NULL.
>
> Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>
> ---
>  hw/arm/nrf51_soc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
> index 1630c27594..3a1c7e200c 100644
> --- a/hw/arm/nrf51_soc.c
> +++ b/hw/arm/nrf51_soc.c
> @@ -89,7 +89,8 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
>      }
>      memory_region_add_subregion(&s->container, NRF51_FLASH_BASE, &s->flash);
>
> -    memory_region_init_ram(&s->sram, NULL, "nrf51.sram", s->sram_size, &err);
> +    memory_region_init_ram(&s->sram, OBJECT(s), "nrf51.sram", s->sram_size,
> +                           &err);
>      if (err) {
>          error_propagate(errp, err);
>          return;


Applied to target-arm.next, thanks.

-- PMM

