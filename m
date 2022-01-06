Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5UCS-0003jy-RN
	for mharc-qemu-trivial@gnu.org; Thu, 06 Jan 2022 09:57:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5UCR-0003ic-91
 for qemu-trivial@nongnu.org; Thu, 06 Jan 2022 09:57:07 -0500
Received: from [2a00:1450:4864:20::434] (port=45658
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5UCP-0006QM-Jn
 for qemu-trivial@nongnu.org; Thu, 06 Jan 2022 09:57:06 -0500
Received: by mail-wr1-x434.google.com with SMTP id q8so5234444wra.12
 for <qemu-trivial@nongnu.org>; Thu, 06 Jan 2022 06:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=C1KWiuro5yW4XPrGSKh0APssAzNtgml64Q3JDHHCffc=;
 b=kl/Q5b03dHU51hv6kSA+sCaTJq6wa/tmTcZQFY0pqYg44UDjGsuZhuW3PVGko6ydWv
 LZQy0tNJ9ZbrkzFsLU9Jj5c8DWQPy3pia6nXn6Yn1JjdN/e1fs6ozPIbUTmDblDCSR0U
 v2VnpPElwluCU/ajsZvs0QFB1Nk3h8+XsE1+B5WnAvTvxviCS8nihSAhTayFOx2d1Ihl
 nNh7Q9uH2597X6lNnoCsz8WcNQSmNle+jO0ds/u7363kYlVmHATn818ZbVyQVwCLjmQy
 7FsikOVpraiX3tkiN2uSrha362bfRjZXxS4LBVxKin7B+b3nN2h5WYU+rSxdx6cCPlj/
 6jLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C1KWiuro5yW4XPrGSKh0APssAzNtgml64Q3JDHHCffc=;
 b=f+UQtqiwoPLfvvgri7wkobkW3A6TFtc8QEd1D6O2uhMAf0AV0LucA69rs/ViudG/0T
 J/9S4b/TOb9vsMa3MCLTUpnduBfH00JiAhTnVAGDEx9KipuNqMZfHdgrk09EkhN5402L
 5Zcjl8ngKwbZrq83Y/wvjnXDhoDmRdM/MLqL0jPGjBDhPa/HX/vmCFvF+KiWIJIjCZzx
 e8LZGLBLaMf/N8o6Jjpb1Dgk8kqWBb+wT/LaujBNFSOThmQVOZWJ6x6672n993744fzM
 38sva3S3Lo6zTULx2CIpPcrjZEkWhhlMuS7c1h00fHyOTKKnnAF/2M0ux5VJuQkrF1CB
 g65w==
X-Gm-Message-State: AOAM533jmdR3fbu5vHMw/DtrH1LtgM5KGZMo6eCXJXzMM4lMUpGO5hAR
 BiF00H/gxDTPfHmy7P5yNlBhkmVdy6VfMLHmQPDfJw==
X-Google-Smtp-Source: ABdhPJy4ZINlFh21YC4Iz29V0KJ8E4aj/VPOIai+i5Qbj+GXuyvaGcDafXXkjDuBrjPGHQWQ0oKPbN7a/V0fKmAuFb0=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr29652400wrv.521.1641481024296; 
 Thu, 06 Jan 2022 06:57:04 -0800 (PST)
MIME-Version: 1.0
References: <20211122104831.1052063-1-f4bug@amsat.org>
In-Reply-To: <20211122104831.1052063-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jan 2022 14:56:53 +0000
Message-ID: <CAFEAcA9PiJfG9gLr7cGs2n-a9TojfKi+QHN20kNw_efO6Gkw5Q@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/auxbus: Improve aux_bus_init() docstring
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 06 Jan 2022 14:57:07 -0000

On Mon, 22 Nov 2021 at 11:11, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Mention in aux_bus_init() docstring that the AUXBus
> is not simply initialized, it is also allocated.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/misc/auxbus.h | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/include/hw/misc/auxbus.h b/include/hw/misc/auxbus.h
> index b05799d2f7a..bd8612018a7 100644
> --- a/include/hw/misc/auxbus.h
> +++ b/include/hw/misc/auxbus.h
> @@ -85,7 +85,8 @@ struct AUXSlave {
>  };
>
>  /**
> - * aux_bus_init: Initialize an AUX bus.
> + * aux_bus_init:
> + * Create an AUX bus on the heap.
>   *
>   * Returns the new AUX bus created.
>   *
> @@ -101,7 +102,7 @@ AUXBus *aux_bus_init(DeviceState *parent, const char =
*name);
>   */
>  void aux_bus_realize(AUXBus *bus);
>
> -/*
> +/**
>   * aux_request: Make a request on the bus.
>   *
>   * Returns the reply of the request.
> @@ -115,7 +116,7 @@ void aux_bus_realize(AUXBus *bus);
>  AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
>                                uint8_t len, uint8_t *data);
>
> -/*
> +/**
>   * aux_get_i2c_bus: Get the i2c bus for I2C over AUX command.
>   *
>   * Returns the i2c bus associated to this AUX bus.
> @@ -124,7 +125,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uin=
t32_t address,
>   */
>  I2CBus *aux_get_i2c_bus(AUXBus *bus);
>
> -/*
> +/**
>   * aux_init_mmio: Init an mmio for an AUX slave.
>   *
>   * @aux_slave The AUX slave.
> @@ -132,7 +133,8 @@ I2CBus *aux_get_i2c_bus(AUXBus *bus);
>   */
>  void aux_init_mmio(AUXSlave *aux_slave, MemoryRegion *mmio);
>
> -/* aux_map_slave: Map the mmio for an AUX slave on the bus.
> +/**
> + * aux_map_slave: Map the mmio for an AUX slave on the bus.
>   *
>   * @dev The AUX slave.
>   * @addr The address for the slave's mmio.

If you want to turn these into /**-introduced kerneldoc-comment
comments, then they need to be rearranged to have all the elements
in the required order:

/**
 * function_name - brief description
 * @arg1: Description of argument
 * @arg2: Description of argument
 *
 * Longer description paragraph if required.
 *
 * Return: Describe return value
 */

https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#function-d=
ocumentation

This might be better done as a separate commit from fixing the
comment text for aux_bus_init().

-- PMM

