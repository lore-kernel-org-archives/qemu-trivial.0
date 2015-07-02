Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZAb8M-0000PP-9m
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jul 2015 05:50:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ZAb8J-0000Ll-9X
	for qemu-trivial@nongnu.org; Thu, 02 Jul 2015 05:50:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ZAb8E-0008Ox-PX
	for qemu-trivial@nongnu.org; Thu, 02 Jul 2015 05:50:15 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:58098)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1ZAb8E-0008Nq-6G; Thu, 02 Jul 2015 05:50:10 -0400
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CNZ28159; Thu, 02 Jul 2015 17:50:04 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml428-hub.china.huawei.com (10.82.67.183) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 2 Jul 2015 17:49:52 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 2 Jul 2015 17:49:21 +0800
Message-ID: <1435830563-3072-9-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH 08/10] hw/arm/tosa.c: Fix misusing
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
 hw/arm/tosa.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index 73572eb..6bfbc2b 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -90,7 +90,6 @@ static void tosa_gpio_setup(PXA2xxState *cpu,
                 DeviceState *scp1,
                 TC6393xbState *tmio)
 {
-    qemu_irq *outsignals = qemu_allocate_irqs(tosa_out_switch, cpu, 4);
     /* MMC/SD host */
     pxa2xx_mmci_handlers(cpu->mmc,
                     qdev_get_gpio_in(scp0, TOSA_GPIO_SD_WP),
@@ -108,10 +107,14 @@ static void tosa_gpio_setup(PXA2xxState *cpu,
                         qdev_get_gpio_in(cpu->gpio, TOSA_GPIO_JC_CF_IRQ),
                         NULL);
 
-    qdev_connect_gpio_out(scp1, TOSA_GPIO_BT_LED, outsignals[0]);
-    qdev_connect_gpio_out(scp1, TOSA_GPIO_NOTE_LED, outsignals[1]);
-    qdev_connect_gpio_out(scp1, TOSA_GPIO_CHRG_ERR_LED, outsignals[2]);
-    qdev_connect_gpio_out(scp1, TOSA_GPIO_WLAN_LED, outsignals[3]);
+    qdev_connect_gpio_out(scp1, TOSA_GPIO_BT_LED,
+                          qemu_allocate_irq(tosa_out_switch, cpu, 0));
+    qdev_connect_gpio_out(scp1, TOSA_GPIO_NOTE_LED,
+                          qemu_allocate_irq(tosa_out_switch, cpu, 1));
+    qdev_connect_gpio_out(scp1, TOSA_GPIO_CHRG_ERR_LED,
+                          qemu_allocate_irq(tosa_out_switch, cpu, 2));
+    qdev_connect_gpio_out(scp1, TOSA_GPIO_WLAN_LED,
+                          qemu_allocate_irq(tosa_out_switch, cpu, 3));
 
     qdev_connect_gpio_out(scp1, TOSA_GPIO_TC6393XB_L3V_ON, tc6393xb_l3v_get(tmio));
 
-- 
2.0.4



