Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z08XP-0007M0-Mm
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 09:16:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08XH-000745-Bj
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:16:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08XB-0004QJ-BS
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:16:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43314)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z08X4-0004Kq-RW; Wed, 03 Jun 2015 09:16:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7C7DA407A3;
	Wed,  3 Jun 2015 16:16:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id AFB70A64;
	Wed,  3 Jun 2015 16:08:54 +0300 (MSK)
Received: (nullmailer pid 27447 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:37 +0300
Message-Id: <b64127244d669c33a4ffdcc47e076559497785af.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 17/30] hw/timer/arm_timer.c: Fix misusing
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
X-List-Received-Date: Wed, 03 Jun 2015 13:16:53 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/timer/arm_timer.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 1452910..d53f39a 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -280,14 +280,12 @@ static int sp804_init(SysBusDevice *sbd)
 {
     DeviceState *dev = DEVICE(sbd);
     SP804State *s = SP804(dev);
-    qemu_irq *qi;
 
-    qi = qemu_allocate_irqs(sp804_set_irq, s, 2);
     sysbus_init_irq(sbd, &s->irq);
     s->timer[0] = arm_timer_init(s->freq0);
     s->timer[1] = arm_timer_init(s->freq1);
-    s->timer[0]->irq = qi[0];
-    s->timer[1]->irq = qi[1];
+    s->timer[0]->irq = qemu_allocate_irq(sp804_set_irq, s, 0);
+    s->timer[1]->irq = qemu_allocate_irq(sp804_set_irq, s, 1);
     memory_region_init_io(&s->iomem, OBJECT(s), &sp804_ops, s,
                           "sp804", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
-- 
2.1.4


