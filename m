Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X4EeF-00040s-LO
	for mharc-qemu-trivial@gnu.org; Mon, 07 Jul 2014 15:32:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1X4Ee8-0003xN-Fx
	for qemu-trivial@nongnu.org; Mon, 07 Jul 2014 15:32:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1X4Ee3-0004NG-IY
	for qemu-trivial@nongnu.org; Mon, 07 Jul 2014 15:32:16 -0400
Received: from mail-lb0-f176.google.com ([209.85.217.176]:45619)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1X4Ee3-0004N8-Cb
	for qemu-trivial@nongnu.org; Mon, 07 Jul 2014 15:32:11 -0400
Received: by mail-lb0-f176.google.com with SMTP id w7so3192310lbi.21
	for <qemu-trivial@nongnu.org>; Mon, 07 Jul 2014 12:32:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=blXOf/bbesdpkTbde81Xvv11cEsEIKCEUTo5wvPlrG8=;
	b=bY/YNrt1gKlC/R3VD0BExsvhjr+P+vuPx7NzGg4BZioGz4mYwR2nNl7Qp+TFohvXez
	SVdWLUnhZYbVs2fz1EdcjhSdtwro26y20YTxPXoPT02xZiEHo57ql+qFQMo+hlHDak9q
	p++v3c1es8AOUr8Q5KXMLqBCl+uzfjivmkluk0kCJfvXq4tsEuwZcZxbBOLsXX7PHWnI
	T8nJZ4TKjoRADxHe8Ly7HLQQaQAPY49pyuDhMthz0+dEqYnbP8cKVpG8vGW4btbgH2ij
	dKhVvRzefwHu19feavkx1eEf5hixyFOjIeQmGkSx+afCAa5MqDcC6EeB01nuffUl8QBa
	pGDA==
X-Gm-Message-State: ALoCoQker9jBPzCLdr+cGid3/hEQ2TbbmemzfAyeDzNzDvAz0433IXuIVhiGBznMN1JIvt0UnwCa
X-Received: by 10.112.30.99 with SMTP id r3mr23748541lbh.14.1404761530248;
	Mon, 07 Jul 2014 12:32:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Mon, 7 Jul 2014 12:31:50 -0700 (PDT)
In-Reply-To: <1404760938-2265-1-git-send-email-sw@weilnetz.de>
References: <1404760938-2265-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Jul 2014 20:31:50 +0100
Message-ID: <CAFEAcA_+dRC8-Qze45pnumk87krLU-K4y62fYWPQG3zXh+4N6g@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.176
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/timer: Move extern
 declaration from .c to .h file
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jul 2014 19:32:21 -0000

On 7 July 2014 20:22, Stefan Weil <sw@weilnetz.de> wrote:
> This fixes a warning from smatch (static code analyser).
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/timer/tusb6010.c |    3 ---
>  include/hw/usb.h    |    4 ++++
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/hw/timer/tusb6010.c b/hw/timer/tusb6010.c
> index a281567..4e8f053 100644
> --- a/hw/timer/tusb6010.c
> +++ b/hw/timer/tusb6010.c
> @@ -282,9 +282,6 @@ static void tusb_gpio_intr_update(TUSBState *s)
>      /* TODO: How is this signalled?  */
>  }
>
> -extern CPUReadMemoryFunc * const musb_read[];
> -extern CPUWriteMemoryFunc * const musb_write[];
> -
>  static uint32_t tusb_async_readb(void *opaque, hwaddr addr)
>  {
>      TUSBState *s = (TUSBState *) opaque;
> diff --git a/include/hw/usb.h b/include/hw/usb.h
> index 8bcab48..e68e57e 100644
> --- a/include/hw/usb.h
> +++ b/include/hw/usb.h
> @@ -467,6 +467,10 @@ void usb_wakeup(USBEndpoint *ep, unsigned int stream);
>  void usb_generic_async_ctrl_complete(USBDevice *s, USBPacket *p);
>  int set_usb_string(uint8_t *buf, const char *str);
>
> +/* hcd-musb.c */
> +extern CPUReadMemoryFunc * const musb_read[];
> +extern CPUWriteMemoryFunc * const musb_write[];
> +
>  /* usb-linux.c */
>  USBDevice *usb_host_device_open(USBBus *bus, const char *devname);
>  void usb_host_info(Monitor *mon, const QDict *qdict);

This should go in the existing section for functions and defines
from this source file (which is mis-commented as "/* usb-musb.c */"
following a file renaming, I see).

(It's also a pretty foul API but I think that largely follows from
MUSB never having been qdevified or QOMified.)

thanks
-- PMM

