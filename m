Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxweg-00033U-Fb
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:11:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxweO-0002Vj-T0
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:11:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxweK-0003kM-8e
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:11:04 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:45272)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yxwe6-0003cU-Od; Thu, 28 May 2015 08:10:47 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id COP98114; Thu, 28 May 2015 20:10:33 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:10:13 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:08:43 +0800
Message-ID: <1432814932-12608-21-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH 20/29] hw/unicore32/puv3.c: Fix memory leak
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
X-List-Received-Date: Thu, 28 May 2015 12:11:09 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==26001== 8 bytes in 1 blocks are definitely lost in loss record 234 of 1,038
==26001==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==26001==    by 0x1E1483: malloc_and_trace (vl.c:2556)
==26001==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==26001==    by 0x22D17B: qemu_extend_irqs (irq.c:55)
==26001==    by 0x22D207: qemu_allocate_irqs (irq.c:64)
==26001==    by 0x1BC56D: puv3_soc_init (puv3.c:49)
==26001==    by 0x1BC8B1: puv3_init (puv3.c:128)
==26001==    by 0x1E584E: main (vl.c:4249)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/unicore32/puv3.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/unicore32/puv3.c b/hw/unicore32/puv3.c
index cc9a21a..703e29d 100644
--- a/hw/unicore32/puv3.c
+++ b/hw/unicore32/puv3.c
@@ -40,15 +40,15 @@ static void puv3_intc_cpu_handler(void *opaque, int irq, int level)
 
 static void puv3_soc_init(CPUUniCore32State *env)
 {
-    qemu_irq *cpu_intc, irqs[PUV3_IRQS_NR];
+    qemu_irq cpu_intc, irqs[PUV3_IRQS_NR];
     DeviceState *dev;
     MemoryRegion *i8042 = g_new(MemoryRegion, 1);
     int i;
 
     /* Initialize interrupt controller */
-    cpu_intc = qemu_allocate_irqs(puv3_intc_cpu_handler,
-                                  uc32_env_get_cpu(env), 1);
-    dev = sysbus_create_simple("puv3_intc", PUV3_INTC_BASE, *cpu_intc);
+    cpu_intc = qemu_allocate_irq(puv3_intc_cpu_handler,
+                                 uc32_env_get_cpu(env), 0);
+    dev = sysbus_create_simple("puv3_intc", PUV3_INTC_BASE, cpu_intc);
     for (i = 0; i < PUV3_IRQS_NR; i++) {
         irqs[i] = qdev_get_gpio_in(dev, i);
     }
-- 
2.0.4



