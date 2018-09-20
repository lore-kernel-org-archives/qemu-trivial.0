Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g32rN-0004OS-0N
	for mharc-qemu-trivial@gnu.org; Thu, 20 Sep 2018 13:35:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41011)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1g32rI-0004Iy-Ud
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2018 13:35:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1g32rD-0004hS-7w
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2018 13:35:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38044)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1g32qy-0004aL-ET; Thu, 20 Sep 2018 13:35:00 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1CD2B4724;
	Thu, 20 Sep 2018 17:34:59 +0000 (UTC)
Received: from localhost (ovpn-116-89.gru2.redhat.com [10.97.116.89])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D5CD580A20;
	Thu, 20 Sep 2018 17:34:54 +0000 (UTC)
Date: Thu, 20 Sep 2018 14:34:53 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
	thuth@redhat.com, mst@redhat.com, marcel.apfelbaum@gmail.com,
	pbonzini@redhat.com, rth@twiddle.net, agraf@suse.de,
	david@gibson.dropbear.id.au, mjc@sifive.com, palmer@sifive.com,
	sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
	Markus Armbruster <armbru@redhat.com>
Message-ID: <20180920173453.GP30558@habkost.net>
References: <1537441712-17177-1-git-send-email-maozhongyi@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1537441712-17177-1-git-send-email-maozhongyi@cmss.chinamobile.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 20 Sep 2018 17:34:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] Drop the "qemu:" prefix from
 error_report()
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
X-List-Received-Date: Thu, 20 Sep 2018 17:35:22 -0000

On Thu, Sep 20, 2018 at 07:08:32AM -0400, Mao Zhongyi wrote:
> error_report and friends already add a "qemu-system-xxx" prefix
> to the string, so a "qemu:" prefix is redundant in the string.
> Just drop it.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

Markus, do you want to merge it through your tree?

If we are already touching those messages, it would be nice if we
removed punctuation too on some cases below[1].


> ---
>  hw/i386/multiboot.c | 8 ++++----
>  hw/ppc/e500.c       | 4 ++--
>  hw/ppc/sam460ex.c   | 8 ++++----
>  hw/riscv/sifive_e.c | 2 +-
>  hw/riscv/sifive_u.c | 2 +-
>  hw/riscv/spike.c    | 2 +-
>  hw/riscv/virt.c     | 4 ++--
>  7 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/i386/multiboot.c b/hw/i386/multiboot.c
> index d519e20..91118de 100644
> --- a/hw/i386/multiboot.c
> +++ b/hw/i386/multiboot.c
> @@ -181,12 +181,12 @@ int load_multiboot(FWCfgState *fw_cfg,
>      if (!is_multiboot)
>          return 0; /* no multiboot */
>  
> -    mb_debug("qemu: I believe we found a multiboot image!");
> +    mb_debug("I believe we found a multiboot image!");
>      memset(bootinfo, 0, sizeof(bootinfo));
>      memset(&mbs, 0, sizeof(mbs));
>  
>      if (flags & 0x00000004) { /* MULTIBOOT_HEADER_HAS_VBE */
> -        error_report("qemu: multiboot knows VBE. we don't.");
> +        error_report("multiboot knows VBE. we don't.");

[1]

>      }
>      if (!(flags & 0x00010000)) { /* MULTIBOOT_HEADER_HAS_ADDR */
>          uint64_t elf_entry;
> @@ -216,7 +216,7 @@ int load_multiboot(FWCfgState *fw_cfg,
>              exit(1);
>          }
>  
> -        mb_debug("qemu: loading multiboot-elf kernel "
> +        mb_debug("loading multiboot-elf kernel "
>                   "(%#x bytes) with entry %#zx",
>                   mb_kernel_size, (size_t)mh_entry_addr);
>      } else {
> @@ -270,7 +270,7 @@ int load_multiboot(FWCfgState *fw_cfg,
>          mb_debug("multiboot: load_addr = %#x", mh_load_addr);
>          mb_debug("multiboot: load_end_addr = %#x", mh_load_end_addr);
>          mb_debug("multiboot: bss_end_addr = %#x", mh_bss_end_addr);
> -        mb_debug("qemu: loading multiboot kernel (%#x bytes) at %#x",
> +        mb_debug("loading multiboot kernel (%#x bytes) at %#x",
>                   mb_load_size, mh_load_addr);
>  
>          mbs.mb_buf = g_malloc(mb_kernel_size);
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 7d19b14..e6747fc 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -1000,7 +1000,7 @@ void ppce500_init(MachineState *machine)
>          payload_size = load_uimage(filename, &bios_entry, &loadaddr, NULL,
>                                     NULL, NULL);
>          if (payload_size < 0) {
> -            error_report("qemu: could not load firmware '%s'", filename);
> +            error_report("could not load firmware '%s'", filename);
>              exit(1);
>          }
>      }
> @@ -1056,7 +1056,7 @@ void ppce500_init(MachineState *machine)
>       */
>      dt_base = (loadaddr + payload_size + DTC_LOAD_PAD) & ~DTC_PAD_MASK;
>      if (dt_base + DTB_MAX_SIZE > ram_size) {
> -            error_report("qemu: not enough memory for device tree");
> +            error_report("not enough memory for device tree");
>              exit(1);
>      }
>  
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 9c77183..b2455ad 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -234,7 +234,7 @@ static int sam460ex_load_uboot(void)
>      if (!pflash_cfi01_register(base, NULL, "sam460ex.flash", bios_size,
>                                 blk, 64 * KiB, fl_sectors,
>                                 1, 0x89, 0x18, 0x0000, 0x0, 1)) {
> -        error_report("qemu: Error registering flash memory.");
> +        error_report("Error registering flash memory.");

[1]


>          /* XXX: return an error instead? */
>          exit(1);
>      }
> @@ -552,7 +552,7 @@ static void sam460ex_init(MachineState *machine)
>      if (!machine->kernel_filename) {
>          success = sam460ex_load_uboot();
>          if (success < 0) {
> -            error_report("qemu: could not load firmware");
> +            error_report("could not load firmware");
>              exit(1);
>          }
>      }
> @@ -571,7 +571,7 @@ static void sam460ex_init(MachineState *machine)
>          }
>          /* XXX try again as binary */
>          if (success < 0) {
> -            error_report("qemu: could not load kernel '%s'",
> +            error_report("could not load kernel '%s'",
>                      machine->kernel_filename);
>              exit(1);
>          }
> @@ -583,7 +583,7 @@ static void sam460ex_init(MachineState *machine)
>                                            RAMDISK_ADDR,
>                                            machine->ram_size - RAMDISK_ADDR);
>          if (initrd_size < 0) {
> -            error_report("qemu: could not load ram disk '%s' at %x",
> +            error_report("could not load ram disk '%s' at %x",
>                      machine->initrd_filename, RAMDISK_ADDR);
>              exit(1);
>          }
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 4577d72..cb513cc 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -81,7 +81,7 @@ static uint64_t load_kernel(const char *kernel_filename)
>      if (load_elf(kernel_filename, NULL, NULL,
>                   &kernel_entry, NULL, &kernel_high,
>                   0, EM_RISCV, 1, 0) < 0) {
> -        error_report("qemu: could not load kernel '%s'", kernel_filename);
> +        error_report("could not load kernel '%s'", kernel_filename);
>          exit(1);
>      }
>      return kernel_entry;
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 59ae1ce..862f8ff 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -72,7 +72,7 @@ static uint64_t load_kernel(const char *kernel_filename)
>      if (load_elf(kernel_filename, NULL, NULL,
>                   &kernel_entry, NULL, &kernel_high,
>                   0, EM_RISCV, 1, 0) < 0) {
> -        error_report("qemu: could not load kernel '%s'", kernel_filename);
> +        error_report("could not load kernel '%s'", kernel_filename);
>          exit(1);
>      }
>      return kernel_entry;
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index c8c056c..f0bf0d5 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -60,7 +60,7 @@ static uint64_t load_kernel(const char *kernel_filename)
>      if (load_elf_ram_sym(kernel_filename, NULL, NULL,
>              &kernel_entry, NULL, &kernel_high, 0, EM_RISCV, 1, 0,
>              NULL, true, htif_symbol_callback) < 0) {
> -        error_report("qemu: could not load kernel '%s'", kernel_filename);
> +        error_report("could not load kernel '%s'", kernel_filename);
>          exit(1);
>      }
>      return kernel_entry;
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 248bbdf..818a537 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -64,7 +64,7 @@ static uint64_t load_kernel(const char *kernel_filename)
>      if (load_elf(kernel_filename, NULL, NULL,
>                   &kernel_entry, NULL, &kernel_high,
>                   0, EM_RISCV, 1, 0) < 0) {
> -        error_report("qemu: could not load kernel '%s'", kernel_filename);
> +        error_report("could not load kernel '%s'", kernel_filename);
>          exit(1);
>      }
>      return kernel_entry;
> @@ -91,7 +91,7 @@ static hwaddr load_initrd(const char *filename, uint64_t mem_size,
>      if (size == -1) {
>          size = load_image_targphys(filename, *start, mem_size - *start);
>          if (size == -1) {
> -            error_report("qemu: could not load ramdisk '%s'", filename);
> +            error_report("could not load ramdisk '%s'", filename);
>              exit(1);
>          }
>      }
> -- 
> 1.8.3.1
> 
> 
> 

-- 
Eduardo

