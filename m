Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YyCqQ-0006uB-9n
	for mharc-qemu-trivial@gnu.org; Fri, 29 May 2015 01:28:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YyCqE-0006To-CC
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 01:28:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YyCqD-0005HY-Du
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 01:28:22 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:5294)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YyCq6-0005D1-Cq; Fri, 29 May 2015 01:28:14 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMB71953; Fri, 29 May 2015 13:28:05 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Fri, 29 May 2015 13:27:54 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 29 May 2015 13:27:02 +0800
Message-ID: <1432877231-5136-5-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432877231-5136-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432877231-5136-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, mjt@tls.msk.ru,
	shannon.zhao@linaro.org, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH v2 04/13] hw/timer/arm_timer.c: Fix misusing
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
X-List-Received-Date: Fri, 29 May 2015 05:28:24 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==16356== 32 bytes in 2 blocks are definitely lost in loss record 1,689 of 2,802
==16356==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==16356==    by 0x35478F: malloc_and_trace (vl.c:2556)
==16356==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==16356==    by 0x3ED94B: qemu_extend_irqs (irq.c:55)
==16356==    by 0x3ED9D7: qemu_allocate_irqs (irq.c:64)
==16356==    by 0x4BA8D1: sp804_init (arm_timer.c:285)
==16356==    by 0x3EEE1D: sysbus_device_init (sysbus.c:204)
==16356==    by 0x3E838D: device_realize (qdev.c:247)
==16356==    by 0x3EA48C: device_set_realized (qdev.c:1058)
==16356==    by 0x516CD2: property_set_bool (object.c:1514)
==16356==    by 0x5155CC: object_property_set (object.c:837)
==16356==    by 0x5178EE: object_property_set_qobject (qom-qobject.c:24)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/timer/arm_timer.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 1452910..d53f39a 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -280,14 +280,12 @@ static int sp804_init(SysBusDevice *sbd)
 {
     DeviceState *dev = DEVICE(sbd);
     SP804State *s = SP804(dev);
-    qemu_irq *qi;
 
-    qi = qemu_allocate_irqs(sp804_set_irq, s, 2);
     sysbus_init_irq(sbd, &s->irq);
     s->timer[0] = arm_timer_init(s->freq0);
     s->timer[1] = arm_timer_init(s->freq1);
-    s->timer[0]->irq = qi[0];
-    s->timer[1]->irq = qi[1];
+    s->timer[0]->irq = qemu_allocate_irq(sp804_set_irq, s, 0);
+    s->timer[1]->irq = qemu_allocate_irq(sp804_set_irq, s, 1);
     memory_region_init_io(&s->iomem, OBJECT(s), &sp804_ops, s,
                           "sp804", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
-- 
2.0.4



