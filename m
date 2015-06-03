Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z090L-0005SK-OI
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 09:46:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z090J-0005MC-7S
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:46:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z090F-0000ve-Te
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:46:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52153)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z0906-0000pe-Ao; Wed, 03 Jun 2015 09:46:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 477B9407B4;
	Wed,  3 Jun 2015 16:46:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 94DABA59;
	Wed,  3 Jun 2015 16:08:53 +0300 (MSK)
Received: (nullmailer pid 27439 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:33 +0300
Message-Id: <9ff7f5bddbe5814bafe5e798d2cf1087b58dc7b6.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 13/30] hw/intc/exynos4210_gic.c: Fix memory
	leak by adjusting order
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
X-List-Received-Date: Wed, 03 Jun 2015 13:46:48 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/intc/exynos4210_gic.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index 0590d5d..b2a4950 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -213,9 +213,6 @@ void exynos4210_init_board_irqs(Exynos4210Irq *s)
     uint32_t grp, bit, irq_id, n;
 
     for (n = 0; n < EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ; n++) {
-        s->board_irqs[n] = qemu_irq_split(s->int_combiner_irq[n],
-                s->ext_combiner_irq[n]);
-
         irq_id = 0;
         if (n == EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 4) ||
                 n == EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 4)) {
@@ -230,8 +227,10 @@ void exynos4210_init_board_irqs(Exynos4210Irq *s)
         if (irq_id) {
             s->board_irqs[n] = qemu_irq_split(s->int_combiner_irq[n],
                     s->ext_gic_irq[irq_id-32]);
+        } else {
+            s->board_irqs[n] = qemu_irq_split(s->int_combiner_irq[n],
+                    s->ext_combiner_irq[n]);
         }
-
     }
     for (; n < EXYNOS4210_MAX_INT_COMBINER_IN_IRQ; n++) {
         /* these IDs are passed to Internal Combiner and External GIC */
-- 
2.1.4


