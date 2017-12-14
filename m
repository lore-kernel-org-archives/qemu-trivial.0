Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePXKQ-0007or-1c
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 12:29:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ePXKO-0007nZ-JT
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 12:29:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ePXKI-0000Mx-B0
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 12:29:48 -0500
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:46820)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ePXKI-0000Lz-4w; Thu, 14 Dec 2017 12:29:42 -0500
Received: by mail-wr0-x243.google.com with SMTP id x49so5792224wrb.13;
	Thu, 14 Dec 2017 09:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=r8XX5/FtLLFZFos3gW2J97jE4RH8+3i675M+yRbQbss=;
	b=tILo7gVr5dwzwLGuxXgdycvVkB0XQuNc0vM/oHJKLRUIPr6GEZZ2TSKQ9EhEBBtqs8
	KsZnPnbM+zXiyb0kKLOWPEfaeIOf/FuzQf2IYjn8NT5FUsbjhKVY2REFlmM1AfvIJ4Fi
	DDn6icnvV6i3zwgwa9S23jbz8uNEtIonGAxyMq+57eXEp2I0I+KVTIFWaAsBdJLcuriH
	mw3xfkKVlJth/gR9Y3Fom+pCDWCkp7QlvleaQZz7qwYpEBTBxP+D6NteRb1GUkJSfomp
	TJvy+Gaba6imm91SLMoZe0UVOCWh9E7GL1+Z+OeMLMh+XOzspz9r2d5zwG5aOecuRIat
	3lOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=r8XX5/FtLLFZFos3gW2J97jE4RH8+3i675M+yRbQbss=;
	b=tGULTYhEsoTDMg2QDzOtCyp2YUkIzaXIcIEZzsKBsskrtoWHqwgnh2Qx6jnV5oCV2e
	tLltrcp36AdLmDEbr8zH6ebROZOlFUPob36cGpuh+1T9X+oeOoCog3MLM1M0r2Jq93Ts
	gF6cC3lNQEkOaR+rbAKj3j6RfHF3yofjSuxUVJp0PWBt0fxSqxI9AEQzx3qmbvewft88
	ZBPEhHveG4patj6UB0HBhUi/uvHetCtR0Zumw/E0TkE3cX3YT+1gwEeCNfYhE674xUFk
	8dFAwpXrJJe3DNUYvma+yHZevG7PCrWBq9ISNYvfnp/LB4Cb9Vu5/wAnb3vTMoFsYvc1
	H67g==
X-Gm-Message-State: AKGB3mL7LCvv+6O3wKfHAxhQu3hCakJJUnAoqK6FECJxAvo7kYVzDHZO
	jDLmc2Mid8bHTsSYzFupgnjEedFsdVIlGghpLiU=
X-Google-Smtp-Source: ACJfBouewZr+N1p92X2GwISwlU7zjgobkFH5il3yzUIxmQ4h+u21NQ7MBoIwoCpc1p+dhx1M0BgtmV/+AGuizebXIZI=
X-Received: by 10.223.153.4 with SMTP id x4mr1534054wrb.219.1513272581169;
	Thu, 14 Dec 2017 09:29:41 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.164.69 with HTTP; Thu, 14 Dec 2017 09:29:10 -0800 (PST)
In-Reply-To: <20171213195852.30439-6-f4bug@amsat.org>
References: <20171213195852.30439-1-f4bug@amsat.org>
	<20171213195852.30439-6-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 14 Dec 2017 09:29:10 -0800
X-Google-Sender-Auth: OYoTZy_vkOuG3m8BDrp0uUPUATE
Message-ID: <CAKmqyKPspMpoLAUCqj9DC8AKqiRhyuAVxv8jsQcRq-WFZ-YLEQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Alistair Francis <alistair.francis@xilinx.com>, 
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>, 
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, 
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 05/14] sdhci: move
 MASK_TRNMOD with other SDHC_TRN* defines in "sd-internal.h"
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
X-List-Received-Date: Thu, 14 Dec 2017 17:29:49 -0000

On Wed, Dec 13, 2017 at 11:58 AM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/sd/sdhci-internal.h | 1 +
>  hw/sd/sdhci.c          | 3 +--
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
> index 248fd027f9..e941bc2386 100644
> --- a/hw/sd/sdhci-internal.h
> +++ b/hw/sd/sdhci-internal.h
> @@ -43,6 +43,7 @@
>  #define SDHC_TRNS_ACMD12               0x0004
>  #define SDHC_TRNS_READ                 0x0010
>  #define SDHC_TRNS_MULTI                0x0020
> +#define SDHC_TRNMOD_MASK               0x0037
>
>  /* R/W Command Register 0x0 */
>  #define SDHC_CMDREG                    0x0E
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 295a89e5d3..a56c0c273e 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -120,7 +120,6 @@
>      (SDHC_CAPAB_BASECLKFREQ << 8) | (SDHC_CAPAB_TOUNIT << 7) | \
>      (SDHC_CAPAB_TOCLKFREQ))
>
> -#define MASK_TRNMOD     0x0037
>  #define MASKED_WRITE(reg, mask, val)  (reg =3D (reg & (mask)) | (val))
>
>  static uint8_t sdhci_slotint(SDHCIState *s)
> @@ -1043,7 +1042,7 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t v=
al, unsigned size)
>          if (!(s->capareg & SDHC_CAN_DO_DMA)) {
>              value &=3D ~SDHC_TRNS_DMA;
>          }
> -        MASKED_WRITE(s->trnmod, mask, value & MASK_TRNMOD);
> +        MASKED_WRITE(s->trnmod, mask, value & SDHC_TRNMOD_MASK);
>          MASKED_WRITE(s->cmdreg, mask >> 16, value >> 16);
>
>          /* Writing to the upper byte of CMDREG triggers SD command gener=
ation */
> --
> 2.15.1
>
>

