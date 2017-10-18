Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4nJq-0008Mt-0T
	for mharc-qemu-trivial@gnu.org; Wed, 18 Oct 2017 08:19:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4nJm-0008L6-PJ
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 08:19:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4nJl-00057j-JZ
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 08:19:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40780)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e4nJg-00053j-B1; Wed, 18 Oct 2017 08:19:20 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3509A80473;
	Wed, 18 Oct 2017 12:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3509A80473
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.33.192.189] (dhcp-192-189.str.redhat.com [10.33.192.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E4386A509;
	Wed, 18 Oct 2017 12:19:12 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
	<hpoussin@reactos.org>, Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20171017164426.25277-1-f4bug@amsat.org>
	<20171017164426.25277-38-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <28efa044-0b5d-6a98-1356-631352d8b9ba@redhat.com>
Date: Wed, 18 Oct 2017 14:19:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171017164426.25277-38-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 18 Oct 2017 12:19:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v3 37/42] hw/display/vga: extract public
 API from i386/pc to "hw/display/vga.h"
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
X-List-Received-Date: Wed, 18 Oct 2017 12:19:28 -0000

On 17.10.2017 18:44, Philippe Mathieu-Daud=C3=A9 wrote:
> and remove the old i386/pc dependency.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/display/vga.h | 25 +++++++++++++++++++++++++
>  include/hw/i386/pc.h     | 12 ------------
>  hw/display/vga-isa-mm.c  |  3 +--
>  hw/display/vga-isa.c     |  2 +-
>  hw/display/vga.c         |  2 +-
>  hw/mips/mips_jazz.c      |  1 +
>  vl.c                     |  2 +-
>  MAINTAINERS              |  1 +
>  8 files changed, 31 insertions(+), 17 deletions(-)
>  create mode 100644 include/hw/display/vga.h
>=20
> diff --git a/include/hw/display/vga.h b/include/hw/display/vga.h
> new file mode 100644
> index 0000000000..0401a3a292
> --- /dev/null
> +++ b/include/hw/display/vga.h
> @@ -0,0 +1,25 @@
> +/*
> + * QEMU VGA Emulator.
> + *
> + * Copyright (c) 2003 Fabrice Bellard
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> + * See the COPYING file in the top-level directory.
> + */
> +#ifndef QEMU_HW_DISPLAY_VGA_H
> +#define QEMU_HW_DISPLAY_VGA_H
> +
> +#include "exec/memory.h"
> +
> +enum vga_retrace_method {
> +    VGA_RETRACE_DUMB,
> +    VGA_RETRACE_PRECISE
> +};
> +
> +extern enum vga_retrace_method vga_retrace_method;
> +
> +int isa_vga_mm_init(hwaddr vram_base,
> +                    hwaddr ctrl_base, int it_shift,
> +                    MemoryRegion *address_space);
> +
> +#endif
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index b1b4c918af..25ba378bd8 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -302,18 +302,6 @@ PCIBus *find_i440fx(void);
>  extern PCIDevice *piix4_dev;
>  int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn);
> =20
> -/* vga.c */
> -enum vga_retrace_method {
> -    VGA_RETRACE_DUMB,
> -    VGA_RETRACE_PRECISE
> -};
> -
> -extern enum vga_retrace_method vga_retrace_method;
> -
> -int isa_vga_mm_init(hwaddr vram_base,
> -                    hwaddr ctrl_base, int it_shift,
> -                    MemoryRegion *address_space);
> -
>  /* ne2000.c */
>  static inline bool isa_ne2000_init(ISABus *bus, int base, int irq, NIC=
Info *nd)
>  {
> diff --git a/hw/display/vga-isa-mm.c b/hw/display/vga-isa-mm.c
> index 68c4d6e23e..e887b45651 100644
> --- a/hw/display/vga-isa-mm.c
> +++ b/hw/display/vga-isa-mm.c
> @@ -23,10 +23,9 @@
>   */
>  #include "qemu/osdep.h"
>  #include "hw/hw.h"
> -#include "hw/i386/pc.h"
> +#include "hw/display/vga.h"
>  #include "vga_int.h"
>  #include "ui/pixel_ops.h"
> -#include "qemu/timer.h"
> =20
>  #define VGA_RAM_SIZE (8192 * 1024)
> =20
> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
> index 26f69fd40a..469834add5 100644
> --- a/hw/display/vga-isa.c
> +++ b/hw/display/vga-isa.c
> @@ -25,7 +25,7 @@
>   */
>  #include "qemu/osdep.h"
>  #include "hw/hw.h"
> -#include "hw/i386/pc.h"
> +#include "hw/isa/isa.h"
>  #include "vga_int.h"
>  #include "ui/pixel_ops.h"
>  #include "qemu/timer.h"
> diff --git a/hw/display/vga.c b/hw/display/vga.c
> index 22fd069ad2..59729f7031 100644
> --- a/hw/display/vga.c
> +++ b/hw/display/vga.c
> @@ -24,7 +24,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/hw.h"
> -#include "hw/i386/pc.h"
> +#include "hw/display/vga.h"
>  #include "hw/pci/pci.h"
>  #include "vga_int.h"
>  #include "vga_regs.h"
> diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
> index b9ffb33b45..ece4a153b2 100644
> --- a/hw/mips/mips_jazz.c
> +++ b/hw/mips/mips_jazz.c
> @@ -39,6 +39,7 @@
>  #include "hw/loader.h"
>  #include "hw/timer/mc146818rtc.h"
>  #include "hw/timer/i8254.h"
> +#include "hw/display/vga.h"
>  #include "hw/audio/pcspk.h"
>  #include "sysemu/block-backend.h"
>  #include "hw/sysbus.h"
> diff --git a/vl.c b/vl.c
> index 0d1f612629..f0b7106feb 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -57,9 +57,9 @@ int main(int argc, char **argv)
>  #include "hw/boards.h"
>  #include "sysemu/accel.h"
>  #include "hw/usb.h"
> -#include "hw/i386/pc.h"
>  #include "hw/isa/isa.h"
>  #include "hw/scsi/scsi.h"
> +#include "hw/display/vga.h"
>  #include "hw/bt.h"
>  #include "sysemu/watchdog.h"
>  #include "hw/smbios/smbios.h"
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0e926a942b..81b67e4685 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -860,6 +860,7 @@ F: hw/timer/hpet*
>  F: hw/timer/i8254*
>  F: hw/timer/mc146818rtc*
>  F: hw/watchdog/wdt_ib700.c
> +F: include/hw/display/vga.h
>  F: include/hw/i2c/pm_smbus.h
>  F: include/hw/isa/i8257.h
>  F: include/hw/timer/hpet.h

Not sure whether this is the right section for vga.h ... especially
since the other hw/display/vga* files are also not listed in MAINTAINERS
yet?

Anyway, the other parts of this patch look fine to me, so with or
without the change to MAINTAINERS:

Reviewed-by: Thomas Huth <thuth@redhat.com>



