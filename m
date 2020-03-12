Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCRCh-0006SX-Mj
	for mharc-qemu-trivial@gnu.org; Thu, 12 Mar 2020 13:01:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38408)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jCRCf-0006IN-4m
 for qemu-trivial@nongnu.org; Thu, 12 Mar 2020 13:01:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jCRCd-00084p-Ts
 for qemu-trivial@nongnu.org; Thu, 12 Mar 2020 13:01:00 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:35618)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jCRCd-00084M-OI
 for qemu-trivial@nongnu.org; Thu, 12 Mar 2020 13:00:59 -0400
Received: by mail-oi1-x243.google.com with SMTP id k8so4759489oik.2
 for <qemu-trivial@nongnu.org>; Thu, 12 Mar 2020 10:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sG2XHxtL29liFM8qAyu3jpV/gaMswIfwBnXLqD75KIw=;
 b=tUY0rHtEFZga2G8zMqXXlIUYHIZ+tIEwasI8rTQMdtlszrxnH+GZ3gyv1DaUQpyy0U
 Xy7GJ3pDw0Rqp+WhO1ASz0i+TFyU1EE+RGBVR6amSqNjbVhfb/NDIQJXym+0DbFM6wt6
 eirhDm+K1X4e3rUFsDw+0TpAAMDoW0NV8YCk+6njKAqUpsJHG/n5JA6y2nTuieHyVMIq
 guR1Lcl0/aJiQljsjhtVRY3d3MGaW9KKcYE5vHpLHJv69JSqkLqa+o/q+J0B7bFsi7Gf
 7rG92FXA9u9sc7ygSEVSORBsjyh20/wDDjOfU2X2Dhbwmlj8lyq6BsDroqzQo2ecBX8z
 RbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sG2XHxtL29liFM8qAyu3jpV/gaMswIfwBnXLqD75KIw=;
 b=rYRqbNAmpTj9FPnvrtQvsdi6bf7KgYSvepgFEAULtNbhLnb9vP7eUzTL8XSxL+Tq49
 VR2PEsO6drR+9nCqJbV2SeHHnXiiDXvie6cF0ZK0FG7BMMRc0utbID9AjdW5MkrjwERB
 BtPLnSWG63XwxB8it1zGEUVik6O/ZlqYNM0sXu8yAjAhFkCJ7Rjt9DMlcConNu/30GxX
 q1Lvd/CXNfeD6dmkM0Y8XB2DErsIPjAcq9FJAL+qTvAbtmx/6bjAam7JOyHyJNoBQ9qU
 Hi2NhSi3tQVy5H/wzgKY1HztEewfXyE6KUZTj1sAVHGtjCkQm32JoDCGAgtmTmrMQGbM
 e+LQ==
X-Gm-Message-State: ANhLgQ0kvy0Yon/z4Nk8MOq++BBOlYJAB1uU4B0Urd9k0E7cH1aXeDwa
 TYNnyjaSBZWRypaqXuf1INDcM9XHsN6RYpzmRvBDIg==
X-Google-Smtp-Source: ADFU+vuJ7k8R+ip/KOjJj6uWne3Jv24J0fy4U6KiLTAI0KU+Pm2pKuhlfUf0zt76SYIITIHWtqlR9aUEXJmH+2aTEjI=
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr3226853oic.48.1584032458496; 
 Thu, 12 Mar 2020 10:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200305105325.31264-1-kuhn.chenqun@huawei.com>
 <CAFEAcA8fnz2oaa-CO-EEK_vQTWfPih4PrAB3i4UUgQpv9Y_4mg@mail.gmail.com>
 <7412CDE03601674DA8197E2EBD8937E83B68019B@dggemm511-mbx.china.huawei.com>
In-Reply-To: <7412CDE03601674DA8197E2EBD8937E83B68019B@dggemm511-mbx.china.huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Mar 2020 17:00:46 +0000
Message-ID: <CAFEAcA-q4t3yQcHaHzOGx2GpKpuW=kti51myuFK_K3aieRY3dg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/net/imx_fec: write TGSR and TCSR3 in
 imx_enet_write()
To: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Jason Wang <jasowang@redhat.com>, 
 Peter Chubb <peter.chubb@nicta.com.au>, qemu-arm <qemu-arm@nongnu.org>, 
 Euler Robot <euler.robot@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
X-List-Received-Date: Thu, 12 Mar 2020 17:01:02 -0000

On Tue, 10 Mar 2020 at 08:08, Chenqun (kuhn) <kuhn.chenqun@huawei.com> wrote:
>
> >-----Original Message-----
> >From: Peter Maydell [mailto:peter.maydell@linaro.org]
> >>
> >> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c index
> >> 6a124a154a..322cbdcc17 100644
> >> --- a/hw/net/imx_fec.c
> >> +++ b/hw/net/imx_fec.c
> >> @@ -855,13 +855,15 @@ static void imx_enet_write(IMXFECState *s,
> >uint32_t index, uint32_t value)
> >>          break;
> >>      case ENET_TGSR:
> >>          /* implement clear timer flag */
> >> -        value = value & 0x0000000f;
> >> +        s->regs[index] ^= s->regs[index] & value;
> >> +        s->regs[index] &= 0x0000000f;
> >>          break;
> >>      case ENET_TCSR0:
> >>      case ENET_TCSR1:
> >>      case ENET_TCSR2:
> >>      case ENET_TCSR3:
> >> -        value = value & 0x000000fd;
> >> +        s->regs[index] = (value & 0x00000080) ? (0x0000007d & value) :
> >> +                         (value & 0x000000fd);
> >>          break;
> >>      case ENET_TCCR0:
> >>      case ENET_TCCR1:
> >
> >This isn't the usual way to write W1C behaviour.
> >If all the relevant bits are W1C, as for TGSR:
> >
> >   s->regs[index] &= ~(value & 0xf); /* all bits W1C */
> >
> Yes, it looks better.
> But do we need clear the reserved bit (31 - 4 bits) explicitly ?

Not necessarily, but it seems to be how the other registers
in the device have generally been coded, and it's clearly
what the intent was here given that the original (buggy)
code was masking out reserved bits. So I think it makes
sense to continue in that style.

thanks
-- PMM

