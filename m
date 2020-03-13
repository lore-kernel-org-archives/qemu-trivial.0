Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCiX2-0000bj-70
	for mharc-qemu-trivial@gnu.org; Fri, 13 Mar 2020 07:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35627)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jCiWw-0000bM-W1
 for qemu-trivial@nongnu.org; Fri, 13 Mar 2020 07:31:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jCiWv-0002vC-SU
 for qemu-trivial@nongnu.org; Fri, 13 Mar 2020 07:31:06 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:39567)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jCiWv-0002p9-N8
 for qemu-trivial@nongnu.org; Fri, 13 Mar 2020 07:31:05 -0400
Received: by mail-ot1-x341.google.com with SMTP id a9so9696053otl.6
 for <qemu-trivial@nongnu.org>; Fri, 13 Mar 2020 04:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=if/r4vhAG7a4GtEP5IdX/8TjTnZVSBtb22Vph6IFxds=;
 b=RVxZbbhXqIb/UUD71GKEx0l4ixmcZhVCjXZs9f6Z8Nloai3TcaSitIBzOWGALDXAqV
 Q5ccBG3l6h2/LwLLVNAy0bANYqLrWvM2xD7nrioBAQf0qwD2eEt26P10Muj+eMdjkddV
 31xzu88veHngwrPj08T9MdcihS2RXq6GHRzYzt0y7/8dXzAISxPiYozoA9CIGApleMJY
 vll82BAhe2scJJoG0NbWIvZLpsdthe+bki7TAtF7V3w5x/E4T1UKuJERcfBPrpSDjOa9
 UE5mAIVDw1KxkaMwKB9kOmyPQc4ew3Zs66CEVM5rqstf0Hwv0KS6TPmSd05L39qneuEX
 PRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=if/r4vhAG7a4GtEP5IdX/8TjTnZVSBtb22Vph6IFxds=;
 b=KJ89bivDNk6ojKFLU+riHk+3ufZoHEnoS2KRV9hsn2WOfs0ebcs0uNUW6LUaPuumcj
 sEVKvM+E92OTS7JO84rtAmgY7TJEISBxGsRPqUp/GoO6sWocka1M1kXhHlRAIm/JycjV
 EkqFvZ7lSEX/GkqQzGTjBGmwB1ridYNN4LfyQlNTi6nqN8NLkJUcJXvQh8XgdB0n1BJR
 i89Mn7DvD2k0Vin7nM3svX8zQIbtZeQl97XivT2CYNkShJxb4ImmNzl5ytjZ74n03E3Y
 y7x1matpJIB95C5mfx1BomF7L6oqX7arC+5zKyRNUQj9xZx8jICPQXqerBLiiGtCrFoR
 pSJA==
X-Gm-Message-State: ANhLgQ0+YvcsW9dryWpeim1XE7izeYso1vpaOawwtu9DXUNcdH28mZPs
 aTmx4pThg0QZi9jqhxJ0T6PUi8CRV0FV9kvp/WEYBDHGNqA=
X-Google-Smtp-Source: ADFU+vu5/FKfSmmbkyhf0WACghwf/J7mf02Wjz4MdB/8YCHIakVrrTagmUpmP6kU+R/3XHbQzNwcls/sF+E1rP1g2UI=
X-Received: by 2002:a9d:1d43:: with SMTP id m61mr1574284otm.91.1584099062575; 
 Fri, 13 Mar 2020 04:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200313032327.7008-1-kuhn.chenqun@huawei.com>
In-Reply-To: <20200313032327.7008-1-kuhn.chenqun@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Mar 2020 11:30:51 +0000
Message-ID: <CAFEAcA9mOppVAYgP4LJeuSBgiaYN16H+JHbKr7OTFvjbvD-3wA@mail.gmail.com>
Subject: Re: [PATCH v3] hw/net/imx_fec: write TGSR and TCSR3 in
 imx_enet_write()
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Euler Robot <euler.robot@huawei.com>, 
 Jason Wang <jasowang@redhat.com>, Peter Chubb <peter.chubb@nicta.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
X-List-Received-Date: Fri, 13 Mar 2020 11:31:08 -0000

On Fri, 13 Mar 2020 at 03:23, Chen Qun <kuhn.chenqun@huawei.com> wrote:
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
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Peter Chubb <peter.chubb@nicta.com.au>
>
> v1->v2:
>   The register 'ENET_TGSR' write-1-to-clear timer flag.
>   The register 'ENET_TCSRn' 7bit(TF) write-1-to-clear timer flag.
>
> v2->v3:
>   Optimize code style, based on discussions with Peter.
> ---
>  hw/net/imx_fec.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index 6a124a154a..3547975710 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -854,14 +854,17 @@ static void imx_enet_write(IMXFECState *s, uint32_t=
 index, uint32_t value)
>          s->regs[index] =3D value & 0x00007f7f;
>          break;
>      case ENET_TGSR:
> -        /* implement clear timer flag */
> -        value =3D value & 0x0000000f;
> +        /* implement clear timer flag, 0-3 bits W1C, reserved bits write=
 zero */
> +        s->regs[index] &=3D ~(value & 0x0000000f) & 0x0000000f;

I think I must have misunderstood what you were
suggesting in your previous question.
The final & with 0x0000000f here is unnecessary, because
those bits are always 0 in s->regs[index] anyway.

>          break;
>      case ENET_TCSR0:
>      case ENET_TCSR1:
>      case ENET_TCSR2:
>      case ENET_TCSR3:
> -        value =3D value & 0x000000fd;
> +        /* 7 bits W1C, reserved bits write zero */
> +        s->regs[index] &=3D ~(value & 0x00000080) & 0x000000ff;

Similarly here.

> +        s->regs[index] &=3D ~0x0000007d; /* writable fields */
> +        s->regs[index] |=3D (value & 0x0000007d);
>          break;
>      case ENET_TCCR0:
>      case ENET_TCCR1:

Short answer: my recommendation is to use the expressions
I recommended that you use...

thanks
-- PMM

