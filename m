Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YyCqT-00070R-A7
	for mharc-qemu-trivial@gnu.org; Fri, 29 May 2015 01:28:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YyCqM-0006m9-QZ
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 01:28:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YyCqI-0005KI-PV
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 01:28:30 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:5373)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YyCqG-0005IV-8j; Fri, 29 May 2015 01:28:24 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMB71967; Fri, 29 May 2015 13:28:16 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Fri, 29 May 2015 13:28:07 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 29 May 2015 13:27:11 +0800
Message-ID: <1432877231-5136-14-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH v2 13/13] hw/display/tc6393xb.c: Fix misusing
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
X-List-Received-Date: Fri, 29 May 2015 05:28:31 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==3169== 8 bytes in 1 blocks are definitely lost in loss record 424 of 2,779
==3169==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==3169==    by 0x3547D3: malloc_and_trace (vl.c:2556)
==3169==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==3169==    by 0x3ED9CF: qemu_extend_irqs (irq.c:55)
==3169==    by 0x3EDA5B: qemu_allocate_irqs (irq.c:64)
==3169==    by 0x426F74: tc6393xb_init (tc6393xb.c:574)
==3169==    by 0x28B7B4: tosa_init (tosa.c:235)
==3169==    by 0x358B9E: main (vl.c:4249)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/display/tc6393xb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
index 66b7ade..f5f3f3e 100644
--- a/hw/display/tc6393xb.c
+++ b/hw/display/tc6393xb.c
@@ -571,7 +571,7 @@ TC6393xbState *tc6393xb_init(MemoryRegion *sysmem, uint32_t base, qemu_irq irq)
     s->irq = irq;
     s->gpio_in = qemu_allocate_irqs(tc6393xb_gpio_set, s, TC6393XB_GPIOS);
 
-    s->l3v = *qemu_allocate_irqs(tc6393xb_l3v, s, 1);
+    s->l3v = qemu_allocate_irq(tc6393xb_l3v, s, 0);
     s->blanked = 1;
 
     s->sub_irqs = qemu_allocate_irqs(tc6393xb_sub_irq, s, TC6393XB_NR_IRQS);
-- 
2.0.4



