Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZAb8O-0000Sq-0b
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jul 2015 05:50:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ZAb8J-0000Lk-4g
	for qemu-trivial@nongnu.org; Thu, 02 Jul 2015 05:50:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ZAb8E-0008OR-82
	for qemu-trivial@nongnu.org; Thu, 02 Jul 2015 05:50:15 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:57959)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1ZAb8D-00086t-4I; Thu, 02 Jul 2015 05:50:10 -0400
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CNZ28105; Thu, 02 Jul 2015 17:49:54 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml428-hub.china.huawei.com (10.82.67.183) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 2 Jul 2015 17:49:46 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 2 Jul 2015 17:49:14 +0800
Message-ID: <1435830563-3072-2-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1435830563-3072-1-git-send-email-zhaoshenglong@huawei.com>
References: <1435830563-3072-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH 01/10] hw/ppc/ppc4xx_devs.c: Convert ppcuic
	to QOM
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Jul 2015 09:50:17 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Convert ppcuic to QOM and this fixes the memory leak caused by
qemu_allocate_irqs.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/ppc/ppc405.h         |  6 ++---
 hw/ppc/ppc405_boards.c  |  6 ++---
 hw/ppc/ppc405_uc.c      | 68 +++++++++++++++++++++++++------------------------
 hw/ppc/ppc440_bamboo.c  | 19 ++++++++------
 hw/ppc/ppc4xx_devs.c    | 55 +++++++++++++++++++++++++++++++++------
 include/hw/ppc/ppc4xx.h |  4 +--
 6 files changed, 99 insertions(+), 59 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 1c5f04f..fcd303a 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -63,14 +63,12 @@ CPUPPCState *ppc405cr_init(MemoryRegion *address_space_mem,
                         MemoryRegion ram_memories[4],
                         hwaddr ram_bases[4],
                         hwaddr ram_sizes[4],
-                        uint32_t sysclk, qemu_irq **picp,
-                        int do_init);
+                        uint32_t sysclk, int do_init);
 CPUPPCState *ppc405ep_init(MemoryRegion *address_space_mem,
                         MemoryRegion ram_memories[2],
                         hwaddr ram_bases[2],
                         hwaddr ram_sizes[2],
-                        uint32_t sysclk, qemu_irq **picp,
-                        int do_init);
+                        uint32_t sysclk, int do_init);
 /* IBM STBxxx microcontrollers */
 CPUPPCState *ppc_stb025_init (MemoryRegion ram_memories[2],
                            hwaddr ram_bases[2],
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index ec6c4cb..2dc967f 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -182,7 +182,6 @@ static void ref405ep_init(MachineState *machine)
     char *filename;
     ppc4xx_bd_info_t bd;
     CPUPPCState *env;
-    qemu_irq *pic;
     MemoryRegion *bios;
     MemoryRegion *sram = g_new(MemoryRegion, 1);
     ram_addr_t bdloc;
@@ -212,7 +211,7 @@ static void ref405ep_init(MachineState *machine)
     printf("%s: register cpu\n", __func__);
 #endif
     env = ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
-                        33333333, &pic, kernel_filename == NULL ? 0 : 1);
+                        33333333, kernel_filename == NULL ? 0 : 1);
     /* allocate SRAM */
     sram_size = 512 * 1024;
     memory_region_init_ram(sram, NULL, "ef405ep.sram", sram_size, &error_abort);
@@ -510,7 +509,6 @@ static void taihu_405ep_init(MachineState *machine)
     const char *kernel_filename = machine->kernel_filename;
     const char *initrd_filename = machine->initrd_filename;
     char *filename;
-    qemu_irq *pic;
     MemoryRegion *sysmem = get_system_memory();
     MemoryRegion *bios;
     MemoryRegion *ram_memories = g_malloc(2 * sizeof(*ram_memories));
@@ -542,7 +540,7 @@ static void taihu_405ep_init(MachineState *machine)
     printf("%s: register cpu\n", __func__);
 #endif
     ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
-                  33333333, &pic, kernel_filename == NULL ? 0 : 1);
+                  33333333, kernel_filename == NULL ? 0 : 1);
     /* allocate and load BIOS */
 #ifdef DEBUG_BOARD_INIT
     printf("%s: register BIOS\n", __func__);
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index c77434a..bc82058 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -2113,14 +2113,14 @@ CPUPPCState *ppc405cr_init(MemoryRegion *address_space_mem,
                         MemoryRegion ram_memories[4],
                         hwaddr ram_bases[4],
                         hwaddr ram_sizes[4],
-                        uint32_t sysclk, qemu_irq **picp,
-                        int do_init)
+                        uint32_t sysclk, int do_init)
 {
     clk_setup_t clk_setup[PPC405CR_CLK_NB];
     qemu_irq dma_irqs[4];
     PowerPCCPU *cpu;
     CPUPPCState *env;
-    qemu_irq *pic, *irqs;
+    qemu_irq *irqs;
+    DeviceState *pic;
 
     memset(clk_setup, 0, sizeof(clk_setup));
     cpu = ppc4xx_init("405cr", &clk_setup[PPC405CR_CPU_CLK],
@@ -2140,31 +2140,32 @@ CPUPPCState *ppc405cr_init(MemoryRegion *address_space_mem,
     irqs[PPCUIC_OUTPUT_CINT] =
         ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT];
     pic = ppcuic_init(env, irqs, 0x0C0, 0, 1);
-    *picp = pic;
     /* SDRAM controller */
-    ppc4xx_sdram_init(env, pic[14], 1, ram_memories,
+    ppc4xx_sdram_init(env, qdev_get_gpio_in(pic, 14), 1, ram_memories,
                       ram_bases, ram_sizes, do_init);
     /* External bus controller */
     ppc405_ebc_init(env);
     /* DMA controller */
-    dma_irqs[0] = pic[26];
-    dma_irqs[1] = pic[25];
-    dma_irqs[2] = pic[24];
-    dma_irqs[3] = pic[23];
+    dma_irqs[0] = qdev_get_gpio_in(pic, 26);
+    dma_irqs[1] = qdev_get_gpio_in(pic, 25);
+    dma_irqs[2] = qdev_get_gpio_in(pic, 24);
+    dma_irqs[3] = qdev_get_gpio_in(pic, 23);
     ppc405_dma_init(env, dma_irqs);
     /* Serial ports */
     if (serial_hds[0] != NULL) {
-        serial_mm_init(address_space_mem, 0xef600300, 0, pic[0],
+        serial_mm_init(address_space_mem, 0xef600300, 0,
+                       qdev_get_gpio_in(pic, 0),
                        PPC_SERIAL_MM_BAUDBASE, serial_hds[0],
                        DEVICE_BIG_ENDIAN);
     }
     if (serial_hds[1] != NULL) {
-        serial_mm_init(address_space_mem, 0xef600400, 0, pic[1],
+        serial_mm_init(address_space_mem, 0xef600400, 0,
+                       qdev_get_gpio_in(pic, 1),
                        PPC_SERIAL_MM_BAUDBASE, serial_hds[1],
                        DEVICE_BIG_ENDIAN);
     }
     /* IIC controller */
-    ppc405_i2c_init(0xef600500, pic[2]);
+    ppc405_i2c_init(0xef600500, qdev_get_gpio_in(pic, 2));
     /* GPIO */
     ppc405_gpio_init(0xef600700);
     /* CPU control */
@@ -2464,14 +2465,14 @@ CPUPPCState *ppc405ep_init(MemoryRegion *address_space_mem,
                         MemoryRegion ram_memories[2],
                         hwaddr ram_bases[2],
                         hwaddr ram_sizes[2],
-                        uint32_t sysclk, qemu_irq **picp,
-                        int do_init)
+                        uint32_t sysclk, int do_init)
 {
     clk_setup_t clk_setup[PPC405EP_CLK_NB], tlb_clk_setup;
     qemu_irq dma_irqs[4], gpt_irqs[5], mal_irqs[4];
     PowerPCCPU *cpu;
     CPUPPCState *env;
-    qemu_irq *pic, *irqs;
+    qemu_irq *irqs;
+    DeviceState *pic;
 
     memset(clk_setup, 0, sizeof(clk_setup));
     /* init CPUs */
@@ -2497,50 +2498,51 @@ CPUPPCState *ppc405ep_init(MemoryRegion *address_space_mem,
     irqs[PPCUIC_OUTPUT_CINT] =
         ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT];
     pic = ppcuic_init(env, irqs, 0x0C0, 0, 1);
-    *picp = pic;
     /* SDRAM controller */
 	/* XXX 405EP has no ECC interrupt */
-    ppc4xx_sdram_init(env, pic[17], 2, ram_memories,
+    ppc4xx_sdram_init(env, qdev_get_gpio_in(pic, 17), 2, ram_memories,
                       ram_bases, ram_sizes, do_init);
     /* External bus controller */
     ppc405_ebc_init(env);
     /* DMA controller */
-    dma_irqs[0] = pic[5];
-    dma_irqs[1] = pic[6];
-    dma_irqs[2] = pic[7];
-    dma_irqs[3] = pic[8];
+    dma_irqs[0] = qdev_get_gpio_in(pic, 5);
+    dma_irqs[1] = qdev_get_gpio_in(pic, 6);
+    dma_irqs[2] = qdev_get_gpio_in(pic, 7);
+    dma_irqs[3] = qdev_get_gpio_in(pic, 8);
     ppc405_dma_init(env, dma_irqs);
     /* IIC controller */
-    ppc405_i2c_init(0xef600500, pic[2]);
+    ppc405_i2c_init(0xef600500, qdev_get_gpio_in(pic, 2));
     /* GPIO */
     ppc405_gpio_init(0xef600700);
     /* Serial ports */
     if (serial_hds[0] != NULL) {
-        serial_mm_init(address_space_mem, 0xef600300, 0, pic[0],
+        serial_mm_init(address_space_mem, 0xef600300, 0,
+                       qdev_get_gpio_in(pic, 0),
                        PPC_SERIAL_MM_BAUDBASE, serial_hds[0],
                        DEVICE_BIG_ENDIAN);
     }
     if (serial_hds[1] != NULL) {
-        serial_mm_init(address_space_mem, 0xef600400, 0, pic[1],
+        serial_mm_init(address_space_mem, 0xef600400, 0,
+                       qdev_get_gpio_in(pic, 1),
                        PPC_SERIAL_MM_BAUDBASE, serial_hds[1],
                        DEVICE_BIG_ENDIAN);
     }
     /* OCM */
     ppc405_ocm_init(env);
     /* GPT */
-    gpt_irqs[0] = pic[19];
-    gpt_irqs[1] = pic[20];
-    gpt_irqs[2] = pic[21];
-    gpt_irqs[3] = pic[22];
-    gpt_irqs[4] = pic[23];
+    gpt_irqs[0] = qdev_get_gpio_in(pic, 19);
+    gpt_irqs[1] = qdev_get_gpio_in(pic, 20);
+    gpt_irqs[2] = qdev_get_gpio_in(pic, 21);
+    gpt_irqs[3] = qdev_get_gpio_in(pic, 22);
+    gpt_irqs[4] = qdev_get_gpio_in(pic, 23);
     ppc4xx_gpt_init(0xef600000, gpt_irqs);
     /* PCI */
     /* Uses pic[3], pic[16], pic[18] */
     /* MAL */
-    mal_irqs[0] = pic[11];
-    mal_irqs[1] = pic[12];
-    mal_irqs[2] = pic[13];
-    mal_irqs[3] = pic[14];
+    mal_irqs[0] = qdev_get_gpio_in(pic, 11);
+    mal_irqs[1] = qdev_get_gpio_in(pic, 12);
+    mal_irqs[2] = qdev_get_gpio_in(pic, 13);
+    mal_irqs[3] = qdev_get_gpio_in(pic, 14);
     ppc405_mal_init(env, mal_irqs);
     /* Ethernet */
     /* Uses pic[9], pic[15], pic[17] */
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 778970a..2f02ca4 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -170,7 +170,6 @@ static void bamboo_init(MachineState *machine)
         = g_malloc(PPC440EP_SDRAM_NR_BANKS * sizeof(*ram_memories));
     hwaddr ram_bases[PPC440EP_SDRAM_NR_BANKS];
     hwaddr ram_sizes[PPC440EP_SDRAM_NR_BANKS];
-    qemu_irq *pic;
     qemu_irq *irqs;
     PCIBus *pcibus;
     PowerPCCPU *cpu;
@@ -179,7 +178,7 @@ static void bamboo_init(MachineState *machine)
     uint64_t elf_lowaddr;
     hwaddr loadaddr = 0;
     target_long initrd_size = 0;
-    DeviceState *dev;
+    DeviceState *dev, *pic;
     int success;
     int i;
 
@@ -212,14 +211,16 @@ static void bamboo_init(MachineState *machine)
                                    ram_bases, ram_sizes,
                                    ppc440ep_sdram_bank_sizes);
     /* XXX 440EP's ECC interrupts are on UIC1, but we've only created UIC0. */
-    ppc4xx_sdram_init(env, pic[14], PPC440EP_SDRAM_NR_BANKS, ram_memories,
-                      ram_bases, ram_sizes, 1);
+    ppc4xx_sdram_init(env, qdev_get_gpio_in(pic, 14), PPC440EP_SDRAM_NR_BANKS,
+                      ram_memories, ram_bases, ram_sizes, 1);
 
     /* PCI */
     dev = sysbus_create_varargs(TYPE_PPC4xx_PCI_HOST_BRIDGE,
                                 PPC440EP_PCI_CONFIG,
-                                pic[pci_irq_nrs[0]], pic[pci_irq_nrs[1]],
-                                pic[pci_irq_nrs[2]], pic[pci_irq_nrs[3]],
+                                qdev_get_gpio_in(pic, pci_irq_nrs[0]),
+                                qdev_get_gpio_in(pic, pci_irq_nrs[1]),
+                                qdev_get_gpio_in(pic, pci_irq_nrs[2]),
+                                qdev_get_gpio_in(pic, pci_irq_nrs[3]),
                                 NULL);
     pcibus = (PCIBus *)qdev_get_child_bus(dev, "pci.0");
     if (!pcibus) {
@@ -232,12 +233,14 @@ static void bamboo_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), PPC440EP_PCI_IO, isa);
 
     if (serial_hds[0] != NULL) {
-        serial_mm_init(address_space_mem, 0xef600300, 0, pic[0],
+        serial_mm_init(address_space_mem, 0xef600300, 0,
+                       qdev_get_gpio_in(pic, 0),
                        PPC_SERIAL_MM_BAUDBASE, serial_hds[0],
                        DEVICE_BIG_ENDIAN);
     }
     if (serial_hds[1] != NULL) {
-        serial_mm_init(address_space_mem, 0xef600400, 0, pic[1],
+        serial_mm_init(address_space_mem, 0xef600400, 0,
+                       qdev_get_gpio_in(pic, 1),
                        PPC_SERIAL_MM_BAUDBASE, serial_hds[1],
                        DEVICE_BIG_ENDIAN);
     }
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 2f38ff7..e874897 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -24,6 +24,7 @@
 #include "hw/hw.h"
 #include "hw/ppc/ppc.h"
 #include "hw/ppc/ppc4xx.h"
+#include "hw/sysbus.h"
 #include "hw/boards.h"
 #include "qemu/log.h"
 #include "exec/address-spaces.h"
@@ -90,8 +91,15 @@ enum {
 };
 
 #define UIC_MAX_IRQ 32
+
+#define TYPE_PPCUIC "ppcuic"
+#define PPCUIC(obj) \
+    OBJECT_CHECK(ppcuic_t, (obj), TYPE_PPCUIC)
+
 typedef struct ppcuic_t ppcuic_t;
 struct ppcuic_t {
+    SysBusDevice parent;
+
     uint32_t dcr_base;
     int use_vectors;
     uint32_t level;  /* Remembers the state of level-triggered interrupts. */
@@ -281,11 +289,10 @@ static void dcr_write_uic (void *opaque, int dcrn, uint32_t val)
     }
 }
 
-static void ppcuic_reset (void *opaque)
+static void ppcuic_reset(DeviceState *dev)
 {
-    ppcuic_t *uic;
+    ppcuic_t *uic = PPCUIC(dev);
 
-    uic = opaque;
     uic->uiccr = 0x00000000;
     uic->uicer = 0x00000000;
     uic->uicpr = 0x00000000;
@@ -297,13 +304,46 @@ static void ppcuic_reset (void *opaque)
     }
 }
 
-qemu_irq *ppcuic_init (CPUPPCState *env, qemu_irq *irqs,
-                       uint32_t dcr_base, int has_ssr, int has_vr)
+static void ppcuic_initfn(Object *obj)
+{
+    DeviceState *dev = DEVICE(obj);
+
+    qdev_init_gpio_in(dev, ppcuic_set_irq, UIC_MAX_IRQ);
+}
+
+static void ppcuic_class_init(ObjectClass *klass, void *class_data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = ppcuic_reset;
+}
+
+static const TypeInfo ppcuic_info = {
+    .name = TYPE_PPCUIC,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(ppcuic_t),
+    .instance_init = ppcuic_initfn,
+    .class_init = ppcuic_class_init,
+};
+
+static void ppcuic_register_types(void)
+{
+    type_register_static(&ppcuic_info);
+}
+
+type_init(ppcuic_register_types);
+
+DeviceState *ppcuic_init(CPUPPCState *env, qemu_irq *irqs,
+                         uint32_t dcr_base, int has_ssr, int has_vr)
 {
+    DeviceState *dev;
     ppcuic_t *uic;
     int i;
 
-    uic = g_malloc0(sizeof(ppcuic_t));
+    dev = qdev_create(NULL, TYPE_PPCUIC);
+    qdev_init_nofail(dev);
+
+    uic = PPCUIC(dev);
     uic->dcr_base = dcr_base;
     uic->irqs = irqs;
     if (has_vr)
@@ -312,9 +352,8 @@ qemu_irq *ppcuic_init (CPUPPCState *env, qemu_irq *irqs,
         ppc_dcr_register(env, dcr_base + i, uic,
                          &dcr_read_uic, &dcr_write_uic);
     }
-    qemu_register_reset(ppcuic_reset, uic);
 
-    return qemu_allocate_irqs(&ppcuic_set_irq, uic, UIC_MAX_IRQ);
+    return dev;
 }
 
 /*****************************************************************************/
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index 91d84ba..4ec8096 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -38,8 +38,8 @@ enum {
     PPCUIC_OUTPUT_CINT = 1,
     PPCUIC_OUTPUT_NB,
 };
-qemu_irq *ppcuic_init (CPUPPCState *env, qemu_irq *irqs,
-                       uint32_t dcr_base, int has_ssr, int has_vr);
+DeviceState *ppcuic_init(CPUPPCState *env, qemu_irq *irqs,
+                         uint32_t dcr_base, int has_ssr, int has_vr);
 
 ram_addr_t ppc4xx_sdram_adjust(ram_addr_t ram_size, int nr_banks,
                                MemoryRegion ram_memories[],
-- 
2.0.4



