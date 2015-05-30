Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yybc5-0005H9-Q8
	for mharc-qemu-trivial@gnu.org; Sat, 30 May 2015 03:55:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yybc2-0005EC-JZ
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 03:55:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yybbz-000888-BW
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 03:55:22 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:38789)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yybby-00087a-JT; Sat, 30 May 2015 03:55:19 -0400
Received: from 172.24.2.119 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id COS15542; Sat, 30 May 2015 15:55:06 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml431-hub.china.huawei.com (10.82.67.208) with Microsoft SMTP
	Server id 14.3.158.1; Sat, 30 May 2015 15:54:58 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 30 May 2015 15:54:32 +0800
Message-ID: <1432972477-13504-3-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH v2 2/7] hw/mips/mips_jazz.c: Store irq array
	in MachineState to fix memory leak
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

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/mips/mips_jazz.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
index 2c153e0..259458b 100644
--- a/hw/mips/mips_jazz.c
+++ b/hw/mips/mips_jazz.c
@@ -135,7 +135,7 @@ static void mips_jazz_init(MachineState *machine,
     MIPSCPU *cpu;
     CPUClass *cc;
     CPUMIPSState *env;
-    qemu_irq *rc4030, *i8259;
+    qemu_irq *i8259;
     rc4030_dma *dmas;
     void* rc4030_opaque;
     MemoryRegion *isa_mem = g_new(MemoryRegion, 1);
@@ -218,7 +218,7 @@ static void mips_jazz_init(MachineState *machine,
     cpu_mips_clock_init(env);
 
     /* Chipset */
-    rc4030_opaque = rc4030_init(env->irq[6], env->irq[3], &rc4030, &dmas,
+    rc4030_opaque = rc4030_init(env->irq[6], env->irq[3], &machine->irqs, &dmas,
                                 address_space);
     memory_region_init_io(dma_dummy, NULL, &dma_dummy_ops, NULL, "dummy_dma", 0x1000);
     memory_region_add_subregion(address_space, 0x8000d000, dma_dummy);
@@ -246,7 +246,7 @@ static void mips_jazz_init(MachineState *machine,
         sysbus = SYS_BUS_DEVICE(dev);
         sysbus_mmio_map(sysbus, 0, 0x60080000);
         sysbus_mmio_map(sysbus, 1, 0x40000000);
-        sysbus_connect_irq(sysbus, 0, rc4030[3]);
+        sysbus_connect_irq(sysbus, 0, machine->irqs[3]);
         {
             /* Simple ROM, so user doesn't have to provide one */
             MemoryRegion *rom_mr = g_new(MemoryRegion, 1);
@@ -272,8 +272,8 @@ static void mips_jazz_init(MachineState *machine,
         if (!nd->model)
             nd->model = g_strdup("dp83932");
         if (strcmp(nd->model, "dp83932") == 0) {
-            dp83932_init(nd, 0x80001000, 2, get_system_memory(), rc4030[4],
-                         rc4030_opaque, rc4030_dma_memory_rw);
+            dp83932_init(nd, 0x80001000, 2, get_system_memory(),
+                         machine->irqs[4], rc4030_opaque, rc4030_dma_memory_rw);
             break;
         } else if (is_help_option(nd->model)) {
             fprintf(stderr, "qemu: Supported NICs: dp83932\n");
@@ -287,7 +287,7 @@ static void mips_jazz_init(MachineState *machine,
     /* SCSI adapter */
     esp_init(0x80002000, 0,
              rc4030_dma_read, rc4030_dma_write, dmas[0],
-             rc4030[5], &esp_reset, &dma_enable);
+             machine->irqs[5], &esp_reset, &dma_enable);
 
     /* Floppy */
     if (drive_get_max_bus(IF_FLOPPY) >= MAX_FD) {
@@ -297,7 +297,7 @@ static void mips_jazz_init(MachineState *machine,
     for (n = 0; n < MAX_FD; n++) {
         fds[n] = drive_get(IF_FLOPPY, 0, n);
     }
-    fdctrl_init_sysbus(rc4030[1], 0, 0x80003000, fds);
+    fdctrl_init_sysbus(machine->irqs[1], 0, 0x80003000, fds);
 
     /* Real time clock */
     rtc_init(isa_bus, 1980, NULL);
@@ -305,25 +305,25 @@ static void mips_jazz_init(MachineState *machine,
     memory_region_add_subregion(address_space, 0x80004000, rtc);
 
     /* Keyboard (i8042) */
-    i8042_mm_init(rc4030[6], rc4030[7], i8042, 0x1000, 0x1);
+    i8042_mm_init(machine->irqs[6], machine->irqs[7], i8042, 0x1000, 0x1);
     memory_region_add_subregion(address_space, 0x80005000, i8042);
 
     /* Serial ports */
     if (serial_hds[0]) {
-        serial_mm_init(address_space, 0x80006000, 0, rc4030[8], 8000000/16,
-                       serial_hds[0], DEVICE_NATIVE_ENDIAN);
+        serial_mm_init(address_space, 0x80006000, 0, machine->irqs[8],
+                       8000000/16, serial_hds[0], DEVICE_NATIVE_ENDIAN);
     }
     if (serial_hds[1]) {
-        serial_mm_init(address_space, 0x80007000, 0, rc4030[9], 8000000/16,
-                       serial_hds[1], DEVICE_NATIVE_ENDIAN);
+        serial_mm_init(address_space, 0x80007000, 0, machine->irqs[9],
+                       8000000/16, serial_hds[1], DEVICE_NATIVE_ENDIAN);
     }
 
     /* Parallel port */
     if (parallel_hds[0])
-        parallel_mm_init(address_space, 0x80008000, 0, rc4030[0],
+        parallel_mm_init(address_space, 0x80008000, 0, machine->irqs[0],
                          parallel_hds[0]);
 
-    /* FIXME: missing Jazz sound at 0x8000c000, rc4030[2] */
+    /* FIXME: missing Jazz sound at 0x8000c000, machine->irqs[2] */
 
     /* NVRAM */
     dev = qdev_create(NULL, "ds1225y");
-- 
2.0.4



