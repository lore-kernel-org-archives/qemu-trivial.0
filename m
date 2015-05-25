Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ywnvm-0002Li-JL
	for mharc-qemu-trivial@gnu.org; Mon, 25 May 2015 04:40:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Ywnvg-0002HC-SY
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 04:40:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Ywnvc-0001CI-Tr
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 04:40:12 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:22106)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Ywnvc-00016D-C2; Mon, 25 May 2015 04:40:08 -0400
Received: from 172.24.2.119 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CLV99027; Mon, 25 May 2015 16:39:57 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml427-hub.china.huawei.com (10.82.67.182) with Microsoft SMTP
	Server id 14.3.158.1; Mon, 25 May 2015 16:38:07 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 25 May 2015 16:37:55 +0800
Message-ID: <1432543077-12656-2-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432543077-12656-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432543077-12656-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH 1/3] hw/i386/pc_piix: Fix memory leak
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
X-List-Received-Date: Mon, 25 May 2015 08:40:16 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==16447== 8 bytes in 1 blocks are definitely lost in loss record 552 of 3,310
==16447==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==16447==    by 0x2E4FD7: malloc_and_trace (vl.c:2546)
==16447==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==16447==    by 0x36FB47: qemu_extend_irqs (irq.c:55)
==16447==    by 0x36FBD3: qemu_allocate_irqs (irq.c:64)
==16447==    by 0x24E622: pc_init1 (pc_piix.c:287)
==16447==    by 0x24E76A: pc_init_pci (pc_piix.c:310)
==16447==    by 0x2E9360: main (vl.c:4226)

==16447== 128 bytes in 1 blocks are definitely lost in loss record 2,569 of 3,310
==16447==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==16447==    by 0x2E4FD7: malloc_and_trace (vl.c:2546)
==16447==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==16447==    by 0x36FB47: qemu_extend_irqs (irq.c:55)
==16447==    by 0x36FBD3: qemu_allocate_irqs (irq.c:64)
==16447==    by 0x25BEB2: kvm_i8259_init (i8259.c:133)
==16447==    by 0x24E1F1: pc_init1 (pc_piix.c:219)
==16447==    by 0x24E76A: pc_init_pci (pc_piix.c:310)
==16447==    by 0x2E9360: main (vl.c:4226)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/i386/pc_piix.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 1fe7bfb..49d87ee 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -227,6 +227,7 @@ static void pc_init1(MachineState *machine,
     for (i = 0; i < ISA_NUM_IRQS; i++) {
         gsi_state->i8259_irq[i] = i8259[i];
     }
+    g_free(i8259);
     if (pci_enabled) {
         ioapic_init_gsi(gsi_state, "i440fx");
     }
@@ -289,6 +290,7 @@ static void pc_init1(MachineState *machine,
         smbus = piix4_pm_init(pci_bus, piix3_devfn + 3, 0xb100,
                               gsi[9], *smi_irq,
                               kvm_enabled(), fw_cfg, &piix4_pm);
+        g_free(smi_irq);
         smbus_eeprom_init(smbus, 8, NULL, 0);
 
         object_property_add_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
-- 
2.0.4



