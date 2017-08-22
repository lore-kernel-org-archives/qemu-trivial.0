Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dkArf-0001uJ-Ar
	for mharc-qemu-trivial@gnu.org; Tue, 22 Aug 2017 11:13:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dkAra-0001s4-0g
	for qemu-trivial@nongnu.org; Tue, 22 Aug 2017 11:13:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dkArZ-0007wI-6F
	for qemu-trivial@nongnu.org; Tue, 22 Aug 2017 11:13:06 -0400
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:35461)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dkArY-0007vN-U6
	for qemu-trivial@nongnu.org; Tue, 22 Aug 2017 11:13:05 -0400
Received: by mail-wm0-x231.google.com with SMTP id r187so80381wma.0
	for <qemu-trivial@nongnu.org>; Tue, 22 Aug 2017 08:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PYKdjk/4qP94bgsbUz0gGB53KNSF1nXEATAQQuLXYJs=;
	b=VO5r4LkvmWbPEXpYagnBbI2h5jbFZichfuAG79ZHsF397QpGnJM0fNdM4BdebEnENm
	w3l6YVhjaVORKJkT7i4/hlZvZ0PDfg5c0BSwI+qI3hHVjXX//IfyLMHeT2oeSMd0Pa3j
	Q4ojIt8AuvisPASK0IZdc8kQEKEy2JVWUj6JY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PYKdjk/4qP94bgsbUz0gGB53KNSF1nXEATAQQuLXYJs=;
	b=kJ/2uJX/p1jOJSg/dCphweluL6Mpl8f6KD9Gu54ffQ+9FYlUQTw7RX4gQKDtlUZem6
	k7k7Tp3xxkhXMXMguMSeq/i5Sq1H4mqOaWvHVXdYyRVoJILdWm0/giEIrPvEwfmLv+T+
	Iq3W+egJT8+3zflr4FjaaS4Iegg5Uo3QnLqhj3QnwNDrGl/DWZ8c/2glDgV3BeiLuJax
	faAcolpg+oF6oMmmFmvcaNiiTODk7tJIrYIrB1JmJPRksZQSX9mLa5+fh7Nx6v6lW3Tz
	xVDbEUOIea37qYyj/JqROzHQpr9H3jZC2U/x7h+gJUkZA2Hr4Z+JEevymRfXFSrxZ+l9
	EoVg==
X-Gm-Message-State: AHYfb5jnqdWvspqqSj04SoONvBG8T90rMMEIzkqSs6liKE8OKjpV2E52
	1OwVR4+s64ESQ8iNndkzleanpS5i/uLQ
X-Received: by 10.28.134.201 with SMTP id i192mr4366wmd.124.1503414783874;
	Tue, 22 Aug 2017 08:13:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Tue, 22 Aug 2017 08:12:43 -0700 (PDT)
In-Reply-To: <1503414375-21009-1-git-send-email-thuth@redhat.com>
References: <1503414375-21009-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Aug 2017 16:12:43 +0100
Message-ID: <CAFEAcA-92Jjz2uCC387oX2u0NWfijPwB_8zGaagC1m=sKD8zhQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	KONRAD Frederic <frederic.konrad@adacore.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::231
Subject: Re: [Qemu-trivial] [PATCH] hw/misc/auxbus.c: Mark the
 aux-to-i2c-bridge device as non-hotpluggable
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
X-List-Received-Date: Tue, 22 Aug 2017 15:13:10 -0000

On 22 August 2017 at 16:06, Thomas Huth <thuth@redhat.com> wrote:
> QEMU currently aborts if the user tries to do something like this:
>
> $ aarch64-softmmu/qemu-system-aarch64 -S -M integratorcp -nographic
> QEMU 2.9.93 monitor - type 'help' for more information
> (qemu) device_add aux-to-i2c-bridge,id=x
> (qemu) device_del x
> **
> ERROR:qemu/qdev-monitor.c:872:qdev_unplug: assertion failed: (hotplug_ctrl)
> Aborted (core dumped)
>
> Looks like the device is not hot-pluggable, so let's mark it
> accordingly.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/misc/auxbus.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
> index 8a90ddd..2c62515 100644
> --- a/hw/misc/auxbus.c
> +++ b/hw/misc/auxbus.c
> @@ -222,9 +222,17 @@ static inline I2CBus *aux_bridge_get_i2c_bus(AUXTOI2CState *bridge)
>      return bridge->i2c_bus;
>  }
>
> +static void aux_bridge_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->hotpluggable = false;
> +}

Why is our default "hotpluggable" rather than "not hotpluggable" ?
We must have way more non-hotpluggable devices than hotpluggable
ones, and it takes active effort to make a hotpluggable device
model, so it seems like it would be much less bug-prone to
require hotpluggable devices to set dc->hotpluggable true
rather than all the non-hotpluggable ones to set it false...

thanks
-- PMM

