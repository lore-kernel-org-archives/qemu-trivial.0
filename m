Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z08XJ-000794-G2
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 09:16:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08XF-0006zR-4g
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:16:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08XE-0004Sl-9d
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:16:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49982)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z08X4-0004Kp-RS; Wed, 03 Jun 2015 09:16:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 71F1640787;
	Wed,  3 Jun 2015 16:16:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id DB82DA66;
	Wed,  3 Jun 2015 16:08:54 +0300 (MSK)
Received: (nullmailer pid 27443 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:35 +0300
Message-Id: <aff0d5e57a71260885d54c07cef5f4a486c8336b.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 15/30] hw/isa/lpc_ich9.c: Fix misusing
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
X-List-Received-Date: Wed, 03 Jun 2015 13:16:46 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Since ich9_lpc_pm_init only requests one irq, so let it just call
qemu_allocate_irq.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/isa/lpc_ich9.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index dba7585..144b210 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -360,11 +360,8 @@ static void ich9_set_sci(void *opaque, int irq_num, int level)
 void ich9_lpc_pm_init(PCIDevice *lpc_pci)
 {
     ICH9LPCState *lpc = ICH9_LPC_DEVICE(lpc_pci);
-    qemu_irq *sci_irq;
-
-    sci_irq = qemu_allocate_irqs(ich9_set_sci, lpc, 1);
-    ich9_pm_init(lpc_pci, &lpc->pm, sci_irq[0]);
 
+    ich9_pm_init(lpc_pci, &lpc->pm, qemu_allocate_irq(ich9_set_sci, lpc, 0));
     ich9_lpc_reset(&lpc->d.qdev);
 }
 
-- 
2.1.4


