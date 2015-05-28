Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxwec-0002w6-Ka
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:11:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxweK-0002PA-Ap
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:11:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxweE-0003hV-FZ
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:11:00 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:45233)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yxwdz-0003VU-Iz; Thu, 28 May 2015 08:10:41 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id COP98092; Thu, 28 May 2015 20:10:29 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:09:58 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:08:30 +0800
Message-ID: <1432814932-12608-8-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH 07/29] hw/timer/arm_timer.c: Fix memory leak
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
X-List-Received-Date: Thu, 28 May 2015 12:11:06 -0000

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
 hw/timer/arm_timer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 1452910..6894f76 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -288,6 +288,7 @@ static int sp804_init(SysBusDevice *sbd)
     s->timer[1] = arm_timer_init(s->freq1);
     s->timer[0]->irq = qi[0];
     s->timer[1]->irq = qi[1];
+    g_free(qi);
     memory_region_init_io(&s->iomem, OBJECT(s), &sp804_ops, s,
                           "sp804", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
-- 
2.0.4



