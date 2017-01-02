Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cO0GE-00050X-6u
	for mharc-qemu-trivial@gnu.org; Mon, 02 Jan 2017 05:54:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1cO0GB-0004yl-Ie
	for qemu-trivial@nongnu.org; Mon, 02 Jan 2017 05:54:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1cO0GA-0006aK-9b
	for qemu-trivial@nongnu.org; Mon, 02 Jan 2017 05:54:35 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:60514)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1cO0G4-0006Yc-9z; Mon, 02 Jan 2017 05:54:28 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue102 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0Lgpny-1ctRag0weU-00oDZq; Mon, 02 Jan 2017 11:54:24 +0100
To: Thomas Huth <huth@tuxfamily.org>
References: <b0619e40-daca-9b28-2c78-1e2709d9f0ad@tuxfamily.org>
	<80f9cbae-8548-4d5e-2543-1d95020eddb1@vivier.eu>
	<20161227145805.5a19af6b@thl530>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <2a409041-eac6-07bd-00ed-0d3e74733045@vivier.eu>
Date: Mon, 2 Jan 2017 11:54:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20161227145805.5a19af6b@thl530>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:ojGktx6hxvgbQ+yGETY3vVEChFAkT7ELXJGpkqX3n+SztVMq3Fi
	tvF+zxNlwKgxh0+HpgN4DoqDb2w/D54ENlxw5cQGBQUPlEhu5/vNyFP2s9RpggxRvn/QRSg
	lOwf4v+Nft8vHDBz0JX/UFko8186edoswXq7uc/CMFxiezruDZ4cjL8irKxrHTn4p6Ln5Yg
	KUxrciag2UPShDKBWtfxg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:tMvJGmWNQog=:rFO9/IOM79wsqk8HktV50M
	idxiFi6v28M3kh8w5MHMLgw0bY82gYTplITgGtBDQXN4rTJhlXYnHusAlUECx0LlNW8+ADjTd
	AUntpnlstKAtF/2vKSJ4NZwkc5rDZa74rpQMMgbBC+h7RcIU6V4AzZ5M7/wpicG2Gz8O4N+Hx
	eA4Xt+qULZZDoWavJg7Vxlw8SkGlnrALZvRr5JZmJuOPkgfYvXHd5cPbQg7t78HfvZfdK5Jic
	LPmIxBHiSFZZtoboY4EFCRk96jxKJiRFliJKEzo6FkzZwKob/X9Nm5tLpiCzI2PQ2TkZuOejm
	jIFcZhZhz3uYKmmXCcinkQqqcjKu488zVWOuWRuazE2+XlIX1CETUXRn6/HRFcFIpX3QmIX9+
	c6KzRqVTKwpaRVpFexDgZQPeprbhhBLQ3k5FThQKDdNbsFaLZEJTrkzi3Oz9SQkVBei1U8ig2
	59B02jmqFJb4gWtrwM8hhPNNCo8dYFQWl1oJcNj4eIqPwTGydgyZCG761yYyx6tLeFYpWtoeQ
	LMMbZ+L/Tp9d1fmBf3sA/fYUUrPkRwCpofBRdtJKnBrPOekY6+HlroGVwfA2PmNK6acFVVmqS
	4NWSaVIkYw2xyDzOwkuIHVowSFsCimW+nHw9AcodscO4gW5KSf9ZYWNtlsCK/eQCqLn/6Z/Xa
	Cdj4ned0sbyqXdQnHn2aSdgHjZj53RU3afbqW2fdJIVyFTCUyHu+RgB+ufBSpiUQB/dXm0L7P
	vpNoDa9QXL8/Y6aK
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.17.13
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
X-List-Received-Date: Mon, 02 Jan 2017 10:54:37 -0000

Le 27/12/2016 à 14:58, Thomas Huth a écrit :
> Am Tue, 27 Dec 2016 12:52:30 +0100
> schrieb Laurent Vivier <laurent@vivier.eu>:
> 
>> Le 20/12/2016 à 15:32, Thomas Huth a écrit :
>>> You can get an empty machine with "-M none" nowadays, so the
>>> m68k dummy board (introduced in 2007) seems to be pretty
>>> redundant since the "none" machine has been added in 2012.
>>>
>>> Signed-off-by: Thomas Huth <huth@tuxfamily.org>
>>> ---
>>>  MAINTAINERS           |  4 ---
>>>  hw/m68k/Makefile.objs |  2 --
>>>  hw/m68k/dummy_m68k.c  | 84
>>> --------------------------------------------------- 3 files
>>> changed, 90 deletions(-) delete mode 100644 hw/m68k/dummy_m68k.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 4a60579..88ee8cd 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -552,10 +552,6 @@ S: Orphan
>>>  F: hw/m68k/an5206.c
>>>  F: hw/m68k/mcf5206.c
>>>  
>>> -dummy_m68k
>>> -S: Orphan
>>> -F: hw/m68k/dummy_m68k.c
>>> -
>>>  mcf5208
>>>  S: Orphan
>>>  F: hw/m68k/mcf5208.c
>>> diff --git a/hw/m68k/Makefile.objs b/hw/m68k/Makefile.objs
>>> index c4352e7..d1f089c 100644
>>> --- a/hw/m68k/Makefile.objs
>>> +++ b/hw/m68k/Makefile.objs
>>> @@ -1,4 +1,2 @@
>>>  obj-y += an5206.o mcf5208.o
>>> -obj-y += dummy_m68k.o
>>> -
>>>  obj-y += mcf5206.o mcf_intc.o
>>> diff --git a/hw/m68k/dummy_m68k.c b/hw/m68k/dummy_m68k.c
>>> deleted file mode 100644
>>> index 0b11d20..0000000
>>> --- a/hw/m68k/dummy_m68k.c
>>> +++ /dev/null
>>> @@ -1,84 +0,0 @@
>>> -/*
>>> - * Dummy board with just RAM and CPU for use as an ISS.
>>> - *
>>> - * Copyright (c) 2007 CodeSourcery.
>>> - *
>>> - * This code is licensed under the GPL
>>> - */
>>> -
>>> -#include "qemu/osdep.h"
>>> -#include "qemu-common.h"
>>> -#include "cpu.h"
>>> -#include "hw/hw.h"
>>> -#include "hw/boards.h"
>>> -#include "hw/loader.h"
>>> -#include "elf.h"
>>> -#include "exec/address-spaces.h"
>>> -
>>> -#define KERNEL_LOAD_ADDR 0x10000
>>> -
>>> -/* Board init.  */
>>> -
>>> -static void dummy_m68k_init(MachineState *machine)
>>> -{
>>> -    ram_addr_t ram_size = machine->ram_size;
>>> -    const char *cpu_model = machine->cpu_model;
>>> -    const char *kernel_filename = machine->kernel_filename;
>>> -    M68kCPU *cpu;
>>> -    CPUM68KState *env;
>>> -    MemoryRegion *address_space_mem =  get_system_memory();
>>> -    MemoryRegion *ram = g_new(MemoryRegion, 1);
>>> -    int kernel_size;
>>> -    uint64_t elf_entry;
>>> -    hwaddr entry;
>>> -
>>> -    if (!cpu_model)
>>> -        cpu_model = "cfv4e";
>>> -    cpu = cpu_m68k_init(cpu_model);
>>> -    if (!cpu) {
>>> -        fprintf(stderr, "Unable to find m68k CPU definition\n");
>>> -        exit(1);
>>> -    }
>>> -    env = &cpu->env;
>>> -
>>> -    /* Initialize CPU registers.  */
>>> -    env->vbr = 0;
>>> -
>>> -    /* RAM at address zero */
>>> -    memory_region_allocate_system_memory(ram, NULL,
>>> "dummy_m68k.ram",
>>> -                                         ram_size);
>>> -    memory_region_add_subregion(address_space_mem, 0, ram);
>>> -
>>> -    /* Load kernel.  */
>>> -    if (kernel_filename) {
>>> -        kernel_size = load_elf(kernel_filename, NULL, NULL,
>>> &elf_entry,
>>> -                               NULL, NULL, 1, EM_68K, 0, 0);
>>> -        entry = elf_entry;
>>> -        if (kernel_size < 0) {
>>> -            kernel_size = load_uimage(kernel_filename, &entry,
>>> NULL, NULL,
>>> -                                      NULL, NULL);
>>> -        }
>>> -        if (kernel_size < 0) {
>>> -            kernel_size = load_image_targphys(kernel_filename,
>>> -                                              KERNEL_LOAD_ADDR,
>>> -                                              ram_size -
>>> KERNEL_LOAD_ADDR);
>>> -            entry = KERNEL_LOAD_ADDR;
>>> -        }
>>> -        if (kernel_size < 0) {
>>> -            fprintf(stderr, "qemu: could not load kernel '%s'\n",
>>> -                    kernel_filename);
>>> -            exit(1);
>>> -        }
>>> -    } else {
>>> -        entry = 0;
>>> -    }
>>> -    env->pc = entry;
>>> -}
>>> -
>>> -static void dummy_m68k_machine_init(MachineClass *mc)
>>> -{
>>> -    mc->desc = "Dummy board";
>>> -    mc->init = dummy_m68k_init;
>>> -}
>>> -
>>> -DEFINE_MACHINE("dummy", dummy_m68k_machine_init)
>>>
>>
>> I'm not sure the "none" machine can replace the "dummy" machine as the
>> "dummy" machine can load a kernel whereas it seems the "none" one
>> can't.
> 
> Oh, that's true ... I did not notice it 'cause there was no error
> message when I tried to start the "none" machine with "-kernel". But
> looking at the code in hw/core/null-machine.c, it really seems that
> there is nothing in here :-( So never mind, please forget about this
> patch. (but now I wonder whether the "none" machine could be improved to
> provide the features of the "dummy" machine, too?)

The "none" machine is defined to be be filled with QMP commands, perhaps
the generic-loader object can replace the "-kernel" parameters?

Laurent


