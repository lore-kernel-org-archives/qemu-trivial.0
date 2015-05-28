Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxweV-0002id-V7
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:11:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxweD-0002K5-V0
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:10:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yxwe8-0003e9-C3
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:10:53 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:45242)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yxwdy-0003Uz-21; Thu, 28 May 2015 08:10:38 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id COP98095; Thu, 28 May 2015 20:10:30 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:10:00 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:08:32 +0800
Message-ID: <1432814932-12608-10-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, mjt@tls.msk.ru,
	shannon.zhao@linaro.org, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH 09/29] hw/sparc/leon3.c: Fix memory leak
	spotted by valgrind
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
X-List-Received-Date: Thu, 28 May 2015 12:10:59 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==21199== 2,468 (128 direct, 2,340 indirect) bytes in 1 blocks are definitely lost in loss record 1,094 of 1,125
==21199==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==21199==    by 0x21B933: malloc_and_trace (vl.c:2556)
==21199==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==21199==    by 0x2700D3: qemu_extend_irqs (irq.c:55)
==21199==    by 0x27015F: qemu_allocate_irqs (irq.c:64)
==21199==    by 0x1ED14D: grlib_irqmp_create (grlib.h:64)
==21199==    by 0x1ED6B9: leon3_generic_hw_init (leon3.c:142)
==21199==    by 0x21FCFE: main (vl.c:4249)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/sparc/leon3.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index 7f5dcd6..c449b39 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -111,7 +111,7 @@ static void leon3_generic_hw_init(MachineState *machine)
     MemoryRegion *address_space_mem = get_system_memory();
     MemoryRegion *ram = g_new(MemoryRegion, 1);
     MemoryRegion *prom = g_new(MemoryRegion, 1);
-    int         ret;
+    int         ret, i;
     char       *filename;
     qemu_irq   *cpu_irqs = NULL;
     int         bios_size;
@@ -214,6 +214,13 @@ static void leon3_generic_hw_init(MachineState *machine)
     if (serial_hds[0]) {
         grlib_apbuart_create(0x80000100, serial_hds[0], cpu_irqs[3]);
     }
+
+    for (i = 0; i < MAX_PILS; i++) {
+        if ((i != 3) || (i != 6) || (i != 7)) {
+            qemu_free_irq(cpu_irqs[i]);
+        }
+    }
+    g_free(cpu_irqs);
 }
 
 static QEMUMachine leon3_generic_machine = {
-- 
2.0.4



