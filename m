Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxwea-0002rk-PN
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:11:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxweI-0002Mo-HD
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:11:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxweD-0003gX-4H
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:10:58 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:45246)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yxwe0-0003VH-3o; Thu, 28 May 2015 08:10:40 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id COP98103; Thu, 28 May 2015 20:10:31 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:10:09 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:08:40 +0800
Message-ID: <1432814932-12608-18-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH 17/29] hw/lm32/milkymist.c: Fix memory leak
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
==20652== 8 bytes in 1 blocks are definitely lost in loss record 252 of 1,314
==20652==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==20652==    by 0x1E77E7: malloc_and_trace (vl.c:2556)
==20652==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==20652==    by 0x238C43: qemu_extend_irqs (irq.c:55)
==20652==    by 0x238CCF: qemu_allocate_irqs (irq.c:64)
==20652==    by 0x1C49AD: milkymist_init (milkymist.c:133)
==20652==    by 0x1EBBB2: main (vl.c:4249)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/lm32/milkymist.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
index e0cec7d..4b8284f 100644
--- a/hw/lm32/milkymist.c
+++ b/hw/lm32/milkymist.c
@@ -86,7 +86,7 @@ milkymist_init(MachineState *machine)
     DriveInfo *dinfo;
     MemoryRegion *address_space_mem = get_system_memory();
     MemoryRegion *phys_sdram = g_new(MemoryRegion, 1);
-    qemu_irq irq[32], *cpu_irq;
+    qemu_irq irq[32], cpu_irq;
     int i;
     char *bios_filename;
     ResetInfo *reset_info;
@@ -130,8 +130,8 @@ milkymist_init(MachineState *machine)
                           2, 0x00, 0x89, 0x00, 0x1d, 1);
 
     /* create irq lines */
-    cpu_irq = qemu_allocate_irqs(cpu_irq_handler, cpu, 1);
-    env->pic_state = lm32_pic_init(*cpu_irq);
+    cpu_irq = qemu_allocate_irq(cpu_irq_handler, cpu, 0);
+    env->pic_state = lm32_pic_init(cpu_irq);
     for (i = 0; i < 32; i++) {
         irq[i] = qdev_get_gpio_in(env->pic_state, i);
     }
-- 
2.0.4



