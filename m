Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yx408-0001Od-2M
	for mharc-qemu-trivial@gnu.org; Mon, 25 May 2015 21:49:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yx405-0001LP-R2
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 21:49:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yx404-00034p-3G
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 21:49:49 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:24407)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yx403-00034V-Gr; Mon, 25 May 2015 21:49:48 -0400
Received: from 172.24.2.119 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BGN88726; Tue, 26 May 2015 09:46:27 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml427-hub.china.huawei.com (10.82.67.182) with Microsoft SMTP
	Server id 14.3.158.1; Tue, 26 May 2015 09:46:18 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 26 May 2015 09:46:05 +0800
Message-ID: <1432604767-5964-2-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432604767-5964-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432604767-5964-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.5563D073.010A, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: d722a8d7b451eebc97a8edc34edc89d1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH v2 1/3] hw/i386/pc_piix: Fix memory leak
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
X-List-Received-Date: Tue, 26 May 2015 01:49:50 -0000

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
 hw/i386/pc_piix.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 1fe7bfb..d567887 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -89,7 +89,7 @@ static void pc_init1(MachineState *machine,
     qemu_irq *cpu_irq;
     qemu_irq *gsi;
     qemu_irq *i8259;
-    qemu_irq *smi_irq;
+    qemu_irq smi_irq;
     GSIState *gsi_state;
     DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
     BusState *idebus[MAX_IDE_BUS];
@@ -227,6 +227,7 @@ static void pc_init1(MachineState *machine,
     for (i = 0; i < ISA_NUM_IRQS; i++) {
         gsi_state->i8259_irq[i] = i8259[i];
     }
+    g_free(i8259);
     if (pci_enabled) {
         ioapic_init_gsi(gsi_state, "i440fx");
     }
@@ -284,10 +285,10 @@ static void pc_init1(MachineState *machine,
         DeviceState *piix4_pm;
         I2CBus *smbus;
 
-        smi_irq = qemu_allocate_irqs(pc_acpi_smi_interrupt, first_cpu, 1);
+        smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
         /* TODO: Populate SPD eeprom data.  */
         smbus = piix4_pm_init(pci_bus, piix3_devfn + 3, 0xb100,
-                              gsi[9], *smi_irq,
+                              gsi[9], smi_irq,
                               kvm_enabled(), fw_cfg, &piix4_pm);
         smbus_eeprom_init(smbus, 8, NULL, 0);
 
-- 
2.0.4



