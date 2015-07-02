Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZAb8T-0000dr-54
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jul 2015 05:50:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ZAb8N-0000RQ-5c
	for qemu-trivial@nongnu.org; Thu, 02 Jul 2015 05:50:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ZAb8F-0008PI-GC
	for qemu-trivial@nongnu.org; Thu, 02 Jul 2015 05:50:19 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:58091)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1ZAb8E-0008Nm-1E; Thu, 02 Jul 2015 05:50:11 -0400
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CNZ28131; Thu, 02 Jul 2015 17:50:00 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml428-hub.china.huawei.com (10.82.67.183) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 2 Jul 2015 17:49:47 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 2 Jul 2015 17:49:16 +0800
Message-ID: <1435830563-3072-4-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH 03/10] hw/m68k/mcf5206.c: convert m5206_mbar
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
X-List-Received-Date: Thu, 02 Jul 2015 09:50:20 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Convert m5206_mbar to QOM and this fixes the memory leak caused by
qemu_allocate_irqs.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/m68k/an5206.c      |  2 +-
 hw/m68k/mcf5206.c     | 75 +++++++++++++++++++++++++++++++++++++++++----------
 include/hw/m68k/mcf.h |  3 +--
 3 files changed, 63 insertions(+), 17 deletions(-)

diff --git a/hw/m68k/an5206.c b/hw/m68k/an5206.c
index f63ab2b..6ca2d44 100644
--- a/hw/m68k/an5206.c
+++ b/hw/m68k/an5206.c
@@ -58,7 +58,7 @@ static void an5206_init(MachineState *machine)
     vmstate_register_ram_global(sram);
     memory_region_add_subregion(address_space_mem, AN5206_RAMBAR_ADDR, sram);
 
-    mcf5206_init(address_space_mem, AN5206_MBAR_ADDR, cpu);
+    mcf5206_init(address_space_mem, AN5206_MBAR_ADDR);
 
     /* Load kernel.  */
     if (!kernel_filename) {
diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
index 1727a46..cb9cf59 100644
--- a/hw/m68k/mcf5206.c
+++ b/hw/m68k/mcf5206.c
@@ -7,6 +7,7 @@
  */
 #include "hw/hw.h"
 #include "hw/m68k/mcf.h"
+#include "hw/sysbus.h"
 #include "qemu/timer.h"
 #include "hw/ptimer.h"
 #include "sysemu/sysemu.h"
@@ -142,9 +143,15 @@ static m5206_timer_state *m5206_timer_init(qemu_irq irq)
     return s;
 }
 
+#define TYPE_M5206_MBAR "m5206_mbar"
+#define M5206_MBAR(obj) \
+    OBJECT_CHECK(m5206_mbar_state, (obj), TYPE_M5206_MBAR)
+
 /* System Integration Module.  */
 
 typedef struct {
+    SysBusDevice parent;
+
     M68kCPU *cpu;
     MemoryRegion iomem;
     m5206_timer_state *timer[2];
@@ -242,8 +249,10 @@ static void m5206_mbar_set_irq(void *opaque, int irq, int level)
 
 /* System Integration Module.  */
 
-static void m5206_mbar_reset(m5206_mbar_state *s)
+static void m5206_mbar_reset(DeviceState *dev)
 {
+    m5206_mbar_state *s = M5206_MBAR(dev);
+
     s->scr = 0xc0;
     s->icr[1] = 0x04;
     s->icr[2] = 0x08;
@@ -525,24 +534,62 @@ static const MemoryRegionOps m5206_mbar_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-qemu_irq *mcf5206_init(MemoryRegion *sysmem, uint32_t base, M68kCPU *cpu)
+static void m5206_mbar_initfn(Object *obj)
 {
-    m5206_mbar_state *s;
-    qemu_irq *pic;
+    DeviceState *dev = DEVICE(obj);
+    m5206_mbar_state *s = M5206_MBAR(obj);
+    SysBusDevice *sysbus = SYS_BUS_DEVICE(obj);
+
+    qdev_init_gpio_in(dev, m5206_mbar_set_irq, 14);
+    sysbus_init_mmio(sysbus, &s->iomem);
+}
 
-    s = (m5206_mbar_state *)g_malloc0(sizeof(m5206_mbar_state));
+static void m5206_mbar_realize(DeviceState *dev, Error **errp)
+{
+    m5206_mbar_state *s = M5206_MBAR(dev);
 
     memory_region_init_io(&s->iomem, NULL, &m5206_mbar_ops, s,
                           "mbar", 0x00001000);
-    memory_region_add_subregion(sysmem, base, &s->iomem);
 
-    pic = qemu_allocate_irqs(m5206_mbar_set_irq, s, 14);
-    s->timer[0] = m5206_timer_init(pic[9]);
-    s->timer[1] = m5206_timer_init(pic[10]);
-    s->uart[0] = mcf_uart_init(pic[12], serial_hds[0]);
-    s->uart[1] = mcf_uart_init(pic[13], serial_hds[1]);
-    s->cpu = cpu;
+    s->timer[0] = m5206_timer_init(qdev_get_gpio_in(dev, 9));
+    s->timer[1] = m5206_timer_init(qdev_get_gpio_in(dev, 10));
+    s->uart[0] = mcf_uart_init(qdev_get_gpio_in(dev, 12), serial_hds[0]);
+    s->uart[1] = mcf_uart_init(qdev_get_gpio_in(dev, 13), serial_hds[1]);
+    s->cpu = M68K_CPU(first_cpu);
+}
+
+static void m5206_mbar_class_init(ObjectClass *klass, void *class_data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = m5206_mbar_realize;
+    dc->reset = m5206_mbar_reset;
+}
+
+static const TypeInfo m5206_mbar_info = {
+    .name = TYPE_M5206_MBAR,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(m5206_mbar_state),
+    .instance_init = m5206_mbar_initfn,
+    .class_init = m5206_mbar_class_init,
+};
+
+static void m5206_mbar_register_types(void)
+{
+    type_register_static(&m5206_mbar_info);
+}
+
+type_init(m5206_mbar_register_types);
+
+void mcf5206_init(MemoryRegion *sysmem, uint32_t base)
+{
+    DeviceState *dev;
+    SysBusDevice *sysbus;
+
+    dev = qdev_create(NULL, TYPE_M5206_MBAR);
+    qdev_init_nofail(dev);
 
-    m5206_mbar_reset(s);
-    return pic;
+    sysbus = SYS_BUS_DEVICE(dev);
+    memory_region_add_subregion(sysmem, base,
+                                sysbus_mmio_get_region(sysbus, 0));
 }
diff --git a/include/hw/m68k/mcf.h b/include/hw/m68k/mcf.h
index fbc8dc2..a64f4ad 100644
--- a/include/hw/m68k/mcf.h
+++ b/include/hw/m68k/mcf.h
@@ -24,7 +24,6 @@ void mcf_fec_init(struct MemoryRegion *sysmem, NICInfo *nd,
                   hwaddr base, qemu_irq *irq);
 
 /* mcf5206.c */
-qemu_irq *mcf5206_init(struct MemoryRegion *sysmem,
-                       uint32_t base, M68kCPU *cpu);
+void mcf5206_init(struct MemoryRegion *sysmem, uint32_t base);
 
 #endif
-- 
2.0.4



