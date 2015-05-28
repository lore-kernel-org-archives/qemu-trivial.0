Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxwfe-0004tB-KD
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:12:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxwfY-0004gZ-6M
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:12:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxwfU-0004Pp-Fm
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:12:16 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:42475)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YxwfM-0004KH-D3; Thu, 28 May 2015 08:12:04 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMA92612; Thu, 28 May 2015 20:11:53 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:10:19 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:08:48 +0800
Message-ID: <1432814932-12608-26-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH 25/29] hw/arm/palm.c: Fix memory leak spotted
	by valgrind
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
X-List-Received-Date: Thu, 28 May 2015 12:12:20 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==27206== 56 bytes in 1 blocks are definitely lost in loss record 2,000 of 3,127
==27206==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==27206==    by 0x35479F: malloc_and_trace (vl.c:2556)
==27206==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==27206==    by 0x3ED99B: qemu_extend_irqs (irq.c:55)
==27206==    by 0x3EDA27: qemu_allocate_irqs (irq.c:64)
==27206==    by 0x283C8B: palmte_gpio_setup (palm.c:168)
==27206==    by 0x2840FA: palmte_init (palm.c:239)
==27206==    by 0x358B6A: main (vl.c:4249)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/palm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index 7f1cfb8..4e00695 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -173,6 +173,7 @@ static void palmte_gpio_setup(struct omap_mpu_state_s *cpu)
     qdev_connect_gpio_out(cpu->gpio, 13,			misc_gpio[4]);
     omap_mpuio_out_set(cpu->mpuio, 1,				misc_gpio[5]);
     omap_mpuio_out_set(cpu->mpuio, 3,				misc_gpio[6]);
+    g_free(misc_gpio);
 
     /* Reset some inputs to initial state.  */
     qemu_irq_lower(qdev_get_gpio_in(cpu->gpio, PALMTE_USBDETECT_GPIO));
-- 
2.0.4



