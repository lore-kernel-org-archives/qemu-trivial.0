Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxwgG-000653-6y
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:13:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59350)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxwgA-0005tl-NV
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:12:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yxwg6-0004YA-Ut
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:12:54 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:42880)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yxwfy-0004WW-LK; Thu, 28 May 2015 08:12:43 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMA92695; Thu, 28 May 2015 20:12:35 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:10:24 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:08:52 +0800
Message-ID: <1432814932-12608-30-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, mjt@tls.msk.ru,
	shannon.zhao@linaro.org, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH 29/29] hw/s390x/sclpcpu.c: Fix memory leak
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
X-List-Received-Date: Thu, 28 May 2015 12:12:58 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==1413== 188 (8 direct, 180 indirect) bytes in 1 blocks are definitely lost in loss record 951 of 1,199
==1413==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==1413==    by 0x262D8B: malloc_and_trace (vl.c:2556)
==1413==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==1413==    by 0x2C7ACF: qemu_extend_irqs (irq.c:55)
==1413==    by 0x2C7B5B: qemu_allocate_irqs (irq.c:64)
==1413==    by 0x2168F4: irq_cpu_hotplug_init (sclpcpu.c:84)
==1413==    by 0x21623F: event_realize (event-facility.c:385)
==1413==    by 0x2C4610: device_set_realized (qdev.c:1058)
==1413==    by 0x317DDA: property_set_bool (object.c:1514)
==1413==    by 0x3166D4: object_property_set (object.c:837)
==1413==    by 0x3189F6: object_property_set_qobject (qom-qobject.c:24)
==1413==    by 0x316943: object_property_set_bool (object.c:905)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/s390x/sclpcpu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/s390x/sclpcpu.c b/hw/s390x/sclpcpu.c
index 2fe8b5a..1090e2f 100644
--- a/hw/s390x/sclpcpu.c
+++ b/hw/s390x/sclpcpu.c
@@ -25,13 +25,13 @@ typedef struct ConfigMgtData {
     uint8_t event_qualifier;
 } QEMU_PACKED ConfigMgtData;
 
-static qemu_irq *irq_cpu_hotplug; /* Only used in this file */
+static qemu_irq irq_cpu_hotplug; /* Only used in this file */
 
 #define EVENT_QUAL_CPU_CHANGE  1
 
 void raise_irq_cpu_hotplug(void)
 {
-    qemu_irq_raise(*irq_cpu_hotplug);
+    qemu_irq_raise(irq_cpu_hotplug);
 }
 
 static unsigned int send_mask(void)
@@ -81,7 +81,10 @@ static void trigger_signal(void *opaque, int n, int level)
 
 static int irq_cpu_hotplug_init(SCLPEvent *event)
 {
-    irq_cpu_hotplug = qemu_allocate_irqs(trigger_signal, event, 1);
+    qemu_irq irq = qemu_allocate_irq(trigger_signal, event, 0);
+
+    irq_cpu_hotplug = irq;
+    qemu_free_irq(irq);
     return 0;
 }
 
-- 
2.0.4



