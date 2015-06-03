Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z08Q0-0008Ui-Ij
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 09:09:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08Pu-0008Hu-CJ
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:09:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08Po-00053m-9q
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:09:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45301)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z08Pd-0004u9-Dz; Wed, 03 Jun 2015 09:08:53 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 635744079A;
	Wed,  3 Jun 2015 16:08:52 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 4941FA51;
	Wed,  3 Jun 2015 16:08:52 +0300 (MSK)
Received: (nullmailer pid 27422 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:25 +0300
Message-Id: <2ba154cf4eb8636cdd3aa90f392ca9e77206ca39.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 05/30] hw/i386/pc_piix: Fix memory leak
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
X-List-Received-Date: Wed, 03 Jun 2015 13:09:14 -0000

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
Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i386/pc_piix.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 6e7fa42..8d949a3 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -89,7 +89,7 @@ static void pc_init1(MachineState *machine)
     qemu_irq *cpu_irq;
     qemu_irq *gsi;
     qemu_irq *i8259;
-    qemu_irq *smi_irq;
+    qemu_irq smi_irq;
     GSIState *gsi_state;
     DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
     BusState *idebus[MAX_IDE_BUS];
@@ -227,6 +227,7 @@ static void pc_init1(MachineState *machine)
     for (i = 0; i < ISA_NUM_IRQS; i++) {
         gsi_state->i8259_irq[i] = i8259[i];
     }
+    g_free(i8259);
     if (pci_enabled) {
         ioapic_init_gsi(gsi_state, "i440fx");
     }
@@ -284,10 +285,10 @@ static void pc_init1(MachineState *machine)
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
2.1.4


