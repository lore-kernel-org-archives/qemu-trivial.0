Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z090E-0005BN-C9
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 09:46:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z090B-000583-RR
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:46:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z090A-0000t1-SJ
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:46:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41669)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z0906-0000pj-BD; Wed, 03 Jun 2015 09:46:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 54AF0407B6;
	Wed,  3 Jun 2015 16:46:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 68602A61;
	Wed,  3 Jun 2015 16:08:54 +0300 (MSK)
Received: (nullmailer pid 27449 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:38 +0300
Message-Id: <ca43b97b5f6fa57e79adc7f167b12d3e0545c7e1.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 18/30] hw/sparc/sun4m.c: Fix misusing
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
X-List-Received-Date: Wed, 03 Jun 2015 13:46:40 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/sparc/sun4m.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index a69bf2d..8a3599c 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -897,7 +897,6 @@ static void sun4m_hw_init(const struct sun4m_hwdef *hwdef,
         espdma_irq, ledma_irq;
     qemu_irq esp_reset, dma_enable;
     qemu_irq fdc_tc;
-    qemu_irq *cpu_halt;
     unsigned long kernel_size;
     DriveInfo *fd[MAX_FD];
     FWCfgState *fw_cfg;
@@ -1024,9 +1023,8 @@ static void sun4m_hw_init(const struct sun4m_hwdef *hwdef,
     escc_init(hwdef->serial_base, slavio_irq[15], slavio_irq[15],
               serial_hds[0], serial_hds[1], ESCC_CLOCK, 1);
 
-    cpu_halt = qemu_allocate_irqs(cpu_halt_signal, NULL, 1);
     if (hwdef->apc_base) {
-        apc_init(hwdef->apc_base, cpu_halt[0]);
+        apc_init(hwdef->apc_base, qemu_allocate_irq(cpu_halt_signal, NULL, 0));
     }
 
     if (hwdef->fd_base) {
@@ -1036,7 +1034,7 @@ static void sun4m_hw_init(const struct sun4m_hwdef *hwdef,
         sun4m_fdctrl_init(slavio_irq[22], hwdef->fd_base, fd,
                           &fdc_tc);
     } else {
-        fdc_tc = *qemu_allocate_irqs(dummy_fdc_tc, NULL, 1);
+        fdc_tc = qemu_allocate_irq(dummy_fdc_tc, NULL, 0);
     }
 
     slavio_misc_init(hwdef->slavio_base, hwdef->aux1_base, hwdef->aux2_base,
-- 
2.1.4


