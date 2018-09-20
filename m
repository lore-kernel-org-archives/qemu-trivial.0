Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g2ytF-0005uo-6K
	for mharc-qemu-trivial@gnu.org; Thu, 20 Sep 2018 09:21:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1g2wpo-0001Oq-CP
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2018 07:09:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1g2wpn-0004Vz-8v
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2018 07:09:24 -0400
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:15805)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>)
	id 1g2wpi-0004JN-6W; Thu, 20 Sep 2018 07:09:18 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.19]) by
	rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id
	2ee15ba37fd389b-54c50; Thu, 20 Sep 2018 19:09:07 +0800 (CST)
X-RM-TRANSID: 2ee15ba37fd389b-54c50
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from compute2.ovsnet.bclinux.org (unknown[223.105.0.243])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id
	2eea5ba37fcc538-5fe94; Thu, 20 Sep 2018 19:09:06 +0800 (CST)
X-RM-TRANSID: 2eea5ba37fcc538-5fe94
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org,
	qemu-ppc@nongnu.org
Cc: thuth@redhat.com, mst@redhat.com, marcel.apfelbaum@gmail.com,
	pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com, agraf@suse.de,
	david@gibson.dropbear.id.au, mjc@sifive.com, palmer@sifive.com,
	sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
	Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Date: Thu, 20 Sep 2018 07:08:32 -0400
Message-Id: <1537441712-17177-1-git-send-email-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.79
X-Mailman-Approved-At: Thu, 20 Sep 2018 09:21:04 -0400
Subject: [Qemu-trivial] [PATCH] Drop the "qemu:" prefix from error_report()
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
X-List-Received-Date: Thu, 20 Sep 2018 11:09:25 -0000

error_report and friends already add a "qemu-system-xxx" prefix
to the string, so a "qemu:" prefix is redundant in the string.
Just drop it.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
---
 hw/i386/multiboot.c | 8 ++++----
 hw/ppc/e500.c       | 4 ++--
 hw/ppc/sam460ex.c   | 8 ++++----
 hw/riscv/sifive_e.c | 2 +-
 hw/riscv/sifive_u.c | 2 +-
 hw/riscv/spike.c    | 2 +-
 hw/riscv/virt.c     | 4 ++--
 7 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/hw/i386/multiboot.c b/hw/i386/multiboot.c
index d519e20..91118de 100644
--- a/hw/i386/multiboot.c
+++ b/hw/i386/multiboot.c
@@ -181,12 +181,12 @@ int load_multiboot(FWCfgState *fw_cfg,
     if (!is_multiboot)
         return 0; /* no multiboot */
 
-    mb_debug("qemu: I believe we found a multiboot image!");
+    mb_debug("I believe we found a multiboot image!");
     memset(bootinfo, 0, sizeof(bootinfo));
     memset(&mbs, 0, sizeof(mbs));
 
     if (flags & 0x00000004) { /* MULTIBOOT_HEADER_HAS_VBE */
-        error_report("qemu: multiboot knows VBE. we don't.");
+        error_report("multiboot knows VBE. we don't.");
     }
     if (!(flags & 0x00010000)) { /* MULTIBOOT_HEADER_HAS_ADDR */
         uint64_t elf_entry;
@@ -216,7 +216,7 @@ int load_multiboot(FWCfgState *fw_cfg,
             exit(1);
         }
 
-        mb_debug("qemu: loading multiboot-elf kernel "
+        mb_debug("loading multiboot-elf kernel "
                  "(%#x bytes) with entry %#zx",
                  mb_kernel_size, (size_t)mh_entry_addr);
     } else {
@@ -270,7 +270,7 @@ int load_multiboot(FWCfgState *fw_cfg,
         mb_debug("multiboot: load_addr = %#x", mh_load_addr);
         mb_debug("multiboot: load_end_addr = %#x", mh_load_end_addr);
         mb_debug("multiboot: bss_end_addr = %#x", mh_bss_end_addr);
-        mb_debug("qemu: loading multiboot kernel (%#x bytes) at %#x",
+        mb_debug("loading multiboot kernel (%#x bytes) at %#x",
                  mb_load_size, mh_load_addr);
 
         mbs.mb_buf = g_malloc(mb_kernel_size);
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 7d19b14..e6747fc 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -1000,7 +1000,7 @@ void ppce500_init(MachineState *machine)
         payload_size = load_uimage(filename, &bios_entry, &loadaddr, NULL,
                                    NULL, NULL);
         if (payload_size < 0) {
-            error_report("qemu: could not load firmware '%s'", filename);
+            error_report("could not load firmware '%s'", filename);
             exit(1);
         }
     }
@@ -1056,7 +1056,7 @@ void ppce500_init(MachineState *machine)
      */
     dt_base = (loadaddr + payload_size + DTC_LOAD_PAD) & ~DTC_PAD_MASK;
     if (dt_base + DTB_MAX_SIZE > ram_size) {
-            error_report("qemu: not enough memory for device tree");
+            error_report("not enough memory for device tree");
             exit(1);
     }
 
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 9c77183..b2455ad 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -234,7 +234,7 @@ static int sam460ex_load_uboot(void)
     if (!pflash_cfi01_register(base, NULL, "sam460ex.flash", bios_size,
                                blk, 64 * KiB, fl_sectors,
                                1, 0x89, 0x18, 0x0000, 0x0, 1)) {
-        error_report("qemu: Error registering flash memory.");
+        error_report("Error registering flash memory.");
         /* XXX: return an error instead? */
         exit(1);
     }
@@ -552,7 +552,7 @@ static void sam460ex_init(MachineState *machine)
     if (!machine->kernel_filename) {
         success = sam460ex_load_uboot();
         if (success < 0) {
-            error_report("qemu: could not load firmware");
+            error_report("could not load firmware");
             exit(1);
         }
     }
@@ -571,7 +571,7 @@ static void sam460ex_init(MachineState *machine)
         }
         /* XXX try again as binary */
         if (success < 0) {
-            error_report("qemu: could not load kernel '%s'",
+            error_report("could not load kernel '%s'",
                     machine->kernel_filename);
             exit(1);
         }
@@ -583,7 +583,7 @@ static void sam460ex_init(MachineState *machine)
                                           RAMDISK_ADDR,
                                           machine->ram_size - RAMDISK_ADDR);
         if (initrd_size < 0) {
-            error_report("qemu: could not load ram disk '%s' at %x",
+            error_report("could not load ram disk '%s' at %x",
                     machine->initrd_filename, RAMDISK_ADDR);
             exit(1);
         }
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 4577d72..cb513cc 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -81,7 +81,7 @@ static uint64_t load_kernel(const char *kernel_filename)
     if (load_elf(kernel_filename, NULL, NULL,
                  &kernel_entry, NULL, &kernel_high,
                  0, EM_RISCV, 1, 0) < 0) {
-        error_report("qemu: could not load kernel '%s'", kernel_filename);
+        error_report("could not load kernel '%s'", kernel_filename);
         exit(1);
     }
     return kernel_entry;
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 59ae1ce..862f8ff 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -72,7 +72,7 @@ static uint64_t load_kernel(const char *kernel_filename)
     if (load_elf(kernel_filename, NULL, NULL,
                  &kernel_entry, NULL, &kernel_high,
                  0, EM_RISCV, 1, 0) < 0) {
-        error_report("qemu: could not load kernel '%s'", kernel_filename);
+        error_report("could not load kernel '%s'", kernel_filename);
         exit(1);
     }
     return kernel_entry;
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index c8c056c..f0bf0d5 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -60,7 +60,7 @@ static uint64_t load_kernel(const char *kernel_filename)
     if (load_elf_ram_sym(kernel_filename, NULL, NULL,
             &kernel_entry, NULL, &kernel_high, 0, EM_RISCV, 1, 0,
             NULL, true, htif_symbol_callback) < 0) {
-        error_report("qemu: could not load kernel '%s'", kernel_filename);
+        error_report("could not load kernel '%s'", kernel_filename);
         exit(1);
     }
     return kernel_entry;
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 248bbdf..818a537 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -64,7 +64,7 @@ static uint64_t load_kernel(const char *kernel_filename)
     if (load_elf(kernel_filename, NULL, NULL,
                  &kernel_entry, NULL, &kernel_high,
                  0, EM_RISCV, 1, 0) < 0) {
-        error_report("qemu: could not load kernel '%s'", kernel_filename);
+        error_report("could not load kernel '%s'", kernel_filename);
         exit(1);
     }
     return kernel_entry;
@@ -91,7 +91,7 @@ static hwaddr load_initrd(const char *filename, uint64_t mem_size,
     if (size == -1) {
         size = load_image_targphys(filename, *start, mem_size - *start);
         if (size == -1) {
-            error_report("qemu: could not load ramdisk '%s'", filename);
+            error_report("could not load ramdisk '%s'", filename);
             exit(1);
         }
     }
-- 
1.8.3.1




