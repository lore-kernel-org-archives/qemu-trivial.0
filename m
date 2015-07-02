Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZAb8b-0000uP-OV
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jul 2015 05:50:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ZAb8Y-0000no-EZ
	for qemu-trivial@nongnu.org; Thu, 02 Jul 2015 05:50:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ZAb8X-00006b-6Y
	for qemu-trivial@nongnu.org; Thu, 02 Jul 2015 05:50:30 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:57752)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1ZAb8W-0007vy-Ke; Thu, 02 Jul 2015 05:50:29 -0400
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CNZ28102; Thu, 02 Jul 2015 17:49:53 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml428-hub.china.huawei.com (10.82.67.183) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 2 Jul 2015 17:49:46 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 2 Jul 2015 17:49:15 +0800
Message-ID: <1435830563-3072-3-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH 02/10] include/hw/sparc/grlib.h: Store irqs
	in DeviceState
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
X-List-Received-Date: Thu, 02 Jul 2015 09:50:32 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Use qdev_init_gpio_in to allocate irqs instead of qemu_allocate_irqs.
This will store the irqs in DeviceState and use qdev_get_gpio_in to get
the irq.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/sparc/leon3.c         | 10 ++++++----
 include/hw/sparc/grlib.h | 12 ++++--------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index 7f5dcd6..60a574a 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -113,7 +113,7 @@ static void leon3_generic_hw_init(MachineState *machine)
     MemoryRegion *prom = g_new(MemoryRegion, 1);
     int         ret;
     char       *filename;
-    qemu_irq   *cpu_irqs = NULL;
+    DeviceState *grlib_irqmp;
     int         bios_size;
     int         prom_size;
     ResetData  *reset_info;
@@ -139,7 +139,8 @@ static void leon3_generic_hw_init(MachineState *machine)
     qemu_register_reset(main_cpu_reset, reset_info);
 
     /* Allocate IRQ manager */
-    grlib_irqmp_create(0x80000200, env, &cpu_irqs, MAX_PILS, &leon3_set_pil_in);
+    grlib_irqmp = grlib_irqmp_create(0x80000200, env, MAX_PILS,
+                                     &leon3_set_pil_in);
 
     env->qemu_irq_ack = leon3_irq_manager;
 
@@ -208,11 +209,12 @@ static void leon3_generic_hw_init(MachineState *machine)
     }
 
     /* Allocate timers */
-    grlib_gptimer_create(0x80000300, 2, CPU_CLK, cpu_irqs, 6);
+    grlib_gptimer_create(0x80000300, 2, CPU_CLK, grlib_irqmp, 6);
 
     /* Allocate uart */
     if (serial_hds[0]) {
-        grlib_apbuart_create(0x80000100, serial_hds[0], cpu_irqs[3]);
+        grlib_apbuart_create(0x80000100, serial_hds[0],
+                             qdev_get_gpio_in(grlib_irqmp, 3));
     }
 }
 
diff --git a/include/hw/sparc/grlib.h b/include/hw/sparc/grlib.h
index 9a0db7b..05c2ea8 100644
--- a/include/hw/sparc/grlib.h
+++ b/include/hw/sparc/grlib.h
@@ -43,14 +43,11 @@ void grlib_irqmp_ack(DeviceState *dev, int intno);
 static inline
 DeviceState *grlib_irqmp_create(hwaddr   base,
                                 CPUSPARCState            *env,
-                                qemu_irq           **cpu_irqs,
                                 uint32_t             nr_irqs,
                                 set_pil_in_fn        set_pil_in)
 {
     DeviceState *dev;
 
-    assert(cpu_irqs != NULL);
-
     dev = qdev_create(NULL, "grlib,irqmp");
     qdev_prop_set_ptr(dev, "set_pil_in", set_pil_in);
     qdev_prop_set_ptr(dev, "set_pil_in_opaque", env);
@@ -61,9 +58,7 @@ DeviceState *grlib_irqmp_create(hwaddr   base,
 
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
 
-    *cpu_irqs = qemu_allocate_irqs(grlib_irqmp_set_irq,
-                                   dev,
-                                   nr_irqs);
+    qdev_init_gpio_in(dev, grlib_irqmp_set_irq, nr_irqs);
 
     return dev;
 }
@@ -74,7 +69,7 @@ static inline
 DeviceState *grlib_gptimer_create(hwaddr  base,
                                   uint32_t            nr_timers,
                                   uint32_t            freq,
-                                  qemu_irq           *cpu_irqs,
+                                  DeviceState        *grlib_irqmp,
                                   int                 base_irq)
 {
     DeviceState *dev;
@@ -90,7 +85,8 @@ DeviceState *grlib_gptimer_create(hwaddr  base,
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
 
     for (i = 0; i < nr_timers; i++) {
-        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, cpu_irqs[base_irq + i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
+                           qdev_get_gpio_in(grlib_irqmp, base_irq + i));
     }
 
     return dev;
-- 
2.0.4



