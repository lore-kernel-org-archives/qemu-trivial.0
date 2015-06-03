Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z08gz-0008HD-Il
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 09:26:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08gs-00083F-8T
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:26:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08gr-0005x5-Ai
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:26:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57293)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z08gk-0005rT-Ub; Wed, 03 Jun 2015 09:26:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E0896407A9;
	Wed,  3 Jun 2015 16:26:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 0F7A5A69;
	Wed,  3 Jun 2015 16:08:55 +0300 (MSK)
Received: (nullmailer pid 27457 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:42 +0300
Message-Id: <2c85fad022a5c23b835d7c78b653763ae1e3f6eb.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 22/30] hw/unicore32/puv3.c: Fix misusing
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
X-List-Received-Date: Wed, 03 Jun 2015 13:26:48 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/unicore32/puv3.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/unicore32/puv3.c b/hw/unicore32/puv3.c
index cc9a21a..703e29d 100644
--- a/hw/unicore32/puv3.c
+++ b/hw/unicore32/puv3.c
@@ -40,15 +40,15 @@ static void puv3_intc_cpu_handler(void *opaque, int irq, int level)
 
 static void puv3_soc_init(CPUUniCore32State *env)
 {
-    qemu_irq *cpu_intc, irqs[PUV3_IRQS_NR];
+    qemu_irq cpu_intc, irqs[PUV3_IRQS_NR];
     DeviceState *dev;
     MemoryRegion *i8042 = g_new(MemoryRegion, 1);
     int i;
 
     /* Initialize interrupt controller */
-    cpu_intc = qemu_allocate_irqs(puv3_intc_cpu_handler,
-                                  uc32_env_get_cpu(env), 1);
-    dev = sysbus_create_simple("puv3_intc", PUV3_INTC_BASE, *cpu_intc);
+    cpu_intc = qemu_allocate_irq(puv3_intc_cpu_handler,
+                                 uc32_env_get_cpu(env), 0);
+    dev = sysbus_create_simple("puv3_intc", PUV3_INTC_BASE, cpu_intc);
     for (i = 0; i < PUV3_IRQS_NR; i++) {
         irqs[i] = qdev_get_gpio_in(dev, i);
     }
-- 
2.1.4


