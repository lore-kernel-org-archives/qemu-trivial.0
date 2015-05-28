Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxwff-0004uZ-4s
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:12:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxwfY-0004h2-DN
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:12:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxwfU-0004Q1-Mj
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:12:16 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:42478)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YxwfM-0004KP-EF; Thu, 28 May 2015 08:12:04 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMA92611; Thu, 28 May 2015 20:11:52 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:10:14 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:08:44 +0800
Message-ID: <1432814932-12608-22-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH 21/29] hw/sh4/r2d.c: Fix memory leak spotted
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
==29844== 1,364 (104 direct, 1,260 indirect) bytes in 1 blocks are definitely lost in loss record 2,143 of 2,205
==29844==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==29844==    by 0x25096F: malloc_and_trace (vl.c:2556)
==29844==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==29844==    by 0x2C7CDB: qemu_extend_irqs (irq.c:55)
==29844==    by 0x2C7D67: qemu_allocate_irqs (irq.c:64)
==29844==    by 0x2167ED: r2d_fpga_init (r2d.c:191)
==29844==    by 0x2169CC: r2d_init (r2d.c:263)
==29844==    by 0x254D3A: main (vl.c:4249)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/sh4/r2d.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 4221060..594c733 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -287,6 +287,16 @@ static void r2d_init(MachineState *machine)
     sysbus_mmio_map(busdev, 1, 0x1400080c);
     mmio_ide_init_drives(dev, dinfo, NULL);
 
+    /* free unused irq */
+    qemu_free_irq(irq[CF_CD]);
+    qemu_free_irq(irq[KEY]);
+    qemu_free_irq(irq[RTC_A]);
+    qemu_free_irq(irq[RTC_T]);
+    qemu_free_irq(irq[SDCARD]);
+    qemu_free_irq(irq[EXT]);
+    qemu_free_irq(irq[TP]);
+    g_free(irq);
+
     /* onboard flash memory */
     dinfo = drive_get(IF_PFLASH, 0, 0);
     pflash_cfi02_register(0x0, NULL, "r2d.flash", FLASH_SIZE,
-- 
2.0.4



