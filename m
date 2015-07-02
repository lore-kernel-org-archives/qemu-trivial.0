Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZAb8S-0000cc-As
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jul 2015 05:50:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ZAb8K-0000M5-KO
	for qemu-trivial@nongnu.org; Thu, 02 Jul 2015 05:50:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ZAb8F-0008PP-NH
	for qemu-trivial@nongnu.org; Thu, 02 Jul 2015 05:50:16 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:58101)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1ZAb8E-0008OD-Rg; Thu, 02 Jul 2015 05:50:11 -0400
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CNZ28138; Thu, 02 Jul 2015 17:50:01 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml428-hub.china.huawei.com (10.82.67.183) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 2 Jul 2015 17:49:48 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 2 Jul 2015 17:49:17 +0800
Message-ID: <1435830563-3072-5-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH 04/10] hw/m68k/mcf_intc.c: convert mcf_intc
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
X-List-Received-Date: Thu, 02 Jul 2015 09:50:19 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Convert mcf_intc to QOM and this fixes the memory leak caused by
qemu_allocate_irqs.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/m68k/mcf5208.c     | 22 ++++++++--------
 hw/m68k/mcf_intc.c    | 69 +++++++++++++++++++++++++++++++++++++++++++--------
 hw/net/mcf_fec.c      | 14 +++++++----
 include/hw/m68k/mcf.h |  8 +++---
 4 files changed, 83 insertions(+), 30 deletions(-)

diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index 326a42d..697f154 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -165,7 +165,7 @@ static const MemoryRegionOps m5208_sys_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void mcf5208_sys_init(MemoryRegion *address_space, qemu_irq *pic)
+static void mcf5208_sys_init(MemoryRegion *address_space, DeviceState *dev)
 {
     MemoryRegion *iomem = g_new(MemoryRegion, 1);
     m5208_timer_state *s;
@@ -184,7 +184,7 @@ static void mcf5208_sys_init(MemoryRegion *address_space, qemu_irq *pic)
                               "m5208-timer", 0x00004000);
         memory_region_add_subregion(address_space, 0xfc080000 + 0x4000 * i,
                                     &s->iomem);
-        s->irq = pic[4 + i];
+        s->irq = qdev_get_gpio_in(dev, 4 + i);
     }
 }
 
@@ -198,7 +198,7 @@ static void mcf5208evb_init(MachineState *machine)
     int kernel_size;
     uint64_t elf_entry;
     hwaddr entry;
-    qemu_irq *pic;
+    DeviceState *dev;
     MemoryRegion *address_space_mem = get_system_memory();
     MemoryRegion *ram = g_new(MemoryRegion, 1);
     MemoryRegion *sram = g_new(MemoryRegion, 1);
@@ -227,21 +227,23 @@ static void mcf5208evb_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, 0x80000000, sram);
 
     /* Internal peripherals.  */
-    pic = mcf_intc_init(address_space_mem, 0xfc048000, cpu);
+    dev = mcf_intc_init(address_space_mem, 0xfc048000);
 
-    mcf_uart_mm_init(address_space_mem, 0xfc060000, pic[26], serial_hds[0]);
-    mcf_uart_mm_init(address_space_mem, 0xfc064000, pic[27], serial_hds[1]);
-    mcf_uart_mm_init(address_space_mem, 0xfc068000, pic[28], serial_hds[2]);
+    mcf_uart_mm_init(address_space_mem, 0xfc060000, qdev_get_gpio_in(dev, 26),
+                     serial_hds[0]);
+    mcf_uart_mm_init(address_space_mem, 0xfc064000, qdev_get_gpio_in(dev, 27),
+                     serial_hds[1]);
+    mcf_uart_mm_init(address_space_mem, 0xfc068000, qdev_get_gpio_in(dev, 28),
+                     serial_hds[2]);
 
-    mcf5208_sys_init(address_space_mem, pic);
+    mcf5208_sys_init(address_space_mem, dev);
 
     if (nb_nics > 1) {
         fprintf(stderr, "Too many NICs\n");
         exit(1);
     }
     if (nd_table[0].used)
-        mcf_fec_init(address_space_mem, &nd_table[0],
-                     0xfc030000, pic + 36);
+        mcf_fec_init(address_space_mem, &nd_table[0], 0xfc030000, dev, 36);
 
     /*  0xfc000000 SCM.  */
     /*  0xfc004000 XBS.  */
diff --git a/hw/m68k/mcf_intc.c b/hw/m68k/mcf_intc.c
index f13c7f3..4cbc8e5 100644
--- a/hw/m68k/mcf_intc.c
+++ b/hw/m68k/mcf_intc.c
@@ -7,9 +7,16 @@
  */
 #include "hw/hw.h"
 #include "hw/m68k/mcf.h"
+#include "hw/sysbus.h"
 #include "exec/address-spaces.h"
 
+#define TYPE_MCF_INTC "mcf_intc"
+#define MCF_INTC(obj) \
+    OBJECT_CHECK(mcf_intc_state, (obj), TYPE_MCF_INTC)
+
 typedef struct {
+    SysBusDevice parent;
+
     MemoryRegion iomem;
     uint64_t ipr;
     uint64_t imr;
@@ -135,8 +142,10 @@ static void mcf_intc_set_irq(void *opaque, int irq, int level)
     mcf_intc_update(s);
 }
 
-static void mcf_intc_reset(mcf_intc_state *s)
+static void mcf_intc_reset(DeviceState *dev)
 {
+    mcf_intc_state *s = MCF_INTC(dev);
+
     s->imr = ~0ull;
     s->ipr = 0;
     s->ifr = 0;
@@ -151,18 +160,58 @@ static const MemoryRegionOps mcf_intc_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-qemu_irq *mcf_intc_init(MemoryRegion *sysmem,
-                        hwaddr base,
-                        M68kCPU *cpu)
+static void mcf_intc_initfn(Object *obj)
 {
-    mcf_intc_state *s;
+    DeviceState *dev = DEVICE(obj);
+    mcf_intc_state *s = MCF_INTC(obj);
+    SysBusDevice *sysbus = SYS_BUS_DEVICE(obj);
 
-    s = g_malloc0(sizeof(mcf_intc_state));
-    s->cpu = cpu;
-    mcf_intc_reset(s);
+    qdev_init_gpio_in(dev, mcf_intc_set_irq, 64);
+    sysbus_init_mmio(sysbus, &s->iomem);
+}
+
+static void mcf_intc_realize(DeviceState *dev, Error **errp)
+{
+    mcf_intc_state *s = MCF_INTC(dev);
 
     memory_region_init_io(&s->iomem, NULL, &mcf_intc_ops, s, "mcf", 0x100);
-    memory_region_add_subregion(sysmem, base, &s->iomem);
+    s->cpu = M68K_CPU(first_cpu);
+}
+
+static void mcf_intc_class_init(ObjectClass *klass, void *class_data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = mcf_intc_realize;
+    dc->reset = mcf_intc_reset;
+}
+
+static const TypeInfo mcf_intc_info = {
+    .name = TYPE_MCF_INTC,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(mcf_intc_state),
+    .instance_init = mcf_intc_initfn,
+    .class_init = mcf_intc_class_init,
+};
+
+static void mcf_intc_register_types(void)
+{
+    type_register_static(&mcf_intc_info);
+}
+
+type_init(mcf_intc_register_types);
+
+DeviceState *mcf_intc_init(MemoryRegion *sysmem, hwaddr base)
+{
+    DeviceState *dev;
+    SysBusDevice *sysbus;
+
+    dev = qdev_create(NULL, TYPE_MCF_INTC);
+    qdev_init_nofail(dev);
+
+    sysbus = SYS_BUS_DEVICE(dev);
+    memory_region_add_subregion(sysmem, base,
+                                sysbus_mmio_get_region(sysbus, 0));
 
-    return qemu_allocate_irqs(mcf_intc_set_irq, s, 64);
+    return dev;
 }
diff --git a/hw/net/mcf_fec.c b/hw/net/mcf_fec.c
index 0255612..0003f84 100644
--- a/hw/net/mcf_fec.c
+++ b/hw/net/mcf_fec.c
@@ -22,11 +22,12 @@ do { printf("mcf_fec: " fmt , ## __VA_ARGS__); } while (0)
 #endif
 
 #define FEC_MAX_FRAME_SIZE 2032
+#define FEC_NUM_IRQ 13
 
 typedef struct {
     MemoryRegion *sysmem;
     MemoryRegion iomem;
-    qemu_irq *irq;
+    qemu_irq irq[FEC_NUM_IRQ];
     NICState *nic;
     NICConf conf;
     uint32_t irq_state;
@@ -65,7 +66,6 @@ typedef struct {
 #define FEC_RESET   1
 
 /* Map interrupt flags onto IRQ lines.  */
-#define FEC_NUM_IRQ 13
 static const uint32_t mcf_fec_irq_map[FEC_NUM_IRQ] = {
     FEC_INT_TXF,
     FEC_INT_TXB,
@@ -446,16 +446,20 @@ static NetClientInfo net_mcf_fec_info = {
     .receive = mcf_fec_receive,
 };
 
-void mcf_fec_init(MemoryRegion *sysmem, NICInfo *nd,
-                  hwaddr base, qemu_irq *irq)
+void mcf_fec_init(MemoryRegion *sysmem, NICInfo *nd, hwaddr base,
+                  DeviceState *dev, int irq_start)
 {
     mcf_fec_state *s;
+    int i;
 
     qemu_check_nic_model(nd, "mcf_fec");
 
     s = (mcf_fec_state *)g_malloc0(sizeof(mcf_fec_state));
     s->sysmem = sysmem;
-    s->irq = irq;
+
+    for (i = 0; i < FEC_NUM_IRQ; i++) {
+        s->irq[i] = qdev_get_gpio_in(dev, irq_start + i);
+    }
 
     memory_region_init_io(&s->iomem, NULL, &mcf_fec_ops, s, "fec", 0x400);
     memory_region_add_subregion(sysmem, base, &s->iomem);
diff --git a/include/hw/m68k/mcf.h b/include/hw/m68k/mcf.h
index a64f4ad..05add1d 100644
--- a/include/hw/m68k/mcf.h
+++ b/include/hw/m68k/mcf.h
@@ -15,13 +15,11 @@ void mcf_uart_mm_init(struct MemoryRegion *sysmem,
                       qemu_irq irq, CharDriverState *chr);
 
 /* mcf_intc.c */
-qemu_irq *mcf_intc_init(struct MemoryRegion *sysmem,
-                        hwaddr base,
-                        M68kCPU *cpu);
+DeviceState *mcf_intc_init(struct MemoryRegion *sysmem, hwaddr base);
 
 /* mcf_fec.c */
-void mcf_fec_init(struct MemoryRegion *sysmem, NICInfo *nd,
-                  hwaddr base, qemu_irq *irq);
+void mcf_fec_init(struct MemoryRegion *sysmem, NICInfo *nd, hwaddr base,
+                  DeviceState *dev, int irq_start);
 
 /* mcf5206.c */
 void mcf5206_init(struct MemoryRegion *sysmem, uint32_t base);
-- 
2.0.4



