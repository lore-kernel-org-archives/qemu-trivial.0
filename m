Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxwfe-0004to-Sp
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:12:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59108)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxwfY-0004gW-6V
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:12:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxwfU-0004Pk-FK
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:12:16 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:42476)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YxwfM-0004KL-CL; Thu, 28 May 2015 08:12:04 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMA92613; Thu, 28 May 2015 20:11:53 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:10:21 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:08:49 +0800
Message-ID: <1432814932-12608-27-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH 26/29] hw/arm/spitz.c: Fix memory leak
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
X-List-Received-Date: Thu, 28 May 2015 12:12:20 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==19832== 244 (64 direct, 180 indirect) bytes in 1 blocks are definitely lost in loss record 2,220 of 2,846
==19832==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==19832==    by 0x35479F: malloc_and_trace (vl.c:2556)
==19832==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==19832==    by 0x3ED99B: qemu_extend_irqs (irq.c:55)
==19832==    by 0x3EDA27: qemu_allocate_irqs (irq.c:64)
==19832==    by 0x2875CF: spitz_scoop_gpio_setup (spitz.c:818)
==19832==    by 0x2879FE: spitz_common_init (spitz.c:931)
==19832==    by 0x287AEF: spitz_init (spitz.c:957)
==19832==    by 0x358B6A: main (vl.c:4249)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/spitz.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 5bf032a..6ff1825 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -815,7 +815,7 @@ static void spitz_out_switch(void *opaque, int line, int level)
 static void spitz_scoop_gpio_setup(PXA2xxState *cpu,
                 DeviceState *scp0, DeviceState *scp1)
 {
-    qemu_irq *outsignals = qemu_allocate_irqs(spitz_out_switch, cpu, 8);
+    qemu_irq *outsignals = qemu_allocate_irqs(spitz_out_switch, cpu, 7);
 
     qdev_connect_gpio_out(scp0, SPITZ_SCP_CHRG_ON, outsignals[0]);
     qdev_connect_gpio_out(scp0, SPITZ_SCP_JK_B, outsignals[1]);
@@ -825,9 +825,13 @@ static void spitz_scoop_gpio_setup(PXA2xxState *cpu,
     if (scp1) {
         qdev_connect_gpio_out(scp1, SPITZ_SCP2_BACKLIGHT_CONT, outsignals[4]);
         qdev_connect_gpio_out(scp1, SPITZ_SCP2_BACKLIGHT_ON, outsignals[5]);
+    } else {
+        qemu_free_irq(outsignals[4]);
+        qemu_free_irq(outsignals[5]);
     }
 
     qdev_connect_gpio_out(scp0, SPITZ_SCP_ADC_TEMP_ON, outsignals[6]);
+    g_free(outsignals);
 }
 
 #define SPITZ_GPIO_HSYNC		22
-- 
2.0.4



