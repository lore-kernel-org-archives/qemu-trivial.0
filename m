Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoHi-0003VQ-Re
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:28:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHd-0003Pl-RM
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHc-0006wE-7a
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:27:57 -0500
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:40970)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHb-0006vK-UE; Mon, 05 Mar 2018 06:27:56 -0500
Received: by mail-wr0-x242.google.com with SMTP id f14so16846059wre.8;
	Mon, 05 Mar 2018 03:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Tfcoex0AWXhgJ9BEaTvZ0NXlVXb13wb0DRGmXYglgxg=;
	b=bd5FMa1DgljxGkidZZ8TyajMV6bT8PGojBGUqyr5DWhzoDdhgPAj5C7BVuIlalq86S
	yD2SimZDFI41sjQYEQMbxMSm8l+YTEcTHhcBKzSYV1s8ge92qPxUEWjlUwneFHilanhd
	WvK1hzfRjLI/32eEG2hjgQs/zbE6gKfArf9ggumAVxE9s8DN8V+maD2Ftylwbg9wUe/O
	QDkV3Z/DjBypCxWm9dfkVzsoaKNm1d6EJnpkdYzCUshDhbqVVMXHjy94MSULu6G//67C
	R9MI3hX+2ffmzjc1YWuNvauFPGOcK30axZnh3lbLL4ICeJma8HZ22MfBUqNvgAa084rj
	gGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Tfcoex0AWXhgJ9BEaTvZ0NXlVXb13wb0DRGmXYglgxg=;
	b=EyAK3vKKvCOEkyXOPvH43pnl4PYqyP5qBpfmNvPMvVx4JQgBBEFD/IfbcKSKkVH3EL
	X/otAFjDxYKiejFlkfrsoYUHjXCENwDI+w07NE9ovgPiD+vuUtoiBYkVhqlMa/q/+zxS
	/RQOiwDKX21q+PDSqefjHsV+36JJIU9AHRqm/YPME14nbjQCNMG87IxVvRSy8cjDDT63
	rTjOa2fFTuYnU/0PL/QTJJD6IT1eJVpTg684MLhaLVzuFxFXKFc2/y8o20VfLG97/AlT
	GFDX/lZPsKx085WRem5JNGaJUPWaeQP8THBwajP4945Yg0Hi2nWtg1wC7huydQiObPns
	kFOg==
X-Gm-Message-State: APf1xPDdwOqx5ymhXWigC8vWBeWve3/8TT9gCKfs7oTuvhhdAiaxkLY8
	9cuYV5cLe6FnMm9K+zw+We8Fk5RP
X-Google-Smtp-Source: AG47ELuhUg9tTcrdDBSTy0tV9QS9WiWzKpdUqx0Ve2iUbZ2aw1yUFMuSTUZyayd8F97JX5lJpY4qyA==
X-Received: by 10.223.189.1 with SMTP id j1mr13150857wrh.174.1520249274412;
	Mon, 05 Mar 2018 03:27:54 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.27.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:27:53 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Alexander Graf <agraf@suse.de>, David Gibson <david@gibson.dropbear.id.au>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-ppc@nongnu.org (open list:PReP)
Date: Mon,  5 Mar 2018 08:27:12 -0300
Message-Id: <20180305112732.26471-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: [Qemu-trivial] [PATCH v2 10/30] hw/ppc: use the BYTE-based
 definitions
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
X-List-Received-Date: Mon, 05 Mar 2018 11:28:01 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
---
 include/hw/ppc/spapr.h |  2 +-
 hw/pci-host/prep.c     |  2 +-
 hw/ppc/e500.c          |  8 ++++----
 hw/ppc/mac_oldworld.c  |  7 +++----
 hw/ppc/ppc405_boards.c |  8 ++++----
 hw/ppc/ppc405_uc.c     |  6 +++---
 hw/ppc/ppc4xx_devs.c   | 21 +++++++++++----------
 hw/ppc/ppce500_spin.c  |  2 +-
 hw/ppc/prep.c          |  2 +-
 hw/ppc/rs6000_mc.c     | 12 ++++++------
 hw/ppc/virtex_ml507.c  |  4 ++--
 11 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 36942b378d..896eb1b0b0 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -746,7 +746,7 @@ int spapr_rng_populate_dt(void *fdt);
 #define SPAPR_MAX_RAM_SLOTS     32
 
 /* 1GB alignment for hotplug memory region */
-#define SPAPR_HOTPLUG_MEM_ALIGN (1ULL << 30)
+#define SPAPR_HOTPLUG_MEM_ALIGN (1 * G_BYTE)
 
 /*
  * Number of 32 bit words in each LMB list entry in ibm,dynamic-memory
diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
index 01f67f9db1..d06498e131 100644
--- a/hw/pci-host/prep.c
+++ b/hw/pci-host/prep.c
@@ -70,7 +70,7 @@ typedef struct PRePPCIState {
     int contiguous_map;
 } PREPPCIState;
 
-#define BIOS_SIZE (1024 * 1024)
+#define BIOS_SIZE (1 * M_BYTE)
 
 static inline uint32_t raven_pci_io_config(hwaddr addr)
 {
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index a40d3ec3e3..02675c7be4 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -45,7 +45,7 @@
 #define BINARY_DEVICE_TREE_FILE    "mpc8544ds.dtb"
 #define DTC_LOAD_PAD               0x1800000
 #define DTC_PAD_MASK               0xFFFFF
-#define DTB_MAX_SIZE               (8 * 1024 * 1024)
+#define DTB_MAX_SIZE               (8 * M_BYTE)
 #define INITRD_LOAD_PAD            0x2000000
 #define INITRD_PAD_MASK            0xFFFFFF
 
@@ -597,7 +597,7 @@ static int ppce500_prep_device_tree(MachineState *machine,
 /* Create -kernel TLB entries for BookE.  */
 hwaddr booke206_page_size_to_tlb(uint64_t size)
 {
-    return 63 - clz64(size >> 10);
+    return 63 - clz64(size / K_BYTE);
 }
 
 static int booke206_initial_map_tsize(CPUPPCState *env)
@@ -913,9 +913,9 @@ void ppce500_init(MachineState *machine, PPCE500Params *params)
     /* Register spinning region */
     sysbus_create_simple("e500-spin", params->spin_base, NULL);
 
-    if (cur_base < (32 * 1024 * 1024)) {
+    if (cur_base < 32 * M_BYTE) {
         /* u-boot occupies memory up to 32MB, so load blobs above */
-        cur_base = (32 * 1024 * 1024);
+        cur_base = 32 * M_BYTE;
     }
 
     if (params->has_mpc8xxx_gpio) {
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index c245251c5c..76bdc2c11d 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -118,10 +118,9 @@ static void ppc_heathrow_init(MachineState *machine)
     }
 
     /* allocate RAM */
-    if (ram_size > (2047 << 20)) {
-        fprintf(stderr,
-                "qemu: Too much memory for this machine: %d MB, maximum 2047 MB\n",
-                ((unsigned int)ram_size / (1 << 20)));
+    if (ram_size > 2047 * M_BYTE) {
+        error_report("Too much memory for this machine: %llu MB, "
+                     "maximum 2047 MB", ram_size / M_BYTE);
         exit(1);
     }
 
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 0b658931ee..8c742449b8 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -41,7 +41,7 @@
 #include "exec/address-spaces.h"
 
 #define BIOS_FILENAME "ppc405_rom.bin"
-#define BIOS_SIZE (2048 * 1024)
+#define BIOS_SIZE (2 * M_BYTE)
 
 #define KERNEL_LOAD_ADDR 0x00000000
 #define INITRD_LOAD_ADDR 0x01800000
@@ -217,14 +217,14 @@ static void ref405ep_init(MachineState *machine)
     memory_region_init(&ram_memories[1], NULL, "ef405ep.ram1", 0);
     ram_bases[1] = 0x00000000;
     ram_sizes[1] = 0x00000000;
-    ram_size = 128 * 1024 * 1024;
+    ram_size = 128 * M_BYTE;
 #ifdef DEBUG_BOARD_INIT
     printf("%s: register cpu\n", __func__);
 #endif
     env = ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
                         33333333, &pic, kernel_filename == NULL ? 0 : 1);
     /* allocate SRAM */
-    sram_size = 512 * 1024;
+    sram_size = 512 * K_BYTE;
     memory_region_init_ram(sram, NULL, "ef405ep.sram", sram_size,
                            &error_fatal);
     memory_region_add_subregion(sysmem, 0xFFF00000, sram);
@@ -590,7 +590,7 @@ static void taihu_405ep_init(MachineState *machine)
 
         bios_size = blk_getlength(blk);
         /* XXX: should check that size is 32MB */
-        bios_size = 32 * 1024 * 1024;
+        bios_size = 32 * M_BYTE;
         fl_sectors = (bios_size + 65535) >> 16;
 #ifdef DEBUG_BOARD_INIT
         printf("Register parallel flash %d size %lx"
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 205ebcea93..0e9d5b0ff9 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -983,10 +983,10 @@ static void ppc405_ocm_init(CPUPPCState *env)
 
     ocm = g_malloc0(sizeof(ppc405_ocm_t));
     /* XXX: Size is 4096 or 0x04000000 */
-    memory_region_init_ram(&ocm->isarc_ram, NULL, "ppc405.ocm", 4096,
+    memory_region_init_ram(&ocm->isarc_ram, NULL, "ppc405.ocm", 4 * K_BYTE,
                            &error_fatal);
-    memory_region_init_alias(&ocm->dsarc_ram, NULL, "ppc405.dsarc", &ocm->isarc_ram,
-                             0, 4096);
+    memory_region_init_alias(&ocm->dsarc_ram, NULL, "ppc405.dsarc",
+                             &ocm->isarc_ram, 0, 4 * K_BYTE);
     qemu_register_reset(&ocm_reset, ocm);
     ppc_dcr_register(env, OCM0_ISARC,
                      ocm, &dcr_read_ocm, &dcr_write_ocm);
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 2e963894fe..52de988b13 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -29,6 +29,7 @@
 #include "hw/boards.h"
 #include "qemu/log.h"
 #include "exec/address-spaces.h"
+#include "qemu/error-report.h"
 
 #define DEBUG_UIC
 
@@ -353,25 +354,25 @@ static uint32_t sdram_bcr (hwaddr ram_base,
     uint32_t bcr;
 
     switch (ram_size) {
-    case (4 * 1024 * 1024):
+    case 4 * M_BYTE:
         bcr = 0x00000000;
         break;
-    case (8 * 1024 * 1024):
+    case 8 * M_BYTE:
         bcr = 0x00020000;
         break;
-    case (16 * 1024 * 1024):
+    case 16 * M_BYTE:
         bcr = 0x00040000;
         break;
-    case (32 * 1024 * 1024):
+    case 32 * M_BYTE:
         bcr = 0x00060000;
         break;
-    case (64 * 1024 * 1024):
+    case 64 * M_BYTE:
         bcr = 0x00080000;
         break;
-    case (128 * 1024 * 1024):
+    case 128 * M_BYTE:
         bcr = 0x000A0000;
         break;
-    case (256 * 1024 * 1024):
+    case 256 * M_BYTE:
         bcr = 0x000C0000;
         break;
     default:
@@ -399,7 +400,7 @@ static target_ulong sdram_size (uint32_t bcr)
     if (sh == 7)
         size = -1;
     else
-        size = (4 * 1024 * 1024) << sh;
+        size = (4 * M_BYTE) << sh;
 
     return size;
 }
@@ -702,8 +703,8 @@ ram_addr_t ppc4xx_sdram_adjust(ram_addr_t ram_size, int nr_banks,
 
     ram_size -= size_left;
     if (size_left) {
-        printf("Truncating memory to %d MiB to fit SDRAM controller limits.\n",
-               (int)(ram_size >> 20));
+        error_report("Truncating memory to %llu MiB to fit SDRAM "
+                     "controller limits", ram_size / M_BYTE);
     }
 
     memory_region_allocate_system_memory(ram, NULL, "ppc4xx.sdram", ram_size);
diff --git a/hw/ppc/ppce500_spin.c b/hw/ppc/ppce500_spin.c
index 69ca2d0e42..b6d224c45b 100644
--- a/hw/ppc/ppce500_spin.c
+++ b/hw/ppc/ppce500_spin.c
@@ -89,7 +89,7 @@ static void spin_kick(CPUState *cs, run_on_cpu_data data)
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
     SpinInfo *curspin = data.host_ptr;
-    hwaddr map_size = 64 * 1024 * 1024;
+    hwaddr map_size = 64 * M_BYTE;
     hwaddr map_start;
 
     cpu_synchronize_state(cs);
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index f7c0a48558..eae475a34d 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -59,7 +59,7 @@
 
 #define CFG_ADDR 0xf0000510
 
-#define BIOS_SIZE (1024 * 1024)
+#define BIOS_SIZE (1 * M_BYTE)
 #define BIOS_FILENAME "ppc_rom.bin"
 #define KERNEL_LOAD_ADDR 0x01000000
 #define INITRD_LOAD_ADDR 0x01800000
diff --git a/hw/ppc/rs6000_mc.c b/hw/ppc/rs6000_mc.c
index b6135650bd..6999994fe4 100644
--- a/hw/ppc/rs6000_mc.c
+++ b/hw/ppc/rs6000_mc.c
@@ -109,7 +109,7 @@ static void rs6000mc_port0820_write(void *opaque, uint32_t addr, uint32_t val)
             size = end_address - start_address;
             memory_region_set_enabled(&s->simm[socket - 1], size != 0);
             memory_region_set_address(&s->simm[socket - 1],
-                                      start_address * 8 * 1024 * 1024);
+                                      start_address * 8 * M_BYTE);
         }
     }
 }
@@ -140,7 +140,7 @@ static void rs6000mc_realize(DeviceState *dev, Error **errp)
 {
     RS6000MCState *s = RS6000MC_DEVICE(dev);
     int socket = 0;
-    unsigned int ram_size = s->ram_size / (1024 * 1024);
+    unsigned int ram_size = s->ram_size / M_BYTE;
 
     while (socket < 6) {
         if (ram_size >= 64) {
@@ -163,8 +163,8 @@ static void rs6000mc_realize(DeviceState *dev, Error **errp)
             char name[] = "simm.?";
             name[5] = socket + '0';
             memory_region_allocate_system_memory(&s->simm[socket], OBJECT(dev),
-                                                 name, s->simm_size[socket]
-                                                 * 1024 * 1024);
+                                                 name,
+                                                 s->simm_size[socket] * M_BYTE);
             memory_region_add_subregion_overlap(get_system_memory(), 0,
                                                 &s->simm[socket], socket);
         }
@@ -172,8 +172,8 @@ static void rs6000mc_realize(DeviceState *dev, Error **errp)
     if (ram_size) {
         /* unable to push all requested RAM in SIMMs */
         error_setg(errp, "RAM size incompatible with this board. "
-                   "Try again with something else, like %d MB",
-                   s->ram_size / 1024 / 1024 - ram_size);
+                   "Try again with something else, like %lld MB",
+                   s->ram_size / M_BYTE - ram_size);
         return;
     }
 
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 77a1778e07..dcfb6c2670 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -47,7 +47,7 @@
 #include "sysemu/block-backend.h"
 
 #define EPAPR_MAGIC    (0x45504150)
-#define FLASH_SIZE     (16 * 1024 * 1024)
+#define FLASH_SIZE     (16 * M_BYTE)
 
 #define INTC_BASEADDR       0x81800000
 #define UART16550_BASEADDR  0x83e01003
@@ -237,7 +237,7 @@ static void virtex_init(MachineState *machine)
     dinfo = drive_get(IF_PFLASH, 0, 0);
     pflash_cfi01_register(PFLASH_BASEADDR, NULL, "virtex.flash", FLASH_SIZE,
                           dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          (64 * 1024), FLASH_SIZE >> 16,
+                          64 * K_BYTE, FLASH_SIZE >> 16,
                           1, 0x89, 0x18, 0x0000, 0x0, 1);
 
     cpu_irq = (qemu_irq *) &env->irq_inputs[PPC40x_INPUT_INT];
-- 
2.16.2


