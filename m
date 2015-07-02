Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZAb8L-0000NY-NS
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jul 2015 05:50:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ZAb8I-0000Li-Jg
	for qemu-trivial@nongnu.org; Thu, 02 Jul 2015 05:50:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ZAb8E-0008OY-9A
	for qemu-trivial@nongnu.org; Thu, 02 Jul 2015 05:50:14 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:58085)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1ZAb8D-0008Nf-Ma; Thu, 02 Jul 2015 05:50:10 -0400
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CNZ28134; Thu, 02 Jul 2015 17:50:00 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml428-hub.china.huawei.com (10.82.67.183) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 2 Jul 2015 17:49:50 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 2 Jul 2015 17:49:19 +0800
Message-ID: <1435830563-3072-7-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH 06/10] hw/arm/palm.c: Fix misusing
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
 hw/arm/palm.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index 7f1cfb8..f73c8a2 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -158,21 +158,25 @@ static void palmte_onoff_gpios(void *opaque, int line, int level)
 
 static void palmte_gpio_setup(struct omap_mpu_state_s *cpu)
 {
-    qemu_irq *misc_gpio;
-
     omap_mmc_handlers(cpu->mmc,
                     qdev_get_gpio_in(cpu->gpio, PALMTE_MMC_WP_GPIO),
                     qemu_irq_invert(omap_mpuio_in_get(cpu->mpuio)
                             [PALMTE_MMC_SWITCH_GPIO]));
 
-    misc_gpio = qemu_allocate_irqs(palmte_onoff_gpios, cpu, 7);
-    qdev_connect_gpio_out(cpu->gpio, PALMTE_MMC_POWER_GPIO,	misc_gpio[0]);
-    qdev_connect_gpio_out(cpu->gpio, PALMTE_SPEAKER_GPIO,	misc_gpio[1]);
-    qdev_connect_gpio_out(cpu->gpio, 11,			misc_gpio[2]);
-    qdev_connect_gpio_out(cpu->gpio, 12,			misc_gpio[3]);
-    qdev_connect_gpio_out(cpu->gpio, 13,			misc_gpio[4]);
-    omap_mpuio_out_set(cpu->mpuio, 1,				misc_gpio[5]);
-    omap_mpuio_out_set(cpu->mpuio, 3,				misc_gpio[6]);
+    qdev_connect_gpio_out(cpu->gpio, PALMTE_MMC_POWER_GPIO,
+                          qemu_allocate_irq(palmte_onoff_gpios, cpu, 0));
+    qdev_connect_gpio_out(cpu->gpio, PALMTE_SPEAKER_GPIO,
+                          qemu_allocate_irq(palmte_onoff_gpios, cpu, 1));
+    qdev_connect_gpio_out(cpu->gpio, 11,
+                          qemu_allocate_irq(palmte_onoff_gpios, cpu, 2));
+    qdev_connect_gpio_out(cpu->gpio, 12,
+                          qemu_allocate_irq(palmte_onoff_gpios, cpu, 3));
+    qdev_connect_gpio_out(cpu->gpio, 13,
+                          qemu_allocate_irq(palmte_onoff_gpios, cpu, 4));
+    omap_mpuio_out_set(cpu->mpuio, 1,
+                       qemu_allocate_irq(palmte_onoff_gpios, cpu, 5));
+    omap_mpuio_out_set(cpu->mpuio, 3,
+                       qemu_allocate_irq(palmte_onoff_gpios, cpu, 6));
 
     /* Reset some inputs to initial state.  */
     qemu_irq_lower(qdev_get_gpio_in(cpu->gpio, PALMTE_USBDETECT_GPIO));
-- 
2.0.4



