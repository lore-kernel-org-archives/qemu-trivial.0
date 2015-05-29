Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YyCqP-0006sG-Go
	for mharc-qemu-trivial@gnu.org; Fri, 29 May 2015 01:28:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YyCqE-0006U3-FW
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 01:28:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YyCqD-0005HO-Cs
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 01:28:22 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:5295)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YyCq6-0005DE-EW; Fri, 29 May 2015 01:28:14 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMB71954; Fri, 29 May 2015 13:28:06 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Fri, 29 May 2015 13:27:56 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 29 May 2015 13:27:03 +0800
Message-ID: <1432877231-5136-6-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH v2 05/13] hw/intc/exynos4210_gic.c: Fix
	memory leak by adjusting order
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
X-List-Received-Date: Fri, 29 May 2015 05:28:23 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==17211== 784 (288 direct, 496 indirect) bytes in 4 blocks are definitely lost in loss record 3,018 of 3,201
==17211==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==17211==    by 0x35478F: malloc_and_trace (vl.c:2556)
==17211==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==17211==    by 0x5148DD: object_new_with_type (object.c:428)
==17211==    by 0x514939: object_new (object.c:439)
==17211==    by 0x3EDA38: qemu_allocate_irq (irq.c:71)
==17211==    by 0x3EDC2D: qemu_irq_split (irq.c:119)
==17211==    by 0x23D231: exynos4210_init_board_irqs (exynos4210_gic.c:216)
==17211==    by 0x293B00: exynos4210_init (exynos4210.c:250)
==17211==    by 0x27915A: exynos4_boards_init_common (exynos4_boards.c:127)
==17211==    by 0x2791D9: smdkc210_init (exynos4_boards.c:140)
==17211==    by 0x358B5A: main (vl.c:4249)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/intc/exynos4210_gic.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index 0590d5d..b2a4950 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -213,9 +213,6 @@ void exynos4210_init_board_irqs(Exynos4210Irq *s)
     uint32_t grp, bit, irq_id, n;
 
     for (n = 0; n < EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ; n++) {
-        s->board_irqs[n] = qemu_irq_split(s->int_combiner_irq[n],
-                s->ext_combiner_irq[n]);
-
         irq_id = 0;
         if (n == EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 4) ||
                 n == EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 4)) {
@@ -230,8 +227,10 @@ void exynos4210_init_board_irqs(Exynos4210Irq *s)
         if (irq_id) {
             s->board_irqs[n] = qemu_irq_split(s->int_combiner_irq[n],
                     s->ext_gic_irq[irq_id-32]);
+        } else {
+            s->board_irqs[n] = qemu_irq_split(s->int_combiner_irq[n],
+                    s->ext_combiner_irq[n]);
         }
-
     }
     for (; n < EXYNOS4210_MAX_INT_COMBINER_IN_IRQ; n++) {
         /* these IDs are passed to Internal Combiner and External GIC */
-- 
2.0.4



