Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z0Aik-0000RF-Jt
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 11:36:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z0Aig-0000JM-A5
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 11:36:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z0Aif-0004nT-GH
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 11:36:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36812)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z0Aia-0004hG-T4; Wed, 03 Jun 2015 11:36:37 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 04374407DB;
	Wed,  3 Jun 2015 18:36:34 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id EEE58A67;
	Wed,  3 Jun 2015 16:08:54 +0300 (MSK)
Received: (nullmailer pid 27455 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:41 +0300
Message-Id: <a9c8a0d8d4217754648decc5921e4b0fcd00ce7f.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 21/30] hw/lm32/milkymist.c: Fix misusing
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
X-List-Received-Date: Wed, 03 Jun 2015 15:36:43 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/lm32/milkymist.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
index e0cec7d..e755f5b 100644
--- a/hw/lm32/milkymist.c
+++ b/hw/lm32/milkymist.c
@@ -86,7 +86,7 @@ milkymist_init(MachineState *machine)
     DriveInfo *dinfo;
     MemoryRegion *address_space_mem = get_system_memory();
     MemoryRegion *phys_sdram = g_new(MemoryRegion, 1);
-    qemu_irq irq[32], *cpu_irq;
+    qemu_irq irq[32];
     int i;
     char *bios_filename;
     ResetInfo *reset_info;
@@ -130,8 +130,7 @@ milkymist_init(MachineState *machine)
                           2, 0x00, 0x89, 0x00, 0x1d, 1);
 
     /* create irq lines */
-    cpu_irq = qemu_allocate_irqs(cpu_irq_handler, cpu, 1);
-    env->pic_state = lm32_pic_init(*cpu_irq);
+    env->pic_state = lm32_pic_init(qemu_allocate_irq(cpu_irq_handler, cpu, 0));
     for (i = 0; i < 32; i++) {
         irq[i] = qdev_get_gpio_in(env->pic_state, i);
     }
-- 
2.1.4


