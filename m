Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZAb8S-0000dC-St
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jul 2015 05:50:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36231)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ZAb8N-0000RB-24
	for qemu-trivial@nongnu.org; Thu, 02 Jul 2015 05:50:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ZAb8F-0008PA-9r
	for qemu-trivial@nongnu.org; Thu, 02 Jul 2015 05:50:18 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:58108)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1ZAb8E-0008OI-NK; Thu, 02 Jul 2015 05:50:11 -0400
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CNZ28130; Thu, 02 Jul 2015 17:50:00 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml428-hub.china.huawei.com (10.82.67.183) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 2 Jul 2015 17:49:49 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 2 Jul 2015 17:49:18 +0800
Message-ID: <1435830563-3072-6-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH 05/10] hw/sh4/r2d.c: convert r2d_fpga to QOM
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

Convert r2d_fpga to QOM and this fixes the memory leak caused by
qemu_allocate_irqs.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/sh4/r2d.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 64 insertions(+), 16 deletions(-)

diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 5e22ed7..b1bfad9 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -57,7 +57,13 @@
 #define PA_VERREG	0x32
 #define PA_OUTPORT	0x36
 
+#define TYPE_R2D_FPGA "r2d_fpga"
+#define R2D_FPGA(obj) \
+    OBJECT_CHECK(r2d_fpga_t, (obj), TYPE_R2D_FPGA)
+
 typedef struct {
+    SysBusDevice parent;
+
     uint16_t bcr;
     uint16_t irlmsk;
     uint16_t irlmon;
@@ -177,18 +183,61 @@ static const MemoryRegionOps r2d_fpga_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static qemu_irq *r2d_fpga_init(MemoryRegion *sysmem,
-                               hwaddr base, qemu_irq irl)
+static void r2d_fpga_initfn(Object *obj)
 {
-    r2d_fpga_t *s;
+    DeviceState *dev = DEVICE(obj);
+    r2d_fpga_t *s = R2D_FPGA(obj);
+    SysBusDevice *sysbus = SYS_BUS_DEVICE(obj);
 
-    s = g_malloc0(sizeof(r2d_fpga_t));
+    qdev_init_gpio_in(dev, r2d_fpga_irq_set, NR_IRQS);
+    sysbus_init_irq(sysbus, &s->irl);
+    sysbus_init_mmio(sysbus, &s->iomem);
+}
 
-    s->irl = irl;
+static void r2d_fpga_realize(DeviceState *dev, Error **errp)
+{
+    r2d_fpga_t *s = R2D_FPGA(dev);
 
     memory_region_init_io(&s->iomem, NULL, &r2d_fpga_ops, s, "r2d-fpga", 0x40);
-    memory_region_add_subregion(sysmem, base, &s->iomem);
-    return qemu_allocate_irqs(r2d_fpga_irq_set, s, NR_IRQS);
+}
+
+static void r2d_fpga_class_init(ObjectClass *klass, void *class_data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = r2d_fpga_realize;
+}
+
+static const TypeInfo r2d_fpga_info = {
+    .name = TYPE_R2D_FPGA,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(r2d_fpga_t),
+    .instance_init = r2d_fpga_initfn,
+    .class_init = r2d_fpga_class_init,
+};
+
+static void r2d_fpga_register_types(void)
+{
+    type_register_static(&r2d_fpga_info);
+}
+
+type_init(r2d_fpga_register_types);
+
+static DeviceState *r2d_fpga_init(MemoryRegion *sysmem,
+                                  hwaddr base, qemu_irq irl)
+{
+    DeviceState *dev;
+    SysBusDevice *sysbus;
+
+    dev = qdev_create(NULL, TYPE_R2D_FPGA);
+    qdev_init_nofail(dev);
+
+    sysbus = SYS_BUS_DEVICE(dev);
+    sysbus_connect_irq(sysbus, 0, irl);
+    memory_region_add_subregion(sysmem, base,
+                                sysbus_mmio_get_region(sysbus, 0));
+
+    return dev;
 }
 
 typedef struct ResetData {
@@ -230,10 +279,9 @@ static void r2d_init(MachineState *machine)
     ResetData *reset_info;
     struct SH7750State *s;
     MemoryRegion *sdram = g_new(MemoryRegion, 1);
-    qemu_irq *irq;
     DriveInfo *dinfo;
     int i;
-    DeviceState *dev;
+    DeviceState *dev, *r2d_fpga;
     SysBusDevice *busdev;
     MemoryRegion *address_space_mem = get_system_memory();
     PCIBus *pci_bus;
@@ -260,7 +308,7 @@ static void r2d_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, SDRAM_BASE, sdram);
     /* Register peripherals */
     s = sh7750_init(cpu, address_space_mem);
-    irq = r2d_fpga_init(address_space_mem, 0x04000000, sh7750_irl(s));
+    r2d_fpga = r2d_fpga_init(address_space_mem, 0x04000000, sh7750_irl(s));
 
     dev = qdev_create(NULL, "sh_pci");
     busdev = SYS_BUS_DEVICE(dev);
@@ -268,19 +316,19 @@ static void r2d_init(MachineState *machine)
     pci_bus = PCI_BUS(qdev_get_child_bus(dev, "pci"));
     sysbus_mmio_map(busdev, 0, P4ADDR(0x1e200000));
     sysbus_mmio_map(busdev, 1, A7ADDR(0x1e200000));
-    sysbus_connect_irq(busdev, 0, irq[PCI_INTA]);
-    sysbus_connect_irq(busdev, 1, irq[PCI_INTB]);
-    sysbus_connect_irq(busdev, 2, irq[PCI_INTC]);
-    sysbus_connect_irq(busdev, 3, irq[PCI_INTD]);
+    sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(r2d_fpga, PCI_INTA));
+    sysbus_connect_irq(busdev, 1, qdev_get_gpio_in(r2d_fpga, PCI_INTB));
+    sysbus_connect_irq(busdev, 2, qdev_get_gpio_in(r2d_fpga, PCI_INTC));
+    sysbus_connect_irq(busdev, 3, qdev_get_gpio_in(r2d_fpga, PCI_INTD));
 
     sm501_init(address_space_mem, 0x10000000, SM501_VRAM_SIZE,
-               irq[SM501], serial_hds[2]);
+               qdev_get_gpio_in(r2d_fpga, SM501), serial_hds[2]);
 
     /* onboard CF (True IDE mode, Master only). */
     dinfo = drive_get(IF_IDE, 0, 0);
     dev = qdev_create(NULL, "mmio-ide");
     busdev = SYS_BUS_DEVICE(dev);
-    sysbus_connect_irq(busdev, 0, irq[CF_IDE]);
+    sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(r2d_fpga, CF_IDE));
     qdev_prop_set_uint32(dev, "shift", 1);
     qdev_init_nofail(dev);
     sysbus_mmio_map(busdev, 0, 0x14001000);
-- 
2.0.4



