Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBGhH-0002xt-C9
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2020 07:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49722)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jBGhF-0002wN-6p
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 07:35:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jBGhD-0001b0-VC
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 07:35:44 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:44125)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jBGhD-0001ab-Ok
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 07:35:43 -0400
Received: by mail-oi1-x244.google.com with SMTP id d62so9747029oia.11
 for <qemu-trivial@nongnu.org>; Mon, 09 Mar 2020 04:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bTtip2cL91MGIrg0Mc4JsWOrVFkqocrQtKDXBnTyWsk=;
 b=Og1BL3cenMD7H+Yljomz3Y6K9fOixWW0CJudQSIqkUiBjALZt1/45/b1dNqIHKk7IQ
 arZmwyINy5wpe4rrIznToh18Rid+sAy4+9UyEIoywdkIAN/Rwi7i3PJ1sdUXAD7b6IKb
 I/Z0q4EV/eLI/KEDl1eZkujkB4NfXeX/Ta1yb/WDHWMVN2QOQpJzfpUE2x+Mro2j2MPn
 Hn5Ywp6lBSs4jtdTgRnRky466VKYZuB23lYbQv0XhYbv5Av5gtiU7GZqzEH91dPuW9wK
 j55tobReXgC8BnVecDMM9PbMHVczgTFCxddv2LlWlrKpJcMdHDP8fe1ZSxfAGlCWMD1c
 3QJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bTtip2cL91MGIrg0Mc4JsWOrVFkqocrQtKDXBnTyWsk=;
 b=BA0ht0KQV15Csg5ARklTgronb/EeAokDBXG9z1UpCwJA5ZG31G6n2QxC/6lQ3BljEW
 UbdavsMet5/v+fjzRldQmXS3CpyhAFUpHcp9Gp/JLYBX7MOysBgHfkFmcRy+QkLXbhiU
 Q/F+lyLO0OKp2Ytltu9S4wKmsCbtfZcsW8e1+gA7OzqCs+2c6A4mw3Ym0QKI1txXaxfE
 nkqXZpuE3o2JK/S67932+xidad5LLOmksnoI+IPkenKUakY3rWFZS8KRwyB36Fejg6Y3
 Jp7+UYdaN2gbBJS80Sqd9Ud2oasNC4zednNVzVoYdZms0BCfpWwg39ZvxSrUeWIL+Dt8
 ZFKw==
X-Gm-Message-State: ANhLgQ1G1usDHTqDUeVWjL5NmSyLlJ/Vz7D0An8LXiOBSEvm3Mc5n+1L
 X5zEk6kw6lYI/RSxhT4KqtydNgfnI4vCB8D/9e4v+w==
X-Google-Smtp-Source: ADFU+vvWHQqzhx2R6F2IIi+norYmw7s4QmIxkdYXVvvd/sOCIWwq2Bq4wQ2BZ+IoWfCYpqOf0rXOWlhO3JdKHjdBlDQ=
X-Received: by 2002:a54:478b:: with SMTP id o11mr10542380oic.146.1583753742834; 
 Mon, 09 Mar 2020 04:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200305105325.31264-1-kuhn.chenqun@huawei.com>
In-Reply-To: <20200305105325.31264-1-kuhn.chenqun@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Mar 2020 11:35:31 +0000
Message-ID: <CAFEAcA8fnz2oaa-CO-EEK_vQTWfPih4PrAB3i4UUgQpv9Y_4mg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/net/imx_fec: write TGSR and TCSR3 in
 imx_enet_write()
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Jason Wang <jasowang@redhat.com>, 
 Peter Chubb <peter.chubb@nicta.com.au>, qemu-arm <qemu-arm@nongnu.org>, 
 Euler Robot <euler.robot@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
X-List-Received-Date: Mon, 09 Mar 2020 11:35:46 -0000

On Thu, 5 Mar 2020 at 10:53, Chen Qun <kuhn.chenqun@huawei.com> wrote:
>
> The current code causes clang static code analyzer generate warning:
> hw/net/imx_fec.c:858:9: warning: Value stored to 'value' is never read
>         value =3D value & 0x0000000f;
>         ^       ~~~~~~~~~~~~~~~~~~
> hw/net/imx_fec.c:864:9: warning: Value stored to 'value' is never read
>         value =3D value & 0x000000fd;
>         ^       ~~~~~~~~~~~~~~~~~~
>
> According to the definition of the function, the two =E2=80=9Cvalue=E2=80=
=9D assignments
>  should be written to registers.
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> v1->v2:
>   The register 'ENET_TGSR' write-1-to-clear timer flag.
>   The register 'ENET_TCSRn' 7bit(TF) write-1-to-clear timer flag.
> ---
>  hw/net/imx_fec.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index 6a124a154a..322cbdcc17 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -855,13 +855,15 @@ static void imx_enet_write(IMXFECState *s, uint32_t=
 index, uint32_t value)
>          break;
>      case ENET_TGSR:
>          /* implement clear timer flag */
> -        value =3D value & 0x0000000f;
> +        s->regs[index] ^=3D s->regs[index] & value;
> +        s->regs[index] &=3D 0x0000000f;
>          break;
>      case ENET_TCSR0:
>      case ENET_TCSR1:
>      case ENET_TCSR2:
>      case ENET_TCSR3:
> -        value =3D value & 0x000000fd;
> +        s->regs[index] =3D (value & 0x00000080) ? (0x0000007d & value) :
> +                         (value & 0x000000fd);
>          break;
>      case ENET_TCCR0:
>      case ENET_TCCR1:

This isn't the usual way to write W1C behaviour.
If all the relevant bits are W1C, as for TGSR:

   s->regs[index] &=3D ~(value & 0xf); /* all bits W1C */

If some but not all bits are W1C, as for TCSR*:

   s->regs[index] &=3D ~(value & 0x80); /* W1C bits */
   s->regs[index] &=3D ~0x7d; /* writable fields */
   s->regs[index] |=3D (value & 0x7d);

thanks
-- PMM

