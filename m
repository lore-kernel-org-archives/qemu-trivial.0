Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kTWVU-0007lV-J8
	for mharc-qemu-trivial@gnu.org; Fri, 16 Oct 2020 16:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kTWVS-0007k1-Bv; Fri, 16 Oct 2020 16:39:18 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:37948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kTWUO-00013y-DZ; Fri, 16 Oct 2020 16:39:17 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9613574761F;
 Fri, 16 Oct 2020 22:38:02 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7197C7475FA; Fri, 16 Oct 2020 22:38:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 708AD746383;
 Fri, 16 Oct 2020 22:38:02 +0200 (CEST)
Date: Fri, 16 Oct 2020 22:38:02 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, f4bug@amsat.org, 
 hpoussin@reactos.org, qemu-ppc@nongnu.org, atar4qemu@gmail.com, 
 david@gibson.dropbear.id.au
Subject: Re: [PATCH 4/5] ppc405_boards: use qdev properties instead of legacy
 m48t59_init() function
In-Reply-To: <20201016182739.22875-5-mark.cave-ayland@ilande.co.uk>
Message-ID: <653bf315-d1e4-4dc9-dac8-1e859a2ad4d1@eik.bme.hu>
References: <20201016182739.22875-1-mark.cave-ayland@ilande.co.uk>
 <20201016182739.22875-5-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 16 Oct 2020 20:39:18 -0000

On Fri, 16 Oct 2020, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
> hw/ppc/ppc405_boards.c | 10 +++++++++-
> 1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 6198ec1035..4687715b15 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -28,6 +28,8 @@
> #include "qemu-common.h"
> #include "cpu.h"
> #include "hw/ppc/ppc.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/sysbus.h"
> #include "ppc405.h"
> #include "hw/rtc/m48t59.h"
> #include "hw/block/flash.h"
> @@ -145,6 +147,8 @@ static void ref405ep_init(MachineState *machine)
>     char *filename;
>     ppc4xx_bd_info_t bd;
>     CPUPPCState *env;
> +    DeviceState *dev;
> +    SysBusDevice *s;
>     qemu_irq *pic;
>     MemoryRegion *bios;
>     MemoryRegion *sram = g_new(MemoryRegion, 1);
> @@ -227,7 +231,11 @@ static void ref405ep_init(MachineState *machine)
>     /* Register FPGA */
>     ref405ep_fpga_init(sysmem, 0xF0300000);
>     /* Register NVRAM */
> -    m48t59_init(NULL, 0xF0000000, 0, 8192, 1968, 8);
> +    dev = qdev_new("sysbus-m48t08");
> +    qdev_prop_set_int32(dev, "base-year", 1968);

Is there anything that uses other than 1968 as base year? If not this 
could be the default in the device so you don't need these set prop calls 
here and in sun machines.

The only other place this device is used seems to be ppc/prep machine that 
uses the isa version but does not set a base year. Is that a bug? The 
original prep machine removed in b2ce76a0730 used 2000 but that's unlikely 
as well as these machines predate that. Anyway, the sysbus and isa 
versions are different so their default base-year could be set 
independently and then boards won't need to set this propery and may be 
could use qdev_create_simple instead or whatever that was renamed to.

Regards,
BALATON Zoltan

> +    s = SYS_BUS_DEVICE(dev);
> +    sysbus_realize_and_unref(s, &error_fatal);
> +    sysbus_mmio_map(s, 0, 0xF0000000);
>     /* Load kernel */
>     linux_boot = (kernel_filename != NULL);
>     if (linux_boot) {
>

