Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YyCqS-0006zp-V3
	for mharc-qemu-trivial@gnu.org; Fri, 29 May 2015 01:28:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YyCqE-0006UD-IX
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 01:28:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YyCqD-0005HS-DA
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 01:28:22 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:21702)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YyCqA-0005EX-67; Fri, 29 May 2015 01:28:18 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BGS73957; Fri, 29 May 2015 13:28:11 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Fri, 29 May 2015 13:27:59 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 29 May 2015 13:27:06 +0800
Message-ID: <1432877231-5136-9-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432877231-5136-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432877231-5136-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.5567F8EB.0149, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: c8b9bf6addbbe3eb785b93e9bc45d847
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, mjt@tls.msk.ru,
	shannon.zhao@linaro.org, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH v2 08/13] hw/lm32/lm32_boards.c: Fix misusing
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
X-List-Received-Date: Fri, 29 May 2015 05:28:27 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==8662== 8 bytes in 1 blocks are definitely lost in loss record 228 of 1,108
==8662==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==8662==    by 0x1E77EB: malloc_and_trace (vl.c:2556)
==8662==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==8662==    by 0x238C47: qemu_extend_irqs (irq.c:55)
==8662==    by 0x238CD3: qemu_allocate_irqs (irq.c:64)
==8662==    by 0x1C32FC: lm32_evr_init (lm32_boards.c:126)
==8662==    by 0x1EBBB6: main (vl.c:4249)

==12877== 8 bytes in 1 blocks are definitely lost in loss record 209 of 1,042
==12877==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==12877==    by 0x1E77E7: malloc_and_trace (vl.c:2556)
==12877==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==12877==    by 0x238C43: qemu_extend_irqs (irq.c:55)
==12877==    by 0x238CCF: qemu_allocate_irqs (irq.c:64)
==12877==    by 0x1C384E: lm32_uclinux_init (lm32_boards.c:228)
==12877==    by 0x1EBBB2: main (vl.c:4249)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/lm32/lm32_boards.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/lm32/lm32_boards.c b/hw/lm32/lm32_boards.c
index 14d0efc..70f48d3 100644
--- a/hw/lm32/lm32_boards.c
+++ b/hw/lm32/lm32_boards.c
@@ -78,7 +78,7 @@ static void lm32_evr_init(MachineState *machine)
     DriveInfo *dinfo;
     MemoryRegion *address_space_mem =  get_system_memory();
     MemoryRegion *phys_ram = g_new(MemoryRegion, 1);
-    qemu_irq *cpu_irq, irq[32];
+    qemu_irq irq[32];
     ResetInfo *reset_info;
     int i;
 
@@ -123,8 +123,7 @@ static void lm32_evr_init(MachineState *machine)
                           1, 2, 0x01, 0x7e, 0x43, 0x00, 0x555, 0x2aa, 1);
 
     /* create irq lines */
-    cpu_irq = qemu_allocate_irqs(cpu_irq_handler, cpu, 1);
-    env->pic_state = lm32_pic_init(*cpu_irq);
+    env->pic_state = lm32_pic_init(qemu_allocate_irq(cpu_irq_handler, cpu, 0));
     for (i = 0; i < 32; i++) {
         irq[i] = qdev_get_gpio_in(env->pic_state, i);
     }
@@ -173,7 +172,7 @@ static void lm32_uclinux_init(MachineState *machine)
     DriveInfo *dinfo;
     MemoryRegion *address_space_mem =  get_system_memory();
     MemoryRegion *phys_ram = g_new(MemoryRegion, 1);
-    qemu_irq *cpu_irq, irq[32];
+    qemu_irq irq[32];
     HWSetup *hw;
     ResetInfo *reset_info;
     int i;
@@ -225,8 +224,7 @@ static void lm32_uclinux_init(MachineState *machine)
                           1, 2, 0x01, 0x7e, 0x43, 0x00, 0x555, 0x2aa, 1);
 
     /* create irq lines */
-    cpu_irq = qemu_allocate_irqs(cpu_irq_handler, env, 1);
-    env->pic_state = lm32_pic_init(*cpu_irq);
+    env->pic_state = lm32_pic_init(qemu_allocate_irq(cpu_irq_handler, env, 0));
     for (i = 0; i < 32; i++) {
         irq[i] = qdev_get_gpio_in(env->pic_state, i);
     }
-- 
2.0.4



