Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bktex-0004cV-S2
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 09:58:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59339)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktep-0004Tw-Nn
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:58:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktei-00083S-Cf
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:58:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48203)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bkteR-0007lR-VR; Fri, 16 Sep 2016 09:58:00 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C6487288D;
	Fri, 16 Sep 2016 13:56:24 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GDuHk4024127; Fri, 16 Sep 2016 09:56:22 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Sep 2016 15:55:53 +0200
Message-Id: <1474034177-17663-3-git-send-email-lvivier@redhat.com>
In-Reply-To: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 16 Sep 2016 13:56:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 02/26] arm: use exit(EXIT_SUCCESS) and
 exit(EXIT_FAILURE)
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
X-List-Received-Date: Fri, 16 Sep 2016 13:58:31 -0000

This patch is the result of coccinelle script
scripts/coccinelle/exit.cocci

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
CC: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armv7m.c           |  6 +++---
 hw/arm/boot.c             | 16 ++++++++--------
 hw/arm/cubieboard.c       |  8 ++++----
 hw/arm/digic_boards.c     |  6 +++---
 hw/arm/fsl-imx6.c         |  2 +-
 hw/arm/gumstix.c          |  8 ++++----
 hw/arm/highbank.c         |  4 ++--
 hw/arm/integratorcp.c     |  2 +-
 hw/arm/mainstone.c        |  4 ++--
 hw/arm/musicpal.c         |  4 ++--
 hw/arm/omap1.c            |  4 ++--
 hw/arm/omap2.c            |  4 ++--
 hw/arm/omap_sx1.c         |  2 +-
 hw/arm/palm.c             |  2 +-
 hw/arm/pxa2xx.c           | 10 +++++-----
 hw/arm/raspi.c            |  4 ++--
 hw/arm/realview.c         |  2 +-
 hw/arm/sabrelite.c        |  4 ++--
 hw/arm/strongarm.c        |  4 ++--
 hw/arm/sysbus-fdt.c       |  2 +-
 hw/arm/versatilepb.c      |  2 +-
 hw/arm/vexpress.c         | 16 ++++++++--------
 hw/arm/virt.c             | 24 ++++++++++++------------
 hw/arm/xlnx-ep108.c       |  4 ++--
 hw/arm/z2.c               |  4 ++--
 hw/char/exynos4210_uart.c |  4 ++--
 hw/display/pl110.c        |  2 +-
 hw/display/pxa2xx_lcd.c   |  2 +-
 hw/gpio/pl061.c           |  3 ++-
 hw/net/stellaris_enet.c   |  3 ++-
 hw/sd/omap_mmc.c          |  4 ++--
 hw/ssi/pl022.c            |  3 ++-
 target-arm/kvm.c          |  2 +-
 target-arm/machine.c      |  2 +-
 34 files changed, 88 insertions(+), 85 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 49d3078..a86a1f0 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -188,7 +188,7 @@ DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
     cpu = cpu_arm_init(cpu_model);
     if (cpu == NULL) {
         fprintf(stderr, "Unable to find CPU definition\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     env = &cpu->env;
 
@@ -209,7 +209,7 @@ DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
 
     if (!kernel_filename && !qtest_enabled()) {
         fprintf(stderr, "Guest image must be specified (using -kernel)\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (kernel_filename) {
@@ -221,7 +221,7 @@ DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
         }
         if (image_size < 0) {
             error_report("Could not load kernel '%s'", kernel_filename);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 1b913a4..3c9aaac 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -671,7 +671,7 @@ static void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
 
         if (!g_file_get_contents(image_name, &contents, &length, NULL)) {
             fprintf(stderr, "failed to load \"%s\"\n", image_name);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         size = length;
         data = (uint8_t *)contents;
@@ -745,7 +745,7 @@ static uint64_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
                    1, data_swab);
     if (ret <= 0) {
         /* The header loaded but the image didn't */
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     return ret;
@@ -782,7 +782,7 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
              * DTB to the base of RAM for the bootloader to pick up.
              */
             if (load_dtb(info->loader_start, info, 0) < 0) {
-                exit(1);
+                exit(EXIT_FAILURE);
             }
         }
 
@@ -874,7 +874,7 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
                 elf_low_addr = 0;
             }
             if (load_dtb(info->loader_start, info, elf_low_addr) < 0) {
-                exit(1);
+                exit(EXIT_FAILURE);
             }
         }
     }
@@ -899,7 +899,7 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
     if (kernel_size < 0) {
         fprintf(stderr, "qemu: could not load kernel '%s'\n",
                 info->kernel_filename);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     info->entry = entry;
     if (is_linux) {
@@ -919,7 +919,7 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
             if (initrd_size < 0) {
                 fprintf(stderr, "qemu: could not load initrd '%s'\n",
                         info->initrd_filename);
-                exit(1);
+                exit(EXIT_FAILURE);
             }
         } else {
             initrd_size = 0;
@@ -956,7 +956,7 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
             /* Place the DTB after the initrd in memory with alignment. */
             dtb_start = QEMU_ALIGN_UP(info->initrd_start + initrd_size, align);
             if (load_dtb(dtb_start, info, 0) < 0) {
-                exit(1);
+                exit(EXIT_FAILURE);
             }
             fixupcontext[FIXUP_ARGPTR] = dtb_start;
         } else {
@@ -965,7 +965,7 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
                 fprintf(stderr, "qemu: RAM size must be less than 4GB to boot"
                         " Linux kernel using ATAGS (try passing a device tree"
                         " using -dtb)\n");
-                exit(1);
+                exit(EXIT_FAILURE);
             }
         }
         fixupcontext[FIXUP_ENTRYPOINT] = entry;
diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index fbd78ed..e193baf 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -44,26 +44,26 @@ static void cubieboard_init(MachineState *machine)
     object_property_set_int(OBJECT(&s->a10->emac), 1, "phy-addr", &err);
     if (err != NULL) {
         error_reportf_err(err, "Couldn't set phy address: ");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     object_property_set_int(OBJECT(&s->a10->timer), 32768, "clk0-freq", &err);
     if (err != NULL) {
         error_reportf_err(err, "Couldn't set clk0 frequency: ");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     object_property_set_int(OBJECT(&s->a10->timer), 24000000, "clk1-freq",
                             &err);
     if (err != NULL) {
         error_reportf_err(err, "Couldn't set clk1 frequency: ");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     object_property_set_bool(OBJECT(s->a10), true, "realized", &err);
     if (err != NULL) {
         error_reportf_err(err, "Couldn't realize Allwinner A10: ");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     memory_region_allocate_system_memory(&s->sdram, NULL, "cubieboard.ram",
diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index 520c8e9..20f3cd6 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -69,7 +69,7 @@ static void digic4_board_init(DigicBoard *board)
     object_property_set_bool(OBJECT(s->digic), true, "realized", &err);
     if (err != NULL) {
         error_reportf_err(err, "Couldn't realize DIGIC SoC: ");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     digic4_board_setup_ram(s, board->ram_size);
@@ -107,13 +107,13 @@ static void digic_load_rom(DigicBoardState *s, hwaddr addr,
 
         if (!fn) {
             error_report("Couldn't find rom image '%s'.", filename);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         rom_size = load_image_targphys(fn, addr, max_size);
         if (rom_size < 0 || rom_size > max_size) {
             error_report("Couldn't load rom image '%s'.", filename);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         g_free(fn);
     }
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 6a1bf26..b2cdbc1 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -38,7 +38,7 @@ static void fsl_imx6_init(Object *obj)
     if (smp_cpus > FSL_IMX6_NUM_CPUS) {
         error_report("%s: Only %d CPUs are supported (%d requested)",
                      TYPE_FSL_IMX6, FSL_IMX6_NUM_CPUS, smp_cpus);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     for (i = 0; i < smp_cpus; i++) {
diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index d59d9ba..95e2219 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -63,7 +63,7 @@ static void connex_init(MachineState *machine)
     if (!dinfo && !qtest_enabled()) {
         fprintf(stderr, "A flash image must be given with the "
                 "'pflash' parameter\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
 #ifdef TARGET_WORDS_BIGENDIAN
@@ -76,7 +76,7 @@ static void connex_init(MachineState *machine)
                                sector_len, connex_rom / sector_len,
                                2, 0, 0, 0, 0, be)) {
         fprintf(stderr, "qemu: Error registering flash memory.\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /* Interrupt line of NIC is connected to GPIO line 36 */
@@ -101,7 +101,7 @@ static void verdex_init(MachineState *machine)
     if (!dinfo && !qtest_enabled()) {
         fprintf(stderr, "A flash image must be given with the "
                 "'pflash' parameter\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
 #ifdef TARGET_WORDS_BIGENDIAN
@@ -114,7 +114,7 @@ static void verdex_init(MachineState *machine)
                                sector_len, verdex_rom / sector_len,
                                2, 0, 0, 0, 0, be)) {
         fprintf(stderr, "qemu: Error registering flash memory.\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /* Interrupt line of NIC is connected to GPIO line 99 */
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 80e5fd4..a7ca470 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -284,12 +284,12 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
         if (sysboot_filename != NULL) {
             if (load_image_targphys(sysboot_filename, 0xfff88000, 0x8000) < 0) {
                 error_report("Unable to load %s", bios_name);
-                exit(1);
+                exit(EXIT_FAILURE);
             }
             g_free(sysboot_filename);
         } else {
             error_report("Unable to find %s", bios_name);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 
diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index 96dc150..7c21beb 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -546,7 +546,7 @@ static void integratorcp_init(MachineState *machine)
     cpu_oc = cpu_class_by_name(TYPE_ARM_CPU, cpu_model);
     if (!cpu_oc) {
         fprintf(stderr, "Unable to find CPU definition\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     cpuobj = object_new(object_class_get_name(cpu_oc));
diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index 454acc5..12f5a1b 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -145,7 +145,7 @@ static void mainstone_common_init(MemoryRegion *address_space_mem,
             }
             fprintf(stderr, "Two flash images must be given with the "
                     "'pflash' parameter\n");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         if (!pflash_cfi01_register(mainstone_flash_base[i], NULL,
@@ -155,7 +155,7 @@ static void mainstone_common_init(MemoryRegion *address_space_mem,
                                    sector_len, MAINSTONE_FLASH / sector_len,
                                    4, 0, 0, 0, 0, be)) {
             fprintf(stderr, "qemu: Error registering flash memory.\n");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index cc50ace..0b7b1b2 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1594,7 +1594,7 @@ static void musicpal_init(MachineState *machine)
     cpu = cpu_arm_init(cpu_model);
     if (!cpu) {
         fprintf(stderr, "Unable to find CPU definition\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /* For now we use a fixed - the original - RAM size */
@@ -1634,7 +1634,7 @@ static void musicpal_init(MachineState *machine)
         if (flash_size != 8*1024*1024 && flash_size != 16*1024*1024 &&
             flash_size != 32*1024*1024) {
             fprintf(stderr, "Invalid flash image size\n");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         /*
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index b3cf0ec..3c5382a 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -3864,7 +3864,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryRegion *system_memory,
     s->cpu = cpu_arm_init(core);
     if (s->cpu == NULL) {
         fprintf(stderr, "Unable to find CPU definition\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     s->sdram_size = sdram_size;
     s->sram_size = OMAP15XX_SRAM_SIZE;
@@ -3996,7 +3996,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryRegion *system_memory,
     dinfo = drive_get(IF_SD, 0, 0);
     if (!dinfo) {
         fprintf(stderr, "qemu: missing SecureDigital device\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     s->mmc = omap_mmc_init(0xfffb7800, system_memory,
                            blk_by_legacy_dinfo(dinfo),
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index 7e11c65..4e9207f 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -2262,7 +2262,7 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRegion *sysmem,
     s->cpu = cpu_arm_init(core ?: "arm1136-r2");
     if (s->cpu == NULL) {
         fprintf(stderr, "Unable to find CPU definition\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     s->sdram_size = sdram_size;
     s->sram_size = OMAP242X_SRAM_SIZE;
@@ -2465,7 +2465,7 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRegion *sysmem,
     dinfo = drive_get(IF_SD, 0, 0);
     if (!dinfo) {
         fprintf(stderr, "qemu: missing SecureDigital device\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     s->mmc = omap2_mmc_init(omap_l4tao(s->l4, 9),
                     blk_by_legacy_dinfo(dinfo),
diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index 5d74026..a66fb65 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -196,7 +196,7 @@ static void sx1_init(MachineState *machine, const int version)
 
     if (!machine->kernel_filename && !fl_idx && !qtest_enabled()) {
         fprintf(stderr, "Kernel or Flash image must be specified\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /* Load the kernel.  */
diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index 7f46073..9e27aa8 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -261,7 +261,7 @@ static void palmte_init(MachineState *machine)
 
     if (!rom_loaded && !kernel_filename && !qtest_enabled()) {
         fprintf(stderr, "Kernel or ROM image must be specified\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /* Load the kernel.  */
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 0241e07..5b20358 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -2067,7 +2067,7 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,
 
     if (revision && strncmp(revision, "pxa27", 5)) {
         fprintf(stderr, "Machine requires a PXA27x processor.\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     if (!revision)
         revision = "pxa270";
@@ -2075,7 +2075,7 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,
     s->cpu = cpu_arm_init(revision);
     if (s->cpu == NULL) {
         fprintf(stderr, "Unable to find CPU definition\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     s->reset = qemu_allocate_irq(pxa2xx_reset, s, 0);
 
@@ -2108,7 +2108,7 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,
     dinfo = drive_get(IF_SD, 0, 0);
     if (!dinfo) {
         fprintf(stderr, "qemu: missing SecureDigital device\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     s->mmc = pxa2xx_mmci_init(address_space, 0x41100000,
                     blk_by_legacy_dinfo(dinfo),
@@ -2207,7 +2207,7 @@ PXA2xxState *pxa255_init(MemoryRegion *address_space, unsigned int sdram_size)
     s->cpu = cpu_arm_init("pxa255");
     if (s->cpu == NULL) {
         fprintf(stderr, "Unable to find CPU definition\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     s->reset = qemu_allocate_irq(pxa2xx_reset, s, 0);
 
@@ -2239,7 +2239,7 @@ PXA2xxState *pxa255_init(MemoryRegion *address_space, unsigned int sdram_size)
     dinfo = drive_get(IF_SD, 0, 0);
     if (!dinfo) {
         fprintf(stderr, "qemu: missing SecureDigital device\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     s->mmc = pxa2xx_mmci_init(address_space, 0x41100000,
                     blk_by_legacy_dinfo(dinfo),
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 2b295f1..dc60b0a 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -99,7 +99,7 @@ static void setup_boot(MachineState *machine, int version, size_t ram_size)
                                 ram_size - FIRMWARE_ADDR);
         if (r < 0) {
             error_report("Failed to load firmware from %s", machine->firmware);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         binfo.entry = FIRMWARE_ADDR;
@@ -147,7 +147,7 @@ static void raspi2_init(MachineState *machine)
     bus = qdev_get_child_bus(DEVICE(&s->soc), "sd-bus");
     if (bus == NULL) {
         error_report("No SD bus found in SOC object");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     carddev = qdev_create(bus, TYPE_SD_CARD);
     qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 8eafcca..a25dea5 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -99,7 +99,7 @@ static void realview_init(MachineState *machine,
     cpu_oc = cpu_class_by_name(TYPE_ARM_CPU, machine->cpu_model);
     if (!cpu_oc) {
         fprintf(stderr, "Unable to find CPU definition\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     for (n = 0; n < smp_cpus; n++) {
diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index 4e7ac8c..a6ba376 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -52,7 +52,7 @@ static void sabrelite_init(MachineState *machine)
     if (machine->ram_size > FSL_IMX6_MMDC_SIZE) {
         error_report("RAM size " RAM_ADDR_FMT " above max supported (%08x)",
                      machine->ram_size, FSL_IMX6_MMDC_SIZE);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     object_initialize(&s->soc, sizeof(s->soc), TYPE_FSL_IMX6);
@@ -62,7 +62,7 @@ static void sabrelite_init(MachineState *machine)
     object_property_set_bool(OBJECT(&s->soc), true, "realized", &err);
     if (err != NULL) {
         error_report("%s", error_get_pretty(err));
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     memory_region_allocate_system_memory(&s->ram, NULL, "sabrelite.ram",
diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index 021cbf9..40912f8 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -1592,14 +1592,14 @@ StrongARMState *sa1110_init(MemoryRegion *sysmem,
 
     if (strncmp(rev, "sa1110", 6)) {
         error_report("Machine requires a SA1110 processor.");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     s->cpu = cpu_arm_init(rev);
 
     if (!s->cpu) {
         error_report("Unable to find CPU definition");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     memory_region_allocate_system_memory(&s->sdram, NULL, "strongarm.sdram",
diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 5debb33..72935d2 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -450,7 +450,7 @@ static int add_fdt_node(SysBusDevice *sbdev, void *opaque)
     }
     error_report("Device %s can not be dynamically instantiated",
                      qdev_fw_name(DEVICE(sbdev)));
-    exit(1);
+    exit(EXIT_FAILURE);
 }
 
 /**
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index 8ae5392..bc7c7fb 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -205,7 +205,7 @@ static void versatile_init(MachineState *machine, int board_id)
     cpu_oc = cpu_class_by_name(TYPE_ARM_CPU, machine->cpu_model);
     if (!cpu_oc) {
         fprintf(stderr, "Unable to find CPU definition\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     cpuobj = object_new(object_class_get_name(cpu_oc));
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 58760f4..b087e14 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -210,7 +210,7 @@ static void init_cpus(const char *cpu_model, const char *privdev,
 
     if (!cpu_oc) {
         fprintf(stderr, "Unable to find CPU definition\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /* Create the actual CPUs */
@@ -275,7 +275,7 @@ static void a9_daughterboard_init(const VexpressMachineState *vms,
     if (ram_size > 0x40000000) {
         /* 1GB is the maximum the address space permits */
         fprintf(stderr, "vexpress-a9: cannot model more than 1GB RAM\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     memory_region_allocate_system_memory(ram, NULL, "vexpress.highmem",
@@ -368,7 +368,7 @@ static void a15_daughterboard_init(const VexpressMachineState *vms,
         uint64_t rsz = ram_size;
         if (rsz > (30ULL * 1024 * 1024 * 1024)) {
             fprintf(stderr, "vexpress-a15: cannot model more than 30GB RAM\n");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 
@@ -571,19 +571,19 @@ static void vexpress_common_init(MachineState *machine)
             error_report("The contents of the first flash device may be "
                          "specified with -bios or with -drive if=pflash... "
                          "but you cannot use both options at once");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         fn = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
         if (!fn) {
             error_report("Could not find ROM image '%s'", bios_name);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         image_size = load_image_targphys(fn, map[VE_NORFLASH0],
                                          VEXPRESS_FLASH_SIZE);
         g_free(fn);
         if (image_size < 0) {
             error_report("Could not load ROM image '%s'", bios_name);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 
@@ -653,7 +653,7 @@ static void vexpress_common_init(MachineState *machine)
                                        dinfo);
     if (!pflash0) {
         fprintf(stderr, "vexpress: error registering flash 0.\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (map[VE_NORFLASHALIAS] != -1) {
@@ -668,7 +668,7 @@ static void vexpress_common_init(MachineState *machine)
     if (!ve_pflash_cfi01_register(map[VE_NORFLASH1], "vexpress.flash1",
                                   dinfo)) {
         fprintf(stderr, "vexpress: error registering flash 1.\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     sram_size = 0x2000000;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a193b5a..ffca55c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -241,7 +241,7 @@ static void create_fdt(VirtBoardInfo *vbi)
 
     if (!fdt) {
         error_report("create_device_tree() failed");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     vbi->fdt = fdt;
@@ -817,18 +817,18 @@ static void create_one_flash(const char *name, hwaddr flashbase,
             error_report("The contents of the first flash device may be "
                          "specified with -bios or with -drive if=pflash... "
                          "but you cannot use both options at once");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         fn = qemu_find_file(QEMU_FILE_TYPE_BIOS, file);
         if (!fn) {
             error_report("Could not find ROM image '%s'", file);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         image_size = load_image_mr(fn, sysbus_mmio_get_region(sbd, 0));
         g_free(fn);
         if (image_size < 0) {
             error_report("Could not load ROM image '%s'", file);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 }
@@ -1196,13 +1196,13 @@ static void machvirt_init(MachineState *machine)
     if (!gic_version) {
         if (!kvm_enabled()) {
             error_report("gic-version=host requires KVM");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         gic_version = kvm_arm_vgic_probe();
         if (!gic_version) {
             error_report("Unable to determine GIC version supported by host");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 
@@ -1213,7 +1213,7 @@ static void machvirt_init(MachineState *machine)
 
     if (!vbi) {
         error_report("mach-virt: CPU %s not supported", cpustr[0]);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /* If we have an EL3 boot ROM then the assumption is that it will
@@ -1240,20 +1240,20 @@ static void machvirt_init(MachineState *machine)
         error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
                      "supported by machine 'mach-virt' (%d)",
                      max_cpus, virt_max_cpus);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     vbi->smp_cpus = smp_cpus;
 
     if (machine->ram_size > vbi->memmap[VIRT_MEM].size) {
         error_report("mach-virt: cannot model more than %dGB RAM", RAMLIMIT_GB);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (vms->secure) {
         if (kvm_enabled()) {
             error_report("mach-virt: KVM does not support Security extensions");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         /* The Secure view of the world is the same as the NonSecure,
@@ -1272,7 +1272,7 @@ static void machvirt_init(MachineState *machine)
     oc = cpu_class_by_name(TYPE_ARM_CPU, cpustr[0]);
     if (!oc) {
         error_report("Unable to find CPU definition");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     typename = object_class_get_name(oc);
 
@@ -1282,7 +1282,7 @@ static void machvirt_init(MachineState *machine)
     g_strfreev(cpustr);
     if (err) {
         error_report_err(err);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     for (n = 0; n < smp_cpus; n++) {
diff --git a/hw/arm/xlnx-ep108.c b/hw/arm/xlnx-ep108.c
index 4ec590a..091d7a5 100644
--- a/hw/arm/xlnx-ep108.c
+++ b/hw/arm/xlnx-ep108.c
@@ -43,7 +43,7 @@ static void xlnx_ep108_init(MachineState *machine)
         error_report("ERROR: RAM size 0x%" PRIx64 " above max supported of "
                      "0x%llx", ram_size,
                      XLNX_ZYNQMP_MAX_RAM_SIZE);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (ram_size < 0x08000000) {
@@ -76,7 +76,7 @@ static void xlnx_ep108_init(MachineState *machine)
         g_free(bus_name);
         if (!bus) {
             error_report("No SD bus found for SD card %d", i);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         carddev = qdev_create(bus, TYPE_SD_CARD);
         qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 68a92f3..1f135af 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -330,7 +330,7 @@ static void z2_init(MachineState *machine)
     if (!dinfo && !qtest_enabled()) {
         fprintf(stderr, "Flash image must be given with the "
                 "'pflash' parameter\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (!pflash_cfi01_register(Z2_FLASH_BASE,
@@ -339,7 +339,7 @@ static void z2_init(MachineState *machine)
                                sector_len, Z2_FLASH_SIZE / sector_len,
                                4, 0, 0, 0, 0, be)) {
         fprintf(stderr, "qemu: Error registering flash memory.\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /* setup keypad */
diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index 1107578..861fbde 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -601,7 +601,7 @@ DeviceState *exynos4210_uart_create(hwaddr addr,
         if (channel >= MAX_SERIAL_PORTS) {
             error_report("Only %d serial ports are supported by QEMU",
                          MAX_SERIAL_PORTS);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         chr = serial_hds[channel];
         if (!chr) {
@@ -609,7 +609,7 @@ DeviceState *exynos4210_uart_create(hwaddr addr,
             chr = qemu_chr_new(label, "null", NULL);
             if (!(chr)) {
                 error_report("Can't assign serial port to UART%d", channel);
-                exit(1);
+                exit(EXIT_FAILURE);
             }
         }
     }
diff --git a/hw/display/pl110.c b/hw/display/pl110.c
index c069c0b..1d624cb 100644
--- a/hw/display/pl110.c
+++ b/hw/display/pl110.c
@@ -175,7 +175,7 @@ static void pl110_update_display(void *opaque)
         break;
     default:
         fprintf(stderr, "pl110: Bad color depth\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     if (s->cr & PL110_CR_BGR)
         bpp_offset = 0;
diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
index 845521c..022d6fd 100644
--- a/hw/display/pxa2xx_lcd.c
+++ b/hw/display/pxa2xx_lcd.c
@@ -1051,7 +1051,7 @@ PXA2xxLCDState *pxa2xx_lcdc_init(MemoryRegion *sysmem,
         break;
     default:
         fprintf(stderr, "%s: Bad color depth\n", __FUNCTION__);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     vmstate_register(NULL, 0, &vmstate_pxa2xx_lcdc, s);
diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 4ae2aa1..2dff326 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -18,7 +18,8 @@
 #define DPRINTF(fmt, ...) \
 do { printf("pl061: " fmt , ## __VA_ARGS__); } while (0)
 #define BADF(fmt, ...) \
-do { fprintf(stderr, "pl061: error: " fmt , ## __VA_ARGS__); exit(1);} while (0)
+do { fprintf(stderr, "pl061: error: " fmt , ## __VA_ARGS__); \
+     exit(EXIT_FAILURE); } while (0)
 #else
 #define DPRINTF(fmt, ...) do {} while(0)
 #define BADF(fmt, ...) \
diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
index 957730e..7c8b879 100644
--- a/hw/net/stellaris_enet.c
+++ b/hw/net/stellaris_enet.c
@@ -17,7 +17,8 @@
 #define DPRINTF(fmt, ...) \
 do { printf("stellaris_enet: " fmt , ## __VA_ARGS__); } while (0)
 #define BADF(fmt, ...) \
-do { fprintf(stderr, "stellaris_enet: error: " fmt , ## __VA_ARGS__); exit(1);} while (0)
+do { fprintf(stderr, "stellaris_enet: error: " fmt , ## __VA_ARGS__); \
+     exit(EXIT_FAILURE); } while (0)
 #else
 #define DPRINTF(fmt, ...) do {} while(0)
 #define BADF(fmt, ...) \
diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index e934cd3..a7c7da0 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -595,7 +595,7 @@ struct omap_mmc_s *omap_mmc_init(hwaddr base,
     /* Instantiate the storage */
     s->card = sd_init(blk, false);
     if (s->card == NULL) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     return s;
@@ -622,7 +622,7 @@ struct omap_mmc_s *omap2_mmc_init(struct omap_target_agent_s *ta,
     /* Instantiate the storage */
     s->card = sd_init(blk, false);
     if (s->card == NULL) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     s->cdet = qemu_allocate_irq(omap_mmc_cover_cb, s, 0);
diff --git a/hw/ssi/pl022.c b/hw/ssi/pl022.c
index c136801..f262610 100644
--- a/hw/ssi/pl022.c
+++ b/hw/ssi/pl022.c
@@ -18,7 +18,8 @@
 #define DPRINTF(fmt, ...) \
 do { printf("pl022: " fmt , ## __VA_ARGS__); } while (0)
 #define BADF(fmt, ...) \
-do { fprintf(stderr, "pl022: error: " fmt , ## __VA_ARGS__); exit(1);} while (0)
+do { fprintf(stderr, "pl022: error: " fmt , ## __VA_ARGS__); \
+     exit(EXIT_FAILURE); } while (0)
 #else
 #define DPRINTF(fmt, ...) do {} while(0)
 #define BADF(fmt, ...) \
diff --git a/target-arm/kvm.c b/target-arm/kvm.c
index dbe393c..c37c457 100644
--- a/target-arm/kvm.c
+++ b/target-arm/kvm.c
@@ -594,7 +594,7 @@ int kvm_arch_irqchip_create(MachineState *ms, KVMState *s)
 {
      if (machine_kernel_irqchip_split(ms)) {
          perror("-machine kernel_irqchip=split is not supported on ARM.");
-         exit(1);
+         exit(EXIT_FAILURE);
     }
 
     /* If we can create the VGIC using the newer device control API, we
diff --git a/target-arm/machine.c b/target-arm/machine.c
index 7a6ca31..4e85a9a 100644
--- a/target-arm/machine.c
+++ b/target-arm/machine.c
@@ -340,7 +340,7 @@ const char *gicv3_class_name(void)
 #else
         error_report("KVM GICv3 acceleration is not supported on this "
                      "platform");
-        exit(1);
+        exit(EXIT_FAILURE);
 #endif
     } else {
         return "arm-gicv3";
-- 
2.5.5


