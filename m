Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9YJQ-0006G3-BI
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 09:41:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9YJN-00069e-On
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 09:41:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9YJL-0002LQ-OJ
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 09:41:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47679)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9YJ4-0002HV-4t; Sun, 05 Jun 2016 09:41:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A20E1408D7;
	Sun,  5 Jun 2016 16:41:30 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id E64F5AFE;
	Sun,  5 Jun 2016 10:43:37 +0300 (MSK)
Received: (nullmailer pid 1126 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:42:55 +0300
Message-Id: <2aafcc89fe9c854e00dc123ca965e1388f26ae34.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 18/52] ICH9: fix typo
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Jun 2016 13:41:54 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/isa/lpc_ich9.c      | 4 ++--
 include/hw/i386/ich9.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 4f8ca45..1d27ea3 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -97,8 +97,8 @@ static void ich9_cc_update(ICH9LPCState *lpc)
 
     /*
      * D30: DMI2PCI bridge
-     * It is arbitrarily decided how INTx lines of PCI devicesbehind the bridge
-     * are connected to pirq lines. Our choice is PIRQ[E-H].
+     * It is arbitrarily decided how INTx lines of PCI devices behind
+     * the bridge are connected to pirq lines. Our choice is PIRQ[E-H].
      * INT[A-D] are connected to PIRQ[E-H]
      */
     for (pci_intx = 0; pci_intx < PCI_NUM_PINS; pci_intx++) {
diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index d04dcdc..88233c3 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -35,7 +35,7 @@ typedef struct ICH9LPCState {
 
     /* (pci device, intx) -> pirq
      * In real chipset case, the unused slots are never used
-     * as ICH9 supports only D25-D32 irq routing.
+     * as ICH9 supports only D25-D31 irq routing.
      * On the other hand in qemu case, any slot/function can be populated
      * via command line option.
      * So fallback interrupt routing for any devices in any slots is necessary.
@@ -181,7 +181,7 @@ Object *ich9_lpc_find(void);
 #define ICH9_SATA1_DEV                          31
 #define ICH9_SATA1_FUNC                         2
 
-/* D30:F1 power management I/O registers
+/* D31:F0 power management I/O registers
    offset from the address ICH9_LPC_PMBASE */
 
 /* ICH9 LPC PM I/O registers are 128 ports and 128-aligned */
-- 
2.1.4


