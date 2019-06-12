Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hb7ad-0003uJ-9n
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2019 14:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47288)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hb7aX-0003tw-GN
 for qemu-trivial@nongnu.org; Wed, 12 Jun 2019 14:03:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hb7aV-0002R6-4u
 for qemu-trivial@nongnu.org; Wed, 12 Jun 2019 14:03:09 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:43668)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hb7aS-0002OI-ML
 for qemu-trivial@nongnu.org; Wed, 12 Jun 2019 14:03:05 -0400
Received: by mail-wr1-x444.google.com with SMTP id p13so7802968wru.10
 for <qemu-trivial@nongnu.org>; Wed, 12 Jun 2019 11:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=Q9EvNrXFTEmV9zWhum3wXdynxpxJCkAB0NkLv7AlOhQ=;
 b=hZMRd/IIdp7z2jhqh0YxEBnMjgUcDQy3O8BduTbMrf71WJrmKZdjzXRrmfjViJKERt
 L7Ka/p5wG9l8dYHieRBDhG/74zA8Zt98MchZ9WNgVuEqAkrTSugRWwj70QsbZchgjx0q
 P9mQdK6BRiMmC3wJmeutcYyFGCeKIfj9Z91W1tVi6m4azm+pC/ES0l8+k9Y9uwATo4ls
 UQbS56sr8CNUPhZqbng+wR3N7TDLQpsVHppSyGMaPvGx8eB54rHUS2D2AX1wyXPXssvA
 MsRvMtmn2z+uYsDU45lkiBAOH9ZCXtzKXiilBS2pVnlS3mjMwuCzbE+rMhkpa3Yn8gy/
 exMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=Q9EvNrXFTEmV9zWhum3wXdynxpxJCkAB0NkLv7AlOhQ=;
 b=es0tU2U+fm7EiI0DPHiBFSvJXrIYTEmJEtmJ9T+i3ZLMutUEo5vif9KZXUlKTZrzxw
 RiLI22nrqsdwgwnidZ1GcnGH+wpNQ2nbb/X8LAqL+P231gFLWh5NGPIUH2JuwHnzHpni
 HhyV5wrmLZL+GycHztEixKXDEMfz0wx+aydbekd5zFJ2HJ8/NpZbRmQd1e/f9nuxUiIl
 uPVn2X5JbleceiNwuNSt0z4nTY7ik8ukfWwz8huNneXUvGr5zuzfwXny4i/SBstQpJCP
 FhYv/A5A6giHz7S//bt5s79p68Hj40tsqX7IC4jYeI3rxjzzSsLHdaZeB7griDrqeKkc
 zdeQ==
X-Gm-Message-State: APjAAAVrZ1S6QBO1SqzqvDZtW3G5xYtKjm/VFBUWkuJeBzVSDTi28JyX
 Y3oMkts8WRU6OyQvypZ6c6eeFQ==
X-Google-Smtp-Source: APXvYqweBIYRwTkKT6LN2Ur48ZGIAIJV+0dAP5JDbE4ZJycV4/pDHP/PmYfJiIX9af+NDDZd9p6yew==
X-Received: by 2002:a5d:494d:: with SMTP id r13mr2364918wrs.152.1560362583190; 
 Wed, 12 Jun 2019 11:03:03 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id y9sm2905381wma.1.2019.06.12.11.03.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 11:03:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1A6641FF87;
 Wed, 12 Jun 2019 19:03:02 +0100 (BST)
References: <20190611145556.12940-1-rfried.dev@gmail.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Ramon Fried <rfried.dev@gmail.com>
In-reply-to: <20190611145556.12940-1-rfried.dev@gmail.com>
Date: Wed, 12 Jun 2019 19:03:02 +0100
Message-ID: <87o932el61.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-trivial] [Qemu-arm] [PATCH v2] net: cadence_gem: fix
 compilation error when debug is on
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
X-List-Received-Date: Wed, 12 Jun 2019 18:03:11 -0000


Ramon Fried <rfried.dev@gmail.com> writes:

> defining CADENCE_GEM_ERR_DEBUG causes compilation
> errors, fix that.

It would be worth doing something like:

#ifdef CADENCE_GEM_ERR_DEBUG
#define CADENCE_GEM_GATE 1
#else
#define CADENCE_GEM_GATE 0
#endif

#define DB_PRINT(...) do { \
    if (CADENCE_GEM_GATE) { \
        fprintf(stderr,  ": %s: ", __func__); \
        fprintf(stderr, ## __VA_ARGS__); \
    } \
} while (0)

So these format strings don't go stale in and only get detected on
--debug builds.

While your at it I suspect the fprintf debug would be better of as:

  qemu_log("%s: " fmt, __func__, ## args);


>
> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> ---
> v2: change %lx to HWADDR_PRIx and %lx to %zdx
>
>  hw/net/cadence_gem.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 7f63411430..e9b1b1e2eb 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -982,8 +982,8 @@ static ssize_t gem_receive(NetClientState *nc, const =
uint8_t *buf, size_t size)
>              return -1;
>          }
>
> -        DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy, rxbufsize=
),
> -                rx_desc_get_buffer(s->rx_desc[q]));
> +        DB_PRINT("copy %d bytes to 0x%" HWADDR_PRIx "\n", MIN(bytes_to_c=
opy, rxbufsize),
> +                rx_desc_get_buffer(s, s->rx_desc[q]));
>
>          /* Copy packet data to emulated DMA buffer */
>          address_space_write(&s->dma_as, rx_desc_get_buffer(s, s->rx_desc=
[q]) +
> @@ -1156,7 +1156,7 @@ static void gem_transmit(CadenceGEMState *s)
>              if (tx_desc_get_length(desc) > sizeof(tx_packet) -
>                                                 (p - tx_packet)) {
>                  DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x spac=
e " \
> -                         "0x%x\n", (unsigned)packet_desc_addr,
> +                         "0x%zdx\n", (unsigned)packet_desc_addr,
>                           (unsigned)tx_desc_get_length(desc),
>                           sizeof(tx_packet) - (p - tx_packet));
>                  break;


--
Alex Benn=C3=A9e

