Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f8BB4-00072b-IK
	for mharc-qemu-trivial@gnu.org; Mon, 16 Apr 2018 16:56:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1f8BB0-00071P-LS
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2018 16:56:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1f8BAz-0000BV-4M
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2018 16:56:38 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:33672)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1f8BAy-0000A4-PD; Mon, 16 Apr 2018 16:56:37 -0400
Received: by mail-lf0-x241.google.com with SMTP id m14-v6so12148377lfc.0;
	Mon, 16 Apr 2018 13:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Uox431RlGdk1XGX/zg6vfUHINH5lbwyqe56dUQqiPw4=;
	b=DOk3j4UsDURRzaUOy6vHDxndpae/ZVTZPVBOhVbAuM6i4fpse6XLMP0ONXMH1MzY/g
	+I9AJJJYoIe6lOoUO0cq+WQK4+qQIad41sw7rD6NuC95YSA0/vvVYz/Nw7kGiYGHm4yS
	2hDhOl5peoTFLdEPxObrVhpEh78o9l5rrQlSZpOObWlYuk/oW6hAjGl6tRxAShfsVAeE
	DvHHH7H7rsa4zYrXbio5ia7adOyPaRuMwB1SvnrM3425HP157ujWDeXOUS7jpanDZGne
	7Us7581a+UXxM5gMELB09v9pSX8TYcpxmLKqSRAym+TAiu06Pb6To1s2Msw/azEhiI5T
	zsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Uox431RlGdk1XGX/zg6vfUHINH5lbwyqe56dUQqiPw4=;
	b=Cq9qUE+KkQv7aHLG3L+hJNn7lhzbMW8YHrlAc7XGpDj9KGczwDrEb/CYdr/LXfjteG
	6hZ35JaYHuF0IVvSQ+sD+U4MtsBboQqNWE+0FTrYvaJMlqReo67mhQVczSsD2Hbfz1ry
	FowWJXXweFZLHSuEDF++hcTeqa9yH58vM6P4I8kcItRr0QS4Gmi2eSmxlx5qTlfnEhTn
	PA/z725T/ADDEzSoU7l4YQfCHRSA/SEbWpSISUfWdcO6JlsapCIzW2qG+pwwqqTa29yu
	LVIWT2G45p3kGXAfwysGJl/zYlOWwcdDU5ogg5eegzEIZDzQjSEm+0kRsCuwLT7+ZBtT
	91Gg==
X-Gm-Message-State: ALQs6tCQ3/HJOBatxHRAnEp8Wp5rZS5gAJMKxC/sAyyc8D4G1kS55FjE
	3d13eqedGguUYO1d1cFPchsjGlLxPqABkojQkr4=
X-Google-Smtp-Source: AIpwx497/fEjJUY9YUloGOd4I4xnqv1SFYkKU7hXZ22T26XrYwEGxa4ovXKkM5/lrhKcIG4ErfziLGlQjEwpwRlWcvc=
X-Received: by 10.46.127.10 with SMTP id a10mr2382475ljd.78.1523912195300;
	Mon, 16 Apr 2018 13:56:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.135.147 with HTTP; Mon, 16 Apr 2018 13:56:04 -0700 (PDT)
In-Reply-To: <20180415234307.28132-30-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
	<20180415234307.28132-30-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Apr 2018 13:56:04 -0700
Message-ID: <CAKmqyKPHbymtr4r9wgmb7H3ki96mWuFDjHRBJFm8sSfyB6J6xA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
	Paul Burton <paul.burton@mips.com>, Yongbok Kim <yongbok.kim@mips.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 29/41] hw/mips: Use the
 BYTE-based definitions
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
X-List-Received-Date: Mon, 16 Apr 2018 20:56:40 -0000

On Sun, Apr 15, 2018 at 4:42 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> It eases code review, unit is explicit.
>
> Patch generated using:
>
>   $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/h=
w/
>
> and modified manually.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/intc/mips_gic.h |  3 ++-
>  include/hw/mips/bios.h     |  3 ++-
>  hw/mips/boston.c           |  4 ++--
>  hw/mips/mips_fulong2e.c    |  7 ++++---
>  hw/mips/mips_malta.c       | 23 +++++++++++++----------
>  hw/mips/mips_r4k.c         | 11 ++++++-----
>  hw/misc/mips_itu.c         |  3 ++-
>  hw/pci-host/xilinx-pcie.c  |  5 +++--
>  8 files changed, 34 insertions(+), 25 deletions(-)
>
> diff --git a/include/hw/intc/mips_gic.h b/include/hw/intc/mips_gic.h
> index b98d50094a..c0da44bdb3 100644
> --- a/include/hw/intc/mips_gic.h
> +++ b/include/hw/intc/mips_gic.h
> @@ -11,6 +11,7 @@
>  #ifndef MIPS_GIC_H
>  #define MIPS_GIC_H
>
> +#include "qemu/units.h"
>  #include "hw/timer/mips_gictimer.h"
>  #include "cpu.h"
>  /*
> @@ -19,7 +20,7 @@
>
>  /* The MIPS default location */
>  #define GIC_BASE_ADDR           0x1bdc0000ULL
> -#define GIC_ADDRSPACE_SZ        (128 * 1024)
> +#define GIC_ADDRSPACE_SZ        (128 * K_BYTE)
>
>  /* Constants */
>  #define GIC_POL_POS     1
> diff --git a/include/hw/mips/bios.h b/include/hw/mips/bios.h
> index b4b88ac43d..b4c97ce87c 100644
> --- a/include/hw/mips/bios.h
> +++ b/include/hw/mips/bios.h
> @@ -1,6 +1,7 @@
> +#include "qemu/units.h"
>  #include "cpu.h"
>
> -#define BIOS_SIZE (4 * 1024 * 1024)
> +#define BIOS_SIZE (4 * M_BYTE)
>  #ifdef TARGET_WORDS_BIGENDIAN
>  #define BIOS_FILENAME "mips_bios.bin"
>  #else
> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
> index fb23161b33..edc39e91f7 100644
> --- a/hw/mips/boston.c
> +++ b/hw/mips/boston.c
> @@ -32,7 +32,7 @@
>  #include "hw/mips/cpudevs.h"
>  #include "hw/pci-host/xilinx-pcie.h"
>  #include "qapi/error.h"
> -#include "qemu/cutils.h"
> +#include "qemu/units.h"
>  #include "qemu/error-report.h"
>  #include "qemu/log.h"
>  #include "chardev/char.h"
> @@ -437,7 +437,7 @@ static void boston_mach_init(MachineState *machine)
>      bool is_64b;
>
>      if ((machine->ram_size % G_BYTE) ||
> -        (machine->ram_size > (2 * G_BYTE))) {
> +        (machine->ram_size > 2 * G_BYTE)) {
>          error_report("Memory size must be 1GB or 2GB");
>          exit(1);
>      }
> diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
> index 02fb2fdcc4..779883db7c 100644
> --- a/hw/mips/mips_fulong2e.c
> +++ b/hw/mips/mips_fulong2e.c
> @@ -19,6 +19,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "hw/hw.h"
>  #include "hw/i386/pc.h"
> @@ -159,7 +160,7 @@ static int64_t load_kernel (CPUMIPSState *env)
>      /* Setup minimum environment variables */
>      prom_set(prom_buf, index++, "busclock=3D33000000");
>      prom_set(prom_buf, index++, "cpuclock=3D100000000");
> -    prom_set(prom_buf, index++, "memsize=3D%i", loaderparams.ram_size/10=
24/1024);
> +    prom_set(prom_buf, index++, "memsize=3D%llu", loaderparams.ram_size =
/ M_BYTE);
>      prom_set(prom_buf, index++, "modetty0=3D38400n8r");
>      prom_set(prom_buf, index++, NULL);
>
> @@ -303,10 +304,10 @@ static void mips_fulong2e_init(MachineState *machin=
e)
>      qemu_register_reset(main_cpu_reset, cpu);
>
>      /* fulong 2e has 256M ram. */
> -    ram_size =3D 256 * 1024 * 1024;
> +    ram_size =3D 256 * M_BYTE;
>
>      /* fulong 2e has a 1M flash.Winbond W39L040AP70Z */
> -    bios_size =3D 1024 * 1024;
> +    bios_size =3D 1 * M_BYTE;
>
>      /* allocate RAM */
>      memory_region_allocate_system_memory(ram, NULL, "fulong2e.ram", ram_=
size);
> diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
> index f6513a4fd5..240dd762be 100644
> --- a/hw/mips/mips_malta.c
> +++ b/hw/mips/mips_malta.c
> @@ -23,6 +23,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qemu-common.h"
>  #include "cpu.h"
>  #include "hw/hw.h"
> @@ -844,7 +845,8 @@ static int64_t load_kernel (void)
>              /* The kernel allocates the bootmap memory in the low memory=
 after
>                 the initrd.  It takes at most 128kiB for 2GB RAM and 4kiB
>                 pages.  */
> -            initrd_offset =3D (loaderparams.ram_low_size - initrd_size -=
 131072
> +            initrd_offset =3D (loaderparams.ram_low_size - initrd_size
> +                             - (128 * K_BYTE)
>                               - ~INITRD_PAGE_MASK) & INITRD_PAGE_MASK;
>              if (kernel_high >=3D initrd_offset) {
>                  error_report("memory too small for initial ram disk '%s'=
",
> @@ -1022,9 +1024,9 @@ void mips_malta_init(MachineState *machine)
>      mips_create_cpu(s, machine->cpu_type, &cbus_irq, &i8259_irq);
>
>      /* allocate RAM */
> -    if (ram_size > (2048u << 20)) {
> -        error_report("Too much memory for this machine: %dMB, maximum 20=
48MB",
> -                     ((unsigned int)ram_size / (1 << 20)));
> +    if (ram_size > 2 * G_BYTE) {
> +        error_report("Too much memory for this machine: %lluMB, maximum =
2048MB",
> +                     ram_size / M_BYTE);
>          exit(1);
>      }
>
> @@ -1035,17 +1037,18 @@ void mips_malta_init(MachineState *machine)
>
>      /* alias for pre IO hole access */
>      memory_region_init_alias(ram_low_preio, NULL, "mips_malta_low_preio.=
ram",
> -                             ram_high, 0, MIN(ram_size, (256 << 20)));
> +                             ram_high, 0, MIN(ram_size, 256 * M_BYTE));
>      memory_region_add_subregion(system_memory, 0, ram_low_preio);
>
>      /* alias for post IO hole access, if there is enough RAM */
> -    if (ram_size > (512 << 20)) {
> +    if (ram_size > 512 * M_BYTE) {
>          ram_low_postio =3D g_new(MemoryRegion, 1);
>          memory_region_init_alias(ram_low_postio, NULL,
>                                   "mips_malta_low_postio.ram",
> -                                 ram_high, 512 << 20,
> -                                 ram_size - (512 << 20));
> -        memory_region_add_subregion(system_memory, 512 << 20, ram_low_po=
stio);
> +                                 ram_high, 512 * M_BYTE,
> +                                 ram_size - 512 * M_BYTE);
> +        memory_region_add_subregion(system_memory, 512 * M_BYTE,
> +                                    ram_low_postio);
>      }
>
>  #ifdef TARGET_WORDS_BIGENDIAN
> @@ -1082,7 +1085,7 @@ void mips_malta_init(MachineState *machine)
>      bios =3D pflash_cfi01_get_memory(fl);
>      fl_idx++;
>      if (kernel_filename) {
> -        ram_low_size =3D MIN(ram_size, 256 << 20);
> +        ram_low_size =3D MIN(ram_size, 256 * M_BYTE);
>          /* For KVM we reserve 1MB of RAM for running bootloader */
>          if (kvm_enabled()) {
>              ram_low_size -=3D 0x100000;
> diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
> index c26a44da06..2a848bc1c2 100644
> --- a/hw/mips/mips_r4k.c
> +++ b/hw/mips/mips_r4k.c
> @@ -8,6 +8,7 @@
>   * the standard PC ISA addresses.
>  */
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "qemu-common.h"
>  #include "cpu.h"
> @@ -144,7 +145,7 @@ static int64_t load_kernel(void)
>      }
>
>      rom_add_blob_fixed("params", params_buf, params_size,
> -                       (16 << 20) - params_size);
> +                       16 * M_BYTE - params_size);
>
>      g_free(params_buf);
>      return entry;
> @@ -159,7 +160,7 @@ static void main_cpu_reset(void *opaque)
>      env->active_tc.PC =3D s->vector;
>  }
>
> -static const int sector_len =3D 32 * 1024;
> +static const int sector_len =3D 32 * K_BYTE;
>  static
>  void mips_r4k_init(MachineState *machine)
>  {
> @@ -195,9 +196,9 @@ void mips_r4k_init(MachineState *machine)
>      qemu_register_reset(main_cpu_reset, reset_info);
>
>      /* allocate RAM */
> -    if (ram_size > (256 << 20)) {
> -        error_report("Too much memory for this machine: %dMB, maximum 25=
6MB",
> -                     ((unsigned int)ram_size / (1 << 20)));
> +    if (ram_size > 256 * M_BYTE) {
> +        error_report("Too much memory for this machine: %lluMB, maximum =
256MB",
> +                     ram_size / M_BYTE);
>          exit(1);
>      }
>      memory_region_allocate_system_memory(ram, NULL, "mips_r4k.ram", ram_=
size);
> diff --git a/hw/misc/mips_itu.c b/hw/misc/mips_itu.c
> index ccc4c7d98a..e40d472108 100644
> --- a/hw/misc/mips_itu.c
> +++ b/hw/misc/mips_itu.c
> @@ -18,6 +18,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qemu/log.h"
>  #include "qapi/error.h"
>  #include "cpu.h"
> @@ -80,7 +81,7 @@ static void itc_reconfigure(MIPSITUState *tag)
>      uint64_t *am =3D &tag->ITCAddressMap[0];
>      MemoryRegion *mr =3D &tag->storage_io;
>      hwaddr address =3D am[0] & ITC_AM0_BASE_ADDRESS_MASK;
> -    uint64_t size =3D (1 << 10) + (am[1] & ITC_AM1_ADDR_MASK_MASK);
> +    uint64_t size =3D (1 * K_BYTE) + (am[1] & ITC_AM1_ADDR_MASK_MASK);
>      bool is_enabled =3D (am[0] & ITC_AM0_EN_MASK) !=3D 0;
>
>      memory_region_transaction_begin();
> diff --git a/hw/pci-host/xilinx-pcie.c b/hw/pci-host/xilinx-pcie.c
> index 044e312dc1..6758669ce9 100644
> --- a/hw/pci-host/xilinx-pcie.c
> +++ b/hw/pci-host/xilinx-pcie.c
> @@ -18,6 +18,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "hw/pci/pci_bridge.h"
>  #include "hw/pci-host/xilinx-pcie.h"
> @@ -158,9 +159,9 @@ static void xilinx_pcie_host_init(Object *obj)
>  static Property xilinx_pcie_host_props[] =3D {
>      DEFINE_PROP_UINT32("bus_nr", XilinxPCIEHost, bus_nr, 0),
>      DEFINE_PROP_SIZE("cfg_base", XilinxPCIEHost, cfg_base, 0),
> -    DEFINE_PROP_SIZE("cfg_size", XilinxPCIEHost, cfg_size, 32 << 20),
> +    DEFINE_PROP_SIZE("cfg_size", XilinxPCIEHost, cfg_size, 32 * M_BYTE),
>      DEFINE_PROP_SIZE("mmio_base", XilinxPCIEHost, mmio_base, 0),
> -    DEFINE_PROP_SIZE("mmio_size", XilinxPCIEHost, mmio_size, 1 << 20),
> +    DEFINE_PROP_SIZE("mmio_size", XilinxPCIEHost, mmio_size, 1 * M_BYTE)=
,
>      DEFINE_PROP_BOOL("link_up", XilinxPCIEHost, link_up, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
> --
> 2.17.0
>
>

