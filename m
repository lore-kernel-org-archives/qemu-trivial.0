Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jO3JB-0004M7-9q
	for mharc-qemu-trivial@gnu.org; Mon, 13 Apr 2020 13:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46191)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rfried.dev@gmail.com>) id 1jO3J9-0004KU-Jl
 for qemu-trivial@nongnu.org; Mon, 13 Apr 2020 13:55:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rfried.dev@gmail.com>) id 1jO3J8-0002Hq-Gk
 for qemu-trivial@nongnu.org; Mon, 13 Apr 2020 13:55:43 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:35998)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rfried.dev@gmail.com>)
 id 1jO3J6-0002FT-1L; Mon, 13 Apr 2020 13:55:40 -0400
Received: by mail-ot1-x341.google.com with SMTP id b13so5710973oti.3;
 Mon, 13 Apr 2020 10:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xO3UzWfTGH5oRZBrcP5KEcJ/+eQcg1votYrluf9FII0=;
 b=taQg3IC5hZ/YPiP+3xBRt7zv/wcDMcmUOchJLje8qUSj2ZQJW3/FHBPFZ/C9ZK74NJ
 roQRXC1OMYyNrgT5irxPj+mqQTxuGdZd7zZEP7JrmFLEWhR8eQsHBE1fUzsmGVstygXA
 yg2n49d6AkEQ/GsS/vzjRCWgb16LHt9drLR/gv+qJ40qIca5+ikV393nViNPxBooFeDn
 9US/7px/Q4rK+YutjHJM0USWCRfzS9lHA1PkSftqBz5q0v2CB4d5l900Xbia2xY52Upq
 AnamXypzzT/NP3J5sbkBpNPGFltQYXnVq52AjY/HdI6finrFW9ZlpMPyLeJpYUVTDmNL
 glIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xO3UzWfTGH5oRZBrcP5KEcJ/+eQcg1votYrluf9FII0=;
 b=QGUB4hHvQF7DqhlQmyTsso7GjlEeBAo6N08WSdWRtK8M6DN5YsXPpj8wQcmWs7zgSA
 Gt/P/Ye3N3IhqTEZ5TE5yqDnnG1cpcvP2ZiroyRoeTKScZu/6+eBmc+aVR4Gp9cmGxX+
 a993bDe6hNb/uD/M0OH9n8bu5cBbQvdBPj36f4a+ou+5IQEuIXqQTpVyAJXE/V85+IT8
 cD2aWh7MWUUq24srkB6p8+UuCUm4tsdvK1io6rTxBIYOOyFXbYLNZmoyq2MOBdtzYOw0
 jTjC601hQVWgymuHErEcb9dU3AIBbIbDlr3u17V+74yXLTqWHN/1/yMCkegKX5G4BrDM
 WIng==
X-Gm-Message-State: AGi0PuaUsTNSuSev9St45Lv4VYlVXoRnxVjI0fc7BqN1ojbMdJ6iqSxH
 udmsea/KolcCFwofCuPUa+Hokfwb70QQFZsnlOQ=
X-Google-Smtp-Source: APiQypJ0iTyB3HwY7d5CmRHrh0gGHiCyyaQvqmm85wdmoLb2qC33Gm+PaN4TiKRS4Wwoohjs3SDpiFLFZ3EjT3+AiIA=
X-Received: by 2002:a9d:3f2:: with SMTP id f105mr16110555otf.187.1586800538869; 
 Mon, 13 Apr 2020 10:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190615051559.13767-1-rfried.dev@gmail.com>
 <d87ea542-7ecc-4fb1-ac1d-929825d23a8a@redhat.com>
 <E1523CDB-895A-4EC7-908F-8A3A3717353C@gmail.com>
In-Reply-To: <E1523CDB-895A-4EC7-908F-8A3A3717353C@gmail.com>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Mon, 13 Apr 2020 20:55:29 +0300
Message-ID: <CAGi-RUJ_0LBfAe6eVXRrhqpW0EQH97TtdvjaQnXNY0Ts73zJCg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v3] net: cadence_gem: fix compilation error
 when debug is on
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
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
X-List-Received-Date: Mon, 13 Apr 2020 17:55:44 -0000

Hi.
Just noticed that this patch didn't hit master.
Got lost ?

Thanks,
Ramon.

On Sat, Jun 15, 2019 at 9:16 AM Ramon Fried <rfried.dev@gmail.com> wrote:
>
>
>
> On June 15, 2019 8:38:35 AM GMT+03:00, "Philippe Mathieu-Daud=C3=A9" <phi=
lmd@redhat.com> wrote:
> >Hi Ramon,
> >
> >On 6/15/19 7:15 AM, Ramon Fried wrote:
> >> defining CADENCE_GEM_ERR_DEBUG causes compilation
> >> errors, fix that.
> >>
> >> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> >> ---
> >> v2: change %lx to HWADDR_PRIx and %lx to %zdx
> >> v3: change %zdx to %zx
> >>
> >>  hw/net/cadence_gem.c | 6 +++---
> >>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> >> index 7f63411430..ecee22525c 100644
> >> --- a/hw/net/cadence_gem.c
> >> +++ b/hw/net/cadence_gem.c
> >> @@ -982,8 +982,8 @@ static ssize_t gem_receive(NetClientState *nc,
> >const uint8_t *buf, size_t size)
> >>              return -1;
> >>          }
> >>
> >> -        DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy,
> >rxbufsize),
> >> -                rx_desc_get_buffer(s->rx_desc[q]));
> >> +        DB_PRINT("copy %d bytes to 0x%" HWADDR_PRIx "\n",
> >MIN(bytes_to_copy, rxbufsize),
> >> +                rx_desc_get_buffer(s, s->rx_desc[q]));
> >>
> >>          /* Copy packet data to emulated DMA buffer */
> >>          address_space_write(&s->dma_as, rx_desc_get_buffer(s,
> >s->rx_desc[q]) +
> >> @@ -1156,7 +1156,7 @@ static void gem_transmit(CadenceGEMState *s)
> >>              if (tx_desc_get_length(desc) > sizeof(tx_packet) -
> >>                                                 (p - tx_packet)) {
> >>                  DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x
> >space " \
> >> -                         "0x%x\n", (unsigned)packet_desc_addr,
> >> +                         "0x%zx\n", (unsigned)packet_desc_addr,
> >>                           (unsigned)tx_desc_get_length(desc),
> >>                           sizeof(tx_packet) - (p - tx_packet));
> >>                  break;
> >>
> >
> >I still get an error when trying to build on 32bit host with
> >CADENCE_GEM_ERR_DEBUG enabled (pre-existing to your patch):
> >
> >  CC      hw/net/cadence_gem.o
> >./hw/net/cadence_gem.c: In function 'gem_receive':
> >./hw/net/cadence_gem.c:973:14: error: format '%ld' expects argument of
> >type 'long int', but argument 4 has type 'size_t {aka unsigned int}'
> >[-Werror=3Dformat=3D]
> >    DB_PRINT("config bufsize: %d packet size: %ld\n", rxbufsize, size);
> >              ^
> >./hw/net/cadence_gem.c:38:24: note: in definition of macro 'DB_PRINT'
> >     fprintf(stderr, ## __VA_ARGS__); \
> >                        ^
> >cc1: all warnings being treated as errors
> >./rules.mak:69: recipe for target 'hw/net/cadence_gem.o' failed
> >make: *** [hw/net/cadence_gem.o] Error 1
> >
> >However the 64bit host is indeed fixed, so I'm fine with your patch:
> >Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >
> >Regards,
> >
> >Phil.
> Thanks!
>
> --
> Sent from my Android device with K-9 Mail. Please excuse my brevity.

