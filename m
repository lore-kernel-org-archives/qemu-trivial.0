Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YybfE-00020B-3U
	for mharc-qemu-trivial@gnu.org; Sat, 30 May 2015 03:58:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YybfB-0001uu-7f
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 03:58:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yybf8-0000XQ-03
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 03:58:37 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:28723)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yybf7-0000X4-Dp; Sat, 30 May 2015 03:58:33 -0400
Received: from 172.24.2.119 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BGU05486; Sat, 30 May 2015 15:55:12 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml431-hub.china.huawei.com (10.82.67.208) with Microsoft SMTP
	Server id 14.3.158.1; Sat, 30 May 2015 15:55:01 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 30 May 2015 15:54:34 +0800
Message-ID: <1432972477-13504-5-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432972477-13504-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432972477-13504-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.55696CE0.0138, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: afb195cf1cdd28cd1e8351513c9a40a8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, mjt@tls.msk.ru,
	shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH v2 4/7] hw/sh4/r2d.c: Store irq array in
	MachineState to fix memory leak
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
X-List-Received-Date: Sat, 30 May 2015 07:58:38 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/sh4/r2d.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 4221060..39edefd 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -230,7 +230,6 @@ static void r2d_init(MachineState *machine)
     ResetData *reset_info;
     struct SH7750State *s;
     MemoryRegion *sdram = g_new(MemoryRegion, 1);
-    qemu_irq *irq;
     DriveInfo *dinfo;
     int i;
     DeviceState *dev;
@@ -260,7 +259,7 @@ static void r2d_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, SDRAM_BASE, sdram);
     /* Register peripherals */
     s = sh7750_init(cpu, address_space_mem);
-    irq = r2d_fpga_init(address_space_mem, 0x04000000, sh7750_irl(s));
+    machine->irqs = r2d_fpga_init(address_space_mem, 0x04000000, sh7750_irl(s));
 
     dev = qdev_create(NULL, "sh_pci");
     busdev = SYS_BUS_DEVICE(dev);
@@ -268,19 +267,19 @@ static void r2d_init(MachineState *machine)
     pci_bus = PCI_BUS(qdev_get_child_bus(dev, "pci"));
     sysbus_mmio_map(busdev, 0, P4ADDR(0x1e200000));
     sysbus_mmio_map(busdev, 1, A7ADDR(0x1e200000));
-    sysbus_connect_irq(busdev, 0, irq[PCI_INTA]);
-    sysbus_connect_irq(busdev, 1, irq[PCI_INTB]);
-    sysbus_connect_irq(busdev, 2, irq[PCI_INTC]);
-    sysbus_connect_irq(busdev, 3, irq[PCI_INTD]);
+    sysbus_connect_irq(busdev, 0, machine->irqs[PCI_INTA]);
+    sysbus_connect_irq(busdev, 1, machine->irqs[PCI_INTB]);
+    sysbus_connect_irq(busdev, 2, machine->irqs[PCI_INTC]);
+    sysbus_connect_irq(busdev, 3, machine->irqs[PCI_INTD]);
 
     sm501_init(address_space_mem, 0x10000000, SM501_VRAM_SIZE,
-               irq[SM501], serial_hds[2]);
+               machine->irqs[SM501], serial_hds[2]);
 
     /* onboard CF (True IDE mode, Master only). */
     dinfo = drive_get(IF_IDE, 0, 0);
     dev = qdev_create(NULL, "mmio-ide");
     busdev = SYS_BUS_DEVICE(dev);
-    sysbus_connect_irq(busdev, 0, irq[CF_IDE]);
+    sysbus_connect_irq(busdev, 0, machine->irqs[CF_IDE]);
     qdev_prop_set_uint32(dev, "shift", 1);
     qdev_init_nofail(dev);
     sysbus_mmio_map(busdev, 0, 0x14001000);
-- 
2.0.4



