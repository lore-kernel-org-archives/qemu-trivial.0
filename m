Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mreBc-0003P1-VK
	for mharc-qemu-trivial@gnu.org; Mon, 29 Nov 2021 05:47:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mreBW-0003OL-NX
 for qemu-trivial@nongnu.org; Mon, 29 Nov 2021 05:46:58 -0500
Received: from [2a00:1450:4864:20::42d] (port=35611
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mreBU-0006CM-Jd
 for qemu-trivial@nongnu.org; Mon, 29 Nov 2021 05:46:58 -0500
Received: by mail-wr1-x42d.google.com with SMTP id i5so35763986wrb.2
 for <qemu-trivial@nongnu.org>; Mon, 29 Nov 2021 02:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ftbifqO8h+JkhOkmRmSz/Nzuup+KQ/16UkpK5dR7o18=;
 b=aMwc1U2N/ltUJlLM/HufN/05RaEkRfrUg7gOZ+6miA6yun3FqAZlEJ/Bm9bQ2cg7KL
 MTk0lxWfol2mbh3L/Vqrie+QohLZT5RlUz0yOsOj0tTRXMp+uRhoKugKZbknBnqj7l4V
 3Ibd7v3cly/k3ZVeP/LpkrftBgbJTroJe3TblDrR9q3rt//isnhlTO/NmSXxCR3n+clt
 FVvNG7TxbDcTYj47PLUNO51QBehsFprKqngwRfun8VVZaeUVPr24rXwp+AnPNUf2n7na
 9trDvwFSGkGdmhT4z6VWPoMTegGNtt/p/kah4qMKH3C4ppjvWlSfZ5dWEYIavU6x7nTk
 4pgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ftbifqO8h+JkhOkmRmSz/Nzuup+KQ/16UkpK5dR7o18=;
 b=dPcoo7DJphBiuw+hgPUwrHJF6gALPoyk+u1Cyg7OoFdcSNwnhICZ209dsucjdvqGst
 +FBG4pdDYBXsX+yGFj3RnraIZJTL0RV2BX+JnTYQ/ERNX95XI3K3bMyqaHInvelUO7CU
 EFibpzUh6uyjI8ygUFyQJZQg43/AM5BLHXLdR7AR64aoJDfMxxBy+5J5bbaAiZgXMEDP
 8K5xvdxnAfFYsKuXpIEbuaNuHRDx+LXl+OKGLYcPC0GBniMcvRO1PMz5gzYY/8R3SYzC
 2LhEvGb8ylC6r9so4wNdiDlog0+YriNgxQujLMh+VhzBY3W5qAXLhojz0QgxhHldLUlH
 nHqQ==
X-Gm-Message-State: AOAM533EioTF4Dj5sPgsHKGpVZDRt80YJrzqZhU1feH+tlCvOVGrO9Z8
 kFuUgEfnXmgvkMUYX1A9lw5nAoXyhh/mf8Nyvn8jqw==
X-Google-Smtp-Source: ABdhPJyOEGCY4Jt/1lWUIUX+2jaZaCBCx6Z+wIJysMdzYFYu1ay4CDPDdLWNaCx7Ka9bquzcQ4RyiZalNDrol6nuqhk=
X-Received: by 2002:adf:f64b:: with SMTP id x11mr33953498wrp.4.1638182815219; 
 Mon, 29 Nov 2021 02:46:55 -0800 (PST)
MIME-Version: 1.0
References: <20211128120723.4053-1-olivier.heriveaux@ledger.fr>
In-Reply-To: <20211128120723.4053-1-olivier.heriveaux@ledger.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Nov 2021 10:46:43 +0000
Message-ID: <CAFEAcA8WBZPBoMDBcfv05p-EZOFCUGZkVt5aZJrYAtfCviryjA@mail.gmail.com>
Subject: Re: [PATCH] Fix STM32F2XX USART data register readout
To: =?UTF-8?Q?Olivier_H=C3=A9riveaux?= <olivier.heriveaux@ledger.fr>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 10:46:59 -0000

On Sun, 28 Nov 2021 at 12:07, Olivier H=C3=A9riveaux
<olivier.heriveaux@ledger.fr> wrote:
>
> Fix issue where the data register may be overwritten by next character
> reception before being read and returned.
>
> Signed-off-by: Olivier H=C3=A9riveaux <olivier.heriveaux@ledger.fr>
> ---
>  hw/char/stm32f2xx_usart.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
> index 8df0832424..fde67f4f03 100644
> --- a/hw/char/stm32f2xx_usart.c
> +++ b/hw/char/stm32f2xx_usart.c
> @@ -103,10 +103,11 @@ static uint64_t stm32f2xx_usart_read(void *opaque, =
hwaddr addr,
>          return retvalue;
>      case USART_DR:
>          DB_PRINT("Value: 0x%" PRIx32 ", %c\n", s->usart_dr, (char) s->us=
art_dr);
> +        retvalue =3D s->usart_dr & 0x3FF;
>          s->usart_sr &=3D ~USART_SR_RXNE;
>          qemu_chr_fe_accept_input(&s->chr);
>          qemu_set_irq(s->irq, 0);
> -        return s->usart_dr & 0x3FF;
> +        return retvalue;
>      case USART_BRR:
>          return s->usart_brr;
>      case USART_CR1:
> --
> 2.17.1

The bug happens because qemu_chr_fe_accept_input() can cause
stm32f2xx_usart_receive() to be called, right ?

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I'll put this in my list of patches to take via target-arm.next for the
7.0 release.

thanks
-- PMM

