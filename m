Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxweb-0002ty-Re
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:11:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxweJ-0002OR-7d
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:11:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxweE-0003hH-0K
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:10:59 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:45279)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yxwe3-0003ZD-RD; Thu, 28 May 2015 08:10:44 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id COP98111; Thu, 28 May 2015 20:10:33 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:10:07 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:08:38 +0800
Message-ID: <1432814932-12608-16-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH 15/29] hw/mips/mips_jazz.c: Fix memory leak
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
X-List-Received-Date: Thu, 28 May 2015 12:11:03 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==28487== 1,568 (128 direct, 1,440 indirect) bytes in 1 blocks are definitely lost in loss record 2,160 of 2,212
==28487==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==28487==    by 0x2F5B97: malloc_and_trace (vl.c:2556)
==28487==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==28487==    by 0x384303: qemu_extend_irqs (irq.c:55)
==28487==    by 0x38438F: qemu_allocate_irqs (irq.c:64)
==28487==    by 0x3B81DD: rc4030_init (rc4030.c:806)
==28487==    by 0x240151: mips_jazz_init (mips_jazz.c:221)
==28487==    by 0x240898: mips_magnum_init (mips_jazz.c:341)
==28487==    by 0x2F9F62: main (vl.c:4249)

==28487== 32 bytes in 1 blocks are definitely lost in loss record 1,359 of 2,212
==28487==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==28487==    by 0x2F5B97: malloc_and_trace (vl.c:2556)
==28487==    by 0x64C71F5: ??? (in /usr/lib64/libglib-2.0.so.0.3600.3)
==28487==    by 0x64C7766: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.3600.3)
==28487==    by 0x3B8132: rc4030_allocate_dmas (rc4030.c:787)
==28487==    by 0x3B81F5: rc4030_init (rc4030.c:807)
==28487==    by 0x240151: mips_jazz_init (mips_jazz.c:221)
==28487==    by 0x240898: mips_magnum_init (mips_jazz.c:341)
==28487==    by 0x2F9F62: main (vl.c:4249)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/dma/rc4030.c     |  2 +-
 hw/mips/mips_jazz.c | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/dma/rc4030.c b/hw/dma/rc4030.c
index af26632..9b42aab 100644
--- a/hw/dma/rc4030.c
+++ b/hw/dma/rc4030.c
@@ -803,7 +803,7 @@ void *rc4030_init(qemu_irq timer, qemu_irq jazz_bus,
 
     s = g_malloc0(sizeof(rc4030State));
 
-    *irqs = qemu_allocate_irqs(rc4030_irq_jazz_request, s, 16);
+    *irqs = qemu_allocate_irqs(rc4030_irq_jazz_request, s, 10);
     *dmas = rc4030_allocate_dmas(s, 4);
 
     s->periodic_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, rc4030_periodic_timer, s);
diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
index 2c153e0..cd26f60 100644
--- a/hw/mips/mips_jazz.c
+++ b/hw/mips/mips_jazz.c
@@ -261,8 +261,10 @@ static void mips_jazz_init(MachineState *machine,
         break;
     case JAZZ_PICA61:
         isa_vga_mm_init(0x40000000, 0x60000000, 0, get_system_memory());
+        qemu_free_irq(rc4030[3]);
         break;
     default:
+        qemu_free_irq(rc4030[3]);
         break;
     }
 
@@ -288,6 +290,7 @@ static void mips_jazz_init(MachineState *machine,
     esp_init(0x80002000, 0,
              rc4030_dma_read, rc4030_dma_write, dmas[0],
              rc4030[5], &esp_reset, &dma_enable);
+    g_free(dmas);
 
     /* Floppy */
     if (drive_get_max_bus(IF_FLOPPY) >= MAX_FD) {
@@ -312,18 +315,28 @@ static void mips_jazz_init(MachineState *machine,
     if (serial_hds[0]) {
         serial_mm_init(address_space, 0x80006000, 0, rc4030[8], 8000000/16,
                        serial_hds[0], DEVICE_NATIVE_ENDIAN);
+    } else {
+        qemu_free_irq(rc4030[8]);
     }
+
     if (serial_hds[1]) {
         serial_mm_init(address_space, 0x80007000, 0, rc4030[9], 8000000/16,
                        serial_hds[1], DEVICE_NATIVE_ENDIAN);
+    } else {
+        qemu_free_irq(rc4030[9]);
     }
 
     /* Parallel port */
-    if (parallel_hds[0])
+    if (parallel_hds[0]) {
         parallel_mm_init(address_space, 0x80008000, 0, rc4030[0],
                          parallel_hds[0]);
+    } else {
+        qemu_free_irq(rc4030[0]);
+    }
 
     /* FIXME: missing Jazz sound at 0x8000c000, rc4030[2] */
+    qemu_free_irq(rc4030[2]);
+    g_free(rc4030);
 
     /* NVRAM */
     dev = qdev_create(NULL, "ds1225y");
-- 
2.0.4



