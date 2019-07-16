Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hnHcv-000790-0z
	for mharc-qemu-trivial@gnu.org; Tue, 16 Jul 2019 03:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41852)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <rfried.dev@gmail.com>) id 1hnHcs-0006xe-6z
 for qemu-trivial@nongnu.org; Tue, 16 Jul 2019 03:11:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rfried.dev@gmail.com>) id 1hnHcr-0001jI-15
 for qemu-trivial@nongnu.org; Tue, 16 Jul 2019 03:11:50 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:40823)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rfried.dev@gmail.com>)
 id 1hnHco-0001hf-M6; Tue, 16 Jul 2019 03:11:46 -0400
Received: by mail-wm1-x342.google.com with SMTP id v19so17485519wmj.5;
 Tue, 16 Jul 2019 00:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fp4ZcS9Des/AW20ab/84QogiuUTyk9LS7IPWVRGoT/I=;
 b=iFa77jBKisfqoET0A6Ozlg5rDIVdqVlsz3gEIwJ7tC011x+Ao8igkrPrjvNRaisrQ/
 o+gZR5QItEpreN7fwCzKY2SF7imhfczC5h5wZ4vamm+b2DEReynRqZ7NkE47hYIaViQX
 oF7j8PmKaD6R9auu0IJ4s2X25OmN/pD47B/BbJgx5VOmydCFEyqspSmXPOXG6CrQbNFC
 4ifq1eEyWHe0xvUXPQEFdFRBbuEoEMznBWQe8TCJgsC8VQn5tjNO+aOzR7yyPRHk3eOj
 jtBOCZ44x56Z2C7u6rHtbkjHvHMS6H4fGvaicE81LS/WT6WZLiBNCp5LjhS2/OXCkgO+
 Nw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fp4ZcS9Des/AW20ab/84QogiuUTyk9LS7IPWVRGoT/I=;
 b=beIWTSPqvURnrWp7oL5iaiEVHdHrWvjGO90EKts183TIU5md0u0zgMGojhh8e99HEb
 OqhdaEvY2UDOWSyzJDX/tRgzFMpuoMxOlKbQtxQh+RyXYp6cXJK30RV34SeVZM5BR6zR
 brMWajSdP3pR8SeLSHj64WOoxbkf2glBMlbi+FkW3wi5bouSWgsYww4pYeWIEdTpILN1
 DjM/FqlBAXyq1Eu5KP+V8NoCd5rsvFZbp+vX6T5XoYDzUusMbAD1LkzacxDRzY0V8kZa
 Vx9w3ZaLLKTVUaFR1bgIY4NSefAR6IkwwyqlFdPGQ16vitgx4jAvEJgvSfzhDvzP5DwD
 qj1w==
X-Gm-Message-State: APjAAAV+KwxlkQfP0H2SNKte42kEuB/wujuyQR1SbEJeY6EG2AI5O8S9
 ApUeinetgp3NEbnykLk3fND3t0PTaujUgHv3AbOCBjvX
X-Google-Smtp-Source: APXvYqzZ2hgXquUviXNqxdHth7knK5VgZ5sieKd1MUlIGkFy3zlNNRGVjxQ4dxTSg8zyl61Br6qktGRV4D9zbdVxvMU=
X-Received: by 2002:a7b:c0d0:: with SMTP id s16mr29303290wmh.141.1563261104644; 
 Tue, 16 Jul 2019 00:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190615051722.13994-1-rfried.dev@gmail.com>
In-Reply-To: <20190615051722.13994-1-rfried.dev@gmail.com>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Tue, 16 Jul 2019 10:11:33 +0300
Message-ID: <CAGi-RUJazCVVh9NwpQ1AHfPdPLW1aYxKst6w6PKfCk2doBz_9w@mail.gmail.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>, 
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-trivial] [PATCH] net: cadence_gem: clear RX control
 descriptor
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
X-List-Received-Date: Tue, 16 Jul 2019 07:11:51 -0000

ping

On Sat, Jun 15, 2019 at 8:17 AM Ramon Fried <rfried.dev@gmail.com> wrote:
>
> The RX ring descriptors control field is used for setting
> SOF and EOF (start of frame and end of frame).
> The SOF and EOF weren't cleared from the previous descriptors,
> causing inconsistencies in ring buffer.
> Fix that by clearing the control field of every descriptors we're
> processing.
>
> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> ---
>  hw/net/cadence_gem.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index ecee22525c..d83a82bdb0 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -406,6 +406,11 @@ static inline void rx_desc_set_sof(uint32_t *desc)
>      desc[1] |= DESC_1_RX_SOF;
>  }
>
> +static inline void rx_desc_clear(uint32_t *desc)
> +{
> +    desc[1]  = 0;
> +}
> +
>  static inline void rx_desc_set_eof(uint32_t *desc)
>  {
>      desc[1] |= DESC_1_RX_EOF;
> @@ -994,6 +999,8 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>          bytes_to_copy -= MIN(bytes_to_copy, rxbufsize);
>
>          /* Update the descriptor.  */
> +        rx_desc_clear(s->rx_desc[q]);
> +
>          if (first_desc) {
>              rx_desc_set_sof(s->rx_desc[q]);
>              first_desc = false;
> --
> 2.21.0
>

