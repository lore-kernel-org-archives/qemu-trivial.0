Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cWfXm-0008Fk-TS
	for mharc-qemu-trivial@gnu.org; Thu, 26 Jan 2017 03:36:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54173)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1cWfXk-0008E9-OI
	for qemu-trivial@nongnu.org; Thu, 26 Jan 2017 03:36:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1cWfXj-0006Sx-IU
	for qemu-trivial@nongnu.org; Thu, 26 Jan 2017 03:36:32 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:59429)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1cWfXd-0006Rt-3V; Thu, 26 Jan 2017 03:36:25 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue104 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0MfZIB-1cqnvi1BkJ-00P6nw; Thu, 26 Jan 2017 09:36:21 +0100
To: Thomas Huth <huth@tuxfamily.org>, QEMU Developers <qemu-devel@nongnu.org>
References: <e4eb55c2-bac0-01f4-267f-19e70aa9b0de@tuxfamily.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <1408f20b-1fba-deea-b09c-ab7eceb1def7@vivier.eu>
Date: Thu, 26 Jan 2017 09:36:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <e4eb55c2-bac0-01f4-267f-19e70aa9b0de@tuxfamily.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:4LXRCH+Bg0ypGcSq0zbs5R5H2T8yH3trk68w6ER+pxJJWVTjh2f
	ryOlL3y2MM87MZCpUeUXKm5UtEJH8RTunCsxTouKhoWmA+sylDzR9heVe2KiQaf8pTOuK2h
	40Pafdfz/wHm63HMv5DXzjkiAEGFmFh4E4ns26Kpc8cS5xdHsPGspDitjibQmmqfI4YiGQk
	uenuxptuu3OeeTTgAMXig==
X-UI-Out-Filterresults: notjunk:1;V01:K0:OCmz6gaQIAM=:Wh5as5H6WAn3xC9QVWOE7y
	TRAxGyE6gvPMYMGjk2FUufJ7wiNtUtzMmWRJLTN/auVs69gmKpnfZDUsvj87p6TwzNm/ppJqw
	zm11QVk3m1eJ0JDt6P2hNTm4NmgdOOgWg7RduXtmFm2nOk8K3AnvDlM6lzrow8B5XJ1N3F/mq
	+6ESoxC5WJIpM4BUJ1kKrX/zdtAH+azgcLpQxI+CSrHDlGDaQAwZWwrdm1b6fpnwKb6BuPJHG
	U3M6tgWcNGubl9LXlz6EYu9jb7mLh+yan4z9T5vu22hOSm2Lo9CIRcwTlBQCCui0S0XJicCOX
	5cOsroipUvmw5cvQ/tBoJcczu2Tgx3yrJA0TmUzt5BS/a/DB5YKD5GcnMX4NT3y6ki0WioW/X
	j/7daOxyPjW3wjTKkUdExL7HwMYsRtnNwnd3pM7GNLjqwtlwyCtQ1VjIb/VZT2zEfa+PC6YeG
	mO8TWpAmshRwoF7kIfBwxAWHsNg6tBHU5vrgFv751xj531Qx3kbQaC4H9b7n4Xa8K1dG/ed0v
	C2nZURFtuVGYySRSTr/T8NqlGiPWML1rTLiZBI6QstXQ3xRpZ5n4mgj9vc2O0S+SCtCC3B6Z9
	MvaQuQhEXFBC59kc5Ijw8lh7yK4RETeETzB62hX2ap07PlB5MvqDZbd/VaMYiIAIsWtLRUcgL
	OGEaGyy123NcmE/Wh2I9eRFw4oWl5bcALBNzaXnUt7rzWkhQwVXTJYDP3e1GzYmxIHF+5cSKs
	3y/i3W8kcHJI7lJl
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.17.10
Subject: Re: [Qemu-trivial] [PATCH v2] m68k: Remove dummy machine
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
X-List-Received-Date: Thu, 26 Jan 2017 08:36:34 -0000

Le 26/01/2017 à 09:30, Thomas Huth a écrit :
> Since it is now possible to instantiate a CPU and RAM with the "none"
> machine, too, and a kernel can be loaded there with the generic loader
> device, there is no more need for the m68k "dummy" machine. Thus let's
> remove this unmaintained file now.
> 
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

> ---
>  v2: Updated the patch description
> 
>  MAINTAINERS           |  4 ---
>  hw/m68k/Makefile.objs |  2 --
>  hw/m68k/dummy_m68k.c  | 84 ---------------------------------------------------
>  3 files changed, 90 deletions(-)
>  delete mode 100644 hw/m68k/dummy_m68k.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a428cb2..36eaf48 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -565,10 +565,6 @@ S: Orphan
>  F: hw/m68k/an5206.c
>  F: hw/m68k/mcf5206.c
>  
> -dummy_m68k
> -S: Orphan
> -F: hw/m68k/dummy_m68k.c
> -
>  mcf5208
>  S: Orphan
>  F: hw/m68k/mcf5208.c
> diff --git a/hw/m68k/Makefile.objs b/hw/m68k/Makefile.objs
> index c4352e7..d1f089c 100644
> --- a/hw/m68k/Makefile.objs
> +++ b/hw/m68k/Makefile.objs
> @@ -1,4 +1,2 @@
>  obj-y += an5206.o mcf5208.o
> -obj-y += dummy_m68k.o
> -
>  obj-y += mcf5206.o mcf_intc.o
> diff --git a/hw/m68k/dummy_m68k.c b/hw/m68k/dummy_m68k.c
> deleted file mode 100644
> index 0b11d20..0000000
> --- a/hw/m68k/dummy_m68k.c
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -/*
> - * Dummy board with just RAM and CPU for use as an ISS.
> - *
> - * Copyright (c) 2007 CodeSourcery.
> - *
> - * This code is licensed under the GPL
> - */
> -
> -#include "qemu/osdep.h"
> -#include "qemu-common.h"
> -#include "cpu.h"
> -#include "hw/hw.h"
> -#include "hw/boards.h"
> -#include "hw/loader.h"
> -#include "elf.h"
> -#include "exec/address-spaces.h"
> -
> -#define KERNEL_LOAD_ADDR 0x10000
> -
> -/* Board init.  */
> -
> -static void dummy_m68k_init(MachineState *machine)
> -{
> -    ram_addr_t ram_size = machine->ram_size;
> -    const char *cpu_model = machine->cpu_model;
> -    const char *kernel_filename = machine->kernel_filename;
> -    M68kCPU *cpu;
> -    CPUM68KState *env;
> -    MemoryRegion *address_space_mem =  get_system_memory();
> -    MemoryRegion *ram = g_new(MemoryRegion, 1);
> -    int kernel_size;
> -    uint64_t elf_entry;
> -    hwaddr entry;
> -
> -    if (!cpu_model)
> -        cpu_model = "cfv4e";
> -    cpu = cpu_m68k_init(cpu_model);
> -    if (!cpu) {
> -        fprintf(stderr, "Unable to find m68k CPU definition\n");
> -        exit(1);
> -    }
> -    env = &cpu->env;
> -
> -    /* Initialize CPU registers.  */
> -    env->vbr = 0;
> -
> -    /* RAM at address zero */
> -    memory_region_allocate_system_memory(ram, NULL, "dummy_m68k.ram",
> -                                         ram_size);
> -    memory_region_add_subregion(address_space_mem, 0, ram);
> -
> -    /* Load kernel.  */
> -    if (kernel_filename) {
> -        kernel_size = load_elf(kernel_filename, NULL, NULL, &elf_entry,
> -                               NULL, NULL, 1, EM_68K, 0, 0);
> -        entry = elf_entry;
> -        if (kernel_size < 0) {
> -            kernel_size = load_uimage(kernel_filename, &entry, NULL, NULL,
> -                                      NULL, NULL);
> -        }
> -        if (kernel_size < 0) {
> -            kernel_size = load_image_targphys(kernel_filename,
> -                                              KERNEL_LOAD_ADDR,
> -                                              ram_size - KERNEL_LOAD_ADDR);
> -            entry = KERNEL_LOAD_ADDR;
> -        }
> -        if (kernel_size < 0) {
> -            fprintf(stderr, "qemu: could not load kernel '%s'\n",
> -                    kernel_filename);
> -            exit(1);
> -        }
> -    } else {
> -        entry = 0;
> -    }
> -    env->pc = entry;
> -}
> -
> -static void dummy_m68k_machine_init(MachineClass *mc)
> -{
> -    mc->desc = "Dummy board";
> -    mc->init = dummy_m68k_init;
> -}
> -
> -DEFINE_MACHINE("dummy", dummy_m68k_machine_init)
> 


