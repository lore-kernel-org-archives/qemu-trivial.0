Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z090H-0005HK-3J
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 09:46:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z090D-00059U-D7
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:46:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z090C-0000tv-IC
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:46:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54666)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z0906-0000ph-At; Wed, 03 Jun 2015 09:46:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 26BD4407B2;
	Wed,  3 Jun 2015 16:46:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 7DEA5A62;
	Wed,  3 Jun 2015 16:08:54 +0300 (MSK)
Received: (nullmailer pid 27453 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:40 +0300
Message-Id: <d4ef00af2598fef06affbd42608e570237a7b276.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 20/30] hw/lm32/lm32_boards.c: Fix misusing
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
X-List-Received-Date: Wed, 03 Jun 2015 13:46:42 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/lm32/lm32_boards.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/lm32/lm32_boards.c b/hw/lm32/lm32_boards.c
index 14d0efc..70f48d3 100644
--- a/hw/lm32/lm32_boards.c
+++ b/hw/lm32/lm32_boards.c
@@ -78,7 +78,7 @@ static void lm32_evr_init(MachineState *machine)
     DriveInfo *dinfo;
     MemoryRegion *address_space_mem =  get_system_memory();
     MemoryRegion *phys_ram = g_new(MemoryRegion, 1);
-    qemu_irq *cpu_irq, irq[32];
+    qemu_irq irq[32];
     ResetInfo *reset_info;
     int i;
 
@@ -123,8 +123,7 @@ static void lm32_evr_init(MachineState *machine)
                           1, 2, 0x01, 0x7e, 0x43, 0x00, 0x555, 0x2aa, 1);
 
     /* create irq lines */
-    cpu_irq = qemu_allocate_irqs(cpu_irq_handler, cpu, 1);
-    env->pic_state = lm32_pic_init(*cpu_irq);
+    env->pic_state = lm32_pic_init(qemu_allocate_irq(cpu_irq_handler, cpu, 0));
     for (i = 0; i < 32; i++) {
         irq[i] = qdev_get_gpio_in(env->pic_state, i);
     }
@@ -173,7 +172,7 @@ static void lm32_uclinux_init(MachineState *machine)
     DriveInfo *dinfo;
     MemoryRegion *address_space_mem =  get_system_memory();
     MemoryRegion *phys_ram = g_new(MemoryRegion, 1);
-    qemu_irq *cpu_irq, irq[32];
+    qemu_irq irq[32];
     HWSetup *hw;
     ResetInfo *reset_info;
     int i;
@@ -225,8 +224,7 @@ static void lm32_uclinux_init(MachineState *machine)
                           1, 2, 0x01, 0x7e, 0x43, 0x00, 0x555, 0x2aa, 1);
 
     /* create irq lines */
-    cpu_irq = qemu_allocate_irqs(cpu_irq_handler, env, 1);
-    env->pic_state = lm32_pic_init(*cpu_irq);
+    env->pic_state = lm32_pic_init(qemu_allocate_irq(cpu_irq_handler, env, 0));
     for (i = 0; i < 32; i++) {
         irq[i] = qdev_get_gpio_in(env->pic_state, i);
     }
-- 
2.1.4


