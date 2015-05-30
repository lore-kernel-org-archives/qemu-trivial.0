Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YybcN-0005py-S8
	for mharc-qemu-trivial@gnu.org; Sat, 30 May 2015 03:55:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YybcJ-0005k9-Up
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 03:55:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YybcG-0008Au-Ih
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 03:55:39 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:44108)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YybcF-0008A0-U0; Sat, 30 May 2015 03:55:36 -0400
Received: from 172.24.2.119 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMD02174; Sat, 30 May 2015 15:55:16 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml431-hub.china.huawei.com (10.82.67.208) with Microsoft SMTP
	Server id 14.3.158.1; Sat, 30 May 2015 15:55:05 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 30 May 2015 15:54:37 +0800
Message-ID: <1432972477-13504-8-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432972477-13504-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432972477-13504-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, mjt@tls.msk.ru,
	shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH v2 7/7] hw/arm/tosa.c: Store irq array in
	MachineState to fix memory leak
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
X-List-Received-Date: Sat, 30 May 2015 07:55:42 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/tosa.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index 73572eb..4711514 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -85,10 +85,8 @@ static void tosa_out_switch(void *opaque, int line, int level)
 }
 
 
-static void tosa_gpio_setup(PXA2xxState *cpu,
-                DeviceState *scp0,
-                DeviceState *scp1,
-                TC6393xbState *tmio)
+static qemu_irq *tosa_gpio_setup(PXA2xxState *cpu, DeviceState *scp0,
+                                 DeviceState *scp1, TC6393xbState *tmio)
 {
     qemu_irq *outsignals = qemu_allocate_irqs(tosa_out_switch, cpu, 4);
     /* MMC/SD host */
@@ -117,6 +115,8 @@ static void tosa_gpio_setup(PXA2xxState *cpu,
 
     /* UDC Vbus */
     qemu_irq_raise(qdev_get_gpio_in(cpu->gpio, TOSA_GPIO_USB_IN));
+
+    return outsignals;
 }
 
 static uint32_t tosa_ssp_tansfer(SSISlave *dev, uint32_t value)
@@ -238,7 +238,7 @@ static void tosa_init(MachineState *machine)
     scp0 = sysbus_create_simple("scoop", 0x08800000, NULL);
     scp1 = sysbus_create_simple("scoop", 0x14800040, NULL);
 
-    tosa_gpio_setup(mpu, scp0, scp1, tmio);
+    machine->irqs = tosa_gpio_setup(mpu, scp0, scp1, tmio);
 
     tosa_microdrive_attach(mpu);
 
-- 
2.0.4



