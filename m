Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cLqJ8-0006G4-Vd
	for mharc-qemu-trivial@gnu.org; Tue, 27 Dec 2016 06:52:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58227)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1cLqJ6-0006Ff-QI
	for qemu-trivial@nongnu.org; Tue, 27 Dec 2016 06:52:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1cLqJ2-000292-Td
	for qemu-trivial@nongnu.org; Tue, 27 Dec 2016 06:52:40 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:49495)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1cLqJ2-00028Q-Jr; Tue, 27 Dec 2016 06:52:36 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue001 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0Lo5wv-1d22fm3aLB-00gDGn; Tue, 27 Dec 2016 12:52:32 +0100
To: Thomas Huth <huth@tuxfamily.org>, QEMU Developers <qemu-devel@nongnu.org>
References: <b0619e40-daca-9b28-2c78-1e2709d9f0ad@tuxfamily.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <80f9cbae-8548-4d5e-2543-1d95020eddb1@vivier.eu>
Date: Tue, 27 Dec 2016 12:52:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <b0619e40-daca-9b28-2c78-1e2709d9f0ad@tuxfamily.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:H2nF0EDszP+v7yc7bS1fhzarHucc2o3qO3OPB3TvL0kJSebIj7z
	TJaW4y5zSvBOmG16hD2gAl7smb6yrddO/ksXSt1o+hgXdMqW6hZ69LbGWKtCtGmqf6juDZv
	ATOikyZnOzQGWpzmAbj1jLGER7gtrOLlVwK2yRqdc+G9AfG0pKY86AoWQR/7Ldwof3porXg
	hI/z0w6iZhxg9JfzMvgZg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:ld5l3MIKvw8=:MVgb89Jc8xiGqMKb5p5DRe
	pMG+oO+4eoQs1SgGdWcf8i4mxZJ+Qq5RMOEaBaYkIgkx7ky8Qj6/oGq6uqxcYKFbzA/n4MFsw
	EWPyQTbvy3xkn57FSKcBnYaY/Ig8bvEwGLjGvkQw0ShWXEsfXHTb9va9YhYF9mMMj6qZnpE8U
	nIitPpj/6KmQVNPZ8lkw6S5I8vmhbtGAWLmlc76xi89tiNrywhPF3upmqFMTrGqbg1cG3Aj7o
	nQNdYz806/JuuhuOVMY12aV5TlZO+hvvXaJPZDwSsUSYU4DwmCdivmESgJRLMZENdvwHmqSTM
	gozZuX0sSEiyiFmjHcJhw3hPpF/WwXFeROl5qhrphT2kXzGnwmg06vRDqIG4f/yGFgOvSrf3p
	qv0reqnXAnEDKNyK7wT1fuXOTdOaa6l89ymkCLln5hfbi0PoI8I5HAd7gTRe/ToX4T+aZfb3B
	fY+z36267kApY/75vck89mh8WKMv6QyChQss6hce1Ms0aMBFs6nX1muaIA2+10zrzZ7s8KHir
	4m2efzAw7euGtWpBAjaDJdKjgN+LfqNYlgDV2HzQNpqJvTytE2QRv20AkidHcgXLwV4hvueiz
	xE9SaDRgHdKcdl3o5fM6qm3KW1OYxbJnvwpcDqfNO7RswDyn64QUGRppokBnRKTEFgfeujYmm
	IHoBs8Se/mo8bm+/6dVILsCJdz6wiiFiDW/Ky/Yc4omUjPy1qEeLUtjYLerAyETlM/KQpmOKX
	qeQ/WJm60u6qXjeL
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.187
Subject: Re: [Qemu-trivial] [Qemu-devel] m68k: Remove dummy machine
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
X-List-Received-Date: Tue, 27 Dec 2016 11:52:42 -0000

Le 20/12/2016 à 15:32, Thomas Huth a écrit :
> You can get an empty machine with "-M none" nowadays, so the
> m68k dummy board (introduced in 2007) seems to be pretty
> redundant since the "none" machine has been added in 2012.
> 
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>
> ---
>  MAINTAINERS           |  4 ---
>  hw/m68k/Makefile.objs |  2 --
>  hw/m68k/dummy_m68k.c  | 84 ---------------------------------------------------
>  3 files changed, 90 deletions(-)
>  delete mode 100644 hw/m68k/dummy_m68k.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4a60579..88ee8cd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -552,10 +552,6 @@ S: Orphan
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

I'm not sure the "none" machine can replace the "dummy" machine as the
"dummy" machine can load a kernel whereas it seems the "none" one can't.

Laurent

