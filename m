Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z09d8-00046t-CI
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 10:26:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z09d0-0003qS-GJ
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 10:26:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z09cv-0006z7-Vk
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 10:26:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46804)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z09cq-0006vV-Gb; Wed, 03 Jun 2015 10:26:36 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E23F2407C5;
	Wed,  3 Jun 2015 17:26:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 4CC06A6C;
	Wed,  3 Jun 2015 16:08:55 +0300 (MSK)
Received: (nullmailer pid 27441 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:34 +0300
Message-Id: <0b0cc076b78976b30360dd7c6ed994f864424779.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 14/30] hw/i386/pc: Fix misusing
	qemu_allocate_irqs for single irq
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
X-List-Received-Date: Wed, 03 Jun 2015 14:26:50 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Since pc_allocate_cpu_irq only requests one irq, so let it just call
qemu_allocate_irq.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i386/pc.c         | 4 ++--
 hw/i386/pc_piix.c    | 4 +---
 hw/i386/pc_q35.c     | 4 +---
 include/hw/i386/pc.h | 2 +-
 4 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 1eb1db0..886151b 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1345,9 +1345,9 @@ FWCfgState *pc_memory_init(MachineState *machine,
     return fw_cfg;
 }
 
-qemu_irq *pc_allocate_cpu_irq(void)
+qemu_irq pc_allocate_cpu_irq(void)
 {
-    return qemu_allocate_irqs(pic_irq_request, NULL, 1);
+    return qemu_allocate_irq(pic_irq_request, NULL, 0);
 }
 
 DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus)
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 8d949a3..768b09b 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -86,7 +86,6 @@ static void pc_init1(MachineState *machine)
     ISABus *isa_bus;
     PCII440FXState *i440fx_state;
     int piix3_devfn = -1;
-    qemu_irq *cpu_irq;
     qemu_irq *gsi;
     qemu_irq *i8259;
     qemu_irq smi_irq;
@@ -220,8 +219,7 @@ static void pc_init1(MachineState *machine)
     } else if (xen_enabled()) {
         i8259 = xen_interrupt_controller_init();
     } else {
-        cpu_irq = pc_allocate_cpu_irq();
-        i8259 = i8259_init(isa_bus, cpu_irq[0]);
+        i8259 = i8259_init(isa_bus, pc_allocate_cpu_irq());
     }
 
     for (i = 0; i < ISA_NUM_IRQS; i++) {
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 66220b3..110dfb7 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -79,7 +79,6 @@ static void pc_q35_init(MachineState *machine)
     GSIState *gsi_state;
     ISABus *isa_bus;
     int pci_enabled = 1;
-    qemu_irq *cpu_irq;
     qemu_irq *gsi;
     qemu_irq *i8259;
     int i;
@@ -230,8 +229,7 @@ static void pc_q35_init(MachineState *machine)
     } else if (xen_enabled()) {
         i8259 = xen_interrupt_controller_init();
     } else {
-        cpu_irq = pc_allocate_cpu_irq();
-        i8259 = i8259_init(isa_bus, cpu_irq[0]);
+        i8259 = i8259_init(isa_bus, pc_allocate_cpu_irq());
     }
 
     for (i = 0; i < ISA_NUM_IRQS; i++) {
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 27bd748..261155f 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -193,7 +193,7 @@ FWCfgState *pc_memory_init(MachineState *machine,
                            MemoryRegion *rom_memory,
                            MemoryRegion **ram_memory,
                            PcGuestInfo *guest_info);
-qemu_irq *pc_allocate_cpu_irq(void);
+qemu_irq pc_allocate_cpu_irq(void);
 DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
 void pc_basic_device_init(ISABus *isa_bus, qemu_irq *gsi,
                           ISADevice **rtc_state,
-- 
2.1.4


