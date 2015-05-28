Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxwhA-0007rF-JB
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:13:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yxwh4-0007gQ-AS
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:13:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yxwh0-0004jf-Hl
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:13:50 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:39916)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yxwgs-0004hl-ER; Thu, 28 May 2015 08:13:38 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BGR93435; Thu, 28 May 2015 20:10:20 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:09:54 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:08:26 +0800
Message-ID: <1432814932-12608-4-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.556705AD.00E8, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 9fcc257eb2b093eb5f4c6bebd7825dab
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, mjt@tls.msk.ru,
	shannon.zhao@linaro.org, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH 03/29] hw/i386/pc: Fix memory leak spotted by
	valgrind
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
X-List-Received-Date: Thu, 28 May 2015 12:13:55 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==20308== 8 bytes in 1 blocks are definitely lost in loss record 622 of 3,474
==20308==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==20308==    by 0x2EB687: malloc_and_trace (vl.c:2556)
==20308==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==20308==    by 0x377C57: qemu_extend_irqs (irq.c:55)
==20308==    by 0x377CE3: qemu_allocate_irqs (irq.c:64)
==20308==    by 0x2522B8: pc_allocate_cpu_irq (pc.c:1350)
==20308==    by 0x255AFF: pc_q35_init (pc_q35.c:233)
==20308==    by 0x2EFA52: main (vl.c:4249)

==16440== 8 bytes in 1 blocks are definitely lost in loss record 599 of 3,443
==16440==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==16440==    by 0x2EB687: malloc_and_trace (vl.c:2556)
==16440==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==16440==    by 0x377C57: qemu_extend_irqs (irq.c:55)
==16440==    by 0x377CE3: qemu_allocate_irqs (irq.c:64)
==16440==    by 0x2522B8: pc_allocate_cpu_irq (pc.c:1350)
==16440==    by 0x2546B6: pc_init1 (pc_piix.c:223)
==16440==    by 0x254C16: pc_init_pci (pc_piix.c:311)
==16440==    by 0x2EFA52: main (vl.c:4249)

Since pc_allocate_cpu_irq only requests one irq, so let it just call
qemu_allocate_irq.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/i386/pc.c         | 4 ++--
 hw/i386/pc_piix.c    | 4 +---
 hw/i386/pc_q35.c     | 4 +---
 include/hw/i386/pc.h | 2 +-
 4 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 769eb25..bb59a04 100644
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
index 5e4c0b8..f2b6ebd 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -86,7 +86,6 @@ static void pc_init1(MachineState *machine,
     ISABus *isa_bus;
     PCII440FXState *i440fx_state;
     int piix3_devfn = -1;
-    qemu_irq *cpu_irq;
     qemu_irq *gsi;
     qemu_irq *i8259;
     qemu_irq smi_irq;
@@ -220,8 +219,7 @@ static void pc_init1(MachineState *machine,
     } else if (xen_enabled()) {
         i8259 = xen_interrupt_controller_init();
     } else {
-        cpu_irq = pc_allocate_cpu_irq();
-        i8259 = i8259_init(isa_bus, cpu_irq[0]);
+        i8259 = i8259_init(isa_bus, pc_allocate_cpu_irq());
     }
 
     for (i = 0; i < ISA_NUM_IRQS; i++) {
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index e67f2de..f2e3cf7 100644
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
index 1b35168..6c6a45e 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -195,7 +195,7 @@ FWCfgState *pc_memory_init(MachineState *machine,
                            MemoryRegion *rom_memory,
                            MemoryRegion **ram_memory,
                            PcGuestInfo *guest_info);
-qemu_irq *pc_allocate_cpu_irq(void);
+qemu_irq pc_allocate_cpu_irq(void);
 DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
 void pc_basic_device_init(ISABus *isa_bus, qemu_irq *gsi,
                           ISADevice **rtc_state,
-- 
2.0.4



