Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZAb8L-0000OK-TK
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jul 2015 05:50:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36097)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ZAb8I-0000Lj-Qi
	for qemu-trivial@nongnu.org; Thu, 02 Jul 2015 05:50:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ZAb8E-0008Oe-9r
	for qemu-trivial@nongnu.org; Thu, 02 Jul 2015 05:50:14 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:58084)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1ZAb8D-0008Nd-N4; Thu, 02 Jul 2015 05:50:10 -0400
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CNZ28140; Thu, 02 Jul 2015 17:50:01 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml428-hub.china.huawei.com (10.82.67.183) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 2 Jul 2015 17:49:51 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 2 Jul 2015 17:49:20 +0800
Message-ID: <1435830563-3072-8-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1435830563-3072-1-git-send-email-zhaoshenglong@huawei.com>
References: <1435830563-3072-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH 07/10] hw/arm/spitz.c: Fix misusing
	qemu_allocate_irqs
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
X-List-Received-Date: Thu, 02 Jul 2015 09:50:16 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Use qemu_allocate_irq instead of qemu_allocate_irqs to fix memory leak.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/spitz.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 5bf032a..d51180a 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -815,19 +815,24 @@ static void spitz_out_switch(void *opaque, int line, int level)
 static void spitz_scoop_gpio_setup(PXA2xxState *cpu,
                 DeviceState *scp0, DeviceState *scp1)
 {
-    qemu_irq *outsignals = qemu_allocate_irqs(spitz_out_switch, cpu, 8);
-
-    qdev_connect_gpio_out(scp0, SPITZ_SCP_CHRG_ON, outsignals[0]);
-    qdev_connect_gpio_out(scp0, SPITZ_SCP_JK_B, outsignals[1]);
-    qdev_connect_gpio_out(scp0, SPITZ_SCP_LED_GREEN, outsignals[2]);
-    qdev_connect_gpio_out(scp0, SPITZ_SCP_LED_ORANGE, outsignals[3]);
+    qdev_connect_gpio_out(scp0, SPITZ_SCP_CHRG_ON,
+                          qemu_allocate_irq(spitz_out_switch, cpu, 0));
+    qdev_connect_gpio_out(scp0, SPITZ_SCP_JK_B,
+                          qemu_allocate_irq(spitz_out_switch, cpu, 1));
+    qdev_connect_gpio_out(scp0, SPITZ_SCP_LED_GREEN,
+                          qemu_allocate_irq(spitz_out_switch, cpu, 2));
+    qdev_connect_gpio_out(scp0, SPITZ_SCP_LED_ORANGE,
+                          qemu_allocate_irq(spitz_out_switch, cpu, 3));
 
     if (scp1) {
-        qdev_connect_gpio_out(scp1, SPITZ_SCP2_BACKLIGHT_CONT, outsignals[4]);
-        qdev_connect_gpio_out(scp1, SPITZ_SCP2_BACKLIGHT_ON, outsignals[5]);
+        qdev_connect_gpio_out(scp1, SPITZ_SCP2_BACKLIGHT_CONT,
+                              qemu_allocate_irq(spitz_out_switch, cpu, 4));
+        qdev_connect_gpio_out(scp1, SPITZ_SCP2_BACKLIGHT_ON,
+                              qemu_allocate_irq(spitz_out_switch, cpu, 5));
     }
 
-    qdev_connect_gpio_out(scp0, SPITZ_SCP_ADC_TEMP_ON, outsignals[6]);
+    qdev_connect_gpio_out(scp0, SPITZ_SCP_ADC_TEMP_ON,
+                          qemu_allocate_irq(spitz_out_switch, cpu, 6));
 }
 
 #define SPITZ_GPIO_HSYNC		22
-- 
2.0.4



