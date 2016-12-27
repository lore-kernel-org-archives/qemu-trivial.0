Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cLsGx-0005Lq-2M
	for mharc-qemu-trivial@gnu.org; Tue, 27 Dec 2016 08:58:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49368)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1cLsGt-0005Js-WC
	for qemu-trivial@nongnu.org; Tue, 27 Dec 2016 08:58:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1cLsGs-0002S0-Pr
	for qemu-trivial@nongnu.org; Tue, 27 Dec 2016 08:58:32 -0500
Received: from mail-wj0-f195.google.com ([209.85.210.195]:34462)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <th.huth@gmail.com>)
	id 1cLsGm-0002Q4-WF; Tue, 27 Dec 2016 08:58:25 -0500
Received: by mail-wj0-f195.google.com with SMTP id qs7so13899032wjc.1;
	Tue, 27 Dec 2016 05:58:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZLKIvjfdgKv63BC6oVsKviwSoLf0P1WKPk+oVIOKftU=;
	b=VeNXIYn7jHDvrN2V4TTnc3aLFLAfflJIDrAh0pBcSfd2udeuJOPMoiyT9t8W8irpZn
	Ps8/hysKorIBU+wvgT/NdtN2NP8vhQkxMsqyrBxZAMKkztvuh/r9wMxNjbhrA1sso5UF
	0mHg3brxlEbl4QXKKQ7Tl5fLMRooTjvOkH2OST3XzDm8Ae23hTr+VZp15MHh2+jfwVX2
	zFPAVqNu+FNCwNZ6+iGS0XgidJngP4ljU1DJ1x/owwF6r+VKaZSWWcCaRW6zJ0NzHKR6
	seZGKRJcGDflts0v75e6qymIx1sP2WeljAKb1QCck4QthfXBS65SXgbZmnyVHnVMye7W
	1VcA==
X-Gm-Message-State: AIkVDXKGbcDkdog3RUtOv8zb1zZLwdlXvnYTpE0zXU6mVH0DJf7PHE0htMDmNL4CR/RRjQ==
X-Received: by 10.194.141.98 with SMTP id rn2mr28767568wjb.1.1482847102122;
	Tue, 27 Dec 2016 05:58:22 -0800 (PST)
Received: from thl530 (p54829F33.dip0.t-ipconnect.de. [84.130.159.51])
	by smtp.gmail.com with ESMTPSA id
	jd9sm43792796wjb.9.2016.12.27.05.58.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Dec 2016 05:58:21 -0800 (PST)
Date: Tue, 27 Dec 2016 14:58:05 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>, QEMU Trivial
	<qemu-trivial@nongnu.org>
Message-ID: <20161227145805.5a19af6b@thl530>
In-Reply-To: <80f9cbae-8548-4d5e-2543-1d95020eddb1@vivier.eu>
References: <b0619e40-daca-9b28-2c78-1e2709d9f0ad@tuxfamily.org>
	<80f9cbae-8548-4d5e-2543-1d95020eddb1@vivier.eu>
X-Mailer: Claws Mail 3.14.0 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.210.195
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
X-List-Received-Date: Tue, 27 Dec 2016 13:58:33 -0000

Am Tue, 27 Dec 2016 12:52:30 +0100
schrieb Laurent Vivier <laurent@vivier.eu>:

> Le 20/12/2016 =C3=A0 15:32, Thomas Huth a =C3=A9crit :
> > You can get an empty machine with "-M none" nowadays, so the
> > m68k dummy board (introduced in 2007) seems to be pretty
> > redundant since the "none" machine has been added in 2012.
> >=20
> > Signed-off-by: Thomas Huth <huth@tuxfamily.org>
> > ---
> >  MAINTAINERS           |  4 ---
> >  hw/m68k/Makefile.objs |  2 --
> >  hw/m68k/dummy_m68k.c  | 84
> > --------------------------------------------------- 3 files
> > changed, 90 deletions(-) delete mode 100644 hw/m68k/dummy_m68k.c
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 4a60579..88ee8cd 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -552,10 +552,6 @@ S: Orphan
> >  F: hw/m68k/an5206.c
> >  F: hw/m68k/mcf5206.c
> > =20
> > -dummy_m68k
> > -S: Orphan
> > -F: hw/m68k/dummy_m68k.c
> > -
> >  mcf5208
> >  S: Orphan
> >  F: hw/m68k/mcf5208.c
> > diff --git a/hw/m68k/Makefile.objs b/hw/m68k/Makefile.objs
> > index c4352e7..d1f089c 100644
> > --- a/hw/m68k/Makefile.objs
> > +++ b/hw/m68k/Makefile.objs
> > @@ -1,4 +1,2 @@
> >  obj-y +=3D an5206.o mcf5208.o
> > -obj-y +=3D dummy_m68k.o
> > -
> >  obj-y +=3D mcf5206.o mcf_intc.o
> > diff --git a/hw/m68k/dummy_m68k.c b/hw/m68k/dummy_m68k.c
> > deleted file mode 100644
> > index 0b11d20..0000000
> > --- a/hw/m68k/dummy_m68k.c
> > +++ /dev/null
> > @@ -1,84 +0,0 @@
> > -/*
> > - * Dummy board with just RAM and CPU for use as an ISS.
> > - *
> > - * Copyright (c) 2007 CodeSourcery.
> > - *
> > - * This code is licensed under the GPL
> > - */
> > -
> > -#include "qemu/osdep.h"
> > -#include "qemu-common.h"
> > -#include "cpu.h"
> > -#include "hw/hw.h"
> > -#include "hw/boards.h"
> > -#include "hw/loader.h"
> > -#include "elf.h"
> > -#include "exec/address-spaces.h"
> > -
> > -#define KERNEL_LOAD_ADDR 0x10000
> > -
> > -/* Board init.  */
> > -
> > -static void dummy_m68k_init(MachineState *machine)
> > -{
> > -    ram_addr_t ram_size =3D machine->ram_size;
> > -    const char *cpu_model =3D machine->cpu_model;
> > -    const char *kernel_filename =3D machine->kernel_filename;
> > -    M68kCPU *cpu;
> > -    CPUM68KState *env;
> > -    MemoryRegion *address_space_mem =3D  get_system_memory();
> > -    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
> > -    int kernel_size;
> > -    uint64_t elf_entry;
> > -    hwaddr entry;
> > -
> > -    if (!cpu_model)
> > -        cpu_model =3D "cfv4e";
> > -    cpu =3D cpu_m68k_init(cpu_model);
> > -    if (!cpu) {
> > -        fprintf(stderr, "Unable to find m68k CPU definition\n");
> > -        exit(1);
> > -    }
> > -    env =3D &cpu->env;
> > -
> > -    /* Initialize CPU registers.  */
> > -    env->vbr =3D 0;
> > -
> > -    /* RAM at address zero */
> > -    memory_region_allocate_system_memory(ram, NULL,
> > "dummy_m68k.ram",
> > -                                         ram_size);
> > -    memory_region_add_subregion(address_space_mem, 0, ram);
> > -
> > -    /* Load kernel.  */
> > -    if (kernel_filename) {
> > -        kernel_size =3D load_elf(kernel_filename, NULL, NULL,
> > &elf_entry,
> > -                               NULL, NULL, 1, EM_68K, 0, 0);
> > -        entry =3D elf_entry;
> > -        if (kernel_size < 0) {
> > -            kernel_size =3D load_uimage(kernel_filename, &entry,
> > NULL, NULL,
> > -                                      NULL, NULL);
> > -        }
> > -        if (kernel_size < 0) {
> > -            kernel_size =3D load_image_targphys(kernel_filename,
> > -                                              KERNEL_LOAD_ADDR,
> > -                                              ram_size -
> > KERNEL_LOAD_ADDR);
> > -            entry =3D KERNEL_LOAD_ADDR;
> > -        }
> > -        if (kernel_size < 0) {
> > -            fprintf(stderr, "qemu: could not load kernel '%s'\n",
> > -                    kernel_filename);
> > -            exit(1);
> > -        }
> > -    } else {
> > -        entry =3D 0;
> > -    }
> > -    env->pc =3D entry;
> > -}
> > -
> > -static void dummy_m68k_machine_init(MachineClass *mc)
> > -{
> > -    mc->desc =3D "Dummy board";
> > -    mc->init =3D dummy_m68k_init;
> > -}
> > -
> > -DEFINE_MACHINE("dummy", dummy_m68k_machine_init)
> >=20
>=20
> I'm not sure the "none" machine can replace the "dummy" machine as the
> "dummy" machine can load a kernel whereas it seems the "none" one
> can't.

Oh, that's true ... I did not notice it 'cause there was no error
message when I tried to start the "none" machine with "-kernel". But
looking at the code in hw/core/null-machine.c, it really seems that
there is nothing in here :-( So never mind, please forget about this
patch. (but now I wonder whether the "none" machine could be improved to
provide the features of the "dummy" machine, too?)

 Thomas

