Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIJmG-0000hv-Q8
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 11:50:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJm9-0000cx-Ky
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:50:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJm4-0000fQ-JJ
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:50:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34796)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XIJlu-0000Zk-2T; Fri, 15 Aug 2014 11:50:30 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CE0E043080;
	Fri, 15 Aug 2014 19:50:28 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 880E36E1;
	Fri, 15 Aug 2014 19:15:15 +0400 (MSK)
Received: (nullmailer pid 17937 invoked by uid 1000);
	Fri, 15 Aug 2014 15:15:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 15 Aug 2014 19:15:08 +0400
Message-Id: <1408115711-17836-18-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 17/20] ppc: convert g_new(qemu_irq usages to
	g_new0
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
X-List-Received-Date: Fri, 15 Aug 2014 15:50:50 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

To indicate the IRQs are initially disconnected.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/intc/openpic.c     |    2 +-
 hw/ppc/e500.c         |    2 +-
 hw/ppc/mac_newworld.c |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
index 028529e..7d1f3b9 100644
--- a/hw/intc/openpic.c
+++ b/hw/intc/openpic.c
@@ -1627,7 +1627,7 @@ static void openpic_realize(DeviceState *dev, Error **errp)
     }
 
     for (i = 0; i < opp->nb_cpus; i++) {
-        opp->dst[i].irqs = g_new(qemu_irq, OPENPIC_OUTPUT_NB);
+        opp->dst[i].irqs = g_new0(qemu_irq, OPENPIC_OUTPUT_NB);
         for (j = 0; j < OPENPIC_OUTPUT_NB; j++) {
             sysbus_init_irq(d, &opp->dst[i].irqs[j]);
         }
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 1a5b30d..16c85ef 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -583,7 +583,7 @@ static qemu_irq *ppce500_init_mpic(PPCE500Params *params, MemoryRegion *ccsr,
     SysBusDevice *s;
     int i;
 
-    mpic = g_new(qemu_irq, 256);
+    mpic = g_new0(qemu_irq, 256);
 
     if (kvm_enabled()) {
         QemuOpts *machine_opts = qemu_get_machine_opts();
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index f5bccd2..1ec4bb4 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -346,7 +346,7 @@ static void ppc_core99_init(MachineState *machine)
         }
     }
 
-    pic = g_new(qemu_irq, 64);
+    pic = g_new0(qemu_irq, 64);
 
     dev = qdev_create(NULL, TYPE_OPENPIC);
     qdev_prop_set_uint32(dev, "model", OPENPIC_MODEL_RAVEN);
-- 
1.7.10.4


