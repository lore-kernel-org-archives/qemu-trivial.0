Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yybc6-0005Hy-2Q
	for mharc-qemu-trivial@gnu.org; Sat, 30 May 2015 03:55:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52021)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yybc2-0005EB-JP
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 03:55:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yybbz-00087y-BE
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 03:55:22 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:38791)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yybby-00087d-JV; Sat, 30 May 2015 03:55:19 -0400
Received: from 172.24.2.119 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id COS15543; Sat, 30 May 2015 15:55:06 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml431-hub.china.huawei.com (10.82.67.208) with Microsoft SMTP
	Server id 14.3.158.1; Sat, 30 May 2015 15:54:57 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 30 May 2015 15:54:31 +0800
Message-ID: <1432972477-13504-2-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432972477-13504-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432972477-13504-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, mjt@tls.msk.ru,
	shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH v2 1/7] hw/ppc/ppc440_bamboo.c: Add a member
	in MachineState to store irq array
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
X-List-Received-Date: Sat, 30 May 2015 07:55:24 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Here we add a member in MachineState to store the irq array returned
from qemu_allocate_irqs. Then these irq arrays will be free before QEMU
exit and it fixes the memory leak spotted by valgrind.

valgrind complains about:
==6366== 4,936 (256 direct, 4,680 indirect) bytes in 1 blocks are definitely lost in loss record 3,245 of 3,271
==6366==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==6366==    by 0x336F47: malloc_and_trace (vl.c:2556)
==6366==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==6366==    by 0x3C093B: qemu_extend_irqs (irq.c:55)
==6366==    by 0x3C09C7: qemu_allocate_irqs (irq.c:64)
==6366==    by 0x265091: ppcuic_init (ppc4xx_devs.c:317)
==6366==    by 0x26A90A: bamboo_init (ppc440_bamboo.c:205)
==6366==    by 0x33B312: main (vl.c:4249)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/ppc/ppc440_bamboo.c | 17 +++++++++--------
 include/hw/boards.h    |  1 +
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 778970a..f533b06 100644
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
@@ -202,7 +201,7 @@ static void bamboo_init(MachineState *machine)
     irqs = g_malloc0(sizeof(qemu_irq) * PPCUIC_OUTPUT_NB);
     irqs[PPCUIC_OUTPUT_INT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT];
     irqs[PPCUIC_OUTPUT_CINT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT];
-    pic = ppcuic_init(env, irqs, 0x0C0, 0, 1);
+    machine->irqs = ppcuic_init(env, irqs, 0x0C0, 0, 1);
 
     /* SDRAM controller */
     memset(ram_bases, 0, sizeof(ram_bases));
@@ -212,14 +211,16 @@ static void bamboo_init(MachineState *machine)
                                    ram_bases, ram_sizes,
                                    ppc440ep_sdram_bank_sizes);
     /* XXX 440EP's ECC interrupts are on UIC1, but we've only created UIC0. */
-    ppc4xx_sdram_init(env, pic[14], PPC440EP_SDRAM_NR_BANKS, ram_memories,
-                      ram_bases, ram_sizes, 1);
+    ppc4xx_sdram_init(env, machine->irqs[14], PPC440EP_SDRAM_NR_BANKS,
+                      ram_memories, ram_bases, ram_sizes, 1);
 
     /* PCI */
     dev = sysbus_create_varargs(TYPE_PPC4xx_PCI_HOST_BRIDGE,
                                 PPC440EP_PCI_CONFIG,
-                                pic[pci_irq_nrs[0]], pic[pci_irq_nrs[1]],
-                                pic[pci_irq_nrs[2]], pic[pci_irq_nrs[3]],
+                                machine->irqs[pci_irq_nrs[0]],
+                                machine->irqs[pci_irq_nrs[1]],
+                                machine->irqs[pci_irq_nrs[2]],
+                                machine->irqs[pci_irq_nrs[3]],
                                 NULL);
     pcibus = (PCIBus *)qdev_get_child_bus(dev, "pci.0");
     if (!pcibus) {
@@ -232,12 +233,12 @@ static void bamboo_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), PPC440EP_PCI_IO, isa);
 
     if (serial_hds[0] != NULL) {
-        serial_mm_init(address_space_mem, 0xef600300, 0, pic[0],
+        serial_mm_init(address_space_mem, 0xef600300, 0, machine->irqs[0],
                        PPC_SERIAL_MM_BAUDBASE, serial_hds[0],
                        DEVICE_BIG_ENDIAN);
     }
     if (serial_hds[1] != NULL) {
-        serial_mm_init(address_space_mem, 0xef600400, 0, pic[1],
+        serial_mm_init(address_space_mem, 0xef600400, 0, machine->irqs[1],
                        PPC_SERIAL_MM_BAUDBASE, serial_hds[1],
                        DEVICE_BIG_ENDIAN);
     }
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 1f11881..18a0f93 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -160,6 +160,7 @@ struct MachineState {
     char *initrd_filename;
     const char *cpu_model;
     AccelState *accelerator;
+    qemu_irq *irqs;
 };
 
 #endif
-- 
2.0.4



