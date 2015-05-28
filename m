Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxwff-0004vR-Or
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:12:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxwfZ-0004ih-5X
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:12:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxwfV-0004QU-Dg
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:12:17 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:42474)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YxwfM-0004KE-Bu; Thu, 28 May 2015 08:12:05 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMA92614; Thu, 28 May 2015 20:11:53 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:10:16 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:08:46 +0800
Message-ID: <1432814932-12608-24-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH 23/29] hw/arm/nseries.c: Fix memory leak
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
X-List-Received-Date: Thu, 28 May 2015 12:12:21 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==4835== 8 bytes in 1 blocks are definitely lost in loss record 509 of 3,278
==4835==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==4835==    by 0x354793: malloc_and_trace (vl.c:2556)
==4835==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==4835==    by 0x3ED98F: qemu_extend_irqs (irq.c:55)
==4835==    by 0x3EDA1B: qemu_allocate_irqs (irq.c:64)
==4835==    by 0x280261: n8x0_gpio_setup (nseries.c:136)
==4835==    by 0x2830AB: n8x0_init (nseries.c:1337)
==4835==    by 0x2832D6: n800_init (nseries.c:1409)
==4835==    by 0x358B5E: main (vl.c:4249)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/nseries.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index d243159..2e392a9 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -133,8 +133,8 @@ static void n800_mmc_cs_cb(void *opaque, int line, int level)
 
 static void n8x0_gpio_setup(struct n800_s *s)
 {
-    qemu_irq *mmc_cs = qemu_allocate_irqs(n800_mmc_cs_cb, s->mpu->mmc, 1);
-    qdev_connect_gpio_out(s->mpu->gpio, N8X0_MMC_CS_GPIO, mmc_cs[0]);
+    qemu_irq mmc_cs = qemu_allocate_irq(n800_mmc_cs_cb, s->mpu->mmc, 0);
+    qdev_connect_gpio_out(s->mpu->gpio, N8X0_MMC_CS_GPIO, mmc_cs);
 
     qemu_irq_lower(qdev_get_gpio_in(s->mpu->gpio, N800_BAT_COVER_GPIO));
 }
-- 
2.0.4



